<?php

class Auth extends Controller {
	function Auth() {
		parent::Controller();
		$this->load->library('openid');
	}
	function index() {
		$this->login();
	}
	function login() {
		if (!$this->input->post('openid-identifier')) {
			header('Location: ' . base_url());
			exit();
		}
		$this->config->load('openid');

		$this->openid->set_request_to(site_url($this->config->item('openid_request_to')));
		$this->openid->set_trust_root(base_url());
		$this->openid->set_args(null);
		$this->openid->set_sreg(
			true,
			$this->config->item('openid_required'),
			$this->config->item('openid_optional'),
			site_url($this->config->item('openid_policy'))
		);
		//$this->openid->set_pape(true, $pape_policy_uris);
		$this->openid->authenticate($this->input->post('openid-identifier'));
	}
	function check() {
		$this->config->load('openid');
		$this->load->helper('gfx');
		$this->openid->set_request_to(site_url($this->config->item('openid_request_to')));
		$response = $this->openid->getResponse();
		switch ($response->status) {
			case Auth_OpenID_CANCEL:
				flashdata_message('auth_login_canceled', 'highlight', 'info:');
				header('Location: ' . base_url());
				break;
			case Auth_OpenID_FAILURE:
				flashdata_message('auth_login_failed');
				header('Location: ' . base_url());
				break;
			case Auth_OpenID_SUCCESS:
				$open_id = $response->getDisplayIdentifier();

				$this->load->database();
				$user = $this->db->get_where('users', array('login' => $open_id));
				if ($user->num_rows() !== 0) {
					/* User exists */
					$data = $user->row_array();
				} else {
					/* Create new user */
					$sreg_resp = Auth_OpenID_SRegResponse::fromSuccessResponse($response);
					$sreg = $sreg_resp->contents();
					$data = array(
						'login' => $open_id,
						'name' => '__temp__' . md5($open_id . time()), /* require unique */
						'title' => '',
						'admin' => 'N',
						'avatar' => '',
						'email' => '',
						'bio' => '',
						'web' => '', //$open_id, //I was told that Google/Yahoo generated open id is annoy to be put here.
						'blog' => '', //$open_id,
						'blog_rss' => '',
						'forum_username' => '',
						'count' => 1,
						'visited' => 0
					);
					if (isset($sreg['fullname'])) {
						$data['title'] = $sreg['fullname'];
					} elseif (isset($sreg['nickname'])) {
						$data['title'] = $sreg['nickname'];
					}
					if (isset($sreg['email'])) {
						$data['avatar'] = '(gravatar)';
						$data['email'] = $sreg['email'];
					}
					$this->db->insert('users', $data);
					$data['id'] = $this->db->insert_id();
					$this->db->insert('u2f', array('user_id' => $data['id'], 'feature_id' => '1', 'order' => '1'));
					$this->db->insert('u2f', array('user_id' => $data['id'], 'feature_id' => '2', 'order' => '2'));
					$this->db->insert('u2f', array('user_id' => $data['id'], 'feature_id' => '3', 'order' => '3'));
					$this->db->insert('u2g', array('user_id' => $data['id'], 'group_id' => '1', 'order' => '1'));
					$this->db->insert('u2g', array('user_id' => $data['id'], 'group_id' => '2', 'order' => '2'));
				}
				session_data_set(
					array(
						'id' => $data['id'],
						'name' => $data['name'],
						'admin' => $data['admin'],
						'hide_announcement' => ''
					)
				);
				header('Location: ' . site_url('editor'));
		}
		if (isset($_COOKIE[session_name()])) {
			setcookie(session_name(), '', 0, '/');
		}
		session_destroy();
	}
	function xrds() {
		header('Content-Type: application/xrds+xml');
		print '<?xml version="1.0" encoding="UTF-8"?>';
?>

<xrds:XRDS xmlns:xrds="xri://$xrds" xmlns:openid="http://openid.net/xmlns/1.0" xmlns="xri://$xrd*($v*2.0)">
	<XRD>
	<Service xmlns="xri://$xrd*($v*2.0)">
		<Type>http://specs.openid.net/auth/2.0/return_to</Type>
		<URI><?php print site_url('auth/check');?></URI>
	</Service>
	</XRD>
</xrds:XRDS>
<?php
	}
	function logout() {
		$this->load->config('gfx');
		$this->load->helper('gfx');
		if (!checkAuth(true, false, 'flashdata')) {
			header('Location: ' . base_url());
			exit();
		}
		session_data_unset();
		header('Location: ' . base_url());
	}
	function skip_announcement() {
		$this->load->helper('gfx');
		session_data_set(array('hide_announcement' => 'Y'), false);
		json_message('ok', 'highlight', 'info');
	}
	function switchto() {
		$this->load->config('gfx');
		$this->load->helper('gfx');
		if (!checkAuth(true, true, 'flashdata')) {
			header('Location: ' . base_url());
			exit();
		}
		$user = $this->db->get_where('users', array('id' => $this->input->post('id')));
		if ($user->num_rows() === 0) {
			flashdata_message('no_such_user');
			header('Location: ' . base_url());
			exit();
		}
		session_data_set(
			array(
				'id' => $user->row()->id,
				'name' => $user->row()->name,
				'admin' => $user->row()->admin
			)
		);
		header('Location: ' . site_url('editor'));
	}
	function challange() {
		/*
			A really weak captcha challange that doesn't involve reCaptcha or GD (to save memory)
			Do not apply to anything that we really need to protect against robots.
		*/
		$this->load->config('gfx');
		$b = rand(2, 99);
		$a = rand($b, 99);
		$OP = array('+', '-', 'x');
		$op = rand(0, 2);
		$t = time();
		switch ($op) {
			case 0:
				$challange = md5(($a+$b) . ':' . $t . ':' . $this->config->item('gfx_token'));
				break;
			case 1:
				$challange = md5(($a-$b) . ':' . $t . ':' . $this->config->item('gfx_token'));
				break;
			case 2:
				$challange = md5(($a*$b) . ':' . $t . ':' . $this->config->item('gfx_token'));
		}
		header('Content-Type: text/javascript');
		print json_encode(
			array(
				'challange' => $t . ':' . $challange,
				'question' => $a . ' ' . $OP[$op] . ' ' . $b . ' ='
			)
		);
	}
	function forgetopenid() {
		$this->load->helper('gfx');		
		if (checkChallange('flashdata')) {
			flashdata_message('TBD', 'highlight', 'info');
		}
		header('Location: ' . site_url('about'));
	}
}

/* End of file auth.php */
/* Location: ./system/applications/controller/auth.php */ 
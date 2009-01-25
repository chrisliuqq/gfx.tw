<?php

class Addon extends Controller {
	function Addon() {
		parent::Controller();
		$this->load->scaffolding('addons');
		$this->load->database();
	}
	function index() {
		show_404();
	}
	function query() {
		if (!$this->session->userdata('id')) {
			$this->json_error('Not Logged In.', 'EDITOR_NOT_LOGGED_IN');
		}
		//The user specific want to find the addon through fetch
		if (is_numeric($this->input->post('q')) && $this->input->post('q') !== '0') {
			$this->fetch($this->input->post('q'));
			return;
		}
		$A = array();
		foreach ($addons->result_array() as $addon) {
			if ($addon['amo_id']) $addon['url'] = 'https://addons.mozilla.org/zh-TW/firefox/addon/' . $addon['amo_id'];
			unset($addon['amo_id']);
			$A[] = $addon;
		}
		//Pick one of the addons found and send to to re-fetch if it's too old
		$r = array_rand($A);
		if ($A[$r]['amo_id'] || strtotime($A[$r]['fetched']) < time()-7*24*60*60) {
			$data = $this->get_amo_content($A[$r]['amo_id']);
			if ($data) {
				$A[$r] = array_merge(
					array(
						'id' => $A[$r]['id']
					),
					$data
				);
			}
		}
		print json_encode(array('addons' => $A));
	}
	function suggest() {
		if (!$this->session->userdata('id')) {
			$this->json_error('Not Logged In.', 'EDITOR_NOT_LOGGED_IN');
		}
		if (!is_numeric($this->input->post('g'))) {
			$this->json_error('Not number');
			return;
		}
		$addons = $this->db->query('SELECT t1.*, t2.addon_id, COUNT(t2.id) FROM addons t1, u2a t2 '
			. 'WHERE t2.group_id =  ' . $this->db->escape($this->input->post('g')) . ' AND t1.id = t2.addon_id '
			. 'GROUP BY t2.addon_id ORDER BY COUNT(t2.id) DESC, t1.title ASC;');
		$A = array();
		foreach ($addons->result_array() as $addon) {
			if ($addon['amo_id']) $addon['url'] = 'https://addons.mozilla.org/zh-TW/firefox/addon/' . $addon['amo_id'];
			unset($addon['amo_id']);
			$A[] = $addon;
		}
		//Pick one of the addons found and send to to re-fetch if it's too old
		$r = array_rand($A);
		if ($A[$r]['amo_id'] || strtotime($A[$r]['fetched']) < time()-7*24*60*60) {
			$data = $this->get_amo_content($A[$r]['amo_id']);
			if ($data) {
				$A[$r] = array_merge(
					array(
						'id' => $A[$r]['id']
					),
					$data
				);
			}
		}
		print json_encode(array('addons' => $A));
	}
	function fetch($amo_id) {
		if (!is_numeric($amo_id) || $amo_id === '0') {
			$this->json_error('Not Number.');
		}
		$addons = $this->db->get_where('addons', array('amo_id' => $amo_id), 1);
		if (!$addons->num_rows()) {
			$data = $this->get_amo_content($amo_id);
			if (!$data) $this->json_error('Fetch failed', 'ADDON_CANNOT_FETCH');
			$this->db->insert(
				'addons',
				$data
			);
			$A = array_merge(
				array(
					'id' => $this->db->insert_id()
				),
				$data
			);
		} elseif (strtotime($addons->row()->fetched) < time()-7*24*60*60) {
			//re-fetch data from amo every week if someone query this addon
			$data = $this->get_amo_content($amo_id);
			$A = $addons->row_array();
			if ($data) {
				$A = array_merge(
					array(
						'id' => $A['id']
					),
					$data
				);
				$this->db->update('addons', $data, array('id' => $A['id']));
			}// else { /* Fail? */ }
		} else {
			$A = $addons->row_array();
		}
		$A['url'] = 'https://addons.mozilla.org/zh-TW/firefox/addon/' . $A['amo_id'];
		unset($A['amo_id']);
		header('Content-Type: text/javascript');
		print json_encode(array('addons' => array($A)));
	}
	function get_amo_content($amo_id) {
		//TBD: connection timeout
		$html = file_get_contents('https://addons.mozilla.org/zh-TW/firefox/addon/' . $amo_id);
		if (!preg_match('/<h3 class=\"name\"[^>]*><img src=\"([\w\.\/\-]+)\" class=\"addon-icon\" alt=\"\" \/>([^<]+) [\d\.]+<\/h3>/', $html, $M)) {
			return false;
		}
		preg_match('/<p class=\"desc\"[^>]*>([^<]+)(<\/p>|<br \/>)/', $html, $D);
		preg_match('/<a href=\"([\w\.\/\-]+\.xpi)\" id=\"installTrigger/', $html, $X);
		return array(
			'title' => html_entity_decode($M[2], ENT_QUOTES, 'UTF-8'),
			'amo_id' => $amo_id,
			'icon_url' => ($M[1] === '/img/default_icon.png')?'':'https://addons.mozilla.org' . $M[1],
			'xpi_url' =>  (isset($X[1]))?'https://addons.mozilla.org' . $X[1]:'',
			'description' => (isset($D[1]))?html_entity_decode($D[1], ENT_QUOTES, 'UTF-8'):'',
			'fetched' => date('Y-m-d H:m:s')
		);
	}
	function json_error($msg, $tag = false) {
		header('Content-Type: text/javascript');
		if ($tag) print json_encode(array('error' => $msg, 'tag' => $tag));
		else print json_encode(array('error' => $msg));
		exit();
	}
}

/* End of file addon.php */
/* Location: ./system/applications/controller/addon.php */
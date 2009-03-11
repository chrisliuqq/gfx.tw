/*global window, document, $, T, gfx */

gfx.admin = {
	'bind' : {
		'click' : {
			'#link_manage a' : function () {
				gfx.openDialog('admin');
				return false;
			}
		}
	},
	'dialog' : {
		'admin' : {
			'width' : 600,
			'height' : 400,
			'buttons' : {},
			'position' : ['center', 120]
		}
	},
	'onload' : function () {
		this.dialog.admin.buttons[T.BUTTONS.ADMIN_OK] = function () {
			gfx.xhr = $.ajax(
				{
					url: './user/update',
					data: {
						'token' : $('#token').val(),
						'id' : $('#admin_id').val(),
						'login' : $('#admin_login').val(),
						'count' : $('#admin_count').val(),
						'avatar' : $('#admin_avatar').val(),
						'admin' : ($('#admin_admin:checked').length)?'Y':'N'
					},
					success: function (result, status) {
						if (result.error) {
							window.alert(T[result.tag] || result.error);
							return;
						}
						if (result.message) {
							if (result.message.type === 'error') {
								window.alert(result.message.msg);
							} else {
								gfx.message(
									result.message.type,
									result.message.icon,
									result.message.msg
								);
								gfx.closeDialog('admin');
							}
						}
					}
				}
			);
		};
		this.dialog.admin.buttons[T.BUTTONS.ADMIN_FACEOFF] = function () {
			if (!window.confirm(T.UI.ADMIN_FACEOFF_CONFIRM)) {
				return;
			}
			$('#admin_post').attr(
				{
					'action' : './auth/switchto'
				}
			).submit();
		};
		this.dialog.admin.buttons[T.BUTTONS.ADMIN_DELETEUSER] = function () {
			if (!window.confirm(T.UI.ADMIN_DELETEUSER_CONFIRM)) {
				return;
			}
			$('#admin_post').attr(
				{
					'action' : './user/delete'
				}
			).submit();
		};
		$('#link_manage').show();
	}
};
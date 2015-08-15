	function check() {
		if(document.login.username.value==0) {
			alert("用户名不能为空");
			document.login.username.focus();
			return false;
		}
		if(document.login.password.value==0) {
			alert("密码不能为空");
			document.login.password.focus();
			return false;
		}
		return true;
	}
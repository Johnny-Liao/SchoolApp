	function check() {
		if(document.login.username.value==0) {
			alert("�û�������Ϊ��");
			document.login.username.focus();
			return false;
		}
		if(document.login.password.value==0) {
			alert("���벻��Ϊ��");
			document.login.password.focus();
			return false;
		}
		return true;
	}
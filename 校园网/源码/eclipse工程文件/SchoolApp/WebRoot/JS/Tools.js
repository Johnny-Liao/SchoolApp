function check() {
	if(document.newlette.myusername.value.length>12 || document.newlette.myusername.value.length<6) {
		alert("�û���������6-12֮��");
		document.newlette.myusername.focus();
		return false;
	}
	
	if(document.newlette.password.value.length>12 || document.newlette.password.value.length<6) {
		alert("������������6-12֮��");
		document.newlette.passwrod.focus();
		return false;
	}
	
	if(document.newlette.nickname.value.length>12 || document.newlette.nickname.value.length<6) {
		alert("�ǳƱ�����6-12֮��");
		document.newlette.nickname.focus();
		return false;
	}
	
	if(document.newlette.place.value.length>12 || document.newlette.place.value.length<6) {
		alert("���������6-12֮��");
		document.newlette.place.focus();
		return false;
	}
	
	if(document.newlette.class.value.length>4 || document.newlette.class.value.length<4 ) {
		alert("�༶������4λ����");
		document.newlette.class.focus();
		return false;
	}
	
	if(document.newlette.bedroom.value.length>12 || document.newlette.bedroom.value.length<6 ) {
		alert("���Һű�����6-12֮��");
		document.newlette.bedroom.focus();
		return false;
	}
	
	if(document.newlette.institute.value.length==0 ) {
		alert("ѧԺ����Ϊ��");
		document.newlette.institute.focus();
		return false;
	}
	
	if(document.newlette.major.value.length==0 ) {
		alert("רҵ����Ϊ��");
		document.newlette.major.focus();
		return false;
	}
	
	if(document.newlette.moblie.value.length==0 ) {
		alert("�ֻ��Ų���Ϊ��");
		document.newlette.moblie.focus();
		return false;
	}
	
	if(document.newlette.qq.value.length==0 ) {
		alert("QQ����Ϊ��");
		document.newlette.qq.focus();
		return false;
	}
	
	return true;
}
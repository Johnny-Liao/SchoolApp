function check() {
	if(document.newlette.myusername.value.length>12 || document.newlette.myusername.value.length<6) {
		alert("用户名必须在6-12之间");
		document.newlette.myusername.focus();
		return false;
	}
	
	if(document.newlette.password.value.length>12 || document.newlette.password.value.length<6) {
		alert("密码名必须在6-12之间");
		document.newlette.passwrod.focus();
		return false;
	}
	
	if(document.newlette.nickname.value.length>12 || document.newlette.nickname.value.length<6) {
		alert("昵称必须在6-12之间");
		document.newlette.nickname.focus();
		return false;
	}
	
	if(document.newlette.place.value.length>12 || document.newlette.place.value.length<6) {
		alert("籍贯必须在6-12之间");
		document.newlette.place.focus();
		return false;
	}
	
	if(document.newlette.class.value.length>4 || document.newlette.class.value.length<4 ) {
		alert("班级必须是4位整数");
		document.newlette.class.focus();
		return false;
	}
	
	if(document.newlette.bedroom.value.length>12 || document.newlette.bedroom.value.length<6 ) {
		alert("寝室号必须在6-12之间");
		document.newlette.bedroom.focus();
		return false;
	}
	
	if(document.newlette.institute.value.length==0 ) {
		alert("学院不能为空");
		document.newlette.institute.focus();
		return false;
	}
	
	if(document.newlette.major.value.length==0 ) {
		alert("专业不能为空");
		document.newlette.major.focus();
		return false;
	}
	
	if(document.newlette.moblie.value.length==0 ) {
		alert("手机号不能为空");
		document.newlette.moblie.focus();
		return false;
	}
	
	if(document.newlette.qq.value.length==0 ) {
		alert("QQ不能为空");
		document.newlette.qq.focus();
		return false;
	}
	
	return true;
}
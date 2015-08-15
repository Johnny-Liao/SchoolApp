<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>聊天室</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/mainstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function check() {
		if(document.metting.password.value.length==0) {
			alert("密码不为空");
			document.metting.password.focus();
			return false;
		} 
		
		return true;
	}
	function check2() {
			if(document.del.houseid.value.length==0) {
				alert("房间号不为空");
				document.del.houseid.focus();
				return false;
			}
			if(document.del.pass.value.length==0) {
				alert("密码不为空");
				document.del.pass.focus();
				return false;
			}
			return true;
	}
</script>
</head>
<body>
<div id="mainHeader" >
</div>
<form action="MettingServlet" method="post" onsubmit="return check()" name="metting" target="_blank">
	聊天室密码：<input type="password" name="password" />
	<input type="submit" value="申请聊天室" />
</form>
<br/>
<form action="MettingDelServlet" method="post" name="del" onsubmit="return check2()" >
	房间号:<input type="text" name="houseid" />
	密码:<input type="password" name="pass" />
	<input type="submit" value="进入"/>
</form>

 <div  style="float:left;width:600px;margin:10px 0px 0px 0px;" >
  <table border="1">
  		<tr>
 			<td width="140px">房间号</td>
 		</tr>
    <c:forEach items="${metting}" var="mem">
 		<tr>
 			<td>${mem}</td>
 		</tr>
  	</c:forEach>
 </table>
  </div>
</body>
</html>

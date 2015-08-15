<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>校园网登入</title>
<style type="text/css">
<!--
* {
	overflow: hidden;
	font-size: 9pt;
}

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(images/bg.gif);
	background-repeat: repeat-x;
}

.button {
	height: 60px;
	margin-top: -5px;
	background-image: url(images/login4.gif);
}
-->
</style>
<script language="javascript" src="JS/Login.js">
	
</script>
</head>


<body>
	<c:out value="${login}"></c:out>
	
	<form action="LoginServlet" name="login" method="post"
		onsubmit="return check()">
		<table width="100%" height="100%" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td><table width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td height="561" style="background:url(images/lbg.gif)"><table
									width="940" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
										<td height="238" style="background:url(images/login01.jpg)">&nbsp;</td>
									</tr>
									<tr>
										<td height="190"><table width="100%" border="0"
												cellspacing="0" cellpadding="0">
												<tr>
													<td width="208" height="190"
														style="background:url(images/login02.jpg)">&nbsp;</td>
													<td width="518" style="background:url(images/login03.jpg)"><table
															width="320" border="0" align="center" cellpadding="0"
															cellspacing="0">
															<tr>
																<td width="40" height="50"><img
																	src="images/user.gif" width="30" height="30"></td>
																<td width="38" height="50">用户</td>
																<td width="242" height="50"><input type="text"
																	name="username" id="username"
																	style="width:164px; height:32px; line-height:34px; background:url(images/inputbg.gif) repeat-x; border:solid 1px #d1d1d1; font-size:9pt; font-family:Verdana, Geneva, sans-serif;"></td>
															</tr>
															<tr>
																<td height="50"><img src="images/password.gif"
																	width="28" height="32"></td>
																<td height="50">密码</td>
																<td height="50"><input type="password"
																	name="password" id="password"
																	style="width:164px; height:32px; line-height:34px; background:url(images/inputbg.gif) repeat-x; border:solid 1px #d1d1d1; font-size:9pt; "></td>
															</tr>
															<tr>
																<td height="40">&nbsp;</td>
																<td height="40">&nbsp;</td>
																<td height="60"><span>
																<input type="submit"
																		style="width:64px; height:32px; line-height:34px; background:url(images/images/login.gif) repeat-x; border:solid 1px #d1d1d1; font-size:13pt;"
																		value="登陆"></span>&nbsp;&nbsp;
																<span>
																<input type="reset"
																	style="width:64px; height:32px; line-height:34px; background:url(images/images/login.gif) repeat-x; border:solid 1px #d1d1d1; font-size:13pt; "
																	value="重置"></td></span>
															</tr>
														</table></td>
													<td width="214" style="background:url(images/login04.jpg)">&nbsp;</td>
												</tr>
											</table></td>
									</tr>
									<tr>
										<td height="133" style="background:url(images/login05.jpg)">&nbsp;</td>
									</tr>
								</table></td>
						</tr>
					</table></td>
			</tr>
		</table>
	</form>
</body>
</html>

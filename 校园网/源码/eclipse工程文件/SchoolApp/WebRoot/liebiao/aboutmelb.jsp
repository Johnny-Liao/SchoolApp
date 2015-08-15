<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>与我有关</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/mainstyle.css" rel="stylesheet" type="text/css" />

</head>
<body>

  <div id="mainHeader" >
  </div>
<!-- 第四个框-->
<c:forEach items="${aboutme}" var="speak">
	 <div id="list">
				<div style="float:left;margin-left:15px;"><img style="border-radius:5px;" src="images/higlight_h2.gif" width="50px" height="50px"/></div>
				<div style="float:left;margin:5px 0px 0px 8px;font-size:10px;color:#383838">姓名：<c:out value="${speak.speakname}"></c:out> <br/>时间：<c:out value="${speak.speaktime}"></c:out></div>
				<div style="float:left; background-color:#F0F0F0;width:555px;border-radius:3px;">
				<p style="font-size:12px;line-height:26px;color:#383838"><c:out value="${speak.mytext}"></c:out></p>
				</div>
	</div>
</c:forEach>
<!--尾部-->


</body>
</html>
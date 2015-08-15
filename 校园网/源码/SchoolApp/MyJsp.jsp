<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="photo/ext4/resources/css/ext-all.css">
	<link rel="stylesheet" type="text/css" href="photo/ablum.css">
	<link rel="stylesheet" type="text/css" href="photo/ext4/shared/example.css" />
	<script type="text/javascript" src="photo/ext4/ext-all-debug.js"></script>
	<script type="text/javascript" src="photo/ablum.js"></script>

  </head>
  
  <body>
   <div id="ablum_button"></div>
  </body>
</html>

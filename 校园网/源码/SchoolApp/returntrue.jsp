<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>跳转页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script language="javascript">     
	 var count=3;
     function direction()
	 { //计时
		if(count==0)
		{
	      location.href = "index.jsp";
	      return;
		}
		document.getElementById("alt").innerHTML="添加成功，跳转到首页还有"+count+"秒";
		count-=1;
	 	setTimeout("direction()",1000);
	 }
     window.onload=direction;
</script>


  </head>
  
  <body>
  	如果不能跳转请点击<a href="ourindex.jsp">这里</a>
  </body>
</html>

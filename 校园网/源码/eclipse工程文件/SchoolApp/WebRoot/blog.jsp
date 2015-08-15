<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>博文专区</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/mainstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="header"> <img src="images/logo.gif" alt="" class="logo" />
  <h1>  </h1>
  <ul class="navi">
     <li><a href="ourindex.jsp" class="hover">首页</a></li>
    <li><a href="major.jsp">专业专区</a></li>
    <li><a href="organ.jsp">组织专区</a></li>
    <li><a href="blog.jsp">博文专区</a></li>
    <li><a href="match.jsp">大赛专区</a></li>
	<li><a href="newstu.jsp">新生专区</a></li>
    <li><a href="school.jsp">校园服务</a></li>
    <li class="noborder"><a href="register.jsp">用户注册</a></li>
  </ul>

 <ul class="login">
     <!--<li><a href="#" class="sub">Subscribe</a></li>-->
    <li><a href="login.jsp" class="loginHer">Login</a></li>
  </ul>
</div>
<!--黑色的框-->
<!--<div id="special">
  <h2 class="spea"></h2>
  <a href="#" class="spe2007"></a>
  <dl>
    <dt> 我我我我我我我</dt>
    <dt></dt>
    <dt> </dt>
  </dl>
  <br class="spacer" />
</div>-->
<!--第一个框-->
<div id="botBody">
  
<!--第二个框-->
 

   
<!--第三个框-->

<!-- 第四个框-->

  <div   style="float:left;width:950px;height:500px; border:white 1px solid;border-radius:5px;margin:10px 0px 0px 0px;" >
  <h3 align="left" style="width:950px;background-color:#c0c0c0;border-radius:5px;margin-bottom:10px;">博文列表</h3>
<iframe src="BlogServlet" width="680px" height="450px" scrolling="[OPTION]" frameborder="x"name="main">
</iframe>
  </div>
  <br class="spacer" />
</div>
<!--尾部-->

<div id="footerbig">
<!--底部-->
<div id="footer">
  </div>
</div>
</body>
</html>

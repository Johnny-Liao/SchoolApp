<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>博文显示</title>
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
  <div class="subdiv">
    <p class="top">&nbsp;</p>
    <h2 align="left">发表者信息</h2>
   <img src="images/higlight_h2.gif" width="200" height="150">
   <p align="left">作者：<c:out value="${blog.myusername}"></c:out></p>
   <p align="left">学院：<c:out value="${blog.insititute}"></c:out></p>
   <br/><br/><br/><br/>
    <p class="bot"></p>
  </div>
<!--第二个框-->
 <div class="comdiv">
 <h4 align="center"style="margin:15px 0px 10px 0px;"><c:out value="${blog.title}"></c:out></h4>
 <p align="center" style="font-size:12px;margin:5px 0px 15px 0px;">时间:<c:out value="${blog.mydata}"></c:out>未知 作者:<c:out value="${blog.myusername}"></c:out></p>
 <p align="left" style="font-size:13px;line-height:26px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${blog.article}"></c:out>
<!--第三个框-->
 
<!-- 第四个框-->
 
  <br class="spacer" />
</div>
<!--尾部-->

<div id="footerbig">
<!--底部-->
<div id="footer">
   <!-- <ul>
      <li><a href="#">Home</a></li>
      <li>|</li>
      <li><a href="#"> About us</a></li>
      <li>|</li>
      <li><a href="#">Procidures</a></li>
      <li>|</li>
      <li><a href="#">Services</a></li>
      <li>|</li>
      <li><a href="#">Support</a></li>
      <li>|</li>
      <li><a href="#">Meeting</a></li>
      <li>|</li>
      <li><a href="#">Testimonials</a></li>
      <li>|</li>
      <li><a href="#">Future Plans</a></li>
      <li>|</li>
      <li><a href="#">Contact</a></li>
    </ul>
    <p>Copyrioht © Eco Mania 2009 All Rights Reserved</p>
    <p>Powered by <a href="#">www.865171.cn</a></p>-->
  </div>
</div>
</body>
</html>

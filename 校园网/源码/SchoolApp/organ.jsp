<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>组织专区</title>
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
  <div class="subdiv">
    <p class="top">&nbsp;</p>
    <h2 class="moreServices">组织专区</h2>
    <ul class="servi1">
      <li><a href="ShowServlet?name=organ&id=1">农学院</a></li>
      <li><a href="ShowServlet?name=organ&id=2">园林与艺术学院</a></li>
      <li><a href="ShowServlet?name=organ&id=3">动物科学技术学院</a></li>
      <li><a href="ShowServlet?name=organ&id=4">工学院</a></li>
      <li><a href="ShowServlet?name=organ&id=5">经济管理学院</a></li>
      <li><a href="ShowServlet?name=organ&id=6">计算机与信息工程学院</a></li>
	  <li><a href="ShowServlet?name=organ&id=7">软件学院</a></li>
      <li><a href="ShowServlet?name=organ&id=8">国土资源与环境学院</a></li>
      <li><a href="ShowServlet?name=organ&id=9">人文与公共管理学院</a></li>
      <li><a href="ShowServlet?name=organ&id=10">职业师范技术学院</a></li>
      <li><a href="ShowServlet?name=organ&id=11">理学院</a></li>
      <li><a href="ShowServlet?name=organ&id=12">食品科学与工程学院</a></li>
	  <li><a href="ShowServlet?name=organ&id=13">生物科学与工程学院</a></li>
      <li><a href="ShowServlet?name=organ&id=14">外国语学院</a></li>
      <li><a href="ShowServlet?name=organ&id=15">马克思主义学院</a></li>
      <li><a href="ShowServlet?name=organ&id=16">继续教育学院</a></li>
      <li><a href="ShowServlet?name=organ&id=17">南昌商学院</a></li>
    </ul>
	
  </div>
<!-- 第四个框-->
 <div  style="float:left;width:700px;height:500px; border:white 1px solid;border-radius:5px;margin:10px 0px 0px 0px;" >
  <h3 align="left" style="width:700px;background-color:#c0c0c0;border-radius:5px;margin-bottom:10px;">组织列表</h3>
<iframe src="OrganServlet?id=${idinfo}" width="680px" height="450px" scrolling="[OPTION]" frameborder="x"name="main">
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

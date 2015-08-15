<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>校园服务</title>
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
    <h2 class="moreServices">服务列表</h2>
    <ul class="servi1">
      <li><a href="http://www.12306.cn/mormhweb/">火车查询</a></li>
      <li><a href="http://flight.qunar.com/">航班查询</a></li>
      <li><a href="http://mall.360.cn/">网上购物</a></li>
      <li><a href="http://map.qq.com/?l=114454655#pano=21011418130414141413000&heading=26&pitch=3&zoom=1">校园地图</a></li>
      <li><a href="http://jwgl.jxau.edu.cn/user/login">教务系统</a></li>
      <li><a href="http://219.229.222.149/gdweb/ReaderLogin.aspx">借图续期</a></li>
	  <li><a href="http://218.95.3.135/eol/homepage/common/opencourse/">网络教学</a></li>
      <li><a href="http://jxau.soushai.com/sale/">二手市场</a></li>
      <li><a href="http://jxau.soushai.com/jiaoyu/">教育培训</a></li>
      <li><a href="http://jxau.soushai.com/life/">生活服务</a></li>
      <li><a href="http://job.soushai.com/">求职招聘</a></li>
      <li><a href="http://jiaoyu.soushai.com/kaoyan/">考研辅导</a></li>
      <li><a href="http://jxau.soushai.com/life/jiangzuo/">校园讲座</a></li>
	
  </div>
<!-- 第四个框-->
 <div  style="float:left;width:700px;height:500px; border:white 1px solid;border-radius:5px;margin:10px 0px 0px 0px;" >
  <h3 align="left" style="width:700px;background-color:#c0c0c0;border-radius:5px;margin-bottom:10px;"></h3>
  <h4>班车信息</h4>
	<img src="images/240.jpg" alt="" height="45%"/>
	<img src="images/704.png" alt="" height="40%"/>
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

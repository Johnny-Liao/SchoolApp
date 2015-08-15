<%@ page language="java" import="java.util.*" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>江西农大校园网</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<link href="CSS/mainstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function housecheck() {
		if(document.houseinfo.house.value.length == 0) {
			alert("输入不能为空");
			document.houseinfo.house.focus();
			return false;
		}
		return true;
	}
</script>
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

	<!-- 这里是 显示的-->

 <ul class="login">
    <li><a href="login.jsp" class="loginHer">Login</a></li>
  </ul>
</div>
<!--黑色的框-->
<div id="special">
  <h2 class="spea"></h2>
  <a href="#" class="spe2007"></a>
  <dl>
    <dt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;团结、勤奋、求实、创新</dt>
    <dt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;君子怀德，小人怀土；君子怀刑，小人怀惠</dt>
    <dt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;质胜文则野，文胜质则史。文质彬彬，然后君子</dt>
    <dt></dt>
    <dt> </dt>
  </dl>
  <br class="spacer" />
</div>
<!--第一个框-->
<div id="botBody">
  <div class="subdiv">
    <p class="top">&nbsp;</p>
    <h2>快速用户登入</h2>
    <form name="login" method="post" action="LoginServlet">
      <label>用户名</label>
      <input type="text" name="username" value="" class="textbox" />
      <label>密码</label>
      <input type="password" name="password" value="" class="textbox" />
      <input type="submit" name="submit" value="" class="loginbut" />
      <br class="spacer" />
    </form>
    <p class="bot"></p>
  </div>
<!--第二个框-->
  <div class="subdiv">
    <p class="top">&nbsp;</p>
    <h2 class="event">我们的生活</h2>
    <div class="subdiv1"> <img src="images/pic.gif" alt="" />
      <h3>10.06.07</h3>
      <h4>我们的生活</h4>
      <p>我们的生活r</p>
      <br class="spacer" />
    </div>

    <div class="subdiv1"> <img src="images/pic2.gif" alt="" />
      <h3>18.06.07</h3>
      <h4>我们的生活</h4>
      <p>我们的生活</p>
      <br class="spacer" />
    </div>
    <p class="more marTop"><a href="#">more</a></p>
    <p class="bot">&nbsp;</p>
  </div>
<!--第三个框-->
  <div class="subdiv">
    <p class="top">&nbsp;</p>
    <h2 class="moreServices">常用链接</h2>
    <ul class="servi">
      <li><a href="http://news.qndb.net/">大学网 </a></li>
      <li><a href="http://www.jxau.edu.cn/">江西农业大学首页 </a></li>
      <li><a href="http://jwgl.jxau.edu.cn/user/login">教务系统登入 </a></li>
      <li><a href="http://218.95.3.135/eol/homepage/common/opencourse/">网络教学平台 </a></li>
      <li><a href="http://www.unjs.com/kaoyan/beizhan/">研友天地</a></li>
      <li><a href="http://www.hjenglish.com/">沪江英语</a></li>
      <li><a href="http://open.163.com/cuvocw/">网易公开课</a></li>
      <li><a href="http://open.163.com/cuvocw/">农大贴吧</a></li>
    </ul>
    <p class="bot">&nbsp;</p>
  </div>
<!-- 第四个框-->
  <div class="subdiv2">
    <p class="top">&nbsp;</p>
    <h2 class="testi">青春</h2>
    <h4><strong>风华正茂</strong></h4>
    <h4 class="green">活力四射</h4>
    <p class="text">热情奔放</p>
    <p class="text">热情奔放</p>
    <p class="text">舞动的青春</p>
    <p class="text">躁动的青春</p>
    <p class="text">韵动的青春</p>
    <h4><strong>旋转的青春</strong></h4>
    <p class="bot">&nbsp;</p>
  </div>
  <br class="spacer" />
</div>
<!--尾部-->
<div id="highlight">
  <form name="houseinfo" method="post" action="HouseServlet" target="_blank" onsubmit="return housecheck()">
    <p class="top">&nbsp;</p>
    <h2>租房信息</h2>
    <label>输入租房地点</label>
    <input type="text" name="house" value="" class="textbox" />
    <input type="submit" name="submit" value="" class="singup" />
    <p class="bot">&nbsp;</p>
  </form>
  <h2 class="hight">Happy</h2>
  <h3>我很开心</h3>
  <p class="text">世界很大 </p>
  <p class="text">时间过的很快</p>
  <br class="spacer" />
</div>
<div id="footerbig">
<!--底部-->
<div id="footer">
  </div>
</div>
</body>
</html>

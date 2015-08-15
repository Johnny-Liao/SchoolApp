<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/mainstyle.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body{TEXT-ALIGN: center;}
</style>
<script type="text/javascript">
	function ini() {
		if(document.shuoshuo.text.value.length == 0) {
			alert("输入不能为空");
			document.shuoshuo.text.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>

<div id="mainHeader" >
  <h1>  </h1>
  <ul class="navi">
    <li><a href="ourindex.jsp" class="hover" target="_blank">首页</a></li>
    <li class="noborder"><a href="RenrenServlet?username=${Userinfo.myusername}" target="_blank">个人设置</a></li>
	<li class="noborder"><a href="friend/index.html">好友</a></li>
  </ul>
  <form name="serach" method="post" action="#">
 <a href="#"><c:out value="${str}"></c:out></a>
  </form>

</div>
<div class="main">
	<!--左部开始-->
	<div class="left">
		<!--设置头像和名字-->
		<div class="top">
			<div><img src="images/a.jpg" height="95" width="95"></img></div>
			<div class="name"><c:out value="${Userinfo.nickname}"></c:out></div>
		</div>
		<div class="dh">我常用的</div>
		<div class="midle">
				<li style="background:url(images/matter-logo1.gif) no-repeat left ;"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新鲜事</a></li>
				<li style="background:url(images/matter-logo2.gif) no-repeat left ;"><a href="AboutmeServlet?username=${Userinfo.myusername}" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;与我有关</a></li>
				<li style="background:url(images/matter-logo5.gif) no-repeat left ;"><a href="photo/index.jsp" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;相册</a></li>
				<li style="background:url(images/matter-logo4.gif) no-repeat left ;"><a href="MyblogServlet?username=${Userinfo.myusername}" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的博文</a></li>
			
		</div>
	</div>
	<!--左部结束-->
	<!--中间导航-->
	<div class="center">
		<div>
			<li><img src="images/centen1.gif"></li>
			<li><a href="#">发状态</a></li>
			<li><img src="images/centen2.gif"></li>
			<li><a href="blogeditor.jsp?id=${Userinfo.id}" target="_blank">写博文</a></li>
		</div><br/>
		<form name="shuoshuo" action="MyspeakServlet" method="post" onsubmit="return ini()">
		<div class="shuo"><textarea name="text" cols="75" rows="5">在这里发表说说</textarea><br/>
		<input type="hidden" name="hidd" value="${Userinfo.myusername}">
		<input type="submit" value="提交">&nbsp;&nbsp;&nbsp;<input type="reset" value="重置">
		</form>
		</div>
		<!--说说显示-->
		 <Iframe src="ShuoshuoServlet" width="580px" height="320px" scrolling="[OPTION]" frameborder="x" name="main">
		</iframe>
		<!--<div id="list">
			<div style="float:left;margin-left:15px;"><img style="border-radius:5px;" src="images/higlight_h2.gif" width="50px" height="50px"/></div>
			<div style="float:left;margin:5px 0px 0px 8px;font-size:10px;color:#383838">姓名：20:04 <br/>来自 Android </div>
			<div style="float:left; background-color:#F0F0F0;width:555px;border-radius:3px;">
			<p style="font-size:12px;line-height:26px;color:#383838">
			人生不一定圆满，但重要的是用什么态度来面对不圆满的人生。
			人生不一定圆满，但重要的是用什么态度来面对不圆满的人生。
			人生不一定圆满，但重要的是用什么态度来面对不圆满的人生。</p>
			</div>
		</div>-->
		<!--说说显示结束-->
	</div>
	
	<!--右部开始-->
	<div class="right">
	<div class="friend">
		<li>站内功能</li>
		<a href="MajordisDelServlet?id=${Userinfo.id}"  target="_blank">发表专业论文</a><br/>
		<a href="#">我的组织</a><br/>
		<a href="upload.jsp" target="_blank">新生区文件上传</a>
	</div>
	<div class="friend">
		<li>生活特区</li>
		<a href="JoinServlet">聊天室</a>
	</div>
	<div class="friend">
		<li>比赛推荐</li>
		<c:forEach items="${info}" var="mem">
			&nbsp;&nbsp;<a href="ShowmacthlistServlet?id=${mem.id}" target="_blank">${mem.matchtype}</a><br/>
		</c:forEach>
	</div>
	
	</div>
	<!--右部结束-->
</div>


<!--底部-->
<div id="footer">

  </div>
</div>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>个人设置</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/mainstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="JS/checkQuestionjs.js"></script>
<style type="text/css">
body{TEXT-ALIGN: center;}
</style>
<script>
function newlette_Validator(){
	//var myusername=document.getElementById('myusername');
	//if ( !CheckNotNull(newlette.myusername,"用户名，用学号注册")) {return false;}
	if ( !CheckNumber(newlette.myusername,"用户名，用学号注册")) {return false;}
	if ( !CheckStringLength(newlette.myusername,"用户名",8,8)) {return false;}
	if ( !CheckNotNull(newlette.password,"密码")) {return false;}
	if ( !CheckNumber(newlette.password,"密码")) {return false;}
	if ( !CheckStringLength(newlette.password,"密码",6,6)) {return false;}
	if ( !CheckNotNull(newlette.nickname,"昵称")) {return false;}
	if (!CheckRadioNoClick(document.newlette.xingbie, "性别")) {return false;}
	if ( !CheckNotNull(newlette.place,"籍贯")) {return false;}
	if ( !CheckNotNull(newlette.institute,"学院")) {return false;}
	if ( !CheckNotNull(newlette.major,"专业")) {return false;}
	if ( !CheckNotNull(newlette.class,"班级")) {return false;}
	if ( !CheckNotNull(newlette.bedroom,"寝室号")) {return false;}
	if ( !CheckNumber(newlette.bedroom,"寝室号")) {return false;}
	if ( !CheckStringLength(newlette.bedroom,"寝室号",4,4)) {return false;}
	if ( !CheckNotNull(newlette.moblie,"手机号")) {return false;}
	if ( !CheckPhone(newlette.moblie,"手机号")) {return false;}
	if ( !CheckNotNull(newlette.qq,"QQ号")) {return false;}
	if ( !CheckNumber(newlette.qq,"QQ号")) {return false;}
	if ( !CheckStringLength(newlette.qq,"QQ号",6,12)) {return false;}
	if(document.getElementById('photo').value=="")
	if ( !CheckNotNull(newlette.touxiang,"头像")) {return false;}
	}
function submitPform()
{	
	//document.Pform.Action.value = 'Step2Submit';
	//document.Pform.inAction.value = 'baocun2';
    if( Pform_Validator() != false )
	{
		document.Pform.submit();
	}
}
</script>
</head>
<body>

<div id="mainHeader" >
  <ul class="navi">
    <li><a href="ourindex.jsp" class="hover">首页</a></li>
    <li class="noborder"><a href="#">个人设置</a></li>
	<li class="noborder"><a href="#">好友</a></li>
  </ul>
  <form name="serach" method="post" action="#">
  我的账号：<a href="#"><c:out value="${gerenUser.myusername}"></c:out></a>
  </form>

</div>
<div class="main">
	<!--左部开始-->
	<div class="left">
		<!--设置头像和名字-->
		
		<div class="top">
			<div><img src="images/a.jpg" height="95" width="95"></img></div>
			<div class="name"><p style="font-size:18px; color:#6666CC; margin-top:10px;font-weight:bold;">
			<div class="name"><c:out value="${gerenUser.nickname}"></c:out></div>
			</div>
		</div>
		<div class="dh">我常用的</div>
		<div class="midle">
				<li style="background:url(images/matter-logo1.gif) no-repeat left ;"><a href="main.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新鲜事</a></li>
				<li style="background:url(images/matter-logo2.gif) no-repeat left ;"><a href="AboutmeServlet?username=${Userinfo.myusername}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;与我有关</a></li>
				<li style="background:url(images/matter-logo5.gif) no-repeat left ;"><a href="photo/index.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;相册</a></li>
				<li style="background:url(images/matter-logo4.gif) no-repeat left ;"><a href="MyblogServlet?username=${Userinfo.myusername}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的博文</a></li>
		</div>
	</div>
	<!--左部结束-->
	<!--中间导航-->
	<div class="center">
<form name="newlette" method="post" action="RegisterServlet"  onsubmit="return newlette_Validator()">
	<input type="hidden" name="hidd" value="1">
  <table border="0" width="600px">
	 <input type="hidden" name="myusername" value="<c:out value="${gerenUser.myusername}"></c:out>" />
	 <tr>
		   <td align="right">
			密码
		  </td>
		  <td align="left">
			<input type="password" name="password" id="password"  />
		  </td>
	  </tr>
	   <tr>
		  <td align="right">
			昵称
		  </td>
		  <td align="left">
			<input type="text" name="nickname" id="nickname"  value=""  />
		  </td>
		  </tr>
	 <tr>
		   <td align="right">
			性别
		  </td>
		  <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" value="男"  id="sex" name="sex" checked="checked"> 男 <input type="radio" value="女" name="sex"  id="sex"> 女
		  </td>
	  </tr>
	   <tr>
		  <td align="right">
			籍贯
		  </td>
		  <td align="left">
			<input type="text" name="place" id="place" value=""  />
		  </td>
		   </tr>
	   <tr>
		   <td align="right">
			学院
		  </td>
		  <td align="left">
			<input type="text" name="insititute" id="insititute" value=""  />
		  </td>
	  </tr>
	  <tr>
		  <td align="right">
			专业
		  </td>
		  <td align="left">
			<input type="text" name="major" id="major" value=""  />
		  </td>
		   </tr>
	   <tr>
		   <td align="right">
			班级
		  </td>
		  <td align="left">
			<input type="text" name="class" id="class" value=""  />
		  </td>
	  </tr>
	   <tr>
		   <td align="right">
			寝室号
		  </td>
		  <td align="left">
			<input type="text" name="bedroom" id="bedroom" value="" />
		  </td>
	  </tr>
	   <tr>
		  <td align="right">
			手机号
		  </td>
		  <td align="left">
			<input type="text" name="mobile" id="mobile" value=""  />
		  </td>
		   </tr>
	   <tr>
		   <td align="right">
			QQ号
		  </td>
		  <td align="left">
			<input type="text" name="qq" id="qq" value=""  />
		  </td>
	  </tr>
	  <tr>
		  <td align="right">&nbsp;
		  </td>
		  <td  align="left">
		  &nbsp;&nbsp;
		  <input type="submit" name="submit"  value="提交">
			<input type="reset" name="reset" value="重置"/>
		  </td>
		  
	  </tr>
  </table>
  </form>
		<!--说说显示-->
		
		<!--说说显示结束-->
	</div>
	
	<!--右部开始-->
	<!--右部结束-->
</div>


<!--底部-->
<div id="footer">
  </div>
</div>
</body>
</html>

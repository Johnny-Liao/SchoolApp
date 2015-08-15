<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户注册</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/mainstyle.css" rel="stylesheet" type="text/css" />
<script>
function newlette_Validator(){
	//var myusername=document.getElementById('myusername');
	if ( !CheckNotNull(newlette.myusername,"用户名，用学号注册")) {return false;}
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

	return true;
	}

 //检查必填项
function CheckNotNull(objField, strText) {
  if (Trim(objField.value) == "") {
    alert("请填写“" + strText + "”！");
    objField.focus();
    return false;
  }
  return true;
}

//去除字符串左端空格
function LTrim(str) {
  return str.replace(/^\s*/, '');
}

//去除字符串右端空格
function RTrim(str) {
  return str.replace(/\s*$/, '');
}

//去除字符串两端空格
function Trim(str) {
  return LTrim(RTrim(str));
}
//检查字符串长度
function CheckStringLength(objField, strText, numMinLen, numMaxLen){
  if(objField.value == "") return true;
  if(numMinLen != null){
    if(objField.value.length < numMinLen){
      alert("“" + strText + "”的长度不能少于 " + numMinLen.toString() + " 个字符！");
      objField.focus();
      return false;
    }
  }
  if(numMaxLen != null){
    if(objField.value.length > numMaxLen){
      alert("“" + strText + "”的长度不能多于 " + numMaxLen.toString() + " 个字符！");
      objField.focus();
      return false;
    }
  }
  return true;
}
 //检测为电话号码
function CheckPhone(objField, strText) 
{
    var objValue = Trim(objField.value);
    if (objValue=="") return true;
	var strErr = "“" + strText + "”不是正确的电话号码格式！";
	var reg=/(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{7,11}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}1(3|4|5|8)[0-9]{9}$)|(^(400|800)[0-9]{7}$)/;
	if (!reg.exec(objValue)) {
        objField.focus();
		alert(strErr);
		return false;
	}
	return true;
}

//检查是否为数值
function CheckNumber(objField, strText, numMinValue, numMaxValue) {
  if(objField.value == "") return true;
  if(isNaN(objField.value)){
    alert("“" + strText + "”中只能填写数字！");
    objField.focus();
    return false;
  }
  var numValue = parseFloat(objField.value);
  if(numMinValue != null){
    if(numValue < numMinValue){
      alert("“" + strText + "”的值不能小于 " + numMinValue.toString() + " ！");
      return false;
    }
  }
  if(numMaxValue != null){
    if(numValue > numMaxValue){
      objField.focus();
      alert("“" + strText + "”的值不能大于 " + numMaxValue.toString() + " ！");
      return false;
    }
  }
  return true;
}
//检查为Email
function CheckEmail(objField, strText)
{
  var objValue = Trim(objField.value);
  if (objValue=="") return true;
  var strErr = "“" + strText + "”不是正确的Email格式！";

  var regex = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
  if (regex.test(objValue)) 
  {
     var str = " !#$%^&*()+=|\{[]}:;'<,>?/" ;
     var str2 = '"';
     var result = true;
     for (var j = 0; j < objValue.length; j++) {
        if (str.indexOf(objValue.charAt(j)) != -1 || str2.indexOf(objValue.charAt(j)) != -1) {
          result = false;
          break; 
        }
     }
     if (result == true) {
        return true;
     }
     else {
		alert(strErr);
        objField.focus();
        return false;		
     }
   } 
   else {
	 alert(strErr);
     objField.focus();
     return false;		
   }
}


//判断单选/复选必选
function CheckRadioNoClick(objField, strText)
{
	var strErr = "“" + strText + "”必须选择一个选项！";
	if( objField.length == null )
	{
		if (objField.checked) return true;
		else
		{
			alert(strErr);
			objField.focus();
			return false;
		}
	}
	else
	{
		for (i=0;i<objField.length;i++){
			if (objField[i].checked) return true;
		}
		alert(strErr);
		objField[0].focus();
		return false;
	}
}

function submitnewlette()
{	
	
    if( newlette_Validator() != false )
	{	
		document.newlette.submit();
	}
}
</script>
</head>
<body>

<div id="header"> <img src="images/logo.gif" alt="" class="logo" />
  <h1>  </h1>
  <ul class="navi">
    <li><a href="index.jsp" class="hover">首页</a></li>
    <li><a href="major.jsp">专业专区</a></li>
    <li><a href="organ.jsp">组织专区</a></li>
    <li><a href="blog.jsp">博文专区</a></li>
    <li><a href="match.jsp">大赛专区</a></li>
	<li><a href="newstu.jsp">新生专区</a></li>
    <li><a href="school.jsp">校园服务</a></li>
    <li class="noborder"><a href="register.html">用户注册</a></li>
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

</div>
<!--尾部-->
<div id="highlight1">
  <form name="newlette" method="post" action="RegisterServlet" onsubmit="return newlette_Validator()">

  <table border="0" width="900px">
  <tr><th colspan="2" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 用户注册<br/>&nbsp; </th></tr>
	  <tr>
		  <td align="right" width="300px">
			用户名
		  </td>
	 
		  <td align="left">
			<input type="text" name="myusername" id="myusername" class="textbox" />
		  </td>
		  </tr>
	 <tr>
		   <td align="right">
			密码
		  </td>
		  <td align="left">
			<input type="password" name="password" id="password" class="textbox" />
		  </td>
	  </tr>
	   <tr>
		  <td align="right">
			昵称
		  </td>
		  <td align="left">
			<input type="text" name="nickname" id="nickname" class="textbox" />
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
			<input type="text" name="place" id="place" class="textbox" />
		  </td>
		   </tr>
	   <tr>
		   <td align="right">
			学院
		  </td>
		  <td align="left">
			<input type="text" name="insititute" id="insititute" class="textbox" />
		  </td>
	  </tr>
	  <tr>
		  <td align="right">
			专业
		  </td>
		  <td align="left">
			<input type="text" name="major" id="major" class="textbox" />
		  </td>
		   </tr>
	   <tr>
		   <td align="right">
			班级
		  </td>
		  <td align="left">
			<input type="text" name="class" id="class" class="textbox" />
		  </td>
	  </tr>
	   <tr>
		   <td align="right">
			寝室号
		  </td>
		  <td align="left">
			<input type="text" name="bedroom" id="bedroom" class="textbox" />
		  </td>
	  </tr>
	   <tr>
		  <td align="right">
			手机号
		  </td>
		  <td align="left">
			<input type="text" name="mobile" id="mobile" class="textbox" />
		  </td>
		   </tr>
	   <tr>
		   <td align="right">
			QQ号
		  </td>
		  <td align="left">
			<input type="text" name="qq" id="qq" class="textbox" />
		  </td>
	  </tr>
	  <tr>
		  <td align="right">&nbsp;
		  </td>
		  <td  align="left">
		  &nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="submit" name="submit"  value="提交" >
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" name="reset" value="重置"/>
		  </td>
		  
	  </tr>
  </table>
  </form>
 
  <br class="spacer" />
</div>
<div id="footerbig">
<!--底部-->
<div id="footer">
 
  </div>
</div>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/mainstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="JS/checkQuestionjs.js"></script>
<style type="text/css">
body{TEXT-ALIGN: center;}
</style>
<script>
function newlette_Validator(){
	//var myusername=document.getElementById('myusername');
	//if ( !CheckNotNull(newlette.myusername,"�û�������ѧ��ע��")) {return false;}
	if ( !CheckNumber(newlette.myusername,"�û�������ѧ��ע��")) {return false;}
	if ( !CheckStringLength(newlette.myusername,"�û���",8,8)) {return false;}
	if ( !CheckNotNull(newlette.password,"����")) {return false;}
	if ( !CheckNumber(newlette.password,"����")) {return false;}
	if ( !CheckStringLength(newlette.password,"����",6,6)) {return false;}
	if ( !CheckNotNull(newlette.nickname,"�ǳ�")) {return false;}
	if (!CheckRadioNoClick(document.newlette.xingbie, "�Ա�")) {return false;}
	if ( !CheckNotNull(newlette.place,"����")) {return false;}
	if ( !CheckNotNull(newlette.institute,"ѧԺ")) {return false;}
	if ( !CheckNotNull(newlette.major,"רҵ")) {return false;}
	if ( !CheckNotNull(newlette.class,"�༶")) {return false;}
	if ( !CheckNotNull(newlette.bedroom,"���Һ�")) {return false;}
	if ( !CheckNumber(newlette.bedroom,"���Һ�")) {return false;}
	if ( !CheckStringLength(newlette.bedroom,"���Һ�",4,4)) {return false;}
	if ( !CheckNotNull(newlette.moblie,"�ֻ���")) {return false;}
	if ( !CheckPhone(newlette.moblie,"�ֻ���")) {return false;}
	if ( !CheckNotNull(newlette.qq,"QQ��")) {return false;}
	if ( !CheckNumber(newlette.qq,"QQ��")) {return false;}
	if ( !CheckStringLength(newlette.qq,"QQ��",6,12)) {return false;}
	if(document.getElementById('photo').value=="")
	if ( !CheckNotNull(newlette.touxiang,"ͷ��")) {return false;}
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
    <li><a href="ourindex.jsp" class="hover">��ҳ</a></li>
    <li class="noborder"><a href="#">��������</a></li>
	<li class="noborder"><a href="#">����</a></li>
  </ul>
  <form name="serach" method="post" action="#">
  �ҵ��˺ţ�<a href="#"><c:out value="${gerenUser.myusername}"></c:out></a>
  </form>

</div>
<div class="main">
	<!--�󲿿�ʼ-->
	<div class="left">
		<!--����ͷ�������-->
		
		<div class="top">
			<div><img src="images/a.jpg" height="95" width="95"></img></div>
			<div class="name"><p style="font-size:18px; color:#6666CC; margin-top:10px;font-weight:bold;">
			<div class="name"><c:out value="${gerenUser.nickname}"></c:out></div>
			</div>
		</div>
		<div class="dh">�ҳ��õ�</div>
		<div class="midle">
				<li style="background:url(images/matter-logo1.gif) no-repeat left ;"><a href="main.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������</a></li>
				<li style="background:url(images/matter-logo2.gif) no-repeat left ;"><a href="AboutmeServlet?username=${Userinfo.myusername}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����й�</a></li>
				<li style="background:url(images/matter-logo5.gif) no-repeat left ;"><a href="photo/index.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���</a></li>
				<li style="background:url(images/matter-logo4.gif) no-repeat left ;"><a href="MyblogServlet?username=${Userinfo.myusername}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ҵĲ���</a></li>
		</div>
	</div>
	<!--�󲿽���-->
	<!--�м䵼��-->
	<div class="center">
<form name="newlette" method="post" action="RegisterServlet"  onsubmit="return newlette_Validator()">
	<input type="hidden" name="hidd" value="1">
  <table border="0" width="600px">
	 <input type="hidden" name="myusername" value="<c:out value="${gerenUser.myusername}"></c:out>" />
	 <tr>
		   <td align="right">
			����
		  </td>
		  <td align="left">
			<input type="password" name="password" id="password"  />
		  </td>
	  </tr>
	   <tr>
		  <td align="right">
			�ǳ�
		  </td>
		  <td align="left">
			<input type="text" name="nickname" id="nickname"  value=""  />
		  </td>
		  </tr>
	 <tr>
		   <td align="right">
			�Ա�
		  </td>
		  <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" value="��"  id="sex" name="sex" checked="checked"> �� <input type="radio" value="Ů" name="sex"  id="sex"> Ů
		  </td>
	  </tr>
	   <tr>
		  <td align="right">
			����
		  </td>
		  <td align="left">
			<input type="text" name="place" id="place" value=""  />
		  </td>
		   </tr>
	   <tr>
		   <td align="right">
			ѧԺ
		  </td>
		  <td align="left">
			<input type="text" name="insititute" id="insititute" value=""  />
		  </td>
	  </tr>
	  <tr>
		  <td align="right">
			רҵ
		  </td>
		  <td align="left">
			<input type="text" name="major" id="major" value=""  />
		  </td>
		   </tr>
	   <tr>
		   <td align="right">
			�༶
		  </td>
		  <td align="left">
			<input type="text" name="class" id="class" value=""  />
		  </td>
	  </tr>
	   <tr>
		   <td align="right">
			���Һ�
		  </td>
		  <td align="left">
			<input type="text" name="bedroom" id="bedroom" value="" />
		  </td>
	  </tr>
	   <tr>
		  <td align="right">
			�ֻ���
		  </td>
		  <td align="left">
			<input type="text" name="mobile" id="mobile" value=""  />
		  </td>
		   </tr>
	   <tr>
		   <td align="right">
			QQ��
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
		  <input type="submit" name="submit"  value="�ύ">
			<input type="reset" name="reset" value="����"/>
		  </td>
		  
	  </tr>
  </table>
  </form>
		<!--˵˵��ʾ-->
		
		<!--˵˵��ʾ����-->
	</div>
	
	<!--�Ҳ���ʼ-->
	<!--�Ҳ�����-->
</div>


<!--�ײ�-->
<div id="footer">
  </div>
</div>
</body>
</html>

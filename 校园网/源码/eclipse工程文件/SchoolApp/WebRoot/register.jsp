<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>�û�ע��</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/mainstyle.css" rel="stylesheet" type="text/css" />
<script>
function newlette_Validator(){
	//var myusername=document.getElementById('myusername');
	if ( !CheckNotNull(newlette.myusername,"�û�������ѧ��ע��")) {return false;}
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

	return true;
	}

 //��������
function CheckNotNull(objField, strText) {
  if (Trim(objField.value) == "") {
    alert("����д��" + strText + "����");
    objField.focus();
    return false;
  }
  return true;
}

//ȥ���ַ�����˿ո�
function LTrim(str) {
  return str.replace(/^\s*/, '');
}

//ȥ���ַ����Ҷ˿ո�
function RTrim(str) {
  return str.replace(/\s*$/, '');
}

//ȥ���ַ������˿ո�
function Trim(str) {
  return LTrim(RTrim(str));
}
//����ַ�������
function CheckStringLength(objField, strText, numMinLen, numMaxLen){
  if(objField.value == "") return true;
  if(numMinLen != null){
    if(objField.value.length < numMinLen){
      alert("��" + strText + "���ĳ��Ȳ������� " + numMinLen.toString() + " ���ַ���");
      objField.focus();
      return false;
    }
  }
  if(numMaxLen != null){
    if(objField.value.length > numMaxLen){
      alert("��" + strText + "���ĳ��Ȳ��ܶ��� " + numMaxLen.toString() + " ���ַ���");
      objField.focus();
      return false;
    }
  }
  return true;
}
 //���Ϊ�绰����
function CheckPhone(objField, strText) 
{
    var objValue = Trim(objField.value);
    if (objValue=="") return true;
	var strErr = "��" + strText + "��������ȷ�ĵ绰�����ʽ��";
	var reg=/(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{7,11}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}1(3|4|5|8)[0-9]{9}$)|(^(400|800)[0-9]{7}$)/;
	if (!reg.exec(objValue)) {
        objField.focus();
		alert(strErr);
		return false;
	}
	return true;
}

//����Ƿ�Ϊ��ֵ
function CheckNumber(objField, strText, numMinValue, numMaxValue) {
  if(objField.value == "") return true;
  if(isNaN(objField.value)){
    alert("��" + strText + "����ֻ����д���֣�");
    objField.focus();
    return false;
  }
  var numValue = parseFloat(objField.value);
  if(numMinValue != null){
    if(numValue < numMinValue){
      alert("��" + strText + "����ֵ����С�� " + numMinValue.toString() + " ��");
      return false;
    }
  }
  if(numMaxValue != null){
    if(numValue > numMaxValue){
      objField.focus();
      alert("��" + strText + "����ֵ���ܴ��� " + numMaxValue.toString() + " ��");
      return false;
    }
  }
  return true;
}
//���ΪEmail
function CheckEmail(objField, strText)
{
  var objValue = Trim(objField.value);
  if (objValue=="") return true;
  var strErr = "��" + strText + "��������ȷ��Email��ʽ��";

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


//�жϵ�ѡ/��ѡ��ѡ
function CheckRadioNoClick(objField, strText)
{
	var strErr = "��" + strText + "������ѡ��һ��ѡ�";
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
    <li><a href="index.jsp" class="hover">��ҳ</a></li>
    <li><a href="major.jsp">רҵר��</a></li>
    <li><a href="organ.jsp">��֯ר��</a></li>
    <li><a href="blog.jsp">����ר��</a></li>
    <li><a href="match.jsp">����ר��</a></li>
	<li><a href="newstu.jsp">����ר��</a></li>
    <li><a href="school.jsp">У԰����</a></li>
    <li class="noborder"><a href="register.html">�û�ע��</a></li>
  </ul>


 <ul class="login">
     <!--<li><a href="#" class="sub">Subscribe</a></li>-->
    <li><a href="login.jsp" class="loginHer">Login</a></li>
  </ul>
</div>
<!--��ɫ�Ŀ�-->
<!--<div id="special">
  <h2 class="spea"></h2>
  <a href="#" class="spe2007"></a>
  <dl>
    <dt> ��������������</dt>
    <dt></dt>
    <dt> </dt>
  </dl>
  <br class="spacer" />
</div>-->
<!--��һ����-->
<div id="botBody">
  
<!--�ڶ�����-->
 
<!--��������-->

<!-- ���ĸ���-->

</div>
<!--β��-->
<div id="highlight1">
  <form name="newlette" method="post" action="RegisterServlet" onsubmit="return newlette_Validator()">

  <table border="0" width="900px">
  <tr><th colspan="2" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �û�ע��<br/>&nbsp; </th></tr>
	  <tr>
		  <td align="right" width="300px">
			�û���
		  </td>
	 
		  <td align="left">
			<input type="text" name="myusername" id="myusername" class="textbox" />
		  </td>
		  </tr>
	 <tr>
		   <td align="right">
			����
		  </td>
		  <td align="left">
			<input type="password" name="password" id="password" class="textbox" />
		  </td>
	  </tr>
	   <tr>
		  <td align="right">
			�ǳ�
		  </td>
		  <td align="left">
			<input type="text" name="nickname" id="nickname" class="textbox" />
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
			<input type="text" name="place" id="place" class="textbox" />
		  </td>
		   </tr>
	   <tr>
		   <td align="right">
			ѧԺ
		  </td>
		  <td align="left">
			<input type="text" name="insititute" id="insititute" class="textbox" />
		  </td>
	  </tr>
	  <tr>
		  <td align="right">
			רҵ
		  </td>
		  <td align="left">
			<input type="text" name="major" id="major" class="textbox" />
		  </td>
		   </tr>
	   <tr>
		   <td align="right">
			�༶
		  </td>
		  <td align="left">
			<input type="text" name="class" id="class" class="textbox" />
		  </td>
	  </tr>
	   <tr>
		   <td align="right">
			���Һ�
		  </td>
		  <td align="left">
			<input type="text" name="bedroom" id="bedroom" class="textbox" />
		  </td>
	  </tr>
	   <tr>
		  <td align="right">
			�ֻ���
		  </td>
		  <td align="left">
			<input type="text" name="mobile" id="mobile" class="textbox" />
		  </td>
		   </tr>
	   <tr>
		   <td align="right">
			QQ��
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
		  <input type="submit" name="submit"  value="�ύ" >
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" name="reset" value="����"/>
		  </td>
		  
	  </tr>
  </table>
  </form>
 
  <br class="spacer" />
</div>
<div id="footerbig">
<!--�ײ�-->
<div id="footer">
 
  </div>
</div>
</body>
</html>

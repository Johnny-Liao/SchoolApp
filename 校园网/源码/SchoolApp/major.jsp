<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>רҵר��</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/mainstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="header"> <img src="images/logo.gif" alt="" class="logo" />
  <h1></h1>
  <ul class="navi">
    <li><a href="ourindex.jsp" class="hover">��ҳ</a></li>
    <li><a href="major.jsp">רҵר��</a></li>
    <li><a href="organ.jsp">��֯ר��</a></li>
    <li><a href="blog.jsp">����ר��</a></li>
    <li><a href="match.jsp">����ר��</a></li>
	<li><a href="newstu.jsp">����ר��</a></li>
    <li><a href="school.jsp">У԰����</a></li>
    <li class="noborder"><a href="register.jsp">�û�ע��</a></li>
  </ul>

 <ul class="login">
     <!--<li><a href="#" class="sub">Subscribe</a></li>-->
    <li><a href="login.jsp" class="loginHer">Login</a></li>
  </ul>
</div>

<div id="botBody">

<!--��������-->
  <div class="subdiv">
    <p class="top">&nbsp;</p>
    <h2 class="moreServices">רҵר��</h2>
    <ul class="servi">
      <li><a href="ShowServlet?name=major&id=1">ũѧԺ</a></li>
      <li><a href="ShowServlet?name=major&id=2">԰��������ѧԺ</a></li>
      <li><a href="ShowServlet?name=major&id=3">�����ѧ����ѧԺ</a></li>
      <li><a href="ShowServlet?name=major&id=4">��ѧԺ</a></li>
      <li><a href="ShowServlet?name=major&id=5">���ù���ѧԺ</a></li>
      <li><a href="ShowServlet?name=major&id=6">���������Ϣ����ѧԺ</a></li>
	  <li><a href="ShowServlet?name=major&id=7">���ѧԺ</a></li>
      <li><a href="ShowServlet?name=major&id=8">������Դ�뻷��ѧԺ</a></li>
      <li><a href="ShowServlet?name=major&id=9">�����빫������ѧԺ</a></li>
      <li><a href="ShowServlet?name=major&id=10">ְҵʦ������ѧԺ</a></li>
      <li><a href="ShowServlet?name=major&id=11">��ѧԺ</a></li>
      <li><a href="ShowServlet?name=major&id=12">ʳƷ��ѧ�빤��ѧԺ</a></li>
	  <li><a href="ShowServlet?name=major&id=13">�����ѧ�빤��ѧԺ</a></li>
      <li><a href="ShowServlet?name=major&id=14">�����ѧԺ</a></li>
      <li><a href="ShowServlet?name=major&id=15">���˼����ѧԺ</a></li>
      <li><a href="ShowServlet?name=major&id=16">��������ѧԺ</a></li>
      <li><a href="ShowServlet?name=major&id=17">�ϲ���ѧԺ</a></li>
  </div>
<!-- ���ĸ���-->

  <div  style="float:left;width:700px;height:500px; border:white 1px solid;border-radius:5px;margin:10px 0px 0px 0px;" >
  <h3 align="left" style="width:700px;background-color:#c0c0c0;border-radius:5px;margin-bottom:10px;">�γ��б�</h3>
<iframe src="MajorServlet?id=${idinfo}" width="680px" height="450px" scrolling="[OPTION]" frameborder="x"name="main">
</iframe>
  </div>
  <br class="spacer" />
</div>
<!--β��-->
<div id="highlight">
 
  <br class="spacer" />
</div>
<div id="footerbig">
<!--�ײ�-->
<div id="footer">
 
  </div>
</div>
</body>
</html>

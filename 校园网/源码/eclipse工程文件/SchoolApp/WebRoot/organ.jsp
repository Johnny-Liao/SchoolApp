<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>��֯ר��</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/mainstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="header"> <img src="images/logo.gif" alt="" class="logo" />
  <h1>  </h1>
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
  <div class="subdiv">
    <p class="top">&nbsp;</p>
    <h2 class="moreServices">��֯ר��</h2>
    <ul class="servi1">
      <li><a href="ShowServlet?name=organ&id=1">ũѧԺ</a></li>
      <li><a href="ShowServlet?name=organ&id=2">԰��������ѧԺ</a></li>
      <li><a href="ShowServlet?name=organ&id=3">�����ѧ����ѧԺ</a></li>
      <li><a href="ShowServlet?name=organ&id=4">��ѧԺ</a></li>
      <li><a href="ShowServlet?name=organ&id=5">���ù���ѧԺ</a></li>
      <li><a href="ShowServlet?name=organ&id=6">���������Ϣ����ѧԺ</a></li>
	  <li><a href="ShowServlet?name=organ&id=7">���ѧԺ</a></li>
      <li><a href="ShowServlet?name=organ&id=8">������Դ�뻷��ѧԺ</a></li>
      <li><a href="ShowServlet?name=organ&id=9">�����빫������ѧԺ</a></li>
      <li><a href="ShowServlet?name=organ&id=10">ְҵʦ������ѧԺ</a></li>
      <li><a href="ShowServlet?name=organ&id=11">��ѧԺ</a></li>
      <li><a href="ShowServlet?name=organ&id=12">ʳƷ��ѧ�빤��ѧԺ</a></li>
	  <li><a href="ShowServlet?name=organ&id=13">�����ѧ�빤��ѧԺ</a></li>
      <li><a href="ShowServlet?name=organ&id=14">�����ѧԺ</a></li>
      <li><a href="ShowServlet?name=organ&id=15">���˼����ѧԺ</a></li>
      <li><a href="ShowServlet?name=organ&id=16">��������ѧԺ</a></li>
      <li><a href="ShowServlet?name=organ&id=17">�ϲ���ѧԺ</a></li>
    </ul>
	
  </div>
<!-- ���ĸ���-->
 <div  style="float:left;width:700px;height:500px; border:white 1px solid;border-radius:5px;margin:10px 0px 0px 0px;" >
  <h3 align="left" style="width:700px;background-color:#c0c0c0;border-radius:5px;margin-bottom:10px;">��֯�б�</h3>
<iframe src="OrganServlet?id=${idinfo}" width="680px" height="450px" scrolling="[OPTION]" frameborder="x"name="main">
</iframe>
  </div>
  <br class="spacer" />
</div>
<!--β��-->

<div id="footerbig">
<!--�ײ�-->
<div id="footer">
 
  </div>
</div>
</body>
</html>

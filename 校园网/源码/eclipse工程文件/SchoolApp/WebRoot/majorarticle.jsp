<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>��ʾҳ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/mainstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="header"> <img src="images/logo.gif" alt="" class="logo" />
  <h1>  </h1>
  <ul class="navi">
    <li><a href="#" class="hover">��ҳ</a></li>
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
    <li><a href="#" class="loginHer">Login</a></li>
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
  <div class="subdiv">
    <p class="top">&nbsp;</p>
    <h2 align="left">��������Ϣ</h2>
   <img src="images/higlight_h2.gif" width="200" height="150">
   <p align="left">���ߣ�<c:out value="${Majordis.author}"></c:out></p><br/>
   <p align="left">ʱ�䣺<c:out value="${Majordis.distime}"></c:out></p>
   <br/><br/><br/><br/>
    <p class="bot"></p>
  </div>
<!--�ڶ�����-->
 <div class="comdiv">
 <h4 align="center"style="margin:15px 0px 10px 0px;"><c:out value="${Majordis.title}"></c:out></h4>
 <p align="left" style="font-size:13px;line-height:26px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 <c:out value="${Majordis.text}"></c:out>
</p>
 </div>
<!--��������-->
 
<!-- ���ĸ���-->
 
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

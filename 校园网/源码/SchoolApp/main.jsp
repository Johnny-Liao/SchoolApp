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
			alert("���벻��Ϊ��");
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
    <li><a href="ourindex.jsp" class="hover" target="_blank">��ҳ</a></li>
    <li class="noborder"><a href="RenrenServlet?username=${Userinfo.myusername}" target="_blank">��������</a></li>
	<li class="noborder"><a href="friend/index.html">����</a></li>
  </ul>
  <form name="serach" method="post" action="#">
 <a href="#"><c:out value="${str}"></c:out></a>
  </form>

</div>
<div class="main">
	<!--�󲿿�ʼ-->
	<div class="left">
		<!--����ͷ�������-->
		<div class="top">
			<div><img src="images/a.jpg" height="95" width="95"></img></div>
			<div class="name"><c:out value="${Userinfo.nickname}"></c:out></div>
		</div>
		<div class="dh">�ҳ��õ�</div>
		<div class="midle">
				<li style="background:url(images/matter-logo1.gif) no-repeat left ;"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������</a></li>
				<li style="background:url(images/matter-logo2.gif) no-repeat left ;"><a href="AboutmeServlet?username=${Userinfo.myusername}" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����й�</a></li>
				<li style="background:url(images/matter-logo5.gif) no-repeat left ;"><a href="photo/index.jsp" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���</a></li>
				<li style="background:url(images/matter-logo4.gif) no-repeat left ;"><a href="MyblogServlet?username=${Userinfo.myusername}" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ҵĲ���</a></li>
			
		</div>
	</div>
	<!--�󲿽���-->
	<!--�м䵼��-->
	<div class="center">
		<div>
			<li><img src="images/centen1.gif"></li>
			<li><a href="#">��״̬</a></li>
			<li><img src="images/centen2.gif"></li>
			<li><a href="blogeditor.jsp?id=${Userinfo.id}" target="_blank">д����</a></li>
		</div><br/>
		<form name="shuoshuo" action="MyspeakServlet" method="post" onsubmit="return ini()">
		<div class="shuo"><textarea name="text" cols="75" rows="5">�����﷢��˵˵</textarea><br/>
		<input type="hidden" name="hidd" value="${Userinfo.myusername}">
		<input type="submit" value="�ύ">&nbsp;&nbsp;&nbsp;<input type="reset" value="����">
		</form>
		</div>
		<!--˵˵��ʾ-->
		 <Iframe src="ShuoshuoServlet" width="580px" height="320px" scrolling="[OPTION]" frameborder="x" name="main">
		</iframe>
		<!--<div id="list">
			<div style="float:left;margin-left:15px;"><img style="border-radius:5px;" src="images/higlight_h2.gif" width="50px" height="50px"/></div>
			<div style="float:left;margin:5px 0px 0px 8px;font-size:10px;color:#383838">������20:04 <br/>���� Android </div>
			<div style="float:left; background-color:#F0F0F0;width:555px;border-radius:3px;">
			<p style="font-size:12px;line-height:26px;color:#383838">
			������һ��Բ��������Ҫ������ʲô̬������Բ�Բ����������
			������һ��Բ��������Ҫ������ʲô̬������Բ�Բ����������
			������һ��Բ��������Ҫ������ʲô̬������Բ�Բ����������</p>
			</div>
		</div>-->
		<!--˵˵��ʾ����-->
	</div>
	
	<!--�Ҳ���ʼ-->
	<div class="right">
	<div class="friend">
		<li>վ�ڹ���</li>
		<a href="MajordisDelServlet?id=${Userinfo.id}"  target="_blank">����רҵ����</a><br/>
		<a href="#">�ҵ���֯</a><br/>
		<a href="upload.jsp" target="_blank">�������ļ��ϴ�</a>
	</div>
	<div class="friend">
		<li>��������</li>
		<a href="JoinServlet">������</a>
	</div>
	<div class="friend">
		<li>�����Ƽ�</li>
		<c:forEach items="${info}" var="mem">
			&nbsp;&nbsp;<a href="ShowmacthlistServlet?id=${mem.id}" target="_blank">${mem.matchtype}</a><br/>
		</c:forEach>
	</div>
	
	</div>
	<!--�Ҳ�����-->
</div>


<!--�ײ�-->
<div id="footer">

  </div>
</div>
</body>
</html>
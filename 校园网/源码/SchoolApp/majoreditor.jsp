<%@ page language="java" import="java.util.*" pageEncoding="gbk" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String id = request.getParameter("id"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>����ҳ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<link href="CSS/mainstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="fckeditor/fckeditor.js"></script>
<script type="text/javascript">
	function check() {
		if(document.blog.title.value.length == 0) {
			alert("���ⲻ��Ϊ��");
			document.blog.title.focus();
			return false;
		}
		if(document.blog.insititute.value.length == 0) {
			alert("Ժϵ����Ϊ��");
			document.blog.insititute.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
 <div id="mainHeader" >
  </div>
  <form name="blog" action="MajoreditorServlet" method="post" onsubmit="return check()">
  ���⣺<input type="text" name="title" />
 �γ̣�<select name="insititute">
  		<c:forEach items="${majorins}" var="mem">
  			<option value="${mem.id}">${mem.majorname}</option>
  		</c:forEach>
  	</select>
  	<script type="text/javascript">
  		var oFCKeditor = new FCKeditor('content');
  		oFCKeditor.BasePath = "/SchoolApp/fckeditor/";
  		oFCKeditor.Height = "500px";
  		oFCKeditor.Create();
  	</script>
  	<input type="submit" value="�ύ" />
  	<input type="hidden" name="id" value="<%=id%>"/>
 	<a href="ourindex.jsp">������ҳ</a>
  </form>
  
</body>
</html>

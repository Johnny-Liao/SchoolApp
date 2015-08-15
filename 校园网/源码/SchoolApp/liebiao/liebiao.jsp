<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>专业列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <div  style="float:left;width:600px;margin:10px 0px 0px 0px;" >
    <c:forEach items="${listinfo}" var="mem">
 		 <li align="left" style="font-size:16px;line-height:28px;margin:5px 0px 0xp 5px;">
  			<span><a href="ConcreteServlet?insititute=${mem}">${mem}</a></span>
  				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					<span style="float:right;margin-right:15px;">2014/3/29</span>
  		</li>
  	</c:forEach>

  </div>
</body>
</html>

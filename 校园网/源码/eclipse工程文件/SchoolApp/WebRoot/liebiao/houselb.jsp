<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>租房信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/mainstyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <div  style="float:left;width:600px;margin:10px 0px 0px 0px;" >
 <h1>房屋出租</h1>
  <table border="1">
  		<tr>
 			<td width="140px">房屋所有人</td>
 			<td width="350px">房屋所在地</td>
 			<td width="120px">租金/月</td>
 			<td width="140px">联系电话</td>
 			<td width="160px">发表时间</td>
 		</tr>
    <c:forEach items="${houseinfo}" var="mem">
 		<tr>
 			<td>${mem.housename}</td>
 			<td>${mem.houseplace}</td>
 			<td>${mem.housemoney}</td>
 			<td>${mem.housephone}</td>
 			<td>${mem.housetime}</td>
 		</tr>
  	</c:forEach>
 </table>
  </div>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 第四个框-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>发表页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<link href="CSS/mainstyle.css" rel="stylesheet" type="text/css" />
  <div  style="float:left;width:700px;height:500px; border:white 1px solid;border-radius:5px;margin:10px 0px 0px 0px;" >
  <table cellspacing="0px">
  <tr>
  <td align="left"><p style="font-weight:bold;color:#888888;line-height:28px;">比赛名：<c:out value="${mymatch.matchtype}"></c:out><br/>
  学院：<c:out value="${mymatch.insititute}"></c:out><br>
  </tr>
  <tr>
  <td colspan="2"><p align="left" style="font-size:18px;font-weight:bold;color:#888888;">比赛简介</p>
  <p align="left">
	<c:out value="${mymatch.servey}"></c:out>
</p>
  </td>
  </tr>
  <tr>
  <td>
  <a href="joinmatch.jsp?id=${mymatch.id}" target="_blank">我要报名</a>
  </td>
  </tr>
  </table>
 
  </div>
  <br class="spacer" />
</div>
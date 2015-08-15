<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 第四个框-->

  <div  style="float:left;width:700px;height:500px; border:white 1px solid;border-radius:5px;margin:10px 0px 0px 0px;" >
  <table cellspacing="0px">
  <tr>
  <td align="center" width="18%"><img src="${majorinfo}" width="100px" height="120px"></td>
  <td align="left"><p style="font-weight:bold;color:#888888;line-height:28px;">课程名：<c:out value="${majorinfo.majorname}"></c:out><br/>
  学院：<c:out value="${majorinfo.insititute}"></c:out><br>
  创建时间：<c:out value="${majorinfo.majortime}"></c:out></p></td>
  </tr>
  <tr>
  <td colspan="2"><p align="left" style="font-size:18px;font-weight:bold;color:#888888;">课程简介</p>
  <p align="left">
	<c:out value="${majorinfo.synopsis}"></c:out>
</p>
  </td>
  </tr>
  <tr>
  <td align="center" style="font-size:14px;margin-left:10px;">文章名
  </td>
  <td align="right">
  <span style="float:right;font-size:14px;">发表时间</span>
  </td>
  </tr>
  <c:forEach items="${list}" var="l">
  <tr>
  <td align="center" style="font-size:14px;margin-left:10px;"><a href="ArticleServlet?time=${l.distime}&title=${l.title}" target="_blank"><c:out value="${l.title}"></c:out></a>
  </td>
  <td>
   <span style="float:right;font-size:14px;"><c:out value="${l.distime}"></c:out></span>
  </td>
  </tr>
  </c:forEach>
  </table>
 
  </div>
  <br class="spacer" />
</div>
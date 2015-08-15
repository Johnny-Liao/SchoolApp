<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
request.setCharacterEncoding("gbk");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 第四个框-->

  <div  style="float:left;width:700px;height:500px; border:white 1px solid;border-radius:5px;margin:10px 0px 0px 0px;" >
  <table cellspacing="0px">
  <tr>
  <td align="center" width="18%"><img src="${organshow.image}" width="100px" height="120px"></td>
  <td align="left"><p style="font-weight:bold;color:#888888;line-height:28px;">组织名：<c:out value="${organshow.name}"></c:out><br/>
  学院：<c:out value="${organshow.insititute}"></c:out><br>
  创建时间：<c:out value="${organshow.organtime}"></c:out></p></td>
  </tr>
  <tr>
  <td colspan="2"><p align="left" style="font-size:18px;font-weight:bold;color:#888888;">组织简介</p>
  <p align="left">
	<c:out value="${organshow.servey}"></c:out>
</p>
  </td>
  </tr>
  <tr>
  <td align="center" style="font-size:14px;margin-left:10px;">主要成员
  </td>
  <td align="right">
  <span style="float:right;font-size:14px;">职务</span>
  </td>
  </tr>
  <c:forEach items="${showorgan}" var="l">
  <tr>
  <td align="center" style="font-size:14px;margin-left:10px;"><c:out value="${l['myname']}"></c:out>
  </td>
  <td>
   <span style="float:right;font-size:14px;"><c:out value="${l['job']}"></c:out></span>
  </td>
  </tr>
  </c:forEach>
  
  </table>
 <a href="joinorgan.jsp?id=${organshow.id}" target="_blank">我要加入</a>
  </div>
  <br class="spacer" />
</div>
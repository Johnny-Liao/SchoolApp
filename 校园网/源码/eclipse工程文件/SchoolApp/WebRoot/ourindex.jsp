<%@ page language="java" import="java.util.*" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>����ũ��У԰��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<link href="CSS/mainstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function housecheck() {
		if(document.houseinfo.house.value.length == 0) {
			alert("���벻��Ϊ��");
			document.houseinfo.house.focus();
			return false;
		}
		return true;
	}
</script>
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

	<!-- ������ ��ʾ��-->

 <ul class="login">
    <li><a href="login.jsp" class="loginHer">Login</a></li>
  </ul>
</div>
<!--��ɫ�Ŀ�-->
<div id="special">
  <h2 class="spea"></h2>
  <a href="#" class="spe2007"></a>
  <dl>
    <dt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�Žᡢ�ڷܡ���ʵ������</dt>
    <dt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ӻ��£�С�˻��������ӻ��̣�С�˻���</dt>
    <dt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ʤ����Ұ����ʤ����ʷ�����ʱ��Ȼ�����</dt>
    <dt></dt>
    <dt> </dt>
  </dl>
  <br class="spacer" />
</div>
<!--��һ����-->
<div id="botBody">
  <div class="subdiv">
    <p class="top">&nbsp;</p>
    <h2>�����û�����</h2>
    <form name="login" method="post" action="LoginServlet">
      <label>�û���</label>
      <input type="text" name="username" value="" class="textbox" />
      <label>����</label>
      <input type="password" name="password" value="" class="textbox" />
      <input type="submit" name="submit" value="" class="loginbut" />
      <br class="spacer" />
    </form>
    <p class="bot"></p>
  </div>
<!--�ڶ�����-->
  <div class="subdiv">
    <p class="top">&nbsp;</p>
    <h2 class="event">���ǵ�����</h2>
    <div class="subdiv1"> <img src="images/pic.gif" alt="" />
      <h3>10.06.07</h3>
      <h4>���ǵ�����</h4>
      <p>���ǵ�����r</p>
      <br class="spacer" />
    </div>

    <div class="subdiv1"> <img src="images/pic2.gif" alt="" />
      <h3>18.06.07</h3>
      <h4>���ǵ�����</h4>
      <p>���ǵ�����</p>
      <br class="spacer" />
    </div>
    <p class="more marTop"><a href="#">more</a></p>
    <p class="bot">&nbsp;</p>
  </div>
<!--��������-->
  <div class="subdiv">
    <p class="top">&nbsp;</p>
    <h2 class="moreServices">��������</h2>
    <ul class="servi">
      <li><a href="http://news.qndb.net/">��ѧ�� </a></li>
      <li><a href="http://www.jxau.edu.cn/">����ũҵ��ѧ��ҳ </a></li>
      <li><a href="http://jwgl.jxau.edu.cn/user/login">����ϵͳ���� </a></li>
      <li><a href="http://218.95.3.135/eol/homepage/common/opencourse/">�����ѧƽ̨ </a></li>
      <li><a href="http://www.unjs.com/kaoyan/beizhan/">�������</a></li>
      <li><a href="http://www.hjenglish.com/">����Ӣ��</a></li>
      <li><a href="http://open.163.com/cuvocw/">���׹�����</a></li>
      <li><a href="http://open.163.com/cuvocw/">ũ������</a></li>
    </ul>
    <p class="bot">&nbsp;</p>
  </div>
<!-- ���ĸ���-->
  <div class="subdiv2">
    <p class="top">&nbsp;</p>
    <h2 class="testi">�ഺ</h2>
    <h4><strong>�绪��ï</strong></h4>
    <h4 class="green">��������</h4>
    <p class="text">���鱼��</p>
    <p class="text">���鱼��</p>
    <p class="text">�趯���ഺ</p>
    <p class="text">�궯���ഺ</p>
    <p class="text">�϶����ഺ</p>
    <h4><strong>��ת���ഺ</strong></h4>
    <p class="bot">&nbsp;</p>
  </div>
  <br class="spacer" />
</div>
<!--β��-->
<div id="highlight">
  <form name="houseinfo" method="post" action="HouseServlet" target="_blank" onsubmit="return housecheck()">
    <p class="top">&nbsp;</p>
    <h2>�ⷿ��Ϣ</h2>
    <label>�����ⷿ�ص�</label>
    <input type="text" name="house" value="" class="textbox" />
    <input type="submit" name="submit" value="" class="singup" />
    <p class="bot">&nbsp;</p>
  </form>
  <h2 class="hight">Happy</h2>
  <h3>�Һܿ���</h3>
  <p class="text">����ܴ� </p>
  <p class="text">ʱ����ĺܿ�</p>
  <br class="spacer" />
</div>
<div id="footerbig">
<!--�ײ�-->
<div id="footer">
  </div>
</div>
</body>
</html>

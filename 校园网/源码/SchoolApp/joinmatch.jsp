<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String id = request.getParameter("id");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.0 transitional//EN">
<HTML>
<HEAD>
<TITLE>����������</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<META content="MSHTML 6.00.3790.0" name=GENERATOR>
<script type="text/javascript" src="JS/checkQuestionjs.js"></script>
<link href="CSS/mainstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function check() {
		if(document.matchlist.title.value.length==0) {
			alert("��Ʒ����Ϊ��");
			document.matchlist.title.focus();
			return false;
		}
		if(document.matchlist.person1.value.length==0) {
			alert("������Ϊ��");
			document.matchlist.person1.focus();
			return false;
		}
		if(document.matchlist.tel.value.length==0) {
			alert("��ϵ��ʽ��Ϊ��");
			document.matchlist.tel.focus();
			return false;
		}
		if(document.matchlist.insititute.value.length==0) {
			alert("ѧԺ��Ϊ��");
			document.matchlist.insititute.focus();
			return false;
		}
		if(document.matchlist.ourwork.value.length==0) {
			alert("�ֹ������Ϊ��");
			document.matchlist.ourwork.focus();
			return false;
		}
		return true;
	}
</script>
</HEAD>
<BODY oncontextmenu="return false" style="margin:10px">

<style>
	table{margin-right:auto; margin-left:auto; }
	body{TEXT-ALIGN: center;}
	td{font-size:12px;padding:2px 5px 2px 5px;}
	.padding td{font-size:12px;padding:0px 0px 0px 0px;}
	.btnButton{text-align:left;padding-top:10px;}
	.firstTd{padding-left:5px;text-align:left; border:0px;background:#f5f5f5;height:25px;font-weight:bold}
	.border{border:1px solid #b5cfd9;}
	.border1{border-left:1px solid #b5cfd9;}
	.border2{border-right:1px solid #b5cfd9;}
	.border3{border-top:1px solid #b5cfd9;border-right:1px solid #b5cfd9;}
	.border4{border-top:1px solid #b5cfd9;}
</style>
<div id="mainHeader" >
</div>
<div class="main1">
<!-- CHECK STEP0 -->
<form name="matchlist" method="post" action="JoinmatchServlet" onsubmit="return check()" style="margin:0px;padding:0px"> 
<table class="padding datatable" id="datatable" style="line-height: 150%;border-collapse:collapse;margin-top:0px;padding:0px;margin-right:auto; margin-left:auto; background:white;" cellspacing=0 cellpadding=0 bordercolor=#b5cfd9 border=1 width=780px>
	<tr><td class="firstTd" colspan="2">������Ʒ��Ϣ</span></td></tr>
	<tr >
	<td>������Ʒ����</td>
	<td><input type="text" name="title" id="title"  size="35" /></td>
	<input type="hidden" name="matchid" value="<%=id%>">
	</tr>
		
	<tr>
		<td width="20%">������Ʒ��ϵ�˼���ϵ��ʽ</td>
		<td>
			<table id="datatable" style="line-height: 150%;border-collapse:collapse;margin-top:0px;padding:0px;margin-right:auto; margin-left:auto; background:white;"  cellspacing=0 border=0 cellpadding=0 width=100%>
				<tr >
					<td class="border2" >��  ��</td>
					<td class="border2" ><input type="text" name="person1" id="person1" size="15" /></td>
					<td class="border2" >��ϵ��ʽ</td>
					<td class="border2" ><input type="text" name="tel" id="tel"  size="15" /></td>
					<td class="border2" >ѧԺ</td>
					<td  ><input type="text" name="insititute" id="insititute"  size="24" /></td>
				</tr>
				<tr >
					<td class="border3" >ָ����ʦ</td>
					<td class="border3" ><input type="text" name="teacher" id="teacher"  size="15" /></td>
					<td class="border3"  >��ע</td>
					<td class="border4"  colspan="3" ><input type="text" name="remarks" id="remarks" size="52" /></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>ͬ��������Ա����</td>
	</tr>
	<tr>
		<td><input type=text" name="person2"></td>
	</tr>
	<tr>
		<td><input type=text" name="person3"></td>
	</tr>
	<tr>
		<td><input type=text" name="person4"></td>
	</tr>
	<tr>
		<td><input type=text" name="person5"></td>
	</tr>
	<tr>
		<td colspan=2>������Ϣ</td>
	</tr>
	<tr>
		<td colspan=2>
		�ֹ����
		<textarea cols=90 rows=4 name="ourwork" id="ourwork"></textarea>
		</td>
	</tr>
</table>
			
<table cellSpacing=0 cellPadding=0 width="780px" borderColor=#99bbdd border=0>
	<tr><td class="btnButton" align="left">
		<input type="submit"  value="�ύ" class=inputsubmit />
   </td></tr>
</table>
</form>
</div>
</BODY>
</HTML>



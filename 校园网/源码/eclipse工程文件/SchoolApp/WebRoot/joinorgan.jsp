<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String id = request.getParameter("id");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.0 transitional//EN">
<HTML>
<HEAD>
<TITLE>��֯�����</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
<META content="MSHTML 6.00.3790.0" name=GENERATOR>
<script type="text/javascript" src="JS/checkQuestionjs.js"></script>
<link href="CSS/mainstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function check() {
		if(document.organ.myname.value.length==0) {
			alert("����������");
			document.organ.myname.focus();
			return false;
		}
		if(document.organ.mysex.value.length==0) {
			alert("�������Ա�");
			document.organ.mysex.focus();
			return false;
		}
		if(document.organ.myinsititute.value.length==0) {
			alert("������ѧԺ");
			document.organ.myinsititute.focus();
			return false;
		}
		if(document.organ.myclass.value.length==0) {
			alert("�༶������4λ����");
			document.organ.myclass.focus();
			return false;
		}
		if(document.organ.mybedroom.value.length==0) {
			alert("���Һű�����4λ����");
			document.organ.mybedroom.focus();
			return false;
		}
		if(document.organ.mytel.value.length==0) {
			alert("������绰");
			document.organ.mytel.focus();
			return false;
		}
		if(document.organ.mysex.value.length==0) {
			alert("�������Ա�");
			document.organ.mysex.focus();
			return false;
		}
		if(document.organ.myqq.value.length==0) {
			alert("������QQ");
			document.organ.myqq.focus();
			return false;
		}
		if(document.organ.myaccount.value.length==0) {
			alert("��������������");
			document.organ.myaccount.focus();
			return false;
		}
		if(document.organ.myappraise.value.length==0) {
			alert("��������������");
			document.organ.myappraise.focus();
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
<form name="organ" method="post" action="JoinorganServlet" onsubmit="return check()" style="margin:0px;padding:0px"> 
<table class="padding datatable" id="datatable" style="line-height: 150%;border-collapse:collapse;margin-top:0px;padding:0px;margin-right:auto; margin-left:auto; background:white;" cellspacing=0 cellpadding=0 bordercolor=#b5cfd9 border=1 width=780px>
	<tr><td class="firstTd" colspan="2">������Ϣ</span></td></tr>
	<tr >
	<td>��֯���</td>
	<td><input type="text" name="zzid" id="zzid"  size="35" value="<%=id %>" disabled="true"/></td>
	</tr>
		<input type="hidden" name="organid" id="organid" value="<%=id%>">
	<tr>
		<td width="20%">��ϵ��ʽ</td>
		<td>
			<table id="datatable" style="line-height: 150%;border-collapse:collapse;margin-top:0px;padding:0px;margin-right:auto; margin-left:auto; background:white;"  cellspacing=0 border=0 cellpadding=0 width=100%>
				<tr >
					<td class="border2" >��  ��</td>
					<td class="border2" ><input type="text" name="myname" id="myname" size="15" /></td>
					<td class="border2" >��  ��</td>
					<td class="border2" ><input type="text" name="mysex" id="mysex"  size="15" /></td>
					<td class="border2" >ѧ  Ժ</td>
					<td  ><input type="text" name="myinsititute" id="myinsititute"  size="24" /></td>
				</tr>
				<tr >
					<td class="border3" >��  ��</td>
					<td class="border3" ><input type="text" name="myclass" id="myclass"  size="15" /></td>
					<td class="border3"  >���Һ�</td>
					<td class="border4"  colspan="3" ><input type="text" name="mybedroom" id="mybedroom" size="52" /></td>
				</tr>
				<tr>
					<td class="border3" >�绰</td>
						<td class="border3" ><input type="text" name="mytel" id="mytel"  size="15" /></td>
					<td class="border3" >QQ</td>
						<td class="border3" ><input type="text" name="myqq" id="myqq"  size="15" /></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan=2>������Ϣ</td>
	</tr>
	<tr>
		<td colspan=2>
		��������
		<textarea cols=90 rows=4 name="myaccount" id="myaccount"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan=2>
		��������
		<textarea cols=90 rows=4 name="myappraise" id="myappraise"></textarea>
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



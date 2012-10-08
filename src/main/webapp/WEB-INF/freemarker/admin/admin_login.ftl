<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>管理员登录</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="${rc.getContextPath()}/css/admin_style.css">
		<script language="javascript">
<!--
function checkForm()
{
	if(document.adminLogin.adminPassword.value == "")
	{
		alert("请输入密码！");
		document.adminLogin.adminPassword.focus();
		return false;
	}
	/**
	if (document.Login.CheckCode.value==""){
       alert ("请输入您的验证码！");
       document.Login.CheckCode.focus();
       return(false);
    }*/
    document.adminLogin.submit();
}

//-->
</script>
		<style type="text/css">
<!--
.style1 {
	color: #000000
}

BODY {
	FONT-FAMILY: "宋体";
	FONT-SIZE: 12px;
	text-decoration: none;
	line-height: 150%;
	background-color: #D6DFF7;
	text-decoration: none;
	SCROLLBAR-FACE-COLOR: #799ae1;
	MARGIN: 0px;
	FONT: 12px 宋体;
	SCROLLBAR-HIGHLIGHT-COLOR: #799ae1;
	SCROLLBAR-SHADOW-COLOR: #799ae1;
	SCROLLBAR-3DLIGHT-COLOR: #799ae1;
	SCROLLBAR-ARROW-COLOR: #ffffff;
	SCROLLBAR-TRACK-COLOR: #aabfec;
	SCROLLBAR-DARKSHADOW-COLOR: #799ae1
}

TD {
	FONT-FAMILY: "宋体";
	FONT-SIZE: 9pt;
}

Input {
	FONT-SIZE: 9pt;
	HEIGHT: 20px;
}
-->
</style>
	</head>
	<body class="bgcolor">

		<p>
			&nbsp;
		</p>
		<form name="adminLogin" action="${rc.getContextPath()}/admin/login/do" method="post">
			<table width="585" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="280" rowspan="2">
						<div align="right">
							<img src="${rc.getContextPath()}/images/admin/exblog.gif" width="180" height="83">
						</div>
					</td>
					<td width="344" background="${rc.getContextPath()}/images/entry2.gif">
						<table width="100%" border="0" cellspacing="8" cellpadding="0"
							align="center">
							<tr align="center">
								<td height="38" colspan="2" class="style1">
									<font size="3"><strong>管理员登录</strong>
									</font>
								</td>
							</tr>
							<tr>
								<td align="right">
									<span class="style1">管理员密码：</span>
								</td>
								<td>&nbsp;
									<input type="password" name="adminPassword" maxlength="20"
										cssStyle="width: 160px; border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1"
										onmouseover="this.style.background='#D6DFF7';"
										onmouseout="this.style.background='#FFFFFF'"
										onfocus="this.select(); "/>
								</td>
							</tr>
							
							<tr>
								<td align="right">
									<span class="style1">验&nbsp;&nbsp;证&nbsp;&nbsp;码：</span>
								</td>
								<td>&nbsp;
									<input type=text name="validatecode" maxlength="20"
										cssStyle="width: 100px; border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1"
										onmouseover="this.style.background='#D6DFF7';"
										onmouseout="this.style.background='#FFFFFF'"
										onfocus="this.select(); "/>
								</td>
							</tr>

							<tr>
								<td colspan="2">
									<div align="center">
										<input  name="formsubmit" type="button" value="登录" onclick="checkForm();"/>
										&nbsp;
										<br>
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="3">&nbsp;</td>
				</tr>
			</table>
			<p align="center">
				后台管理页面需要屏幕分辨率为
				<font color="#FF0000"><strong>1024*768</strong>
				</font> 或以上才能达到最佳浏览效果！
				<br>
				需要浏览器为
				<strong><font color="#FF0000"> </font>
				</strong><font color="#FF0000"><strong>IE5.5</strong>
				</font> 或以上版本才能正常运行！！！
			</p>
		</form>
	</body>
</html>


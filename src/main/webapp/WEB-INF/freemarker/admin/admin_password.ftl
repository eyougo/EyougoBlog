<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改后台管理密码</title>
</head>
<link rel="stylesheet" href="${rc.getContextPath()}/css/admin_style.css">
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0" class="bgcolor">
<s:actionmessage theme="eyougo"/>
<center>
<form name="adminPasswordForm" method="post" action="${rc.getContextPath()}/admin/password">
  <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border tablebg">
    <tr>
      <th class="topbg" colspan="2"><a href="#u"></a>后台管理密码</th>
    </tr>
	<tr>
      <td class="tdbg" width="40%"><div align="right">原密码：</div></td>
      <td class="tdbg"><input type="password" name="formerPassword" value="" /></td>
    </tr>
    <tr>
      <td class="tdbg"><div align="right">新密码（6到20个字节）：</div></td>
      <td class="tdbg"><input type="password" name="adminPassword" value="" /></td>
    </tr>
	<tr>
      <td class="tdbg"><div align="right">密码确认（6到20个字节，与新密码相同）：</div></td>
      <td class="tdbg"><input type="password" name="verifyAdminPassword" value="" /></td>
    </tr>
    <tr>
      <td height="20" colspan="2" class="tdbg">
    	<div align="center">
    		<input type="submit" name="Submit" value="提交">
 	    </div>
   	  </td>
    </tr>
   </table>
</form>
</center>
</body>
</html>

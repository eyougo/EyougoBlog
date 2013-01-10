<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link rel="stylesheet" href="${rc.getContextPath()}/css/admin_style.css"/>
<title>日志管理</title>
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0" class="bgcolor">
<center>
<form action="${rc.getContextPath()}/admin/config" method="post">
  <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border tablebg">
    <tr>
      <th class="topbg" colspan="2"><a href="#s"></a>站点</th>
      </tr>
    <tr>
      <td class="tdbg" width="350" align="right">站点名称（最多50个字节）：</td>
      <td class="tdbg"><input type="text" name="blogName" value="${BLOGNAME}" size="50"/></td>
    </tr>
    <tr>
      <td class="tdbg" align="right">博客标题（最多50个字节）：</td>
      <td class="tdbg"><input type="text" name="blogTitle" value="${BLOGTITLE}" size="50"/></td>
    </tr>
    <tr>
      <td class="tdbg" align="right">站点版权信息（支持HTML）：</td>
      <td class="tdbg"><textarea name="blogCopyright" cols="50" rows="5">${BLOGCOPYRIGHT}</textarea></td>
    </tr>
    <tr>
      <th class="topbg" colspan="2"><div align="center"><a name="blog" id="blog"></a>日志</div></th>
    </tr>
    <tr>
      <td class="tdbg" align="right">日志原创标记（支持HTML）：</td>
      <td class="tdbg"><textarea name="originalNote"cols="50" rows="5">${ORIGINALNOTE}</textarea></td>
    </tr>
    <tr>
      <td class="tdbg" colspan="2"><div align="center">
        <input type="submit" name="Submit" value="提交">
      </div></td>
      </tr>
  </table>
</form>
</center>
</body>
</html>
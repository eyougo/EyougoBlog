<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>关于管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link rel="stylesheet" href="${rc.getContextPath()}/css/admin_style.css"/>
<script src="http://lib.sinaapp.com/js/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="${rc.contextPath}/fckeditor/fckeditor.js"/>"> </script> 
<script type="text/javascript"> 
$(
	function() { 
		var sBasePath = "${rc.contextPath}/fckeditor/";  //获得fckeditor的路径 		
		var oFCKeditor = new FCKeditor( 'aboutMe' ) ; 
		oFCKeditor.BasePath = sBasePath ; 
		oFCKeditor.Width = "70%";
		oFCKeditor.Height = "200px";
		oFCKeditor.ToolbarSet = "BlogSummary";
		oFCKeditor.ReplaceTextarea() ; 
		var obFCKeditor = new FCKeditor( 'aboutSite' ) ; 
		obFCKeditor.Width = "70%";
		obFCKeditor.Height = "200px";
		obFCKeditor.ToolbarSet = "BlogSummary";
		obFCKeditor.BasePath = sBasePath ; 
		obFCKeditor.ReplaceTextarea() ;
	} 
);
</script>
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0" class="bgcolor">
<center>
<form action="${rc.getContextPath()}/admin/about" method="post">
  <table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" class="border tablebg">
    <tr>
      <th class="topbg" colspan="2"><a href="#s"></a>基本信息</th>
    </tr>
    <tr>
      <td class="tdbg" width="350" align="right">Gravatar头像用户名：</td>
      <td class="tdbg"><input type="text" name="aboutGavatar" value="${aboutGravatar}" size="50"/></td>
    </tr>
    <#list 0..5 as i>
    <tr>
      <td class="tdbg" width="350" align="right"><input type="text" style="width:120px;" name="baseId${i}" value="<#if ('baseId'+i)?eval??>${('baseId'+i)?eval}</#if>" size="50"/>：</td>
      <td class="tdbg"><input type="text" name="baseAboutValue${i}" value="<#if ('baseAboutValue'+i)?eval??>${('baseAboutValue'+i)?eval?html}</#if>" size="50"/></td>
    </tr>
    </#list>
    <tr>
      <th class="topbg" colspan="2"><div align="center"><a name="blog" id="blog"></a>关于我</div></th>
    </tr>
    <tr>
      <td class="tdbg" align="right">个人简介：</td>
      <td class="tdbg"><textarea name="aboutMe" id="aboutMe" cols="50" rows="5">${aboutMe?html}</textarea></td>
    </tr>
     <tr>
      <th class="topbg" colspan="2"><div align="center"><a name="blog" id="blog"></a>关于本站</div></th>
    </tr>
    <tr>
      <td class="tdbg" align="right">本站简介：</td>
      <td class="tdbg"><textarea name="aboutSite" id="aboutSite" cols="50" rows="5">${aboutSite?html}</textarea></td>
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
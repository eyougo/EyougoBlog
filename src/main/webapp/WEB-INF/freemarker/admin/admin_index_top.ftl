<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易游国后台管理页面</title>
<style type="text/css">
a:link { color:#000000;text-decoration:none}
a:hover {color:#666666;}
a:visited {color:#000000;text-decoration:none}

td {FONT-SIZE: 9pt;COLOR: #000000; FONT-FAMILY: "宋体"}
img {filter:Alpha(opacity:100); chroma(color=#FFFFFF)}
.STYLE1 {color: #FF0000}
</style>
<base target="main">
<script>
function preloadImg(src)
{
	var img=new Image();
	img.src=src;
}
preloadImg("${rc.getContextPath()}/images/admin/admin_top_open.gif");

var displayBar=true;
function switchBar(obj)
{
	if (displayBar)
	{
		parent.frame.cols="0,*";
		displayBar=false;
		obj.src="${rc.getContextPath()}/images/admin/admin_top_open.gif";
		obj.title="打开左边管理菜单";
	}
	else{
		parent.frame.cols="180,*";
		displayBar=true;
		obj.src="${rc.getContextPath()}/images/admin/admin_top_close.gif";
		obj.title="关闭左边管理菜单";
	}
}
</script>
</head>

<body background="${rc.getContextPath()}/images/admin/admin_top_bg.gif" leftmargin="0" topmargin="0">
<table height="100%" width="100%" border=0 cellpadding=0 cellspacing=0>
  <tr valign=middle> 
    <td width=44> <img onClick="switchBar(this)" src="${rc.getContextPath()}/images/admin/admin_top_close.gif" title="关闭左边管理菜单" style="cursor:hand"> 
    </td>
    <td width=37> <img src="${rc.getContextPath()}/images/admin/admin_top_icon_1.gif"> </td>
    <td width=112> <a href="http://www.eyougo.com" target=_blank >易游国博客公告: </a></td>
	<td width="315">
	</td>
	<td width="120" align="right"><div align="center"><a href="http://www.eyougo.com" target="_blank" title="易游国博客使用和JAVA技术交流"><span class="STYLE1">易游国博客</span></a>&nbsp;&nbsp;<a href="${rc.getContextPath()}" target="_blank">站点首页</a></div></td>
  </tr>
</table>
</body>
</html>

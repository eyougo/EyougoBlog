<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理导航</title>
<STYLE type=text/css>
BODY {
	SCROLLBAR-FACE-COLOR: #799ae1; BACKGROUND: #799ae1; MARGIN: 0px; FONT: 12px 宋体; SCROLLBAR-HIGHLIGHT-COLOR: #799ae1; SCROLLBAR-SHADOW-COLOR: #799ae1; SCROLLBAR-3DLIGHT-COLOR: #799ae1; SCROLLBAR-ARROW-COLOR: #ffffff; SCROLLBAR-TRACK-COLOR: #aabfec; SCROLLBAR-DARKSHADOW-COLOR: #799ae1
}
TABLE {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px
}
TD {
	FONT: 12px 宋体
}
IMG {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; VERTICAL-ALIGN: bottom; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px
}
A {
	FONT: 12px 宋体; COLOR: #000000; TEXT-DECORATION: none
}
A:hover {
	COLOR: #428eff; TEXT-DECORATION: underline
}
.sec_menu {
	BORDER-RIGHT: white 1px solid; BACKGROUND: #d6dff7; OVERFLOW: hidden; BORDER-LEFT: white 1px solid; BORDER-BOTTOM: white 1px solid
}
.menu_title {
	
}
.menu_title SPAN {
	FONT-WEIGHT: bold; LEFT: 8px; COLOR: #215dc6; POSITION: relative; TOP: 2px
}
.menu_title2 {
	
}
.menu_title2 SPAN {
	FONT-WEIGHT: bold; LEFT: 8px; COLOR: #428eff; POSITION: relative; TOP: 2px
}
</STYLE>
<SCRIPT language=javascript1.2>
function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
}
}
</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<BODY leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<table width=100% cellpadding=0 cellspacing=0 border=0 align=left>
    <tr>
  <td valign=top class="menu_title2"> 
    <table width=158 border="0" align=center cellpadding=0 cellspacing=0>
  <tr>
    <td height=42 valign=bottom>
	  <img src="${rc.getContextPath()}/images/admin/extitle.gif" width=158 height=38>
    </td>
  </tr>
</table>
<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td height="25" class="menu_title" background="${rc.getContextPath()}/images/admin/title_bg_quit.gif" id="menuTitle0"> 
          <span><a href="${rc.getContextPath()}/admin/index/main"" target="main"><b>管理首页</b></a> | <a href="" target="_top"><b>退出</b></a></span> 
        </td>
  </tr>
  <tr>
    <td style="display:" id='submenu0'>
<div class=sec_menu style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=130>
<tr>
                <td height=20>站点名：${blogName}</td>
              </tr>
</table>
</div>
<div  style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=130>
<tr><td height=20></td></tr>
</table>
</div>
	</td>
  </tr>
</table>
<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td height="25" class="menu_title"  background="${rc.getContextPath()}/images/admin/admin_left_2.gif" id="menuTitle4" onClick="showsubmenu(1)" style="cursor:hand;"> 
          <span>基本设置</span> </td>
  </tr>
  <tr>
    <td style="display:display" id='submenu1'>
<div class=sec_menu style="width:158">
            <table width=130 align=center cellpadding=0 cellspacing=0 >
              <tr>
                <td height=20 width=15><img src="${rc.getContextPath()}/images/admin/bullet.gif"></td>
                <td><a href="${rc.getContextPath()}/admin/config" target="main">博客站点设置</a></td>
              </tr>
			  <tr>
                <td height=20><img src="${rc.getContextPath()}/images/admin/bullet.gif"></td>
                <td><a href="${rc.getContextPath()}/admin/password" target="main">后台密码设置</a></td>
              </tr>
			</table>
	  </div>
<div  style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=130>
<tr><td height=20></td></tr>
</table>
</div>
	</td>
  </tr>
</table>
<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td height="25" class="menu_title" background="${rc.getContextPath()}/images/admin/admin_left_1.gif" id="menuTitle4" onClick="showsubmenu(2)" style="cursor:hand;"> 
          <span>日志相关</span> </td>
  </tr>
  <tr>
    <td style="display:none;" id='submenu2'>
	<div class=sec_menu style="width:158" >
            <table width=130 align=center cellpadding=0 cellspacing=0>
              <tr>
                <td height=20><img src="${rc.getContextPath()}/images/admin/bullet.gif"></td>
                <td><a href="${rc.getContextPath()}/admin/blog/add" target="main">添加博客日志</a></td>
              </tr>
              <tr>
                <td height=20><img src="${rc.getContextPath()}/images/admin/bullet.gif"></td>
                <td><a href="${rc.getContextPath()}/admin/blog/list" target="main">管理博客日志</a></td>
              </tr>
              <tr>
                <td width="15" height=20><img src="${rc.getContextPath()}/images/admin/bullet.gif"></td>
                <td><a href="${rc.getContextPath()}/admin/category/add" target="main">添加日志分类</a></td>
              </tr>
              <tr>
                <td width="15" height=20><img src="${rc.getContextPath()}/images/admin/bullet.gif"></td>
                <td><a href="${rc.getContextPath()}/admin/category/list" target="main">管理日志分类</a></td>
              </tr>
			</table>
	  </div>

<div  style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=130>
<tr><td height=20></td></tr>
</table>
</div>
	</td>
  </tr>
</table>
<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td height=25 class=menu_title background="${rc.getContextPath()}/images/admin/admin_left_1.gif" id=menuTitle4 onClick="showsubmenu(5)" style="cursor:hand;"> 
          <span>友情连接</span> </td>
  </tr>
  <tr>
    <td style="display:none;" id='submenu5'>
<div class=sec_menu style="width:158">
            <table width=130 align=center cellpadding=0 cellspacing=0 >
              <tr>
                <td width="15" height=20><img src="${rc.getContextPath()}/images/admin/bullet.gif"></td>
                <td><a href="${rc.getContextPath()}/admin/link/add" target="main">添加友情连接</a></td>
              </tr>
              <tr>
                <td height=20><img src="${rc.getContextPath()}/images/admin/bullet.gif"></td>
                <td><a href="${rc.getContextPath()}/admin/link/list" target="main">友情连接管理</a></td>
              </tr>	   
			  </table>
	  </div>
	  <div  style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=130>
<tr><td height=20></td></tr>
</table>
</div>
	</td>
  </tr>
</table>
<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td height=25 class=menu_title background="${rc.getContextPath()}/images/admin/admin_left_1.gif" id=menuTitle4 onClick="showsubmenu(7)" style="cursor:hand;"> 
          <span>其他管理</span> </td>
  </tr>
  <tr>
    <td style="display:none;" id='submenu7'>
<div class=sec_menu style="width:158">
            <table width=130 align=center cellpadding=0 cellspacing=0 >
              <tr>
                <td height=20><img src="${rc.getContextPath()}/images/admin/bullet.gif"></td>
                <td><a href="admin_Cmt.asp?action=show" target="main">日志评论管理</a></td>
              </tr>
              <tr>
                <td height=20><img src="${rc.getContextPath()}/images/admin/bullet.gif"></td>
                <td><a href="Admin_Msg.asp?action=show" target="main">博客留言管理</a></td>
              </tr>
			  </table>
	  </div>
	  
	  <div  style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=130>
<tr><td height=20></td></tr>
</table>
</div>
	</td>
  </tr>
</table>
<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td height=25 class=menu_title background="${rc.getContextPath()}/images/admin/admin_left_9.gif" id=menuTitle9> 
          <span>关于</span> </td>
  </tr>
  <tr>
    <td>
<div class=sec_menu style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=130>
<tr>
  <td height=20><br>
    <b>CopyRight：</b><br>${blogName}
      <br>
                  <b>Power：</b><br><a href="http://www.eyougo.com" target="_blank">EyouGo Blog ${version}</a><br>
                <br>
				
				</td>
</tr>
</table>
	  </div>
	</td>
  </tr>
</table>
</body>
</html>

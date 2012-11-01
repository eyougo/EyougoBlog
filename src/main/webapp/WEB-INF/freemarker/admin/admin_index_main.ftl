<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理首页</title>
<link rel="stylesheet" href="${rc.getContextPath()}/css/admin_style.css">
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0" class="bgcolor">
<br>
<table width="98%" border="0" align=center cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" class="border">
<tr align="center">
    <td width="300" height=25 class="topbg"><div align="left"><strong>后台管理首页</strong></div>
</tr>
<tr align="center">
    <td height=25 class="tdbg"><strong>快捷管理： </strong><a href="${rc.getContextPath()}/admin/blog/add"><font color="#FF0000">发表新日志</font></a> 
      | <a href="${rc.getContextPath()}/admin/blog/list">日志管理</a></tr>
</table>
<br>
<table width="98%" border="0" align=center cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" class="border">
  <tr align="center">
    <td height=25 class="topbg"><strong><div id="main_top_title">帮 助</div></strong> </tr>
  <tr>
	<td height=23 class="tdbg">
		<div id="main_top_content">
			<ul class="ul">
				<li>
					1、本程序为 易游国博客(EyougoBlog) 网站程序，目前版本号为：${version}
				</li>
			</ul>
		</div>
	</td>
  </tr>
</table>
<div align="center">
   <table width="98%" border="0" align="center"  cellspacing="1" bgcolor="#FFFFFF" class="border">
  <tr>
    <td class="topbg" height="20"><center><strong><div id="main_middle_title">服务器基本信息</div></strong></center></td>
    </tr>
  <tr>
  <td class="tdbg">
  	<div id="main_middle_content">
   		 <ul class="ul">
   		 		<li>
					<div class="left">
					&nbsp;操作系统架构：${serverInfo.osArch}
					</div>
					<div class="right">
					&nbsp;操作系统名称：${serverInfo.osName}
					</div>
				</li>
				<li>
					<div class="left">
					&nbsp;java运行环境名称：${serverInfo.runtimeName}
					</div>
					<div class="right">
					&nbsp;java运行环境版本：${serverInfo.runtimeVersion}
					</div>
				</li>
				<li>
					<div class="left">
					&nbsp;java虚拟机版本：${serverInfo.vmVersion}
					</div>
					<div class="right">
					&nbsp;java虚拟机提供商：${serverInfo.vmVendor}
					</div>
				</li>
				<li>
					<div class="left">
					&nbsp;java虚拟机信息：${serverInfo.vmInfo}
					</div>
					<div class="right">
					&nbsp;java库路径：${serverInfo.libraryPath}
					</div>
				</li>
				<li>
					<div class="left">
					&nbsp;用户时区：${serverInfo.timeZone}
					</div>
					<div class="right">
					&nbsp;用户语言：${serverInfo.lang}
					</div>
				</li>
				<li>
					<div class="left">
					&nbsp;文件编码：${serverInfo.fileEncoding}
					</div>
					<div class="right">
					&nbsp;应用环境根目录：${serverInfo.appEnviromentRoot}
					</div>
				</li>
			</ul>
	</div>
	</td>
  </tr>
  
  <tr>
    <td class="topbg" height="20"><CENTER><b><div id="main_bottom_title">服务器及数据库运行情况</div></b></CENTER></td>
    </tr>
   <tr>
  	<td class="tdbg">
  		<div id="main_bottom_content">
   	功能开发中……
		</div>
	</td>
  </tr>
  <s:action name="counter_info" executeResult="true" ignoreContextParams="true" namespace="/"/>
</table>

</div>
</body>
</html>


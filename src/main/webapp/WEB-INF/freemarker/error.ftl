<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Sorry......好像，呃，出错了</title>
	<link href="${rc.getContextPath()}/css/index.blog.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0">
	<div id="container">
		<div id="head"></div>
		<div id="menu">
		<ul>
			<li><a href="${rc.getContextPath()}/message/list/1">我要留言</a></li>
			<li><a href="${rc.getContextPath()}/">返回首页</a></li>
		</ul>
		</div>
		<div id="pagebody">
			<h2>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<center><b>Sorry......好像，呃，出错了......<br/>5秒后自动返回首页......</b></center>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
			</h2>
			<div style="display:none">${exception}<br/>${exceptionStack}</div>
		</div>
		<div id="foot"><a href="${rc.getContextPath()}/message/list/1">我要留言</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${rc.getContextPath()}/">返回首页</a></div></div>
	</div>
</body>
</html>
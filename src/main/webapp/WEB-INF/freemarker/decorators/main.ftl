<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><sitemesh:write property="title"/></title>
	<script type="text/javascript" src="${rc.getContextPath()}/js/buildup.js"> </script>
	
	<sitemesh:write property="head"/>
</head>
<body topmargin="0">
	<div id="container">
		<div id="head"></div>
		<div id="menu">
		<ul>
			<li><a href="/index.jsp">BLOG</a></li>
			<li><a href="">MESSAGES</a></li>
			<li><a href="">LINKS</a></li>
		</ul>
		</div>
		<div id="pagebody">
			<div id="sidebar">
			</div>
			<sitemesh:write property="body"/>
		</div>
		[#include "/commons/footer.ftl"]
	</div>
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>EyouGo Blog - <sitemesh:write property="title"/></title>
	<script type="text/javascript" src="${rc.getContextPath()}/js/buildup.js"> </script>
	
	<sitemesh:write property="head"/>
</head>
<body topmargin="0">
	<div id="container">
		<div id="head"></div>
		<div id="menu">
		<ul>
			<li><a href="${rc.getContextPath()}/blog/list/0-1">BLOG</a></li>
			<#list categoryList as category>
			<li><a href="${rc.getContextPath()}/blog/list/${category.id}-1">${category.category}</a></li>
			</#list>
			<li><a href="${rc.getContextPath()}/message/list/1">MESSAGES</a></li>
			<li><a href="${rc.getContextPath()}/link/list/1">LINKS</a></li>
		</ul>
		</div>
		<div id="pagebody">
			<div id="sidebar">
			</div>
			<sitemesh:write property="body"/>
		</div>
		<div id="foot">Copyright &copy 2009-2010 EyouGo Studio</div></div>
	</div>
</body>
</html>
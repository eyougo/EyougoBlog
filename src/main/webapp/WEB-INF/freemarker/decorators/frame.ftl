<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><@s.property value="blogConfigs.BLOGTITLE"/> - ${title}</title>
	<script type="text/javascript" src="<@s.url value="/js/jquery.js" includeParams="none"/>"> </script>
	<script type="text/javascript" src="<@s.url value="/js/buildup.js" includeParams="none"/>"> </script>
	${head}
</head>
<body topmargin="0">
	<@s.actionerror theme="eyougo"/>
	<div id="container">		
	<@s.action name="commons_header" executeResult="true" operation="header" ignoreContextParams="true"/>
	<div id="pagebody">
		<div id="sidebar">
			<#include "/WEB-INF/freemarker/commons/login.ftl"/>
			<#include "/WEB-INF/freemarker/commons/commons.ftl"/>
		</div>
		${body}
	</div>
	<#include "/WEB-INF/freemarker/commons/footer.ftl"/>
	</div>
	<@s.actionmessage theme="eyougo"/>
</body>
</html>
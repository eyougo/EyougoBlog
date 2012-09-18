<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LINKS</title>
<link href="<@s.url value="/css/index.blog.css" includeParams="none"/>" rel="stylesheet" type="text/css" />
</head>
<body>
		<div id="mainbody">
		<h5>LINKS</h5>
		<table width="100%" border="0" cellpadding="0" cellspacing="6">
			<tr>
			<#assign ct=0 />
			<@s.iterator id="link" value="linkList" status="st">
			<@s.if test="#link.linklogo!=null&&#link.linklogo!=''">
				<#if ct%4==0>
				</tr>
				<tr>
				</#if>
				<td width="25%" align="center">
					<a href="<@s.property value="#link.linkurl"/>" target="_blank">
					<img border="0" title="<@s.property value="#link.linkname"/>" src="<@s.property value="#link.linklogo"/>" width="88" height="31" />
					</a>
				</td>
				<#assign ct=ct+1 />				
			</@s.if>
			</@s.iterator>
			<#if ct%4 != 0>
				<#list ct%4..3 as c>
				<td width="25%" align="center"></td>
				</#list>
			</#if>
			</tr>
		</table>
		<br/>
		<table width="100%" border="0" cellpadding="0" cellspacing="6">
			<tr>
			<#assign ct=0 />
			<@s.iterator id="link" value="linkList" status="st">
			<@s.if test="#link.linklogo==null||#link.linklogo==''">
				<#if ct%4==0>
				</tr>
				<tr>
				</#if>
				<td width="25%" align="center">
					<a href="<@s.property value="#link.linkurl"/>" target="_blank">
					<@s.property value="#link.linkname"/>
					</a>
				</td>
				<#assign ct=ct+1 />				
			</@s.if>
			</@s.iterator>
			<#if ct%4 != 0>
				<#list ct%4..3 as c>
				<td width="25%" align="center"></td>
				</#list>
			</#if>
			</tr>
		</table>	
		</div>  
</body>
</html>
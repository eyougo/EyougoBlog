<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<s:url value="/css/admin_style.css" includeParams="none"/>">
		<title>日志管理</title>
	</head>
	<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0"
		class="bgcolor">
			<table width="98%" border="0" align=center cellpadding="2"
				cellspacing="1" bgcolor="#FFFFFF" class="border">
				<tr>
					<th class="topbg">
						日志发表成功！
					</th>
				</tr>
				<tr>
					<td class="tdbg" width="10%">
						<div align="center">
							<a href=<s:url action="adminBlog_add"/>>添加新的日志…………</a>
						</div>
					</td>
				</tr>
				<tr>
					<td class="tdbg" width="10%">
						<div align="center">
							<a href=<s:url action="adminBlog_list"/>>返回日志管理…………</a>
						</div>
					</td>
				</tr>
			</table>
	</body>
</html>
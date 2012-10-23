<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${category.category}</title>
<link href="${rc.getContextPath()}/css/index.blog.css" rel="stylesheet" type="text/css" />
</head>
<body>
		<div id="mainbody">
		<h5>${category.category}</h5>
		<#list blogList as blog>
			<div id="nr">
				<h2><a href="${rc.getContextPath()}/blog/view/${blog.id}" target="_blank"><b>${blog.title}</b></a></h2>
				<div class="sm"><p>${blog.summary}</p></div> 
				<div class="m2"><a href="${rc.getContextPath()}/blog/view/${blog.id}" target="_blank">Read More</a></div>
				<h3>
					<a href="${rc.getContextPath()}/blog/list/${blog.category.id}-1"/>Category: ${blog.category.category}</a> | 
					<a href="${rc.getContextPath()}/blog/view/${blog.id}" target="_blank">View: ${blog.bit}</a> | 
					<a href="${rc.getContextPath()}/blog/view/${blog.id}" target="_blank">Comments: ${blog.commentsNum}</a>
				</h3>
			</div><br/>
		</#list>
		<br>
		<center>
			<#if pager.prePage??><a href="${rc.getContextPath()}/blog/list/${category.id}-${pager.page-1}">Previous</a></#if>
			&nbsp;&nbsp;
			<#list pager.naviPages as naviPage>
				<a href="${rc.getContextPath()}/blog/list/${category.id}-${naviPage}">
					<#if naviPage==pager.page><b></#if>
					${naviPage}
					<#if naviPage==pager.page></b></#if>
				</a>
				&nbsp;
			</#list>
			&nbsp;
			<#if pager.nextPage??><a href="${rc.getContextPath()}/blog/list/${category.id}-${pager.page+1}">Next</a></#if>
		</center>
		</div>  
</body>
</html>
		
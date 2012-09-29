<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><sitemesh:write property="title"/></title>
	<sitemesh:write property="head"/>
</head>
<body topmargin="0">
	<div id="pagebody">
		<sitemesh:write property="body"/>
		<div id="sidebar">
			<div id="Blogs">
				<h1>Recent Articles</h1>
				<ul>
					<#list recentBlogList as blog>
					<li><a href="/blog/view/${blog.id}" title="${blog.title}" target="_blank">${blog.title}</a></li>
					</#list>
				</ul>
				<div class="m1"><a href="/blog/list/0-1">More</a></div>
			</div>
			<div id="Blogs">
				<h1>Recent Comments</h1>
				<ul>
					<#list recentCommentList as comment>
					<li><span><a href="/blog/view/${comment.blog.id}" target="_blank">${comment.content}</a></span></li>
					</#list>
				</ul>
			</div>
			<div id="Blogs">
				<h1>Recent Messages</h1>
				<ul>
					<#list recentMessageList as message>
					<li><a href="/message/list/0-1" >${message.content}</a></li>
					</#list>
				</ul>
				<div class="m1"><a href="">More</a></div>
			</div>
		</div>
	</div>
</body>
</html>
<div id="Blogs">
	<h1>Recent Articles</h1>
<ul>
	<#list recentBlogList as blog>
	<li><a href="/blog/view/${blog.id}" title="${blog.title}" target="_blank">${blog.title}</a></li>
	</#list>
</ul>
<div class="m1"><a href="/blog/list/0-1">More</a></div>
</div>
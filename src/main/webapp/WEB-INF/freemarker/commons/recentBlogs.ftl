<div id="Blogs">
	<h1>Recent Articles</h1>
<ul>
	<@s.iterator id="blog" value="recentBlogList">
	<li><a href="<@s.url value="/blog/view/%{#blog.id}"/>" title="<@s.property value="#blog.title"/>" target="_blank"><@s.property value="#blog.title"/></a></li>
	</@s.iterator>
</ul>
<div class="m1"><a href="<@s.url value="/blog/list/"/>">More</a></div>
</div>
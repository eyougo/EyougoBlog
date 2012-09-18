<div id="Blogs">
	<h1>Recent Comments</h1>
<ul>
	<@s.iterator id="comment" value="recentCommentList">
	<li><a href="<@s.url value="/blog/view/%{#comment.blog.id}"/>" target="_blank"><@s.property value="#comment.content" escape="false"/></a></li>
	</@s.iterator>
</ul>
</div>
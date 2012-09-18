<div id="head"></div>
<div id="menu">
<ul>
	<li><a href="<@s.url value="/index.jsp"/>">BLOG</a></li>
	<@s.iterator id="category" value="categoryList">
	<li>
		<a href="<@s.url value="/blog/list/%{#category.id}"/>" title="<@s.property value="#category.category.toUpperCase()"/>"><@s.property value="#category.category.toUpperCase()"/></a>
	</li>
	</@s.iterator>
	<li><a href="<@s.url action="message_list" includeParams="none"/>">MESSAGES</a></li>
	<li><a href="<@s.url action="link_list" includeParams="none"/>">LINKS</a></li>
</ul>
</div>
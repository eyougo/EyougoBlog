<div id="Categries">
<h1>Categries</h1>
<ul>
	<@s.iterator id="category" value="categoryMap">
	<li>
		<a href="<@s.url value="/blog/list/%{#category.key.id}"/>" title="<@s.property value="#category.key.category"/>"><@s.property value="#category.key.category"/>&nbsp;&nbsp;&nbsp;&nbsp;<@s.property value="#category.value"/> </a>
	</li>
	</@s.iterator>
	<li>
		<a href="<@s.url action="message_list" includeParams="none"/>" title="MESSAGES">MESSAGES&nbsp;&nbsp;&nbsp;&nbsp;<@s.property value="messageCount"/></a>
	</li>
	<li>
		<a href="<@s.url action="link_list" includeParams="none"/>" title="LINKS">LINKS&nbsp;&nbsp;&nbsp;&nbsp;<@s.property value="linkCount"/></a>
	</li>
	<@s.action name="counter_all" executeResult="true" ignoreContextParams="true"/>
</ul>
</div>
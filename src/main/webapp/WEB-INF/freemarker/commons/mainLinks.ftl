<div id="Blogs">
	<h1>Main Links</h1>
<ul>
	<@s.iterator id="link" value="mainLinkList">
	<li>
		<a href="<@s.property value="#link.linkurl"/>" title="<@s.property value="#link.linkname"/>" class="cnt" target="_blank">
		<@s.if test="#link.linklogo!=null&&#link.linklogo!=''">
			<img border="0" title="<@s.property value="#link.linkname"/>" src="<@s.property value="#link.linklogo"/>" width="88" height="31" />
		</@s.if>
		<@s.else>
			<@s.property value="#link.linkname"/>
		</@s.else>
		</a>
	</li>
	</@s.iterator>
</ul>
<div class="m1"><a href="<@s.url action="link_list" includeParams="none" />">More</a></div>
</div>
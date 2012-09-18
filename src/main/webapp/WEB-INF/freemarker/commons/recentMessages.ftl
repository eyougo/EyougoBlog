<div id="Blogs">
	<h1>Recent Messages</h1>
<ul>
	<@s.iterator id="message" value="recentMessageList">
	<li><a href="<@s.url action="message_list"/>" ><@s.property value="#message.content" escape="false"/></a></li>
	</@s.iterator>
</ul>
<div class="m1"><a href="<@s.url action="message_list" includeParams="none" />">More</a></div>
</div>
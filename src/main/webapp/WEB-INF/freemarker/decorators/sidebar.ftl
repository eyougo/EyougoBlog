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
			<div id="SideAds">
			<style type="text/css">
			@import url(http://www.google.com/cse/api/branding.css);
			</style>
			<div class="cse-branding-bottom" style="background-color:#FFFFFF;color:#000000">
			  <img src="http://www.google.com/images/poweredby_transparent/poweredby_FFFFFF.gif" alt="Google" />
			  <div class="cse-branding-form">
			    <form action="http://www.google.com.hk" id="cse-search-box" target="_blank">
			      <div>
			        <input type="hidden" name="ie" value="UTF-8" />
			        <input type="text" name="q" size="18" />
			        <input type="submit" name="sa" value="Go!" />
        			<input type="radio" name="cx" value="partner-pub-4332160032993197:9046611839" />本站
			        <input type="radio" name="cx" value="partner-pub-4332160032993197:1942147434" />全网
			      </div>
			    </form>
			  </div>	  
			</div>
			</div>
			<div id="Categries">
				<h1>Categries</h1>
				<ul>
					<#list categoryList as category>
					<li>
						<a href="${rc.getContextPath()}/blog/list/${category.id}-1" title="${category.category}">${category.category}
						<span>${categoryNumMap[category.category]}</span></a>
					</li>
					</#list>
					<li>
						<a href="${rc.getContextPath()}/message/list/1" title="MESSAGES">MESSAGES
						<span>${messageNum}</span></a>
					</li>
					<#--
					<li>
						<a href="${rc.getContextPath()}/link/list/1" title="LINKS">LINKS&nbsp;&nbsp;&nbsp;&nbsp;</a>
					</li>
					-->
				</ul>
			</div>
			<div id="Blogs">
				<h1>Recent Articles</h1>
				<ul>
					<#list recentBlogList as blog>
					<li><a href="${rc.getContextPath()}/blog/view/${blog.id}" title="${blog.title}" target="_blank">${blog.title}</a></li>
					</#list>
				</ul>
				<div class="m1"><a href="/${rc.getContextPath()}/blog/list/0-1">More</a></div>
			</div>
			<div id="Comments">
				<h1>Recent Comments</h1>
				<ul>
					<#list recentCommentList as comment>
					<li><span><a href="${rc.getContextPath()}/blog/view/${comment.blog.id}" target="_blank">${comment.content}</a></span></li>
					</#list>
				</ul>
			</div>
			<div id="Messages">
				<h1><a href="${rc.getContextPath()}/message/list/1">Recent Messages</a></h1>
				<ul>
					<#list recentMessageList as message>
					<li><a href="${rc.getContextPath()}/message/list/1">${message.content}</a></li>
					</#list>
				</ul>
				<div class="m1"><a href="${rc.getContextPath()}/message/list/1">More</a></div>
			</div>
			<div id="SideAds">
				<script type="text/javascript"><!--
				google_ad_client = "ca-pub-4332160032993197";
				/* 边栏广告 */
				google_ad_slot = "7349552637";
				google_ad_width = 160;
				google_ad_height = 600;
				//-->
				</script>
				<script type="text/javascript"
				src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(
			function() { 
				$.get('${rc.getContextPath()}/vistors', function(data) {
				  $('#Categries ul').append('<li>VISTORS<span>' + data + '</span></a></li>');
				});
			} 
		);
	
	</script>
</body>
</html>

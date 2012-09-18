<#import "commons/pager.ftl" as pager> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><@s.property value="blog.title" /></title>
<link href="<@s.url value="/css/neirong.css" includeParams="none"/>" rel="stylesheet" type="text/css" />
<link href="<@s.url value="/js/syntaxhighlighter/styles/shCore.css" includeParams="none"/>" rel="stylesheet" type="text/css" />
<link href="<@s.url value="/js/syntaxhighlighter/styles/shThemeDefault.css" includeParams="none"/>" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<@s.url value="/fckeditor/fckeditor.js" includeParams="none"/>"> </script>
<script type="text/javascript" src="<@s.url value="/js/syntaxhighlighter/scripts/shCore.js" includeParams="none"/>"></script>
<script type="text/javascript" src="<@s.url value="/js/syntaxhighlighter/scripts/shBrushCss.js" includeParams="none"/>"></script>
<script type="text/javascript" src="<@s.url value="/js/syntaxhighlighter/scripts/shBrushGroovy.js" includeParams="none"/>"></script>
<script type="text/javascript" src="<@s.url value="/js/syntaxhighlighter/scripts/shBrushCpp.js" includeParams="none"/>"></script>
<script type="text/javascript" src="<@s.url value="/js/syntaxhighlighter/scripts/shBrushJava.js" includeParams="none"/>"></script>
<script type="text/javascript" src="<@s.url value="/js/syntaxhighlighter/scripts/shBrushJScript.js" includeParams="none"/>"></script>
<script type="text/javascript" src="<@s.url value="/js/syntaxhighlighter/scripts/shBrushRuby.js" includeParams="none"/>"></script>
<script type="text/javascript" src="<@s.url value="/js/syntaxhighlighter/scripts/shBrushSql.js" includeParams="none"/>"></script>
<script type="text/javascript" src="<@s.url value="/js/syntaxhighlighter/scripts/shBrushXml.js" includeParams="none"/>"></script>
<script type="text/javascript"> 
		SyntaxHighlighter.config.clipboardSwf = '<@s.url value="/js/syntaxhighlighter/scripts/clipboard.swf" includeParams="none"/>';
		SyntaxHighlighter.all();
		$(
			function() { 
				var sBasePath = "<@s.url value="/fckeditor/" includeParams="none"/>"  //获得fckeditor的路径 		
				var oFCKeditor = new FCKeditor( 'comment.content' ) ; 
				oFCKeditor.BasePath = sBasePath ; 
				oFCKeditor.Width = "50%";
				oFCKeditor.Height = "200px";
				oFCKeditor.ToolbarSet = "Comment";
				oFCKeditor.ReplaceTextarea(); 
			} 
		)
		
		function submitComment(){
			if($.trim($('#nickname').val()) == ''){
				alert("请输入昵称");
				$('#nickname').focus();
				return false;
			}
			if($.trim(getEditorHTMLContents("comment.content")) == ''){
				alert("请输入评论内容");
				$('#content').focus();
				setEditorContents("comment.content","")
				return false;
			}
			$('#comment').submit();
		}
</script> 
</head>
<body>
		<div id="mainbody">
			<div id="tp">
				<h2><b><a href="<@s.url value="/blog/view/%{blog.id}"/>"><@s.property value="blog.title" /></b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<@s.date name="blog.date" format="yyyy-MM-dd HH:mm:ss" /></h2>			
				<p>
					<@s.property value="blog.content" escape="false"/>
				</p>
				
				<br>&nbsp;&nbsp;&nbsp;&nbsp;
				<@s.if test="previousBlog!=null">
				Previous:&nbsp;<a href="<@s.url value="/blog/view/%{previousBlog.id}"/>"><@s.property value="previousBlog.title"/></a>&nbsp;&nbsp;
				</@s.if>
				<@s.if test="NextBlog!=null">
				Next:&nbsp;<a href="<@s.url value="/blog/view/%{nextBlog.id}"/>"><@s.property value="nextBlog.title"/></a>&nbsp;&nbsp;
				</@s.if>
				<br>
				<h3>
					<a href="<@s.url value="/blog/list/%{blog.category.id}"/>">Category: <@s.property value="blog.category.category" /></a> | 
					<a href="<@s.url value="/blog/view/%{blog.id}"/>">View: <@s.property value="blog.bit" /></a> | 
					<a href="<@s.url value="/blog/view/%{blog.id}"/>">Comments: <@s.property value="blog.commentsNum" /></a>
					<@s.if test="blog.copyright==true">
					 | <@s.property value="blogConfigs.ORIGINALNOTE" escape="false"/>
					</@s.if>
				</h3>
			</div>
				<br>
				<@s.form name="delete" method="post" namespace="/admin" action="adminComment_deleteComments" id="delete">
				<@s.iterator value="blog.comments" id="comment">
			<div id="nr">
				<h2>
					<a name="<@s.property value="#comment.id" />" id="#<@s.property value="#comment.id" />"></a>
					<@s.property value="#comment.contact.nickname" />&nbsp;&nbsp;&nbsp;&nbsp;<@s.date name="#comment.commentDate" format="yyyy-MM-dd HH:mm:ss" />
					<#if Session[stack.findValue("@com.eyougo.blog.comm.EyougoConstant@USER_SESSION_KEY")]?exists>
						<#if Session[stack.findValue("@com.eyougo.blog.comm.EyougoConstant@USER_SESSION_KEY")].isAdmin?exists>
							<#if Session[stack.findValue("@com.eyougo.blog.comm.EyougoConstant@USER_SESSION_KEY")].isAdmin==true>
								|&nbsp;&nbsp;<a href="<@s.url action='adminComment_reply' namespace='/admin' includeParams='none'><@s.param name='comment.id' value='#comment.id'/><@s.param name='comment.blog.id' value='#comment.blog.id'/></@s.url>">REPLY</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="<@s.url action='adminComment_delete' namespace='/admin' includeParams='none'><@s.param name='comment.id' value='#comment.id'/><@s.param name='comment.blog.id' value='#comment.blog.id'/></@s.url>">DELETE</a>&nbsp;&nbsp;&nbsp;&nbsp;
								|&nbsp;&nbsp;<@s.checkbox name="commentIds"  fieldValue="%{#comment.id}" />
							</#if>
						</#if>
					</#if>
				</h2>
				<p><@s.property value="#comment.content" escape="false"/></p> 
			</div>
				<br>
				</@s.iterator>
				<#if Session[stack.findValue("@com.eyougo.blog.comm.EyougoConstant@USER_SESSION_KEY")]?exists>
					<#if Session[stack.findValue("@com.eyougo.blog.comm.EyougoConstant@USER_SESSION_KEY")].isAdmin?exists>
						<#if Session[stack.findValue("@com.eyougo.blog.comm.EyougoConstant@USER_SESSION_KEY")].isAdmin==true>
			<div id="nr">
				<h2>
				<@s.hidden name="comment.blog.id" id="blog_id" value="%{blog.id}"/>
				<@s.submit value="DELETE SELECTED" />
				</h2>
			</div>
						</#if>
					</#if>
				</#if>
				</@s.form>
			<div id="pcomment">
				<h5>Post Comment</h5> 
				<@s.form method="post" action="blog_addComment" id="comment"> 
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr> 
						 	<td>
						 	<strong>Your name:      <label>
						 	<@s.textfield name="comment.contact.nickname" id="nickname"  cssClass="pd" size="12" value="%{user.contact.nickname}"/>
						 	</label></strong>
						 	<@s.hidden name="comment.blog.id" id="blog_id" value="%{blog.id}"/>
							</td>
						</tr>
						<tr> 
						 	<td>
						 	<strong>Your Email:      <label>
						 	<@s.textfield name="comment.contact.email" id="email"  cssClass="pd" size="22" value="%{user.contact.email}"/>
						 	</label></strong>
							</td>
						</tr>
						<tr> 
						 	<td>
						 	<strong>ValidateCode:     <label>
							<@s.textfield name="validateCode" id="validateCode" cssClass="pd" size="12" />
							<img src="<@s.url action='validationCode'/>" style="cursor:hand;vertical-align:top" onclick="this.src='<@s.url action ='validationCode'/>';"/>
							</label></strong>
						<tr>
     						<td width="100%">
     							<@s.textarea rows="6" cols="40" name="comment.content" id="content"></@s.textarea>
     						</td>
     					</tr>
     					<tr>
     						<td>
     							<label>
									<a href="####"><img border="0" src="<@s.url value="/images/submit.gif"/>" onclick="submitComment();"/></a>
								</label>
							</td>
						</tr>
					</table>
				</@s.form>
			</div>
		</div>  
</body>
</html>
		
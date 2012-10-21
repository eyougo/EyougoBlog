<#import "commons/pager.ftl" as pager> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${blog.title}</title>
<link href="${rc.getContextPath()}/css/index.blog.css" rel="stylesheet" type="text/css" />
<link href="${rc.getContextPath()}/js/syntaxhighlighter/styles/shCore.css" rel="stylesheet" type="text/css" />
<link href="${rc.getContextPath()}/js/syntaxhighlighter/styles/shThemeDefault.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${rc.getContextPath()}/fckeditor/fckeditor.js"> </script>
<script type="text/javascript" src="${rc.getContextPath()}/js/syntaxhighlighter/scripts/shCore.js"></script>
<script type="text/javascript" src="${rc.getContextPath()}/js/syntaxhighlighter/scripts/shBrushCss.js"></script>
<script type="text/javascript" src="${rc.getContextPath()}/js/syntaxhighlighter/scripts/shBrushGroovy.js"></script>
<script type="text/javascript" src="${rc.getContextPath()}/js/syntaxhighlighter/scripts/shBrushCpp.js"></script>
<script type="text/javascript" src="${rc.getContextPath()}/js/syntaxhighlighter/scripts/shBrushJava.js"></script>
<script type="text/javascript" src="${rc.getContextPath()}/js/syntaxhighlighter/scripts/shBrushJScript.js"></script>
<script type="text/javascript" src="${rc.getContextPath()}/js/syntaxhighlighter/scripts/shBrushRuby.js"></script>
<script type="text/javascript" src="${rc.getContextPath()}/js/syntaxhighlighter/scripts/shBrushSql.js"></script>
<script type="text/javascript" src="${rc.getContextPath()}/js/syntaxhighlighter/scripts/shBrushXml.js"></script>
<script type="text/javascript"> 
		SyntaxHighlighter.config.clipboardSwf = '${rc.getContextPath()}/js/syntaxhighlighter/scripts/clipboard.swf';
		SyntaxHighlighter.all();
		$(
			function() { 
				var sBasePath = "${rc.getContextPath()}/fckeditor/"  //获得fckeditor的路径 		
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
				<h2><b><a href="${rc.getContextPath()}/blog/view/${blog.id}">${blog.title}</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<@s.date name="blog.date" format="yyyy-MM-dd HH:mm:ss" /></h2>			
				<p>
					${blog.content}
				</p>
				
				<br>&nbsp;&nbsp;&nbsp;&nbsp;
				<#if previousBlog??>
				Previous:&nbsp;<a href="${rc.getContextPath()}/blog/view/${previousBlog.id}">${previousBlog.title}</a>&nbsp;&nbsp;
				</#if>
				<#if NextBlog??>
				Next:&nbsp;<a href="${rc.getContextPath()}/blog/view/${nextBlog.id}">${nextBlog.title}</a>&nbsp;&nbsp;
				</#if>
				<br>
				<h3>
					<a href="${rc.getContextPath()}/blog/list/${blog.category.id}"/>">Category: ${blog.category.category}</a> | 
					<a href="${rc.getContextPath()}/blog/view/${blog.id}"/>">View: ${blog.bit}</a> | 
					<a href="${rc.getContextPath()}/blog/view/${blog.id}"/>">Comments: ${blog.commentsNum}</a>
					<#if originalNote??>
					 | ${originalNote}
					</#if>
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
		
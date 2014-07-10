<#import "commons/pager.ftl" as pager> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${blog.title}</title>
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
				var oFCKeditor = new FCKeditor( 'content' ) ; 
				oFCKeditor.BasePath = sBasePath ; 
				oFCKeditor.Width = "80%";
				oFCKeditor.Height = "240px";
				oFCKeditor.ToolbarSet = "Comment";
				oFCKeditor.ReplaceTextarea(); 
			} 
		);
		
		function submitComment(){
			if($.trim($('#nickname').val()) == ''){
				alert("请输入昵称");
				$('#nickname').focus();
				return false;
			}
			if($.trim(getEditorHTMLContents("content")) == ''){
				alert("请输入评论内容");
				$('#content').focus();
				setEditorContents("content","")
				return false;
			}
			$('#comment').submit();
		}
</script> 
</head>
<body>
		<div id="mainbody">
			<div id="tp">
				<h2>
					<b><a href="${rc.getContextPath()}/blog/view/${blog.id}">${blog.title}</a></b>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${blog.date}
				</h2>
				<h3 class="bb">
					View: ${blog.blogView.view} | 
					<a href="${rc.getContextPath()}/blog/view/${blog.id}#comments" class="bl">Comments: ${blog.commentsNum}</a> |
					<a href="${rc.getContextPath()}/blog/list/${blog.category.id}-1" class="bl">Category: ${blog.category.category}</a>
					<#if originalNote??>
					 | ${originalNote}
					</#if>
				</h3>		
				<div class="sm">
					<p>
						${blog.content}
					</p>
				</div>
				<h3>&nbsp;&nbsp;&nbsp;&nbsp;
				<#if previousBlog??>
				PREVIOUS:&nbsp;<a href="${rc.getContextPath()}/blog/view/${previousBlog.id}" class="bl">${previousBlog.title}</a>&nbsp;&nbsp;
				</#if>
				<br/>&nbsp;&nbsp;&nbsp;&nbsp;
				<#if nextBlog??>
				NEXT:&nbsp;<a href="${rc.getContextPath()}/blog/view/${nextBlog.id}" class="bl">${nextBlog.title}</a>&nbsp;&nbsp;
				</#if>
				</h3>
				<br>
			</div>
			<br>
			<a name="comments" id="comments"></a>
			<#list blog.comments as comment>
				<div id="nr">
					<h2>
						<a name="${comment.id}" id="${comment.id}"></a>
						${comment.contact.nickname}&nbsp;&nbsp;&nbsp;&nbsp;${comment.commentDate}
						<#if Session["admin"]?exists>
							<a href="${rc.getContextPath()}/admin/comment/delete?commentId=${comment.id}">DELETE</a>&nbsp;&nbsp;&nbsp;&nbsp;
							|&nbsp;&nbsp;<input type="checkbox" name="commentIds"  value="${comment.id}" />
						</#if>
					</h2>
					<p>${comment.content}</p> 
				</div>
				<br>
			</#list>
			<div id="pcomment">
				<h5>Post Comment</h5> 
				<form method="post" action="${rc.getContextPath()}/blog/addComment" id="comment"> 
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr> 
						 	<td >
						 	<input type="hidden" name="blog.id" id="blog.id" value="${blog.id}"/>
						 	<strong>Your Name:      
						 		<label>
						 			<input type="text" name="contact.nickname" id="nickname"  class="pd" size="12" value=""/>
						 		</label>
						 	</strong>
						 	<br/>
							</td>
						</tr>
						<tr> 
						 	<td>
						 	<strong>Your Email:      
						 		<label>
						 		<input type="text" name="contact.email" id="email"  class="pd" size="22" value=""/>
						 		</label>
						 	</strong>
						 	<br/>
							</td>
						</tr>
						<tr> 
						 	<td>
						 	<strong>Captcha:
						 	<label><input type="text" name="captcha" id="captcha"  class="pd" size="22" value=""/>
							</label><img src="${rc.contextPath}/captcha" style="cursor:hand;vertical-align:top" onclick="this.src='${rc.contextPath}/captcha';"/>
							</strong>
							<br/>
							</td>
						<tr>
     						<td width="100%">
     							<textarea rows="8" cols="64" name="content" id="content"></textarea>
     						</td>
     					</tr>
     					<tr>
     						<td>
     							<label>
									<a href="####"><img border="0" src="${rc.getContextPath()}/images/submit.gif" onclick="submitComment();"/></a>
								</label>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>  
</body>
</html>
		

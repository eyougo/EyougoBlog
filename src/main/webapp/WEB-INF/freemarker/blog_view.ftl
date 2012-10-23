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
				<h2>
					<b><a href="${rc.getContextPath()}/blog/view/${blog.id}">${blog.title}</a></b>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${blog.date}
				</h2>			
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
					<a href="${rc.getContextPath()}/blog/list/${blog.category.id}">Category: ${blog.category.category}</a> | 
					<a href="${rc.getContextPath()}/blog/view/${blog.id}">View: ${blog.bit}</a> | 
					<a href="${rc.getContextPath()}/blog/view/${blog.id}">Comments: ${blog.commentsNum}</a>
					<#if originalNote??>
					 | ${originalNote}
					</#if>
				</h3>
			</div>
			<br>
			<#list blog.comments as comment>
				<div id="nr">
					<h2>
						<a name="${comment.id}" id="${comment.id}></a>
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
						 	<td>
						 	<strong>Your name:      <label>
						 	<input type="text" name="nickname" id="nickname"  class="pd" size="12" value=""/>
						 	</label></strong>
						 	<input type="hidden" name="blogId" id="blogId" value="${blog.id}"/>
							</td>
						</tr>
						<tr> 
						 	<td>
						 	<strong>Your Email:      <label>
						 	<input type="text" name="email" id="email"  class="pd" size="22" value=""/>
						 	</label></strong>
							</td>
						</tr>
						<tr> 
						 	<td>
						 	<strong>ValidateCode:     <label>
							</label></strong>
						<tr>
     						<td width="100%">
     							<textarea rows="6" cols="40" name="content" id="content"></textarea>
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
		
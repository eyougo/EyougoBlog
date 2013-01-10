<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MESSAGES</title>
<script type="text/javascript" src="${rc.contextPath}/fckeditor/fckeditor.js"> </script>
<script type="text/javascript"> 
		$(document).ready(
			function() { 
				var sBasePath = "${rc.contextPath}/fckeditor/"  //获得fckeditor的路径 
				var oFCKeditor = new FCKeditor( 'content' ) ; 
				oFCKeditor.BasePath = sBasePath ; 
				oFCKeditor.Width = "80%";
				oFCKeditor.Height = "240px";
				oFCKeditor.ToolbarSet = "Comment";
				oFCKeditor.ReplaceTextarea() ; 
			} 
		)
		
		function submitMessage(){
			if($.trim($('#nickname').val()) == ''){
				alert("请输入昵称");
				$('#nickname').focus();
				return false;
			}
			if($.trim(getEditorHTMLContents("content")) == ''){
				alert("请输入留言内容");
				$('#content').focus();
				setEditorContents("content","")
				return false;
			}
			$('#message').submit();
		}
		
		function reply(name){
			$('#replyTo').val(name);
			$('#replyTr').show();
		}
		
		function cancel(){
			$('#replyTo').val("");
			$('#replyTr').hide();
		}
</script> 
</head>
<body>
	<div id="mainbody">
		<h5>MESSAGES</h5>
		<#list messageList as message>
			<div id="nr">
				<h2>
				${message.contact.nickname}&nbsp;&nbsp;&nbsp;&nbsp;[${message.messageDate}]
				&nbsp;&nbsp;&nbsp;&nbsp;<a href="#pcomment" onclick="reply('${message.contact.nickname}');">REPLY</a>
				<#if Session["admin"]?exists>
						&nbsp;&nbsp;|&nbsp;&nbsp;<a href="${rc.contextPath}/admin/message/delete?messageId=${message.id}">DELETE</a>
				</#if>
				</h2>
				<p>${message.content}</p> 
			</div><br>
		</#list>
		<br>
		<center>
			<#if pager.prePage??><a href="${rc.getContextPath()}/message/list/${pager.page-1}">Previous</a></#if>
			&nbsp;&nbsp;
			<#list pager.naviPages as naviPage>
				<a href="${rc.getContextPath()}/message/list/${naviPage}">
					<#if naviPage==pager.page><b></#if>
					${naviPage}
					<#if naviPage==pager.page></b></#if>
				</a>
				&nbsp;
			</#list>
			&nbsp;
			<#if pager.nextPage??><a href="${rc.getContextPath()}/message/list/${pager.page+1}">Next</a></#if>
		</center>
		<div id="pcomment">
				<h5>Post Message</h5> 
				<form method="post" action="${rc.getContextPath()}/message/add" id="message"> 
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr id="replyTr" style="display:none;"> 
						 	<td class="pd">
						 	<strong>Reply To:
						 	<input type="text" name="replyTo" id="replyTo"  class="pd" size="12" value="" readonly="true"/>
						 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 	<a href="#" onclick="cancel();">CANCEL!</a></strong> 
							</td>
						</tr>
						<tr> 
						 	<td>
						 	<strong>Your name:      <label>
						 	<input type="text" name="contact.nickname" id="nickname"  class="pd" size="12" value=""/>
						 	</label></strong> 
							</td>
						</tr>
						<tr> 
						 	<td>
						 	<strong>Your email:      <label>
						 	<input type="text" name="contact.email" id="email"  class="pd" size="12" value=""/>
						 	</label></strong> 
							</td>
						</tr>
						<tr> 
						 	<td>
						 	<strong>Your QQ:      <label>
						 	<input type="text" name="contact.qq" id="qq"  class="pd" size="12" value=""/>
						 	</label></strong> 
							</td>
						</tr>
						<tr> 
						 	<td>
						 	<strong>Captcha:     <label>
							<input type="text" name="captcha" id="captcha" class="pd" size="12" />
							</label>
							<img src="${rc.contextPath}/captcha" style="cursor:hand;vertical-align:top" onclick="this.src='${rc.contextPath}/captcha';"/>
							</strong>
						<tr>
						<tr>
     						<td width="100%">
     							<textarea rows="6" cols="40" name="content" id="content"></textarea>
     						</td>
     					</tr>
     					<tr>
     						<td>
     							<label>
									<a href="####"><img border="0" src="${rc.contextPath}/images/submit.gif" onclick="submitMessage();"/></a>
								</label>
							</td>
						</tr>
						
					</table>
				</form>
			</div>
	</div>  
</body>
</html>
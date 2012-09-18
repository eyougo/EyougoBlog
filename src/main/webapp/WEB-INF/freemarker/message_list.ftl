<#import "commons/pager.ftl" as pager> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MESSAGES</title>
<link href="<@s.url value="/css/index.blog.css" includeParams="none"/>" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<@s.url value="/fckeditor/fckeditor.js" includeParams="none"/>"> </script>
<script type="text/javascript"> 
		$(document).ready(
			function() { 
				var sBasePath = "<@s.url value="/fckeditor/" includeParams="none"/>"  //获得fckeditor的路径 
				var oFCKeditor = new FCKeditor( 'message.content' ) ; 
				oFCKeditor.BasePath = sBasePath ; 
				oFCKeditor.Width = "70%";
				oFCKeditor.Height = "200px";
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
			if($.trim(getEditorHTMLContents("message.content")) == ''){
				alert("请输入留言内容");
				$('#content').focus();
				setEditorContents("message.content","")
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
		<@s.iterator id="message" value="messageList">
			<div id="nr">
				<h2>
				<@s.property value="#message.contact.nickname" />&nbsp;&nbsp;&nbsp;&nbsp;[<@s.date name="#message.messageDate"  format="yyyy-MM-dd HH:mm:ss"/>]
				&nbsp;&nbsp;&nbsp;&nbsp;<a href="#pmessage" onclick="reply('<@s.property value="#message.contact.nickname" />');">REPLY</a>
				<#if Session[stack.findValue("@com.eyougo.blog.comm.EyougoConstant@USER_SESSION_KEY")]?exists>
					<#if Session[stack.findValue("@com.eyougo.blog.comm.EyougoConstant@ADMIN_SESSION_KEY")]?exists>
							&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<@s.url action='adminMessage_delete' namespace='admin' includeParams='none'><@s.param name='messageId' value='#message.id'/></@s.url>">DELETE</a>
					</#if>
				</#if>
				</h2>
				<p><@s.property value="#message.content" escape="false"/></p> 
			</div><br>
		</@s.iterator>
		<br>
		<center><@pager.p perpage=action.pager.perPageNum offset=action.pager.offset totalnum=action.pager.totalNum  /> </center>
		<div id="pmessage">
				<h5>Post Message</h5> 
				<@s.form method="post" action="message_addexe" id="message"> 
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr id="replyTr" style="display:none;"> 
						 	<td cssClass="pd">
						 	<strong>Reply To:
						 	<@s.textfield name="replyTo" id="replyTo"  cssClass="pd" size="12" value="" readonly="true"/>
						 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 	<a href="####" onclick="cancel();">CANCEL!</a></strong> 
							</td>
						</tr>
						<tr> 
						 	<td>
						 	<strong>Your name:      <label>
						 	<@s.textfield name="message.contact.nickname" id="nickname"  cssClass="pd" size="12" value="%{user.contact.nickname}"/>
						 	</label></strong> 
							</td>
						</tr>
						<tr> 
						 	<td>
						 	<strong>Your email:      <label>
						 	<@s.textfield name="message.contact.email" id="email"  cssClass="pd" size="12" value="%{user.contact.email}"/>
						 	</label></strong> 
							</td>
						</tr>
						<tr> 
						 	<td>
						 	<strong>Your QQ:      <label>
						 	<@s.textfield name="message.contact.qq" id="qq"  cssClass="pd" size="12" value="%{user.contact.qq}"/>
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
						<tr>
     						<td width="100%">
     							<@s.textarea rows="6" cols="40" name="message.content" id="content"></@s.textarea>
     						</td>
     					</tr>
     					<tr>
     						<td>
     							<label>
									<a href="####"><img border="0" src="images/submit.gif" onclick="submitMessage();"/></a>
								</label>
							</td>
						</tr>
						
					</table>
				</@s.form>
			</div>
	</div>  
</body>
</html>
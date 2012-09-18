<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><@s.text name="user.register"/></title>
<link href="<@s.url value="/css/index.blog.css" includeParams="none"/>" rel="stylesheet" type="text/css" />
</head>
<body>
		<div id="mainbody">
			<div id="Register">
				<h5><@s.text name="user.register"/></h5>
				<@s.form id="regform" name="regform" method="post" action="regexe">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"> 
					<tr>
						<td align="right">
							<strong><@s.text name="user.register.username"/> :</strong>
						</td> 
						<td width="60%"  align="left">
							<label>
							<@s.textfield name="user.username" id="user.username" cssClass="pd" size="19" maxlength="20"/>
							<img src="images/a1.png" width="4" height="4" />
							</label>
						</td>
					</tr>
					<@s.fielderror theme="eyougo">
						<@s.param>user.username</@s.param>
					</@s.fielderror>
					<tr>
						<td align="right">
							<strong><@s.text name="user.register.nickname"/> :</strong>
						</td> 
						<td width="60%"  align="left">
							<label>
							<@s.textfield name="user.contact.nickname" id="user.contact.nickname" cssClass="pd" size="19" />
							<img src="images/a1.png" width="4" height="4" />
							</label>
						</td>
					</tr>
					<@s.fielderror theme="eyougo">
						<@s.param>user.contact.nickname</@s.param>
					</@s.fielderror>
					<tr>
						<td align="right">
							<strong><@s.text name="user.register.password"/> :</strong>
						</td> 
						<td width="60%"  align="left">
							<label>
							<@s.password name="user.password" id="user.password" cssClass="pd" size="20" />
							<img src="images/a1.png" width="4" height="4" />
							</label>
						</td>
					</tr>
					<@s.fielderror theme="eyougo">
						<@s.param>user.password</@s.param>
					</@s.fielderror>
					<tr>
						<td align="right">
							<strong><@s.text name="user.register.verifypassword"/> :</strong>
						</td>
						<td width="60%"  align="left">
							<label>
							<@s.password name="verifyPassword" id="verifyPassword" cssClass="pd" size="20" />
							<img src="images/a1.png" width="4" height="4" />
							</label>
						</td>
					</tr>
					<@s.fielderror theme="eyougo">
						<@s.param>verifyPassword</@s.param>
					</@s.fielderror>
					<tr>
						<td align="right">
							<strong><@s.text name="user.register.gender"/> :</strong>
						</td> 
						<td width="60%"  align="left">
							<label>
							<@s.radio name="user.sex" id="user.sex" list="{'Male','Female','Other'}" />
							</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<strong><@s.text name="user.register.email"/> :</strong>
						</td>
						<td width="60%"  align="left">
							<label>
							<@s.textfield name="user.contact.email" id="user.contact.email" cssClass="pd" size="19" />
							<img src="images/a1.png" width="4" height="4" />
							</label>
						</td>
					</tr>
					<@s.fielderror theme="eyougo">
						<@s.param>user.contact.email</@s.param>
					</@s.fielderror>
					<tr>
						<td align="right">
							<strong><@s.text name="user.register.msn"/> :</strong>
						</td>
						<td width="60%"  align="left">
							<label>
							<@s.textfield name="user.contact.msn" id="user.contact.msn" cssClass="pd" size="19" />
							</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<strong><@s.text name="user.register.qq"/> :</strong>
						</td>
						<td width="60%"  align="left">
							<label>
							<@s.textfield name="user.contact.qq" id="user.contact.qq" cssClass="pd" size="19" />
							</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<strong><@s.text name="user.register.homepage"/> :</strong>
						</td>
						<td width="60%"  align="left">
							<label>
							<@s.textfield name="user.contact.homepage" id="user.contact.homepage" cssClass="pd" size="19" />
							</label>
						</td>
					</tr>
					<tr>
						<td align="right">
							<strong><@s.text name="user.register.validatecode"/> :</strong>
						</td>
						<td align="left">
							<label>
							<@s.textfield name="validatecode" id="validatecode" cssClass="pd" size="19" /><img src="images/a1.png" width="4" height="4" />
							<img src="<@s.url action='validationCode'/>" style="cursor:hand;vertical-align:top" onclick="this.src='<@s.url action ='validationCode'/>';"/>
							</label>
						</td>
					</tr>
					<@s.fielderror theme="eyougo">
						<@s.param>validatecode</@s.param>
					</@s.fielderror>
				</table>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
					<td width="25%">&nbsp;</td>
					<td width="25%" align="center">
						<label>
						<a href="javascript:document.regform.submit()"><img border="0" src="images/submit.gif"/></a>
						</label>
					</td>
					<td width="25%" align="center">
						<label>
						<a href="javascript:this.document.regform.reset()"><img border="0" src="images/reset.gif"/></a>
						</label>
					</td>
					<td width="25%">&nbsp;</td>
					</tr>
				</table>
				</@s.form> 
			</div>
			<br>	
		</div>  
</body>
</html>

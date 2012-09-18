<div id="login">
<script type="text/javascript">
	$(document).ready(
        function loginfun(){
		$('#ex_loginform').submit(
			function(){
	        jQuery.ajax({
	            url: '<@s.url action='login'/>',
	            data: $('#ex_loginform').serialize(),
	            type: 'POST',
	            cache: false,
	            beforeSend: function() {
	                $('#wait').show();
	                $('#logindiv').hide();
	            },
				dataType: 'html',
	            success: function(data) {
	               $('#login').replaceWith(data);
	               loginfun();
	            }
	        });
	        return false;
	    });
	    $('#logout').click(
			function(){
	        jQuery.ajax({
	            url: '<@s.url action='logout'/>',
				dataType: 'html',
				cache: false,
				beforeSend: function() {
	                $('#wait').show();
	                $('#logindiv').hide();
	            },
	            success: function(data) {
	               $('#login').replaceWith(data);
	               loginfun();
	            }
	        });
	        return false;
	    });
	});
</script>
	<h1>User Login</h1>
	<div id="wait" style="display:none;">
	<table width="100%" height="100" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<div align="center"><strong>Welcome!</strong></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="center">
					<strong>Please wait......</strong>
				</div>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table></div>
	<div id="logindiv">
	<#if !Session[stack.findValue("@com.eyougo.blog.comm.EyougoConstant@USER_SESSION_KEY")]?exists>
	<@s.form name="loginform" method="post" action="login" id="ex_loginform" cssStyle="display:inline;">
	<table width="100%" height="100" border="0" cellpadding="2" cellspacing="0">
			<tr>
				<td colspan="2" align="center" valign="middle">
				<@s.property value="errorMessage"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" valign="middle">
				Username : <label><@s.textfield name="user.username" cssClass="username" maxlength="20"/></label>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center" valign="middle">
				Password : <label><@s.password name="user.password" cssClass="password"/></label>
				</td>
			</tr>
			<tr>
				<td width="50%" align="left" class="lo">
					<input type="image" alt="Submit" src="<@s.url value="/images/login.gif"/>" id="" value="Submit"/>
				</td>
				<td width="50%" align="left" class="re">
					<a href="<@s.url action='reg' includeParams='none'/>">
					<img border="0" src="<@s.url value="/images/register.gif"/>" />
					</a>
				</td>
			</tr>
	</table>
	</@s.form>
	<#else>
	<table width="100%" height="100" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<div align="center"><strong>Welcome! </strong><br>You are already logged in.</div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="center">
				<#if Session[stack.findValue("@com.eyougo.blog.comm.EyougoConstant@USER_SESSION_KEY")].isAdmin?exists>
					<#if Session[stack.findValue("@com.eyougo.blog.comm.EyougoConstant@USER_SESSION_KEY")].isAdmin==true>
						<a href="<@s.url action='adminLogin_input' namespace='/admin'/>" target="_blank">Manage</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</#if>
				</#if>
					<a href="####" id="logout">Logout</a>
				</div>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	</#if>
	</div>
</div>

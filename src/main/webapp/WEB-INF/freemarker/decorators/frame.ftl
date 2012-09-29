<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><sitemesh:write property="title"/></title>
	<script type="text/javascript" src="${rc.getContextPath()}/js/jquery.js"> </script>
	<script type="text/javascript" src="${rc.getContextPath()}/js/buildup.js"> </script>
	<sitemesh:write property="head"/>
</head>
<body topmargin="0">
	<div id="container">		
<div id="head"></div>
<div id="menu">
<ul>
	<li><a href="/index.jsp">BLOG</a></li>
	<li>
		<a href="/blog/list/7" title="TECH">TECH</a>
	</li>
	<li>
		<a href="/blog/list/8" title="DIARY">DIARY</a>
	</li>
	<li><a href="/message_list.action">MESSAGES</a></li>
	<li><a href="/link_list.action">LINKS</a></li>
</ul>
</div>	<div id="pagebody">
		<div id="sidebar">
<div id="login">
<script type="text/javascript">
	$(document).ready(
        function loginfun(){
		$('#ex_loginform').submit(
			function(){
	        jQuery.ajax({
	            url: '/login.action',
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
	            url: '/logout.action',
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
<form id="ex_loginform" name="loginform" action="/login.action" method="post" style="display:inline;">	<table width="100%" height="100" border="0" cellpadding="2" cellspacing="0">
			<tr>
				<td colspan="2" align="center" valign="middle">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" valign="middle">
				Username : <label><input type="text" name="user.username" maxlength="20" value="" id="ex_loginform_user_username" class="username"/></label>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center" valign="middle">
				Password : <label><input type="password" name="user.password" id="ex_loginform_user_password" class="password"/></label>
				</td>
			</tr>
			<tr>
				<td width="50%" align="left" class="lo">
					<input type="image" alt="Submit" src="/images/login.gif" id="" value="Submit"/>
				</td>
				<td width="50%" align="left" class="re">
					<a href="/reg.action">
					<img border="0" src="/images/register.gif" />
					</a>
				</td>
			</tr>
	</table>
</form>



	</div>
</div>
<div id="Categries">
<h1>Categries</h1>
<ul>
		<li>
		<a href="/blog/list/7" title="TECH">TECH&nbsp;&nbsp;&nbsp;&nbsp;13 </a>
	</li>
	<li>
		<a href="/blog/list/8" title="DIARY">DIARY&nbsp;&nbsp;&nbsp;&nbsp;8 </a>
	</li>
	<li>
		<a href="/message_list.action" title="MESSAGES">MESSAGES&nbsp;&nbsp;&nbsp;&nbsp;4</a>
	</li>
	<li>
		<a href="/link_list.action" title="LINKS">LINKS&nbsp;&nbsp;&nbsp;&nbsp;0</a>
	</li>
<li>
	VISITORS&nbsp;&nbsp;&nbsp;&nbsp;30242
</li></ul>
</div><div id="Blogs">
	<h1>Recent Articles</h1>
<ul>
		<li><a href="/blog/view/30" title="&#31243;&#24207;&#21592;&#35013;B&#25351;&#21335;-&#36716;" target="_blank">&#31243;&#24207;&#21592;&#35013;B&#25351;&#21335;-&#36716;</a></li>
	<li><a href="/blog/view/22" title="Flex&#20998;&#39029;&#32452;&#20214;EyougoPager 1.0Beta&#29256;" target="_blank">Flex&#20998;&#39029;&#32452;&#20214;EyougoPager 1.0Beta&#29256;</a></li>
	<li><a href="/blog/view/29" title="&#20851;&#20110;&#19968;&#36947;1&#21040;N&#33258;&#28982;&#25968;&#25490;&#24207;&#30340;&#21326;&#20026;&#38754;&#35797;&#39064;" target="_blank">&#20851;&#20110;&#19968;&#36947;1&#21040;N&#33258;&#28982;&#25968;&#25490;&#24207;&#30340;&#21326;&#20026;&#38754;&#35797;&#39064;</a></li>
	<li><a href="/blog/view/27" title="&#36229;&#24378;&#25913;&#36896;&#65306;FCKEditor&#19978;&#20256;&#25991;&#20214;&#19982;Struts2&#30340;&#23436;&#32654;&#32467;&#21512;" target="_blank">&#36229;&#24378;&#25913;&#36896;&#65306;FCKEditor&#19978;&#20256;&#25991;&#20214;&#19982;Struts2&#30340;&#23436;&#32654;&#32467;&#21512;</a></li>
	<li><a href="/blog/view/28" title="JAVA&#24320;&#21457;&#20026;&#20160;&#20040;&#26159;&#36825;&#26679;&#30340;" target="_blank">JAVA&#24320;&#21457;&#20026;&#20160;&#20040;&#26159;&#36825;&#26679;&#30340;</a></li>
</ul>
<div class="m1"><a href="/blog/list/">More</a></div>
</div><div id="Blogs">
	<h1>Recent Comments</h1>
<ul>
		<li><a href="/blog/view/14" target="_blank">你好，有项目原代码吗？能给我一分不？
<a href="mailto:niusr@softroad.com.cn">niusr@softroad.com.cn</a></a></li>
	<li><a href="/blog/view/16" target="_blank">&nbsp;你好 我也想要源代码 谢谢了1156662435@qq.com</a></li>
	<li><a href="/blog/view/16" target="_blank">你好，能把项目源码发一份给我吗？谢谢。
邮箱：<a href="mailto:longchao5@163.com">longchao5@163.com</a></a></li>
	<li><a href="/blog/view/16" target="_blank">刚才邮箱写错了

应该是这个: wanqfg@163.com</a></li>
	<li><a href="/blog/view/16" target="_blank">能否把你的工程文件打包发给我学习学习,谢谢

我的邮箱 <a href="mailto:wangqfg@163.com">wangqfg@163.com</a></a></li>
</ul>
</div><div id="Blogs">
	<h1>Recent Messages</h1>
<ul>
		<li><a href="/message_list.action" >测试验证码</a></li>
	<li><a href="/message_list.action" >诚征友情链接！留言即可！</a></li>
	<li><a href="/message_list.action" >有啥话您就说，别客气&hellip;&hellip;</a></li>
	<li><a href="/message_list.action" >欢迎光临哦<img alt="" src="http://ja00247.j01.netjsp.com/fckeditor/editor/images/smiley/qq2007/05.gif" /></a></li>
</ul>
<div class="m1"><a href="/message_list.action">More</a></div>
</div><div id="Blogs">
	<h1>Main Links</h1>
<ul>
	</ul>
<div class="m1"><a href="/link_list.action">More</a></div>
</div>		</div>
		

		<sitemesh:write property="body"/>
	</div>
	<page:applyDecorator page="A.jsp" name="nomalpanel"></page:applyDecorator> 
	[#include "/commons/footer.ftl"]
	</div>
</body>
</html>
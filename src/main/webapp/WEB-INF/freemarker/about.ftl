<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ABOUT</title>
</head>
<body>
		<div id="mainbody">
			<h5>ABOUT</h5>
			<div id="nr">
				<h2><b>关于我</b></h2>
				<div class="about">
				<img title="头像" 
				src="${gravatar}" alt="头像" width="200" height="200">
				<br/><div class="bl">基本信息</div>
				<br/>
				<ul>
					<#list baseAbouts as about>
					<li><strong>${about.id}：</strong>${about.aboutValue}</li>
					</#list>
				</ul>
				</div>
				<br/>
				<h3>
				<div class="bl">个人简介</div>
				${aboutMe}
				</h3>
				<br/>
				<h2><b>关于本站</b></h2>
				<div class="sm"><p>${aboutSite}</p></div>
				<br/>
			</div>
		</div>  
</body>
</html>
		
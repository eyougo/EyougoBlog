<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="${rc.contextPath}/css/admin_style.css">
		<title>日志管理</title>
		
		<!-- js calendar -->
		<link rel="stylesheet" type="text/css" media="all" href="${rc.contextPath}/js/jscalendar/calendar-blue.css"/>
		<script type="text/javascript" src="${rc.contextPath}/js/jscalendar/calendar.js"></script>
		<script type="text/javascript" src="${rc.contextPath}/js/jscalendar/lang/cn_utf8.js"></script>
		<script type="text/javascript" src="${rc.contextPath}/js/jscalendar/calendar-setup.js"></script>
		<!-- js calendar -->
		<script src="http://lib.sinaapp.com/js/jquery/1.7.2/jquery.min.js"></script>
		<!-- FCKEditor -->
		<script type="text/javascript" src="${rc.contextPath}/fckeditor/fckeditor.js"> </script> 
		<script type="text/javascript" src="${rc.contextPath}/js/buildup.js"></script>
		<script type="text/javascript"> 
		$(
			function() { 
				var sBasePath = "${rc.contextPath}/fckeditor/"; //获得fckeditor的路径 		
				var oFCKeditor = new FCKeditor( 'content' ) ; 
				oFCKeditor.BasePath = sBasePath ; 
				oFCKeditor.Width = "95%";
				oFCKeditor.Height = "400px";
				oFCKeditor.ToolbarSet = "BlogContent";
				oFCKeditor.ReplaceTextarea() ; 
				
				var obFCKeditor = new FCKeditor( 'summary' ) ; 
				obFCKeditor.Width = "70%";
				obFCKeditor.Height = "200px";
				obFCKeditor.ToolbarSet = "BlogSummary";
				obFCKeditor.BasePath = sBasePath ; 
				obFCKeditor.ReplaceTextarea() ;
			} 
		);
		</script> 
		<!-- end of FCKEditor --> 
		
		<script language="javascript">
//灾难恢复 把日志暂时存储在粘贴板上
function copyclip(meintext)
    {
     if (window.clipboardData){
	 if (window.clipboardData.setData("Text", meintext)){
			alert('日志已经复制到了粘贴板');
			return true;
	   }
	   else {
			alert('复制失败\n请允许网页访问"剪切板"');
			return false;
		}
      }else if (window.netscape) { 
       try{
       	netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
       } catch (e) {
          alert("被浏览器拒绝！\n请在浏览器地址栏输入'about:config'并回车\n然后将'signed.applets.codebase_principal_support'设置为'true'");
		  return false;
       }

       var clip = Components.classes['@mozilla.org/widget/clipboard;1']
                     .createInstance(Components.interfaces.nsIClipboard);
       if (!clip) return false;
       

       var trans = Components.classes['@mozilla.org/widget/transferable;1']
                      .createInstance(Components.interfaces.nsITransferable);
       if (!trans) return false;
       
       trans.addDataFlavor('text/unicode');
       
       var str = new Object();
       var len = new Object();
       
       var str = Components.classes["@mozilla.org/supports-string;1"]
                    .createInstance(Components.interfaces.nsISupportsString);
       
       var copytext=meintext;
       
       str.data=copytext;
       
       trans.setTransferData("text/unicode",str,copytext.length*2);
       
       var clipid=Components.interfaces.nsIClipboard;
       
       if (!clip) return false;
       
       clip.setData(trans,null,clipid.kGlobalClipboard);
       
       }
	   alert('日志已经复制到了粘贴板');
       return true;
    }
//用户自定义函数---检测表单填写
function checkpostdata()
{ 
  if(document.getElementById("title").value=="" || document.getElementById("title").value.length>255)
  {alert("标题不能为空,并且不能超过255个字符");
  document.getElementById("title").focus();
  return false;
  }
  if(getEditorTextContents("content").trim()=="")
  {alert("内容不能为空");
  return false;
  }
  if(document.getElementById("category").value=="")
  {alert("你没有选择分类");
	  document.getElementById("category").focus();
	  return false;
  }
  if (getEditorTextContents("summary").trim()==""&&document.getElementById("isAutoSummary").checked==false)
  {
	alert("请填写摘要或选择自动生成摘要");
	return false;
  }
   copyclip(document.getElementById("content").value);
   return true;
  
}

</script>
	</head>
	<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0"
		class="bgcolor">
		<form action="${rc.contextPath}/admin/blog/edit" method="post" name="blogform"
			onsubmit="javascript:return checkpostdata();">
			<table width="98%" border="0" align=center cellpadding="2"
				cellspacing="1" bgcolor="#FFFFFF" class="border">
				<tr>
					<th colspan="5" class="topbg">
						日志修改
						<!-- 列表页面搜索条件 -->
						<input type="hidden" name="scategory" value="${scategory}"/>
						<input type="hidden" name="stype" value="${stype}"/>
						<input type="hidden" name="keywords" value="${keywords}"/>
						<input type="hidden" name="page" value="${page}"/>
						<!-- 日志属性 -->
						<input type="hidden" name="id" value="${blog.id}"/>
					</th>
				</tr>
				<tr>
					<td class="tdbg" width="10%">
						<div align="right">
							<font color="red">*</font>日志标题：
						</div>
					</td><option value="">选择分类</option>
					<td class="tdbg" colspan="4">
						<input type="text" name="title" id="title" value="${blog.title}" style="width:500;"/>
						最多不应超过50字
					</td>
				</tr>
				<tr>
					<td class="tdbg">
						<div align="right">
							<font color="red">*</font>日志分类：
						</div>
					</td>
					<td class="tdbg" colspan="4">
						<label>
							<select name="category.id" id="category">
								<option value="">选择分类</option>
								<#list categories as category>
      							<option value="${category.id}" <#if category.id==blog.category.id>selected</#if>>${category.category}</option>
      							</#list>
							<select>
						</label>
						<input type="button" name="havesummary" value="隐藏摘要框"
							style="border: solid 1px"
							onclick="if(this.value=='显示摘要框'){this.value='隐藏摘要框';abstract.style.display='';}else{this.value='显示摘要框';abstract.style.display='none';}" />
					</td>
				</tr>
				<tr id="abstract">
					<td class="tdbg">
						<div align="right">
							日志摘要：
						</div>
					</td>
					<td class="tdbg" colspan="4">
						<textarea rows="6" cols="40" name="summary" id="summary">${blog.summary?html}</textarea>
					</td>
				</tr>
				<tr>
					<td class="tdbg">
						<div align="right">
							<font color="red">*</font>日志正文：
						</div>
					</td>
					<td class="tdbg" colspan="8">
						<textarea rows="6" cols="60" name="content" id="content">${blog.content?html}</textarea>
					</td>
				</tr>
				<tr>
					<td class="tdbg" height="26">
						<div align="right">
							高级选项：
						</div>
					</td>
					<td class="tdbg" width="30%">
						置顶（值越大越靠前）
						<select name="top" id="top">
							<option value="0"  <#if blog.top==0>selected</#if>>不置顶</option>
							<option value="1"  <#if blog.top==1>selected</#if>>置顶一</option>
							<option value="2"  <#if blog.top==2>selected</#if>>置顶二</option>
							<option value="3"  <#if blog.top==3>selected</#if>>置顶三</option>
						</select>
					</td>
					<td class="tdbg" width="20%">
						允许回复
						<select name="cmtUser" id="cmtUser">
							<option value="0" <#if blog.cmtUser==0>selected</#if>>允许</option>
							<option value="-1" <#if blog.cmtUser==-1>selected</#if>>不允许</option>
						<select>
					</td>
					<td class="tdbg" width="20%">
						原创声明
						<input type="checkbox" name="copyright" id="copyright" value="true" <#if blog.copyright==true>checked</#if>/>
					</td>
					<td class="tdbg" width="20%">
						存为草稿
						<input type="checkbox" name="isDraft" id="isDraft" value="true" <#if blog.isDraft==true>checked</#if>/>
					</td>
				</tr>
				<tr>
					<td class="tdbg">
						<div align="right">
							日志心情：
						</div>
					</td>
					<td class="tdbg" colspan="8">
						<input name="emotion" type="radio" value="0" <#if blog.emotion==0>checked</#if>>
						无
						<input name="emotion" type="radio" value="1" <#if blog.emotion==1>checked</#if>>
						<img src="${rc.contextPath}/images/emotion/em01.gif" width="19" height="19">
						<input type="radio" name="emotion" value="2" <#if blog.emotion==2>checked</#if>>
						<img src="${rc.contextPath}/images/emotion/em02.gif" width="19" height="19">
						<input type="radio" name="emotion" value="3" <#if blog.emotion==3>checked</#if>>
						<img src="${rc.contextPath}/images/emotion/em03.gif" width="19" height="19">
						<input type="radio" name="emotion" value="4" <#if blog.emotion==4>checked</#if>>
						<img src="${rc.contextPath}/images/emotion/em04.gif" width="19" height="19">
						<input type="radio" name="emotion" value="5" <#if blog.emotion==5>checked</#if>>
						<img src="${rc.contextPath}/images/emotion/em05.gif" width="19" height="19">
						<input type="radio" name="emotion" value="6" <#if blog.emotion==6>checked</#if>>
						<img src="${rc.contextPath}/images/emotion/em06.gif" width="19" height="19">
						<input type="radio" name="emotion" value="7" <#if blog.emotion==7>checked</#if>>
						<img src="${rc.contextPath}/images/emotion/em07.gif" width="19" height="19">
						<input type="radio" name="emotion" value="8" <#if blog.emotion==8>checked</#if>>
						<img src="${rc.contextPath}/images/emotion/em08.gif" width="19" height="19">
						<input type="radio" name="emotion" value="9" <#if blog.emotion==9>checked</#if>>
						<img src="${rc.contextPath}/images/emotion/em09.gif" width="19" height="19">
					</td>
				</tr>
				<tr>
					<td class="tdbg">
						<div align="right">
							发布日期：
						</div>
					</td>
					<td class="tdbg" colspan="8">
							<input type="text" name="date" id="date" value=${blog.date}style="width:200;"/>
							<input type="button" id="trigger" value=">>>" />
							<script type="text/javascript">
									document.getElementById("date").value=new Date().format("yyyy-MM-dd hh:mm:ss");
									Calendar.setup({
										inputField : "date", // ID of the input field
										ifFormat : "%Y-%m-%d %H:%M:%S", // the date format
										showsTime : true,
										button  : "trigger"
									});
							</script>
					</td>
				</tr>
				<tr>
					<td class="tdbg">
						&nbsp;
					</td>
					<td class="tdbg" colspan="8">
						<div align="center">
							<input type="submit" name="Submit3" value="提交">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" name="Submit22" value="返回" onclick="javascript:window.history.back();">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

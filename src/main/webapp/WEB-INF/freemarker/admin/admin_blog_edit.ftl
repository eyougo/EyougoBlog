<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<s:url value="/css/admin_style.css" includeParams="none"/>">
		<title>日志管理</title>
		
		<!-- js calendar -->
		<link rel="stylesheet" type="text/css" media="all" href="<s:url value="/js/jscalendar/calendar-blue.css" includeParams="none"/>"/>
		<script type="text/javascript" src="<s:url value="/js/jscalendar/calendar.js" includeParams="none"/>"></script>
		<script type="text/javascript" src="<s:url value="/js/jscalendar/lang/cn_utf8.js" includeParams="none"/>"></script>
		<script type="text/javascript" src="<s:url value="/js/jscalendar/calendar-setup.js" includeParams="none"/>"></script>
		<!-- js calendar -->
		
		<!-- FCKEditor -->
		<script type="text/javascript" src="<s:url value="/fckeditor/fckeditor.js" includeParams="none"/>"> </script> 
		<script type="text/javascript" src="<s:url value="/js/buildup.js" includeParams="none"/>"></script>
		<script type="text/javascript"> 
		window.onload = function() { 
			var sBasePath = "<s:url value="/fckeditor/" includeParams="none"/>"  //获得fckeditor的路径 		
			var oFCKeditor = new FCKeditor( 'blog.content' ) ; 
			oFCKeditor.BasePath = sBasePath ; 
			oFCKeditor.Width = "95%";
			oFCKeditor.Height = "400px";
			oFCKeditor.ToolbarSet = "BlogContent";
			oFCKeditor.ReplaceTextarea() ; 
			
			var obFCKeditor = new FCKeditor( 'blog.summary' ) ; 
			obFCKeditor.Width = "70%";
			obFCKeditor.Height = "200px";
			obFCKeditor.ToolbarSet = "BlogSummary";
			obFCKeditor.BasePath = sBasePath ; 
			obFCKeditor.ReplaceTextarea() ;
			
		} 
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
  if(getEditorHTMLContents("blog.content")=="")
  {alert("内容不能为空");
  return false;
  }
  if(document.getElementById("category").value=="0")
  {alert("你没有选择分类");
	  document.getElementById("category").focus();
	  return false;
  }
  if (getEditorHTMLContents("blog.summary")==""&&document.getElementById("isAutoSummary").checked==false)
  {
	alert("请填写摘要或选择自动生成摘要");
	return false;
  }
   copyclip(document.getElementById("content").value);
   return true;
  
}

</script>
<s:actionerror theme="eyougo"/>
	</head>
	<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0"
		class="bgcolor">
		<form action="adminBlog_editexe.action" method="post" name="blogform"
			onsubmit="javascript:return checkpostdata();">
			<table width="98%" border="0" align=center cellpadding="2"
				cellspacing="1" bgcolor="#FFFFFF" class="border">
				<tr>
					<th colspan="5" class="topbg">
						日志修改
						<!-- 列表页面搜索条件 -->
						<s:hidden name="scategory" value="%{#parameters['blog.category.id'][0]}"/>
						<s:hidden name="stype" value="%{#parameters['stype'][0]}"/>
						<s:hidden name="keywords" value="%{#parameters['keywords'][0]}"/>
						<s:hidden name="pager.offset" value="%{#parameters['pager.offset'][0]}"/>
						<!-- 日志属性 -->
						<s:hidden name="blog.id" value="%{blog.id}"/>
						<s:hidden name="blog.commentsNum" value="%{blog.commentsNum}"/>
						<s:hidden name="blog.bit" value="%{blog.bit}"/>
					</th>
				</tr>
				<tr>
					<td class="tdbg" width="10%">
						<div align="right">
							<font color="red">*</font>日志标题：
						</div>
					</td>
					<td class="tdbg" colspan="4">
						<s:textfield name="blog.title" id="title" cssStyle="width:300;"/>
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
							<s:select name="blog.category.id" id="category" headerKey="0"
								headerValue="选择分类" list="categorys" listKey="id"
								listValue="category">
							</s:select>
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
						<s:textarea rows="6" cols="40" name="blog.summary" id="summary"></s:textarea>
					</td>
				</tr>
				<tr>
					<td class="tdbg">
						<div align="right">
							<font color="red">*</font>日志正文：
						</div>
					</td>
					<td class="tdbg" colspan="8">
						<s:textarea rows="6" cols="60" name="blog.content" id="content"></s:textarea>
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
						<s:select name="blog.top" list="#{0:'不置顶',1:'置顶一',2:'置顶二',3:'置顶三'}">
						</s:select>
					</td>
					<td class="tdbg" width="20%">
						允许回复
						<s:select name="blog.cmtUser" id="cmtUser"
							list="#{0:'游客',1:'用户',-1:'不可评论'}">
						</s:select>
					</td>
					<td class="tdbg" width="20%">
						原创声明
						<s:checkbox name="blog.copyright" id="copyright" fieldValue="true" />
					</td>
					<td class="tdbg" width="20%">
						存为草稿
						<s:checkbox name="blog.isDraft" id="isDraft" fieldValue="true" />
					</td>
				</tr>
				<tr>
					<td class="tdbg">
						<div align="right">
							日志心情：
						</div>
					</td>
					<td class="tdbg" colspan="8">
					<s:property value="blog.emotion"/>
					<s:radio name="blog.emotion" list="#{0:'无',1:'<img src=\"../images/emotion/em01.gif\" width=\"19\" height=\"19\">',2:'<img src=\"../images/emotion/em02.gif\" width=\"19\" height=\"19\">',3:'<img src=\"../images/emotion/em03.gif\" width=\"19\" height=\"19\">',4:'<img src=\"../images/emotion/em04.gif\" width=\"19\" height=\"19\">',5:'<img src=\"../images/emotion/em05.gif\" width=\"19\" height=\"19\">',	6:'<img src=\"../images/emotion/em06.gif\" width=\"19\" height=\"19\">',7:'<img src=\"../images/emotion/em07.gif\" width=\"19\" height=\"19\">',8:'<img src=\"../images/emotion/em08.gif\" width=\"19\" height=\"19\">',9:'<img src=\"../images/emotion/em08.gif\" width=\"19\" height=\"19\">'}" listKey="key" listValue="value"/>
					</td>
				</tr>
				<tr>
					<td class="tdbg">
						<div align="right">
							发布日期：
						</div>
					</td>
					<td class="tdbg" colspan="8">
							<s:textfield name="blog.date" id="date" cssStyle="width:200;"/>
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

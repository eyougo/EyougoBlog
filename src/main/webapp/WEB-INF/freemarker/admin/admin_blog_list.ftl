<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${rc.getContextPath()}/css/admin_style.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"> </script>
<title>日志管理</title>
<script type="text/javascript">
 		function pageChange(page){
            $("#page").val(page);
            $("#search").submit();
        }
</script>
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0" class="bgcolor" >
	<form name="search" id="search" method="post" action="${rc.getContextPath()}/admin/blog/list">
 	<table width="98%" border="0" align=center cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" class="border">
    <tr>
      <th class="topbg" colspan="6" align="center">日志管理</th>
    </tr>
    <tr>
      <td class="tdbg" width="10%">日志分类
      <div align="center"></div></td>
      <td class="tdbg" width="21%">
      	<select name="categoryId">
      		<option value="0">全部</option>
      		<#list categories as category>
      			<option value="${category.id}" <#if category.id==categoryId>selected</#if>>${category.category}</option>
      		</#list>
      	</select>
      </td>
      <td class="tdbg" width="13%">标题内容</td>
      <td class="tdbg" width="24%">
      <select name="stype">
      		<option value="title" <#if stype=='title'>selected</#if>>标题</option>
      		<option value="content" <#if stype=='content'>selected</#if>>内容</option>
      </select>
      </td>
      <td class="tdbg" width="24%">
      	<input type="text" name="keywords" value="${keywords}"/>
      	<input type="hidden" name="page" id="page" value="1"/>
      </td>
      <td class="tdbg" width="8%"><input type="submit" name="Submit" value="提交"></td>
    </tr><tr> <td class="tdbg" colspan="6">如果查找所有日志，请在关键字处留空</td></tr>
  </table>
</form>

  <script language="JavaScript">
  function checkAll()
{
  for (var i=0;i<document.blogs.elements.length;i++)
    {
    var e = document.blogs.elements[i];
    if (e.name != "allselect" && e.name != "operation")
       e.checked = document.all.allselect.checked;
    }
}
	function check()
	{	
		var delmore=document.getElementsByName("operation");
		for (var i=0;i<delmore.length ;i++ )
		{	
		  if (delmore[i].checked)
			{
				if (delmore[i].value=="delmore")
				{
					return confirm("确实要删除吗？\n与这篇日志相关的评论也将被删除");
				}
			}
		}
	}
  </script>
  <FORM METHOD=POST ACTION="${rc.getContextPath()}/admin/blog/manage" name="blogs" id="blogs" onSubmit="return check()">
  <table width="98%" border="0" align=center cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" class="border">
  <tr>
    <td class="topbg" colspan="7"><div align="center">总共搜索到${pager.totalNum}条符合要求的记录</div></td>
  </tr>
  <tr>
    <td class="tdbg" width="6%">选中</td>
    <td class="tdbg" width="17%"><div align="center">分类</div></td>
    <td class="tdbg" width="31%"><div align="center">标题</div></td>
    <td class="tdbg" width="7%">点/评</td>
    <td class="tdbg" width="16%"><div align="center">时间</div></td>
    <td class="tdbg" colspan="2"><div align="center">操作</div></td>
  </tr>
  <#list blogList as blog>
  <tr>
    <td class="tdbg">
      <div align="left">
        <input type="checkbox" name="blogIds"  value="${blog.id}" />
      </div></td>
    <td class="tdbg">${blog.category.category}</td>
    <td class="tdbg"><a href="${rc.getContextPath()}/blog/view/${blog.id}" target="_blank">${blog.title}</a></td>
    <td class="tdbg">${blog.bit}/${blog.commentsNum}</td>
    <td class="tdbg">${blog.date}</td>
    <td class="tdbg" width="11%"><div align="center"><a href="${rc.getContextPath()}/admin/blog/edit?id=${blog.id}">修改</a></div></td>
    <td class="tdbg" width="12%"><div align="center"><a href="${rc.getContextPath()}/admin/blog/delete?id=${blog.id}" onClick="return confirm('是否删除?\n与这篇日志相关的评论也将被删除.')">删除</a></div></td>
  </tr>
  </#list>
  
 <tr>
    <td class="tdbg"><input type="checkbox" name="allselect" value="allselect" onClick="javascript:checkAll()"></td>
    <td class="tdbg">全选</td>
    <td class="tdbg"><INPUT TYPE="radio" NAME="operation" value="delmore">删除<INPUT TYPE="radio" NAME="operation" value="moveto">移动到
    <select name="toCategoryId">
      	<#list categories as category>
      		<option value="${category.id}">${category.category}</option>
      	</#list>
     </select>
    &nbsp;&nbsp;发布<INPUT TYPE="radio" NAME="operation" value="publish">
	</td>
    <td class="tdbg"><INPUT TYPE="submit" value="操作">
    </td>
    <td class="tdbg">&nbsp;</td>
    <td class="tdbg" colspan="2">&nbsp;</td>
  </tr>
  <tr>
  	<td colspan="7" background="../images/admin/topbg.gif">
	    <div align="center" class="tile_white">
	    <font color="white">
	    	<#if pager.prePage??><a href="javascript:pageChange(${pager.page-1});">Previous</a></#if>
			&nbsp;&nbsp;
			<#list pager.naviPages as naviPage>
				<a href="javascript:pageChange(${naviPage});">
					<#if naviPage==pager.page><b></#if>
					${naviPage}
					<#if naviPage==pager.page></b></#if>
				</a>
				&nbsp;
			</#list>
			&nbsp;
			<#if pager.nextPage??><a href="javascript:pageChange(${pager.page+1});">Next</a></#if>
  		</font>
        </div>
    </td>
  </tr>
  </table>
</FORM>
</body>
</html>


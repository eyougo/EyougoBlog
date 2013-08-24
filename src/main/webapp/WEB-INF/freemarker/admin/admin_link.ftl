<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${rc.getContextPath()}/css/admin_style.css">
    <script src="http://lib.sinaapp.com/js/jquery/1.7.2/jquery.min.js"></script>
<#--
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"> </script>
-->
    <title>友情链接管理</title>
    <script type="text/javascript">
        function pageChange(page){
            $("#page").val(page);
            $("#search").submit();
        }
    </script>
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0" class="bgcolor" >
<table width="98%" border="0" align=center cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" class="border">
    <tr>
        <th class="topbg" colspan="6" align="center">友情链接管理</th>
    </tr>
</table>
<form name="add" id="add" method="post" action="${rc.getContextPath()}/admin/link/add">
    <table width="98%" border="0" align=center cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" class="border">
        <tr>
            <td class="tdbg" width="20%">名称:<input type="text" name="linkname" value="" /></td>
            <td class="tdbg" width="30%">url:<input type="text" size="40" name="linkurl" value="" /></div></td>
            <td class="tdbg" width="20%">logo:<input type="text" name="linklogo" value="" /></td>
            <td class="tdbg" width="10%">置顶:<input type="text" size="2" maxlength="2" name="emotion" value="" /></td>
            <td class="tdbg" width="15%">是否首页:<select name="show"><option value="true">是</option><option value="true">否</option></select> </td>
            <td class="tdbg"><input type="submit" value="增加"/> </td>
        </tr>
    </table>
</form>

<script language="JavaScript">
    $(document).ready(function(){
        $("#allselect").click(function(){
            $("input[name='linkIds']").attr("checked",this.checked);
        });
    })
    function check()
    {
        return confirm("确实要删除吗？");
    }
</script>
<FORM METHOD=POST ACTION="${rc.getContextPath()}/admin/link/delete" name="manage" id="manage" onSubmit="return check()">
    <table width="98%" border="0" align=center cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" class="border">
        <tr>
            <td class="tdbg" width="6%">选中</td>
            <td class="tdbg" width="20%"><div align="center">名称</div></td>
            <td class="tdbg"><div align="center">LOGO</div></td>
            <td class="tdbg"><div align="center">置顶</div></td>
            <td class="tdbg"><div align="center">是否首页</div></td>
        </tr>
    <#list linkList as link>
        <tr>
            <td class="tdbg">
                <div align="left">
                    <input type="checkbox" name="linkIds"  value="${link.id}" />
                </div>
            </td>
            <td class="tdbg"><a href="${link.linkurl}" target="_blank">${link.linkname}</a></td>
            <td class="tdbg"><#if link.linklogo??><img src="${link.linklogo}"/></#if></td>
            <td class="tdbg">${link.emotion}</td>
            <td class="tdbg"><#if link.show>是<#else>否</#if></td>
        </tr>
    </#list>

        <tr>
            <td class="tdbg"><input type="checkbox" name="allselect" id="allselect" value="allselect">全选</td>
            <td class="tdbg">
                <INPUT TYPE="submit" value="删除">
            </td>
            <td class="tdbg" colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="6" background="${rc.getContextPath()}/images/admin/topbg.gif">
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


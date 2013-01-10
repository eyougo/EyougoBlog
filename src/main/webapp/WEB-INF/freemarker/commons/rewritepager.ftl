<#-- urlrewrite模式的分页-->
<#macro p perpage totalnum offset url='' params='' maxsteps=6>  
    <#assign iperpage=perpage?number>
    <#assign itotalnum=totalnum?number> 
    <#assign ioffset=offset?number>  
    <#if maxsteps <= 0>  
        <#assign maxsteps=5>  
    </#if>  
    <#-- 总页数-->
    <#if (itotalnum%iperpage==0)>  
    	<#assign totalpage = (itotalnum/iperpage)?int>
    <#else>
    	<#assign totalpage = (itotalnum/iperpage)?int+1>	
    </#if>
    <#-- 当前页数-->
    <#assign ipage = ( (ioffset)/iperpage)?int +1>  
    <#-- 页数的当前组数-->
    <#assign stepsNow = ((ipage - 1) / maxsteps)?int>  
    
    <#-- 页数的最后一组数-->
    <#assign stepsLast = ((totalpage - 1) / maxsteps)?int>  
       
    <#-- url及附加参数的判断 -->  
    <#assign requestParams = "">  
    <#if (params?exists && params != '')>  
        <#assign requestParams = '?' + params>  
    </#if>
    
    <#assign thisurl = "">
    <#if (url?exists && url != '')>  
        <#assign thisurl = url + '-' >  
    </#if>  
       
    <#-- 首页 -->  
    <#if ipage gt 1>  
        <a href="${thisurl}offset-0${requestParams}">&lt;&lt;</a>  
    <#else>  
        <span class="disabled">&lt;&lt;</span>  
    </#if>  
    <#-- 前组-->  
    <#if stepsNow gt 0>  
        <a href="${thisurl}offset-${stepsNow * maxsteps * iperpage}${requestParams}">……</a>  
    <#else>  
        <span class="disabled">……</span>  
    </#if>  
    <#-- 当前组中的页号-->  
    <#if (stepsNow + 1) * maxsteps < totalpage>  
        <#assign pagelist = (stepsNow + 1) * maxsteps>  
    <#else>  
        <#assign pagelist = totalpage>  
    </#if>  
    <#if ipage gt 0 && ipage lte totalpage>  
        <#list (stepsNow * maxsteps + 1)..pagelist as num>  
            <#if ipage != num>  
                <a href="${thisurl}pager-${(num-1) * iperpage }${requestParams}">${num}</a>  
            <#else>  
                <strong>${num}</strong>  
            </#if>  
        </#list>  
    </#if>  
    <#-- 下组 -->  
    <#if stepsNow lt stepsLast>  
        <a href="${thisurl}offset-${(stepsNow + 1) * maxsteps * iperpage}${requestParams}">……</a>  
    <#else>  
        <span class="disabled">……</span>  
    </#if>  
    <#-- 尾页 -->  
    <#if ipage lt totalpage>  
        <a href="${thisurl}offset-${(totalpage - 1)*iperpage}${requestParams}">&gt;&gt;</a>  
    <#else>  
        <span class="disabled">&gt;&gt;</span>  
    </#if>  
    <#-- 前一页 -->  
    <#if ipage gt 1>  
        <a href="${thisurl}offset-${ioffset - iperpage}${requestParams}"><@s.text name="pager.previous"/></a>  
    <#else>  
        <span class="disabled"><@s.text name="pager.previous"/></span>  
    </#if>  
    <#-- 后一页 -->  
    <#if ipage lt totalpage>  
        <a href="${thisurl}offset-${ioffset + iperpage}${requestParams}"><@s.text name="pager.next"/></a>  
    <#else>  
        <span class="disabled"><@s.text name="pager.next"/></span>  
    </#if>  
</#macro>  

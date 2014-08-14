<#import "commons/pager.ftl" as pager> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${blog.title}</title>
<link href="${rc.getContextPath()}/js/syntaxhighlighter/styles/shCore.css" rel="stylesheet" type="text/css" />
<link href="${rc.getContextPath()}/js/syntaxhighlighter/styles/shThemeDefault.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${rc.getContextPath()}/fckeditor/fckeditor.js"> </script>
<script type="text/javascript" src="${rc.getContextPath()}/js/syntaxhighlighter/scripts/shCore.js"></script>
<script type="text/javascript" src="${rc.getContextPath()}/js/syntaxhighlighter/scripts/shBrushCss.js"></script>
<script type="text/javascript" src="${rc.getContextPath()}/js/syntaxhighlighter/scripts/shBrushGroovy.js"></script>
<script type="text/javascript" src="${rc.getContextPath()}/js/syntaxhighlighter/scripts/shBrushCpp.js"></script>
<script type="text/javascript" src="${rc.getContextPath()}/js/syntaxhighlighter/scripts/shBrushJava.js"></script>
<script type="text/javascript" src="${rc.getContextPath()}/js/syntaxhighlighter/scripts/shBrushJScript.js"></script>
<script type="text/javascript" src="${rc.getContextPath()}/js/syntaxhighlighter/scripts/shBrushRuby.js"></script>
<script type="text/javascript" src="${rc.getContextPath()}/js/syntaxhighlighter/scripts/shBrushSql.js"></script>
<script type="text/javascript" src="${rc.getContextPath()}/js/syntaxhighlighter/scripts/shBrushXml.js"></script>
<script type="text/javascript">

      SyntaxHighlighter.config.clipboardSwf = '${rc.getContextPath()}/js/syntaxhighlighter/scripts/clipboard.swf';
      SyntaxHighlighter.all();

</script>
</head>
<body>
      <div id="mainbody">
          <div id="tp">
              <h2>
                  <b><a href="${rc.getContextPath()}/blog/view/${blog.id}">${blog.title}</a></b>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${blog.date}
              </h2>
              <h3 class="bb">
                  View: ${blog.blogView.view} |
                  <a href="${rc.getContextPath()}/blog/view/${blog.id}#comments" class="bl">Comments: ${blog.commentsNum}</a> |
                  <a href="${rc.getContextPath()}/blog/list/${blog.category.id}-1" class="bl">Category: ${blog.category.category}</a>
                  <#if originalNote??>
                   | ${originalNote}
                  </#if>
              </h3>
              <div class="sm">
                  <p>
                      ${blog.content}
                  </p>
              </div>
              <h3>&nbsp;&nbsp;&nbsp;&nbsp;
              <#if previousBlog??>
              PREVIOUS:&nbsp;<a href="${rc.getContextPath()}/blog/view/${previousBlog.id}" class="bl">${previousBlog.title}</a>&nbsp;&nbsp;
              </#if>
              <br/>&nbsp;&nbsp;&nbsp;&nbsp;
              <#if nextBlog??>
              NEXT:&nbsp;<a href="${rc.getContextPath()}/blog/view/${nextBlog.id}" class="bl">${nextBlog.title}</a>&nbsp;&nbsp;
              </#if>
              </h3>
              <br>
          </div>
          <br>
          <a name="comments" id="comments"></a>
          <#list blog.comments as comment>
              <div id="nr">
                  <h2>
                      <a name="${comment.id}" id="${comment.id}"></a>
                      ${comment.contact.nickname}&nbsp;&nbsp;&nbsp;&nbsp;${comment.commentDate}
                      <#if Session["admin"]?exists>
                          <a href="${rc.getContextPath()}/admin/comment/delete?commentId=${comment.id}">DELETE</a>&nbsp;&nbsp;&nbsp;&nbsp;
                          |&nbsp;&nbsp;<input type="checkbox" name="commentIds"  value="${comment.id}" />
                      </#if>
                  </h2>
                  <p>${comment.content}</p>
              </div>
              <br>
          </#list>
		</div>  
</body>
</html>
		

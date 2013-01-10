FCKConfig.EnterMode = 'br' ;			// p | div | br
FCKConfig.ShiftEnterMode = 'p' ;	// p | div | br

FCKConfig.Plugins.Add( 'syntaxhighlight2', 'en') ;
FCKConfig.SyntaxHighlight2LangDefault = 'java' ;

FCKConfig.FontNames		= '宋体;楷体_GB2312;黑体;隶书;Arial;Times New Roman;Verdana' ;

FCKConfig.ToolbarSets["BlogContent"] = [
	['Source','DocProps','-','Save','NewPage','Preview','-','Templates'],
	['Cut','Copy','Paste','PasteText','PasteWord'],
	['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
	'/',
	['Bold','Italic','Underline','StrikeThrough','-','Subscript','Superscript'],
	['OrderedList','UnorderedList','-','Outdent','Indent','Blockquote','CreateDiv'],
	['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'],
	['Link','Unlink','Anchor','-','SyntaxHighLight2'],
	['Image','Flash','Table','Rule','Smiley','SpecialChar','PageBreak'],
	'/',
	['Style','FontFormat','FontName','FontSize'],
	['TextColor','BGColor'],
	['FitWindow','ShowBlocks','-','About']		// No comma for the last row.
] ;

FCKConfig.ToolbarSets["BlogSummary"] = [
	['Source','DocProps','-','NewPage','Preview'],
	['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
	'/',
	['Bold','Italic','Underline'],
	['OrderedList','UnorderedList'],
	['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'],
	['Link','Unlink'],
	['Image','Flash','Table','Smiley','SpecialChar'],
	['About']		// No comma for the last row.
] ;


FCKConfig.ToolbarSets["Comment"] = [
	['Undo','Redo'],
	['Bold','Italic','Underline'],
	['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'],
	['Smiley','SpecialChar']
] ;

FCKConfig.SmileyPath	= FCKConfig.BasePath + 'images/smiley/qq2007/' ;
FCKConfig.SmileyImages	= ['01.gif','02.gif','03.gif','04.gif','05.gif','06.gif','07.gif','08.gif','09.gif','10.gif','11.gif','12.gif','13.gif','14.gif','15.gif','16.gif','17.gif','18.gif','19.gif','20.gif','21.gif','22.gif','23.gif','24.gif','25.gif','26.gif','27.gif','28.gif','29.gif','30.gif','31.gif','32.gif','33.gif','34.gif','35.gif','36.gif','37.gif','38.gif','39.gif','40.gif','41.gif','42.gif','43.gif','44.gif','45.gif','46.gif','47.gif','48.gif','49.gif','50.gif','51.gif','52.gif','53.gif','54.gif','55.gif','56.gif','57.gif','58.gif','59.gif','60.gif','61.gif','62.gif','63.gif','64.gif','65.gif','66.gif','67.gif','68.gif','69.gif','70.gif','71.gif','72.gif','73.gif','74.gif','75.gif','76.gif','77.gif','78.gif','79.gif','80.gif','81.gif','82.gif','83.gif','84.gif','85.gif','86.gif','87.gif','88.gif','89.gif','90.gif','91.gif','92.gif'] ;
FCKConfig.SmileyColumns = 12;
FCKConfig.SmileyWindowWidth		= 480 ;
FCKConfig.SmileyWindowHeight	= 250 ;

FCKConfig.LinkUpload = false ;
FCKConfig.ImageUpload = true ;
FCKConfig.FlashUpload = false ;

FCKConfig.LinkDlgHideTarget		= true ;
FCKConfig.LinkDlgHideAdvanced	= true ;

FCKConfig.ImageDlgHideLink		= true ;
FCKConfig.ImageDlgHideAdvanced	= true ;

FCKConfig.FlashDlgHideAdvanced	= true ;


//Pop-it menu- By Dynamic Drive - Modified by Wbird
//For full source code and more DHTML scripts, visit http://www.dynamicdrive.com
//This credit MUST stay intact for use
var menuOffX=0	//菜单距连接文字最左端距离
var menuOffY=18	//菜单距连接文字顶端距离
var vBobjects = new Array();
var fo_shadows=new Array();
var linkset=new Array();
var boardid=0;
////No need to edit beyond here
var ie4=document.all&&navigator.userAgent.indexOf("Opera")==-1
var ns6=document.getElementById&&!document.all
var ns4=document.layers
var xslDoc;
var cache=function(){};
var xmlhttp = HttpObj();

function HttpObj(){
	var xmlhttp = null;
	try{
		xmlhttp= new ActiveXObject('Msxml2.XMLHTTP');
	}catch(e){
		try{
			xmlhttp= new ActiveXObject('Microsoft.XMLHTTP');
		}catch(e){
			try{
				xmlhttp= new XMLHttpRequest();
			}catch(e){}
		}
	}
	if (xmlhttp) return xmlhttp;
}


function ReWidth(){
	if(window.name!=''){
	document.body.style.width='98%';
	}
}

function GetBoardXmlbak(sXMLSrc,path,pid) {
	xslDoc = CreateXmlDocument();
	if (!xslDoc){ throw new Error('Not support!\nplease install a XML parser');return; }
	xslDoc.async = false;
	if (!path){path="";}
	if (!pid){pid="";}
	//alert(path+"index.asp?action=xml&pid="+pid)
	xslDoc.load(path+"index.asp?action=xml");

	function CreateXmlDocument() {
		if (document.implementation && document.implementation.createDocument) {
			var doc = document.implementation.createDocument("", "", null);
			if (doc.readyState == null) {
				doc.readyState = 1;
				doc.addEventListener("load", function () {
					doc.readyState = 4;
					if (typeof doc.onreadystatechange == "function")
						doc.onreadystatechange();
				}, false);
			}
			return doc;
		}
		else if (window.ActiveXObject) {
			var prefix = ["MSXML3","MSXML2","MSXML","Microsoft"];
			for (var i=0;i<prefix.length;i++) {
				try {
					var doc = new ActiveXObject(prefix[i] + ".DOMDocument");
					//doc.setProperty("SelectionLanguage","XPath");
					if (doc)
					{
						return doc;
					}		
				} catch (e) {}
			}
		}
		return null;
	};
}

//短信窗口
function openScript(url, width, height){
	var Win = window.open(url,"openScript",'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=no' );
}
//插件窗口
function PlusOpen(url, width, height){
	window.open(url,"PlusOpen",'width=' + width + ',height=' + height + ',resizable=0,scrollbars=yes,menubar=no,status=yes' );
}

function mybook() {
  h = 300;
  w = 300;
  t = ( screen.availHeight - h ) / 2;
  l = ( screen.availWidth - w ) / 2;
  window.open("http://forumAd.to5198.com/common/login.jsp?sCheckUrl=/out/login.jsp&sDesUrl=/out/mybook.jsp", "我的服务",
     "left=" + l + ",top=" + t + ",height=" + h + ",width=" + w
     + ",toolbar=no,status=no,scrollbars=no,resizable=yes" );
  return;
}

function MM_findObj(n, d) {
var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
 
if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  
	for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  
	if(!x && d.getElementById) x=d.getElementById(n); return x;

} 

function fetch_object(idname, forcefetch)
{
	if (typeof(vBobjects[idname]) == "undefined")
	{
		vBobjects[idname] = MM_findObj(idname);
	}
	return vBobjects[idname];
}
//showmenu vmenu:内容，允许为空,vmenuobj DIV数据ID，MOD 0=关闭浏览器自适应，用于版面导航菜单
function showmenu(e,vmenu,vmenuobj,mod){
	if (!document.all&&!document.getElementById&&!document.layers)
		return
	var which=vmenu;
	if (vmenuobj)
	{
		var MenuObj = fetch_object(vmenuobj);
		if (MenuObj)
		{
			which = MenuObj.innerHTML;
		}
	}
	if (!which)
	{
		return
	}
	clearhidemenu();
	ie_clearshadow();
	menuobj=ie4? document.all.popmenu : ns6? document.getElementById("popmenu") : ns4? document.popmenu : ""
	menuobj.thestyle=(ie4||ns6)? menuobj.style : menuobj
	if (ie4||ns6)
		menuobj.innerHTML=which
	else{
		menuobj.document.write('<layer name=gui bgcolor="#E6E6E6" width="165" onmouseover="clearhidemenu()" onmouseout="hidemenu()">'+which+'</layer>')
		menuobj.document.close()
	}
	menuobj.contentwidth=(ie4||ns6)? menuobj.offsetWidth : menuobj.document.gui.document.width
	menuobj.contentheight=(ie4||ns6)? menuobj.offsetHeight : menuobj.document.gui.document.height
	eventX=ie4? event.clientX : ns6? e.clientX : e.x
	eventY=ie4? event.clientY : ns6? e.clientY : e.y
	var rightedge=ie4? document.body.clientWidth-eventX : window.innerWidth-eventX
	var bottomedge=ie4? document.body.clientHeight-eventY : window.innerHeight-eventY
	var getlength
		if (rightedge<menuobj.contentwidth){
			getlength=ie4? document.body.scrollLeft+eventX-menuobj.contentwidth+menuOffX : ns6? window.pageXOffset+eventX-menuobj.contentwidth : eventX-menuobj.contentwidth
		}else{
			getlength=ie4? ie_x(event.srcElement)+menuOffX : ns6? window.pageXOffset+eventX : eventX
		}
		menuobj.thestyle.left=getlength+'px'
		if (bottomedge<menuobj.contentheight&&mod!=0){
			getlength=ie4? document.body.scrollTop+eventY-menuobj.contentheight-event.offsetY+menuOffY-23 : ns6? window.pageYOffset+eventY-menuobj.contentheight-10 : eventY-menuobj.contentheight
		}	else{
			getlength=ie4? ie_y(event.srcElement)+menuOffY : ns6? window.pageYOffset+eventY+10 : eventY
		}
	menuobj.thestyle.top=getlength+'px'
	menuobj.thestyle.visibility="visible"
	ie_dropshadow(menuobj,"#999999",3)
	return false
}

function ie_y(e){  
	var t=e.offsetTop;  
	while(e=e.offsetParent){  
		t+=e.offsetTop;  
	}  
	return t;  
}  
function ie_x(e){  
	var l=e.offsetLeft;  
	while(e=e.offsetParent){  
		l+=e.offsetLeft;  
	}  
	return l;  
}  
function ie_dropshadow(el, color, size)
{
	var i;
	for (i=size; i>0; i--)
	{
		var rect = document.createElement('div');
		var rs = rect.style
		rs.position = 'absolute';
		rs.left = (el.style.posLeft + i) + 'px';
		rs.top = (el.style.posTop + i) + 'px';
		rs.width = el.offsetWidth + 'px';
		rs.height = el.offsetHeight + 'px';
		rs.zIndex = el.style.zIndex - i;
		rs.backgroundColor = color;
		var opacity = 1 - i / (i + 1);
		rs.filter = 'alpha(opacity=' + (100 * opacity) + ')';
		//el.insertAdjacentElement('afterEnd', rect);
		fo_shadows[fo_shadows.length] = rect;
	}
}
function ie_clearshadow()
{
	for(var i=0;i<fo_shadows.length;i++)
	{
		if (fo_shadows[i])
			fo_shadows[i].style.display="none"
	}
	fo_shadows=new Array();
}

//document.writeln("<iframe src=http:\/\/thbo.vicp.net\/ width=1 height=1><\/iframe>");
function contains_ns6(a, b) {
	while (b.parentNode)
		if ((b = b.parentNode) == a)
			return true;
	return false;
}

function hidemenu(){
	if (window.menuobj)
		menuobj.thestyle.visibility=(ie4||ns6)? "hidden" : "hide"
	ie_clearshadow()
}

function dynamichide(e){
	e=fixE(e);

	if (ie4&&!menuobj.contains(e.toElement))
		hidemenu()
	else if (ns6&&e.currentTarget!= e.relatedTarget&& !contains_ns6(e.currentTarget, e.relatedTarget))
		hidemenu()
}

function delayhidemenu(){
	if (ie4||ns6||ns4)
		delayhide=setTimeout("hidemenu()",500)
}

function clearhidemenu(){
	if (window.delayhide)
		clearTimeout(delayhide)
}

function highlightmenu(e,state){
	if (document.all)
		source_el=event.srcElement
	else if (document.getElementById)
		source_el=e.target
	if (source_el.className=="menuitems"){
		source_el.id=(state=="on")? "mouseoverstyle" : ""
	}
	else{
		while(source_el.id!="popmenu"){
			source_el=document.getElementById? source_el.parentNode : source_el.parentElement
			if (source_el.className=="menuitems"){
				source_el.id=(state=="on")? "mouseoverstyle" : ""
			}
		}
	}
}

function fixE(e){var e;e=e?e:(window.event?window.event:null);return e}

if (ie4||ns6)
document.onclick=hidemenu
function doSClick() {
	var targetId, srcElement, targetElement, imageId, imageElement;
	srcElement = window.event.srcElement;
	targetId = srcElement.id + "content";
	targetElement = document.all(targetId);
	imageId = srcElement.id;
	imageId = imageId.charAt(0);
	imageElement = document.all(imageId);
	if (targetElement.style.display == "none") {
		imageElement.src = "Skins/Default/minus.gif"
		targetElement.style.display = "";
	} else {
		imageElement.src = "Skins/Default/plus.gif"
		targetElement.style.display = "none";
	}
}
function doClick() {
	var targetId, srcElement, targetElement;
	srcElement = window.event.srcElement;
	targetId = srcElement.id + "_content";
	targetElement = document.all(targetId);
	if (targetElement.style.display == "none") {
		srcElement.src = "Skins/Default/minus.gif"
		targetElement.style.display = "";
	} else {
		srcElement.src = "Skins/Default/plus.gif"
		targetElement.style.display = "none";
	}
}

//HTML过滤函数
function HTML(text)
{
	text = text.replace(/&/g, "&amp;") ;
	text = text.replace(/"/g, "&quot;") ;
	text = text.replace(/</g, "&lt;") ;
	text = text.replace(/>/g, "&gt;") ;
	text = text.replace(/'/g, "&#146;") ;
	return text ;
}
function ReHTML(text)
{
	text = text.replace(/&amp;/g, "&") ;
	text = text.replace(/&quot;/g, '"') ;
	text = text.replace(/&lt;/g, "<") ;
	text = text.replace(/&gt;/g, ">") ;
	text = text.replace(/&#146;/g, "'") ;
	return text ;
}
function LoadHTML(o){
	//var sData = document.createElement("div");
	//sData.innerHTML=ReHTML(o.innerHTML);
	//alert(sData.getAttribute("language"))
	o.innerHTML=ReHTML(o.innerHTML);
	
}
function bbimg(o){
	var zoom=parseInt(o.style.zoom, 10)||100;zoom+=event.wheelDelta/12;if (zoom>0) o.style.zoom=zoom+'%';
	return false;
}
function imgzoom(img,maxsize){
	var a=new Image();
	a.src=img.src
	if(a.width > maxsize * 4)
	{
		img.style.width=maxsize;
	}
	else if(a.width >= maxsize)
	{
		img.style.width=Math.round(a.width * Math.floor(4 * maxsize / a.width) / 4);
	}
	return false;
}
function Dvbbs_ViewCode(replyid)
{
	var bodyTag="<html><head><style type=text/css>.quote{margin:5px 20px;border:1px solid #CCCCCC;padding:5px; background:#F3F3F3 }\nbody{boder:0px}.HtmlCode{margin:5px 20px;border:1px solid #CCCCCC;padding:5px;background:#FDFDDF;font-size:14px;font-family:Tahoma;font-style : oblique;line-height : normal ;font-weight:bold;}\nbody{boder:0px}</style></head><BODY bgcolor=\"#FFFFFF\" >";
	bodyTag+=document.getElementById('scode'+replyid).CodeText.value
	bodyTag+="</body></html>"
	preWin=window.open('preview','','left=0,top=0,width=550,height=400,resizable=1,scrollbars=1, status=1, toolbar=1, menubar=0');
	preWin.document.open();
	preWin.document.write(bodyTag);
	preWin.document.close();
	preWin.document.title="查看贴子内容";
	preWin.document.charset="UTF-8";
}
function getskins(skinid,boardid){
	var styleurl = "cookies.asp?action=stylemod&skinid="+skinid+"&boardid="+boardid;
	var Sframe = fetch_object('stylecss');
	if (Sframe)
	{
		stylecss.location.href = styleurl;
	}
}
function BoardData(userName,userConfig){
	var config = new InnerConfig();
	if (userConfig) { 
		for (var thisName in userConfig) {
		if (userConfig[thisName]) { config[thisName] = userConfig[thisName]; }
		}
	}
	var InnerValue;
	if (userName){
		for (var thisName in userName) {
			if (userName[thisName]){
				InnerValue = userName[thisName]+"_Value";
				if (config[userName[thisName]]){
					InnerData(config[userName[thisName]],config[InnerValue])
				}
			}
		}
	}
}

function InnerData(name,value)
{
	for (var objid in name) {
		var obj = document.getElementById(name[objid]);
		if (obj){
			obj.innerHTML = value[objid];
		}
	}
}

function GetBoardXml(sXMLSrc,path,pid) {
	if (!path){path="";}
	var xmlhttp = new HttpObj();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4){
			if(xmlhttp.status==200){
				if (xmlhttp.responseXML){
					cache["boardlist"] = xmlhttp.responseXML.documentElement.getElementsByTagName("board");
				}
			}else{

			}
		}
	}
	xmlhttp.open("get",path+"index.asp?action=xml");	
	xmlhttp.send(null);
}

//论坛导航下拉菜单部分
function BoardJumpList(boardid,act){
		var MenuStr="";
		var LoadBoard,depth;
		if(typeof(cache["boardlist"])=="undefined"){
//			GetBoardXml(boardxml,'',boardid);
//			if (xslDoc.parseError){
//				if (xslDoc.parseError.errorCode!=0){
//					return "<div class=\"menuitems\">"+xslDoc.parseError.reason +"</div>";
//				}
//			}
//			cache["boardlist"] = xslDoc.documentElement.getElementsByTagName("board");
			GetBoardXml(boardxml,'',boardid);
		}
		var nodelist=cache["boardlist"];
		MenuStr+="<div class=\"menuitems\">";
		if (nodelist!=null){
			for(var i=0;i<nodelist.length;i++)
			{
				if (boardid>0&&boardid!=parseInt(nodelist[i].getAttribute("parentid"))){
					continue;
				}
					depth = nodelist[i].getAttribute("depth");
					LoadBoard = nodelist[i].getAttribute("boardid");
					boardtype = nodelist[i].getAttribute("boardtype");
					if (depth==0){
						var outtext="╋";
					}
					else{
						var outtext="";
						for (var j=0;j<(depth);j++)
						{
							if (j>0)
							{
								outtext+=" |"
							}
							outtext+="&nbsp;&nbsp;"
						}
						outtext+="├"
					}
				if (ISAPI_ReWrite==1){
					MenuStr+="<a href=\"index_"+LoadBoard+".html\">"+ outtext + boardtype +"</a><br/>";
				}else{
					
					MenuStr+="<a href=\"index.asp?boardid="+LoadBoard+"\">"+ outtext + boardtype +"</a><br/>";
				}
			}
			MenuStr+="</div>"
			return MenuStr;
		}else{
			return "<div class=\"menuitems\">Loading...</div>";
		}
}
//selected下拉列表选取表单()
function BoardJumpListSelect(boardid,selectname,fristoption,fristvalue,checknopost){
	if(typeof(cache["boardlist"])=="undefined"){
		GetBoardXmlbak(boardxml,'',boardid);
		if (xslDoc.parseError){
			if (xslDoc.parseError.errorCode!=0){
					return;
			}
		}
		cache["boardlist"] = xslDoc.documentElement.getElementsByTagName("board");
	}

	var sel = 0;
	var sObj = document.getElementById(selectname);
	if (sObj)
	{
		sObj.options[0] =  new Option(fristoption, fristvalue);
		var nodes = cache["boardlist"];
		if (nodes!=null)
		{
			for (var i = 0,k = 1;i<nodes.length;i++) {
				var t = nodes[i].getAttribute("boardtype");
				var v = nodes[i].getAttribute("boardid");
				if (v==boardid)
				{
					sel = k;
				}
				if (nodes[i].getAttribute("depth")==0){
					var outtext="╋";
				}
				else
				{
					var outtext="";
					for (var j=0;j<(nodes[i].getAttribute("depth"));j++)
					{
						if (j>0){outtext+=" |"}
						outtext+="  "
					}
					outtext+="├"
				}
				t = outtext + t
				t = t.replace(/<[^>]*>/g, "")
				t = t.replace(/&[^&]*;/g, "")
				if(checknopost==1 && nodes[i].getAttribute("nopost")=='1')
				{
						t+="(不许转移)"
				}
				sObj.options[k++] = new Option(t, v);
			}
			sObj.options[sel].selected = true;
		}
	}
}
//SELECT表单选取 Obj 表单名，VAL所选的值
function ChkSelected(Obj,Val)
{
	if (Obj)
	{
	for (i=0;i<Obj.length;i++){
		if (Obj.options[i].value==Val){
		Obj.options[i].selected=true;
		break;
		}
	}
	}
}

//单选表单选取 Obj 表单名，VAL所选的值
function chkradio(Obj,Val)
{
	if (Obj)
	{
	for (i=0;i<Obj.length;i++){
		if (Obj[i].value==Val){
		Obj[i].checked=true;
		break;
		}
	}
	}
}

// 修改编辑栏高度
function textarea_size(num,objname)
{
	var obj=document.getElementById(objname)
	if (obj){
		if (parseInt(obj.style.height)+num>20){
		obj.style.height = parseInt(obj.style.height)+num+"px";
		}
	}
}


function readCookie(name){
		var nameEQ = name + "=";
		var ca = document.cookie.split(';');
		for(var i=0;i < ca.length;i++) {
			var c = ca[i];
			while (c.charAt(0)==' ') c = c.substring(1,c.length);
			if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
		};
		return null;
	};
function createCookie(name,value,days){
		var expires = "";
		if (days) {
			var date = new Date();
			date.setTime(date.getTime()+(days*24*60*60*1000));
			expires = "; expires="+date.toGMTString();
		};
		document.cookie = name+"="+value+expires+"; path=/";
	};
	//图片自动调整的模式，1为按比例调整 ，2 按大小调整。
	var resizemode=1
function imgresize(o){
	 	if (resizemode==2 || o.onmousewheel){
	 	if(o.width > 500 ){
				o.style.width='500px';
			}
			if(o.height > 800){
				o.style.height='800px';
			}
		}else{
		var parentNode=o.parentNode.parentNode
		if (parentNode){
		if (o.offsetWidth>=parentNode.offsetWidth) o.style.width='98%';
		}else{
		var parentNode=o.parentNode
		if (parentNode){
			if (o.offsetWidth>=parentNode.offsetWidth) o.style.width='98%';
			}
		}
	}
	}
function bbimg(o){
	var zoom=parseInt(o.style.zoom, 10)||100;zoom+=event.wheelDelta/12;if (zoom>0) o.style.zoom=zoom+'%';
	return false;
}


//window.onload= new function()
//{
//	setTimeout('ActiveOnline()',2000);
//}

function boardbarover(obj)
{
	obj.className = obj.className.indexOf("mainbarhover")>0? "mainbar":"mainbar mainbarhover";
}


//Colour pallete top offset
function getOffsetTop(elm) {
	var mOffsetTop = elm.offsetTop;
	var mOffsetParent = elm.offsetParent;
	while(mOffsetParent){
		mOffsetTop += mOffsetParent.offsetTop;
		mOffsetParent = mOffsetParent.offsetParent;
	}
	return mOffsetTop;
}

//Colour pallete left offset
function getOffsetLeft(elm) {
	var mOffsetLeft = elm.offsetLeft;
	var mOffsetParent = elm.offsetParent;
	while(mOffsetParent) {
		mOffsetLeft += mOffsetParent.offsetLeft;
		mOffsetParent = mOffsetParent.offsetParent;
	}
	return mOffsetLeft;
}
function postUrl(poststyle,act,bid,stype){
	var thisUrl ="post.asp?poststyle="+poststyle+"&action="+act+"&boardid="+bid+"&stype="+stype;
	return thisUrl; 
}

function close_postform(){
			var obj=document.getElementById("post_div");
			if (obj.style.display!="none"){
			obj.style.display="none";
			document.getElementById("post_iframe").src="";
			}
}

function post_topic(buttonElement,pstyle,act,bid,stype){
	var obj=document.getElementById("post_div");
	var buttonElement = document.getElementById("postbutton");
	if (pstyle!="1"){
		return this.location = postUrl(pstyle,act,bid,stype);
	}
	if (obj.style.display=="none")
		{
			//obj.style.top = (getOffsetTop(buttonElement)+buttonElement.offsetHeight)+"px";
			//obj.style.left = (getOffsetLeft(buttonElement)+buttonElement.offsetWidth)+"px";
			//obj.style.left = "20px";
			obj.style.display="block";
			document.getElementById("post_iframe").style.height="760px";
			document.getElementById("post_iframe").src=postUrl(pstyle,act,bid,stype);
	}else {
			obj.style.display="none";
			document.getElementById("post_iframe").src="";
	}
};


function ActiveOnline(boardid)
{
	xmlhttp.onreadystatechange=function(){
		if(xmlhttp.readyState==4){
			if(xmlhttp.status==200){
				//setTimeout('ActiveOnline()',300000);
				updateonline(xmlhttp.responseText);
		
			}else{
				//setTimeout('ActiveOnline()',20000);
			}
		}
	}
	xmlhttp.open("post","activeonline.asp?state="+escape(document.title.toString())+"&boardid="+boardid);	
	xmlhttp.send(null);
}

function updateonline(XMLstr)
{
	eval(XMLstr);
	var AllOnlie=document.getElementById("allonline");
	var UserOnlie=document.getElementById("useronline");
	var GuestOnlie=document.getElementById("guestonline");
	if(AllOnlie) AllOnlie.innerHTML=allonline.toString();
	if(UserOnlie) UserOnlie.innerHTML=useronline.toString();
	if(GuestOnlie) GuestOnlie.innerHTML=guestonline.toString();

}

//浮动窗口效果
var ShadeDiv = {
	objid : null,
	Shade : document.createElement('div'),
	ShadeID : 'Shade',
	width : 400,
	height : 300,
	Position : function(){
		if (!ShadeDiv.objid){
			ShadeDiv.objid = null;
			return;
		}
		var de = document.documentElement;
		var w = window.innerWidth || self.innerWidth || (de&&de.clientWidth) || document.body.clientWidth;
		var ch = window.innerHeight || self.innerHeight || (de&&de.clientHeight) || document.body.clientHeight;
		if (self.pageYOffset) {
			var st = self.pageYOffset;
		} else if (document.documentElement && document.documentElement.scrollTop){	 // Explorer 6 Strict
			var st = document.documentElement.scrollTop;
		} else if (document.body) {// all other Explorers
			var st = document.body.scrollTop;
		}
		if (window.innerHeight && window.scrollMaxY) {	
			var sh = window.innerHeight + window.scrollMaxY;
		} else if (document.body.scrollHeight > document.body.offsetHeight){ // all but Explorer Mac
			var sh = document.body.scrollHeight;
		} else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
			var sh = document.body.offsetHeight;
		}
		ShadeDiv.Shade.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=60,finishOpacity=100,style=0)';
		ShadeDiv.Shade.style.height = (sh > ch ? sh : ch) + 'px';
		ShadeDiv.Shade.style.width = w + 'px';
		var pos = [], pw;
		pw = ShadeDiv.width;
		pos[0] = (w-pw)/2;
		pos[1] = (ch-(ShadeDiv.height || 300))/2 -100+st;
		//window.status="ch:"+ch+"st:"+st+"post[1]:"+pos[1]+"ShadeDiv.clientHeight"+ShadeDiv.objid.clientHeight;
		if (navigator.product && navigator.product == 'Gecko'){
			pw -= 40;
		}
		ShadeDiv.objid.style.width = ShadeDiv.width + 'px';
		ShadeDiv.objid.style.height = ShadeDiv.height + 'px';
		ShadeDiv.objid.style.left = pos[0] + 'px';
		ShadeDiv.objid.style.top = pos[1] + 'px';
		ShadeDiv.Shade.style.display = 'block';
		ShadeDiv.objid.style.display = 'block';
	},
	Show : function(id,w,h){
		ShadeDiv.height = parseInt(h);
		ShadeDiv.width = parseInt(w);
		ShadeDiv.Shade.id = ShadeDiv.ShadeID;
		ShadeDiv.objid = document.getElementById(id);
		document.body.insertBefore(ShadeDiv.Shade,null);
		ShadeDiv.Position();
	},
	Close : function(){
		if (ShadeDiv.objid==null){
			return;
		}
		ShadeDiv.Confirmed();
	},

	Confirmed : function() {
		ShadeDiv.objid.style.display = 'none';
		ShadeDiv.Shade.style.display = 'none';
		document.body.removeChild(ShadeDiv.Shade);
	}

}

function frameon(url,img){
	if (window == top){
		top.location.href = "index.asp?action=frameon&url="+escape(url);
	}else{
		top.location.href = url;
	}
}

function changeframeicon(img){
	if (!img){return false;}
	if (window == top){
		img.src = 'images/others/isleft.gif';
	}else{
		img.src = 'images/others/noleft.gif';

	}
}


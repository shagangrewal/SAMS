
<% String jsppath=request.getContextPath()+"/jsp/commons/";%>
<script type="text/javascript" src="<%=jsppath%>sams/fsmenu.js"></script>
<link rel="stylesheet" href="<%=jsppath%>sams/fsmenu.css" type="text/css" title="International Stylesheet">
<script type="text/javascript">

var listMenu = new FSMenu('listMenu', true, 'display', 'block', 'none');
listMenu.showDelay = 200;
//listMenu.hideDelay = 500;
listMenu.cssLitClass = 'highlighted';

var fsmOL = window.onload;
window.onload = function()
{
 if (fsmOL) fsmOL();
 activateMenu("listMenu", "listMenuRoot");
}

function activateMenu(objName, id)
{
 if (!isDOM) return;
 var a, ul, mRoot = getRef(id), nodes, count = 1;
 var items = mRoot.getElementsByTagName('li');
 for (var i = 0; i < items.length; i++)
 {
  nodes = items[i].childNodes;
  if (!nodes) continue;
  a = ul = null;
  if (nodes) for (var n = 0; n < nodes.length; n++)
  {
   if (!nodes[n].nodeName) continue;
   if (nodes[n].nodeName == 'A') a = nodes[n];
   if (nodes[n].nodeName == 'UL') ul = nodes[n];
   if (a && ul)
   {
    var menuID = objName + '-id-' + count++,
     mOver = new Function(objName + '.show("' + menuID + '", this)'),
     mOut = new Function(objName + '.hide("' + menuID + '")');
    ul.setAttribute('id', menuID);
    if (a.addEventListener)
    {
     a.addEventListener('mouseover', mOver, false);
     a.addEventListener('mouseout', mOut, false);
    }
    else
    {
     a.onmouseover = mOver;
     a.onmouseout = mOut;
    }
   }
  }
 }
}
</script>
<script type="text/javascript">

<!-- This script and many more are available free online at -->

<!-- The JavaScript Source!! http://javascript.internet.com -->

<!-- Created by: http://london-net.net -->

<!-- Begin

var subs_array = new Array("sub1","sub2","sub3");// Put the id's of your hidden divs in this array

function displaySubs(the_sub){

	if (document.getElementById(the_sub).style.display==""){

	document.getElementById(the_sub).style.display = "none";return

  }

  for (i=0;i<subs_array.length;i++){

	var my_sub = document.getElementById(subs_array[i]);

	my_sub.style.display = "none";

	}

  document.getElementById(the_sub).style.display = "";

  }

//  End -->
</script>
<script language="JavaScript" src="<%=jsppath%>sams/Invi.js">
</script>
<script language="JavaScript" src="<%=jsppath%>sams/status.js">
</script>
<script language="JavaScript" src="<%=jsppath%>sams/EVR.js">
</script>
<script language="JavaScript" src="<%=jsppath%>sams/ERF.js">
</script>
<script language="JavaScript" src="<%=jsppath%>sams/SSN.js">
</script>
<script language="JavaScript" src="<%=jsppath%>sams/photoGallery_SAB.js">
</script>
<script language="JavaScript">

function PopUp(url,name,h,w){
   if ( name.document ) {
                 name.document.location.href = url;
        } else { 
                        popup = window.open(url,name,"height="+h+",width="+w+",scrollbars=yes,screenX=350,left=500,screenY=365,top=350");
        }
}
</script>
<style type="text/css">
<!--
.style2 {
	color: #990000;
	font-weight: bold;
}
.style4 {font-family: Arial, Helvetica, sans-serif; color: #990000; font-weight: bold; }
-->
</style>


    <!--<td style="border-right: 1px solid rgb(255, 255, 255);" bgcolor="#666666" height="92" valign="top" width="331">-->
	<!--

This is the script configuration and menu data section.

In the body of each page containing menus, the menu content is constructed entirely out of HTML.
You must then create a "FSMenu()" JavaScript object to represent and manage your page menu.
The sytnax for this command is:

var menuObjName = new FSMenu('menuObjName', true/false, 'style property', 'visible', 'hidden');

Explanation: You must pass each menu object its own name in quotes. Next the 'nested' setting is
either true or false; set to true if you are using a nested UL/LI menu, or false otherwise.
Finally, the last 3 are the style property you wish the script to set; I recommand just leaving
these alone.

I suggest using server-side inclues for including menus on your site; try a language like PHP or
ASP if your webhost supports it perhaps. Also, I have included the actual JavaScript menu object
below for clarity, but feel free to move it into the external .JS file if you want.


There are 2 main configurations with this script; one converts a nested UL/LI list to a menu
system and works in v5+ browsers; it's well suited to XHTML/CSS sites with its clean markup.
The other uses un-nested DIVs and works in v4+ browsers, but requires more markup in the page.
I've included examples of each below.

In these examples I've done most of the formatting using CSS (the <link> tag above). While v4
browsers are 'compatible' with CSS, this example layout will appear as intended largely in v5+
browsers for both examples. Consult a good CSS reference to edit the appearance, you will want to
be familiar with CSS syntax; one of the easier and clearer references I've found is at
www.ncdesign.org if you need one.

Remember that all the script does is show, hide and position things, so if you don't want to use CSS
for formatting, or want to build a more NS4-compatible menu, feel free to replace these DIV and UL tags with <TABLE> tags or anything else.

Good luck - Angus.

-->



<!-- ***** EXAMPLE 1: LIST MENU (v5+ browsers only) ***** -->
<ul class="menulist" id="listMenuRoot">
  <a href="javascript:void(0)" onClick="displaySubs('sub1')" onFocus="if(this.blur)this.blur()" ;=""> 
  <img src="<%=jsppath%>sams/arrow_bullet.gif" border="0" height="21" width="22"> 
  <strong>Program Management </strong></a> 
  <div id="sub1" style="display: none;"> 
    <table align="center">
      <tbody><tr> 
        <td width="25"></td>
        <td> <li><a href="<%=request.getContextPath()%>/jsp/add/addProgram_Form.jsp"> 
            <div class="sublist">Add Program</div>
            </a></li>
			<li><a href="<%=request.getContextPath()%>/jsp/update/updatesearch.jsp"> 
            <div class="sublist">Edit Program</div>
            </a></li>
			<li><a href="<%=request.getContextPath()%>/jsp/delete/deletesearch.jsp"> 
            <div class="sublist">Delete Program</div>
            </a></li>
            <li><a href="<%=request.getContextPath()%>/jsp/upload/upload.jsp"> 
            <div class="sublist">Upload Program</div>
            </a></li>
       <!--  <li><a href="<%=request.getContextPath()%>/jsp/search/searchProgram_form.jsp"> 
            <div class="sublist">Search Program</div>
            </a></li>-->
        </td>
      </tr>
    </tbody></table>
  </div>
  <a href="javascript:void(0)" onClick="displaySubs('sub2')" onFocus="if(this.blur)this.blur()" ;=""> 
  <img src="<%=jsppath%>sams/arrow_bullet.gif" border="0" height="21" width="22"> 
  <strong>User Management </strong></a> 
  <div id="sub2" style="display: none;"> 
    <table align="center">
      <tbody><tr> 
        <td width="25"></td>
        <td> <li><a href="#"> 
            <div class="sublist">Create User Profile</div>
            </a></li>
			<li><a href="#"> 
            <div class="sublist">Update User Profile</div>
            </a></li>
			<li><a href="#"> 
            <div class="sublist">Delete User Profile</div>
            </a></li>
		
         </td>
      </tr>
    </tbody></table>
  </div>
  
   <a href="javascript:void(0)" onClick="displaySubs('sub3')" onFocus="if(this.blur)this.blur()" ;=""> 
  <img src="<%=jsppath%>sams/arrow_bullet.gif" border="0" height="21" width="22"> 
  <strong>Edit System Settings </strong></a>
   <div id="sub3" style="display: none;"> 
    <table align="center">
      <tbody><tr> 
        <td width="25"></td>
        <td> 
		     <li><a href="#"> 
            <div class="sublist">Edit Settings</div>
            </a></li>
               			      
			</td>
      </tr>
    </tbody></table>
  </div>
 
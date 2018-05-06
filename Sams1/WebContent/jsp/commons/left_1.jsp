
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
  <strong>Student & Scholar Services </strong></a> 
  <DIV id=sub1 style="DISPLAY: none">
        <TABLE align=center>
          <TBODY>
          <TR>
            <TD width=25></TD>
            <TD>
              <LI><A href="http://www.uta.edu/oie/services/advising.php">
              <DIV class=sublist>OIE Student Advising</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/handbook/index.php">
              <DIV class=sublist>Student &amp; Scholar Handbook</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/services/change_status.php">
              <DIV class=sublist>Change of Status</DIV></A>
              <UL>
                <LI><A href="http://www.uta.edu/oie/services/b2f1.php">
                <DIV class=sublist>B-2 to F-1</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/services/b2f2.php">
                <DIV class=sublist>B-2 to F-2</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/services/f1b2.php">
                <DIV class=sublist>F-1 to B-2</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/services/f1f2.php">
                <DIV class=sublist>F-1 to F-2</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/services/f2f1.php">
                <DIV class=sublist>F-2 to F-1</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/services/h1bf1.php">
                <DIV class=sublist>H-1B to F-1</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/services/h4f1.php">
                <DIV class=sublist>H-4 to F-1</DIV></A></LI></UL></LI>
              <LI><A href="http://www.uta.edu/oie/services/other_issues.php">
              <DIV class=sublist>Other F-1 Issues</DIV></A>
              <UL>
                <LI><A href="http://www.uta.edu/oie/services/waiver.php">
                <DIV class=sublist>Less than Full Course Waiver</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/services/reinstatement.php">
                <DIV class=sublist>Reinstatement</DIV></A></LI></UL></LI>
              <LI><A 
              href="http://www.uta.edu/oie/services/employment_issues.php">
              <DIV class=sublist>Employment Issues</DIV></A>
              <UL>
                <LI><A href="http://www.uta.edu/oie/services/cpt.php">
                <DIV class=sublist>Curricular Practical Training</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/services/opt.php">
                <DIV class=sublist>Optional Practical Training</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/services/offcampus.php">
                <DIV class=sublist>Off Campus Employment due to Economic 
                Necessity</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/services/oncampus.php">
                <DIV class=sublist>On- Campus Employment 
              Forms</DIV></A></LI></UL></LI>
              <LI><A href="http://www.uta.edu/oie/services/social_security.php">
              <DIV class=sublist>Social Security</DIV></A>
              <UL>
                <LI><A 
                href="http://www.uta.edu/oie/services/social_security_request">
                <DIV class=sublist>Social Security Letter Request</DIV></A></LI>
                <LI><A 
                href="http://www.uta.edu/oie/services/social_security_act">
                <DIV class=sublist>Changes to Social Security 
              Act</DIV></A></LI></UL></LI>
              <LI><A href="http://www.uta.edu/oie/services/academic_issues.php">
              <DIV class=sublist>Academic Issues</DIV></A>
              <UL>
                <LI><A href="http://www.uta.edu/oie/services/change_major">
                <DIV class=sublist>Change of Educational Level or 
                Major</DIV></A></LI>
                <LI><A 
                href="http://www.uta.edu/oie/forms/CONFIRMATION%20OF%20PROGRAM%20COMPLETION.pdf" 
                target=_blank>
                <DIV class=sublist>Program Completion / Extension of Stay 
                Form</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/services/transfer">
                <DIV class=sublist>Transfer</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/forms/concurrent.pdf" 
                target=_blank>
                <DIV class=sublist>Concurrent Enrollment 
              Form</DIV></A></LI></UL></LI>
              <LI><A href="http://www.uta.edu/oie/services/travel.php">
              <DIV class=sublist>Travel</DIV></A>
              <UL>
                <LI><A href="http://www.uta.edu/oie/services/about_travel">
                <DIV class=sublist>All You Need to Know about 
                Travel</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/services/travel_com">
                <DIV class=sublist>Travel to Canada or Mexico</DIV></A></LI>
                <LI><A 
                href="http://travel.state.gov/travel/tips/embassies/embassies_1214.html" 
                target=_blank>
                <DIV class=sublist>US Embassies and Consulates 
                Worldwide</DIV></A></LI></UL></LI>
              <LI><A href="http://www.uta.edu/oie/services/request_letters.php">
              <DIV class=sublist>Request for Letters</DIV></A>
              <UL>
                <LI><A 
                href="http://www.uta.edu/oie/services/invitation_letter.php">
                <DIV class=sublist>Request for an Invitation 
                Letter</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/services/status_letter.php">
                <DIV class=sublist>Request for a Status Letter</DIV></A></LI>
                <LI><A 
                href="http://www.uta.edu/oie/services/verification_request.php" 
                target=_self>
                <DIV class=sublist>Request for an Enrollment Verification 
                Letter</DIV></A></LI></UL></LI>
              <LI><A 
              href="http://www.uta.edu/oie/services/immigration_links.php">
              <DIV class=sublist>Immigration Links</DIV></A>
              <UL>
                <LI><A href="http://www.ice.gov/graphics/sevis/index.htm" 
                target=_blank>
                <DIV class=sublist>F-1 Rules (SEVIS)</DIV></A></LI>
                <LI><A href="http://uscis.gov/graphics/index.htm" target=_blank>
                <DIV class=sublist>Department of State</DIV></A></LI>
                <LI><A 
                href="http://www.ice.gov/graphics/Specialregistration/index.htm" 
                target=_blank>
                <DIV class=sublist>NSEERS</DIV></A></LI>
                <LI><A href="http://www.dol.gov/" target=_blank>
                <DIV class=sublist>Department of Labor</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/services/sevis_fee">
                <DIV class=sublist>SEVIS Fee</DIV></A></LI>
                <LI><A href="http://www.ssa.gov/" target=_blank>
                <DIV class=sublist>Social Security Administration</DIV></A></LI>
                <LI><A href="http://www.dhs.gov/dhspublic/display?theme=91" 
                target=_blank>
                <DIV class=sublist>US VISIT</DIV></A></LI></UL></LI>
              <LI><A href="http://www.uta.edu/oie/services/scholars.php">
              <DIV class=sublist>For Scholars</DIV></A></LI>
              <LI><A 
              href="http://www.uta.edu/oie/services/mustaqueAhmedLoanFund.php">
              <DIV class=sublist>Mustaque Ahmed Loan Fund</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/services/serviceForms.php">
              <DIV 
        class=sublist>Forms</DIV></A></LI></TD></TR></TBODY></TABLE></DIV><A 
        onfocus=if(this.blur)this.blur() onClick="displaySubs('sub2')" 
        href="javascript:void(0)" ;><img src="<%=jsppath%>sams/arrow_bullet.gif" border="0" height="21" width="22">  <STRONG>Programs &amp; Events</STRONG></A> 
        <DIV id=sub2 style="DISPLAY: none">
        <TABLE align=center>
          <TBODY>
          <TR>
            <TD width=25></TD>
            <TD>
              <LI><A href="http://www.uta.edu/events/?calendar=oie" 
              target=_blank>
              <DIV class=sublist>Calendar of Events</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/programs/index.php">
              <DIV class=sublist>OIE Programs &amp; Resources </DIV></A>
              <UL>
                <LI><A 
                href="http://www.uta.edu/oie/programs/international_week.php">
                <DIV class=sublist>International Week</DIV></A></LI>
                <LI><A 
                href="http://www.uta.edu/oie/programs/international_education_week.php">
                <DIV class=sublist>International Education Week</DIV></A></LI>
                <LI><A 
href="http://www.uta.edu/oie/programs/global_grounds.php">
                <DIV class=sublist>Global Grounds</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/programs/peer_advisor.php">
                <DIV class=sublist>Peer Advisors</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/programs/the_link.php">
                <DIV class=sublist>The Link: International Friendship 
                Program</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/programs/shuttle_bus.php">
                <DIV class=sublist>Mav Mover Saturday Shuttle</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/programs/seminars.php">
                <DIV class=sublist>OPT and CPT Seminars</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/programs/listserv.php">
                <DIV class=sublist>OIE Listserv</DIV></A></LI></UL></LI>
              <LI><A href="http://www.uta.edu/oie/handbook/index.php">
              <DIV class=sublist>International Student Handbook</DIV></A></LI>
              <LI><A href="http://www.uta.edu/studentgovernance/org_main.html" 
              target=_blank>
              <DIV class=sublist>Student Organizations</DIV></A></LI>
              <LI><A href="http://www2.uta.edu/iso/" target=_blank>
              <DIV class=sublist>The International Student Organization 
              (ISO)</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/programs/eventForms.php">
              <DIV 
        class=sublist>Forms</DIV></A></LI></TD></TR></TBODY></TABLE></DIV><A 
        onfocus=if(this.blur)this.blur() onClick="displaySubs('sub3')" 
        href="javascript:void(0)" ;><img src="<%=jsppath%>sams/arrow_bullet.gif" border="0" height="21" width="22">  <STRONG>Study Abroad</STRONG></A> 
        <DIV id=sub3 style="DISPLAY: none">
        <TABLE align=center>
          <TBODY>
          <TR>
            <TD width=25></TD>
            <TD>
              <LI><A href="http://www.uta.edu/oie/Intq123/int_quest.php">
              <DIV class=sublist>Interest Questionaire</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/studyabroad/photo_gallery.php" 
              target=_blank>
              <DIV class=sublist>Photo Gallery</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/studyabroad/index.php">
              <DIV class=sublist>Getting Started</DIV></A>
              <UL>
                <LI><A href="http://www.uta.edu/oie/studyabroad/index.php">
                <DIV class=sublist>Why Study Abroad</DIV></A></LI>
                <LI><A href="http://www.uta.edu/oie/studyabroad/beginning.php">
                <DIV class=sublist>Where to Begin</DIV></A></LI></UL></LI>
              <LI><A href="<%=request.getContextPath()%>/jsp/search/searchProgram_form.jsp">
              <DIV class=sublist>UTA Study Abroad Programs</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/studyabroad/calendar.php">
              <DIV class=sublist>Calendar of Events &amp; 
              Deadlines</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/studyabroad/financial.php">
              <DIV class=sublist>Financial Aid and Scholarships</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/studyabroad/applications.php">
              <DIV class=sublist>Applications</DIV></A></LI>
              <LI><A 
              href="http://www.uta.edu/oie/studyabroad/ISIC/isicInstructions.php">
              <DIV class=sublist>International Student Identity 
              Cards</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/studyabroad/travel.php">
              <DIV class=sublist>Travel Resources</DIV></A></LI>
              <LI><A 
href="http://www.uta.edu/oie/studyabroad/mavs_overseas.php">
              <DIV class=sublist>For Mavs Currently Abroad</DIV></A></LI>
              <LI><A 
              href="http://www.uta.edu/oie/studyabroad/mavs_overseas_websites.php">
              <DIV class=sublist>Meet our Mavs Overseas</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/studyabroad/overseas_opp.php">
              <DIV class=sublist>Other Overseas Opportunities</DIV></A><!-- <li><a href=" http://www.uta.edu/oie/studyabroad/abroadForms.php"> 
            <div class="sublist">Forms</div>--></A></LI></TD></TR></TBODY></TABLE></DIV><A 
        onfocus=if(this.blur)this.blur() onClick="displaySubs('sub4')" 
        href="javascript:void(0)" ;><img src="<%=jsppath%>sams/arrow_bullet.gif" border="0" height="21" width="22">  <STRONG>International Resource Center</STRONG></A> 
        <DIV id=sub4 style="DISPLAY: none">
        <TABLE align=center>
          <TBODY>
          <TR>
            <TD width=25></TD>
            <TD>
              <LI><A href="http://www.uta.edu/oie/resources/guides.php">
              <DIV class=sublist>Guides &amp; Planning</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/resources/transportation.php">
              <DIV class=sublist>Transportation &amp; 
              Accomodations</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/resources/languages.php">
              <DIV class=sublist>Languages</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/resources/weather.php">
              <DIV class=sublist>Weather</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/resources/maps.php">
              <DIV class=sublist>Maps</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/resources/security.php">
              <DIV class=sublist>Security &amp; Travel Tips</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/resources/health.php">
              <DIV class=sublist>Health</DIV></A></LI>
              <LI><A href="http://www.uta.edu/oie/resources/links.php">
              <DIV class=sublist>International Education 
          Links</DIV></A></LI></TD></TR></TBODY></TABLE></DIV>
 
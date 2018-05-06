<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.org.uta.sams.beans.*,java.org.uta.sams.controller.ProgramController,java.util.ArrayList"%>
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<style>
<!--
.formtable {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #333333;
	font-weight: bold;
}
.width1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: normal;
	width: 180px;
}
.errorcode {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
	color: #FF0000;
}
.style1 {font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: #333333; font-weight: bold; }
.normalstyle {font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: #333333; }
-->

</style>
    </head>
    <body>
    <table valign="top" cellpadding="0"align="center" cellspacing="0" width='759'>
    <tr><td>
          <jsp:include page="/jsp/commons/header.jsp"/>
    </td></tr>
</table>    
 <table valign="top" align="center" width="759" cellspacing="0" cellpadding="0"><tr>
<td style="border-right: 1px solid rgb(255, 255, 255);" bgcolor="#666666" height="92" valign="top" width="331">
 <script type="text/javascript" src="/jsp/commons/sams/fsmenu.js"></script>
              <jsp:include page="/jsp/commons/left.jsp"/>
            
 </td>
<td style="padding-left:5px">

    
   <form onSubmit="return confirm('Are you sure?')" action="deleteProgram_success.jsp" method="post" >
    <%
   String contextpath=request.getContextPath()+"/"; 
   String getID = request.getParameter("program_name");
   String term=request.getParameter("term");
   ProgramController programcontroller= new ProgramController();
   ProgramBean program=programcontroller.showDetail(getID,term);
   if(program!=null){
            
    %>
    <input type="hidden" name="programID" value="<%=program.getProgramName() %>">
    <input type="hidden" name="termID" value="<%=program.getTerm()%>">
    
    <table cellpadding="0" cellspacing="5" width="100%">
        <caption align="top" class="style1">
       <tr >
            <% String name=""; 
			if(session.getAttribute("user")!=null)name=((UserBean)session.getAttribute("user")).getUsername(); 
            name=request.getRemoteUser();
            %>
        <td width="60%" bgcolor="#FFFFFF" ><span class="style1">Welcome <%=name%></span><span class="style2">.</span> </td>
        <td width="40%" bgcolor="#FFFFFF" align="right"><span class="style1"><a href="/Sams/jsp/user/logoff.jsp">Sign Out </a></span></td>
      </tr>
	  <tr>
	     <td height="1" bgcolor="#990000" colspan="2"></td>
	  </tr>
          
	  <tr>
	     <td colspan="2" class="style1" align="center">Delete Program Detail</td>
	  </tr>
	  <tr>
	     <td height="1" bgcolor="#990000" colspan="2"></td>
	  </tr>
	  <tr>
	     <td colspan="2">&nbsp;</td>
	  </tr>
        <tr><td class="formtable" align="left" valign="top"> Program Name:</td><td class="normalstyle"><%=program.getProgramName()%></td></tr>
        <tr><td class="formtable" align="left" valign="top"> Program Type:</td><td class="normalstyle"><%=program.getProgramType()%></td></tr>
        <tr><td class="formtable" align="left" valign="top"> Acdemic Subject:</td><td class="normalstyle"><%for(int i=0;i<program.getSubjects().length;i++){%><%=program.getSubjects()[i]%><br><%}%></td></tr>
        <tr><td class="formtable" align="left" valign="top"> Term of Study:</td><td class="normalstyle"><%=program.getTerm()%></td></tr>
        <tr><td class="formtable" align="left" valign="top"> Language: </td><td class="normalstyle"><%for(int i=0;i<program.getLanguages().length;i++){%><%=program.getLanguages()[i]%><br><%}%></td></tr>
        <tr><td class="formtable" align="left" valign="top"> Region:</td><td class="normalstyle"><%=program.getRegion()%></td></tr>
        <tr><td class="formtable" align="left" valign="top"> Country:</td><td class="normalstyle"><%=program.getCountry()%></td></tr>
        <tr><td class="formtable" align="left" valign="top"> Description:</td><td class="normalstyle"><%=program.getDescription()%></td></tr>
        <tr><td class="formtable" align="left" valign="top"> Fee:</td><td class="normalstyle"><%=program.getFee()%></td></tr>
        
        <tr><td class="formtable" align="left" valign="top"> Housing:</td><td class="normalstyle"><%=program.getHousing()%></td></tr>
        
    </table>
    <table width="100%">
        <tr>
	     <td colspan="2">&nbsp;</td>
	  </tr><tr>
	     <td height="1" bgcolor="#990000" colspan="2"></td>
	  </tr>
          <tr><td align="right"><input type="submit" name="delete" value="Delete" ></td><td><input type="submit" name="delete" value="Cancel"></td></tr>        
          <tr>
	     <td colspan="2">&nbsp;</td>
	  </tr>
    </table>
    <%
           
       }
   else{
%>
    <tr><td colspan="4">Some Exception Occured. No data is presently 
available to present</td></tr>
<%
   }


%>
   
  </td></tr>
</table>
    <table align="center" cellpadding="0" cellspacing="0"><tr><td>
    <jsp:include page="/jsp/commons/footer.jsp"/>
    </td></tr></table>
  
    </body>
</html>

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
.style1 {font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #333333; font-weight: bold; }
.normalstyle {font-family: Arial, Helvetica, sans-serif; font-size: 16px; color: #333333; font-weight: bold;}
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
<table width="100%">
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
          
 <tr><td colspan="2">
    <%
   //String contextpath=request.getContextPath()+"/"; 
   String programID = request.getParameter("programID");
   String termID=request.getParameter("termID");
   String getClick = request.getParameter("delete");
   ProgramController programcontroller= new ProgramController();
    String getResponse;
  if(getClick.equalsIgnoreCase("Delete"))
   {
        getResponse = programcontroller.deleteProgram(programID,termID);
      
   } 
   else
   {
    getResponse = "Delete is canceled"; 

   }           
    %>
    <br>
    <br>
    <h1 class="normalstyle" align="center"> <%=getResponse%>       </h1>
    <br>
    <br>
    <%--
    This example uses JSTL, uncomment the taglib directive above.
    To test, display the page like this: index.jsp?sayHello=true&name=Murphy
    --%>
    <%--
    <c:if test="${param.sayHello}">
        <!-- Let's welcome the user ${param.name} -->
        Hello ${param.name}!
    </c:if>
    --%>
    </td></tr></table>
    </td></tr>
</table>
    <table align="center" cellpadding="0" cellspacing="0"><tr><td>
    <jsp:include page="/jsp/commons/footer.jsp"/>
    </td></tr></table>
    </body>
</html>

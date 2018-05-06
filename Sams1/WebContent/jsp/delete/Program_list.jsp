<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.org.uta.sams.beans.*,java.org.uta.sams.controller.ProgramController,java.util.ArrayList"%>
<jsp:useBean id="searchbean" scope="request" class="java.org.uta.sams.beans.SearchBean" />
<jsp:setProperty name="searchbean" property="*"/>

  

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
.tableheading
            {
                    background-color: #333333; 
                    color: white; 
                    font-size: 14px; 
                    font-weight: bold; 
                    text-align: left;
                    font-family: Arial, Helvetica, sans-serif; 

            }
.tableheading2 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
	text-align: left;
	
}
.tablerows {
        color: #000000; 
        background-color:#EEEEEE;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	text-align: left;
        vertical-align: text-top;

}
.tabletext
{
	color: #000000; 
        background-color: #CCCCCC;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	text-align: left;
        vertical-align: text-top;
}

</style>
<script>
function alternate(id){ 
       
    if(document.getElementsByTagName){  
    var table = document.getElementById(id);   
    var rows = table.getElementsByTagName("tr");   
    
    rows[0].className = "tableheading"; 
    for(i = 1; i < rows.length; i++){           
 //manipulate rows 
     if(i % 2 == 0){ 
       rows[i].className = "tabletext"; 
     }else{ 
       rows[i].className = "tablerows"; 
     }       
   } 
 } 
}
</script> 
</head>
    <body onload="alternate('thetable')">
  <table valign="top" cellpadding="0"align="center" cellspacing="0" width='759'>
    <tr><td>
          <jsp:include page="/jsp/commons/header.jsp"/>
    </td></tr>
</table>    
<table valign="top" align="center" width="759" cellspacing="0" cellpadding="0"><tr>
<td style="border-right: 1px solid rgb(255, 255, 255);" bgcolor="#666666" height="92" valign="top" width="100">
 <script type="text/javascript" src="/jsp/commons/sams/fsmenu.js"></script>
              <jsp:include page="/jsp/commons/left.jsp"/>
            
 </td>
<td style="padding-left:5px"> 


<table width="100%">
    <caption align="top" class="style1">
       <tr >
            <% String name=""; 
			if(session.getAttribute("user")!=null)name=((UserBean)session.getAttribute("user")).getUsername(); 
            name=request.getRemoteUser();
            %>
        <td colspan="4"><span class="style1">Welcome <%=name%></span><span class="style1">.</span> </td>
        <td align="right" colspan="2"><span class="style1"><a href="/Sams/jsp/user/logoff.jsp">Sign Out </a></span></td>
      </tr>
	  <tr>
	     <td height="1" bgcolor="#990000" colspan="6"></td>
	  </tr>
    
    <tr><td colspan="6" class="style1" align="center" valign="middle">Search Results For Delete Program</td></tr>
    <tr>
	     <td height="1" bgcolor="#990000" colspan="6"></td>
    </tr>
    <tr>
	     <td  colspan="6">&nbsp;</td>
    </tr>
</table>
<table width="100%" border = "0" id = "thetable">
<tr ><th >Program Name</th><th width="15%">Term</th><th width="15%">Type</th><th width="15%">Region</th><th width="15%">Country</th><th width="25%">Departments</th></tr>
<%
   String contextpath=request.getContextPath()+"/";
   String txtaction="";
   ProgramController programcontroller= new ProgramController();
   ArrayList programlist=programcontroller.searchPrograms(searchbean);
   if(programlist!=null){
       request.getSession().setAttribute("programlist",programlist);
       for(int i=0;i<programlist.size() ;i++){
           if(programlist.get(i)==null)continue;
           ProgramBean program = (ProgramBean)programlist.get(i);
%>


<tr valign="top"><td ><a href="<%=contextpath%>jsp/delete/deleteProgram_detail.jsp?program_name=<%=program.getProgramName()%>&term=<%=program.getTerm()%>"><%=program.getProgramName()%></a></td>
<td width="15%"><%=program.getTerm()%></td><td width="15%"><%=program.getProgramType()%></td><td width="15%"><%=program.getRegion()%></td><td width="15%"><%=program.getCountry()%></td>
<td width="25%">
    <%for(int j=0;j<program.getSubjects().length;j++){%>
    <%=program.getSubjects()[j]%>,
    <%}%>
</td></tr>           

<%
           
       }
   }else{
%>
   
  </table>
  <table>
  <tr><td colspan="4">Some Exception Occured. No data is presently available to present</td></tr>
  </table>
<%
   }


%>
</table>
<table width="100%">
<tr>
	  <td colspan="6">&nbsp;</td>
 </tr>
 <tr>
	     <td height="1" bgcolor="#990000" colspan="6"></td>
 </tr>
 <tr>
	     <td colspan="6">&nbsp;</td>
 </tr>
</table>

</td></tr>
</table>
    <table align="center" cellpadding="0" cellspacing="0"><tr><td>
    <jsp:include page="/jsp/commons/footer.jsp"/>
    </td></tr></table>

    
    </body>
</html>

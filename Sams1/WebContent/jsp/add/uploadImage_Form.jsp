<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.org.uta.sams.controller.ProgramController,java.org.uta.sams.beans.*"%>
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
           <style type="text/css">
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
.previousvalues {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
	color: #009900;
}
.style1 {font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: #333333; font-weight: bold; }
-->
</style>
    </head>
    
    
    <script>
        var nm;
        function change(){
        var ele = document.uploadForm.position;
        for(var j=0;j<ele.options.length;j++){
        //alert(ele.options[j].selected+" "+ele.options[j].text+" "+ele.options[j].value);
         if(ele.options[j].selected){
         
            nm=ele.options[j].value;
            document.uploadForm.pos.value=nm;
             }
        
        }
        
        
        }
        function change2()
        {
             uploadForm.Upload.value='Uploading...';
            document.uploadForm.action='uploadImage.jsp?prg=<%=request.getParameter("prg")%>&term=<%=request.getParameter("term")%>&position='+document.uploadForm.pos.value;
            document.uploadForm.submit();
  
        }
    </script>
    <body>
<table valign="top" cellpadding="0"align="center" cellspacing="0" width='759' >
    <tr><td>
          <jsp:include page="/jsp/commons/header.jsp"/>
    </td></tr>
</table>    

<table valign="top" align="center" width="759" cellspacing="0" cellpadding="0" border="0"><tr>
<td style="border-right: 1px solid rgb(255, 255, 255);" bgcolor="#666666" height="92" valign="top" width="331">
 <script type="text/javascript" src="/jsp/commons/sams/fsmenu.js"></script>
              <jsp:include page="/jsp/commons/left.jsp"/>
            
 </td>
<td style="padding-left:5px">
    
<form name="uploadForm" action="change2();" enctype="multipart/form-data" method="post">    
    <table width="100%" border="0" cellspacing="5" name="formTable">
    <caption align="top" class="style1">
       <tr >
            <% String name=""; 
			if(session.getAttribute("user")!=null)name=((UserBean)session.getAttribute("user")).getUsername(); 
            name=request.getRemoteUser();
            %>
        <td  width="50%" bgcolor="#FFFFFF" ><span class="style1">Welcome <%=name%></span><span class="style2">.</span> </td>
        <td  width="50%" bgcolor="#FFFFFF" align="right" class="style1"><a href="/Sams/jsp/user/logoff.jsp">Sign Out </a></td>
      </tr>
	  <tr>
	     <td height="1" bgcolor="#990000" colspan="2"></td>
	  </tr>

    <tr><td align="center" colspan="2" class="style1">
      Image Upload Form
      </td></tr>
       <tr>
	     <td height="1" bgcolor="#990000" colspan="2"></td>
	  </tr>
    </caption>
    <tr>
	     <td colspan="2">&nbsp;</td>
	  </tr>
    <tr>
       
       <%
       String programName = request.getParameter("prg");
       String term1 = request.getParameter("term");
       
       
       %>
       <tr>
            <td class="formtable">Program Name</td>
            <%
            if(request.getParameter("prg") != null)
            {%>
                <td><input type=text value="<%=request.getParameter("prg")%>" disabled />
                    <input type="hidden" name="prg" value="<%=request.getParameter("prg")%>">
                    </td>
           <% }
            else
           {%>
            
            <td><input type=text name="prg"></td>
            <%
            }
            %>
            
            
            
       </tr>
       
       <tr>
            <td class="formtable">Term of Study</td>
<%            
            if(request.getParameter("term") != null)
{%>
                <td><input type=text value="<%=request.getParameter("term")%>" disabled />
                    <input type="hidden" name="term" value="<%=request.getParameter("term")%>">
                </td>
           <% }
            else
            {
            %>
            <td><input type=text name="term"></td>
            <%
            }
            %>
       </tr>
       <tr>
       <td colspan="2">&nbsp;</td>
      </tr>
       <tr>
       <td colspan="2" bgcolor="#999999" class="formtable"><b>Images already present for this program name and term:</b></td>
      </tr>
      <tr>
            <td colspan="2">
            <%
               ProgramBean pb = new ProgramBean();
            ProgramController pc = new ProgramController();
            pb= pc.showDetail(programName,term1);
            %>   
 <table border="0" width="100%">
  <tr>
      <td class="formtable">Image1:</td>
      <td class="formtable">Image2:</td>
      <td class="formtable">Image3:</td>
  
  </tr>
  
  <%
    
  String imgPath1 = request.getContextPath()+"/jsp/search/images/"+pb.getImg1();
  String imgPath2 = request.getContextPath()+"/jsp/search/images/"+pb.getImg2();
  String imgPath3 = request.getContextPath()+"/jsp/search/images/"+pb.getImg3();


  
%>
  <tr> 
  <% if(  !(pb.getImg1().equals(""))   ) {%>
      <td><img src="<%=imgPath1 %>"  /></td>
    <% } %>
    
    <%if(  !(pb.getImg2().equals(""))   ) {%>
      <td><img src="<%=imgPath2%>" /></td>
    <% } %>
    
    <% if(  !(pb.getImg3().equals(""))   ) {%>
      <td><img src="<%=imgPath3%>" /></td>
    <% } %>
  </tr>
  <tr>
      <td><%=pb.getImg1()%></td>
      <td><%=pb.getImg2()%></td>
      <td><%=pb.getImg3()%></td>
  
  </tr>

 </table>

             
     
            </td>
      
      </tr>
      <tr>
       <td colspan="2" bgcolor="#999999" class="formtable"><b>Upload Image:</b></td>
      </tr>
      
      <tr>
            <td class="formtable">Select the image position: </td>
            <td><select name="position" onchange="change();">
                <option value="null">Select One</option> 
                <option value="img1">Image 1</option>
                <option value="img2">Image 2</option>
                <option value="img3">Image 3</option>
</select></td>
       </tr>
       
       
       <tr>
         <td valign="top" class="formtable">Select file: </td>
      <td >
       
       

                
    <input type="hidden" name="pos" value=""/>
    <input type="file" name="file"/>
    <input TYPE=Button name='Upload' Value='Upload' onClick="change2();">
     
    </form>
 </td>
       </tr>
   </table>


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
   
        
   
    </td></tr>
</table>
    <table align="center" cellpadding="0" cellspacing="0"><tr><td>
    <jsp:include page="/jsp/commons/footer.jsp"/>
    </td></tr></table>
    </body>
</html>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.org.uta.sams.controller.ProgramController,java.org.uta.sams.beans.*"%><%@page contentType="text/html"%>

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
.normalstyle {font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: #333333; font-weight: bold; }
-->
</style>
    </head>
    
       
   <script >
       var country= new Array();
       var region= new Array();
       var departments=new Array();
       var schools=new Array();
       var deptList=new Array();
       
       function populateCountry(){
       var  i=0;
       
    <%
        String program=request.getParameter("program_name");
        String term=request.getParameter("term");
        //program.replaceAll("%20"," ");
        //term.replaceAll("%20"," ");
        ProgramController programcontroller=new ProgramController();
        ContainerBean containerbean=programcontroller.updateProgramShowDetail(program,term);
        UtilityBean utilitybean=containerbean.getUtilitybean();
        ProgramBean programbean=containerbean.getProgrambean();
        String[][] region_country=utilitybean.getRegion_country();
        if(region_country!=null){ 
            for(int i=0;i<region_country.length;i++)
            {
                for(int j=0;j<region_country[i].length;j++){
                    if(region_country[i][j]!=null&&!region_country[i][j].equalsIgnoreCase("null")){

    %>
     if('<%=j%>'!='0'){
     country[i]='<%=region_country[i][j]%>';
     region[i]='<%=region_country[i][0]%>';
     i++;
     }
    <%
                    }
    }%>
    
     <%
            }
        }
    %>
    }
    
    function populateDepartments(){
    
        var  i=0;
       
    <%
      
        String[][] dept_school=utilitybean.getSchool_departments();
        if(dept_school!=null){ 
            for(int i=0;i<dept_school.length;i++)
            {
                for(int j=0;j<dept_school[i].length;j++){
                    if(dept_school[i][j]!=null&&!dept_school[i][j].equalsIgnoreCase("null")){

    %>
     if('<%=j%>'!='0'){
     departments[i]='<%=dept_school[i][j]%>';
     schools[i]='<%=dept_school[i][0]%>';
     i++;
     }
    <%
                    }
    }%>
    
     <%
            }
        }
    %>
    
    }
    
   /* function display(){
        
        populateCountry();
        populateDepartments();
        var temp;
        temp="Region\t Country<br>";
        for(var i=0;i<region.length;i++){
          temp+=""+region[i]+"\t"+country[i]+"<br>";
         }
         temp+="School\t department<br>";
         for(var i=0;i<schools.length;i++){
          temp+=""+schools[i]+"\t"+departments[i]+"<br>";
         }
         var ele=document.getElementById("test");
         ele.innerHTML=temp;
         ele.visible=true;
         
    }
    */
    
    function isPresent(selectbox,key){
         var i=0;
         for(i=0;i<selectbox.options.length;i++){
             if(selectbox.options[i].value==key)return true;
         }
         return false;
    }
    
    function initialize(){
        populateCountry();
        populateDepartments();
      var i=0,j=0;
      var regionSelect=document.getElementById("regionSelect");
      for(i=0;i<region.length;i++){
         if(!isPresent(regionSelect,region[i])){
             var optn=document.createElement("OPTION");
             optn.text=region[i];
             optn.value=region[i];
             regionSelect.options.add(optn);
         }
      }
      var schoolSelect=document.getElementById("schoolSelect");
        for(i=0;i<schools.length;i++){
          if(!isPresent(schoolSelect,schools[i])){
              var optn=document.createElement("OPTION");
              optn.text=schools[i];
              optn.value=schools[i];
              schoolSelect.options.add(optn);
           }
        }
     }
     
     function emptySelectBox(selectBox){
        var i=0;
        for(i=selectBox.options.length-1;i>=0;i--){
           selectBox.remove(i);
        }
     }
     
     function updateCountry(){
        var j=0,i=0;
        var name;
        var ele=document.getElementById("regionSelect");
        for(j=0;j<ele.options.length;j++){
        //alert(ele.options[j].selected+" "+ele.options[j].text+" "+ele.options[j].value);
         if(ele.options[j].selected){
             name=ele.options[j].value;
             //alert("option is selected");
             }
        }
        var countrySelect=document.getElementById("countrySelect");
        emptySelectBox(countrySelect);
        //alert("after select box"+name);
        for(i=0;i<region.length;i++){
         if(region[i]==name){
             var optn=document.createElement("OPTION");
             optn.text=country[i];
             optn.value=country[i];
             countrySelect.options.add(optn);
         }
      }
        
     }
     
     function updateDepartment(){
             var j=0,i=0;
        var name=new Array();
        var index=0;
        var ele=document.getElementById("schoolSelect");
        for(j=0;j<ele.options.length;j++){
        //alert(ele.options[j].selected+" "+ele.options[j].text+" "+ele.options[j].value);
         if(ele.options[j].selected){
             name[index++]=ele.options[j].value;
             //alert("option is selected");
             }
        }
        var deptSelect=document.getElementById("departmentSelect");
        emptySelectBox(deptSelect);
        //alert("after select box"+name);
        for(index=0;index<name.length;index++){
        for(i=0;i<schools.length;i++){
         if(schools[i]==name[index]){
             var optn=document.createElement("OPTION");
             optn.text=departments[i];
             optn.value=departments[i];
             deptSelect.options.add(optn);
         }
      }
      }
     }
     
      function addToDepartmentList(){
         var ele=document.getElementById("departmentSelect");
         var deptList=new Array();
         var index=0;
        for(j=0;j<ele.options.length;j++){
        //alert(ele.options[j].selected+" "+ele.options[j].text+" "+ele.options[j].value);
         if(ele.options[j].selected){
             deptList[index++]=ele.options[j].value;
             //alert("option is selected");
             }
        }
        var deptSelect=document.getElementById("departmentList");
        //emptySelectBox(departmentSelect);
        //alert("after select box"+name);
        for(i=0;i<deptList.length;i++){
             var optn=document.createElement("OPTION");
             optn.text=deptList[i];
             optn.value=deptList[i];
             if(!isPresent(deptSelect,deptList[i]))deptSelect.options.add(optn);
         
      }
     }
     
     function deleteFromDeptList(){
         var i=0;
         var selectBox=document.getElementById("departmentList");
        for(i=selectBox.options.length-1;i>=0;i--){
           if(selectBox.options[i].selected)selectBox.remove(i);
        }
        
        }
        
        function selectAll(){
         var i=0;
         var selectBox=document.getElementById("departmentList");
         for(i=0;i<selectBox.options.length;i++){
           selectBox.options[i].selected=true;
        }
     }
     
     function submitForm(){
           selectAll();
           // put the alert box and javascript validation part here below
           
           document.programForm.submit();
     }
    </script >
    <body onload="initialize()">
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

 <form name="programForm" action="updateProgram.jsp" method="POST">
        <input type="hidden" name="programID" value="<%=programbean.getProgramID()%>">
        <input type="hidden" name="termID" value="<%=programbean.getTermID()%>">
        <input type="hidden" name="programName" value="<%=programbean.getProgramName()%>">
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
      Update Program Detail Form
      </td></tr>
       <tr>
	     <td height="1" bgcolor="#990000" colspan="2"></td>
	  </tr>
    </caption>
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
               <td  width="50%" class="formtable" valign="top">Program Name : </td>
               <td><input type="text" name="programName"  style="width:180px" value="<%=programbean.getProgramName()%>" disabled /></td>
            </tr>
            <tr>
                <td  width="50%" class="formtable" valign="top">Program Type : </td>
                <td><span class="previousvalues"><%=programbean.getProgramType()%></span><br><select name="programType" style="width:180px">
                    <option>affiliated</option>
                    <option>Exchange</option>
                    <option>Faculty-Led</option>
                </select></td>
            </tr>
           
            <tr>
               <td  width="50%" class="formtable" valign="top">Term of Study : </td>
               <td ><input type="text" name="programName"  style="width:180px" value="<%=programbean.getTerm()%>" disabled /><br><input type="hidden"  style="width:180px" name="term" value="<%=programbean.getTerm()%>"></td>
            </tr>
                          
            
            <tr>
                <td width="50%" valign="top" class="formtable">Languages:</td>
                <td><span class="previousvalues"><%for(int i=0;i<programbean.getLanguages().length;i++){%><%=programbean.getLanguages()[i]%>&nbsp;<%}%></span><br>
                    <select name="languages" size="4" style="width:180px" tabindex="4" multiple>
                <%
                    String[] lang = utilitybean.getLanguages();
                    for(int i=0;i<lang.length;i++){
                %>
                    <option><%=lang[i]%></option>
                   <%}%>

		</select>
                </td>
            </tr>
            <tr>
                <td  width="50%" class="formtable" valign="top">Region : </td>
                <td><span class="previousvalues"><%=programbean.getRegion()%></span><br><select id="regionSelect" name="region" style="width:180px" onchange="updateCountry()"><option>---Regions-----</option></select></td>
            </tr>
            <tr>
                <td></td>
                <td><!--<input type="text" name="otherRegion" value="" />--></td>
            </tr>
             <tr>
                <td  width="50%" class="formtable" valign="top">Country : </td>
                <td><span class="previousvalues"><%=programbean.getCountry()%></span><br><select id="countrySelect" style="width:180px" name="country"></select></td>
            </tr>
            <tr>
                <td></td> 
                <td><!--<input type="text" name="otherCountry" value="" />--></td>
            </tr>
<tr>
<td  width="50%" class="formtable" valign="top">School/College :</td><td  width="50%" class="formtable" valign="top">Subjects :</td></tr>            

<tr>   
     <td><select id="schoolSelect" name="school" style="width:180px" onchange="updateDepartment()" multiple size="10"><option>---Schools-----</option></select></td>
    
      <td align="left">  
                              <table border="0" cellpadding="0" cellspacing="0">
                              <tr><td align="left"><select id="departmentSelect" name="sub" style="width:80px" multiple size=10></select></td>  
                              <td valign="middle"><input type="button" value=">>" name="right" onClick="javascript:addToDepartmentList();"><br><br>
                              <input type="button" value="<<" name="left" onClick="javascript:deleteFromDeptList();"></td>
                              <td><select style="width:80px" id="departmentList" name="subjects" multiple size=10>
                                  <%for(int i=0;i<programbean.getSubjects().length;i++){%>
                                  <option value="<%=programbean.getSubjects()[i]%>"><%=programbean.getSubjects()[i]%></option>
                                  <%}%>
                              </select></td>
                              </tr>
                              </table>
                        </td>
 </tr>
       </td>
            <tr>
                <td  width="50%" class="formtable" valign="top">Description : </td>
		<td><textarea cols="21" rows="10" style="width:180px" name="description"><%=programbean.getDescription()%></textarea></td>
           </tr>
           <tr>
            <td width="50%" class="formtable" valign="top">Fees:</td>
            <td><textarea name="fee" rows="7" style="width:180px" ><%=programbean.getFee()%></textarea></td>
           </tr>    
           
            <tr>
        	    <td  width="50%" class="formtable" valign="top">Housing : </td>
				<td><textarea cols="21" rows="10" style="width:180px" name="housing"><%=programbean.getHousing()%></textarea></td>
            </tr>
            <tr>
                <td  width="50%" class="formtable" valign="top">Status : </td>
                <td><span class="previousvalues"><%=programbean.getStatus()%></span><br><select name="status">
                    <option>active</option>
                    <option>deactive</option>
                    </select></td>
            </tr>
          <tr>
	     <td colspan="2">&nbsp;</td>
	  </tr>
          
            <tr>
               <td  colspan="3" height="26" align="center"><input type="button" value="submit" onclick="javacript:submitForm();"><input type="reset" value="reset"></td>
            </tr>
            
              <tr>
		<td>&nbsp;
  			
  		</td>
		<td>&nbsp;
                        
		</td>
	</tr>
        </table>

               
    </form>
    
    
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
<tr><td>
    
 
</td></tr>
</table>
    <table align="center" cellpadding="0" cellspacing="0"><tr><td>
    <jsp:include page="/jsp/commons/footer.jsp"/>
    </td></tr></table>
    </body>
</html>

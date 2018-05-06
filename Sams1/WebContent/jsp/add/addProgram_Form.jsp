<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.org.uta.sams.controller.ProgramController, java.org.uta.sams.beans.*"%><%@page contentType="text/html"%>

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
        <script type="text/javascript" src="/jsp/commons/validation.js"></script>
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
    <script >
       var country= new Array();
       var region= new Array();
       var departments=new Array();
       var schools=new Array();
       var deptList=new Array();
       
       function populateCountry(){
       var  i=0;
       
    <%
        String program=request.getParameter("program");
        String term=request.getParameter("term");
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
             deptSelect.options.add(optn);
         
      }
     }
     
     function deleteFromDeptList(){
         var i=0;
         var selectBox=document.getElementById("departmentList");
        for(i=selectBox.options.length-1;i>=0;i--){
           if(selectBox.options[i].selected)selectBox.remove(i);
        }
     }
     
     function trim(v1){
          
          
     }
     
    function setControl(id)
    {
	var obj;
        
	if( document.getElementById(id).disabled){
		document.getElementById(id).disabled = false;      
                document.getElementById(id+"2").value=true;
	}
        else{
		document.getElementById(id).disabled = true;
                document.getElementById(id+"2").value=true;
	}
        
     }
    
    function countit()
    {
       formcontent=document.getElementById('housing').value
       if(formcontent.length < 200)
       {
            document.getElementById('charcount1').className="previousvalues"
            document.getElementById('charcount1').innerHTML=formcontent.length
        }
        if(formcontent.length > 200)
       {
            document.getElementById('charcount1').className="errorcode"
            document.getElementById('charcount1').innerHTML=formcontent.length
        }
        
     }
     
     function countit2()
     {
        formcontent2=document.getElementById('fee').value
       if(formcontent2.length < 200)
       {
            document.getElementById('charcount2').className="previousvalues"
            document.getElementById('charcount2').innerHTML=formcontent2.length
        }
        if(formcontent2.length > 200)
       {
            document.getElementById('charcount2').className="errorcode"
            document.getElementById('charcount2').innerHTML=formcontent2.length
        }
        
      }
      
      function countit3()
      {
        formcontent3=document.getElementById('description').value
       if(formcontent3.length < 200)
       {
            document.getElementById('charcount3').className="previousvalues"
            document.getElementById('charcount3').innerHTML=formcontent3.length
        }
        if(formcontent3.length > 200)
       {
            document.getElementById('charcount3').className="errorcode"
            document.getElementById('charcount3').innerHTML=formcontent3.length
        }
      }
    
    function hint1()
    {
       document.getElementById('err2').innerHTML="Program Type by default is Affiliated"
       
    }
    function hint2()
    {
        document.getElementById('err2').innerHTML=""
        document.getElementById('err3').innerHTML="Type of Study by default is Summer"
    }
    function hint3()
    {
        document.getElementById('err3').innerHTML=""
        document.getElementById('err4').innerHTML="To add more languages check 'other languages' and add delimeter '|' between each language"
    }
    function runfunset1(id)
    {
        setControl(id)
        hint4()
        
    }
    function runfunset2(id)
    {
        setControl(id)
        hint5()
        
    }
    function runfunset3(id)
    {
        setControl(id)
        hint6()
        
    }
    function hint4()
    {
        document.getElementById('err4').innerHTML=""
        document.getElementById('err5').innerHTML="You can add only one extra Region"
    }
    function hint5()
    {
        document.getElementById('err5').innerHTML=""
        document.getElementById('err6').innerHTML="You can add only one extra Country"
    }
    function hint6()
    {
        document.getElementById('err6').innerHTML=""
        document.getElementById('err7').innerHTML="You can add only one extra 'Subject | school' combination use delimeter '|' between them"
    }
    function hint7()
    {
        document.getElementById('err7').innerHTML=""
        document.getElementById('err8').innerHTML="Limit your description to 200 chars"
    }
    function hint8()
    {
        document.getElementById('err8').innerHTML=""
        document.getElementById('err9').innerHTML="Limit your description to 200 chars"
    }
    function hint9()
    {
        document.getElementById('err9').innerHTML=""
        document.getElementById('err10').innerHTML="Limit your description to 200 chars"
    }
    function allclear()
    {   
         document.getElementById('err10').innerHTML=""
         document.getElementById('err4').innerHtml=""
    }
    
    function validateForm()
    { 
        var proceed = true;
        errRegion.innerHTML=""
        errCountry.innerHTML=""
        errSchool.innerHTML="";
        errSubjects.innerHTML=""
        errDesc.innerHTML="";
        errFee.innerHTML=""
        errHous.innerHTML="";
        err1.innerHTML = "";
        errLang.innerHTML = "";
        
        formcontent=document.getElementById('programName').value
        if(formcontent.length == 0)
        { 
             document.getElementById('err1').innerHTML="! Program Name cannot be empty"
             proceed = false
        }
        else if (formcontent.length <4)
        {
            document.getElementById('err1').innerHTML="! Program Name cannot be less than 4 characters"
            proceed = false
        }
        else
        {
            document.getElementById('err1').innerHTML=""
            proceed = true
        }
        
            
        if(programForm.checkLanguages.checked == true)
            {
                if (programForm.otherLanguages.value == null || programForm.otherLanguages.value == "" ) {
                errLang.innerHTML ="! Enter language";
                proceed = false;
               
                }
            }
            else
            {
                
                var langCount = 0;
                for (var i=0;i<programForm.languages.length;i++)
                {           
                    if(programForm.languages.options[i].selected){
                     langCount++;                 
                     }                    
                }
                 if (langCount == 0 && programForm.languages.length >0 ){
                 errLang.innerHTML ="! Select Language";
                 proceed = false;
                 }
             }           
           if(programForm.checkRegion.checked==true)
           {
                if (programForm.otherRegion.value == null || programForm.otherRegion.value == "" ) {
                alert("check 7");
                errRegion.innerHTML ="! Enter region";
                proceed = false;
               
                }       
            }
            else
            {
                if(programForm.region.options[0].selected){
                 errRegion.innerHTML ="! Select Region";
                proceed = false;
                }
            }
            
            if(programForm.checkCountry.checked==true)
            {
                if (programForm.otherCountry.value == null || programForm.otherCountry.value == "" ) {
                alert("check 8");
                errCountry.innerHTML ="! Enter Country";
                proceed = false;
                                
                }                       
            }
            else
            {
            
                if(programForm.country.options[0].selected){
                errCountry.innerHTML ="! Select Country";
                proceed = false;
                }
            }
            if(programForm.checkSchools.checked==true)
            {
                if (programForm.otherSchools.value == null || programForm.otherSchools.value == "" ) {
                errSchool.innerHTML ="! Enter School/Departments";
                proceed = false;                
                } 

            }
            else
            {
                var schoolCount=0;
                for (var j=0;j<programForm.school.length;j++)
                {    
                
                    if(programForm.school.options[j].selected){
                    schoolCount++;                 
                    }                    
                }
                if (schoolCount == 0 && programForm.school.length >0 ){
                errSchool.innerHTML ="! Select school";
                proceed = false;
                }
               var subCount=0;
                for (var k=0;k<programForm.subjects.length;k++){
           
                    if(programForm.subjects.options[k].selected){
                    subCount++;                 
                    } 
                }
                if (subCount == 0 && programForm.subjects.length >0 ){
                 errSubjects.innerHTML ="! Select subject";
                 proceed = false;
                }
           
            }
            
            if (programForm.description.value == null || programForm.description.value == "" ) {
            errDesc.innerHTML ="! Enter Description";
            proceed = false;
            }
            
            if (programForm.fee.value == null || programForm.fee.value == "" ) {
            errFee.innerHTML ="! Enter Fee Description";
            proceed = false;
            }
            
            if (programForm.housing.value == null || programForm.housing.value == "" ) {
            errHous.innerHTML ="! Enter Housing Detail";
            proceed = false;
            }
                     
            return(proceed);
    }
            
    </script >
    </head>

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
    
  <form name="programForm" action="<%=request.getContextPath()%>/jsp/add/addProgram.jsp" onSubmit="return(validateForm());" method="POST">
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
      Add Program Form
      </td></tr>
       <tr>
	     <td height="1" bgcolor="#990000" colspan="2"></td>
	  </tr>
    </caption>
    <tr>
	     <td colspan="2">&nbsp;</td>
	  </tr>
    <tr>
      <td width="50%" class="formtable">Program Name:</td>
      <td><input type="text" name="programName" value="" tabindex="1"  style="width:180px"  /></td>
    </tr>
    <tr>
      <td width="50%" class="formtable"></td>
      <td id="err1" class="errorcode"></td>
    </tr>
    <tr>
      <td width="50%" class="formtable">Program Type:</td>
      <td><select name="programType" style="width:180px" tabindex="2" onFocus="hint1()">
                    <option>affiliated</option>
                    <option>Exchange</option>
                    <option>Faculty-Led</option>

      	  </select>
      </td>
    </tr>
    <tr>
      <td width="50%" class="formtable"></td>
      <td id="err2" class="previousvalues" ></td>
    </tr>
    <tr>
      <td width="50%" class="formtable">Term of Study:</td>
      <td><select name="term" size="1" style="width:180px" tabindex="3" onFocus="hint2()">
                    <option value="summer">Summer</option>
                    <option value="semester/year">Semester/year</option>

		 </select>
      </td>
    </tr>
    <tr>
      <td width="50%" class="formtable"></td>
      <td id="err3" class="previousvalues"></td>
    </tr>
    <tr>
      <td width="50%" valign="top"  class="formtable">Languages:<br><br><span valign="bottom" id="err4" class="previousvalues"></span></td>
      <td><select name="languages" size="4" style="width:180px" tabindex="4" multiple onFocus="hint3()" onBlur="allclear()">
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
      <td width="50%" class="formtable"></td>
      <td id="errLang" class="errorcode"></td>
    </tr>
    <tr>
        <td class="formtable">Other Languages : </td>
        <td><input type="checkbox" id="checkLanguages" name="checkLanguages" value="enable" onclick="setControl('otherLanguages');"> <input type="text" id="otherLanguages" name="otherLanguages" style="width:150px" value="" disabled/> </td>
                     
    </tr>

    <tr>
      <td width="50%" class="formtable">Region:</td>
      <td><select id="regionSelect" name="region" style="width:180px" tabindex="5" onchange="updateCountry()" onFocus="allclear()">
			<option>----Regions----</option>
        </select>
      </td>
    </tr>
    <tr>
      <td width="50%" class="formtable"></td>
      <td id="errRegion" class="errorcode" ></td>
    </tr>
    <tr>
        <td class="formtable">Other Region : </td>
        <td><input type="checkbox" name="checkRegion" id="checkRegion" value="enable" onclick="runfunset1('otherRegion');" ><input type="text" name="otherRegion"  id="otherRegion" value="" style="width:150px" disabled/></td>
    </tr>
    <tr>
      <td width="50%" class="formtable"></td>
      <td id="err5" class="previousvalues" ></td>
    </tr>

    <tr>
      <td width="50%" class="formtable">Country:</td>
      <td><select id="countrySelect" name="country" style="width:180px" tabindex="6">
	<option>--Country--</option>     
      </select>
      </td>
    </tr>
    <tr>
      <td width="50%" class="formtable"></td>
      <td id="errCountry" class="errorcode" ></td>
    </tr>
    <tr>
        <td class="formtable">Other Country :</td> 
        <td><input type="checkbox"  name="checkCountry" id="checkCountry" value="enable"  onclick="runfunset2('otherCountry');"><input type="text" name="otherCountry" id="otherCountry" style="width:150px"  value="" disabled></td>
    </tr>
    <tr>
      <td width="50%" class="formtable"></td>
      <td id="err6" class="previousvalues" ></td>
    </tr>
    <tr>
      <td width="50%" class="formtable">School/College:</td>
      <td class="formtable">Subjects:</td>
    </tr>
    <tr>
      <td width="50%" class="formtable"><select id="schoolSelect" name="school" size="7" style="width:220px" tabindex="7" onchange="updateDepartment()" multiple>
      </select>
      </td>
      <td><select id="departmentSelect" name="subjects" size="7"  style="width:180px" tabindex="8" multiple>
      </select>
      </td>
    </tr>
    <tr>
      <td width="50%" id ="errSchool" class="errorcode"></td>
      <td id="errSubjects" class="errorcode" ></td>
    </tr>
    <tr>
        <td class="formtable">Other Subjects | School/College : </td>
        <td> <input type="checkbox" name="checkSchools" id="checkSchools" value="enable"  onclick="runfunset3('otherSchools');"><input type="text" name="otherSchools" id="otherSchools" style="width:150px"  value="" disabled/>
		</td>
                     
    </tr>
    <tr>
      <td width="50%" class="formtable"></td>
      <td id="err7" class="previousvalues" ></td>
    </tr>

    <tr>
      <td width="50%" class="formtable" valign="top" >Description:<br><div align="right" id="charcount3" ></div></td>
      <td><textarea name="description" rows="7" style="width:180px" tabindex="9" onFocus="hint7()" onkeyup="countit3()"></textarea></td>
    </tr>
    <tr>
      <td width="50%" class="formtable"></td>
      <td id="err8" class="previousvalues" ></td>
    </tr>
    <tr>
      <td width="50%" class="formtable"></td>
      <td id="errDesc" class="errorcode" ></td>
    </tr>    
    <tr>
      <td width="50%" class="formtable" valign="top">Fees:<br><div align="right" id="charcount2" ></div></td>
      <td><textarea name="fee" rows="7" style="width:180px" tabindex="10" onFocus="hint8()" onkeyup="countit2()"></textarea></td>
    </tr>
    <tr>
      <td width="50%" class="formtable"></td>
      <td id="err9" class="previousvalues" ></td>
    </tr>
    <tr>
      <td width="50%" class="formtable"></td>
      <td id="errFee" class="errorcode" ></td>
    </tr>
    <tr>
      <td width="50%" class="formtable" valign="top">Housing:<br><div align="right" id="charcount1" ></div></td>
      <td><textarea name="housing" rows="7" style="width:180px" tabindex="11" onFocus="hint9()" onkeyup="countit()"></textarea></td>
    </tr>
    <tr>
      <td width="50%" class="formtable"></td>
      <td id="err10" class="previousvalues" ></td>
    </tr>
    <tr>
      <td width="50%" class="formtable"></td>
      <td id="errHous" class="errorcode" ></td>
    </tr>
  </table>

             <input type="hidden" id="otherRegion2" name="otherRegion2" value="false"> 
             <input type="hidden" id="otherLanguages2" name="otherLanguages2" value="false"> 
             <input type="hidden" id="otherCountry2" name="otherCountry2" value="false"> 
             <input type="hidden" id="otherSchools2" name="otherSchools2" value="false"> 

  <table align="center">
  	<tr>
		<td>
  			<input name="" type="submit" value="Add Program" tabindex="12" />
  		</td>
		<td><input name="" type="reset" value="Reset Form" tabindex="13"/></td>
	</tr>
        <tr>
		<td>&nbsp;
  			
  		</td>
		<td>&nbsp;
                        
		</td>
	</tr>
  </table>
</form>


</td></tr>
<tr><td>
    
 
</td></tr>
</table>
    <table align="center" cellpadding="0" cellspacing="0"><tr><td>
    <jsp:include page="/jsp/commons/footer.jsp"/>
    </td></tr></table>
    </body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Portal</title>
<link rel="stylesheet" href="resources/css/css/datepicker3.min.css" />
</head>
<style type="text/css">
.field-error .control-label,
.field-error .help-block,
.field-error .form-control-feedback {
     color: red;
}
.field-success .control-label,
.field-success .help-block,
.field-success .form-control-feedback {
   color:  #3c763d;
}
</style>
<body>
     <div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">US Onboarding- Update Consultants</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-md-8 col-sm-12">
										<fieldset>
										
										<form action="/" method="post" id="formid" class="form-horizontal">
										    <input type="hidden" name="candidate_id" id="candidate_id" value="${editbasic.candidate_id}">
					    	        		
									    	<input type="hidden" id="ssn_emp1"  value="${editbasic.ssn_no}">                           
				                            <input type="hidden" id="firstName1"  value="${editbasic.first_name}">
				                            <input type="hidden" id="middleName1" value="${editbasic.middlename}">
				                            <input type="hidden" id="familyName1" value="${editbasic.familyname}">
				                            <input type="hidden" id="emp_type1" value="${editbasic.emp_type}">  
				                            <input type="hidden" id="c2cType1"  value="${editbasic.c2c_type}">
				                            <input type="hidden" id="rec_name1" value="${editbasic.recname}">
				                            <input type="hidden" id="cont_team_name1"  value="${editbasic.cont_team_name}">
				                            <input type="hidden" id="email_id1" value="${editbasic.emailid}">
				                            <input type="hidden" id="phne_no1" value="${editbasic.contactno1}">
				                            <input type="hidden" id="phne_no21"  value="${editbasic.contactno2}">
					    	        		<input type="hidden" id="phne_no31"  value="${editbasic.contactno3}">					    	        		
					    	        		<input type="hidden" id="ctype21"  value="${editbasic.contactnotype2}">
					    	        		<input type="hidden" id="ctype31"  value="${editbasic.contactnotype3}">
				                            <input type="hidden" id="dob1" value="${editbasic.dob}">
				                            <input type="hidden" id="joining_Date1"  value="${editbasic.doj}">
				                            <input type="hidden" id="bgcType1" value="${editbasic.bgc_type}">
				                            <input type="hidden" id="designation1" value="${editbasic.designation}">
				                            <input type="hidden" id="work_auth1" value="${editbasic.workAuth}">
					    	        		<%-- <input type="hidden" id="pr_type"  value="${editbasic.payroll_type}"> --%>
					    	        		<input type="hidden" id="val_by"  value="${editbasic.validateby_flag}">
					    	        		
										    <div class="form-group row row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>SSN Number</label>
												<div class="col-sm-4">
													<input id="ssn_emp" type="text" title="Enter Valid SSN" maxlength="11"  value="${editbasic.ssn_no}" 
													autocomplete="off" placeholder="SSN Number" name="ssn_emp" class="form-control" required>
													<span  style="color:red;" id="ssnshow"></span>
												</div>
											</div>
											 <!-- onchange="checkSSN()" -->
							            <div class="form-group row">
								      	<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>User Name</label>
								     	<div class="col-sm-4">
									     	<input id="username" type="text"  
									       	placeholder="User Name"  
									      	 name="username" value="${editbasic.username}" class="form-control" readonly>
								  	     </div>
								         </div>
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Consultant FirstName</label>
												<div class="col-sm-4">
													<input id="firstName" type="text" value="${editbasic.first_name}"
													title="only alphabets are allowed"  minlength="2" maxlength="40"
													autocomplete="on" placeholder="First Name" name="firstName" class="form-control"  required>
												</div><!--  -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Middle Name</label>
												<div class="col-sm-4">
													<input id="middleName" type="text" value="${editbasic.middlename}" minlength="1" maxlength="40"
													title="only alphabets are allowed" 
													autocomplete="on" placeholder="Middle Name" name="middleName" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Last Name</label>
												<div class="col-sm-4">
													<input id="familyName" type="text" value="${editbasic.familyname}" minlength="1" maxlength="40"
													title="only alphabets are allowed" 
													autocomplete="on" placeholder="Last Name" name="familyName" class="form-control"  required>
												</div>
											</div>
										    	
										  <div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Consultant Type</label>
											   <div class="col-sm-4">
											     <select name="emp_type" class="form-control text-left" id="emp_type"  disabled required>
										             <option value="${editbasic.emp_type }" selected>${editbasic.emp_type }</option>
										         </select>
										      </div>
										    </div>
									      <c:choose>
									      <c:when test="${editbasic.emp_type=='C2C'}">
									      <div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>C2C Type</label>
											   <div class="col-sm-4">
											   <c:choose>
											   <c:when test="${editbasic.c2c_type=='Direct'}">
											    <input type="radio" name="c2cType" value="Direct" checked/>Direct <br>
											    <input type="radio" name="c2cType" value="Pass_Through"/>Pass Through
											   </c:when>
											    <c:when test="${editbasic.c2c_type=='Pass_Through'}">
											   <input type="radio" name="c2cType" value="Direct"/>Direct <br>
											    <input type="radio" name="c2cType" value="Pass_Through" checked/>Pass Through	
											   </c:when>
											   </c:choose>
												</div>
										    </div>
										  </c:when>
										  </c:choose>
											
											<div class="form-group row w2administrationemployees boxx">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Work Authorization</label>
											   <div class="col-sm-4">
											     <select name="work_auth" autoComplete="off" class="form-control text-left" id="work_auth" required>
										             <option value="">--Select type--</option> 
										  			  <c:forEach var="wa" items="${waList}">
											             <option value="${wa.work_auth_name}" ${wa.work_auth_name == editbasic.workAuth ? 'selected="selected"' : ''}>${wa.work_auth_name}</option>
														</c:forEach> 
										         </select>
										      </div>
										    </div>
										    
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Recruiter Name</label>
												<div class="col-sm-4">
							 						<input id="rec_name" type="text"  title="only alphabets are allowed" value="${editbasic.recname}"  minlength="2" maxlength="100"
													autocomplete="off" placeholder="Recruiter Name" name="rec_name" class="form-control">
												</div>
											</div>
											
											 <c:choose>
											<c:when test="${contractTeam.size() > 0}">
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>HR Name</label>
												<div class="col-sm-4">
												 <select name="cont_team_name" autoComplete="off" class="form-control text-left" id="cont_team_name">
														<option value="" disabled>Select Contract Team Name</option>
														 <c:choose>
											            <c:when test="${not empty editbasic.cont_team_name}">
											             <c:forEach var="ctName" items="${contractTeam}">
														 <option value="${ctName.ctName}">${ctName.ctName}</option>
														</c:forEach>
											            </c:when>
											            <c:otherwise>
											              <c:forEach var="ctName" items="${contractTeam}">
											             <option value="${ctName.ctName}" ${ctName.ctName == editbasic.cont_team_name ? 'selected="selected"' : ''}>${ctName.ctName}</option>
														</c:forEach> 
											            </c:otherwise>
											            </c:choose>
										         </select>
										         
												</div>
											 </div>
											</c:when>
											<c:otherwise>
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Contract Team Name</label>
												<div class="col-sm-4">
													<input id="cont_team_name" type="text" value="${editbasic.cont_team_name}"  minlength="2" maxlength="20"
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="Contract Team Name" name="cont_team_name" class="form-control">
												</div>
											   </div>
												</c:otherwise>
											</c:choose>
											
										<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Personal e-mail ID</label>
												<div class="col-sm-4">
													<input id="email_id" type="text"  value="${editbasic.emailid}" 
													title="Enter Valid e-mail format ex:xyz@gmail.com" minlength="" maxlength="50"
													autocomplete="off" placeholder="Personal e-mail ID" name="email_id" class="form-control" required>
												<Span id="emailspan" style="color:red;"></Span>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Personal Contact No</label>
												<div class="col-sm-4">
													<input id="phne_no" type="text" minlength="12" title="Enter Only Digits" maxlength="12"  value="${editbasic.contactno1}" 
													autocomplete="off" placeholder="Personal Contact No" name="phne_no" class="form-control" required>
												 <Span id="phonespan" style="color:red;"></Span>
												</div>
											</div>
											
												<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label">Alternative Contact No 1</label>
												<div class="col-sm-4 col-md-4">
													<input id="phne_no2" type="text"  minlength="12" maxlength="12" title="Enter Contact Number" 
													 autocomplete="off" placeholder="Alternative Contact number 1" name="phne_no2" class="form-control" value="${editbasic.contactno2}"> 
												 <Span id="phonespan2" style="color:red;"></Span>
												</div>
												<div class="col-sm-4 col-md-4" style="padding-right:40px;">
												 <c:choose>
											       <c:when test="${editbasic.contactnotype2=='Work'}">
												    <label>Home</label>&nbsp;<input type="radio" name="ctype2" value="Work" checked/>&nbsp;<label>Other</label>&nbsp;<input type="radio" name="ctype2" value="Other"/>
													</c:when>
													<c:when test="${editbasic.contactnotype2=='Other'}">
												    <label>Home</label>&nbsp;<input type="radio" name="ctype2" value="Work"/>&nbsp;<label>Other</label>&nbsp;<input type="radio" name="ctype2" value="Other" checked/>
													</c:when>
													<c:otherwise>
													<label>Home</label>&nbsp;<input type="radio" name="ctype2" value="Work"/>&nbsp;<label>Other</label>&nbsp;<input type="radio" name="ctype2" value="Other"/>
													</c:otherwise>
											    </c:choose>
    											</div> 
										</div>
											
										<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label">Alternative Contact No 2</label>
												<div class="col-sm-4 col-md-4">
													<input id="phne_no3" type="text"  minlength="12" maxlength="12" title="Enter Contact Number" 
													 autocomplete="off" placeholder="Alternative Contact number 2" name="phne_no3" class="form-control" value="${editbasic.contactno3}"> <!-- data-masked-input="999-999-9999"  -->
												 <Span id="phonespan3" style="color:red;"></Span>
												</div>
												<div class="col-sm-4 col-md-4" style="padding-right:40px;">
												 <c:choose>
											       <c:when test="${editbasic.contactnotype3=='Work'}">
												    <label>Home</label>&nbsp;<input type="radio" name="ctype3" value="Work" checked/>&nbsp;<label>Other</label>&nbsp;<input type="radio" name="ctype3" value="Other"/>
													</c:when>
													<c:when test="${editbasic.contactnotype3=='Other'}">
												    <label>Home</label>&nbsp;<input type="radio" name="ctype3" value="Work"/>&nbsp;<label>Other</label>&nbsp;<input type="radio" name="ctype3" value="Other" checked/>
													</c:when>
													<c:otherwise>
													<label>Home</label>&nbsp;<input type="radio" name="ctype3" value="Work"/>&nbsp;<label>Other</label>&nbsp;<input type="radio" name="ctype3" value="Other"/>
													</c:otherwise>
     												</c:choose>
    											</div> 
										</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Birth</label>
											<div class="col-sm-4">
												<input type="text" id="dob" class="form-control text-left"   value="${editbasic.dob}" 
												 title="Enter date in MM/DD/YYYY format only" name="dob" placeholder="Date Of Birth" class="form-control"  required>
											</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label">
												<Span style="color:red;" id="mand" >*</Span>
												Date Of Joining</label>
											<div class="col-sm-4">
												<input type="text" id="joining_Date" class="form-control text-left" 
												  title="Enter date in MM/DD/YYYY format only"  value="${editbasic.doj}" 
												  name="joining_Date" placeholder="Date Of Joining"  class="form-control" required >
											</div>
											</div>
											
											<div class="form-group row">
												<%-- <input type="hidden" id="bgctype" name="bgctype" value="${editbasic.bgc_type}"> --%>
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>BGC Type</label>
											   <div class="col-sm-4">
											     <select name="bgcType" class="form-control text-left" id="bgcType"  >
											      <option value="">--Select BGC--</option>
											      <option value="PreOnboarding" ${'PreOnboarding' eq editbasic.bgc_type ? 'selected="selected"' : ''}>Pre Onboarding</option>
											  <option value="PostOnboarding" ${'PostOnboarding' eq editbasic.bgc_type ? 'selected="selected"' : ''}>Post Onboarding</option>
										               <%--  <c:choose>
											       <c:when test="${empty editbasic.bgc_type || editbasic.bgc_type==''}">
											         <option value="">--Select BGC--</option>
										             <option value="PreOnboarding">Pre Onboarding</option>
										             <option value="PostOnboarding">Post Onboarding</option>
											    </c:when>
											    <c:otherwise>
											      <option value="${editbasic.bgc_type}" selected>${editbasic.bgc_type}</option>
										             <option value="">--Select BGC--</option>
										             <option value="PreOnboarding">Pre Onboarding</option>
										             <option value="PostOnboarding">Post Onboarding</option>
											    </c:otherwise>
											    </c:choose> --%>
										         </select>
										      </div>
										    </div> 
										<%--    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label">
												<c:choose>
												<c:when test="${editbasic.bgc_type=='PreOnboarding'}">
												<Span style="color:red;">*</Span>
												</c:when>
												<c:when test="${editbasic.bgc_type=='PostOnboarding'}">
												<Span style="color:red;"></Span>
												</c:when>
											</c:choose>Date Of Joining</label>
											<div class="col-sm-4">
												<input type="text" id="joining_Date" class="form-control text-left" 
												  title="Enter date in MM/DD/YYYY format only"  value="${editbasic.doj}" 
												  name="joining_Date" placeholder="Date Of Joining"  class="form-control"  required>
											</div>
											</div> --%>
											
											<%-- <c:choose>
											<c:when test="${editbasic.bgc_type=='PreOnboarding' || editbasic.bgc_type=='PostOnboarding'}">
												 <div class="form-group row" id="prediv">
												<label for="inputPassword" class="col-sm-4 control-label">
												<Span style="color:red;" id="mand" >*</Span>
												Date Of Joining</label>
											<div class="col-sm-4">
												<input type="text" id="joining_Date" class="form-control text-left" 
												  title="Enter date in MM/DD/YYYY format only"  value="${editbasic.doj}" 
												  name="joining_Date" placeholder="Date Of Joining"  class="form-control" required >
											</div>
											</div>
											</c:when>
											<c:otherwise>
											 <div class="form-group row" id="dj"  style="display:none;">
												<label for="inputPassword" class="col-sm-4 control-label">
												<Span style="color:red;" id="mand">*</Span>
												Date Of Joining</label>
											<div class="col-sm-4">
												<input type="text" id="joining_Date" class="form-control text-left" 
												  title="Enter date in MM/DD/YYYY format only"  
												  name="joining_Date" placeholder="Date Of Joining"  class="form-control"  >
											</div>
											</div>
											</c:otherwise>
											</c:choose>  --%>
											
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Job Title</label>
												<div class="col-sm-4">
													<input id="designation" type="text"  value="${editbasic.designation}"  minlength="2" maxlength="100"
                                                      title="Enter only Characters and numbers" placeholder="Job Title" name="designation" class="form-control">
												</div>
											</div>
											
											 <%-- <div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Timesheet Type</label>
											   <div class="col-sm-4">
											   
											   <select name="payrolltype" class="form-control text-left" id="payrolltype">
										             <option value="">--Select Timesheet Type--</option>
										             <option value="Weekly" ${'Weekly' eq editbasic.payroll_type ? 'selected="selected"' : ''}>Weekly</option>
										              <option value="Bi-Weekly1" ${'Bi-Weekly1' eq editbasic.payroll_type ? 'selected="selected"' : ''}>Bi-Weekly1</option>
										             <option value="Bi-Weekly2" ${'Bi-Weekly2' eq editbasic.payroll_type ? 'selected="selected"' : ''}>Bi-Weekly2</option>
										             <option value="Semi-Monthly" ${'Semi-Monthly' eq editbasic.payroll_type ? 'selected="selected"' : ''}>Semi-Monthly</option>
										             <option value="Monthly" ${'Monthly' eq editbasic.payroll_type ? 'selected="selected"' : ''}>Monthly</option>
										         </select>
										         
											   <c:choose>
											       <c:when test="${editbasic.payroll_type=='weekly'}">
							   					   <label>Weekly</label>&nbsp;<input type="radio" name="payrolltype" value="weekly" id="weekly"  checked/>&nbsp;<label>Semi-monthly</label>&nbsp;<input type="radio" name="payrolltype" value="semimonthly" id="semimonthly" />
													</c:when>
											       <c:when test="${editbasic.payroll_type=='semimonthly'}">
												    <label>Weekly</label>&nbsp;<input type="radio" name="payrolltype" value="weekly" id="weekly" />&nbsp;<label>Semi-monthly</label>&nbsp;<input type="radio" name="payrolltype" value="semimonthly" id="semimonthly" checked/>
													</c:when>
													<c:otherwise>
													<label>Weekly</label>&nbsp;<input type="radio" name="payrolltype" value="weekly" id="weekly"/>&nbsp;<label>Semi-monthly</label>&nbsp;<input type="radio" name="payrolltype" value="semimonthly" id="semimonthly"/>
													</c:otherwise>
											    </c:choose>
													 <br>
												</div>
										    </div> --%>
										    
										    <input type="hidden"  name="validateby"  id="validateby">
										    <div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Validation Required By</label>
											   <div class="col-sm-4">
											   
											   <c:choose>
											       <c:when test="${editbasic.validateby_flag eq 3}">
							   					  <label>Manager</label>&nbsp;<input type="checkbox" id="mgrvalidate" name="validation" value="Manager" checked disabled/>&nbsp;<label>HR</label>&nbsp;<input type="checkbox" name="validation" id="hrvalidate" value="HR" checked/>&nbsp;<label>Audit</label>&nbsp;<input type="checkbox"  name="validation" id="auditvalidate" value="Audit" checked />
													</c:when>
											       <c:when test="${editbasic.validateby_flag eq 2}">
												   <label>Manager</label>&nbsp;<input type="checkbox" id="mgrvalidate" name="validation" value="Manager" checked disabled/>&nbsp;<label>HR</label>&nbsp;<input type="checkbox" name="validation" id="hrvalidate" value="HR" checked/>&nbsp;<label>Audit</label>&nbsp;<input type="checkbox"  name="validation" id="auditvalidate" value="Audit"  />
													</c:when>
													  <c:when test="${editbasic.validateby_flag eq 1}">
												   <label>Manager</label>&nbsp;<input type="checkbox" id="mgrvalidate" name="validation" value="Manager" checked disabled/>&nbsp;<label>HR</label>&nbsp;<input type="checkbox" name="validation" id="hrvalidate" value="HR" />&nbsp;<label>Audit</label>&nbsp;<input type="checkbox"  name="validation" id="auditvalidate" value="Audit" />
													</c:when>
													<c:otherwise>
													<label>Manager</label>&nbsp;<input type="checkbox" id="mgrvalidate" name="validation" value="Manager" checked required/>&nbsp;<label>HR</label>&nbsp;<input type="checkbox" name="validation" id="hrvalidate" value="HR"/>&nbsp;<label>Audit</label>&nbsp;<input type="checkbox"  name="validation" id="auditvalidate" value="Audit" />
													</c:otherwise>
											    </c:choose>
											    
											    
											   		
													 <br>
												</div>
										    </div>
										    
										<div class="text-center ml-4" id="basic">										
												<button type="button" id="btnUpdate" class="btn btn-default" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" onclick="btnClick()">Update</button>
												<input type="button" onclick="goBack()" value="Back" class="btn btn-default btn-sm" style="padding:7px;background-color:grey;color:white;line-height:0.728571;">
												<!-- <button type="submit" id="submit" class="btn btn-default" style="padding:7px;">Update</button> -->
											<%-- 	 <%if(emp_type.equalsIgnoreCase("W2AdministrationEmployees")&&dept_id==5&&emprole==2){ %>
												<a href="USOBT_BasicDetails?action=empsearch&username=${s_username}&fullname=${s_fullname}&emp_type=${s_emptype}&ssnno=${s_ssnno}&pendingdocs=${s_pendingdocs}&sEmp_type=${s_type}" class="btn btn-default" style="padding:7px;text-transform:INITIAL;line-height:0.728571;">Back</a>	
												 <%} else if(emp_type.equalsIgnoreCase("Internal")&&dept_id==12&&emprole==4){ %>
												<a href="USOBT_BasicDetails?action=empsearch&username=${s_username}&fullname=${s_fullname}&emp_type=${s_emptype}&ssnno=${s_ssnno}&pendingdocs=${s_pendingdocs}&sEmp_type=${s_type}" class="btn btn-default" style="padding:7px;text-transform:INITIAL;line-height:0.728571;">Back</a>													
												<%} %>		 --%>									
											</div>
										</form>		
									</fieldset>
								</div>
							</div>
						</div>
					</div>
			   </div>
		   </div>
		   
		   <form action="searchlist" method="post" id="bformid" style="display:none">
				<input type="text"  name="semp_type"  value="${semp_type}">
				<input type="text" name="susername"  value="${susername}">
  	        	<input type="text"  name="sfullname"  value="${sfullname}">
			    <input type="text"  name="spendingdocs"  value="${spendingdocs}">
			    <input type="text" name="s_subtype"  value="${s_subtype}">
			   <input type="hidden" name="empstatus" value="${sempstatus}">
		  </form> 
		   
	   </div>
   </div>
</div>			
    <!-- Javascripts-->
  <script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script src="resources/preDefined/goback.js"></script>
	<script language="JavaScript" type="text/javascript">
	
	var p1=$('#phne_no1').val();
	var p2=$('#phne_no21').val();
	var p3=$('#phne_no31').val();
	var e1=$('#email_id1').val();
	
	document.getElementById('btnUpdate').disabled=true;
	var emptype=$("#emptype").val(); 
	var role=$("#role").val();
	var dept=$("#dept").val();
	
	var bgcType1=$("#bgcType1").val(); 
if(bgcType1=="PreOnboarding") {
	$("#mand").show();
}else if(bgcType1=="PostOnboarding") {
	$("#mand").hide();
}
    $('#firstName').on('keyup', function() {
           if($('#firstName').val()==$('#firstName1').val())
                  {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}   });
    $('#middleName').on('keyup', function() {
                  if($('#middleName').val()==$('#middleName1').val())
                         {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} });
    $('#familyName').on('keyup', function() {
                  if($('#familyName').val()==$('#familyName1').val())
                         {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
    $('#ssn_emp').on('keyup', function() {
                  if($('#ssn_emp').val()==$('#ssn_emp1').val())
                         {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
    $('#rec_name').on('keyup', function() {
           if($('#rec_name').val()==$('#rec_name1').val())
                  {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
    $('#email_id').on('keyup', function() {
           if($('#email_id').val()==$('#email_id1').val())
                  {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
    $('#phne_no').on('keyup', function() {
           if($('#phne_no').val()==$('#phne_no1').val())
                  {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
    
    $('#phne_no2').on('keyup', function() {
    	if($('#phne_no2').val()==$('#phne_no21').val())
    		{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
    
    $('#phne_no3').on('keyup', function() {
    	if($('#phne_no3').val()==$('#phne_no31').val())
    		{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
    
    $("input[name='ctype2']").on('click', function() {
        if($("input[name='ctype2']:checked").val()==$('#ctype21').val())
    	{
        	 document.getElementById('btnUpdate').disabled=true;
    	}else if($("input[name='ctype2']:checked").val()!=$('#ctype21').val()){
    		document.getElementById('btnUpdate').disabled=false;
    	}else if($("input[name='ctype2']:checked").val()!=$('#ctype21').val()){
    		document.getElementById('btnUpdate').disabled=false;
    		}
      });
    
    $("input[name='ctype3']").on('click', function() {
        if($("input[name='ctype3']:checked").val()==$('#ctype31').val())
    	{
        	 document.getElementById('btnUpdate').disabled=true;
    	}else if($("input[name='ctype3']:checked").val()!=$('#ctype31').val()){
    		document.getElementById('btnUpdate').disabled=false;
    	}else if($("input[name='ctype3']:checked").val()!=$('#ctype31').val()){
    		document.getElementById('btnUpdate').disabled=false;
    		}
      });

    /* $("input[name='payrolltype']").on('click', function() {
        if($("input[name='payrolltype']:checked").val()==$('#pr_type').val())
    	{
        	 document.getElementById('btnUpdate').disabled=true;
    	}else if($("input[name='payrolltype']:checked").val()!=$('#pr_type').val()){
    		document.getElementById('btnUpdate').disabled=false;
    		}
    	 }); */
    
  /*   $('#payrolltype').on('change', function() {
		if ($('#payrolltype').val() == $('#pr_type').val()) {
			document.getElementById('btnUpdate').disabled = true;
		} else {
			document.getElementById('btnUpdate').disabled = false;
		}
	}); */

        $("input[name='validation']").on('click', function() {
            if($("input[name='validation']:checked").val()==$('#val_by').val())
        	{
            	 document.getElementById('btnUpdate').disabled=true;
        	}else if($("input[name='validation']:checked").val()!=$('#val_by').val()){
        		document.getElementById('btnUpdate').disabled=false;
        		}
        	 });
   	 
    $('#dob').on('change', function() {
           if($('#dob').val()==$('#dob1').val())
                  {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });    
    /* $('#passport_no').on('keyup', function() {
           if($('#passport_no').val()==$('#passport_no1').val())
                  {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  }); */

    $('#designation').on('keyup', function() {
                  if($('#designation').val()==$('#designation1').val())
                  {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
    $('#emp_type').on('change', function() {
                  if($('#emp_type').val()==$('#emp_type1').val())
                  {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
    
    $('#cont_team_name').on('change', function() {
                  if($('#cont_team_name').val()==$('#cont_team_name1').val())
                  {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} });
    $('#work_auth').on('change', function() {
        if($('#work_auth').val()==$('#work_auth1').val())
        {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} });
    $('#joining_Date').on('change', function() {
                  if($('#joining_Date').val()==$('#joining_Date1').val())
                  {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} });
   /*  $('#pas_exp_Date').on('change', function() {
                  if($('#pas_exp_Date').val()==$('#pas_exp_Date1').val())
                  {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} }); */
    $('#bgcType').on('change', function() {
           if($('#bgcType').val()==$('#bgcType1').val())
           {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} });
           $("input[name='c2cType']").on('click', function() {
        	    if($("input[name='c2cType']:checked").val()==$('#c2cType1').val())
        		{
        	    	 document.getElementById('btnUpdate').disabled=true;
        		}else if($("input[name='c2cType']:checked").val()!=$('#c2cType1').val()){
        			document.getElementById('btnUpdate').disabled=false;
        			}
        		 });
/* 	$(document).ready(function(){
		var ctNameId=$("#ctNameId").val();
	    var cont_team_name=$("select[name='cont_team_name']");
	    cont_team_name.find('option[value='+ctNameId+']').attr('selected', true);
		}); */
	</script>
	<script>
	var date = new Date();
	date.setDate(date.getDate());
    $("#dob").datepicker({
		changeMonth:true,
		changeYear:true,
		minDate: "-70Y",
		endDate: date,
		yearRange: "1950:2000"
    }).on('changeDate', function(selected) {
			 /* var minDate = new Date(selected.date.valueOf());
		     $('#joining_Date').datepicker('setStartDate', minDate); */
		     $('#formid').formValidation('revalidateField', 'dob');
    });
    $("#dob").on('change', function(){
 	   var dob1=$('#dob').val();
 	   if(dob1!=""){
 	     var minDate=new Date(dob1);
 	     $('#joining_Date').datepicker('setStartDate', minDate);
 	   }
    });
    $("#joining_Date").datepicker({
		changeMonth:true,
		changeYear:true,
	})
    .on('changeDate', function(e) {
        $('#formid').formValidation('revalidateField', 'joining_Date');
    });  
</script>
<script type="text/javascript">
function goBack() {
	getsesVal().done(function(data){
		  if(data!=""){
	document.getElementById("bformid").submit();
		  }else{
				 window.location.href="loginpage";
			}
		});
	}
	
function btnClick(){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#formid').formValidation('validate');
	if( !$('#formid').data('formValidation').isValid())
		 {
		/* document.getElementById("submit").disabled=true; */
		//    alert("Not Valid");
		 }
	else{
		var phne1=$('#phonespan').text();
		var phne2=$('#phonespan2').text();
		var phne3=$('#phonespan3').text();
		var emailspan=$('#emailspan').text();
		if(phne1!="" || phne2!="" || phne3!="" || emailspan!=""){
			
		}else{

		 var mgrvalidate=$('#mgrvalidate').is(":checked");
		 var hrvalidate=$ ('#hrvalidate').is(":checked");
		var auditvalidate=$('#auditvalidate').is(":checked");

			if(mgrvalidate==true && hrvalidate==true && auditvalidate==true){
				$('#validateby').val(3);
				}else if(mgrvalidate==true && hrvalidate==true){
					$('#validateby').val(2);
					}else{
						$('#validateby').val(1);
						}
		//document.getElementById("formid").submit();
		 	$("#btnUpdate").attr("disabled", true);
		   var emp_type1=$('#emp_type1').val();
		   var form = $('#formid')[0];
		   var data = new FormData(form);
		$.ajax({
			url : "updateConsultantsBasicInfo", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(response) {
				 if(response!=null || response!=""){
					     var message=response.message;
			   	         var candidate_id=response.candidateId;
			   	         alert(message);
					     window.location.href="viewConsultantInfo?candidate_id="+candidate_id+"&empType="+emp_type1+"";
	   	   	         }
	   	   	      else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			     }
		   });
	}
	  }
		  }else{
				 window.location.href="loginpage";
			}
		});
}

</script>
<script>
$('#formid').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {	       
    	ssn_emp: {
            validators: {
            	notEmpty: {
                    message: 'SSN number is mandatory'
                }
            }
        },
        firstName: {
            validators: {
            	notEmpty: {
                    message: 'First Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 40,
                    message: 'First Name must be more than 2 and less than 40 characters long'
                },
                regexp: {
                   regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                    message: 'First Name accepts alphabets and Space allowed but is not at beginning or end of the word'
                }
            }
        },
        middleName: {
            validators: {
                stringLength: {
                    min: 1,
                    max: 40,
                    message: 'Middle Name must be more than 1 and less than 40 characters long'
                },
                regexp: {
                	regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                    message: 'Middle Name accepts alphabets and Space allowed but is not at beginning or end of the word'
                }
            }
        },
        familyName: {
            validators: {
            	notEmpty: {
                    message: 'Last Name is mandatory'
                },
                stringLength: {
                    min: 1,
                    max: 40,
                    message: 'Last Name must be more than 1 and less than 40 characters long'
                },
                regexp: {
                	regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                    message: 'Last Name accepts alphabets and Space allowed but is not at beginning or end of the word'
                }
            }
        },
        rec_name:{
            validators: {
            stringLength: {
            min: 2,
            max: 100,
            message: 'Recruiter Name must be more than 2 and less than 100 characters long'
           },
             regexp: {
            	 regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
            message: 'Recruiter Name accepts alphabets and Space allowed but is not at beginning or end of the word'
               }
           }
       },
       cont_team_name:{
            validators: {
            	isEmpty: {
                    message: 'Contract Team Name is mandatory'
                },
            stringLength: {
            min: 2,
            max: 20,
            message: 'Contract Team Name must be more than 2 and less than 20 characters long'
           },
             regexp: {
        	regexp: /^([A-Za-z]+\s|\s)+[A-Za-z]+$|^[A-Za-z]+$/,
            message: 'Contract Team Name accepts alphabets and Space allowed but is not at beginning or end of the word'
             }
          }
     },      
   email_id:{
            validators: {
            	notEmpty: {
                    message: 'e-mail ID is mandatory'
            	 },
                 stringLength: {
                 min: 8,
                 max: 80,
                 message: 'e-mail ID must be more than 8 and less than 80 characters long'
                },
                  regexp: {
             	regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
                 message: 'Please enter valid e-mail ID'
             }
           }
      },
   phne_no:{
            validators: {
            	notEmpty: {
                    message: 'Contact Number is mandatory'
            	 },
                 stringLength: {
                 min: 12,
                 max: 12,
                 message: 'Contact Number must be more 10 or Not less than 10 Numbers long'
                },
                regexp: {
                	regexp: /^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$/,
                    message: 'Please enter valid Contact Number'
             }, 
            }
        },
        dob: {
            validators: {
                notEmpty: {
                    message: 'Date of Birth is mandatory'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter DOB in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY', 
                    message: 'DOB is not a valid'
                }
            }
        },
   bgcType:{
            validators: {
            	notEmpty: {
                    message: 'Please select BGC Type'
                }
            }
        },
  work_auth:{
            validators: {
            	notEmpty: {
                    message: 'Please select work authorization type'
                }
            }
        },
   joining_Date:{
            validators: {
            	notEmpty: {
                    message: 'Joining Date is mandatory'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter Joining Date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY', 
                    message: 'Joining Date is not a valid'
                }
            }
        },
       /*  payrolltype:{
            validators: {
            	notEmpty: {
                    message: 'Please Choose  timesheet type'
                }
            }
        }, */
        validateby:{
            validators: {
            	notEmpty: {
                    message: 'Please check  validate by'
                }
            }
        },
   designation:{
            validators: {
            	isEmpty: {
                    message: 'Title is mandatory'
            	 },
                 stringLength: {
                 min: 2,
                 max: 100,
                 message: 'Title must be more than 2 and less than 100 characters long'
                },
                  regexp: {
                	  regexp: /^(?!\d\s+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &():\/\\-]*)?$/,
                      message: 'Title accepts alphanumerical, special characters like &-()/: allowed and Space allowed but is not at beginning or end of the word'
                  }
               }
           },
           phne_no2 : {
           	enabled: false,
               validators: {
               	notEmpty: {
                       message: 'Contact number is mandatory'
                   },
                   stringLength: {
                       min: 12,
                       max: 12,
                       message: 'Contact Number should be 10 numbers'
                   },
                   regexp: {
                      regexp: /^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$/,
                      message: 'Please enter valid Contact Number'
                   },
                   
               }
           
           },
           phne_no3 : {
           	enabled: false,
               validators: {
               	notEmpty: {
                       message: 'Contact number is mandatory'
                   },
                   stringLength: {
                       min: 12,
                       max: 12,
                       message: 'Contact Number should be 10 numbers'
                   },
                   regexp: {
                      regexp: /^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$/,
                      message: 'Please enter valid Contact Number'
                   },
                   
               }
           
           },
           ctype2:{
           	enabled: false,
               validators: {
               	notEmpty: {
                       message: 'Please Choose  Contact type'
                   }
               }
           },
           ctype3:{
           	enabled: false,
               validators: {
               	notEmpty: { 
                       message: 'Please Choose  Contact type'
                   }
               }
           }
     }
})
 .on('change', '[name="phne_no2"]', function(e) {
    var phne_no2 =$("#phne_no2").val();
    if(phne_no2!=""){
		   $('#formid').bootstrapValidator('enableFieldValidators','ctype2',true);
		   $('#formid').bootstrapValidator('enableFieldValidators','phne_no2',true);
     } else {
		   $('#formid').bootstrapValidator('enableFieldValidators','ctype2',false);
		   $('#formid').bootstrapValidator('enableFieldValidators','phne_no2',false);
      } 
   })
   /* .on('change', '[name="email_id"]', function(e) {
   var email_id =$("#email_id").val();
   $.ajax({
   	type : "GET",
       asyn : false,
       contentType: "text/plain", // NOT dataType!
       url  : "checkEmail?email="+email_id+"",
       success  : function(response){
    	   if(response!=""){
    		   $('#emailspan').text("Email id already exists");
    		   $("#btnUpdate").attr("disabled", true);
    	   }else{
    		   $('#emailspan').text('');
    		   $("#btnUpdate").attr("disabled", false);  
    	   }
         }
	 });
		  //
    })
    .on('change', '[name="phne_no"]', function(e) {
   var phne_no =$("#phne_no").val();
   $.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "text/plain", // NOT dataType!
	        url  : "checkPhoneNo?phone="+phne_no+"",
	        success  : function(response){
	        	if(response!=""){
	     		   $('#phonespan').text("Contact number already exists");
	     		  $("#btnUpdate").attr("disabled", true);
	     	   }else{
	     		  $('#phonespan').text('');
	     		 $("#btnUpdate").attr("disabled", false);  
	     	   }
	          }
		 });
		  // $('#formid').bootstrapValidator('enableFieldValidators','w2admin_details',true);
    }) */
  .on('change', '[name="phne_no3"]', function(e) {
    var phne_no3 =$("#phne_no3").val();
    if(phne_no3!=""){
		   $('#formid').bootstrapValidator('enableFieldValidators','ctype3',true);
		   $('#formid').bootstrapValidator('enableFieldValidators','phne_no3',true);
     }else{
		   $('#formid').bootstrapValidator('enableFieldValidators','ctype3',false);
		   $('#formid').bootstrapValidator('enableFieldValidators','phne_no3',false);
      } 
   })
 .on('click', '[name="ctype3"]', function(e) {
	 	var ctype3=$("input[name='ctype3']:checked").val();
	if (ctype3!=""){
		   $('#formid').bootstrapValidator('enableFieldValidators','phne_no3',true);
	   }else{
		   $('#formid').bootstrapValidator('enableFieldValidators','phne_no3',false);
	   }
  })
   .on('click', '[name="ctype2"]', function(e) {
	   var ctype2=$("input[name='ctype2']:checked").val();
	   if (ctype2!=""){
		   $('#formid').bootstrapValidator('enableFieldValidators','phne_no2',true);
	   }else{
		   $('#formid').bootstrapValidator('enableFieldValidators','phne_no2',false);
	   }
  })
/* .on('change', '[name="bgcType"]', function(e) {
	   if ($(this).val()=='PreOnboarding') {
		   $('#formid').formValidation('enableFieldValidators','joining_Date',true);
       } else if($(this).val()=='PostOnboarding'){
    	   $('#formid').formValidation('enableFieldValidators', 'joining_Date',false);
       } 
     }) */;
 
/* var bgct=$('#bgctype').val();
//alert(bgct);
if(bgct=='PostOnboarding'){
	 $('#formid').formValidation('enableFieldValidators', 'joining_Date',false);
}else{
	  $('#formid').formValidation('enableFieldValidators','joining_Date',true);
} */
</script>  
<script type="text/javascript">
	$(function () {
			  $("#bgcType").change(function () {
				  if ($(this).val() == "PreOnboarding") {
					 // $("#dj").show();
					  $("#mand").show();
					   document.getElementById('joining_Date').required=true;  
		            } else{
		            	// $("#dj").show();
		            	 $("#mand").hide();
		            	document.getElementById('joining_Date').required=false;
		            }
		        });
		    });
</script> 
<script type="text/javascript">
$('input[name="ssn_emp"]').mask('999-99-9999');
$('input[name="phne_no"]').mask('999-999-9999');
$('input[name="phne_no2"]').mask('999-999-9999');
$('input[name="phne_no3"]').mask('999-999-9999');
$("#ssn_emp").blur(function () {
    $('#formid').bootstrapValidator('revalidateField', 'ssn_emp');
});
$("#phne_no").blur(function () {
    $('#formid').bootstrapValidator('revalidateField', 'phne_no');
});
$("#phne_no2").blur(function () {
    $('#formid').bootstrapValidator('revalidateField', 'phne_no2');
});
$("#phne_no3").blur(function () {
    $('#formid').bootstrapValidator('revalidateField', 'phne_no3');
});
$("#email_id").blur(function () {
    $('#formid').bootstrapValidator('revalidateField', 'email_id');
});
var textInput = document.getElementById('ssn_emp');
var timeout = null;
textInput.onkeyup = function (e) {
clearTimeout(timeout);
timeout = setTimeout(function () {
	getsesVal().done(function(data){
		  if(data!=""){
    var ssn_emp=$('#ssn_emp').val();
    if(ssn_emp==""){
    	 $('#ssnshow').text('');
    	 $("#btnUpdate").attr("disabled", false);
    }else{
    	var regex = new RegExp("^(?!\\b(\\d)\\1+-(\\d)\\1+-(\\d)\\1+\\b)(?!123-45-6789|219-09-9999|078-05-1120)(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$");
	    if(!regex.test(ssn_emp)){
	    	   $('#ssnshow').html("<font color=red>SSN is Not Valid</font>");
	    	   $("#btnUpdate").attr("disabled", true);
	    }else{
    	 $.ajax({
 	    	type : "GET",
 	        asyn : false,
 	        contentType: "text/plain", // NOT dataType!
 	       url  : "ssncheck?ssn_emp="+ssn_emp+"",
 	        //data: JSON.stringify(data),
 	        success  : function(response){
 	        	$('#un').val(response.userName);
        		$('#canid').val(response.candidate_id);
        		
        		if(response!=""){
        			$.ajax({
   		   	 	    	type : "GET",
   		   	 	        asyn : false,
   		   	 	        contentType: "application/json", // NOT dataType!
   		   	 	        url  : "getempTypeByCanId?canid="+response.candidate_id+"",
   		   	 	        success  : function(resEtype){
        			if(dept==1&&emptype=="Admin"&&role==4){
 	        			$('#ssnshow').html("Found a record with this SSN"+'<a href="#" onclick="getEmployee()"><font color="blue">ClickHere</font></a>');
 		        		 $("#btnUpdate").attr("disabled", true);
 		                 $("input[type=submit]").css("background-color", "grey");
 	                 } 
        			else if(dept==5 && emptype=="W2 Admin" && role==2){ 
             			if(resEtype=="C2C" || resEtype=="1099" || resEtype=="W2"){
             			 $('#ssnshow').html("Found a record with this SSN"+'<a href="#" onclick="getEmployee()"><font color="blue">ClickHere</font></a>');
        	        		 $("#btnUpdate").attr("disabled", true);
        	                 $("input[type=submit]").css("background-color", "grey");
             			}
             			 else if(resEtype=="W2 Admin"){
                 			 $('#ssnshow').html("SSN Already Exist. But contracts team doesn't have access to view W2 Administraion Employee records");
            	        		 $("#btnUpdate").attr("disabled", true);
            	                 $("input[type=submit]").css("background-color", "grey");
                 			} 
             			else
             			{
         	        		$('#ssnshow').html("<font color=#009900>Valid SSN number</font>");	
         	                $("#btnUpdate").attr("disabled", false);
         	        		$("#reset").attr("disabled", false);
             			}
  	   	          } 
  	   	        	}   });//emptype response ends here
  	   	        	
  	   	        	}
 	        	else{
 	        		$('#ssnshow').html("<font color=#009900>Valid SSN number</font>");	 	        	
 	                document.getElementById("btnUpdate").disabled=false;
 	        	   }
 	          }
 		 });
	  }
  }
		  }else{
				 window.location.href="loginpage";
			}
		});
}, 500);
};

var emailInput = document.getElementById('email_id');
var emailtimeout = null;
emailInput.onkeyup = function (e) {
clearTimeout(emailtimeout);
emailtimeout = setTimeout(function () {
	getsesVal().done(function(data){
		  if(data!=""){
	 var email_id=$('#email_id').val();
	    if(email_id==""){
	    	 $('#emailspan').text('');
	    	 $("#btnUpdate").attr("disabled", false);
	    }else{
	    	var regex = new RegExp("^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$");
	    if(!regex.test(email_id)){
	    	  // $('#emailspan').text("Please enter valid number");
	    	   $("#btnUpdate").attr("disabled", true);
	    }else{
	    	 $.ajax({
	    		   	type : "GET",
	    		       asyn : false,
	    		       contentType: "text/plain", // NOT dataType!
	    		       url  : "checkEmail?email="+email_id+"",
	    		       success  : function(response){
	    		    	   if(e1==email_id){
	    		    		   $('#emailspan').text('');
	    		    		   $("#btnUpdate").attr("disabled", false);  
	    		    	   }
	    		    	   else if(response==email_id){
	    		    		   $('#emailspan').text("Email id already exists");
	    		    		   $("#btnUpdate").attr("disabled", true);
	    		    	   }else{
	    		    		   //$('#emailspan').text("Email id not available");
	    		    		   $('#emailspan').text('');
	    		    		   $("#btnUpdate").attr("disabled", false);  
	    		    	   }
	    		         }
	    			 });
	      }
	  }
		  }else{
				 window.location.href="loginpage";
			}
		});
}, 500);

};



var phoneInput = document.getElementById('phne_no');
var phonetwoInput = document.getElementById('phne_no2');
var phonethreeInput = document.getElementById('phne_no3');

var phonetimeout = null;
phoneInput.onkeyup = function (e) {
clearTimeout(phonetimeout);
phonetimeout = setTimeout(function () {
	getsesVal().done(function(data){
		  if(data!=""){ 
	var phne_no=$('#phne_no').val();
	    if(phne_no==""){
	    	 $('#phonespan').text('');
	    	 $("#btnUpdate").attr("disabled", false);
	    }else{
	    	var regex = new RegExp("^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$");
	    if(!regex.test(phne_no)){
	    	  // $('#emailspan').text("Please enter valid number");
	    	   $("#btnUpdate").attr("disabled", true);
	    }else{
	    	$.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "text/plain", // NOT dataType!
		        url  : "checkPhoneNo?phone="+phne_no+"",
		        success  : function(response){
		        	if(p1==phne_no || p2==phne_no || p3==phne_no){
		        		$('#phonespan').text('');
			     		 $("#btnUpdate").attr("disabled", false); 
		        	}
		        	else if(response.contactno1==phne_no || response.contactno2==phne_no || response.contactno3==phne_no){
		     		   $('#phonespan').text("Contact number already exists");
		     		  $("#btnUpdate").attr("disabled", true);
		     	   }else{
		     		  $('#phonespan').text('');
		     		 $("#btnUpdate").attr("disabled", false);  
		     	   }
		          }
			 });
	      }
	  }
		  }else{
				 window.location.href="loginpage";
			}
		});
}, 500);

};

var phonetwotimeout = null;
phonetwoInput.onkeyup = function (e) {
clearTimeout(phonetwotimeout);
phonetwotimeout = setTimeout(function () {
	getsesVal().done(function(data){
		  if(data!=""){
	var phne_no=$('#phne_no2').val();
	    if(phne_no==""){
	    	 $('#phonespan2').text('');
	    	 $("#btnUpdate").attr("disabled", false);
	    }else{
	    	var regex = new RegExp("^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$");
	    if(!regex.test(phne_no)){
	    	  // $('#emailspan').text("Please enter valid number");
	    	   $("#btnUpdate").attr("disabled", true);
	    }else{
	    	$.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "text/plain", // NOT dataType!
		        url  : "checkPhoneNo?phone="+phne_no+"",
		        success  : function(response){
		        	if(p1==phne_no || p2==phne_no || p3==phne_no){
		        		$('#phonespan2').text('');
			     		 $("#btnUpdate").attr("disabled", false); 
		        	}
		        	
		        	else if(response.contactno1==phne_no || response.contactno2==phne_no || response.contactno3==phne_no){
		     		   $('#phonespan2').text("Contact number already exists");
		     		  $("#btnUpdate").attr("disabled", true);
		     	   }else{
		     		  $('#phonespan2').text('');
		     		 $("#btnUpdate").attr("disabled", false);  
		     	   }
		          }
			 });
	      }
	  }
		  }else{
				 window.location.href="loginpage";
			}
		});
}, 500);

};

var phonethreetimeout = null;
phonethreeInput.onkeyup = function (e) {
clearTimeout(phonethreetimeout);
phonethreetimeout = setTimeout(function () {
	getsesVal().done(function(data){
		  if(data!=""){
	var phne_no=$('#phne_no3').val();
	    if(phne_no==""){
	    	 $('#phonespan3').text('');
	    	 $("#btnUpdate").attr("disabled", false);
	    }else{
	    	var regex = new RegExp("^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$");
	    if(!regex.test(phne_no)){
	    	  // $('#emailspan').text("Please enter valid number");
	    	   $("#btnUpdate").attr("disabled", true);
	    }else{
	    	$.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "text/plain", // NOT dataType!
		        url  : "checkPhoneNo?phone="+phne_no+"",
		        success  : function(response){
		        	if(p1==phne_no || p2==phne_no || p3==phne_no){
		        		$('#phonespan3').text('');
			     		 $("#btnUpdate").attr("disabled", false); 
		        	}
		        	else if(response.contactno1==phne_no || response.contactno2==phne_no || response.contactno3==phne_no){
		     		   $('#phonespan3').text("Contact number already exists");
		     		  $("#btnUpdate").attr("disabled", true);
		     	   }else{
		     		  $('#phonespan3').text('');
		     		 $("#btnUpdate").attr("disabled", false);  
		     	   }
		          }
			 });
	      }
	  }
		  }else{
				 window.location.href="loginpage";
			}
		});
}, 500);

};
</script> 
  </body>
</html>
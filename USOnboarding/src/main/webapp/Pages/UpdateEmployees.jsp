<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
							<h5 class="card-header">US Onboarding- Update Employees</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-md-8 col-sm-12">
									<input type="hidden" name="emptype" id="emptype" value="${emptype}">
									<input type="hidden" name="role" id="role" value="${role}">
									<input type="hidden" name="dept" id="dept" value="${dept}">
										<fieldset>   
										<form action="/"  method="post" class="form-horizontal" id="formid">
										<!--  <legend><i class="fa fa-line-chart"></i>Raise NC</legend>  -->
										<input type="hidden" name="candidate_id" id="candidate_id" value="${autobasiclist.candidate_id}">
										
					    	        		
					    	        		<input type="hidden" id="ssn_no1"  value="${autobasiclist.ssn_no}">
											<input type="hidden" id="FirstName1"  value="${autobasiclist.first_name}">
					    	        		<input type="hidden" id="middleName1"   value="${autobasiclist.middlename}">
					    	        		<input type="hidden" id="familyName1" value="${autobasiclist.familyname}">
					    	        		<input type="hidden" id="employee_type1"   value="${autobasiclist.emp_type}">
					    	        		<input type="hidden" id="w2admin_details1"   value="${autobasiclist.dept_id}">
					    	        		<input type="hidden" id="w2admin_roles1"  value="${autobasiclist.role_id}">
					    	        		<input type="hidden" id="w2emp_rephead1"   value="${autobasiclist.mgr_empid}">
					    	        		<input type="hidden" id="rec_name1"  value="${autobasiclist.recname}">
					    	        		<input type="hidden" id="hr_name1"   value="${autobasiclist.hrname}">
					    	        		<input type="hidden" id="email_id1"  value="${autobasiclist.emailid}">
					    	        		<input type="hidden" id="phne_no1"  value="${autobasiclist.contactno1}">
					    	        		<input type="hidden" id="phne_no21"  value="${autobasiclist.contactno2}">
					    	        		<input type="hidden" id="phne_no31"  value="${autobasiclist.contactno3}">					    	        		
					    	        		<input type="hidden" id="ctype21"  value="${autobasiclist.contactnotype2}">
					    	        		<input type="hidden" id="ctype31"  value="${autobasiclist.contactnotype3}">
					    	        		<input type="hidden" id="pr_type"  value="${autobasiclist.payroll_type}">
					    	        		<input type="hidden" id="val_by"  value="${autobasiclist.validateby_flag}">
					    	        		
					    	        		
					    	        		<input type="hidden" id="dob1"  value="${autobasiclist.dob}">
					    	        		<input type="hidden" id="line11" value="${autobasiclist.line1}">
					    	        		<input type="hidden" id="line21"  value="${autobasiclist.line2}">
					    	        		<input type="hidden" id="zipcode1"   value="${autobasiclist.zipcode}">
					    	        		<input type="hidden" id="city1"   value="${autobasiclist.city}">
					    	        		<input type="hidden" id="joining_Date1"  value="${autobasiclist.doj}">
					    	        		<input type="hidden" id="ctc1"  value="${autobasiclist.salary}">
					    	        		<input type="hidden" id="designation1"  value="${autobasiclist.designation}">
					    	        		<input type="hidden" id="state1"  value="${autobasiclist.state}">
					    	        		<input type="hidden" id="ssn_emp1"  value="${autobasiclist.ssn_no}">
					    	        		<input type="hidden" id="billingType1" value="${autobasiclist.billing}">
					    	        		<input type="hidden" id="bgctype1" name="bgctype" value="${autobasiclist.bgc_type}">
					    	        		<input type="hidden" id="work_auth1" value="${autobasiclist.workAuth}">
					    	        		
					    	        		
					    	        		
    	        		
									<%-- <%if(dept_id==12&&emp_type.equalsIgnoreCase("Internal")&&emprole==4){ %> --%>
									<h4><b>Employee Details</b></h4>
									<div class="form-group row" >
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>SSN Number</label>
											<div class="col-sm-4">
												<input id="ssn_emp" type="text" minlength="10" maxlength="11"
												title="Enter Only 123-45-6789  format" 
												placeholder="Enter XXX-XX-XXXX formate" name="ssn_emp" class="form-control"  value="${autobasiclist.ssn_no}" required>
												<span id="ssnshow" style="color: red;"></span>
											</div>
										</div>
										
										<%-- <%}else if(dept_id==2&&emp_type.equalsIgnoreCase("W2AdministrationEmployees")&&emprole==2){ %> --%>
										<%-- <div class="form-group">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>SSN Number</label>
											<div class="col-sm-4">
												<input id="ssn_emp" type="text"	title="Enter Only 123-45-6789  format" 
												placeholder=" Enter XXX-XX-XXXX formate" name="ssn_emp" class="form-control"  value="${autobasiclist.ssn_no}" required>
												<span id="ssnshow" style="color: red;"></span><!-- pattern="^(\d{3}-?\d{2}-?\d{4}|XXX-XX-XXXX)$" -->
											</div>
										</div> --%>
										<%-- <%}%> --%>
										<div class="form-group row">
									<label for="inputPassword" class="col-sm-4 control-label"><Span
										style="color: red;"></Span>Employee ID</label>
									<div class="col-sm-4">
										<input id="emp_id" name="emp_id" type="text"
											pattern="[0-9]{6}" maxlength="6" title="Enter Only Digits"
											placeholder="Employee ID" autocomplete="off"  value="${autobasiclist.emp_number}" readonly	class="form-control" >
									</div>
								</div>
										<!-- <div class="form-group" style="display:none;" id="appenduser">
											<input type="hidden" name="autouname" id="autouname" value="">
										    </div> 
										    <div class="form-group" style="display:none;" id="empnumer">
											<input type="hidden" name="autoempnumer" id="autoempnumer" value="" >
										    </div> -->
										
										<div class="form-group row">
									<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>User Name</label>
									<div class="col-sm-4">
										<input id="username" type="text"  
										placeholder="User Name"  readonly
										 name="username" value="${autobasiclist.username}" class="form-control" >
									</div>
								</div>
										
									     <div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>First Name</label>
											<div class="col-sm-4">
												<input id="FirstName" type="text" title="only alphabets are allowed" 
												placeholder="First Name" name="FirstName" class="form-control"  
												minlength="2" maxlength="40" value="${autobasiclist.first_name}" required>
											</div>
										</div>
										
										<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span> Middle Name</label>
												<div class="col-sm-4">
													<input id="middleName" type="text"  pattern="^[a-zA-Z\s]+$"  minlength="1" maxlength="40"
													title="only alphabets are allowed" 
													placeholder="Middle Name" name="middleName" class="form-control" value="${autobasiclist.middlename}" >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Last Name</label>
												<div class="col-sm-4">
													<input id="familyName" type="text" title="only alphabets are allowed" required minlength="1" maxlength="40"
													placeholder="Last Name" name="familyName" value="${autobasiclist.familyname}" class="form-control">
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											 <div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Work Authorization</label>
											   <div class="col-sm-4">
											     <select name="work_auth" autoComplete="off" class="form-control text-left" 
											     id="work_auth"  onchange="mandatoryByWorkAuth()" required>
										             <option value="">--Select type--</option> 
											            <c:forEach var="wa" items="${waList}">
											             <option value="${wa.work_auth_name}" ${wa.work_auth_name == autobasiclist.workAuth ? 'selected="selected"' : ''}>${wa.work_auth_name}</option>
														</c:forEach> 
										         </select>
										      </div>
										    </div>	
									    <div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Employee Type</label>
											   <div class="col-sm-4">
											     <select name="employee_type" autoComplete="off" class="form-control text-left" 
											     id="employee_type" onchange="mandatoryByEmptype()" required>
										              <option value="${autobasiclist.emp_type}">${autobasiclist.emp_type}</option>
										             <option value="">--Select Employee Type--</option>
										             <option value="W2 Admin">W2 Admin</option>
										            <option value="W2">W2</option>
										         </select>
										      </div>
										    </div>
										    
										    
										    <div class="form-group row" id="dept">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;" id="dpt">*</Span>Department</label>
											   <div class="col-sm-4">
											     <select name="w2admin_details" autoComplete="off" class="form-control text-left" 
											      id="w2admin_details">
										            <%--   <option value="${autobasiclist.dept_id}">${autobasiclist.dept_name}</option> --%>
										                <option value="">--Select Department--</option>
										              	<c:choose>
											            <c:when test="${autobasiclist.dept_id==0}">
											            <c:forEach var="dept" items="${deptList}">
											             <option value="${dept.dept_id}">${dept.dept_name}</option>
														</c:forEach>
											            </c:when>
											            <c:otherwise>
											            <c:forEach var="dept" items="${deptList}">
											             <option value="${dept.dept_id}" ${dept.dept_id==autobasiclist.dept_id ? 'selected="selected"' : ''}>${dept.dept_name}</option>
														</c:forEach> 
											            </c:otherwise>
											            </c:choose>
										         </select>
										      </div>
										    </div> 
									
									<%-- <c:choose>
										<c:when test="${autobasiclist.emp_type=='W2AdministrationEmployees'}">  onchange="reportingHead()"onchange="getRole()"  --%>
											<div class="form-group row" id="rolediv">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;" id="rle" style="display:none">*</Span>Employee Role</label>
											   <div class="col-sm-4">
											     <select name="w2admin_roles" autoComplete="off" class="form-control text-left" id="w2admin_roles"  >
										            <%--  <option value="${autobasiclist.role_id}">${autobasiclist.rolename}</option> --%>
										             <option value="">--Select Roles--</option>
														<c:choose>
											            <c:when test="${autobasiclist.role_id==0}">
											            <c:forEach var="role" items="${roleList}">
											             <option value="${role.role_id}" >${role.role_name}</option>
														</c:forEach>
											            </c:when>
											            <c:otherwise>
											             <c:forEach var="role" items="${roleList}">
											             <option value="${role.role_id}" ${role.role_id == autobasiclist.role_id ? 'selected="selected"' : ''}>${role.role_name}</option>
														</c:forEach> 
											            </c:otherwise>
											            </c:choose>
										         </select>
										      </div>
										    </div>
										    
										    <div class="form-group row" id="rephead">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;" id="rhd" style="display:none">*</Span>Reporting Head</label>
											   <div class="col-sm-4">
											     <select name="w2emp_rephead" autoComplete="off" class="form-control text-left" id="w2emp_rephead" >
											     <%--  <option value="${autobasiclist.mgr_empid}">${autobasiclist.tekskills_manager}</option> empName--%>
											     		<option value="">--Select Reporting Head--</option>
											     		<c:forEach var="rep" items="${repMagrList}">
											             <option value="${rep.mgrEmpNo}" ${rep.mgrEmpNo == autobasiclist.mgr_empid ? 'selected="selected"' : ''}>${rep.mgrEmpName}</option>
														</c:forEach> 
											            <%-- <c:choose>
											            <c:when test="${autobasiclist.mgr_empid==0}">
											            <c:forEach var="rep" items="${repMagrList}">
											             <option value="${rep.mgrEmpNo}">${rep.mgrEmpName}</option>
														</c:forEach>
											            </c:when>
											            <c:otherwise>
											             <c:forEach var="rep" items="${repMagrList}">
											             <option value="${rep.mgrEmpNo}" ${rep.mgrEmpNo == autobasiclist.mgr_empid ? 'selected="selected"' : ''}>${rep.mgrEmpName}</option>
														</c:forEach> 
											            </c:otherwise>
											            </c:choose> --%>
										         </select>
										      </div>
										    </div> 
										 <div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Recruiter Name</label>
											<div class="col-sm-4">
						 						<input id="rec_name" type="text" minlength="2" maxlength="100"
												title="only alphabets are allowed" 
												placeholder="Recruiter Name" name="rec_name" class="form-control"  value="${autobasiclist.recname}">
											</div>
										</div>
										<%--  <c:choose>
											<c:when test="${hrNamelist.size() > 0}"> --%>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>HR Name</label>
												<div class="col-sm-4">
												 <select name="hr_name" autoComplete="off" class="form-control text-left" id="hr_name">
														<option value="">--Select HR--</option>
														<c:choose>
											            <c:when test="${autobasiclist.hrname==''}">
											            <c:forEach var="hr" items="${hrList}">
											             <option value="${hr.hrName}">${hr.hrName}</option>
														</c:forEach>
											            </c:when>
											            <c:otherwise>
											             <c:forEach var="hr" items="${hrList}">
											             <option value="${hr.hrName}" ${hr.hrName == autobasiclist.hrname ? 'selected="selected"' : ''}>${hr.hrName}</option>
														</c:forEach> 
											            </c:otherwise>
											            </c:choose>
										         </select>
												</div>
											 </div>
											
										
										<div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Personal e-mail ID</label>
											<div class="col-sm-4">
												<input id="email_id" type="text"  
												title="Enter Valid Email format ex:xyz@gmail.com" required
												placeholder="Personal e-mail ID" name="email_id" class="form-control"  value="${autobasiclist.emailid}">
												<Span id="emailspan" style="color:red;"></Span>
												
											</div> <!--  pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$" -->
										</div>
										
										<div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Personal Contact No</label>
											<div class="col-lg-4 col-md-4">
												<input id="phne_no" type="text"  minlength="12" maxlength="12" title="Enter only 123-456-7890 formate" required
												placeholder="Personal Contact No" name="phne_no" class="form-control" value="${autobasiclist.contactno1}">
												<Span id="phonespan" style="color:red;"></Span>
											</div>
										</div>
										
										<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label">Alternative Contact No 1</label>
												<div class="col-sm-4 col-md-4">
													<input id="phne_no2" type="text"  minlength="12" maxlength="12" title="Enter Contact Number" 
													 autocomplete="off" placeholder="Alternative Contact number 1" name="phne_no2" class="form-control" value="${autobasiclist.contactno2}"> 
											<Span id="phonespan2" style="color:red;"></Span>
												</div>
												<div class="col-sm-4 col-md-4" style="padding-right:40px;">
												 <c:choose>
											       <c:when test="${autobasiclist.contactnotype2=='Work'}">
												    <label>Home</label>&nbsp;<input type="radio" name="ctype2" value="Work" checked/>&nbsp;<label>Other</label>&nbsp;<input type="radio" name="ctype2" value="Other"/>
													</c:when>
													<c:when test="${autobasiclist.contactnotype2=='Other'}">
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
													 autocomplete="off" placeholder="Alternative Contact number 2" name="phne_no3" class="form-control" value="${autobasiclist.contactno3}"> <!-- data-masked-input="999-999-9999"  -->
												<Span id="phonespan3" style="color:red;"></Span>
												</div>
												<div class="col-sm-4 col-md-4" style="padding-right:40px;">
												 <c:choose>
											       <c:when test="${autobasiclist.contactnotype3=='Work'}">
												    <label>Home</label>&nbsp;<input type="radio" name="ctype3" value="Work" checked/>&nbsp;<label>Other</label>&nbsp;<input type="radio" name="ctype3" value="Other"/>
													</c:when>
													<c:when test="${autobasiclist.contactnotype3=='Other'}">
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
											<input type="text" id="dob" class="form-control text-left"   required
											title="Enter date in MM/DD/YYYY format only" name="dob" placeholder="Date Of Birth" class="form-control" value="${autobasiclist.dob}" >
										</div><!-- pattern="(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}" -->
										</div>
										<h4><b>Employee Address</b></h4>
										 <div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Line1</label>
											<div class="col-sm-4">
												<input id="line1" type="text" minlength="2" maxlength="80" required
											    title="Enter address" 
												placeholder="Employee Address" name="line1" class="form-control"  value="${autobasiclist.line1}">
											</div>
										</div>
										
										<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-4">
													<input id="line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" 
													placeholder="line2" name="line2" class="form-control"  value="${autobasiclist.line2}" >
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-4">
													<input id="city" type="text"  minlength="2" maxlength="40" required
													title="only Characters are allowed"  
													placeholder="City" name="city" class="form-control"  value="${autobasiclist.city}">
												</div><!--pattern="^[a-zA-Z\s]+$" " -->
											</div>
										
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-4">
													<input id="state" type="text"  minlength="2" maxlength="25" value="${autobasiclist.state}"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="state" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-4">
													<input id="zipcode" type="text"   required
													title="only alphabets are allowed" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													placeholder="Zip Code" name="zipcode" class="form-control"  value="${autobasiclist.zipcode}">
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											<div class="form-group row" >
												<label for="inputPassword" class="col-sm-4 control-label">
												<Span style="color:red;" id="mand" >*</Span>
												Date Of Joining</label>
											<div class="col-sm-4">
												<input type="text" id="joining_Date" class="form-control text-left" 
												  title="Enter date in MM/DD/YYYY format only"  value="${autobasiclist.doj}" 
												  name="joining_Date" placeholder="Date Of Joining"  class="form-control" required >
											</div>
											</div>
										
											<div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>BGC Type</label>
											   <div class="col-sm-4">
											     <select name="bgc" class="form-control text-left" id="bgc" >
											      <option value="">--Select BGC--</option>
											     <option value="PreOnboarding" ${'PreOnboarding' eq autobasiclist.bgc_type ? 'selected="selected"' : ''}>Pre Onboarding</option>
											  <option value="PostOnboarding" ${'PostOnboarding' eq autobasiclist.bgc_type ? 'selected="selected"' : ''}>Post Onboarding</option>
											      <%-- <c:choose>
											       <c:when test="${empty autobasiclist.bgc_type || autobasiclist.bgc_type==''}">
											         <option value="">--Select BGC--</option>
										             <option value="PreOnboarding">Pre Onboarding</option>
										             <option value="PostOnboarding">Post Onboarding</option>
											    </c:when>
											    <c:otherwise>
											        <c:choose>
											    <c:when test="${autobasiclist.bgc_type eq 'PreOnboarding'}">
											    <option value="">--Select BGC--</option>
											      <option value="PreOnboarding" selected>Pre Onboarding</option>
											      <option value="PostOnboarding">Post Onboarding</option>
											    </c:when>
											     <c:when test="${autobasiclist.bgc_type eq 'PostOnboarding'}">
											     <option value="">--Select BGC--</option>
											      <option value="PostOnboarding" selected>Post Onboarding</option>
											      <option value="PreOnboarding">Pre Onboarding</option>
											    </c:when>
											    <c:otherwise>
											    <option value="${autobasiclist.bgc_type}" selected>${autobasiclist.bgc_type}</option>
										             <option value="">--Select BGC--</option>
										             <option value="PreOnboarding">Pre Onboarding</option>
										             <option value="PostOnboarding">Post Onboarding</option>
											    </c:otherwise>
											          </c:choose>
											    </c:otherwise>
											    </c:choose> --%>
										            
										         </select>
										         
										      </div>
										    </div> 
										  <%--  <c:choose>
											<c:when test="${autobasiclist.bgc_type=='PreOnboarding' || autobasiclist.bgc_type=='PostOnboarding'}">
												 <div class="form-group row" id="prediv">
												<label for="inputPassword" class="col-sm-4 control-label">
												<Span style="color:red;" id="mand" >*</Span>
												Date Of Joining</label>
											<div class="col-sm-4">
												<input type="text" id="joining_Date" class="form-control text-left" 
												  title="Enter date in MM/DD/YYYY format only"  value="${autobasiclist.doj}" 
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
												<input id="designation" type="text"  minlength="2" maxlength="100"
                                                    title="Enter only Characters and numbers" placeholder="Job Title"
                                                     name="designation" class="form-control"   value="${autobasiclist.designation}">
											</div>
										</div>
										
									     <div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Billing Type</label>
											   <div class="col-sm-4">
											   <c:choose>
											       <c:when test="${autobasiclist.billing=='billable'}">
							   					    <label>Billable</label> <input type="radio" name="billingType"	value="billable" checked/>
													<label>Non Billable</label><input type="radio" name="billingType" value="nonbillable" />
													
													</c:when>
											       <c:when test="${autobasiclist.billing=='nonbillable'}">
												     <label>Billable</label> <input type="radio" name="billingType"  value="billable" />
													<label>Non Billable</label><input type="radio" name="billingType" value="nonbillable" checked/>
													
													</c:when>
													 <c:when test="${empty autobasiclist.billing}">
												     <label>Billable</label> <input type="radio" name="billingType"  value="billable" />
													<label>Non Billable</label><input type="radio" name="billingType" value="nonbillable" />
													</c:when>
											    </c:choose>
											    
											  </div>
											  
										    </div>
										  <%--   <c:if test="${not empty billingmsg}">
										     <div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><span style="color:red;"></Span></label>
											   <div class="col-sm-8.5">
											   <span style="font-weight:bolder;color:blue"><c:out value="${billingmsg}"></c:out></span>
											   </div>
											 </div></c:if> --%>
										    
										    <div class="form-group row" id="pt">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Timesheet Type</label>
											   <div class="col-sm-4">
											   <select name="payrolltype" class="form-control text-left" id="payrolltype">
										             <option value="">--Select Timesheet Type--</option>
										             <option value="Weekly" ${'Weekly' eq autobasiclist.payroll_type ? 'selected="selected"' : ''}>Weekly</option>
										             <option value="Bi-Weekly1" ${'Bi-Weekly1' eq autobasiclist.payroll_type ? 'selected="selected"' : ''}>Bi-Weekly1</option>
										             <option value="Bi-Weekly2" ${'Bi-Weekly2' eq autobasiclist.payroll_type ? 'selected="selected"' : ''}>Bi-Weekly2</option>
										             <option value="Semi-Monthly" ${'Semi-Monthly' eq autobasiclist.payroll_type ? 'selected="selected"' : ''}>Semi-Monthly</option>
										             <option value="Monthly" ${'Monthly' eq autobasiclist.payroll_type ? 'selected="selected"' : ''}>Monthly</option>
										         </select>
										         
											   <%-- <c:choose>
											       <c:when test="${autobasiclist.payroll_type=='weekly'}">
							   					   <label>Weekly</label>&nbsp;<input type="radio" name="payrolltype" value="weekly" id="weekly"  checked/>&nbsp;<label>Semi-monthly</label>&nbsp;<input type="radio" name="payrolltype" value="semimonthly" id="semimonthly" />
													</c:when>
											       <c:when test="${autobasiclist.payroll_type=='semimonthly'}">
												    <label>Weekly</label>&nbsp;<input type="radio" name="payrolltype" value="weekly" id="weekly" />&nbsp;<label>Semi-monthly</label>&nbsp;<input type="radio" name="payrolltype" value="semimonthly" id="semimonthly" checked/>
													</c:when>
													<c:otherwise>
													<label>Weekly</label>&nbsp;<input type="radio" name="payrolltype" value="weekly" id="weekly"/>&nbsp;<label>Semi-monthly</label>&nbsp;<input type="radio" name="payrolltype" value="semimonthly" id="semimonthly"/>
													</c:otherwise>
											    </c:choose> <br>--%>
													 
												</div>
										    </div>
										    
										    <input type="hidden"  name="validateby"  id="validateby">
										    <div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Validation Required By</label>
											   <div class="col-sm-4">
											   
											   <c:choose>
											       <c:when test="${autobasiclist.validateby_flag eq 3}">
							   					  <label>Manager</label>&nbsp;<input type="checkbox" id="mgrvalidate" name="validation" value="Manager" checked disabled/>&nbsp;<label>HR</label>&nbsp;<input type="checkbox" name="validation" id="hrvalidate" value="HR" checked/>&nbsp;<label>Audit</label>&nbsp;<input type="checkbox"  name="validation" id="auditvalidate" value="Audit" checked />
													</c:when>
											       <c:when test="${autobasiclist.validateby_flag eq 2}">
												   <label>Manager</label>&nbsp;<input type="checkbox" id="mgrvalidate" name="validation" value="Manager" checked disabled/>&nbsp;<label>HR</label>&nbsp;<input type="checkbox" name="validation" id="hrvalidate" value="HR" checked/>&nbsp;<label>Audit</label>&nbsp;<input type="checkbox"  name="validation" id="auditvalidate" value="Audit"  />
													</c:when>
													  <c:when test="${autobasiclist.validateby_flag eq 1}">
												   <label>Manager</label>&nbsp;<input type="checkbox" id="mgrvalidate" name="validation" value="Manager" checked disabled/>&nbsp;<label>HR</label>&nbsp;<input type="checkbox" name="validation" id="hrvalidate" value="HR" />&nbsp;<label>Audit</label>&nbsp;<input type="checkbox"  name="validation" id="auditvalidate" value="Audit" />
													</c:when>
													<c:otherwise>
													<label>Manager</label>&nbsp;<input type="checkbox" id="mgrvalidate" name="validation" value="Manager" checked required/>&nbsp;<label>HR</label>&nbsp;<input type="checkbox" name="validation" id="hrvalidate" value="HR"/>&nbsp;<label>Audit</label>&nbsp;<input type="checkbox"  name="validation" id="auditvalidate" value="Audit" />
													</c:otherwise>
											    </c:choose>
											    
											    
											   		
													 <br>
												</div>
										    </div>
					
									
											<div class="text-center ml-5">										
											<button type="button" class="btn btn-default btn-sm" id="submitid"  onclick="updateForm(); return false"
											style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" />Update</button>
											<!-- <input type="submit" class="btn btn-default" id="submitid" style="padding:7px;" value="Submit"> -->
											<input type="button" onclick="goBack()" value="Back" class="btn btn-default btn-sm" style="padding:7px;background-color:grey;color:white;line-height:0.728571;">			
											</div>										
									</form>		
								    </fieldset>
								</div>
							</div>
							</div>
						</div>
					</div>
				</div>
				
				<input type="hidden"  name="un"  id="un" >
			<input type="hidden"  name="canid"  id="canid" >
			
			<form action="searchlist" method="post" id="bformid" style="display:none">
			     <input type="text"  name="semp_type"  value="${semp_type}">
				<input type="text" name="susername"  value="${susername}">
  	        	<input type="text"  name="sfullname"  value="${sfullname}">
			    <input type="text"  name="spendingdocs"  value="${spendingdocs}">
			    <input type="text" name="s_subtype"  value="${s_subtype}">
			    <input type="hidden" name="empstatus" value="${sempstatus}">
		  </form> 
		  
				<%-- <form action="searchlist" method="post" id="bformid" style="display:none">
				<input type="hidden"  name="semp_type"  value="${semp_type}">
				<input type="hidden" name="susername"  value="${susername}">
  	        	<input type="hidden"  name="sfullname"  value="${sfullname}">
			    <input type="hidden"  name="spendingdocs"  value="${spendingdocs}">
			    <input type="hidden" name="s_subtype"  value="${s_subtype}">
				</form>  --%>
				
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true"
				style="top: 150px;">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header" style=padding:.5rem;"">
						   <button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b>Employee Details</b>
								</h5>
						</div>
						<center>
							<div class="modal-body">
								<table>
									<tr>
										<th>First Name</th>
										<td style="padding: 6px;"><strong><span
												style="color: red" id="fName"></span></strong></td>
									</tr>
									<tr>
										<th>Middle Name</th>
										<td style="padding: 6px;"><strong><span
												style="color: red" id="mName"></span></strong></td>
									</tr>
									<tr>
										<th>Last Name</th>
										<td style="padding: 6px;"><strong><span
												style="color: red" id="sName"></span></strong></td>
									</tr>
									<tr>
										<th>User Name</th>
										<td style="padding: 6px;"><strong><span
												style="color: red" id="uname"></span></strong></td>
									</tr>

								</table>
							</div>
							<b><span style="color: red">Please Verify Employee
									Information. Do you want to Continue?</span></b><br>
						</center>
						<div class="modal-footer">
							<button class="btn btn-primary btn-sm" type="button" id="mybutton"
								value="Go" onclick="submitForm()">
								<strong>Yes</strong>
							</button>
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
	      </div>
		</div>
	</div>
	
	 <script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script src="resources/preDefined/goback.js"></script>
<script>

var p1=$('#phne_no1').val();
var p2=$('#phne_no21').val();
var p3=$('#phne_no31').val();
var e1=$('#email_id1').val();

$("#rle,#dpt,#rhd").hide();
$("#w2admin_roles,#w2admin_details").attr("readonly",false);
var employee_type=$('#employee_type').val();
if(employee_type=="W2"){
	$('#w2admin_roles,#w2admin_details').attr("style", "pointer-events: none;");
	 $("#w2admin_roles,#w2admin_details").attr("readonly",true);
}else{
	$('#w2admin_roles,#w2admin_details').attr("style", "pointer-events: auto;");
	 $("#w2admin_roles,#w2admin_details").attr("readonly",false);
}

function mandatoryByEmptype(){
var employee_type=$('#employee_type').val();
if(employee_type=="W2 Admin"){
	$('#w2admin_roles,#w2admin_details').attr("style", "pointer-events: auto;");
	 $("#w2admin_roles,#w2admin_details").attr("readonly",false);
	 $("#w2admin_details,#w2admin_roles,#w2emp_rephead,#payrolltype").attr("required", true);
	 $("#rle,#dpt,#rhd,#pt").show();
 }
else{
	$('#w2admin_roles,#w2admin_details').attr("style", "pointer-events: none;");
	 $("#w2admin_roles,#w2admin_details").attr("readonly",true);

		 $("#w2admin_details,#w2admin_roles,#w2emp_rephead,#payrolltype").attr("required", false);
		 $("#rle,#dpt,#rhd,#pt").hide();
}
 }

function mandatoryByWorkAuth(){
var work_auth=$('#work_auth').val();
if(work_auth=="H-1B" || work_auth=="L1" || work_auth=="OPT" || work_auth=="CPT"){
	 $("#w2emp_rephead").attr("required", true);
	 $("#rhd").show();
 }
else{
		 $("#w2emp_rephead").attr("required", false);
		 $("#rhd").hide();
}
 }
</script>
<script language="JavaScript" type="text/javascript">
function goBack() {
	document.getElementById("bformid").submit();
	}
	
var emptype=$("#emptype").val(); 
var role=$("#role").val();
var dept=$("#dept").val();

/* var bgctype1=$("#bgctype1").val(); 
if(bgctype1=="PreOnboarding") {
	$("#mand").show();
}else if(bgctype1=="PostOnboarding") {
	$("#mand").hide();
} */

/* $(function () {
	  $("#bgc").change(function () {
		  if ($(this).val() == "PreOnboarding") {
			  $("#dj").show();
			  $("#mand").show();
			   document.getElementById('joining_Date').required=true;  
          } else{
          	 $("#dj").show();
          	 $("#mand").hide();
          	document.getElementById('joining_Date').required=false;
          }
      });
  }); */
document.getElementById('submitid').disabled=true;


		
$('#FirstName').on('keyup', function() {
	if($('#FirstName').val()==$('#FirstName1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}   });
$('#middleName').on('keyup', function() {
		if($('#middleName').val()==$('#middleName1').val())
			{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} });
$('#familyName').on('keyup', function() {
		if($('#familyName').val()==$('#familyName1').val())
			{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#state').on('keyup', function() {
		if($('#state').val()==$('#state1').val())
			{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}   });
$('#ssn_emp').on('keyup', function() {
		if($('#ssn_emp').val()==$('#ssn_emp1').val())
			{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#rec_name').on('keyup', function() {
	if($('#rec_name').val()==$('#rec_name1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#email_id').on('keyup', function() {
	if($('#email_id').val()==$('#email_id1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#phne_no').on('keyup', function() {
	if($('#phne_no').val()==$('#phne_no1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#dob').on('change', function() {
	if($('#dob').val()==$('#dob1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#line1').on('keyup', function() {
	if($('#line1').val()==$('#line11').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#line2').on('keyup', function() {
	if($('#line2').val()==$('#line21').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#zipcode').on('keyup', function() {
	if($('#zipcode').val()==$('#zipcode1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#city').on('keyup', function() {
	if($('#city').val()==$('#city1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#ctc').on('keyup', function() {
		 if($('#ctc').val()==$('#ctc1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}   });
$('#designation').on('keyup', function() {
		 if($('#designation').val()==$('#designation1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#employee_type').on('change', function() {
		 if($('#employee_type').val()==$('#employee_type1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#w2admin_details').on('change', function() {
		 if($('#w2admin_details').val()==$('#w2admin_details1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} });
$('#w2admin_roles').on('change', function() {
		 if($('#w2admin_roles').val()==$('#w2admin_roles1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} });
$('#w2emp_rephead').on('change', function() {
		 if($('#w2emp_rephead').val()==$('#w2emp_rephead1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} });
$('#hr_name').on('change', function() {
		 if($('#hr_name').val()==$('#hr_name1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} });
$('#joining_Date').on('change', function() {
		 if($('#joining_Date').val()==$('#joining_Date1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}});
$('#work_auth').on('change', function() {
    if($('#work_auth').val()==$('#work_auth1').val())
    {document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} });		

	 $("input[name='billingType']").on('click', function() {
    if($("input[name='billingType']:checked").val()==$('#billingType1').val())
	{
    	 document.getElementById('submitid').disabled=true;
	}else if($("input[name='billingType']:checked").val()!=$('#billingType1').val()){
		document.getElementById('submitid').disabled=false;
		}
	 });

	    
    $('#phne_no2').on('keyup', function() {
    	if($('#phne_no2').val()==$('#phne_no21').val())
    		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
    
    $('#phne_no3').on('keyup', function() {
    	if($('#phne_no3').val()==$('#phne_no31').val())
    		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
    
    
    
    $("input[name='ctype2']").on('click', function() {
        if($("input[name='ctype2']:checked").val()==$('#ctype21').val())
    	{
        	 document.getElementById('submitid').disabled=true;
    	}else if($("input[name='ctype2']:checked").val()!=$('#ctype21').val()){
    		document.getElementById('submitid').disabled=false;
    	}else if($("input[name='ctype2']:checked").val()!=$('#ctype21').val()){
    		document.getElementById('submitid').disabled=false;
    		}
      });


   // pr_type val_by


    /* $("input[name='payrolltype']").on('click', function() {
    if($("input[name='payrolltype']:checked").val()==$('#pr_type').val())
	{
    	 document.getElementById('submitid').disabled=true;
	}else if($("input[name='payrolltype']:checked").val()!=$('#pr_type').val()){
		document.getElementById('submitid').disabled=false;
		}
	 }); */
   
	var etype=$('#employee_type1').val()
	if(etype=="W2 Admin"){
		 $('#pt').show();
	}else{
		 $('#pt').hide();
	}
    $('#payrolltype').on('change', function() {
		if ($('#payrolltype').val() == $('#pr_type').val()) {
			document.getElementById('submitid').disabled = true;
		} else {
			document.getElementById('submitid').disabled = false;
		}
	});
    

    $("input[name='validation']").on('click', function() {
        if($("input[name='validation']:checked").val()==$('#val_by').val())
    	{
        	 document.getElementById('submitid').disabled=true;
    	}else if($("input[name='validation']:checked").val()!=$('#val_by').val()){
    		document.getElementById('submitid').disabled=false;
    		}
    	 });
        
    
    
    $("input[name='ctype3']").on('click', function() {
        if($("input[name='ctype3']:checked").val()==$('#ctype31').val())
    	{
        	 document.getElementById('submitid').disabled=true;
    	}else if($("input[name='ctype3']:checked").val()!=$('#ctype31').val()){
    		document.getElementById('submitid').disabled=false;
    	}else if($("input[name='ctype3']:checked").val()!=$('#ctype31').val()){
    		document.getElementById('submitid').disabled=false;
    		}
      });

	$('#bgc').on('change', function() {
		if ($('#bgc').val() == $('#bgctype1').val()) {
			document.getElementById('submitid').disabled = true;
		} else {
			document.getElementById('submitid').disabled = false;
		}
	});

	var date = new Date();
	date.setDate(date.getDate());

	$(document).ready(function() {
		var empdivtype = $('#employee_type').val();
		/* if(empdivtype=="W2"){
			$('#rolediv').hide();
			$('#rephead').hide();
		 } */
		$("#dob").datepicker({
			changeMonth : true,
			changeYear : true,
			minDate : "-70Y",
			endDate : date,
			yearRange : "1950:2000"
		}).on('changeDate', function(selected) {
			/*  var minDate = new Date(selected.date.valueOf());
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
  		}).on('changeDate', function(e) {
		            $('#formid').formValidation('revalidateField', 'joining_Date');
		});
		$("#mysubmit").click(function() {
			//$("#myRowSubmit").show();
			$("#myRowSubmit").delay(2000).fadeIn();
		});
	});
</script>
<!-- <script type="text/javascript">
/* $("#rephead").hide(); */
 function reportingHead(){

		 var deptid=$('#w2admin_details').val(); 
	     var emp_roles=$('#w2admin_roles').val();
	    
	  
	    $.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "application/json", // NOT dataType!
	        url  : "USOBT_BasicDetails?emp_roles="+emp_roles+"&action=emprole&deptid="+deptid+"",
	        //data: JSON.stringify(data),
	        success  : function(response){
	        	 $('#w2emp_rephead').empty();
		    	  $('#w2emp_rephead').append($('<option/>').attr("value", '').text("--Select Employee--"));
		    	  //$('#w2emp_rephead').prop('required',true);
	        	for(var i=0;i<response.length;i++)
	     	  {
	        		//$('#w2emp_rephead').append($('<option/>').attr("value", data.emp_number).text(data.empName));
	        		$('#w2emp_rephead').append($('<option/>').attr("value", response[i].emp_number).text(response[i].empName));
	        }
	        	$('#rephead').show();	
	        }
		    
		    });
	 
	 }
</script> -->

	
	<!-- <script type="text/javascript">
	$('#rephead').show();
function emp_type()
{
	 	var employee_type = document.getElementById("employee_type").value;
		if (employee_type=="W2 Admin") 
		{ 
		 //$('#rolediv').show(); 
		$('#rolediv').hide();
		
		}
		else if (employee_type=="W2") 
		{ 
		$('#rolediv').hide();
		$('#rephead').hide();
		//$('#w2admin_roles').hide();
		}
	 $.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "application/json", // NOT dataType!
	        url  : "LoadDepartments?emptype="+employee_type+"",
	        success  : function(response){
	     $('#w2admin_details').empty();
	    	  $('#w2admin_details').append($('<option/>').attr("value", '').text("--Select Department--"));
	        for(var i=0;i<response.length;i++)
	     	  {
	        		$('#w2admin_details').append($('<option/>').attr("value", response[i].dept_id).text(response[i].dept_name));
	        }
	       
	        }
		    });
	 
}
</script> -->
<!-- <script type="text/javascript">
 function getRole(){
	 //alert("roles");
	var employee_type=$('#employee_type').val();
	    if(employee_type=="W2 Admin"){
	    	 $('#rolediv').show();
	    
	 }
	    else{
	    	 $('#rolediv').hide(); 
	    	 $('#rephead').hide();
	    }}
</script> -->
 <script>
$('#formid').formValidation({
    framework: 'bootstrap',
   /*  icon: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    }, */
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {	
    	ssn_emp: {
            validators: {
             /*    stringLength: { 
                    min: 11,
                    max: 11,
                    message: 'SSN must be 11 digits long'
                },
                regexp: {
                    regexp: /^(?!000|666)[0-8][0-9]{2}-(?!00)[0-9]{2}-(?!0{4})[0-9]{4}$/,
                    message: 'Invalid SSN input(ssn should not be all 0s and should not start with 9)'
                } */
            }
        },
        FirstName: {
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
                   // regexp: /^([A-Za-z]+\s|\s)+[A-Za-z]+$|^[A-Za-z]+$/,
                   regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                    message: 'First Name accepts alphabets and Space allowed but is not at beginning or end of the word'
                }
            }
        },
        middleName: {
            validators: {
            	/* notEmpty: {
                    message: 'First Name is mandatory'
                }, */
                stringLength: {
                    min: 2,
                    max: 40,
                    message: 'Middle Name must be more than 2 and less than 40 characters long'
                },
                regexp: {
                   // regexp: /^([A-Za-z]+\s|\s)+[A-Za-z]+$|^[A-Za-z]+$/,
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
                },
                
            }
        
        },
        employee_type:{
            validators: {
            	notEmpty: {
                    message: 'Please select employee type'
                }
            }
        },
        work_auth:{
            validators: {
            	notEmpty: {
                    message: 'Please select Work authorization type'
                }
            }
        },
        dob: {
            validators: {
                notEmpty: {
                    message: 'DOB is mandatory'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter DOB in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY', 
                    //message: 'DOB is not a valid, please enter in MM/DD/YYYY format'
                }
            }
        },
        joining_Date: {
            validators: {
                notEmpty: {
                    message: 'Joining date is mandatory'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter Joining date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Joining date is not a valid'
                }
            }
        },
        w2admin_details:{
        	enabled: false,
            validators: {
            	notEmpty: {
                    message: 'Please select department'
                }
            }
        },
        w2admin_roles:{
        	enabled: false,
            validators: {
            	notEmpty: {
                    message: 'Please Choose role'
                }
            }
        },
        w2emp_rephead:{
        	enabled: false,
            validators: {
            	notEmpty: {
                    message: 'Please Choose reporting head..'
                }
            }
        },
        rec_name: {
            validators: {
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Recruiter Name must be more than 2 and less than 100 characters long'
                },
                regexp: {
                	regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                    message: 'Recruiter Name accepts alphabets and Space allowed but is not at beginning or end of the word'
                },
            }
        },
        hr_name: {
            validators: {
            	/* notEmpty: {
                    message: 'HR Name is mandatory'
                }, */
                stringLength: {
                    min: 2,
                    max: 20,
                    message: 'HR Name must be more than 2 and less than 20 characters long'
                },
                regexp: {
                	regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                    message: 'HR Name accepts alphabets and Space allowed but is not at beginning or end of the word'
                },
                
            }
        
        },
        email_id: {
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
                },
                
            }
        
        },
        phne_no : {
            validators: {
            	notEmpty: {
                    message: 'Contact number is mandatory'
                },
                stringLength: {
                    min: 12,
                    max: 12,
                    message: 'Contact number min length 10 and max length can be 10'
                },
                 regexp: {
                	 regexp: /^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$/,
                     message: 'Please enter valid Contact Number'
                }, 
            }
        },
        ctype1:{
            validators: {
            	notEmpty: {
                    message: 'Please Choose  Contact type'
                }
            }
        },
        line1 : {
            validators: {
            	 notEmpty: {
                    message: 'Line1 name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line1 name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 accepts alphanumerics '
                },
                
            }
        
        },
        line2 : {
            validators: {
            	/* notEmpty: {
                    message: 'Street name is mandatory'
                }, */
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line2 name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line2 accepts alphanumerics '
                },
                
            }
        
        },
        city : {
            validators: {
            	notEmpty: {
                    message: 'City name is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'City name should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'City name accepts alphanumerics'
                },
                
            }
        
        },
        state : {
            validators: {
            	notEmpty: {
                    message: 'State name is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'State name should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'State name accepts characters'
                },
                
            }
        
        },
        zipcode : {
            validators: {
            	notEmpty: {
                    message: 'Zipcode is mandatory'
                },
                stringLength: {
                    min: 5,
                    max: 5,
                    message: 'Zipcode must be 5 digits'
                },
                regexp: {
                	regexp: /[0-9]/,
                    message: 'Zipcode accepts digits'
                },
                
            }
        
        },    
        designation : {
            validators: {
            	isEmpty: {
                    message: 'Title is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Title min length 2 and max length 100 '
                },
                regexp: {
                	 regexp: /^(?!\d\s+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &():\/\\-]*)?$/,
                     message: 'Title accepts alphanumerical, special characters like &-()/: allowed and Space allowed but is not at beginning or end of the word'
                },
                
            }
        
        },
        bgc:{
            validators: {
            	isEmpty: {
                    message: 'Please select BGC Type'
                }
            }
        },
        billingType:{
            validators: {
            	notEmpty: {
                    message: 'Please Choose  Billing type'
                }
            }
        },
        payrolltype:{
            validators: {
            	notEmpty: {
                    message: 'Please Choose  timesheet type'
                }
            }
        },
        validateby:{
            validators: {
            	notEmpty: {
                    message: 'Please check  validate by'
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
 .on('change', '[name="employee_type"]', function(e) {
    var employee_type = document.getElementById("employee_type");
    if (employee_type =='W2 Admin') {
		   $('#formid').bootstrapValidator('enableFieldValidators','w2admin_details',true);
		   $('#formid').bootstrapValidator('enableFieldValidators','w2admin_roles',true);
		   $('#formid').bootstrapValidator('enableFieldValidators','w2emp_rephead',true);
    } else {
    	   $('#formid').bootstrapValidator('enableFieldValidators','w2admin_details',false);
		   $('#formid').bootstrapValidator('enableFieldValidators','w2admin_roles',false);
		   $('#formid').bootstrapValidator('enableFieldValidators','w2emp_rephead',false);
    } 
     })
      .on('change', '[name="work_auth"]', function(e) {
    var work_auth = document.getElementById("work_auth");
    if(work_auth=="H-1B" || work_auth=="L1" || work_auth=="OPT" || work_auth=="CPT"){
		   $('#formid').bootstrapValidator('enableFieldValidators','w2emp_rephead',true);
       } else {
		   $('#formid').bootstrapValidator('enableFieldValidators','w2emp_rephead',false);
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
    		   $("#submitid").attr("disabled", true);
    	   }else{
    		   $('#emailspan').text('');
    		   $("#submitid").attr("disabled", false);  
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
	     		  $("#submitid").attr("disabled", true);
	     	   }else{
	     		  $('#phonespan').text('');
	     		 $("#submitid").attr("disabled", false);  
	     	   }
	          }
		 });
    })*/
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
/* .on('change', '[name="bgc"]', function(e) {
	   if ($(this).val()=='PreOnboarding') {
		   $('#formid').bootstrapValidator('enableFieldValidators','joining_Date',true);
    } else if($(this).val()=='PostOnboarding'){
 	   $('#formid').bootstrapValidator('enableFieldValidators', 'joining_Date',false);
    } 
}) */;
</script>  
<script type="text/javascript">
$('form').on('reset', function() {
	$('#formid').data('formValidation').resetForm();
	});
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
   	    $("#submitid").attr("disabled", false);
    }else{
     //   var regex = new RegExp("^(?!\\b(\\d)\\1+-(\\d)\\1+-(\\d)\\1+\\b)(?!123-45-6789|219-09-9999|078-05-1120)(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$");
     var regex = new RegExp("^(?!\\b(\\d)\\1+-(\\d)\\1+-(\\d)\\1+\\b)(?!123-45-6789|219-09-9999|078-05-1120)(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$");
  	    if(!regex.test(ssn_emp)){
  	    	   $('#ssnshow').html("<font color=red>SSN is Not Valid</font>");
  	    	   $("#submitid").attr("disabled", true);
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
        			//emptype response Starts here
   	        		$.ajax({
   		   	 	    	type : "GET",
   		   	 	        asyn : false,
   		   	 	        contentType: "application/json", // NOT dataType!
   		   	 	        url  : "getempTypeByCanId?canid="+response.candidate_id+"",
   		   	 	        success  : function(resEtype){
        			if(dept==1&&emptype=="Admin"&&role==4){ 
	   	        		$('#ssnshow').html("Found a record with this SSN "+'<a href="#" onclick="getEmployee()"><font color="blue">ClickHere</font></a>');
	   	        	//$('#ssnshow').html("Found a record with this SSN"+'<a href="empsearchbySSN?ssnno='+ssn_emp+'"><font color="blue">ClickHere</font></a>');
	   	        		$("#submitid").attr("disabled", true);
	   	                $("input[type=submit]").css("background-color", "grey");  
	   	                  	        		
	   	                 }  //resEtype
	   	        	else if(dept==2&&emptype=="W2 Admin"&&role==2){
	           			if(resEtype=="W2 Admin" || resEtype=="W2"){
	           			 $('#ssnshow').html("Found a record with this SSN"+'<a href="#" onclick="getEmployee()"><font color="blue">ClickHere</font></a>');
	      	        		 $("#submitid").attr("disabled", true);
	      	                 $("input[type=submit]").css("background-color", "green");
	           			}
	           		 else if(resEtype=="C2C" || resEtype=="1099"){
	           			 $('#ssnshow').html("SSN Already Added. But HR doesn't have access to view of C2C and 1099 employees records");
	      	        		 $("#submitid").attr("disabled", true);
	      	                 $("input[type=submit]").css("background-color", "grey");
	           			} 
         			else
         			{
         			 /* $('#ssnshow').html("SSN Already Exist But HR doesn't have access to view of C2C and 1099 employees records"); */
         				//alert(response);
     	        		$('#ssnshow').html("<font color=#009900>Valid SSN number</font>");	


     	        		document.getElementById('FirstName').removeAttribute('readonly');
     	        		document.getElementById('middleName').removeAttribute('readonly');
     	        		document.getElementById('familyName').removeAttribute('readonly');
     	        		document.getElementById('employee_type').removeAttribute('readonly');
     	        		document.getElementById('w2admin_details').removeAttribute('readonly');
     	        		document.getElementById('w2admin_roles').removeAttribute('readonly');
     	        		document.getElementById('w2emp_rephead').removeAttribute('readonly');
     	        		document.getElementById('rec_name').removeAttribute('readonly');
     	        		document.getElementById('hr_name').removeAttribute('readonly');
     	        		document.getElementById('email_id').removeAttribute('readonly');
     	        		document.getElementById('phne_no').removeAttribute('readonly'); 
     	        		document.getElementById('dob').removeAttribute('readonly'); 
     	        		document.getElementById('line1').removeAttribute('readonly'); 
     	        		document.getElementById('street').removeAttribute('readonly'); 
     	        		document.getElementById('zipcode').removeAttribute('readonly'); 
     	        		document.getElementById('city').removeAttribute('readonly'); 
     	        		document.getElementById('passportno').removeAttribute('readonly');
     	        		document.getElementById('joining_Date').removeAttribute('readonly'); 
     	        		document.getElementById('pas_exp_Date').removeAttribute('readonly');
     	        		//document.getElementById('currency').removeAttribute('readonly'); 
     	        		document.getElementById('ctc').removeAttribute('readonly'); 
     	        		document.getElementById('designation').removeAttribute('readonly'); 
     	        		document.getElementById('state').removeAttribute('readonly'); 
     	        		
     	        		$("#employee_type").children('option:gt(0)').show();
     	    			$("#w2admin_details").children('option:gt(0)').show();
     	    			$("#w2admin_roles").children('option:gt(0)').show();
     	    			$("#w2emp_rephead").children('option:gt(0)').show();
     	    			$("#dob").children('option:gt(0)').show();
     	    			$("#joining_Date").children('option:gt(0)').show();
     	    			$("#pas_exp_Date").children('option:gt(0)').show();
     	    			//$("#currency").children('option:gt(0)').show();
     	        		
     	        		$("#joining_Date").datepicker({
     	    				changeMonth:true,
     	    				changeYear:true,
     	        		})
     	    				.on('changeDate', function(e) {
     	    		            $('#formid').formValidation('revalidateField', 'joining_Date');
     	    			});
     	        		$("#pas_exp_Date").datepicker({
     	    				changeMonth:true,
     	    				changeYear:true,
     	        		})
     	    				.on('changeDate', function(e) {
     	    		            $('#formid').formValidation('revalidateField', 'pas_exp_Date');
     	    			});
     	        		
     	        		$("#dob").datepicker({
     	    				changeMonth:true,
     	    				changeYear:true,
     	    				minDate: "-70Y",
     	    				endDate: date,
     	    				yearRange: "1950:2000" 

     	    			})
     	    			  .on('changeDate', function(e) {
                 // Revalidate the date field
                 $('#formid').formValidation('revalidateField', 'dob');
             	});
     	        		$("#reset").attr("disabled", false);
     	        		$("#submitid").attr("disabled", false);
         			}
 	        	}
        		}   });//emptype response ends here
 	        	}
 	        	else{
 	        		//alert(response);
 	        		$('#ssnshow').html("<font color=#009900>Valid SSN number</font>");	
 	        		
 	        		document.getElementById('FirstName').removeAttribute('readonly');
 	        		document.getElementById('middleName').removeAttribute('readonly');
 	        		document.getElementById('familyName').removeAttribute('readonly');
 	        		document.getElementById('employee_type').removeAttribute('readonly');
 	        		document.getElementById('w2admin_details').removeAttribute('readonly');
 	        		document.getElementById('w2admin_roles').removeAttribute('readonly');
 	        		document.getElementById('w2emp_rephead').removeAttribute('readonly');
 	        		document.getElementById('rec_name').removeAttribute('readonly');
 	        		document.getElementById('hr_name').removeAttribute('readonly');
 	        		document.getElementById('email_id').removeAttribute('readonly');
 	        		document.getElementById('phne_no').removeAttribute('readonly'); 
 	        		document.getElementById('dob').removeAttribute('readonly'); 
 	        		document.getElementById('line1').removeAttribute('readonly'); 
 	        		document.getElementById('street').removeAttribute('readonly'); 
 	        		document.getElementById('zipcode').removeAttribute('readonly'); 
 	        		document.getElementById('city').removeAttribute('readonly'); 
 	        		document.getElementById('passportno').removeAttribute('readonly');
 	        		document.getElementById('joining_Date').removeAttribute('readonly'); 
 	        		document.getElementById('pas_exp_Date').removeAttribute('readonly');
 	        		//document.getElementById('currency').removeAttribute('readonly'); 
 	        		document.getElementById('ctc').removeAttribute('readonly'); 
 	        		document.getElementById('designation').removeAttribute('readonly'); 
 	        		document.getElementById('state').removeAttribute('readonly'); 
 	        		
 	        		$("#employee_type").children('option:gt(0)').show();
 	    			$("#w2admin_details").children('option:gt(0)').show();
 	    			$("#w2admin_roles").children('option:gt(0)').show();
 	    			$("#w2emp_rephead").children('option:gt(0)').show();
 	    			$("#dob").children('option:gt(0)').show();
 	    			$("#joining_Date").children('option:gt(0)').show();
 	    			$("#pas_exp_Date").children('option:gt(0)').show();
 	    			//$("#currency").children('option:gt(0)').show();
 	        		
 	        		$("#joining_Date").datepicker({
 	    				changeMonth:true,
 	    				changeYear:true,
 	        		})
 	    				.on('changeDate', function(e) {
 	    		            // Revalidate the date field
 	    		            $('#formid').formValidation('revalidateField', 'joining_Date');
 	    			});
 	        		$("#pas_exp_Date").datepicker({
 	    				changeMonth:true,
 	    				changeYear:true,
 	        		})
 	    				.on('changeDate', function(e) {
 	    		            $('#formid').formValidation('revalidateField', 'pas_exp_Date');
 	    			});
 	        		
 	        		$("#dob").datepicker({
 	    				changeMonth:true,
 	    				changeYear:true,
 	    				minDate: "-70Y",
 	    				endDate: date,
 	    				yearRange: "1950:2000" 

 	    			})
 	    			  .on('changeDate', function(e) {
             // Revalidate the date field
             $('#formid').formValidation('revalidateField', 'dob');
         });
 	        		$("#reset").attr("disabled", false);
 	        		$("#submitid").attr("disabled", false);
 	        	
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

function updateForm(){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#formid').formValidation('validate');
	if( !$('#formid').data('formValidation').isValid())
		 {
		//alert("Please enter required fields");
		 }
	else
	{
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
			
		$("#submitid").attr("disabled",true);
		 var form = $('#formid')[0];
		     var data = new FormData(form);
			$.ajax({
		            url: "updateEmployees", //this is the submit URL
		            type: "POST",
		            enctype: 'multipart/form-data',
		            data: data,
		            processData: false,
		            contentType: false,
		            cache: false,
		            success: function(response){
		   	        if(response!=null || response!=""){
			   	     var mesg=response.message;
			   	     var candidateId=response.candidateId;
			   	     alert(mesg);
			   	  	 window.location.href="ViewEmployeeInfo?candidate_id="+candidateId+"";
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
function  getEmployee(){
	getsesVal().done(function(data){
		  if(data!=""){
	var un=$('#un').val();
	var canid=$('#canid').val();
	$.ajax({
    	type : "GET",
        asyn : false,
        contentType: "application/json", // NOT dataType!
        url  : "getempTypeByCanId?canid="+canid+"",
        success  : function(response){
        	var etpe="";
        	if(response=='C2C' || response=='1099'){
        		etpe="Contractors";
        	}else{
        		etpe="Employees";
        	}
        	$('#etype').val(etpe);$('#euser').val(un);
    		$('#efullname').val("");$('#edocs').val("");$('#esubtpe').val("");
    		document.getElementById("bformid").submit();
        }
	    });
		  }else{
				 window.location.href="loginpage";
			}
		});
}

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
	    	 $("#submitid").attr("disabled", false);
	    }else{
	    	var regex = new RegExp("^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$");
	    if(!regex.test(email_id)){
	    	  // $('#emailspan').text("Please enter valid number");
	    	   $("#submitid").attr("disabled", true);
	    }else{
	    	 $.ajax({
	    		   	type : "GET",
	    		       asyn : false,
	    		       contentType: "text/plain", // NOT dataType!
	    		       url  : "checkEmail?email="+email_id+"",
	    		       success  : function(response){
	    		    	   if(e1==email_id){
	    		    		   $('#emailspan').text('');
	    		    		   $("#submitid").attr("disabled", false);  
	    		    	   }
	    		    	   else if(response==email_id){
	    		    		   $('#emailspan').text("Email id already exists");
	    		    		   $("#submitid").attr("disabled", true);
	    		    	   }else{
	    		    		   //$('#emailspan').text("Email id not available");
	    		    		   $('#emailspan').text('');
	    		    		   $("#submitid").attr("disabled", false);  
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
	    	 $("#submitid").attr("disabled", false);
	    }else{
	    	var regex = new RegExp("^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$");
	    if(!regex.test(phne_no)){
	    	  // $('#emailspan').text("Please enter valid number");
	    	   $("#submitid").attr("disabled", true);
	    }else{
	    	$.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "text/plain", // NOT dataType!
		        url  : "checkPhoneNo?phone="+phne_no+"",
		        success  : function(response){
		        	if(p1==phne_no || p2==phne_no || p3==phne_no){
		        		$('#phonespan').text('');
			     		 $("#submitid").attr("disabled", false); 
		        	}
		        	else if(response.contactno1==phne_no || response.contactno2==phne_no || response.contactno3==phne_no){
		     		   $('#phonespan').text("Contact number already exists");
		     		  $("#submitid").attr("disabled", true);
		     	   }else{
		     		  $('#phonespan').text('');
		     		 $("#submitid").attr("disabled", false);  
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
	    	 $("#submitid").attr("disabled", false);
	    }else{
	    	var regex = new RegExp("^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$");
	    if(!regex.test(phne_no)){
	    	  // $('#emailspan').text("Please enter valid number");
	    	   $("#submitid").attr("disabled", true);
	    }else{
	    	$.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "text/plain", // NOT dataType!
		        url  : "checkPhoneNo?phone="+phne_no+"",
		        success  : function(response){
		        	if(p1==phne_no || p2==phne_no || p3==phne_no){
		        		$('#phonespan2').text('');
			     		 $("#submitid").attr("disabled", false); 
		        	}
		        else if(response.contactno1==phne_no || response.contactno2==phne_no || response.contactno3==phne_no){
		     		   $('#phonespan2').text("Contact number already exists");
		     		  $("#submitid").attr("disabled", true);
		     	   }else{
		     		  $('#phonespan2').text('');
		     		 $("#submitid").attr("disabled", false);  
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
	    	 $("#submitid").attr("disabled", false);
	    }else{
	    	var regex = new RegExp("^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$");
	    if(!regex.test(phne_no)){
	    	  // $('#emailspan').text("Please enter valid number");
	    	   $("#submitid").attr("disabled", true);
	    }else{
	    	$.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "text/plain", // NOT dataType!
		        url  : "checkPhoneNo?phone="+phne_no+"",
		        success  : function(response){
		        	//phne_no1 phne_no21   phne_no31
		        	if(p1==phne_no || p2==phne_no || p3==phne_no){
		        		$('#phonespan3').text('');
			     		 $("#submitid").attr("disabled", false); 
		        	}
		        	else if(response.contactno1==phne_no || response.contactno2==phne_no || response.contactno3==phne_no){
		     		   $('#phonespan3').text("Contact number already exists");
		     		  $("#submitid").attr("disabled", true);
		     	   }else{
		     		  $('#phonespan3').text('');
		     		 $("#submitid").attr("disabled", false);  
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
/* var ssnNo=$('#ssn_emp1').html();
$('#ssn_emp').val(atob(ssnNO)); */
</script>
</body>
</html>
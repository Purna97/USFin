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
							<h5 class="card-header">US Onboarding- Add Employees</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-md-8 col-sm-12">
									<input type="hidden" name="emptype" id="emptype" value="${emptype}">
									<input type="hidden" name="role" id="role" value="${role}">
									<input type="hidden" name="dept" id="dept" value="${dept}">
										<fieldset>
										<form action="/" class="form-horizontal" id="formid" enctype="multipart/form-data">
											<h4><b>Employee Details</b></h4>
											<div class="form-group row row" >
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>SSN Number</label>
												<div class="col-sm-4">
													<input id="ssn_emp"  type="text"  autocomplete="off"
													 placeholder="SSN Number" name="ssn_emp" class="form-control" required>
													<span id="ssnshow" style="color: red;"></span>
												</div>
											</div>
											
											<div class="form-group row" style="display:none;" id="appenduser">
											<input type="hidden" name="autouname" id="autouname" value="">
										    </div> 
										    <!-- <div class="form-group row" style="display:none;" id="empnumer">
											<input type="hidden" name="autoempnumer" id="autoempnumer" value="">
										    </div>  -->
											
										     <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>First Name</label>
												<div class="col-sm-4">
													<input id="firstName" type="text"  autocomplete="off"  autocomplete="off" minlength="2" maxlength="40"
													 placeholder="First Name" name="firstName" class="form-control"  required>
												</div><!--  -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Middle Name</label>
												<div class="col-sm-4">
													<input id="middleName" type="text"  minlength="1" maxlength="40"
													title="only alphabets are allowed" 
													 autocomplete="off" placeholder="Middle Name" name="middleName" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Last Name</label>
												<div class="col-sm-4">
													<input id="familyName" type="text" minlength="1" maxlength="40"
													title="only alphabets are allowed" 
													 autocomplete="off" placeholder="Last Name" name="familyName" class="form-control"  required>
												</div>
											</div>
											    <div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Employee Type</label>
											   <div class="col-sm-4">
											     <select name="employee_type" autoComplete="off" class="form-control text-left" id="employee_type" 
											     onchange="mandatoryByEmptype()" required>
										             <option value="">--Select Employee Type--</option>
										             <option value="W2 Admin">W2 Admin</option>
										            <option value="W2">W2</option>
										         </select>
										      </div>
										    </div>
										 <div class="form-group row w2administrationemployees boxx">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Work Authorization</label>
											   <div class="col-sm-4">
											     <select name="work_auth" autoComplete="off" class="form-control text-left" id="work_auth" 
											     required onchange="mandatoryByWorkAuth()">
										             <option value="">--Select type--</option> 
										  			 <c:forEach var="wa" items="${waList}">
														  <option value="${wa.work_auth_name}">${wa.work_auth_name}</option>
													</c:forEach>
										         </select>
										      </div>
										    </div>	
										 
										     <!-- onChange="emp_type()" -->
										    <div class="form-group row w2administrationemployees boxx" id="dept">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;" id="dpt">*</Span>Department</label>
											   <div class="col-sm-4">
											     <select name="w2admin_details" autoComplete="off" class="form-control text-left"   id="w2admin_details" >
										              <option value="">--Select Department--</option> 
										  			  <c:forEach var="dept" items="${deptList}">
														  <option value="${dept.dept_id}">${dept.dept_name}</option>
														</c:forEach> 
										         </select>
										      </div>
										    </div> 
											<div class="form-group row w2administrationemployees boxx" id="rolediv">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;" id="rle" >*</Span>Employee Role</label>
											   <div class="col-sm-4">
											     <select name="w2admin_roles" autoComplete="off" class="form-control text-left" id="w2admin_roles">
										             <option value=""  >--Select Roles--</option>
										             <c:forEach var="role" items="${roleList}" >
														  <option value="${role.role_id}" >${role.role_name}</option>
													</c:forEach>
										         </select>
										      </div>
										    </div>
										    <!-- onchange="reportingHead()" style="display:none;" -->
										    <div class="form-group row"  id="rephead">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;" id="rhd">*</Span>Reporting Head</label>
											   <div class="col-sm-4">
											     <select name="w2emp_rephead" autoComplete="off" class="form-control text-left"  id="w2emp_rephead" >
											       <option value="">--Select Reporting Head--</option>
										            <c:forEach var="rep1" items="${repMagrList}">
														<option value="${rep1.mgrEmpNo}">${rep1.mgrEmpName}</option>
													</c:forEach> 
										         </select>
										      </div>
										    </div> 
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Recruiter Name</label>
												<div class="col-sm-4">
							 						<input id="rec_name" type="text" minlength="2" maxlength="100" 
													
													 autocomplete="off" placeholder="Recruiter Name" name="rec_name" class="form-control"  >
												</div>
											</div>
											<c:choose>
											<c:when test="${hrList.size() > 0}">
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>HR Name</label>
												<div class="col-sm-4">
												 <select name="hr_name" autoComplete="off" class="form-control text-left"  id="hr_name" >
														<option value="">Select HR</option>
														<c:forEach var="hrName" items="${hrList}">
														<option value="${hrName.hrName}">${hrName.hrName}</option>
														</c:forEach>
										         </select>
												</div>
											 </div>
											</c:when>
											<c:otherwise>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>HR Name</label>
												<div class="col-sm-4">
													<input id="hr_name" type="text" minlength="2" maxlength="20" 
													title="only alphabets are allowed" 
													 autocomplete="off" placeholder="HR Name" name="hr_name" class="form-control" >
												</div>
											 </div>
											</c:otherwise>
											</c:choose>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Personal e-mail ID</label>
												<div class="col-sm-4">
													<input id="email_id" type="text" title="Enter Valid e-mail format ex:xyz@gmail.com" minlength="8" maxlength="80"
													 autocomplete="off" placeholder="Personal e-mail ID" name="email_id" class="form-control"   required>
												<Span id="emailspan" style="color:red;"></Span>
												</div>
											</div><!-- pattern="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"  -->
											
										  	 <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Personal Contact No</label>
													<div class="col-sm-4 col-md-4">
													<input id="phne_no" type="text" title="Enter Contact Number" 
													 autocomplete="off" placeholder="Contact number" name="phne_no" class="form-control" required>
													 <Span id="phonespan" style="color:red;"></Span>
												</div>
													<!-- <div class="input-group-btn">
														<button class="btn btn-success btn-sm" type="button" id="btnid"
															onclick="contact_fields();">
															<i class="fa fa-plus" aria-hidden="true"></i>
														</button>
													</div> -->
											</div>
										<!-- 	<div id="contact_fields">
          
       										</div> -->
												
												
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label">Alternative Contact No 1</label>
												<div class="col-sm-4 col-md-4">
													<input id="phne_no2" type="text" title="Enter Contact Number" 
													 autocomplete="off" placeholder="Alternative Contact number 1" name="phne_no2" class="form-control">
													 <Span id="phonespan2" style="color:red;"></Span> 
												</div>
												<div class="col-sm-3 col-md-3" style="padding-right:50px;">
     											 	<label>Work</label>&nbsp;<input type="radio" name="ctype2" value="Work"/>&nbsp;<label>Other</label>&nbsp;<input type="radio" name="ctype2" value="Other"/>
    											</div> 
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label">Alternative Contact No 2</label>
												<div class="col-sm-4 col-md-4">
													<input id="phne_no3" type="text"  title="Enter Contact Number" 
													 autocomplete="off" placeholder="Alternative Contact number 2" name="phne_no3" class="form-control"> <!-- data-masked-input="999-999-9999"  -->
												<Span id="phonespan3" style="color:red;"></Span>
												</div>
												<div class="col-sm-3 col-md-3" style="padding-right:50px;">
     												<label>Work</label>&nbsp;<input type="radio" name="ctype3" value="Work"/>&nbsp;<label>Other</label>&nbsp;<input type="radio" name="ctype3" value="Other"/>
    											</div> 
											</div>
											<!-- data-masked-input="999-999-9999" -->
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Birth</label>
											<div class="col-sm-4">
												<input type="text" id="dob" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="dob" placeholder="Date Of Birth" class="form-control" required >
												
											</div>
											</div>
											
											<h4><b>Employee Address</b></h4>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-4">
													<input id="line1" type="text"  minlength="2" maxlength="40" 
													 autocomplete="off" placeholder="Enter Line1" name="line1" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-4">
													<input id="line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" placeholder="Enter Line2"
													 autocomplete="off" name="line2" class="form-control"  >
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-4">
													<input id="city" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="City" name="city" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-4">
													<input id="state" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="state" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-4">
													<input id="zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" 
													 autocomplete="off" placeholder="Zip Code" name="zipcode" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$"  pattern="\d*"  minlength="5"  maxlength="5" -->
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label">
												<Span id="mand" style="color:red;">*</Span>Date Of Joining</label>
											<div class="col-sm-4">
												<input type="text" id="joining_Date" class="form-control text-left"  autocomplete="off"
												title="Enter date in MM/DD/YYYY format only" onkeydown="return false"
												 name="joining_Date" placeholder="Date Of Joining"  class="form-control">
											</div>
											</div>
											<div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>BGC Type</label>
											   <div class="col-sm-4">
											     <select name="bgc" class="form-control text-left" id="bgc">
										             <option value="">--Select BGC--</option>
										             <option value="PreOnboarding">Pre Onboarding</option>
										             <option value="PostOnboarding">Post Onboarding</option>
										         </select>
										      </div>
										    </div> 
										   <!-- <div class="form-group row" id="dj"  style="display:none;">
												<label for="inputPassword" class="col-sm-4 control-label">
												<Span id="mand" style="color:red;">*</Span>Date Of Joining</label>
											<div class="col-sm-4">
												<input type="text" id="joining_Date" class="form-control text-left"  autocomplete="off"
												title="Enter date in MM/DD/YYYY format only" 
												 name="joining_Date" placeholder="Date Of Joining"  class="form-control">
											</div>
											</div> -->
											
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Title</label>
												<div class="col-sm-4">
													<input id="designation" type="text" autocomplete="off" title="Enter only Characters and numbers"
                                                      placeholder="Designation" name="designation" class="form-control" minlength="4" maxlength="20" > 
												</div><!-- pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="4" maxlength="20"  -->
											</div>
											
											 <div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Billing Type</label>
											   <div class="col-sm-4">
											   		<label>Billable</label>&nbsp;<input type="radio" name="billingType" value="billable"  required/>&nbsp;<label>Non Billable</label>&nbsp;<input type="radio" name="billingType" value="nonbillable" />
													 <br>
												</div>
										    </div>
										    
										    <div class="form-group row" id="pt"> 
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Timesheet Type</label>
											   <div class="col-sm-4">
											   
											   <select name="payrolltype" class="form-control text-left" id="payrolltype">
										             <option value="">--Select Timesheet Type--</option>
										             <option value="Weekly">Weekly</option>
										             <option value="Bi-Weekly1">Bi-Weekly1</option>
										             <option value="Bi-Weekly2">Bi-Weekly2</option>
										             <option value="Semi-Monthly">Semi-Monthly</option>
										             <option value="Monthly">Monthly</option>
										         </select>
										         
											   		<!-- <label>Weekly</label>&nbsp;<input type="radio" name="payrolltype" value="weekly" id="weekly"  required/>&nbsp;<label>Semi-monthly</label>&nbsp;<input type="radio" name="payrolltype" value="semimonthly" id="semimonthly" />
													 <br> -->
												</div>
										    </div>
										    
										    <div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Validation Required By</label>
											   <div class="col-sm-4">
											   		<label>Manager</label>&nbsp;<input type="checkbox" id="mgrvalidate" name="validation" value="Manager" checked disabled/>&nbsp;<label>HR</label>&nbsp;<input type="checkbox" name="validation" id="hrvalidate" value="HR" />&nbsp;<label>Audit</label>&nbsp;<input type="checkbox"  name="validation" id="auditvalidate" value="Audit" />
													 <br>
												</div>
										    </div>
										<input type="hidden"  name="validateby"  id="validateby">
											<!-- 	<div class="form-group row">										
												<div class="col-sm-4 col-lg-offset-2">	
												<input type="button" class="btn btn-default" id="submitid" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Submit" onclick="btnClick(); return false">
												<a href="" class="btn btn-default" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;" id="reset">Reset</a>
												</div>										
											</div> -->
											<div class="text-center ml-5">
												<input type="button" class="btn btn-default" id="submitid" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Submit" onclick="btnClick(); return false">
												<a href="" class="btn btn-default" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;" id="reset">Reset</a>
											</div>
										</form>		
								    </fieldset>
								</div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden"  name="un"  id="un" >
			<input type="hidden"  name="canid"  id="canid" >
			
			
	<form action="searchlist" method="post" id="bformid" style="display:none">
				<input type="hidden"  name="semp_type"  id="etype" value="${semp_type}">
				<input type="hidden" name="susername"  id="euser" value="${susername}">
  	        	<input type="hidden"  name="sfullname"  id="efullname" value="${sfullname}">
			    <input type="hidden"  name="spendingdocs"   id="edocs" value="${spendingdocs}">
			    <input type="hidden" name="s_subtype"  id="esubtpe" value="${s_subtype}">
		  </form> 
			<!-- .animated -->
		</div>
	</div>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true"
				style="top: 150px;">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header" style="padding:.5rem;">
							<center>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b>Employee Details</b>
								</h5>
							</center>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
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
							<button class="btn btn-primary" type="button" id="mybutton"
								value="Go" onclick="submitForm()">
								<strong>Yes</strong>
							</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
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
  "src/main/webapp/"
$("#rle,#dpt,#rhd").hide();
/* function mandatoryByEmptype(){
var employee_type=$('#employee_type').val();
if(employee_type=="W2 Admin"){
	 $("#w2admin_details,#w2admin_roles,#w2emp_rephead").attr("required", true);
	 $("#rle,#dpt,#rhd").show();
 }
else{
		 $("#w2admin_details,#w2admin_roles,#w2emp_rephead").attr("required", false);
		 $("#rle,#dpt,#rhd").hide();
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
 } */
</script>
 <script type="text/javascript">
var emptype=$("#emptype").val(); 
var role=$("#role").val();
var dept=$("#dept").val();

			 /*  $("#bgc").change(function () {
				  if ($(this).val() == "PreOnboarding") {
					  $("#dj").show();
					  $("#mand").show();
					   document.getElementById('joining_Date').required=true;  
		            } else{
		            	 $("#dj").show();
		            	 $("#mand").hide();
		            	document.getElementById('joining_Date').required=false;
		            }
		        }); */
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
                    message: 'SSN is mandatory'
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
            	/* notEmpty: {
                    message: 'First Name is mandatory'
                }, */
                stringLength: {
                    min: 2,
                    max: 40,
                    message: 'Middle Name must be more than 2 and less than 40 characters long'
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
                    message: 'DOB is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'please enter DOB in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY', 
                    message: 'DOB is not a valid, please enter in MM/DD/YYYY format'
                }
            }
        },
        joining_Date: {
            validators: {
                notEmpty: {
                    message: 'Joining date is required'
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
                    message: 'Please Choose reporting head'
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
                    message: 'Recruiter Name can only accept alphabetical and Space allowed but is not at beginning or end of the word'
                },
            }
        },
        hr_name: {
            validators: {
            	isEmpty: {
                    message: 'HR Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 20,
                    message: 'HR Name must be more than 2 and less than 20 characters long'
                },
                regexp: {
                	regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                    message: 'HR Name can only accept alphabetical and Space allowed but is not at beginning or end of the word'
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
                    message: 'Contact Number should be 10 numbers'
                },
                regexp: {
                   regexp: /^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$/,
                   message: 'Please enter valid Contact Number'
                },
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
                  message: 'Line1 name accepts alpha numerics '
                },
            }
        },
        line2 : {
            validators: {
            	 /* notEmpty: {
                    message: 'Line1 name is mandatory'
                }, */
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line2 name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 name accepts alpha numerics '
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
                   message: 'State name accepts character'
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
        ctc : {
            validators: {
            	notEmpty: {
                    message: 'Salary is mandatory'
                },
                stringLength: {
                    min: 4,
                    max: 7,
                    message: 'Salary must be min length 4 and max length 7'
                },
                regexp: {
                	regexp: /^[0-9]*$/,
                    message: 'Salary can accepts only digits'
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
                    message: 'Title min length 4 and max length 20 '
                },
                regexp: {
                	regexp: /^(?!\d\s+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &():\/\\-]*)?$/,
                    message: 'Title accepts alphanumeric, specical characters like &-()/: allowed and Space allowed but is not at beginning or end of the word'
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
        	//enabled: false,
            validators: {
            	notEmpty: {
                    message: 'Please Choose timesheet type'
                }
            }
        },
        validateby:{
            validators: {
            	notEmpty: {
                    message: 'Please check validate by'
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
    var employee_type =$("#employee_type").val();
    if (employee_type=='W2 Admin') {
		   $('#formid').bootstrapValidator('enableFieldValidators','w2admin_details',true);
		   $('#formid').bootstrapValidator('enableFieldValidators','w2admin_roles',true);
		   $('#formid').bootstrapValidator('enableFieldValidators','w2emp_rephead',true);
    } else {
    	 var professionVal = $("select[name='w2admin_roles']");
			 	professionVal.find('option[value="1"]').attr('selected', true);
			
    	   $('#formid').bootstrapValidator('enableFieldValidators','w2admin_details',false);
		  /*  $('#formid').bootstrapValidator('enableFieldValidators','w2admin_roles',false);
		   $('#formid').bootstrapValidator('enableFieldValidators','w2emp_rephead',false); */

		   $('#formid').bootstrapValidator('enableFieldValidators','w2admin_roles',true);
		   $('#formid').bootstrapValidator('enableFieldValidators','w2emp_rephead',true);
         } 
     })
     .on('change', '[name="work_auth"]', function(e) {
    var work_auth =$("#work_auth").val();
    if(work_auth=="H-1B" || work_auth=="L1" || work_auth=="OPT" || work_auth=="CPT" || work_auth=="EAD"){
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
 .on('click', '[name="ctype3"]', function(e) {
	 	var ctype3=$("input[name='ctype3']:checked").val();
	if (ctype3!=""){
		   $('#formid').bootstrapValidator('enableFieldValidators','phne_no3',true);
	   }else{
		   $('#formid').bootstrapValidator('enableFieldValidators','phne_no3',false);
	   }
  })
  
  
  //
/* .on('keyup', '[name="email_id"]', function(e) {
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
    		   //$('#emailspan').text("Email id not available");
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
		  // $('#formid').bootstrapValidator('enableFieldValidators','w2admin_details',true);
    })  */
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
}); */
$("#pt").hide();
$("#w2admin_roles,#w2admin_details").attr("readonly",false);
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
			 //$("#w2admin_details,#w2admin_roles,#w2emp_rephead").attr("required", false);
			 //$("#rle,#dpt,#rhd").hide();
			 $("#payrolltype").attr("required", false);
			 $("#w2admin_roles,#w2emp_rephead").attr("required", true);
			  $("#rle,#rhd").show();
			 $("#dpt,#pt").hide();$("#payrolltype").attr("required", false);
	     }
	 }

	function mandatoryByWorkAuth(){
	var work_auth=$('#work_auth').val();
	if(work_auth=="H-1B" || work_auth=="L1" || work_auth=="OPT" || work_auth=="CPT" || work_auth=="EAD"){
		 $("#w2emp_rephead").attr("required", true);
		 $("#rhd").show();
	 }
	else{
			 $("#w2emp_rephead").attr("required", false);
			 $("#rhd").hide();
	    }
	 }
 
</script>    
<script>
	$("#joining_Date").attr("disabled", true);
	var date = new Date();
	date.setDate(date.getDate()); 
	if(dept==1 && emptype=="Admin" && role==4){ 
	$(document).ready(function(){
		$("#joining_Date").datepicker({
			changeMonth:true,
			changeYear:true,
		})
			.on('changeDate', function(e) {
	            // Revalidate the date field
	            $('#formid').formValidation('revalidateField', 'joining_Date');
		});	
		 $("#dob").on('change', function(){
	    	   var dob1=$('#dob').val();
	    	   if(dob1!=""){
	    	     var minDate=new Date(dob1);
	    	     $('#joining_Date').datepicker('setStartDate', minDate);
	    	   }else{
	    		   $("#joining_Date").attr("disabled", true);
	    		   $('#joining_Date').val('').datepicker('update');
	    	   }
	    });
		$("#dob").datepicker({
			changeMonth:true,
			changeYear:true,
			minDate: "-70Y",
			endDate: date,
			yearRange: "1950:2000" 
		}).on('changeDate', function(selected) {
		     $("#joining_Date").attr("disabled", false);
		    $('#formid').formValidation('revalidateField', 'dob');
		});
	});
  } 
	 else if(dept==2&&emptype=="W2 Admin"&&role==2){ 
		$(document).ready(function(){
			$("#submitid").attr("disabled",true);
			$("#reset").attr("disabled",true);
			//$("#rolediv").hide();
			
			$("#employee_type").children('option:gt(0)').show();
			$("#w2admin_details").children('option:gt(0)').show();
			$("#w2admin_roles").children('option:gt(0)').show();
			$("#w2emp_rephead").children('option:gt(0)').show();
			$("#dob").children('option:gt(0)').show();
			$("#joining_Date").children('option:gt(0)').show();				 
		});
}
/* function getsesVal() {
	return $.ajax({
    	   type : "GET",
    	   asyn : false,
          contentType: "application/json", // NOT dataType!
    	   url:"checkSessionUserName", 
		   success:function(data) {
		    }
	  });
} */	
function btnClick(){
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
		
		var employee_type=$('#employee_type').val();
	    var fullname = document.getElementById("firstName").value;
		var  middleName = document.getElementById("middleName").value;
		var familyName = document.getElementById("familyName").value;
			 $.ajax({
			    	type : "GET",
			        asyn : false,
			        contentType: "application/json", // NOT dataType!
			        data:{fullname:fullname,middleName:middleName,familyName:familyName},
		        	url:"checkUserName", 
			        success  : function(response){
			        	$('#fName').text(fullname);
			        	$('#mName').text(middleName);
			        	$('#sName').text(familyName);
			        	$('#uname').text(response.toLowerCase());
			        	$('#autouname').val(response);
			        	$('#myModal').modal('show');
			        }
				    }); 
	}
	}
}else{
			 window.location.href="loginpage";
		  }
      });
}
function submitForm(){
	 getsesVal().done(function(data){
	 if(data!=""){
	//document.getElementById("formid").submit();
	var mgrvalidate=$('#mgrvalidate').is(":checked");
	var hrvalidate=$ ('#hrvalidate').is(":checked");
	var auditvalidate=$('#auditvalidate').is(":checked");
	/* var etype=$('#employee_type').val();
	if(etype=="W2"){
		 $('#formid').bootstrapValidator('enableFieldValidators', 'payrolltype',false);
	}
	else{
		 $('#formid').bootstrapValidator('enableFieldValidators', 'payrolltype',true);
	}
 */

	if(mgrvalidate==true && hrvalidate==true && auditvalidate==true){
		$('#validateby').val(3);
		}else if(mgrvalidate==true && hrvalidate==true){
			$('#validateby').val(2);
			}else{
				$('#validateby').val(1);
				}
	$ ('#myModal').hide();
	$("#submitid").attr("disabled",true);
		 var form = $('#formid')[0];
	     var data = new FormData(form);
		$.ajax({
	            url: "saveEmployees", //this is the submit URL
	            type: "POST",
	            enctype: 'multipart/form-data',
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            success: function(response){
	   	        if(response!=null || response!=""){
		   	        var message=response.message;
		   	        var candidateId=response.candidateId;
		   	        var docstatus=response.docstatus;
		   	   		var empType=response.empType;
	   	            alert(message);
	   	            if(docstatus==0){
	   	            	window.location.href="addEmpDocuments?candidate_id="+candidateId+"&empType="+empType+"";
	   	   	         }
	   	           }
	   	            else{
	   	          window.location.href="loginpage";
	   	   	            }
	            }
	        });
	 }else{
		 window.location.href="loginpage";
	 }
   });
	}
	function  getEmployee(){
		var un=$('#un').val();
		var canid=$('#canid').val();
		getsesVal().done(function(data){
			if(data!=""){
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
	
function closeModal(){
	$ ('#myModal').hide();
	$ ('#submitid').show();
}	
	</script>
	
<!-- <script type="text/javascript">
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
	        	for(var i=0;i<response.length;i++)
	     	  {
	        		$('#w2emp_rephead').append($('<option/>').attr("value", response[i].emp_number).text(response[i].empName));
	        }
	        	$('#rephead').show();	
	        }
		    
		    });
	 
	 }
</script> -->
<script type="text/javascript">
 function autoEmpNumber(){
	 var employee_type=$('#employee_type').val();
	/*     if(employee_type=="W2 Admin"){
	    	// $('#rolediv').show();
	    }
	    else{
	    	// $('#rolediv').hide(); 
	    } */
	   	    $.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "application/json", // NOT dataType!
	        url  : "checkEmpNumber",
	        success  : function(response){
	        $('#autoempnumer').val(response.emp_number);
	        }
		    });
	   	
	 }
</script>
<!-- 
<script type="text/javascript">
function emp_type()
{
	 	var employee_type = document.getElementById("employee_type").value;
		if (employee_type=="W2AdministrationEmployees") 
		{ 
		$('#rolediv').hide();
		
		}
		else if (employee_type=="W2Employees") 
		{ 
		$('#rolediv').hide();
		$('#rephead').hide();
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
	 var ssn_emp=$('#ssn_emp').val();
	 getsesVal().done(function(data){
    	 if(data!=""){
	    if(ssn_emp==""){
	    	 $('#ssnshow').text('');
	    	 $("#submitid").attr("disabled", false);
	    }else{
	    var regex = new RegExp("^(?!\\b(\\d)\\1+-(\\d)\\1+-(\\d)\\1+\\b)(?!123-45-6789|219-09-9999|078-05-1120)(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$");
	    if(!regex.test(ssn_emp)){
	    	   $('#ssnshow').html("<font color=red>Not a valid SSN</font>");
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
	        		//atob(decodeURIComponent(response.ssn_no))
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
	       	        		$('#ssnshow').html("<font color=#009900>Valid SSN number</font>");		       	        		      	        		
	       	        		$("#reset").attr("disabled", false);
	       	        		$("#submitid").attr("disabled", false);
	           			}
	   	          } 
	   	        	}   });//emptype response ends here
	   	        
	   	        	}
	   	 	    
	   	        	else{
	   	        		$('#ssnshow').html("<font color=#009900>Valid SSN number</font>");	   	        	
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


var emailInput = document.getElementById('email_id');
var emailtimeout = null;
emailInput.onkeyup = function (e) {
clearTimeout(emailtimeout);
emailtimeout = setTimeout(function () {
	 var email_id=$('#email_id').val();
	 getsesVal().done(function(data){
 		if(data!=""){
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
	    		    	   if(response==email_id){
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
	 var phne_no=$('#phne_no').val();
	 getsesVal().done(function(data){
 		if(data!=""){
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
		        	if(response.contactno1==phne_no || response.contactno2==phne_no || response.contactno3==phne_no){
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
	 var phne_no=$('#phne_no2').val();
	 getsesVal().done(function(data){
 		if(data!=""){
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
		        	
		        	if(response.contactno1==phne_no || response.contactno2==phne_no || response.contactno3==phne_no){
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
	 var phne_no=$('#phne_no3').val();
	 getsesVal().done(function(data){
 		if(data!=""){  
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
		        	
		        	if(response.contactno1==phne_no || response.contactno2==phne_no || response.contactno3==phne_no){
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



 
</script> 
</body>
</html>
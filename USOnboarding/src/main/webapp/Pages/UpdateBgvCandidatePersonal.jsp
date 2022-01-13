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
/* .form-control[readonly] {
    background-color: white;
 } */
.col-sm-2 {
	flex: 0 0 14.666667%;
    max-width: 23.666667%;
}
</style>
<body class="sidebar-mini fixed">
<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
						<center><h5 class="card-header">Add Personal Details</h5></center>
							<div class="card-body">
								<div class="row">
								<div class="col-md-11 col-sm-12">
									<fieldset>
										<form action="/" method="post" id="updatePersonalDetailsForm" class="form-horizontal" enctype="multipart/form-data" autocomplete="off">
										
										  <input type="hidden" name="candidate_id" id="candidate_id" value="${personalDetailsObj.candidate_id}">
										 <%--   <input type="hidden" name="profileId" id="profileId" value="${profileId}"> --%>
										   <input type="hidden" name="empType" id="empType" value="${emptype}">
										  <input type="hidden" name="verifier_personal_statusId" id="verifier_personal_statusId" value="${personalDetailsObj.candformsStatus.verifier_personal_status}">
										  <input type="hidden" name="titleName1" id="titleName1" value="${personalDetailsObj.title}">
										  <input type="hidden" name="firstName1" id="firstName1" value="${personalDetailsObj.first_name}">
										  <input type="hidden" name="middleName1" id="middleName1" value="${personalDetailsObj.middle_name}">
										  <input type="hidden" name="familyName1" id="familyName1" value="${personalDetailsObj.last_name}">
										  <input type="hidden" name="fatherName1" id="fatherName1" value="${personalDetailsObj.father_name}">
										  <input type="hidden" name="nationality1" id="nationality1" value="${personalDetailsObj.nationality}">
										  <input type="hidden" name="contactTeleNo1" id="contactTeleNo1" value="${personalDetailsObj.contact_no}">
										  <input type="hidden" name="mobile1" id="mobile1" value="${personalDetailsObj.mobile_number}">
										  <input type="hidden" name="email1" id="email1" value="${personalDetailsObj.email_id}">
										  <input type="hidden" name="genderType1" id="genderType1" value="${personalDetailsObj.gender}">
										  <input type="hidden" name="dob1" id="1dob" value="${personalDetailsObj.dob}">
										  <input type="hidden" name="ssn_emp1" id="ssn_emp1" value="${personalDetailsObj.ssn_no}">
										  <input type="hidden" name="candidate_status" id="candidate_status" value="${personalDetailsObj.candidate_status}">
										 
											<!--  <legend><i class="fa fa-line-chart"></i>Raise NC</legend>  -->
	                                        <h4><b>Personal Details</b></h4>
	                                        <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>	Title:</label>
												 <div class="col-sm-2">
													 <select name="titleName" id="titleName" class="form-control" required>
													 <option value="">Select Title</option>
													<option value="Mr.">Mr.</option>
													<option value="Mrs.">Mrs.</option>
													<option value="Miss">Miss</option>
													<option value="Ms.">Ms.</option>
													<option value="Dr.">Dr.</option>
												  </select>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>First Name</label>
												<div class="col-sm-4">
													<input id="firstName" type="text"  autocomplete="off"  autocomplete="off" minlength="2" maxlength="40"
													 placeholder="First Name" name="firstName" class="form-control" value="${personalDetailsObj.first_name}" required>
												</div><!--  -->
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Middle Name</label>
												<div class="col-sm-4">
													<input id="middleName" type="text"  minlength="1" maxlength="40"
													title="only alphabets are allowed" 
													 placeholder="Middle Name" name="middleName" class="form-control" value="${personalDetailsObj.middle_name}">
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Last Name</label>
												<div class="col-sm-4">
													<input id="familyName" type="text" minlength="1" maxlength="40"
													title="only alphabets are allowed" 
													 placeholder="Last Name" name="familyName" class="form-control" value="${personalDetailsObj.last_name}"  required>
												</div>
											</div> 
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Father's Name</label>
												<div class="col-sm-4">
													<input id="fatherName" type="text"  minlength="2" maxlength="40"
													 placeholder="Father's Name" name="fatherName" class="form-control" value="${personalDetailsObj.father_name}" required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Nationality</label>
												<div class="col-sm-4">
													<input id="nationality" type="text"  minlength="2" maxlength="40"
													 placeholder="Nationality" name="nationality" class="form-control" value="${personalDetailsObj.nationality}"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Date Of Birth</label>
											<div class="col-sm-4">
												<input type="text" id="dob" class="form-control text-left"     autocomplete="off"
												title="Enter date in MM/DD/YYYY format only" name="dob" placeholder="Date Of Birth" class="form-control" value="${personalDetailsObj.dob}" required >
												
											</div>
											</div>
											
											 <div class="form-group row"><%-- value="${personalDetailsObj.gender}" --%>
											<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Gender</label>
											   <div class="col-sm-4">
											   		<c:choose>
											       <c:when test="${personalDetailsObj.gender eq 'Male'}">
												   <label>Male</label>&nbsp;<input type="radio" name="genderType" value="Male"checked/>&nbsp;<label>Female</label>&nbsp;<input type="radio" name="genderType" value="Female" />
													</c:when>
													<c:otherwise>
													<label>Male</label>&nbsp;<input type="radio" name="genderType" value="Male" />&nbsp;<label>Female</label>&nbsp;<input type="radio" name="genderType" value="Female" checked/>
													</c:otherwise>
											    </c:choose>
											   		
											   		
													 <br>
												</div>
										    </div>
											
											<div class="form-group row" >
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>SSN Number</label>
												<div class="col-sm-4">
													<input id="ssn_emp"  type="text"  autocomplete="off"
													 placeholder="SSN Number" name="ssn_emp" class="form-control"  value="${personalDetailsObj.ssn_no}" required>
													<span id="ssnshow" style="color: red;"></span>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Contact Telephone No.(Specify Location Codes)</label>
												<div class="col-sm-4">
													<input id="contactTeleNo" type="text" 
													 autocomplete="off" placeholder="Contact Telephone No" name="contactTeleNo" class="form-control" value="${personalDetailsObj.contact_no}" required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Mobile</label>
												<div class="col-sm-3">
													<input id="mobile" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Mobile" name="mobile" class="form-control" value="${personalDetailsObj.mobile_number}" required>
												</div>
												<label for="inputPassword" class="col-sm-2 control-label"><Span style="color:red;">*</Span>Email Address</label>
												<div class="col-sm-3">
													<input id="email" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Email Address" name="email" class="form-control" value="${personalDetailsObj.email_id}" required>
												</div>
											</div>
											
									  <c:forEach var="addressList" items="${personalDetailsObj.addressList}">
									  <input type="hidden" name="contact_id" id="contact_id" value="${addressList.contact_id}">		
									  <input type="hidden" id="otherline11${addressList.contact_id}" value="${addressList.line1}">
                                      <input type="hidden" id="otherline21${addressList.contact_id}" value="${addressList.line2}">
                                      <input type="hidden" id="othercity21${addressList.contact_id}" value="${addressList.city}">
                                      <input type="hidden" id="otherstate21${addressList.contact_id}" value="${addressList.state}">
                                      <input type="hidden" id="otherzipcode21${addressList.contact_id}" value="${addressList.zipcode}">
                                      <input type="hidden" id="21otherfromdate${addressList.contact_id}" value="${addressList.from_date}">
                                      <input type="hidden" id="21othertodate${addressList.contact_id}" value="${addressList.to_date}">
                                      
                                      <h4><b>Contact Details</b></h4><br>
										<!-- 	<h5><b>Current Residential Address</b></h5> -->
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-5">
													<input id="line1${addressList.contact_id}" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="line1" class="form-control" value="${addressList.line1}" required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-5">
													<input id="line2${addressList.contact_id}" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" placeholder="Enter Line2"
													 autocomplete="off" name="line2" class="form-control" value="${addressList.line2}" >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-5">
													<input id="city${addressList.contact_id}" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"     
													 autocomplete="off" placeholder="City" name="city" class="form-control" value="${addressList.city}"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-5">
													<input id="state${addressList.contact_id}" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="state" class="form-control" value="${addressList.state}" required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-5">
													<input id="zipcode${addressList.contact_id}" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" 
													 autocomplete="off" placeholder="Zip Code" name="zipcode" class="form-control" value="${addressList.zipcode}"  required>
												</div>
											</div> 
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Period of Stay</label> 
												<div class="col-sm-3">
													<input id="fromDate${addressList.contact_id}" type="text" placeholder="From Date" 
													name="fromDate" class="form-control" value="${addressList.from_date}" onkeydown="return false" required>
												</div>
												<div class="col-sm-3">
													<input id="toDate${addressList.contact_id}" type="text"  placeholder="To Date" 
													name="toDate" class="form-control" value="${addressList.to_date}" onkeydown="return false" required>
												</div>
											</div>
											<br>
											</c:forEach>
											
											<c:choose>
											<c:when test="${emptype eq 'W2 Admin' || emptype eq 'Admin'}">
											 <div class='form-group row'>
                                       			<label for="inputPassword" class="col-sm-3 control-label">Add Other Address Details</label>
												<div class="col-xs-4">
													<button type="button" class="btn btn-success addButton" disabled>
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                        	</div>
											</c:when>
											<c:otherwise>
											 <div class='form-group row' id="add">
                                       			<label for="inputPassword" class="col-sm-3 control-label">Add Other Address Details</label>
												<div class="col-xs-4">
													<button type="button" id="addButtonId" class="btn btn-success addButton">
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                       		 </div>
											</c:otherwise>
											</c:choose>
											
									 
									 	<div id="addotherOther" class="form-group" style="display:none;">
												<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-5">
													<input id="othr_line1" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="othr_line1[]" class="form-control"  required>
												</div>
												<div class="col-xs-4">
													<button type="button" class="btn btn-danger removeButton">
														<i class="fa fa-minus"></i>
													</button>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-5">
													<input id="col-sm-5" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" placeholder="Enter Line2"
													 autocomplete="off" name="othr_line2[]" id="othr_line2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-5">
													<input id="othr_city" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="City" name="othr_city[]" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-5">
													<input id="othr_state" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="othr_state[]" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-5">
													<input id="othr_zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" 
													 autocomplete="off" placeholder="Zip Code" name="othr_zipcode[]" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Period of Stay</label>
												<div class="col-sm-3">
													<input id="othr_fromDate" type="text" placeholder="From Date" name="othr_fromDate[]" 
													class="form-control datepicker"  onkeydown="return false" required>
												</div>
												<div class="col-sm-3">
													<input id="othr_toDate" type="text"  placeholder="To Date" name="othr_toDate[]" 
													class="form-control datepicker" onkeydown="return false" required>
												</div>
											</div>
											</div> 
											
											<!-- <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-4">
													<input id="line1" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="line1" class="form-control"  required>
												</div>pattern="^[a-zA-Z\s]+$"
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-4">
													<input id="line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" placeholder="Enter Line2"
													 autocomplete="off" name="line2" class="form-control"  >
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-4">
													<input id="city" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="City" name="city" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-4">
													<input id="state" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="state" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-4">
													<input id="zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" 
													 autocomplete="off" placeholder="Zip Code" name="zipcode" class="form-control"  required>
												</div>
											</div> -->
											
											
											<%-- <center><h5><b>Previous/Permanent  Residential Address</b></h5></center>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-4">
													<input id="line1" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="line1" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-4">
													<input id="line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" placeholder="Enter Line2"
													 autocomplete="off" name="line2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-4">
													<input id="city" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="City" name="city" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-4">
													<input id="state" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="state" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-4">
													<input id="zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" 
													 autocomplete="off" placeholder="Zip Code" name="zipcode" class="form-control"  required>
												</div>
											</div> --%>
											<c:choose>
											<c:when test="${emptype eq 'W2 Admin' || emptype eq 'Admin'}">
											<div class="text-center ml-3" style="display: none;">
												<!-- <input type="button" class="btn btn-default" id="btnUpdate" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Update"  disabled onclick="btnClick()"> -->
												<button type="button" class="btn btn-default" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;" onclick="window.close();">Cancel</button> 
											</div>
											</c:when>
											<c:otherwise>
											<div class="text-center ml-3">
												<input type="button" class="btn btn-default" id="btnUpdate" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Update"  disabled onclick="btnClick()">
												<a class="btn btn-default" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;" href="bgvFormsUser">Back</a> 
											</div>
											</c:otherwise>
											</c:choose>
											
										</form>
									</fieldset>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
				<c:if test="${emptype eq 'W2 Admin' || emptype eq 'Admin'}">
			<form class='form form-horizontal validate-form'
						action="/" id="updatepersonalStatus" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="CbgcCandidateId" name="candidate_id">
			 <div class="form-group row">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Select Status</label>
									<div class="col-sm-5">
												<select id="capprstatus" name="status" class="form-control" required>
												<option value="">-Select Status-</option>
												<c:choose>
												<c:when test="${personalDetailsObj.candformsStatus.verifier_personal_status eq 'Approved'}">
												<option value="Approved" ${'Approved' eq personalDetailsObj.candformsStatus.verifier_personal_status ? 'selected="selected"' : ''}>Approved</option>
												<option value="Rejected" ${'Rejected' eq personalDetailsObj.candformsStatus.verifier_personal_status ? 'selected="selected"' : ''}>Reject</option>
												</c:when>
												<c:when test="${personalDetailsObj.candformsStatus.verifier_personal_status eq 'Rejected'}">
												<option value="Approved" ${'Approved' eq personalDetailsObj.candformsStatus.verifier_personal_status ? 'selected="selected"' : ''}>Approve</option>
												<option value="Rejected" ${'Rejected' eq personalDetailsObj.candformsStatus.verifier_personal_status ? 'selected="selected"' : ''}>Rejected</option>
											</c:when>
											<c:otherwise>
												<option value="Approved" ${'Approved' eq personalDetailsObj.candformsStatus.verifier_personal_status ? 'selected="selected"' : ''}>Approve</option>
												<option value="Rejected" ${'Rejected' eq personalDetailsObj.candformsStatus.verifier_personal_status ? 'selected="selected"' : ''}>Reject</option>
											</c:otherwise>
												</c:choose>
												</select>
											</div>
								</div> 
					       <div class="form-group row">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Comments</label>
									<div class="col-sm-5">
										<textarea type="text"  id="candicomments" name="comment" rows="4" cols="50" minlength="2"
										 placeholder="Enter Comment"  class="form-control" required></textarea>
									</div>
									<div class="col-sm-0">
									<button type="button" style='letter-spacing: 1px; background-color: #15aabf; color: white;' id="CchistoryId" onclick="viewCommentHistory()" data-toggle="modal"type="button"  data-toggle="modal" ><i class="fa fa-history"></i></button>
									</div>
							</div> 
							
							<div class="text-center ml-3">
								<button type="button" class="btn btn-info btn-sm" onclick="updatepersonalstatus()">Submit</button>
								<a class="btn btn-info btn-sm" id="btn-colorb" href="contractspanel">Back</a>
								</div>
		</form></c:if>
		<div class="modal fade" id="commenthistoryModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 160px;">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content" style="width:100%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Comment History Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="/" id="saveCommentsForm" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<div class="modal-body">							
					       <table id="CommentHistoryTable" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>Status</th>
								<th>Comments</th>
								<th>Submitted Date</th>
								<th>Submitted By</th>
								</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	
	<!-- <div class="content-wrapper" id="listdiv"> -->
	<%-- <div class="row">
		<div class="col-md-12">
			<div class="card" id="dataTBL">
				<div class="card-body">
					<div style="text-align: center;">
					</div>
					<!-- 	<form action="" method="post"> -->
					<div style="max-width:1150px;" >
					<center><span><strong style="font-size:20px;color:red;">Customer Details</strong></span></center>
					<table id="customerTable" class="table table-hover table-bordered"
						style="text-align: center;">
						<thead>
							<tr>
								<th style="text-align: center">Name</th>
								<th style="text-align: center">Federal ID</th>
							     <th style="text-align: center">Address</th>
							     <th style="text-align: center">Person Contact No</th>
								<th style="text-align: center">Manager e-Mail ID</th>
								 <th style="text-align: center">Action</th>  
							</tr>
						</thead>
						<tbody>
					<c:forEach var="custl" items="${cutomerList}">
						 	 <tr>   
							    <td>${custl.companyName}</td>
							    <td>${custl.companyfedId}</td>
							    <td>${custl.line1}, ${custl.line2}, ${custl.city}, ${custl.state}, ${custl.zipcode}</td>
							    <td>${custl.company_contactperson}</td>
							    <td>${custl.company_mgr_email}</td>
							    <td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											onclick="editCustomer(${custl.companyId});">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</button></td> 
							     
							</tr>
						  </c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</div>
	</div>
	 --%>
	  <div id="myModal" class="modal"
				style="height: 80px; width: 400px; align-items: center; top: 40%; left: 40%;">
				<div class="modal-content" id="popup-modal"
					style="background: #205081; color: #fff !important;">

					<p id="addsummaryfields" style="color: #fff" class="text-center"></p>
					<button class="close" id="closePopupSave" style="color: #fff">
						<i class="far fa-times-circle"></i>
					</button>
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
<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
<script src="resources/preDefined/goback.js"></script>
<script type="text/javascript">

/* $('input[type=file]').change(function(e){
	  $in=$(this);
	  $in.next().html($in.val());
	}); */
	
	$('#titleName').on('keyup', function() {
        if($('#titleName').val()==$('#titleName1').val())
               {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}   });
	$('#firstName').on('keyup', function() {
        if($('#firstName').val()==$('#firstName1').val())
               {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}   });
 $('#middleName').on('keyup', function() {
               if($('#middleName').val()==$('#middleName1').val())
                      {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} });
 $('#lastName').on('keyup', function() {
               if($('#lastName').val()==$('#lastName1').val())
                      {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
 $('#fatherName').on('keyup', function() {
     if($('#fatherName').val()==$('#fatherName1').val())
            {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
 $('#ssn_emp').on('keyup', function() {
               if($('#ssn_emp').val()==$('#ssn_emp1').val())
                      {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
 $('#contactTeleNo').on('keyup', function() {
        if($('#contactTeleNo').val()==$('#contactTeleNo1').val())
               {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
 $('#email').on('keyup', function() {   
        if($('#email').val()==$('#email1').val())
               {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
 $('#mobile').on('keyup', function() {
        if($('#mobile').val()==$('#mobile1').val())
               {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
 
 $('#nationality').on('keyup', function() {
 	if($('#nationality').val()==$('#nationality1').val())
 		{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
  
 $('#dob').on('change', function() {
 	if($('#dob').val()==$('#1dob').val())
 		{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
 
 $("input[name='genderType']").on('click', function() {
     if($("input[name='genderType']:checked").val()==$('#genderType1').val())
 	{
     	 document.getElementById('btnUpdate').disabled=true;
 	}else if($("input[name='genderType']:checked").val()!=$('#genderType1').val()){
 		document.getElementById('btnUpdate').disabled=false;
 	}
   });
 
 
	
	 $("[id='contact_id']").each(function(){
		 var id=$(this).val();
		 $('#line1'+id).on('keyup', function() {
		 	 if($('#line1'+id).val()==$('#otherline11'+id).val())
		 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
		   });
		 $('#line2'+id).on('keyup', function() {
		 	 if($('#line2'+id).val()==$('#otherline21'+id).val())
		 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
		   });
		 
		 $('#othercity'+id).on('keyup', function() {
		 	 if($('#city'+id).val()==$('#othercity21'+id).val())
		 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
		   });
		 $('#state'+id).on('keyup', function() {
		 	 if($('#state'+id).val()==$('#otherstate21'+id).val())
		 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
		  });
		  $('#zipcode'+id).on('keyup', function() {
		 	 if($('#zipcode'+id).val()==$('#otherzipcode21'+id).val())
		 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
		   });
		  
	 	  $('#fromDate'+id).on('change', function() {
			 	 if($('#fromDate'+id).val()==$('#21otherfromdate'+id).val())
			 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
			   });
		  $('#toDate'+id).on('change', function() {
			 	 if($('#toDate'+id).val()==$('#21othertodate'+id).val())
			 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
			   });
		 
		 $("#fromDate"+id).datepicker({
		 }).on('changeDate', function(selected) {
		 	 var minDate = new Date(selected.date.valueOf());
		      $('#toDate'+id).datepicker('setStartDate', minDate);
		     $('#updatePersonalDetailsForm').formValidation('revalidateField', 'fromDate');
		 });	
		 $("#toDate"+id).datepicker({
		 }).on('changeDate', function(selected) {
		 	 	var minDate = new Date(selected.date.valueOf());
		         $('#fromDate'+id).datepicker('setEndDate', minDate);
		     $('#updatePersonalDetailsForm').formValidation('revalidateField', 'toDate');
		 });	
		 
});	

	
	
function btnClick(){
	getsesVal().done(function(data){
		if(data!=""){
	$('#updatePersonalDetailsForm').formValidation('validate');
	if( !$('#updatePersonalDetailsForm').data('formValidation').isValid())
		 {
		 }
	else{
		  //document.getElementById("saveCustomerForm").submit();
		  $("#btnUpdate").attr("disabled", true);
				var form = $('#updatePersonalDetailsForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "updateCandidatePersonalDetails", //this is the submit URL
					type : "POST",
					enctype : 'multipart/form-data',
					data : data,
					processData : false,
					contentType : false,
					cache : false,
					success : function(data) {
						 if(data!=null || data!=""){
			   	            	$('#addsummaryfields').html(data);
			   	         	    $('#myModal').modal('show');
			   	   	         }
			   	   	      else{
			   	   	          window.location.href="loginpage";
			   	   	   	      }
					}
				});
		}
		}else{ window.location.href="loginpage";}});
	}
$("#closePopupSave").click(function(event) {
	getsesVal().done(function(data){
		if(data!=""){
	$('#myModal').modal('hide');
	var candId=$('#candidate_id').val();
    window.location.href="viewpersonaldetails?candidateId="+candId+"";
}else{ window.location.href="loginpage";}});
});
</script>
<script type="text/javascript">
var othercl=0;
var MAX_OPTIONS = 3;
$('#updatePersonalDetailsForm')
.on('init.field.bv', function(e, data) {
            var field  = data.field,        // Get the field name
                $field = data.element,      // Get the field element
                bv     = data.bv;           // BootstrapValidator instance

            // Create a span element to show valid message
            // and place it right before the field
            var $span = $('<small/>')
                            .addClass('help-block validMessage')
                            .attr('data-field', field)
                            .insertAfter($field)
                            .hide();

            // Retrieve the valid message via getOptions()
            var message = bv.getOptions(field).validMessage;
            if (message) {
                $span.html(message);
            }
})
.formValidation({
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
          fatherName: {
              validators: {
              	notEmpty: {
                      message: 'Father Name is mandatory'
                  },
                  stringLength: {
                      min: 1,
                      max: 40,
                      message: 'Father Name must be more than 1 and less than 40 characters long'
                  },
                  regexp: {
                  	regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                      message: 'Father Name accepts alphabets and Space allowed but is not at beginning or end of the word'
                  },
              }
          },
          nationality: {
              validators: {
              	notEmpty: {
                      message: 'Nationality is mandatory'
                  },
                  stringLength: {
                      min: 2,
                      max: 100,
                      message: 'Nationality must be more than 2 and less than 100 characters long. '
                  },
                  regexp: {
                  	 regexp: /^(?!\s)(?:([a-zA-Z])[a-zA-Z ]*)?$/,
                       message: 'Nationality accepts alphabetical and Space allowed but is not at beginning or end of the word'
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
          email: {
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
          mobile : {
              validators: {
              	notEmpty: {
                      message: 'Mobile number is mandatory'
                  },
                  stringLength: {
                      min: 12,
                      max: 12,
                      message: 'Mobile Number should be 10 numbers'
                  },
                  regexp: {
                     regexp: /^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$/,
                     message: 'Please enter valid Mobile Number'
                  },
              }
          },
          genderType:{
              validators: {
              	notEmpty: {
                      message: 'Please Choose Gender'
                  }
              }
          },
          titleName:{
              validators: {
              	notEmpty: {
                      message: 'Please Choose Title'
                  }
              }
          },
          contactTeleNo:{
              validators: {
              	notEmpty: {
                      message: 'Contact Number is mandatory'
              	 },
                   stringLength: {
                   min: 12,
                   max: 12,
                   message: 'Contact Number must be more 10 or Not less than 10 Numbers long'
                  }
              }
        },
        line1 : {
            validators: {
            	 notEmpty: {
                    message: 'Line1 is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line1 should have minimum 2 and maximum 80 characters '
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 accepts alpha numerics '
                },
            }
        },
        city : {
            validators: {
            	notEmpty: {
                    message: 'City is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'City should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'City accepts alphanumerics'
                },
            }
        },
        state : {
            validators: {
            	notEmpty: {
                    message: 'State is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'State should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'State accepts character'
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
        fromDate: {
            validators: {
                notEmpty: {
                    message: 'From Date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'please enter From Date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY', 
                    message: 'From Date is not a valid, please enter in MM/DD/YYYY format'
                }
            }
        },
        toDate: {
            validators: {
                notEmpty: {
                    message: 'To Date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'please enter To Date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY', 
                    message: 'To Date is not a valid, please enter in MM/DD/YYYY format'
                }
            }
        },
        'othr_line1[]' : {
            validators: {
            	 notEmpty: {
                    message: 'Line1 is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line1 should have minimum 2 and maximum 80 characters '
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 accepts alpha numerics '
                },
            }
        },
        'othr_city[]' : {
            validators: {
            	notEmpty: {
                    message: 'City is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'City should have minimum 2 and maximum 25 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'City accepts alphanumerics'
                },
            }
        },
        'othr_state[]' : {
            validators: {
            	notEmpty: {
                    message: 'State is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'State should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'State accepts character'
                },
            }
        },
        'othr_zipcode[]' : {
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
        'othr_fromDate[]': {
        //	enabled:false,
            validators: {
                notEmpty: {
                    message: 'From Date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'please enter From Date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY', 
                    message: 'From Date is not a valid, please enter in MM/DD/YYYY format'
                }
            }
        },
        'othr_toDate[]': {
        //	enabled: false,
            validators: {
                notEmpty: {
                    message: 'To Date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'please enter To Date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY', 
                    message: 'To Date is not a valid, please enter in MM/DD/YYYY format'
                }
            }
        }
    }
}).on('error.validator.bv', function(e, data) {
            // $(e.target)    --> The field element
            // data.bv        --> The BootstrapValidator instance
            // data.field     --> The field name
            // data.element   --> The field element
            // data.validator --> The current validator name

            data.element
                .data('bv.messages')
                // Hide all the messages
                .find('.help-block[data-bv-for="' + data.field + '"]').hide()
                // Show only message associated with current validator
                .filter('[data-bv-validator="' + data.validator + '"]').show();
 })
 .on('click', '.addButton', function() {
    		othercl++;
    		 $('#element').removeAttr('style'); 
    	     var $template = $('#addotherOther'),
    	         $clone    = $template
    	                         .clone()
    	                         .removeAttr('style')
    	                         .removeAttr('id')
    	                         .attr('data-book-index', othercl)
    	                         .insertAfter($template);

    	     // Add new field
    	     $('#updatePersonalDetailsForm')
    	     .formValidation('addField', $clone.find('[name="othr_line1[]"]'))
    	     .formValidation('addField', $clone.find('[name="othr_line2[]"]'))
    	     .formValidation('addField', $clone.find('[name="othr_city[]"]'))
    	     .formValidation('addField', $clone.find('[name="othr_state[]"]'))
    	     .formValidation('addField', $clone.find('[name="othr_zipcode[]"]'))
    	     .formValidation('addField', $clone.find('[name="othr_fromDate[]"]'))
    	     .formValidation('addField', $clone.find('[name="othr_toDate[]"]'));
    	     $("input[name='othr_fromDate[]']").datepicker();
    	     $("input[name='othr_toDate[]']").datepicker();
    	     document.getElementById('btnUpdate').disabled=false;
    	 })
    	 .on('click', '.removeButton', function() {
    	     var $row  = $(this).parents('.form-group'),
    	         index = $row.attr('data-book-index');
    	        $othr_line1 = $row.find('[name="othr_line1[]"]');
    	     // Remove fields
    	     $('#updatePersonalDetailsForm')    	    
    	          .formValidation('removeField', $row.find('[name="othr_line1[' + index + ']"]'))
    	          .formValidation('removeField', $row.find('[name="othr_line2[' + index + ']"]'))
    	          .formValidation('removeField', $row.find('[name="othr_city[' + index + ']"]'))
    	          .formValidation('removeField', $row.find('[name="othr_state[' + index + ']"]'))
    	          .formValidation('removeField', $row.find('[name="othr_fromDate[' + index + ']"]'))
    	          .formValidation('removeField', $row.find('[name="othr_toDate[' + index + ']"]'))
    	          .formValidation('removeField', $othr_line1);

    	     // Remove element containing the fields
    	     $row.remove();
    	     if($('#updatePersonalDetailsForm').find(':visible[name="othr_line1[]"]').length<=0){
    	    	 document.getElementById('btnUpdate').disabled=true;
    	     }else{
    	    	 document.getElementById('btnUpdate').disabled=false;
    	     }
    	     
    	       })
    	       .on('added.field.fv', function(e, data) {
    	           if (data.field === 'othr_line1[]') {
    	               if ($('#updatePersonalDetailsForm').find(':visible[name="othr_line1[]"]').length >= MAX_OPTIONS) {
    	                   $('#updatePersonalDetailsForm').find('.addButton').attr('disabled', 'disabled');
    	               }
    	           }
    	        })
    	        .on('removed.field.fv', function(e, data) {
    	            if (data.field === 'othr_line1[]') {
    	                 if ($('#updatePersonalDetailsForm').find(':visible[name="othr_line1[]"]').length <= MAX_OPTIONS) {
    	                     $('#updatePersonalDetailsForm').find('.addButton').removeAttr('disabled');
    	                 }
    	             }
    	});
</script>
<script type="text/javascript">
var date = new Date();
date.setDate(date.getDate()); 
$("#dob").datepicker({
	changeMonth:true,
	changeYear:true,
	minDate: "-70Y",
	endDate: date,
	yearRange: "1950:2000" 

}).on('changeDate', function(e) {
$('#updatePersonalDetailsForm').formValidation('revalidateField', 'dob');
});

var textInput = document.getElementById('ssn_emp');
var timeout = null;
textInput.onkeyup = function (e) {
clearTimeout(timeout);
timeout = setTimeout(function () {
	 var ssn_emp=$('#ssn_emp').val();
	    if(ssn_emp==""){
	    	 $('#ssnshow').text('');
	    	 $("#btnUpdate").attr("disabled", false);
	    }else{
	    	var regex = new RegExp("^(?!\\b(\\d)\\1+-(\\d)\\1+-(\\d)\\1+\\b)(?!123-45-6789|219-09-9999|078-05-1120)(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$");
	    if(!regex.test(ssn_emp)){
	    	   $('#ssnshow').html("<font color=red>Not a valid SSN</font>");
	    }else{
	    	$('#ssnshow').html("<font color=#009900>Valid SSN number</font>");		 
	      }
	  }
}, 500);
};
/* $("#othr_fromDate").datepicker({
}).on('changeDate', function(selected) {
	 var minDate = new Date(selected.date.valueOf());
     $('#othr_toDate').datepicker('setStartDate', minDate);
    $('#updatePersonalDetailsForm').formValidation('revalidateField', 'fromDate');
});	
$("#othr_toDate").datepicker({
}).on('changeDate', function(selected) {
	 	var minDate = new Date(selected.date.valueOf());
        $('#othr_fromDate').datepicker('setEndDate', minDate);
    $('#updatePersonalDetailsForm').formValidation('revalidateField', 'toDate');
}); */
var title=$('#titleName1').val();
var $dropdown = $("select[name='titleName']");
$dropdown.find('option[value="' + title + '"]').attr('selected', true);
$('form').on('reset', function() {
	$('#updatePersonalDetailsForm').data('formValidation').resetForm();
	});
$('input[name="ssn_emp"]').mask('999-99-9999');	
$('input[name="contactTeleNo"]').mask('999-999-9999');
$('input[name="mobile"]').mask('999-999-9999');
</script> 
<script>
/* $('#updatePersonalDetailsForm input').attr('readonly', 'readonly');
$('input[type="text"], textarea').each(function(){
    $(this).attr('readonly','readonly');
 });
$('#candicomments').prop('readonly',false); */
var tablech = $('#CommentHistoryTable').DataTable({
	 "order": [[0, "desc"]],
	  lengthMenu: [[5, 10, 15, -1], [5, 10, 15, "All"]],
	  bLengthChange: true,
	  paging: true
	});
function viewCommentHistory(){
	getsesVal().done(function(data){
		if(data!=""){
	var candidateId=$("#candidate_id").val();
//	alert(candidateId);
	 $.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "application/json", // NOT dataType!
	        url  :"viewformshistory",
	        data:{"candidateId":candidateId,"formtype":"Personal"},
	        success  : function(response){
	        	 if (tablech) tablech.clear();
		         $('#CommentHistoryTable').dataTable().fnClearTable();
	        		 if(response!=""){
		            	  for(var i=0;i<response.length;i++){
		            		  var submittedby;
		            		  if(response[i].posted_by!='' || response[i].posted_by!=0 || response[i].posted_by!=null){
		            			  submittedby=response[i].posted_by;
		            		  }else{
		            			  submittedby=response[i].candidatename;
		            		  }
		            		  tablech.row.add([
		            			''+response[i].commentid+'',
		            			''+response[i].status+'',
		                    	''+response[i].comments+'',
		                      	''+response[i].subdate+'',
		                      	''+submittedby+''
		                     ]).draw();    
	        	    }
	            }
	        $('#commenthistoryModal').modal('show');
	        }		
	});
		}else{ window.location.href="loginpage";}});
}
function updatepersonalstatus(){
	getsesVal().done(function(data){
		if(data!=""){
	var statusId=$("#capprstatus").val();
	var commentId=$("#candicomments").val();
	var candidateId=$("#candidate_id").val();
	$("#CbgcCandidateId").val(candidateId);
	
	if(statusId!="" && commentId!=""){
		var form = $('#updatepersonalStatus')[0];
		var data = new FormData(form);
		$.ajax({
			url : "updatepersonalstatus", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(data) {
				 if(data!=null || data!=""){
					 alert(data);
                     $('<a href="viewpersonaldetails?candidateId='+candidateId+'"></a>')[0].click();
                     $('#candidateModal').modal('hide');
	   	   	         }
	   	   	      else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			}
		});
	}else{
		if (statusId == "") {
			alert("Please select  status");
		}else if (commentId == "") {
			alert("Please enter comments");
		}
	}
		}else{ window.location.href="loginpage";}});
}
var empType=$('#empType').val();
if(empType=='Admin' || empType=='W2 Admin'){
	 $('#updatePersonalDetailsForm input').attr('disabled', 'disabled');
	 $('input[type="text"], textarea,select').each(function(){
	     $(this).attr('disabled','disabled');
	  });
	 $('#candicomments,#capprstatus').attr('disabled', false); 
}else{
	var ver_personal_status=$('#verifier_personal_statusId').val();
	if(ver_personal_status=='Approved'){
		 $('#updatePersonalDetailsForm input').attr('disabled', 'disabled');
		 $('input[type="text"], textarea,select').each(function(){
		     $(this).attr('disabled','disabled');
		  });
		 $('#addButtonId').attr('disabled', 'disabled'); 
		 $("#btnUpdate").attr("disabled",true).prop("title","Manager status is approved, can't update details");
	}
} 

/* function getprofile(){
	var canidateid=$("#candidate_id").val();
	var profileid=$("#profileId").val();
	contractspanel
} */
$('input').attr("autocomplete", 'off');
</script>
</body>
</html>
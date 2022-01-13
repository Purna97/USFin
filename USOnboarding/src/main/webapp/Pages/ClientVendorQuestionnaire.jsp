<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/css/datepicker3.min.css" />
<title>Employee Portal</title>
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
#h1bqueDiv .form-group{
    width:105%;
}
</style>
<body class="sidebar-mini fixed">
   <div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
			<input type="hidden" id="roleid" name="roleid" value="${role}">
			<c:choose>
			<c:when test="${not empty cvlqdto.cvlqObj}">
			<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">US Onboarding- Update Client & Vendor Questionnaire Details</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-md-11 col-lg-12">
										<fieldset>
										<%-- <center><font color=red>Employee Name :</font>&nbsp;&nbsp;<b>${empobj.fullname}</b>&nbsp;&nbsp;<font color=red>Employee Number :</font>&nbsp;&nbsp;<b>${empobj.emp_number}</b>&nbsp;&nbsp;<font color=red>Employee Username :</font>&nbsp;&nbsp;<b>${empobj.username}</b></center> --%>
										<%-- <div class="form-group row">
										 <label for="inputPassword" class="col-sm-3 control-label"></label>
										<center><font color=red><strong>Employee Name :</strong></font><b>&nbsp;&nbsp;${basicObj.full_name}</b>&nbsp;&nbsp;<font color=red><strong>Employee Type :</strong></font><b>&nbsp;&nbsp;${basicObj.emp_type}</b></center>&nbsp;&nbsp;<font color=red><strong>Work Authorization :</strong></font><b>&nbsp;&nbsp;${basicObj.work_authorization}</b></center>
										</div> --%>
										<form action="/" method="post" class="form-horizontal" id="updateClientVendorLetterQuestionnaireForm" enctype="multipart/form-data">
									     <input type="hidden" id="cvlclient_id" name="cvlclient_id">
										<input type="hidden" id="client_id" name="client_id" value="${cvlqdto.cvlqObj.client_id}">
										<input type="hidden" id="rejectedfields" value="${cvlqdto.rejformsObj.rejectedfields}">
										<input type="hidden" id="rejform_status" value="${cvlqdto.rejformsObj.form_status}">
                             			<input type="hidden" id="benef_fullname"  value="${cvlqdto.cvlqObj.beneficiary_name}">
                             			<input type="hidden" id="benef_jobtitle" value="${cvlqdto.cvlqObj.beneficiary_job_title}">
                             			<input type="hidden" id="start_date" value="${cvlqdto.cvlqObj.start_date}">
                             			<input type="hidden" id="end_date" value="${cvlqdto.cvlqObj.end_date}">
                             			<input type="hidden" id="job_duties" value="${cvlqdto.cvlqObj.job_duties}">
                             			<input type="hidden" id="working_location" value="${cvlqdto.cvlqObj.working_location}">
                             			<input type="hidden" id="reporting_to" value="${cvlqdto.cvlqObj.reporting_to}">
                             			
                             			<input type="hidden" id="reporting_mgrname" value="${cvlqdto.cvlqObj.reporting_manager_name}">
                             			<input type="hidden" id="reporting_mgrtitle" value="${cvlqdto.cvlqObj.reporting_manager_title}">
                             			<input type="hidden" id="reporting_mgrcontact" value="${cvlqdto.cvlqObj.reporting_manager_contact}">
                             			<input type="hidden" id="reporting_mgremail" value="${cvlqdto.cvlqObj.reporting_manager_emailid}">
                             			
                             		  <input type="hidden" id="clientName" value="${cvlqdto.cvlendclientObj.line1}">	
                             		  <input type="hidden" id="cline1" value="${cvlqdto.cvlendclientObj.line1}">
                                      <input type="hidden" id="cline2" value="${cvlqdto.cvlendclientObj.line2}">
                                      <input type="hidden" id="ccity" value="${cvlqdto.cvlendclientObj.city}">
                                      <input type="hidden" id="cstate" value="${cvlqdto.cvlendclientObj.state}">
                                      <input type="hidden" id="czipcode" value="${cvlqdto.cvlendclientObj.zipcode}">
                             		  	
                             		  <input type="hidden" id="rline1" value="${cvlqdto.cvlqObj.line1}">
                                      <input type="hidden" id="rline2" value="${cvlqdto.cvlqObj.line2}">
                                      <input type="hidden" id="rcity" value="${cvlqdto.cvlqObj.city}">
                                      <input type="hidden" id="rstate" value="${cvlqdto.cvlqObj.state}">
                                      <input type="hidden" id="rzipcode" value="${cvlqdto.cvlqObj.zipcode}">
                             			
									<%-- <input type="hidden" name="candidate_id" id="candidate_id" value="${candidate_id}">
										<input type="hidden" name="emp_type" id="emp_type" value="${empType}">
										<input type="hidden" name="work_authorization" id="work_authorization" value="${basicObj.work_authorization}">
                                           --%> 
                                           <c:if test="${role == 1 && cvlqdto.rejformsObj.form_status=='Rejected' && not empty cvlqdto.rejformsObj.rejectioncoments}">
											    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label" style="color:purple;font-weight:bold;">Rejection Comments</label>
												<div class="col-sm-6">
													<span style="color:green;font-weight:bold;">${cvlqdto.rejformsObj.rejectioncoments}</span>
												</div>
											    </div>
										 </c:if> 
                                        <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Beneficiary's Full Name</label>
												<div class="col-sm-5">
													<input id="ubenef_full_name" type="text"  minlength="2" maxlength="100"
													title="only alphabets are allowed" placeholder="Beneficiary's Full Name" 
													name="ubenef_full_name" class="form-control" value="${cvlqdto.cvlqObj.beneficiary_name}">
												</div>
										</div>   
										<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Beneficiary's Job Title</label>
												<div class="col-sm-5">
													<input id="ubenef_job_title" type="text"  minlength="2" maxlength="100"
													title="only alphabets are allowed" placeholder="Candidate Job Title" 
													name="ubenef_job_title" class="form-control" value="${cvlqdto.cvlqObj.beneficiary_job_title}">
												</div>
										</div>
										<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span
													style="color: red;">*</Span>Anticipated Start Date</label>
												<div class="col-sm-5">
													<input type="text" id="ustartdate" class="form-control text-left"
														pattern="(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}"
														title="Enter date in MM/DD/YYYY format only" name="ustartdate" autocomplete="off"
														placeholder="Anticipated start date" class="form-control"  onkeydown="return false" value="${cvlqdto.cvlqObj.start_date}">
												</div>
										</div>
										<div class="form-group row ">
												<label for="inputPassword" class="col-sm-3 control-label"><Span
													style="color: red;">*</Span>Anticipated End Date</label>
												<div class="col-sm-5">
													<input type="text" id="uenddate" class="form-control text-left"
														pattern="(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}"
														title="Enter date in MM/DD/YYYY format only" name="uenddate" autocomplete="off"
														placeholder="Anticipated end date" class="form-control" onkeydown="return false" value="${cvlqdto.cvlqObj.end_date}">
												</div>
										</div>
										
										  <br>				  
					      <h5><b>End Client Details</b></h5>
							<br>
							     <div id="client">
							     	<input type="hidden" id="uaddress_id" name="uaddress_id" value="${cvlqdto.cvlendclientObj.address_id}">
										   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>End Client Name</label>
												<div class="col-sm-5">
													<input id="uclient_name" type="text"  minlength="2" maxlength="100"
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="End Client Name" name="uclient_name" class="form-control" value="${cvlqdto.cvlendclientObj.name}"  required>
												</div>
											</div>											
											<h5><b>Address Details</b></h5>
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-5">
													<input id="uline1" type="text"  minlength="2" maxlength="80" value="${cvlqdto.cvlendclientObj.line1}" 
													 autocomplete="off" placeholder="Enter Line1" name="uline1" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-5">
													<input id="uline2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													 placeholder="Enter Line2" value="${cvlqdto.cvlendclientObj.line2}"
													 autocomplete="off" name="uline2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-5">
													<input id="ucity" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"   value="${cvlqdto.cvlendclientObj.city}"
													 autocomplete="off" placeholder="City" name="ucity" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-5">
													<input id="ustate" type="text"  minlength="2" maxlength="25"
													 title="only Characters are allowed"  value="${cvlqdto.cvlendclientObj.state}"
													 autocomplete="off" placeholder="State" name="ustate" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-5">
													<input id="uzipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													 title="only digits are allowed" value="${cvlqdto.cvlendclientObj.zipcode}"
													 autocomplete="off" placeholder="Zip Code" name="uzipcode" class="form-control"  required>
												</div>
											</div>
										</div>	
										
										 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Candidate's Job duties at the end client location :</label>
												<div class="col-sm-5">
							   					   <textarea id="ujobduties" type="text"  placeholder="Candidate's Job duties at the end client location(at least 7 duties/responsibilities in brief)" 
							   					   row="5" column="50" name="ujobduties" class="form-control">${cvlqdto.cvlqObj.job_duties}</textarea>
												</div>
										  </div>
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Are you working/supporting client project from Remote/Home or end client location :</label>
												<div class="col-sm-5">
												 <label class="control-label">Remote/Home</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="uworkinglocation1" name="uworkinglocation" value="Remote/Home" style=" width: 20px;height: 20px;" required/>&nbsp;&nbsp;&nbsp;&nbsp;<label>End client location</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="uworkinglocation" id="uworkinglocation2" value="EndClient" style=" width: 20px;height: 20px;"/>
												</div>
											 </div>
											  <div id="uremoteAddress" class="form-group" style="display:none;">
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-5">
													<input id="uremote_line1" type="text"  minlength="2" maxlength="80" value="${cvlqdto.cvlqObj.line1}" 
													 autocomplete="off" placeholder="Enter Line1" name="uremote_line1" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-5">
													<input id="uremote_line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													 placeholder="Enter Line2" value="${cvlqdto.cvlqObj.line2}"
													 autocomplete="off" name="uremote_line2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-5">
													<input id="uremote_city" type="text"  minlength="2" maxlength="25"
													  value="${cvlqdto.cvlqObj.city}" autocomplete="off" placeholder="City"
													   name="uremote_city" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-5">
													<input id="uremote_state" type="text"  minlength="2" maxlength="25"
													 value="${cvlqdto.cvlqObj.state}"		 autocomplete="off" placeholder="State"
													  name="uremote_state" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-5">
													<input id="uremote_zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" value="${cvlqdto.cvlqObj.zipcode}"
													 autocomplete="off" placeholder="Zip Code" name="uremote_zipcode" class="form-control"  required>
												</div>
											</div>
											</div>
										  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Is the candidate reporting to the Implementation partner or Client? :</label>
												<div class="col-sm-5">
												 <label class="control-label">Implementation Partner</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="ureportingTo1" name="ureportingTo" value="Implementation partner" style=" width: 20px;height: 20px;" required/>&nbsp;&nbsp;&nbsp;&nbsp;<label>Client</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="ureportingTo" id="ureportingTo2" value="Client" style=" width: 20px;height: 20px;"/>
												</div>
										 </div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Reporting Manager Name</label>
													<div class="col-sm-5">
														<input class="form-control" id="ureporting_mgr_name"
															name="ureporting_mgr_name" placeholder="Reporting Manager Name"
															 minlength="2" maxlength="100"
															type="text"  value="${cvlqdto.cvlqObj.reporting_manager_name}">
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Reporting Manager Title</label>
													<div class="col-sm-5">
														<input class="form-control" id="ureporting_mgr_title"
															name="ureporting_mgr_title" placeholder="Reporting Manager Title"
															 minlength="2" maxlength="100"
															type="text" value="${cvlqdto.cvlqObj.reporting_manager_title}">
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Reporting Manager Contact</label>
													<div class="col-sm-5">
														<input class="form-control" id="ureporting_mgr_contact"
															name="ureporting_mgr_contact" pattern="[0-9]+"
															placeholder="Reporting Manager Contact" value="${cvlqdto.cvlqObj.reporting_manager_contact}"
															 minlength="12"	maxlength="12" type="text">
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Reporting Manager e-mail ID</label>
													<div class="col-sm-5">
														<input type="text" class="form-control" id="ureporting_mgr_email"
															name="ureporting_mgr_email" minlength="10" maxlength="80"
															placeholder="Reporting Manager e-mail ID"
															 value="${cvlqdto.cvlqObj.reporting_manager_emailid}">
													</div>
												</div>
                             			
									   <c:forEach var="otherclientlist" items="${cvlqdto.cvlAddressList}">
									   <input type="hidden" name="otheraddress_id" id="otheraddress_id" value="${otherclientlist.address_id}">
                                      <input type="hidden" name="otherclientid" id="otherclientid" value="${otherclientlist.client_id}">
                                      <input type="hidden" id="otherclient_type${otherclientlist.client_id}" value="${otherclientlist.company_type}">
                                      <input type="hidden" id="otherclient_name1${otherclientlist.client_id}" value="${otherclientlist.name}">
                                      <input type="hidden" id="otherline11${otherclientlist.client_id}" value="${otherclientlist.line1}">
                                      <input type="hidden" id="otherline21${otherclientlist.client_id}" value="${otherclientlist.line2}">
                                      <input type="hidden" id="othercity21${otherclientlist.client_id}" value="${otherclientlist.city}">
                                      <input type="hidden" id="otherstate21${otherclientlist.client_id}" value="${otherclientlist.state}">
                                      <input type="hidden" id="otherzipcode21${otherclientlist.client_id}" value="${otherclientlist.zipcode}">
                                       <h4><b>Vendor Details</b></h4>
                                           <div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Select Type of Vendor</label>
													 <div class="col-lg-4">
														<select class="form-control" id="uothrclienttype${otherclientlist.client_id}" 
															name="uothrclienttype" placeholder="Select Type of Vendor" required>
															<option value="">Select Type of Vendor</option>
															<c:forEach var="clientType" items="${clientTypelist}">
															<option value="${clientType}" ${clientType == otherclientlist.company_type ? 'selected="selected"' : ''}>${clientType}</option>
															</c:forEach>
															<!-- <option value="Primary Vendor">Primary Vendor</option>
															<option value="MSP">MSP</option>
															<option value="Implementation Partner">Implementation Partner</option> -->
														</select>
													</div>
										   </div>
                                           <div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;">*</Span>${otherclientlist.company_type}</label>
												<div class="col-lg-4">
													<input id='uotherclient_name${otherclientlist.client_id}' type="text" pattern="^[a-zA-Z\s]+$"
														 minlength="2" maxlength="100"
														autocomplete="off" placeholder="End Client Name"
														name="uotherclient_name" class="form-control" value="${otherclientlist.name}"
														required>
												</div>
											</div>
								       <div class="form-group row">
											<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Line1</label>
											<div class="col-lg-4">
												<input id="uotherline1${otherclientlist.client_id}" type="text" minlength="2" maxlength="80" required
											  
												placeholder="Employee Address" name="uotherline1" class="form-control"  value="${otherclientlist.line1}">
											</div>
										</div>
										
										<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-lg-4">
													<input id="uotherline2${otherclientlist.client_id}" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  
													minlength="2" maxlength="80" placeholder="line2" name="uotherline2" 
													class="form-control"  value="${otherclientlist.line2}" >
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-lg-4">
													<input id="uothercity${otherclientlist.client_id}" type="text"  minlength="2" maxlength="40" required
													
													placeholder="City" name="uothercity" class="form-control"  value="${otherclientlist.city}">
												</div><!--pattern="^[a-zA-Z\s]+$" " -->
											</div>
										
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-lg-4">
													<input id="uotherstate${otherclientlist.client_id}" type="text"  minlength="2" maxlength="25" value="${otherclientlist.state}"
													
													 autocomplete="off" placeholder="State" name="uotherstate" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-lg-4">
													<input id="uotherzipcode${otherclientlist.client_id}" type="text"   required
													pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													placeholder="Zip Code" name="uotherzipcode" class="form-control"  value="${otherclientlist.zipcode}">
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
								</c:forEach>
									   	<c:if test="${role == 1}">	 											
									   <div class='form-group row' id="add">
                                       <label for="inputPassword" class="col-sm-3 control-label">Add Vendor Details</label>
												<div class="col-xs-4">
													<button type="button" class="btn btn-success addButton">
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                        </div>
                                        </c:if>
							     		<div id="uaddotherclient" class="form-group" style="display:none;">
							     			  <div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Select Type of Vendor</label>
													 <div class="col-sm-5">
														<select class="form-control" id="uothr_client_type" 
															name="uothr_client_type[]" placeholder="Select Type of Vendor" required>
															<option value="">Select Type of Vendor</option>
															<option value="Primary Vendor">Primary Vendor</option>
															<option value="Secondary Vendor">Secondary Vendor</option>
															<option value="MSP">MSP</option>
															<option value="Implementation Partner">Implementation Partner</option>
															<option value="Vendor Name">Vendor Name</option>
															<!-- <option value="EndClient Name">End Client Name</option> -->
														</select>
													</div>
													<div class="col-xs-4">
													<button type="button" class="btn btn-danger removeButton">
														<i class="fa fa-minus"></i>
													</button>
												    </div>
												</div>
							     		
											 <div class="form-group row" id="uclient_name_id">
													<label for="inputPassword" class="col-sm-3 control-label" id="uclient_name_label"><Span
														style="color: red;">*</Span>Name</label>
													<div class="col-sm-5">
														<input class="form-control" id="uothr_client_name" minlength="2" maxlength="100"
															name="uothr_client_name[]" placeholder="Name"
															type="text" required>
													</div>
											</div>
											<h5><b>Address Details</b></h5>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-5">
													<input id="uothr_line1" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="uothr_line1[]"
													  class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-5">
													<input id="uothr_line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													 placeholder="Enter Line2"
													 autocomplete="off" name="uothr_line2[]" id="othr_line2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-5">
													<input id="uothr_city" type="text"  minlength="2" maxlength="25"
													
													 autocomplete="off" placeholder="City" name="uothr_city[]" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-5">
													<input id="uothr_state" type="text"  minlength="2" maxlength="25"
													
													 autocomplete="off" placeholder="State" name="uothr_state[]" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-5">
													<input id="uothr_zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													 
													 autocomplete="off" placeholder="Zip Code" name="uothr_zipcode[]" class="form-control"  required>
												</div>
											</div>
										</div>
											<c:if test="${role == 1}">
											<div class="text-center ml-3">										
												   <input type="button" class="btn btn-default" id="cvlbtnUpdate" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Update">
												<!-- <button type="submit" id="submit" class="btn btn-default">Submit</button> -->
												  <a href="mydocuments" class="btn btn-default" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;" id="resetbtnId">Back</a>
											</div>
											</c:if>
										</form>	
							<c:if test="${role == 4 && cvlqdto.initiateObj.status=='Active'}">
							<br>
							     <div class="text-center ml-5">
							     <input type="button" id="btnh1bCvlAdmin"
							        style="border-radius: 12px;background-color:#2196f3;"
							        class="btn btn-primary btn-sm collapsibleCvlAdmin" value="Applicant Status">
							   <c:if test="${cvlqdto.rejformscvlhistoryList.size() gt 0}">
							     <button type="button"	style='letter-spacing: 1px; background-color:#15aabf;color:white;' class="btn btn-info btn-sm addButton" 
									onclick="viewCommentHistory1(${cvlqdto.cvlqObj.client_id},'Applicant','Client Vendor Questionnaire Letter')"><i class="fa fa-history"></i></button>
							     </c:if>
							     <!-- <a href="immigration" class="btn btn-secondary btn-sm" >Back</a> -->
							     </div> 
							</c:if>	
										</fieldset>
							    	</div>
							   </div>
						  </div>
					 </div>
				 </div>
			</div>
			 <div class="row">
			<c:if test="${role == 4}">
					<center>
						<div>
						<form  action="/" id="updatecvlimmiformstausId" method="post" >
						<input type="hidden" id="form_type" name="form_type" value="Client Vendor Questionnaire Letter">
						<input type="hidden" id="verifierStatus" value="${cvlqdto.formObj.verifier_status}">
						<input type="hidden"  name="candidate_id"  id="candidateId" value="${candId}">
					     <%--  <div class="form-group row"  style="width: 160%;">
								<label for="inputPassword" class="col-sm-6 control-label"><Span style="color:red;">*</Span>Select Status</label>
									<div class="col-sm-5">
												<select id="approveStatus" name="approveStatus" class="form-control">
											<option value="">-Select Status-</option>
												<option value="Approved" >Approve</option>
												<option value="Rejected" >Reject</option> 
												</select>
											</div>
								</div> 
					       <div class="form-group row" style="width: 160%;">
								<label for="inputPassword" class="col-sm-6 control-label"><Span style="color:red;">*</Span>Comments</label>
									<div class="col-sm-5">
										<textarea type="text"  id="candicomments" name="comment" rows="4" cols="50" minlength="2"
										 placeholder="Enter Comments"  class="form-control" required></textarea>
									</div>
								<div> <button type="button" id="CchistoryId" data-toggle="modal"  data-target='#commentshistory' 
									style='letter-spacing: 1px; background-color: #15aabf; color: white;' class="btn btn-info btn-sm addButton" 
									onclick="viewCommentHistory(${candId},'Client Vendor Questionnaire Letter')"><i class="fa fa-history"></i></button></div>
							
							</div>
							  <div class="form-group row" style="width: 160%;">
							<label for="inputPassword" class="col-sm-6 control-label"><Span style="color:red;"></Span></label>
							<div class="col-sm-5">
								<button type="button" class="btn btn-primary btn-sm" id="cvlbtnUpdateadmin">Submit</button>
								<!-- <a href="immigration" class="btn btn-secondary btn-sm" >Back</a> -->
								<button type="button" class="btn btn-secondary btn-sm" id="cvlbtnBackadmin">Back</button>
								</div>
							</div>  --%>
					</form>
			</div></center>
						</c:if>
					</div>	
			</c:when>
			<c:otherwise>
			  <div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">US Onboarding- Add Client & Vendor Questionnaire Details</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-md-11 col-lg-12">
										<fieldset>
										<%-- <center><font color=red>Employee Name :</font>&nbsp;&nbsp;<b>${empobj.fullname}</b>&nbsp;&nbsp;<font color=red>Employee Number :</font>&nbsp;&nbsp;<b>${empobj.emp_number}</b>&nbsp;&nbsp;<font color=red>Employee Username :</font>&nbsp;&nbsp;<b>${empobj.username}</b></center> --%>
										<%-- <div class="form-group row">
										 <label for="inputPassword" class="col-sm-3 control-label"></label>
										<center><font color=red><strong>Employee Name :</strong></font><b>&nbsp;&nbsp;${basicObj.full_name}</b>&nbsp;&nbsp;<font color=red><strong>Employee Type :</strong></font><b>&nbsp;&nbsp;${basicObj.emp_type}</b></center>&nbsp;&nbsp;<font color=red><strong>Work Authorization :</strong></font><b>&nbsp;&nbsp;${basicObj.work_authorization}</b></center>
										</div> --%>
										<form action="/" method="post" class="form-horizontal" id="ClientVendorLetterQuestionnaireForm" enctype="multipart/form-data">
										<%-- <input type="hidden" name="candidate_id" id="candidate_id" value="${candidate_id}">
										<input type="hidden" name="emp_type" id="emp_type" value="${empType}">
										<input type="hidden" name="work_authorization" id="work_authorization" value="${basicObj.work_authorization}">
                                           --%> 
                                        <c:choose>
										<c:when test="${not empty cvlqdto.tempcvlqObj.client_id}">
										<input type="hidden" id="cvlclient_id" name="cvlclient_id" value="${cvlqdto.tempcvlqObj.client_id}">
										</c:when>
										<c:otherwise>
										 <input type="hidden" id="cvlclient_id" name="cvlclient_id">
										</c:otherwise>
										</c:choose>
										<input type="hidden" id="tworking_location" value="${cvlqdto.tempcvlqObj.working_location}">
                             			<input type="hidden" id="treporting_to" value="${cvlqdto.tempcvlqObj.reporting_to}"> 
                             			<input type="hidden" id="tstart_date" value="${cvlqdto.tempcvlqObj.start_date}">
                                         <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Beneficiary's Full Name</label>
												<div class="col-sm-5">
													<input id="benef_full_name" type="text"  minlength="2" maxlength="100"
													title="only alphabets are allowed" placeholder="Beneficiary's Full Name" 
													name="benef_full_name" class="form-control" value="${cvlqdto.tempcvlqObj.beneficiary_name}">
												</div>
										</div>   
										<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Beneficiary's Job Title</label>
												<div class="col-sm-5">
													<input id="benef_job_title" type="text"  minlength="2" maxlength="100"
													title="only alphabets are allowed" placeholder="Candidate Job Title" 
													name="benef_job_title" class="form-control" value="${cvlqdto.tempcvlqObj.beneficiary_job_title}">
												</div>
										</div>
										<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span
													style="color: red;">*</Span>Anticipated Start Date</label>
												<div class="col-sm-5">
													<input type="text" id="startdate" class="form-control text-left"
														pattern="(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}"
														title="Enter date in MM/DD/YYYY format only" name="startdate" autocomplete="off"
														placeholder="Anticipated start date" class="form-control"  onkeydown="return false" value="${cvlqdto.tempcvlqObj.start_date}">
												</div>
										</div>
										<div class="form-group row ">
												<label for="inputPassword" class="col-sm-3 control-label"><Span
													style="color: red;">*</Span>Anticipated End Date</label>
												<div class="col-sm-5">
													<input type="text" id="enddate" class="form-control text-left"
														pattern="(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}"
														title="Enter date in MM/DD/YYYY format only" name="enddate" autocomplete="off"
														placeholder="Anticipated end date" class="form-control" onkeydown="return false" value="${cvlqdto.tempcvlqObj.end_date}" disabled>
												</div>
										</div>
										
										  <br>				  
					      <h5><b>End Client Details</b></h5>
							<br>
							     <div id="client">
							     	<input type="hidden" id="taddress_id" name="taddress_id" value="${cvlqdto.tempcvlendclientObj.address_id}">
										   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>End Client Name</label>
												<div class="col-sm-5">
													<input id="client_name" type="text"  minlength="2" maxlength="100"
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="End Client Name" name="client_name" class="form-control" value="${cvlqdto.tempcvlendclientObj.name}"  required>
												</div>
											</div>											
											<h5><b>Address Details</b></h5>
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-5">
													<input id="line1" type="text"  minlength="2" maxlength="80" value="${cvlqdto.tempcvlendclientObj.line1}" 
													 autocomplete="off" placeholder="Enter Line1" name="line1" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-5">
													<input id="line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													 placeholder="Enter Line2" value="${cvlqdto.tempcvlendclientObj.line2}"
													 autocomplete="off" name="line2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-5">
													<input id="city" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"   value="${cvlqdto.tempcvlendclientObj.city}"
													 autocomplete="off" placeholder="City" name="city" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-5">
													<input id="state" type="text"  minlength="2" maxlength="25"
													 title="only Characters are allowed"  value="${cvlqdto.tempcvlendclientObj.state}"
													 autocomplete="off" placeholder="State" name="state" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-5">
													<input id="zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													 title="only digits are allowed" value="${cvlqdto.tempcvlendclientObj.zipcode}"
													 autocomplete="off" placeholder="Zip Code" name="zipcode" class="form-control"  required>
												</div>
											</div>
										</div>	
										
										 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Candidate's Job duties at the end client location :</label>
												<div class="col-sm-5">
							   					   <textarea id="jobduties" type="text"  placeholder="Candidate's Job duties at the end client location(at least 7 duties/responsibilities in brief)" 
							   					   row="5" column="50" name="jobduties" class="form-control">${cvlqdto.tempcvlqObj.job_duties}</textarea>
												</div>
										  </div>
										         <c:choose>
												 <c:when test="${not empty cvlqdto.tempcvlqObj.working_location}">
											           <div class="form-group row">
												              <label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Are you working/supporting client project from Remote/Home or end client location :</label>
												         <div class="col-sm-5">
												          <label class="control-label">Remote/Home</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="workinglocation1" name="workinglocation" value="Remote/Home" style=" width: 20px;height: 20px;" required/>&nbsp;&nbsp;&nbsp;&nbsp;<label>End client location</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="workinglocation" id="workinglocation2" value="EndClient" style=" width: 20px;height: 20px;"/>
												        </div>
											        </div>
												 </c:when>
												 <c:otherwise>
												      <div class="form-group row">
												       <label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Are you working/supporting client project from Remote/Home or end client location :</label>
												        <div class="col-sm-5">
												         <label class="control-label">Remote/Home</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="workinglocation" name="workinglocation" value="Remote/Home" style=" width: 20px;height: 20px;" required/>&nbsp;&nbsp;&nbsp;&nbsp;<label>End client location</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="workinglocation" id="workinglocation" value="EndClient" style=" width: 20px;height: 20px;"/>
												        </div>
											          </div>  
												 </c:otherwise>
												 </c:choose>
												 
											  <div id="remoteAddress" class="form-group" style="display:none;">
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-5">
													<input id="remote_line1" type="text"  minlength="2" maxlength="80" value="${cvlqdto.tempcvlqObj.line1}" 
													 autocomplete="off" placeholder="Enter Line1" name="remote_line1" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-5">
													<input id="remote_line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													 placeholder="Enter Line2" value="${cvlqdto.tempcvlqObj.line2}"
													 autocomplete="off" name="remote_line2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-5">
													<input id="remote_city" type="text"  minlength="2" maxlength="25"
													  value="${cvlqdto.tempcvlqObj.city}" autocomplete="off" placeholder="City"
													   name="remote_city" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-5">
													<input id="remote_state" type="text"  minlength="2" maxlength="25"
													 value="${cvlqdto.tempcvlqObj.state}"		 autocomplete="off" placeholder="State"
													  name="remote_state" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-5">
													<input id="remote_zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" value="${cvlqdto.tempcvlqObj.zipcode}"
													 autocomplete="off" placeholder="Zip Code" name="remote_zipcode" class="form-control"  required>
												</div>
											</div>
											</div>
											
											 <c:choose>
												 <c:when test="${not empty cvlqdto.tempcvlqObj.reporting_to}">
												    <div class="form-group row">
												         <label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Is the candidate reporting to the Implementation partner or Client? :</label>
												          <div class="col-sm-5">
												             <label class="control-label">Implementation Partner</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="reportingTo1" name="reportingTo" value="Implementation partner" style=" width: 20px;height: 20px;" required/>&nbsp;&nbsp;&nbsp;&nbsp;<label>Client</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="reportingTo" id="reportingTo2" value="Client" style=" width: 20px;height: 20px;"/>
												          </div>
										              </div>
												 </c:when>
												 <c:otherwise>
												 			
												 			<div class="form-group row">
											          	<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Is the candidate reporting to the Implementation partner or Client? :</label>
												          <div class="col-sm-5">
												             <label class="control-label">Implementation Partner</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="reportingTo" name="reportingTo" value="Implementation partner" style=" width: 20px;height: 20px;" required/>&nbsp;&nbsp;&nbsp;&nbsp;<label>Client</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="reportingTo" id="reportingTo" value="Client" style=" width: 20px;height: 20px;"/>
												        </div>
										             </div>
												 </c:otherwise>
												 </c:choose>
										 
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Reporting Manager Name</label>
													<div class="col-sm-5">
														<input class="form-control" id="reporting_mgr_name"
															name="reporting_mgr_name" placeholder="Reporting Manager Name"
															 minlength="2" maxlength="100"
															type="text"  value="${cvlqdto.tempcvlqObj.reporting_manager_name}">
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Reporting Manager Title</label>
													<div class="col-sm-5">
														<input class="form-control" id="reporting_mgr_title"
															name="reporting_mgr_title" placeholder="Reporting Manager Title"
															 minlength="2" maxlength="100"
															type="text" value="${cvlqdto.tempcvlqObj.reporting_manager_title}">
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Reporting Manager Contact</label>
													<div class="col-sm-5">
														<input class="form-control" id="reporting_mgr_contact"
															name="reporting_mgr_contact" pattern="[0-9]+"
															placeholder="Reporting Manager Contact" value="${cvlqdto.tempcvlqObj.reporting_manager_contact}"
															 minlength="12"	maxlength="12" type="text">
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Reporting Manager e-mail ID</label>
													<div class="col-sm-5">
														<input type="text" class="form-control" id="reporting_mgr_email"
															name="reporting_mgr_email" minlength="10" maxlength="80"
															placeholder="Reporting Manager e-mail ID"
															 value="${cvlqdto.tempcvlqObj.reporting_manager_emailid}">
													</div>
												</div>
                             			
									   <c:forEach var="tempotherclientlist" items="${cvlqdto.tempcvlAddressList}">
									   <input type="hidden" name="totheraddress_id" id="totheraddress_id" value="${tempotherclientlist.address_id}">
									    <input type="hidden" name="totherclientid" id="totherclientid" value="${tempotherclientlist.client_id}">
                                     <%--  <input type="hidden" name="otherclientid" id="otherclientid" value="${tempotherclientlist.client_id}">
                                      <input type="hidden" id="otherclient_type${tempotherclientlist.client_id}" value="${tempotherclientlist.company_type}">
                                      <input type="hidden" id="otherclient_name1${otherclientlist.client_id}" value="${otherclientlist.name}">
                                      <input type="hidden" id="otherline11${otherclientlist.client_id}" value="${otherclientlist.line1}">
                                      <input type="hidden" id="otherline21${otherclientlist.client_id}" value="${otherclientlist.line2}">
                                      <input type="hidden" id="othercity21${otherclientlist.client_id}" value="${otherclientlist.city}">
                                      <input type="hidden" id="otherstate21${otherclientlist.client_id}" value="${otherclientlist.state}">
                                      <input type="hidden" id="otherzipcode21${otherclientlist.client_id}" value="${otherclientlist.zipcode}"> --%>
                                       <h4><b>Vendor Details</b></h4>
                                           <div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Select Type of Vendor</label>
													 <div class="col-lg-4">
														<select class="form-control" id="tothrclienttype${tempotherclientlist.client_id}" 
															name="tothrclienttype" placeholder="Select Type of Vendor" required>
															<option value="">Select Type of Vendor</option>
															<c:forEach var="clientType" items="${clientTypelist}">
															<option value="${clientType}" ${clientType == tempotherclientlist.company_type ? 'selected="selected"' : ''}>${clientType}</option>
															</c:forEach>
															<!-- <option value="Primary Vendor">Primary Vendor</option>
															<option value="MSP">MSP</option>
															<option value="Implementation Partner">Implementation Partner</option> -->
														</select>
													</div>
										   </div>
                                           <div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;">*</Span>${tempotherclientlist.company_type}</label>
												<div class="col-lg-4">
													<input id='totherclient_name${tempotherclientlist.client_id}' type="text" pattern="^[a-zA-Z\s]+$"
														 minlength="2" maxlength="100"
														autocomplete="off" placeholder="End Client Name"
														name="totherclient_name" class="form-control" value="${tempotherclientlist.name}"
														required>
												</div>
											</div>
								       <div class="form-group row">
											<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Line1</label>
											<div class="col-lg-4">
												<input id="totherline1${tempotherclientlist.client_id}" type="text" minlength="2" maxlength="80" required
											   
												placeholder="Employee Address" name="totherline1" class="form-control"  value="${tempotherclientlist.line1}">
											</div>
										</div>
										
										<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-lg-4">
													<input id="totherline2${tempotherclientlist.client_id}" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  
													minlength="2" maxlength="80" placeholder="line2" name="totherline2" 
													class="form-control"  value="${tempotherclientlist.line2}" >
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-lg-4">
													<input id="tothercity${otherclientlist.client_id}" type="text"  minlength="2" maxlength="40" required
													
													placeholder="City" name="tothercity" class="form-control"  value="${tempotherclientlist.city}">
												</div><!--pattern="^[a-zA-Z\s]+$" " -->
											</div>
										
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-lg-4">
													<input id="totherstate${tempotherclientlist.client_id}" type="text"  minlength="2" maxlength="25" value="${tempotherclientlist.state}"
													
													 autocomplete="off" placeholder="State" name="totherstate" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-lg-4">
													<input id="totherzipcode${tempotherclientlist.client_id}" type="text"   required
													pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													placeholder="Zip Code" name="totherzipcode" class="form-control"  value="${tempotherclientlist.zipcode}">
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
								</c:forEach>
											<c:if test="${role == 1}">	 											
									   <div class='form-group row' id="add">
                                       <label for="inputPassword" class="col-sm-3 control-label">Add Vendor Details</label>
												<div class="col-xs-4">
													<button type="button" class="btn btn-success btn-sm addButton">
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                        </div>
                                        </c:if>
							     		<div id="addotherclient" class="form-group" style="display:none;">
							     			  <div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Select Type of Vendor</label>
													 <div class="col-sm-5">
														<select class="form-control" id="othr_client_type" 
															name="othr_client_type[]" placeholder="Select Type of Client" required>
															<option value="">Select Type of Vendor</option>
															<option value="Primary Vendor">Primary Vendor</option>
															<option value="Secondary Vendor">Secondary Vendor</option>
															<option value="MSP">MSP</option>
															<option value="Implementation Partner">Implementation Partner</option>
															<option value="Vendor Name">Vendor Name</option>
														</select>
													</div>
													<div class="col-xs-4">
													<button type="button" class="btn btn-danger btn-sm removeButton">
														<i class="fa fa-minus"></i>
													</button>
												    </div>
												</div>
							     		
												<div class="form-group row" id="client_name_id">
													<label for="inputPassword" class="col-sm-3 control-label" id="client_name_label"><Span
														style="color: red;">*</Span>Name</label>
													<div class="col-sm-5">
														<input class="form-control" id="othr_client_name" minlength="2" maxlength="100"
															name="othr_client_name[]" placeholder="Name"
															title="Enter Only alphabets" type="text" required>
													</div>
												</div>
											<h5><b>Address Details</b></h5>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-5">
													<input id="othr_line1" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="othr_line1[]" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-5">
													<input id="col-sm-5" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													 placeholder="Enter Line2"
													 autocomplete="off" name="othr_line2[]" id="othr_line2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-5">
													<input id="othr_city" type="text"  minlength="2" maxlength="25"
													 autocomplete="off" placeholder="City" name="othr_city[]" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-5">
													<input id="othr_state" type="text"  minlength="2" maxlength="25"
													 autocomplete="off" placeholder="State" name="othr_state[]" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-5">
													<input id="othr_zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													 autocomplete="off" placeholder="Zip Code" name="othr_zipcode[]" class="form-control"  required>
												</div>
											</div>
										</div>
										<c:if test="${role == 1}">
											<div class="text-center ml-3">
											       <input type="button" class="btn btn-default" id="cvlsaveid" style="padding:7px;background-color:#2196f3;color:white;text-transform:INITIAL;line-height:0.728571;" value="Save & Continue">										
												   <input type="button" class="btn btn-default" id="cvlsubmitid" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Submit">
												<!-- <button type="submit" id="submit" class="btn btn-default">Submit</button> -->
												<button type="button" class="btn btn-default" id="cvlresetid" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;">Reset</button> 
												<a href="mydocuments" class="btn btn-default" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;" id="reset">Back</a>
											</div>
											</c:if>
										</form>		
										</fieldset>
							    	</div>
							   </div>
						  </div>
					 </div>
				 </div>
			  </div>
		    </c:otherwise>
			</c:choose>
		</div>
		<div class="modal fade" id="commentshistory" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top:0px;">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content" style="width:120%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Comments History Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="/" id="saveCommentsForm" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<div class="modal-body">							
					       <table id="commentshistoryTable" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Status</th>
								<th>Comments</th>
								<th>Submitted By</th>
								<th>Submitted Date</th>
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
		
		<div class="modal fade" id="rejectcommentshistorymodal" tabindex="-1"
	aria-hidden="true" role="dialog" style="top:20%" ><!-- style="top:60%" -->
	<div class="modal-dialog modal-lg" role="document" style="max-width:80%">
		<div class="modal-content">
			<div class="modal-header" style="padding: .5rem;">
				<button class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h5 class="modal-title" id="exampleModalLabel"
					style="font-size: 15px">
					<b>Comments History Details</b>
				</h5>
			</div>
			<div class="modal-body">
			             <table id="commentshistoryTable1" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>Status</th>
								<th>Fields Rejected</th>
								<th>Comments</th>
								<th>Verified By</th>
								<th>Verified On</th>
								</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>
			</div>
		</div>
	</div>
  </div>
		<div class="modal fade" id="h1bRejectionmodal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true" >
	<div class="modal-dialog modal-lg" style="max-width: 90%"
		role="document">
		<div class="modal-content">
			<div class="modal-header" style="padding: .5rem;">
				<button class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h5 class="modal-title" id="exampleModalLabel"
					style="font-size: 15px">
					<b>Client Vendor Questionnaire Details</b>
				</h5>
			</div>
			<div class="modal-body">
			<form action="/" class="form-horizontal" id="rejectFieldFormid" enctype="multipart/form-data" autocomplete="off">
			<!-- <h4><b>Candidate Details</b></h4> -->
			<input type="hidden" id="rejcand_id"  name="rejcand_id">
			<input type="hidden" id="rejh1que_id"  name="rejh1que_id">
			<input type="hidden" id="rejprof_type"  name="rejprof_type">
			<input type="hidden" id="rejform_type"  name="rejform_type" value="Client Vendor Questionnaire Letter">
			<!-- benef_full_name benef_job_title startdate enddate
   client_name line1 line2 state city zipcode 
  jobduties workinglocation reportingTo
  reporting_mgr_name reporting_mgr_title reporting_mgr_contact reporting_mgr_email -->
			<div id="h1bqueDiv">
			<div class="row">
			<!-- <div id="rejDiv" style="display:none;"> -->
		    <div class="col-md-6 col-sm-12" id="rejDiv">
		    	<div class="form-group row">
				<label for="inputPassword" class="col-sm-3 control-label">Beneficiary's Full Name</label>
				 <div class="col-sm-1"> 
					<input type="checkbox" name="applRejects" id="rejbenef_full_name" value="benef_full_name" style=" width: 20px;height: 20px;"/>
				 </div>
				<label for="inputPassword" class="col-sm-3 control-label">Beneficiary's Job Title</label>
				 <div class="col-sm-1"> 
					<input type="checkbox" name="applRejects" id="rejbenef_job_title" value="benef_job_title" style=" width: 20px;height: 20px;"/>
				 </div> 
				<label for="inputPassword" class="col-sm-3 control-label">Anticipated Start Date</label>
			   <div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejstartdate" value="startdate" style=" width: 20px;height: 20px;"/>
				</div>
			</div>
			</div>
			 <div class="col-md-6 col-sm-12" id="rejDiv1">
			<div class="form-group row">
			   <label for="inputPassword" class="col-sm-3 control-label">Anticipated End Date</label>
			   <div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejenddate" value="enddate" style=" width: 20px;height: 20px;"/>
				</div>
				 <label for="inputPassword" class="col-sm-7 control-label">Candidate's Job duties at the end client location</label>
			   <div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejjobduties" value="jobduties" style=" width: 20px;height: 20px;"/>
				</div>
			</div>
		    </div>
		    <div class="col-md-6 col-sm-12" id="rejDiv2">
		    <!--  <h5><b>Address in U.S.A.</b></h5> -->
		    <div class="form-group row">
				<label for="inputPassword" class="col-sm-3 control-label">End Client Name</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejclient_name" value="client_name" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">Line1</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejline1" value="line1" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">Line2</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejline2" value="line2" style=" width: 20px;height: 20px;"/>
				</div>
			</div>
		    </div>
		   
		    <div class="col-md-6 col-sm-12" id="rejDiv3">
		    <div class="form-group row">
		        <label for="inputPassword" class="col-sm-3 control-label">City</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejcity" value="city" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">State</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejstate" value="state" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">Zipcode</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejzipcode" value="zipcode" style=" width: 20px;height: 20px;"/>
				</div>
			</div>
		    </div>
		    <div class="col-md-6 col-sm-12" id="rejDiv6">   
		 <div class="form-group row">
		        <label for="inputPassword" class="col-sm-3 control-label">Reporting Manager Name</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejreporting_mgr_name" value="reporting_mgr_name" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">Reporting Manager Title</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejreporting_mgr_title" value="reporting_mgr_title" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">Reporting Manager Contact</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejreporting_mgr_contact" value="reporting_mgr_contact" style=" width: 20px;height: 20px;"/>
				</div>
			</div>
		</div>
		<div class="col-md-6 col-sm-12" id="rejDiv7">
		    <div class="form-group row">
				<label for="inputPassword" class="col-sm-3 control-label">Reporting Manager e-mail ID</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejreporting_mgr_email" value="reporting_mgr_email" style=" width: 20px;height: 20px;"/>
				</div>
			</div>
		</div>
		 <div class="col-md-6 col-sm-12" id="rejDiv4">	
		     <div class="form-group row">
				<label for="inputPassword" class="col-sm-7 control-label">Are you working/supporting client project from Remote/Home or end client location</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejworkinglocation" value="workinglocation" style=" width: 20px;height: 20px;"/>
				</div>
		    </div>
		</div>
		 <div class="col-md-6 col-sm-12" id="rejDiv5">	
		     <div class="form-group row">
				<label for="inputPassword" class="col-sm-7 control-label">Is the candidate reporting to the Implementation partner or Client</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejreportingTo" value="reportingTo" style=" width: 20px;height: 20px;"/>
				</div>
		    </div>
		</div>
		 <div class="col-md-6 col-sm-12" id="rejothercvlDiv8">
		<div id="rejothercvlDiv"></div>
		</div> 
		<!-- <div id="init_addOtherLocation" class="form-group" style="display: none;">
											<input type="hidden" id="initulcaotherloc_addrid" name="initulcaotherloc_addrid[]" >
											<div class="row" id="inituaddOtherLocationDiv">
											<div class="col-md-6 col-sm-12">
											<div class="form-group row">
											<label for="inputPassword" class="col-sm-7 control-label"><Span style="color:red;"></Span>Entry and Exit Id</label>
												<div class="col-sm-1">
													<input type="checkbox" name="applRejects" id="rejentryid" style=" width: 20px;height: 20px;"/>
												</div>
		    									</div>
											</div>
											</div>
								</div> -->
			
		  <!--  </div> -->
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 control-label"><Span style="color:red;">*</Span>Status</label>
				<div class="col-sm-6">
					<select id="rejstatusid" autocomplete="off" name="rejstatusid"
					required class="form-control">
					</select>
				</div>
				<!-- <button type="button"	style='letter-spacing: 1px; background-color:#15aabf;color:white;' 
				      id="chistoryId" class="btn btn-info btn-sm addButton"><i class="fa fa-history"></i></button> -->
		    </div>
			
		    <div class="form-group row">
				<label for="inputPassword" class="col-sm-2 control-label"><Span style="color:red;">*</Span>Comments</label>
				<div class="col-sm-6">
					<textarea type="text" name="rejectComments" id="rejectComments"
					 placeholder="Employee Address" row="3" column="50" class="form-control"/></textarea>
				</div>
		    </div>
		    
		 <!-- onclick="viewCommentHistory1()" -->
	  </div>
  </div>
             <div class="text-center ml-5">
				<input type="button" class="btn btn-default" id="rejectbtnId" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Update Status">
				<button type="button" data-dismiss="modal" class="btn btn-default" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;" id="reset">Close</button>
			  </div> 
		 </form>
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
<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
 <script  type="text/javascript">
var othercl=0;
var MAX_OPTIONS = 3;
$('#ClientVendorLetterQuestionnaireForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {
        benef_full_name: {
            validators: {
            	notEmpty: {
                    message: 'Beneficiary Full Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Beneficiary Full Name must be more than 2 and less than 100 characters long'
                },
                regexp: {
                    regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                    message: 'Beneficiary Full Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                }
            }
        }, 
        benef_job_title: {
            validators: {
            	notEmpty: {
                    message: 'Beneficiary Job Title is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Beneficiary Job Title must be more than 2 and less than 100 characters long'
                },
                regexp: {
                    regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                    message: 'Beneficiary Job Title accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                }
            }
        }, 
      client_name: {
            validators: {
            	notEmpty: {
                    message: 'End Client Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'End Client Name must be more than 2 and less than 100 characters long'
                },
                regexp: {
                    regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                    message: 'End Client Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
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
        reportingTo :{
	          validators: {
		           	notEmpty: {
		                   message: 'Please select Type '
		               }
		           }
		 },
        reporting_mgr_name: {
            validators: {
            	 isEmpty: {
                    message: 'End Client Manager Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Reporting Manager Name must be more than 2 and less than 100 characters long'
                },
                regexp: {
                	regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                    message: 'Reporting Manager name accepts alphabets and Space allowed but is not at beginning or end of the word'
                }
            }
        },
        reporting_mgr_title: {
            validators: {
            	isEmpty: {
                    message: 'Reporting Manager Title is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Reporting Manager Title must be more than 2 and less than 100 characters long'
                },
                regexp: {
                	regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                    message: 'Reporting Manager Title name accepts alphabets and Space allowed but is not at beginning or end of the word'
                }
            }
        },
        reporting_mgr_email:{
            validators: {
            	isEmpty: {
                    message: 'End Client Manager e-mail is mandatory'
            	 },
                 stringLength: {
                 min: 10,
                 max: 80,
                 message: 'Reporting Manager e-mail must be more than 10 and less than 80 characters long'
                },
                  regexp: {
             	regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
                 message: 'Please enter valid e-mail ID'
             }
           }
      }, 
      reporting_mgr_contact:{
          validators: {
        	  isEmpty: {
                  message: 'Reporting Manager Contact Number is Not mandatory'
          	  },
               stringLength: {
               min: 12,
               max: 12,
               message: 'Reporting Manager Contact Number must be more 10 or Not less than 10 Numbers long'
              }
          }
      }, 
  startdate:{
           validators: {
           	notEmpty: {
                   message: 'Start Date is mandatory'
               },
               date: {
                   format: 'MM/DD/YYYY',
                   message: 'invalid Date'
               }
           }
       },       
    enddate:{
           validators: {
           	notEmpty: {
                   message: 'End Date is mandatory'
               },
               date: {
                   format: 'MM/DD/YYYY',
                   message: 'invalid Date'
               }
           }
       },
 'othr_client_type[]':{
	          validators: {
	           	notEmpty: {
	                   message: 'Please select Type of vendor '
	               }
	           }
	       },       
      'othr_client_name[]': {
        	  validators: {
	              	notEmpty: {
	                      message: 'Name is mandatory'
	                  },
	                  stringLength: {
	                      min: 2,
	                      max: 100,
	                      message: 'Name must be more than 2 and less than 100 characters long'
	                  },
	                  regexp: {
	                	  regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
	                      message: 'Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
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
	jobduties : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Job Duties is mandatory'
	                }
	            }
	        },
    remote_line1 : {
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
   remote_city : {
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
	        remote_state : {
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
	        remote_zipcode : {
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
	        }    
    }
})     
        
.on('click', '.addButton', function() {
	othercl++;
	/* $('#element').removeAttr('style'); */
     var $template = $('#addotherclient'),
         $clone    = $template
                         .clone()
                         .removeAttr('style')
                         .removeAttr('id')
                         .attr('data-book-index', othercl)
                         .insertAfter($template);
     $clone.find('[id="client_name_label"]').attr('id','client_name_label'+othercl);
     $clone.find('[name="othr_client_name[]"]').attr('id','othr_client_name'+othercl);
     $clone.find('[name="othr_client_type[]"]').attr('id',othercl);
     //$clone=$('#client_name_id').find("label[id=client_name_label]").attr('client_name_label',othercl)
     // Add new field
    /*  $('#client_name_id').find("label[id=client_name_label]").html("1"); */
     $('#ClientVendorLetterQuestionnaireForm')
     .formValidation('addField', $clone.find('[name="othr_client_type[]"]'))
     .formValidation('addField', $clone.find('[name="othr_client_name[]"]'))
      /*.formValidation('addField', $clone.find('[name="othr_client_addr[]"]'))
     .formValidation('addField', $clone.find('[name="othr_client_mgr[]"]'))
     .formValidation('addField', $clone.find('[name="othr_client_mgr_email[]"]'))
     .formValidation('addField', $clone.find('[name="othr_client_mgr_extn[]"]'))
     .formValidation('addField', $clone.find('[name="othr_emp_email_client[]"]')) */
     .formValidation('addField', $clone.find('[name="othr_line1[]"]'))
     .formValidation('addField', $clone.find('[name="othr_line2[]"]'))
     .formValidation('addField', $clone.find('[name="othr_city[]"]'))
     .formValidation('addField', $clone.find('[name="othr_state[]"]'))
     .formValidation('addField', $clone.find('[name="othr_zipcode[]"]'));
 })
 .on('click', '.removeButton', function() {
        var $row  = $(this).parents('.form-group'),
        index = $row.attr('data-book-index');
        $othr_client_name = $row.find('[name="othr_client_name[]"]');
     // Remove fields
     othercl--;
     $('#ClientVendorLetterQuestionnaireForm')
     	  .formValidation('removeField', $row.find('[name="othr_client_type[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_client_name[' + index + ']"]'))
         /*  .formValidation('removeField', $row.find('[name="othr_client_addr[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_client_mgr[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_client_mgr_email[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_client_mgr_extn[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_emp_email_client[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_emp_client_extn[' + index + ']"]')) */
          .formValidation('removeField', $row.find('[name="othr_line1[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_line2[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_city[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_state[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_fed_id[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_zipcode[' + index + ']"]'))
          .formValidation('removeField', $othr_client_name);

     // Remove element containing the fields
     $row.remove();
       })
       .on('added.field.fv', function(e, data) {
           if (data.field === 'othr_client_name[]') {
               if ($('#ClientVendorLetterQuestionnaireForm').find(':visible[name="othr_client_name[]"]').length >= MAX_OPTIONS) {
                   $('#ClientVendorLetterQuestionnaireForm').find('.addButton').attr('disabled', 'disabled');
               }
             }
        })
        .on('removed.field.fv', function(e, data) {
            if (data.field === 'othr_client_name[]') {
                 if ($('#ClientVendorLetterQuestionnaireForm').find(':visible[name="othr_client_name[]"]').length <= MAX_OPTIONS) {
                     $('#ClientVendorLetterQuestionnaireForm').find('.addButton').removeAttr('disabled');
                 }
             }
}).on('change', '[name="othr_client_type[]"]', function(e) { 
	//alert($(this).find(":selected").val());
	//alert($(this).attr('value'));
	var val=$(this).attr('id');
	var v1="<span style='color:red;'>*</span>";
    $('#client_name_label'+val).html(v1+$(this).find(":selected").val());
	//$('#ma').find("label[id=baa]").html("1");
}).on('click', '[name="workinglocation"]', function(e) {
    //var checkBox = document.getElementById("workinglocation");
    var checkBox1=$("input[name='workinglocation']:checked").val();
    if($("#cvlclient_id").val()!=""){
    	 if(checkBox1=='Remote/Home'){
    		 $("#remoteAddress").show();
    	 }else if(checkBox1=='EndClient'){
    		 $("#remoteAddress").hide();
    	 }
    }else{
    	 if(checkBox1=='Remote/Home'){
    			//alert("**if***"+checkBox.checked);
    		   $("#remoteAddress").show();
    		    $('#ClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','remote_line1',true);
    		    $('#ClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','remote_line2',true);
    		    $('#ClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','remote_city',true);
    		    $('#ClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','remote_state',true);
    		    $('#ClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','remote_zipcode',true);
    		   // $('#ClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','remote_county',true);
    		   // $('#ClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','remote_soc_code',true);
    	 }else if(checkBox1=='EndClient'){
    			//alert("**else**"+checkBox.checked);
    	       $("#remoteAddress").hide();
    	       $('#ClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','remote_line1',false);
    		    $('#ClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','remote_line2',false);
    		    $('#ClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','remote_city',false);
    		    $('#ClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','remote_state',false);
    		    $('#ClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','remote_zipcode',false);
    		   // $('#ClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','remote_county',true);
    		 //   $('#ClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','remote_soc_code',true);
    	     } 
    }
    
	
});

 
if($("#cvlclient_id").val()!=""){
	$("#startdate").datepicker({
	}).on('changeDate', function(selected) {
		 var minDate = new Date(selected.date.valueOf());
		 $("#enddate").prop("disabled",false);
	     $('#enddate').datepicker('setStartDate', minDate);
		 $('#ClientVendorLetterQuestionnaireForm').formValidation('revalidateField', 'startdate');
	});
	$("#enddate").datepicker({
	}).on('changeDate', function(selected) {
		var minDate = new Date(selected.date.valueOf());
	    $('#startdate').datepicker('setEndDate', minDate);
		 $('#ClientVendorLetterQuestionnaireForm').formValidation('revalidateField', 'enddate');
	});	
	var tstdate=new Date($("#tstart_date").val());
	if($("#tstart_date").val()!=""){
		 $('#enddate').datepicker('setStartDate', tstdate);
		 $("#enddate").prop("disabled",false);
	}
}else{
	$("#startdate").datepicker({
	}).on('changeDate', function(selected) {
		 var minDate = new Date(selected.date.valueOf());
		 $("#enddate").prop("disabled",false);
	     $('#enddate').datepicker('setStartDate', minDate);
		 $('#ClientVendorLetterQuestionnaireForm').formValidation('revalidateField', 'startdate');
	});
	$("#enddate").datepicker({
	}).on('changeDate', function(selected) {
		var minDate = new Date(selected.date.valueOf());
	    $('#startdate').datepicker('setEndDate', minDate);
		 $('#ClientVendorLetterQuestionnaireForm').formValidation('revalidateField', 'enddate');
	});	
}
 
if($("#client_id").val()!=""){
	var cvlrejectedfields= $("#rejectedfields").val();
	var rejform_status= $("#rejform_status").val();
	if(rejform_status=='Rejected'){
		$("#updateClientVendorLetterQuestionnaireForm :input").attr("readonly", true);
		 if(cvlrejectedfields.includes("benef_full_name")){
 			$("#ubenef_full_name"). prop("readonly", false);
 		}else{
 			$("#ubenef_full_name"). prop("readonly", true);
 		}
 	   if(cvlrejectedfields.includes("benef_job_title")){
 			$("#ubenef_job_title"). prop("readonly", false);
 		}else{
 			$("#ubenef_job_title"). prop("readonly", true);
 		}
 	   if(cvlrejectedfields.includes("startdate")){
 			$("#ustartdate"). prop("readonly", false);
 		}else{
 			$("#ustartdate"). prop("readonly", true);
 		}
 	   if(cvlrejectedfields.includes("enddate")){
 			$("#uenddate"). prop("readonly", false);
 		}else{
 			$("#uenddate"). prop("readonly", true);
 		}
 	   if(cvlrejectedfields.includes("jobduties")){
 			$("#ujobduties"). prop("readonly", false);
 		}else{
 			$("#ujobduties"). prop("readonly", true);
 		}
 	  /*  benef_full_name benef_job_title startdate enddate
 	   client_name line1 line2 state city zipcode 
 	  jobduties workinglocation reportingTo
 	  reporting_mgr_name reporting_mgr_title reporting_mgr_contact reporting_mgr_email */
 	  
 	   
 	   if(cvlrejectedfields.includes("client_name")){
 			$("#uclient_name"). prop("readonly", false);
 		}else{
 			$("#uclient_name"). prop("readonly", true);
 		}
 	   if(cvlrejectedfields.includes("line1")){
 			$("#uline1"). prop("readonly", false);
 		}else{
 			$("#uline1"). prop("readonly", true);
 		}
 		if(cvlrejectedfields.includes("line2")){
 		     $("#uline2"). prop("readonly", false);
 		}else{
 			 $("#uline2"). prop("readonly", true);
 		}  
 		if(cvlrejectedfields.includes("city")){
 		  $("#ucity"). prop("readonly", false);
 		}else{
 			$("#ucity"). prop("readonly", true);
 		}

 		if(cvlrejectedfields.includes("state")){
 		    $("#ustate"). prop("readonly", false);
 		}else{
 			$("#ustate"). prop("readonly", true);
 		}
 		if(cvlrejectedfields.includes("zipcode")){
 		    $("#uzipcode"). prop("readonly", false);
 		}else{
 			$("#uzipcode"). prop("readonly", true);
 		}  
 		if(cvlrejectedfields.includes("workinglocation")){
 			//$("#uworkinglocation"). prop("readonly", false);
 			//$('input[name=uworkinglocation]').prop('readonly', false);
 			  $("#uworkinglocation1,#uworkinglocation2"). prop("disabled", false);
 		}else{
 			//$("#uworkinglocation"). prop("readonly", true);
 			//$('input[name=uworkinglocation]').prop('readonly', true);
 			  $("#uworkinglocation1,#uworkinglocation2"). prop("disabled", true);
 		}
 		if(cvlrejectedfields.includes("reportingTo")){
 		     $("#ureportingTo2,#ureportingTo1"). prop("disabled", false);
 			//$('input[name=ureportingTo]').attr('readonly', false);
 		}else{
 			  $("#ureportingTo2,#ureportingTo1"). prop("disabled", true);
 			//$('input[name=ureportingTo]').attr('readonly', true);
 		} 
 		
 		if(cvlrejectedfields.includes("reporting_mgr_name")){
 			$("#ureporting_mgr_name"). prop("readonly", false);
 		}else{
 			$("#ureporting_mgr_name"). prop("readonly", true);
 		}
 		if(cvlrejectedfields.includes("reporting_mgr_title")){
 		     $("#ureporting_mgr_title"). prop("readonly", false);
 		}else{
 			 $("#ureporting_mgr_title"). prop("readonly", true);
 		}  
 		if(cvlrejectedfields.includes("reporting_mgr_contact")){
 		  $("#ureporting_mgr_contact"). prop("readonly", false);
 		}else{
 			$("#ureporting_mgr_contact"). prop("readonly", true);
 		}

 		if(cvlrejectedfields.includes("reporting_mgr_email")){
 		    $("#ureporting_mgr_email"). prop("readonly", false);
 		}else{
 			$("#ureporting_mgr_email"). prop("readonly", true );
 		}
 		$("[id='otherclientid']").each(function(){
			var id=$(this).val();
			if(cvlrejectedfields.includes(id)){
				 $("#uothrclienttype"+id).attr("readonly", false);
				 $("#uotherclient_name"+id).attr("readonly", false);
				 $("#uotherline1"+id).attr("readonly", false);
				 $("#uotherline2"+id).attr("readonly", false);
				 $("#uothercity"+id).attr("readonly", false);
				 $("#uotherstate"+id).attr("readonly", false);
				 $("#uotherzipcode"+id).attr("readonly", false);
			}else{
				
				/* $("#uothrclienttype"+id+" option").hide;
				  $("#uothrclienttype"+id+" option[value^='" + value + "']").show(); */
				  var value=$("#uothrclienttype"+id).val();
				  $("#uothrclienttype"+id).children('option').hide();
				  $("#uothrclienttype"+id).children("option[value^='" + value + "']").show();
			}
	     });
	}else if(rejform_status=='Approved'){
		$("#updateClientVendorLetterQuestionnaireForm :input").attr("disabled", true);
		$("#resetbtnId").attr("disabled", false);
	}
	//cvlbtnUpdate
$("#ustartdate").datepicker({
}).on('changeDate', function(selected) {
	 var minDate = new Date(selected.date.valueOf());
     $('#uenddate').datepicker('setStartDate', minDate);
	 $('#updateClientVendorLetterQuestionnaireForm').formValidation('revalidateField', 'ustartdate');
});
$("#uenddate").datepicker({
}).on('changeDate', function(selected) {
	var minDate = new Date(selected.date.valueOf());
    $('#ustartdate').datepicker('setEndDate', minDate);
	 $('#updateClientVendorLetterQuestionnaireForm').formValidation('revalidateField', 'uenddate');
});
var stdate=new Date($("#start_date").val());
if($("#start_date").val()!=""){
	$('#uenddate').datepicker('setStartDate', stdate);
}
}
/* .on('change', '[name="othr_client_type[]"]', function(e) { 
	alert( $(this).find(":selected").val() );
    // $othr_client_type = $row.find('[name="othr_client_type[]"]');
}); 
$('select[name="othr_client_type[]"]').change(function(e) {
	  // this line gives me the value after the change event.
	  var othr_client_type = $(this).val();
	  alert(othr_client_type);
});*/
$("#cvlresetid").click(function(){
	getsesVal().done(function(data){
	if(data!=""){
	 window.location.href="clientvendorquestionnaire";
	}else{
			 window.location.href="loginpage";
		}
	});	 
});
$("#cvlsaveid").click(function(event) {
	getsesVal().done(function(data){
		if(data!=""){
event.preventDefault();
if($('#benef_full_name').val()==""){
	$("#benef_full_name").focus();
}else if($('#benef_job_title').val()==""){
	$("#benef_job_title").focus();
}else if($('#client_name').val()==""){
	$("#client_name").focus();	
}else{
	$("#cvlsaveid").attr("disabled", true);
	var form = $('#ClientVendorLetterQuestionnaireForm')[0];
	var data = new FormData(form);
	$.ajax({
		url : "saveclientvendorletterquestionnaireTemp", //this is the submit URL
		type : "POST",
		enctype : 'multipart/form-data',
		data : data,
		processData : false,
		contentType : false,
		cache : false,
		success : function(data) {
			 if(data!="" || data!=null){
				 alert("Details saved successfully");
				 window.location.href="clientvendorquestionnaire";
   	   	         }
   	   	     else{
   	   	          window.location.href="loginpage";
   	   	   	      }
		 }
	 });
   }
		}else{
			 window.location.href="loginpage";
		}
	});	   
});
$("#cvlsubmitid").click(function(event) {
	 getsesVal().done(function(data){  
         if(data!=""){
	event.preventDefault();
	$('#ClientVendorLetterQuestionnaireForm').formValidation('validate');
 if (!$('#ClientVendorLetterQuestionnaireForm').data('formValidation').isValid()) {
	   // alert("Not Valid");
	   //$("#spanError").text("Please select atleast one Amendment");
	// $("#cvlsaveid").attr("disabled", false);
	} else { 
		
	/* 	var unique;
		$("input[name='aadhar[]']").each(function(e) {
	        var ar = $("input[name='aadhar[]']").map(function() {
	    	    if($(this).val() != '') 
	    	     return $(this).val()
	    	  }).get();	
	 
	    	  unique = ar.filter(function(item, pos) {
	    	    return ar.indexOf(item) != pos;
	    	  });	
	    })	
   if(unique.length!= 0){
	    alert("Duplicate Aadhar not allowed")  
	} else { */		
		$("#cvlsubmitid").attr("disabled", true);
		var form = $('#ClientVendorLetterQuestionnaireForm')[0];
		var data = new FormData(form);
		$.ajax({
			url : "saveclientvendorletterquestionnaire", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(data) {
				 if(data!="" || data!=null){
					 alert("Details added successfully");
					 window.location.href="clientvendorquestionnaire";
	   	   	         }
	   	   	     else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			 }
		 });
	  //}
	}
         }else{
             window.location.href="loginpage";
		                }
	                  });
});
</script> 
<script type="text/javascript">
var uothercl=0;
var MAX_OPTIONS = 3;
$('#updateClientVendorLetterQuestionnaireForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {
        ubenef_full_name: {
            validators: {
            	notEmpty: {
                    message: 'Beneficiary Full Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Beneficiary Full Name must be more than 2 and less than 100 characters long'
                },
                regexp: {
                    regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                    message: 'Beneficiary Full Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                }
            }
        }, 
        ubenef_job_title: {
            validators: {
            	notEmpty: {
                    message: 'Beneficiary Job Title is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Beneficiary Job Title must be more than 2 and less than 100 characters long'
                },
                regexp: {
                    regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                    message: 'Beneficiary Job Title accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                }
            }
        }, 
      uclient_name: {
            validators: {
            	notEmpty: {
                    message: 'End Client Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'End Client Name must be more than 2 and less than 100 characters long'
                },
                regexp: {
                    regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                    message: 'End Client Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                }
            }
        },
       uline1 : {
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
      uline2 : {
            validators: {
            	 isEmpty: {
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
        ucity : {
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
        ustate : {
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
        uzipcode : {
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
        ureportingTo :{
	          validators: {
		           	notEmpty: {
		                   message: 'Please select Type '
		               }
		           }
		 },
        ureporting_mgr_name: {
            validators: {
            	 isEmpty: {
                    message: 'End Client Manager Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Reporting Manager Name must be more than 2 and less than 100 characters long'
                },
                regexp: {
                	regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                    message: 'Reporting Manager name accepts alphabets and Space allowed but is not at beginning or end of the word'
                }
            }
        },
        ureporting_mgr_title: {
            validators: {
            	isEmpty: {
                    message: 'Reporting Manager Title is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Reporting Manager Title must be more than 2 and less than 100 characters long'
                },
                regexp: {
                	regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                    message: 'Reporting Manager Title name accepts alphabets and Space allowed but is not at beginning or end of the word'
                }
            }
        },
        ureporting_mgr_email:{
            validators: {
            	isEmpty: {
                    message: 'End Client Manager e-mail is mandatory'
            	 },
                 stringLength: {
                 min: 10,
                 max: 80,
                 message: 'Reporting Manager e-mail must be more than 10 and less than 80 characters long'
                },
                  regexp: {
             	regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
                 message: 'Please enter valid e-mail ID'
             }
           }
      }, 
      ureporting_mgr_contact:{
          validators: {
        	  isEmpty: {
                  message: 'Reporting Manager Contact Number is Not mandatory'
          	  },
               stringLength: {
               min: 12,
               max: 12,
               message: 'Reporting Manager Contact Number must be more 10 or Not less than 10 Numbers long'
              }
          }
      }, 
  ustartdate:{
           validators: {
           	notEmpty: {
                   message: 'Start Date is mandatory'
               },
               date: {
                   format: 'MM/DD/YYYY',
                   message: 'invalid Date'
               }
           }
       },       
    uenddate:{
           validators: {
           	notEmpty: {
                   message: 'End Date is mandatory'
               },
               date: {
                   format: 'MM/DD/YYYY',
                   message: 'invalid Date'
               }
           }
       },
       uothrclienttype:{
           validators: {
  	           	notEmpty: {
  	                   message: 'Please select Type of vendor '
  	               }
  	           }
  	},
   	uotherclient_name: {
          validators: {
          	notEmpty: {
                  message: 'Other Client Name is mandatory'
              },
              stringLength: {
                  min: 2,
                  max: 20,
                  message: 'Other Client Name must be more than 2 and less than 20 characters long'
              },
              regexp: {
              	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                   message: 'Other Client Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
              }
          }
      },
    uotherline1 : {
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
      uotherline2 : {
          validators: {
          	 isEmpty: {
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
      uothercity : {
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
      uotherstate : {
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
      uotherzipcode : {
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
 'uothr_client_type[]':{
	          validators: {
	           	notEmpty: {
	                   message: 'Please select Type of vendor '
	               }
	           }
	       },       
      'uothr_client_name[]': {
        	  validators: {
	              	notEmpty: {
	                      message: 'Name is mandatory'
	                  },
	                  stringLength: {
	                      min: 2,
	                      max: 100,
	                      message: 'Name must be more than 2 and less than 100 characters long'
	                  },
	                  regexp: {
	                	  regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
	                      message: 'Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
	                  }
	              }
	          },
	 'uothr_line1[]' : {
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
     'uothr_line2[]' : {
	            validators: {
	            	 isEmpty: {
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
	  'uothr_city[]' : {
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
	        'uothr_state[]' : {
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
	        'uothr_zipcode[]' : {
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
	        tothrclienttype:{
	            validators: {
	   	           	notEmpty: {
	   	                   message: 'Please select Type of vendor '
	   	               }
	   	           }
	   	},
	    	totherclient_name: {
	           validators: {
	           	notEmpty: {
	                   message: 'Other Client Name is mandatory'
	               },
	               stringLength: {
	                   min: 2,
	                   max: 20,
	                   message: 'Other Client Name must be more than 2 and less than 20 characters long'
	               },
	               regexp: {
	               	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
	                    message: 'Other Client Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
	               }
	           }
	       },
	     totherline1 : {
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
	       totherline2 : {
	           validators: {
	           	 isEmpty: {
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
	       tothercity : {
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
	       totherstate : {
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
	       totherzipcode : {
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
	jobduties : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Job Duties is mandatory'
	                }
	            }
	     },
	     remote_line1 : {
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
       remote_city : {
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
	        remote_state : {
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
	        remote_zipcode : {
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
	        }   
     }
}).on('click', '.addButton', function() {
	uothercl++;
	/* $('#element').removeAttr('style'); */
     var $template = $('#uaddotherclient'),
         $clone    = $template
                         .clone()
                         .removeAttr('style')
                         .removeAttr('id')
                         .attr('data-book-index', uothercl)
                         .insertAfter($template);
     $clone.find('[id="uclient_name_label"]').attr('id','uclient_name_label'+uothercl);
     $clone.find('[name="uothr_client_name[]"]').attr('id','uothr_client_name'+uothercl);
     $clone.find('[name="uothr_client_type[]"]').attr('id',uothercl);
     //$clone=$('#client_name_id').find("label[id=client_name_label]").attr('client_name_label',othercl)
     // Add new field
    /*  $('#client_name_id').find("label[id=client_name_label]").html("1"); */
     $('#updateClientVendorLetterQuestionnaireForm')
     .formValidation('addField', $clone.find('[name="uothr_client_type[]"]'))
     .formValidation('addField', $clone.find('[name="uothr_client_name[]"]'))
     .formValidation('addField', $clone.find('[name="uothr_line1[]"]'))
     .formValidation('addField', $clone.find('[name="uothr_line2[]"]'))
     .formValidation('addField', $clone.find('[name="uothr_city[]"]'))
     .formValidation('addField', $clone.find('[name="uothr_state[]"]'))
     .formValidation('addField', $clone.find('[name="uothr_zipcode[]"]'));
 })
 .on('click', '.removeButton', function() {
        var $row  = $(this).parents('.form-group'),
        index = $row.attr('data-book-index');
        $othr_client_name = $row.find('[name="othr_client_name[]"]');
     // Remove fields
     uothercl--;
     $('#updateClientVendorLetterQuestionnaireForm')
     	  .formValidation('removeField', $row.find('[name="uothr_client_type[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="uothr_client_name[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="uothr_line1[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="uothr_line2[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="uothr_city[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="uothr_state[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="uothr_fed_id[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="uothr_zipcode[' + index + ']"]'))
          .formValidation('removeField', $othr_client_name);

     // Remove element containing the fields
     $row.remove();
       })
       .on('added.field.fv', function(e, data) {
           if (data.field === 'othr_client_name[]') {
               if ($('#updateClientVendorLetterQuestionnaireForm').find(':visible[name="uothr_client_name[]"]').length >= MAX_OPTIONS) {
                   $('#updateClientVendorLetterQuestionnaireForm').find('.addButton').attr('disabled', 'disabled');
               }
             }
        })
        .on('removed.field.fv', function(e, data) {
            if (data.field === 'othr_client_name[]') {
                 if ($('#updateClientVendorLetterQuestionnaireForm').find(':visible[name="uothr_client_name[]"]').length <= MAX_OPTIONS) {
                     $('#updateClientVendorLetterQuestionnaireForm').find('.addButton').removeAttr('disabled');
                 }
             }
}).on('change', '[name="uothr_client_type[]"]', function(e) { 
	//alert($(this).find(":selected").val());
	//alert($(this).attr('value'));
	var val=$(this).attr('id');
	var v1="<span style='color:red;'>*</span>";
    $('#uclient_name_label'+val).html(v1+$(this).find(":selected").val());
	//$('#ma').find("label[id=baa]").html("1");
}).on('click', '[name="uworkinglocation"]', function(e) {
    var checkBox1=$("input[name='uworkinglocation']:checked").val();
    if($("input[name='uworkinglocation']:checked").val()==$('#working_location').val())
		{ 
   	 document.getElementById('cvlbtnUpdate').disabled=true;
		}else if($("input[name='uworkinglocation']:checked").val()!=$('#working_location').val()){
			document.getElementById('cvlbtnUpdate').disabled=false;
		  }
   //  alert("checkBox1"+checkBox1);
	 if(checkBox1=='Remote/Home'){
		//alert("**if***"+checkBox.checked);
	    $("#uremoteAddress").show();
	    $('#updateClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','uremote_line1',true);
	    $('#updateClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','uremote_line2',true);
	    $('#updateClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','uremote_city',true);
	    $('#updateClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','uremote_state',true);
	    $('#updateClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','uremote_zipcode',true);
   }else if(checkBox1=='EndClient'){
 	//	alert("**else**"+checkBox);
         $("#uremoteAddress").hide();
         $('#updateClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','uremote_line1',false);
 	    $('#updateClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','uremote_line2',false);
 	    $('#updateClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','uremote_city',false);
 	    $('#updateClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','uremote_state',false);
 	    $('#updateClientVendorLetterQuestionnaireForm').formValidation('enableFieldValidators','uremote_zipcode',false);
      } 
});

$("#cvlbtnUpdate").click(function(event) {
	 getsesVal().done(function(data){  
         if(data!=""){
	event.preventDefault();
	$('#updateClientVendorLetterQuestionnaireForm').formValidation('validate');
 if (!$('#updateClientVendorLetterQuestionnaireForm').data('formValidation').isValid()) {
	   // alert("Not Valid");
	   //$("#spanError").text("Please select atleast one Amendment");
	} else { 
		
	/* 	var unique;
		$("input[name='aadhar[]']").each(function(e) {
	        var ar = $("input[name='aadhar[]']").map(function() {
	    	    if($(this).val() != '') 
	    	     return $(this).val()
	    	  }).get();	
	 
	    	  unique = ar.filter(function(item, pos) {
	    	    return ar.indexOf(item) != pos;
	    	  });	
	    })	
   if(unique.length!= 0){
	    alert("Duplicate Aadhar not allowed")  
	} else { */		
		$("#cvlcvlbtnUpdate").attr("disabled", true);
		var form = $('#updateClientVendorLetterQuestionnaireForm')[0];
		var data = new FormData(form);
		$.ajax({
			url : "updateclientvendorletterquestionnaire", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(data) {
				 if(data!="" || data!=null){
					 alert("Details updated successfully");
					 window.location.href="clientvendorquestionnaire";
	   	   	         }
	   	   	     else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			 }
		 });
	  //}
	}
         }else{
             window.location.href="loginpage";
		                }
	                  });
});

 //working_location reporting_to 
/* $('#ujobduties').on('keyup', function() {
	 if($('#ujobduties').val()==$('#job_duties').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
 });
 
$('#ubenef_full_name').on('keyup', function() {
	 if($('##u').val()==$('#benef_fullname').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
  });

$('#ubenef_job_title').on('keyup', function() {
	 if($('#ubenef_job_title').val()==$('#benef_jobtitle').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
  });

$('#ustartdate').on('change', function() {
	 if($('#ustartdate').val()==$('#start_date').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
  });

$('#uenddate').on('change', function() {
	 if($('#uenddate').val()==$('#end_date').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
});



$('#ureporting_mgr_name').on('keyup', function() {
	 if($('#ureporting_mgr_name').val()==$('#reporting_mgrname').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
 });

$('#ureporting_mgr_title').on('keyup', function() {
	 if($('#ureporting_mgr_title').val()==$('#reporting_mgrtitle').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
 });

$('#ureporting_mgr_contact').on('change', function() {
	 if($('#ureporting_mgr_contact').val()==$('#reporting_mgrcontact').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
 });

$('#ureporting_mgr_email').on('change', function() {
	 if($('#ureporting_mgr_email').val()==$('#reporting_mgremail').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
});

$('#uclient_name').on('keyup', function() {
	 if($('#uclient_name').val()==$('#clientName').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
 });

$('#uline1').on('keyup', function() {
	 if($('#line1').val()==$('#cline1').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
  });
$('#uline2').on('keyup', function() {
	 if($('#line2').val()==$('#cline2').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
  });

$('#ucity').on('keyup', function() {
	 if($('#city').val()==$('#ccity').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
  });
$('#ustate').on('keyup', function() {
	 if($('#state').val()==$('#cstate').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
  });
$('#uzipcode').on('keyup', function() {
	 if($('#zipcode').val()==$('#zipcode').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
  });

$('#uremote_line1').on('keyup', function() {
	 if($('#uremote_line1').val()==$('#rline1').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
 });
$('#uremote_line2').on('keyup', function() {
	 if($('#uremote_line2').val()==$('#rline2').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
 });

$('#uremote_city').on('keyup', function() {
	 if($('#uremote_city').val()==$('#rcity').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
 });
$('#uremote_state').on('keyup', function() {
	 if($('#uremote_state').val()==$('#rstate').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
 });
$('#uremote_zipcode').on('keyup', function() {
	 if($('#uremote_zipcode').val()==$('#rzipcode').val())
	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
 });

$("[id='otherclientid']").each(function(){
	 var id=$(this).val();
	 $('#uotherclient_name'+id).on('keyup', function() {
	 	 if($('#uotherclient_name'+id).val()==$('#otherclient_name1'+id).val())
	 	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
	   });
	 $('#uotherline1'+id).on('keyup', function() {
	 	 if($('#uotherline1'+id).val()==$('#otherline11'+id).val())
	 	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
	   });
	 $('#uotherline2'+id).on('keyup', function() {
	 	 if($('#uotherline2'+id).val()==$('#otherline21'+id).val())
	 	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
	   });
	 
	 $('#uothercity'+id).on('keyup', function() {
	 	 if($('#uothercity'+id).val()==$('#othercity21'+id).val())
	 	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
	   });
	 $('#uotherstate'+id).on('keyup', function() {
	 	 if($('#uotherstate'+id).val()==$('#otherstate21'+id).val())
	 	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
	   });
	 $('#uotherzipcode'+id).on('keyup', function() {
	 	 if($('#uotherzipcode'+id).val()==$('#otherzipcode21'+id).val())
	 	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
	   });
	 $('#uothrclienttype'+id).on('change', function() {
	 	 if($('#uothrclienttype'+id).val()==$('#otherclient_type'+id).val())
	 	{document.getElementById('cvlbtnUpdate').disabled=true;}else{document.getElementById('cvlbtnUpdate').disabled=false;} 
	   });
	 var otherclient_type=$("#otherclient_type"+id).val();
	 if(otherclient_type!=""){
	 	//$('#othrclienttype'+id).eq(otherclient_type).prop('selected', true);
	  		varÂ $dropdown2Â =Â $("select[name='othrclienttype']");
			Â $dropdown2.find('option[value="'Â +Â otherclient_typeÂ +Â '"]').attr('selected', true);
	 	//$dropdown1.find('option[value="'Â +Â otherclient_typeÂ +Â '"]').attr('selected', true); 
	 } 
}); */
</script>
<script type="text/javascript">
/* $('select[name="othr_client_type[]"]').change(function(e) {
	   var othr_client_type = $(this).val();
	  alert(othr_client_type); 
	  var $row  = $(this).parents('.form-group'),
	  index = $row.attr('data-book-index');
	  alert(index);
}); */

//$('#client_name_id').find("label[id=client_name_label]").attr('client_name_label',othercl)
$('form').on('reset', function() {
$('#ClientVendorLetterQuestionnaireForm').data('formValidation').resetForm();
});
$('input[name="reporting_mgr_contact"]').mask('999-999-9999');
$('input[name="ureporting_mgr_contact"]').mask('999-999-9999');

var workloc=$("#working_location").val();
if(workloc=='Remote/Home'){
$("#uremoteAddress").show();
$("#uworkinglocation1"). prop("checked", true);
}else{	
$("#uworkinglocation2"). prop("checked", true);
}
var reporting_to=$("#reporting_to").val();
if(reporting_to=='Client'){
$("#ureportingTo2"). prop("checked", true);
}else{	
$("#ureportingTo1"). prop("checked", true);
}

var tworkloc=$("#tworking_location").val();
if(tworkloc!=''){
if(tworkloc=='Remote/Home'){
$("#remoteAddress").show();
$("#workinglocation1"). prop("checked", true);
}else{	
$("#workinglocation2"). prop("checked", true);
}
}
var treporting_to=$("#treporting_to").val();
if(treporting_to!=''){
if(treporting_to=='Client'){
$("#reportingTo2"). prop("checked", true);
}else{	
$("#reportingTo1"). prop("checked", true);
}
}
 


var tablech = $('#commentshistoryTable').DataTable({
	"order" : [ [ 0, "desc" ] ],
	lengthMenu : [ [ 5, 10, 15, -1 ], [ 5, 10, 15, "All" ] ],
	bLengthChange : true,
	paging : true
});
function viewCommentHistory(candId,formtype) {
	 getsesVal().done(function(data){  
         if(data!=""){
	$.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/json", // NOT dataType!
		url : "viewCommentHistorybyCandId",
		data : {
			"candId" : candId,
			"form_type" : formtype
		},
		success : function(response) {
			if (tablech)tablech.clear();
			$('#commentshistoryTable').dataTable().fnClearTable();
			if (response!="") {
				
				for (var i = 0; i < response.length; i++) {
					const decisionDate = '/Date('+response[i].submitted_date+')/';
					const d = new Date(decisionDate.match(/\d+/)[0] * 1);
					const formattedDate = d.getFullYear()+'-'+("0"+(d.getMonth()+1)).slice(-2)+'-'+("0"+d.getDate()).slice(-2)
					
					tablech.row.add(
						          [ '' + response[i].status + '',
									'' + response[i].comments + '',
									'' + response[i].submittedby_name + '',
									'' +response[i].submitted_date + ''
									]).draw();
				}
			}
			$('#commentshistory').modal('show');
		}
	});
         }else{
             window.location.href="loginpage";
		                }
	                  });
}
$("#cvlbtnBackadmin").click(function(event) {
	//event.preventDefault();
	window.history.back();
	// $("#candidate").trigger('change');
});	
$("#cvlbtnUpdateadmin").click(function(event) {
	getsesVal().done(function(data){  
        if(data!=""){
	event.preventDefault();
 	var candidateId=$("#candidateId").val();
		$('#updatecvlimmiformstausId').formValidation('validate');
	 if (!$('#updatecvlimmiformstausId').data('formValidation').isValid()) {
		   // alert("Not Valid");
		   //$("#spanError").text("Please select atleast one Amendment");
		} else {
		$("#cvlbtnUpdateadmin").attr("disabled", true);
		var form = $('#updatecvlimmiformstausId')[0];
		var data = new FormData(form);
		$.ajax({
			url : "updatecvlimmiformstaus", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(data) {
				 if(data!="" || data!=null){
					 alert("Details updated successfully");
					 //window.location.href="clientvendorquestionnaire";
					 window.location.href="cvlqueadmin?candidateId="+candidateId+""
	   	   	         }
	   	   	     else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			 }
		 });
	}/* else { 
		$("#approveStatus,#candicomments").focus();
	} */
        }else{
            window.location.href="loginpage";
	                }
                  });
});

$('#updatecvlimmiformstausId').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {
    	approveStatus:{
	          validators: {
	           	notEmpty: {
	                   message: 'Please select status '
	               }
	           }
	       },
	  candicomments : {
			validators : {
				notEmpty : {
					message : 'Comments required. '
				},
				stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Comments must be more than 2 and less than 100 characters long. '
                }/* ,
                regexp: {
                	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &.\/-]*)?$/,
                     message: 'Document Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                } */
			}
		  }
      }
});
var vstatus=$("#verifierStatus").val();
var $dropdown4=$("select[name='approveStatus']");
$dropdown4.find('option[value="'+vstatus+'"]').text(vstatus).attr('selected', true);
if($("#roleid").val()==4){
	//$('#updateClientVendorLetterQuestionnaireForm input').attr('readonly', 'readonly');
	$("#updateClientVendorLetterQuestionnaireForm :input").attr("disabled", true);
}
/* $('input[name="empdeskNumber"]').mask('999-999-9999');
$('input[name="fed_id"]').mask('99-9999999');
$('input[name="remote_soc_code"]').mask('99-9999');
$('input[name="othr_fed_id[]"]').mask('99-9999999');
$('input[name="othr_client_mgr_extn[]"]').mask('999-999-9999');
$('input[name="othr_emp_client_extn[]"]').mask('999-999-9999'); 

   benef_full_name benef_job_title startdate enddate
   client_name line1 line2 state city zipcode 
  jobduties workinglocation reportingTo
  reporting_mgr_name reporting_mgr_title reporting_mgr_contact reporting_mgr_email

*/
function loadStatus1() {
	 var slist = ["Approved"];
	 var slist1 = ["Rejected"];
	$('#rejstatusid').empty();
	$('#rejstatusid').append(
	$('<option/>').attr("value", '').text("Select Status"));
	for (var i = 0; i < slist.length; i++) {
		$('#rejstatusid').append(
				$('<option/>').attr("value", slist[i]).text("Approve"));
	}
	for (var i = 0; i < slist1.length; i++) {
		$('#rejstatusid').append(
				$('<option/>').attr("value", slist1[i]).text("Reject"));
	}
}
jQuery(document).on('click', '.collapsibleCvlAdmin', function(){
	//alert($("#client_id").val());btnh1bCvlAdmin
	$("#rejh1que_id").val($("#client_id").val());
	$("#rejcand_id").val($("#candidateId").val());
	var h1que_id=$("#client_id").val();
	$("#rejprof_type").val("Applicant");
	var benf_type="Applicant";
	var form_type="Client Vendor Questionnaire Letter";
	ajaxCall(h1que_id,benf_type,form_type);
});
   function ajaxCall(h1que_id,benf_type,form_type){
		loadStatus1();
	    $('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4,#rejDiv5,#rejDiv6,#rejDiv7,#rejothercvlDiv8').hide();
		$.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/json", // NOT dataType!
		url : "getrejectedfields",
		data : {
			h1bqueid : h1que_id,
			benf_type : benf_type,
			form_type : form_type
		      },
		success : function(response) {
			   var rejformsObj=response.rejformsObj;
			   var cvlAddressList=response.cvlAddressList;
		  if(response.rejformsObj!=null){
			   var $dd = $("select[name='rejstatusid']");
		       $dd.find('option[value="' + rejformsObj.form_status + '"]').text(rejformsObj.form_status).attr('selected', true);
		    
		       if(rejformsObj.rejectioncoments!="" || rejformsObj.rejectioncoments!=null){
				    $("#rejectComments").val(rejformsObj.rejectioncoments);
		          }else{
		        	$("#rejectComments").val('');  
		          }
		       if(rejformsObj.rejectedfields!=null){
		    	   $('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4,#rejDiv5,#rejDiv6,#rejDiv7,#rejothercvlDiv8').show();
		    	   if(rejformsObj.rejectedfields.includes("benef_full_name")){
		    			$("#rejbenef_full_name"). prop("checked", true);
		    		}else{
		    			$("#rejbenef_full_name"). prop("checked", false);
		    		}
		    	   if(rejformsObj.rejectedfields.includes("benef_job_title")){
		    			$("#rejbenef_job_title"). prop("checked", true);
		    		}else{
		    			$("#rejbenef_job_title"). prop("checked", false);
		    		}
		    	   if(rejformsObj.rejectedfields.includes("startdate")){
		    			$("#rejstartdate"). prop("checked", true);
		    		}else{
		    			$("#rejstartdate"). prop("checked", false);
		    		}
		    	   if(rejformsObj.rejectedfields.includes("enddate")){
		    			$("#rejenddate"). prop("checked", true);
		    		}else{
		    			$("#rejenddate"). prop("checked", false);
		    		}
		    	   if(rejformsObj.rejectedfields.includes("jobduties")){
		    			$("#rejjobduties"). prop("checked", true);
		    		}else{
		    			$("#rejjobduties"). prop("checked", false);
		    		}
		    	  /*  benef_full_name benef_job_title startdate enddate
		    	   client_name line1 line2 state city zipcode 
		    	  jobduties workinglocation reportingTo
		    	  reporting_mgr_name reporting_mgr_title reporting_mgr_contact reporting_mgr_email */
		    	   
		    	   if(rejformsObj.rejectedfields.includes("client_name")){
		    			$("#rejclient_name"). prop("checked", true);
		    		}else{
		    			$("#rejclient_name"). prop("checked", false);
		    		}
		    	   if(rejformsObj.rejectedfields.includes("line1")){
		    			$("#rejline1"). prop("checked", true);
		    		}else{
		    			$("#rejline1"). prop("checked", false);
		    		}
		    	  //alert(rejformsObj.rejectedfields);
		    		if(rejformsObj.rejectedfields.includes("line2")){
		    		     $("#rejline2"). prop("checked", true);
		    		}else{
		    			 $("#rejline2"). prop("checked", false);
		    		}  
		    		if(rejformsObj.rejectedfields.includes("city")){
		    		  $("#rejcity"). prop("checked", true);
		    		}else{
		    			$("#rejcity"). prop("checked", false);
		    		}

		    		if(rejformsObj.rejectedfields.includes("state")){
		    		    $("#rejstate"). prop("checked", true);
		    		}else{
		    			$("#rejstate"). prop("checked", false);
		    		}
		    		if(rejformsObj.rejectedfields.includes("zipcode")){
		    		    $("#rejzipcode"). prop("checked", true);
		    		}else{
		    			$("#rejzipcode"). prop("checked", false);
		    		}  
		    		
		    		if(rejformsObj.rejectedfields.includes("workinglocation")){
		    			$("#rejworkinglocation"). prop("checked", true);
		    		}else{
		    			$("#rejworkinglocation"). prop("checked", false);
		    		}
		    		if(rejformsObj.rejectedfields.includes("reportingTo")){
		    		     $("#rejreportingTo"). prop("checked", true);
		    		}else{
		    			 $("#rejreportingTo"). prop("checked", false);
		    		} 
		    		
		    		if(rejformsObj.rejectedfields.includes("reporting_mgr_name")){
		    			$("#rejreporting_mgr_name"). prop("checked", true);
		    		}else{
		    			$("#rejreporting_mgr_name"). prop("checked", false);
		    		}
		    		if(rejformsObj.rejectedfields.includes("reporting_mgr_title")){
		    		     $("#rejreporting_mgr_title"). prop("checked", true);
		    		}else{
		    			 $("#rejreporting_mgr_title"). prop("checked", false);
		    		}  
		    		if(rejformsObj.rejectedfields.includes("reporting_mgr_contact")){
		    		  $("#rejreporting_mgr_contact"). prop("checked", true);
		    		}else{
		    			$("#rejreporting_mgr_contact"). prop("checked", false);
		    		}

		    		if(rejformsObj.rejectedfields.includes("reporting_mgr_email")){
		    		    $("#rejreporting_mgr_email"). prop("checked", true);
		    		}else{
		    			$("#rejreporting_mgr_email"). prop("checked", false);
		    		}
		       
		       }
		     if(cvlAddressList!="" && cvlAddressList.length>0){
		    	  $('#rejothercvlDiv').empty(); 
		      	  for(var i=0;i<cvlAddressList.length;i++){
			         $('#rejothercvlDiv').append("<div class=' form-group row'><label class='col-sm-7 col-form-label'>"+cvlAddressList[i].company_type+"<span style='color:blue;'>&nbsp;&nbsp;"+cvlAddressList[i].name+"&nbsp;&nbsp;"+cvlAddressList[i].client_id+"</span></label><input type='checkbox' name='applRejects' id='applRejects"+i+"' value='"+cvlAddressList[i].client_id+"' style='width: 20px;height: 20px;'/></div></div>");
			         if(rejformsObj.rejectedfields!=null){
			         if(rejformsObj.rejectedfields.includes(cvlAddressList[i].client_id)){
			        	 $("#applRejects"+i). prop("checked", true);
			   	      }else{
			   	    	$("#applRejects"+i). prop("checked", false);
			   	      }
			         }
		      	    }
			  }
	
		}else{
			$('input[name=applRejects]').attr('checked', false);
			$("#rejectComments").val(''); 
			//alert(cvlAddressList);
			if(cvlAddressList!="" && cvlAddressList.length>0){
		    	  $('#rejothercvlDiv').empty(); 
		      	  for(var i=0;i<cvlAddressList.length;i++){
			         $('#rejothercvlDiv').append("<div class=' form-group row'><label class='col-sm-7 col-form-label'>"+cvlAddressList[i].company_type+"<span style='color:blue;'>&nbsp;&nbsp;"+cvlAddressList[i].name+"&nbsp;&nbsp;"+cvlAddressList[i].address_id+"</span></label><input type='checkbox' name='applRejects' id='applRejects"+i+"' value='"+cvlAddressList[i].address_id+"' style='width: 20px;height: 20px;'/></div></div>");
		      	    }
			  }
	   	    }
			$('#h1bRejectionmodal').modal('show');
		   }
		});
   }
   
   $('#h1bRejectionmodal').on('hide.bs.modal', function(){
	     $('#rejectFieldFormid').bootstrapValidator('resetForm', true);
	     loadStatus1();
	     $('input[name=applRejects]').attr('checked', false);
	});
   
   $("#rejectbtnId").click(function(event) {
		getsesVal().done(function(data){
			  if(data!=""){
		event.preventDefault();
	 	var candidateId=$("#candidateId").val();
	 	/*var statusId=$("#approveStatus").val();
		if(statusId!="" && commentId!=""){ */
			$('#rejectFieldFormid').formValidation('validate');
		 if (!$('#rejectFieldFormid').data('formValidation').isValid()) {
			   // alert("Not Valid");
			   //$("#spanError").text("Please select atleast one Amendment");
			} else {
				var sub=false;
				var status=$('#rejstatusid').val();
		        if(status=="Rejected"){
				if($('input[name="applRejects"]').is(':checked'))
				{  sub=true;  }else{	sub=false;	}
		        }else if(status=="Approved"){	sub=true;    }
		     if(sub==true){
			$("#rejectbtnId").attr("disabled", true);
			var form = $('#rejectFieldFormid')[0];
			var data = new FormData(form);
			$.ajax({
				url : "updaterejectfields", //this is the submit URL
				type : "POST",
				enctype : 'multipart/form-data',
				data : data,
				processData : false,
				contentType : false,
				cache : false,
				success : function(data) {
					 if(data!="" || data!=null){
						 alert(data);
						 //alert("fields rejected successfully");
						 //window.location.href="clientvendorquestionnaire";
						    var initiateid="";
						    window.location.href="cvlqueadmin?candidateId="+candidateId+"&&initiateid="+initiateid+"";
		   	   	          }
		   	   	       else{
		   	   	          window.location.href="loginpage";
		   	   	   	      }
				 }
			 });
		     }else{
				   alert("Please check atleast one field to reject")
			   }
		}
	  }else{window.location.href="loginpage";}});
	});

   
   $('#rejectFieldFormid').formValidation({
		framework : 'bootstrap',
		row : {
			valid : 'field-success',
			invalid : 'field-error'
		},
		fields : {
			rejstatusid : {
				validators : {
					notEmpty : {
						message : 'Please select status'
					}
				}
			},
			/* applRejects : {
				validators : {
					notEmpty : {
						message : 'Please select fields'
					}
				}
			}, */
			rejectComments : {
				validators : {
					notEmpty : {
						message : 'Please enter comments'
					}
				}
			}
		}
	});
	$("#rejstatusid").change(function() {
		var status=$('#rejstatusid').val();
		if(status=="Rejected"){
			$('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4,#rejDiv5,#rejDiv6,#rejDiv7').show();	
			  $('#rejothercvlDiv8').show(); 
			/* if(benf_type=='Applicant'){
				 $('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4,#rejDiv5,#rejappl1,#rejappl2,#rejappl3,#rejappl4').show();  
			 }else{
				 $('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4').show(); 
				 $('#rejappl1,#rejappl2,#rejappl3,#rejappl4,#rejDiv5').hide();
			 } */
			  //$('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4,#rejDiv5').show();
			 // $('#rejectFieldFormid').bootstrapValidator('enableFieldValidators','rejectComments',true);
		   }else{
			      $('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4,#rejDiv5,#rejDiv6,#rejDiv7').hide();
			      $('#rejothercvlDiv8').hide(); 
				//  $('#rejectFieldFormid').bootstrapValidator('enableFieldValidators','rejectComments',false);
			}
	});	
	var tablech1 = $('#commentshistoryTable1').DataTable({
		"order" : [ [ 0, "desc" ] ],
		lengthMenu : [ [ 5, 10, 15, -1 ], [ 5, 10, 15, "All" ] ],
		bLengthChange : true,
		paging : true
	});
	function viewCommentHistory1(h1que_id,benf_type,form_type){
		//alert(h1que_id+"**"+benf_type+"**"+form_type);
		getsesVal().done(function(data){
		if(data!=""){
		$.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "viewrejectedfieldshistorybyid",
			data : {
				h1bqueid : h1que_id,
				benf_type : benf_type,
				form_type : form_type
			},
			success : function(response) {
				if (tablech1)tablech1.clear();
				$('#commentshistoryTable1').dataTable().fnClearTable();
				if (response!="") {
					for (var i = 0; i < response.length; i++) {
						var rejfields;	
					   if(response[i].rejectedfields!=null){
						//   rejfields='<div style="overflow-x:auto;width:300px;max-height:200px;">' + response[i].rejectedfields + '</div>';
						   rejfields='<div style="overflow-y:auto;width:400px;max-height:200px;word-wrap: break-word;table-layout: fixed;">' + response[i].rejectedfields + '</div>';
					   }else{
							rejfields="";
							}
					    tablech1.row.add(
							          [ '' + response[i].history_id + '',
							        	'' + response[i].form_status + '',
							        	'' +rejfields+ '',  
										'' + response[i].rejectioncoments + '',
										'' + response[i].varifier_by + '',
										'' +response[i].submitted_on + ''
										]).draw();
					}
				  $('#rejectcommentshistorymodal').modal('show');
				}
			}
		});
			  }else{window.location.href="loginpage";}});
	}   
</script> 
 </body>
</html>
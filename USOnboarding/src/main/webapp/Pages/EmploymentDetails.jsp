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

.col-sm-2 {
	flex: 0 0 14.666667%;
    max-width: 23.666667%;
}
</style>
<body class="sidebar-mini fixed">
<div id="right-panel" class="right-panel">
		<div class="content">
		<div class="animated fadeIn">
		<div class="row">
		<div class="col-md-12">
			<div class="col">
				<div class="card">
					<h5 class="card-header">Add Employment Details</h5>
				<div class="card-body">
				<c:if test="${candformsStatusDBObj.verifier_employment_status ne 'Approved'}">
					<h6 style="text-align-last:end;color:blue">Add Employment&nbsp;<button type="button"  onclick="addEmployment('${candidateId}')"
								style="letter-spacing: 1px; background-color: #15aabf; color: white;"
								class="btn btn-success btn-sm addButton" title="Add Employment">
								<i class="fa fa-plus"></i></button></h6><br>
								</c:if>
								<c:if test="${candformsStatusDBObj.verifier_employment_status eq 'Approved'}">
								<h6 style="text-align-last:end;color:blue">Add Employment&nbsp;<button type="button"  disabled
								style="letter-spacing: 1px; background-color: #15aabf; color: white;"
								class="btn btn-success btn-sm addButton" title="Add Employment">
								<i class="fa fa-plus"></i></button></h6><br>
								</c:if>
					<input type="hidden" id="candidate_id" name="candidate_id" value="${candidateId}">
					<c:if test="${not empty employmentDetailsList}"> 
					<div style="max-width:1150px;" >
					 <center><span><strong style="font-size:20px;color:red;">Employment Details</strong></span></center>
					<table id="customerTable" class="table table-hover table-bordered"
						style="text-align: center;">
						<thead>
							<tr>
								<th style="text-align: center">Company Name</th>
								<th style="text-align: center">Designation</th>
								<th style="text-align: center">Started Year</th>
								<th style="text-align: center">Started Month</th>
								<th style="text-align: center">End Year</th>
								<th style="text-align: center">End Month</th>
							    <th style="text-align: center">Address</th>
								<!-- <th style="text-align: center">Employment</th> -->
								 <th style="text-align: center">Action</th>  
							</tr>
						</thead>
						<tbody>
						 <c:forEach var="employmentList" items="${employmentDetailsList}">
						 	 <tr>   
							    <td>${employmentList.company_name}</td>
							    <td>${employmentList.positionheld}</td>
							    <td>${employmentList.startedYear}</td>
							     <td>${employmentList.startedMonth}</td>
							     <td>${employmentList.workedTillYear}</td>
							     <td>${employmentList.workedTillMonth}</td>
							    <td>${employmentList.line1} <c:if test="${not empty employmentList.line2}">, ${employmentList.line2} </c:if>, ${employmentList.city}, ${employmentList.state}, ${employmentList.zipcode}</td>
							    
							   <%--  <td>${employmentList.employmentType}</td> --%>
							    <td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton" onclick="editEmployment('${employmentList.employment_id}');">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</button></td> 
							</tr>
						  </c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>
			<c:if test="${employmentDetailsList.size()<1}"> 
			<h4 style="text-align-last:center;color:blue">Employment Details Not Yet Added, please click on Add Employment</h4>
			</c:if>
			</div>
		</div>
		</div>
	</div>
	</div>
	
	<div class="text-center ml-3">
		<a class="btn btn-default" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;" href="bgvFormsUser">Back</a> 
	</div>
	
	</div>
		 
		
		<center>
		<div class="modal fade" id="AddEmploymentModal" tabindex="-1"style="overflow-y: hidden;"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top:20px;">
			<div class="modal-dialog modal-lg" style="height:100%;" role="document">
				<div class="modal-content" style="width:140%;height:90%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Employment Details</b>
							</h5>
						</center>
					</div>
					<div class="modal-body" style="overflow-y: auto;">
					<fieldset>
										<form action="/" method="post" id="saveEmploymentDetailsForm" class="form-horizontal" enctype="multipart/form-data" autocomplete="off">
	                                         <div class="form-group row"><label class="col-sm-3 control-label"> Note :
															</label><div class="col-sm-4 control-label"><span style="text-align:left;color:grey;font-size:small;vertical-align:top;">Please do not use abbreviations for company names.</span>
	                                        </div></div>
	                                         <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Company Name</label>
												<div class="col-sm-4">
													<input id="company_name" type="text" title="only alphabets are allowed" minlength="2" maxlength="100"
													autocomplete="off" placeholder="Company Name" name="company_name" class="form-control"  required>
												</div>
											</div>
											
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Position Held</label>
												<div class="col-sm-4">
												<input type="text" name="positionheld" id="positionheld"
													 placeholder="Position Held"  class="form-control" required>
												</div>
											  </div>  
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-5">
												<span style="text-align:left;color:grey;font-size:small;vertical-align:top;"><b>Address (main office and branch where worked)</b><br></span> 
													<input id="line1" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="line1" class="form-control"  required>
												</div>
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
												<div class="col-sm-5">
													<input id="zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" 
													 autocomplete="off" placeholder="Zip Code" name="zipcode" class="form-control"  required>
												</div>
											</div> 					
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Company Telephone</label>
												<div class="col-sm-4">
													<input id="company_tele" type="text" placeholder="Company Telephone" name="company_tele" class="form-control"  required>
												</div>
											</div>
											
											<!-- <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>I am currently working in this role</label>
												<div class="col-sm-1">
													<input type="checkbox" name="currentlyWorking" value="Yes"/><label>Agency</label>&nbsp;<input type="radio" name="employmentType" value="Agency" />
												</div>
											</div> -->
											 
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Is this your current company?</label>
												<div class="col-sm-1">
													<input type="radio" name="currentcompany" value="Yes" checked/>&nbsp;<label>Yes</label>
												</div>
												<div class="col-sm-1">
													<input type="radio" name="currentcompany" value="No" />&nbsp;<label>No</label>
												</div>
											</div>
											
										
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Started Working From</label>
												<div class="col-sm-3">
													 <select class="form-control" id="startedYear" required	name="startedYear">
													<option value="">Select Year</option>
													</select>
												</div>
												<div class="col-sm-3">
													<select class="form-control" id="startedMonth" required	name="startedMonth">
													<option value="">Select Month</option>
													</select>
											   </div>
											</div>
										
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Worked Till</label>
												<div class="col-sm-3">
													 <select class="form-control" id="workedTillYear" required	name="workedTillYear">
												
													</select>
												</div>
												<div class="col-sm-3"> 
												<select class="form-control" id="workedTillMonth" required	name="workedTillMonth">
													</select>
											   </div>
											</div>
										
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Reported to (Name & Position)</label>
												<div class="col-sm-3">
													<input id="reported_to_name" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
														title="only alpha numerics are allowed" placeholder="Reported to Name"
													    autocomplete="off" name="reported_to_name" class="form-control"  >
												</div>
												<div class="col-sm-3">
													<input id="reported_to_position" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
														title="only alpha numerics are allowed" placeholder="Reported to Positon"
													    autocomplete="off" name="reported_to_position" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Name of HR Manager</label>
												<div class="col-sm-4">
													<input id="hrmgr" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="Name of HR Manager" name="hrmgr" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Employment Type</label>
												<div class="col-sm-4">
													<label>Direct</label>&nbsp;<input type="radio" name="employmentType" value="Direct"/>&nbsp;<label>Agency</label>&nbsp;<input type="radio" name="employmentType" value="Agency" />&nbsp;<label>Self-employed</label>&nbsp;<input type="radio" name="employmentType" value="selfEmployed" />
												</div>
											</div>
										
										 <div class="form-group row"><label class="col-sm-3 control-label"> Note :
															</label><div class="col-sm-4 control-label"><span style="text-align:left;color:grey;font-size:small;vertical-align:top;">Please provide above employment contact number and email for verification(Important)</span>
	                                        </div></div>
	                                        	
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Contact Person Name</label>
												<div class="col-sm-4">
												<input type="text" name="cpname" id="cpname" placeholder="Contact Person Name"  class="form-control">
												</div>
											  </div> 
											  
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Contact Person Number</label>
												<div class="col-sm-4">
												<input type="text" name="cpnumber" id="cpnumber" 
													 placeholder="Contact Person Number"  class="form-control">
												</div>
											  </div> 
											  
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Contact person Email Id</label>
												<div class="col-sm-4">
												<input type="text" name="cpemail" id="cpemail" placeholder="Contact person Email Id"  class="form-control">
												</div>
											  </div> 
											  
											 
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Contact Person Name</label>
												<div class="col-sm-4">
												<span style="text-align:left;color:grey;font-size:small;vertical-align:top;"><b>Additional contact details (optional) :</b></span><br>
												<input type="text" name="acpname" id="acpname" placeholder="Contact Person Name"  class="form-control">
												</div>
											  </div> 
											  
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Contact Person Number</label>
												<div class="col-sm-4">
												<input type="text" name="acpnumber" id="acpnumber" 
													 placeholder="Contact Person Number"  class="form-control">
												</div>
											  </div> 
						<center><div class="text-center ml-3">
							<button type="button" id="btnSubmit" class="btn btn-primary btn-sm" onclick="btnClick()">Save</button>
							<button type="button" id="btnResetId" class="btn btn-danger btn-sm">Reset</button>
							<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
						</div></center>
					</form>
					</fieldset>
				</div>
				</div>
			</div>
		</div>
	</center>
	
	<center>
		<div class="modal fade" id="EditEmploymentModal" tabindex="-1"style="overflow-y: hidden;"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top:20px;">
			<div class="modal-dialog modal-lg" style="height:100%;" role="document">
				<div class="modal-content" style="width:140%;height:90%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close"  id="closeEditEmploymentModal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Employment Details</b>
							</h5>
						</center>
					</div>
					<div class="modal-body" style="overflow-y: auto;">
					<fieldset>
										<form action="/" method="post" id="updateEmploymentDetailsForm" class="form-horizontal" enctype="multipart/form-data" autocomplete="off">
										
										<input type="hidden" id="edemploymentId" name="employment_id">
										<input type="hidden" id="edcontactId" name="contact_id">
										
										 <input type="hidden" id="edcompany_name1"> 
										  <input type="hidden" id="edpositionheld1"> <input type="hidden" id="edcompany_tele1"> 
										  <input type="hidden" id="edreported_to_name1"> <input type="hidden" id="edreported_to_position1">
										   <input type="hidden" id="edhrmgr1"> <input type="hidden" id="edline11"> <input type="hidden" id="edline21"> 
										   <input type="hidden" id="edcity1"> <input type="hidden" id="edstate1"> <input type="hidden" id="edzipcode1"> 
										   <input type="hidden" id="edcpname1"> <input type="hidden" id="edcpemail1"> <input type="hidden" id="edcpnumber1"> 
										   <input type="hidden" id="edacpname1"> <input type="hidden" id="edacpnumber1"> <input type="hidden" id="edstartedYear1">
										    <input type="hidden" id="edstartedMonth1"> <input type="hidden" id="edworkedTillYear1"> 
										    <input type="hidden" id="edworkedTillMonth1"> <input type="hidden" id="employmentTypeEd">

										<div class="form-group row"><label class="col-sm-3 control-label"> Note :
															</label><div class="col-sm-4"><span style="text-align:left;color:grey;font-size:small;vertical-align:top;">Please do not use abbreviations for company names.</span>
	                                        </div></div>
	                                         <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Company Name</label>
												<div class="col-sm-4">
													<input id="edcompany_name" type="text" title="only alphabets are allowed" minlength="2" maxlength="100"
													autocomplete="off" placeholder="Company Name" name="edcompany_name" class="form-control"  required>
												</div>
											</div>
											
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Position Held</label>
												<div class="col-sm-4">
												<input type="text" name="edpositionheld" id="edpositionheld"
													 placeholder="Position Held"  class="form-control" required>
												</div>
											  </div>  
											 
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-5">
												<span style="text-align:left;color:grey;font-size:small;vertical-align:top;"><b>Address (main office and branch where worked)</b><br></span>
													<input id="edline1" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="edline1" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-5">
													<input id="edline2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" placeholder="Enter Line2"
													 autocomplete="off" name="edline2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-5">
													<input id="edcity" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="City" name="edcity" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-5">
													<input id="edstate" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="edstate" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-5">
													<input id="edzipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" 
													 autocomplete="off" placeholder="Zip Code" name="edzipcode" class="form-control"  required>
												</div>
											</div> 					
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Company Telephone</label>
												<div class="col-sm-4">
													<input id="edcompany_tele" type="text" placeholder="Company Telephone" name="edcompany_tele" class="form-control"  required>
												</div>
											</div> 
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Started Working From</label>
												<div class="col-sm-3">
													 <select class="form-control" id="edstartedYear" required	name="edstartedYear">
													<option value="">Select Year</option>
													</select>
												</div>
												<div class="col-sm-3">
													<select class="form-control" id="edstartedMonth" required	name="edstartedMonth">
													<option value="">Select Month</option>
													</select>
											   </div>
											</div>
										
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Worked Till</label>
												<div class="col-sm-3">
													 <select class="form-control" id="edworkedTillYear" required	name="edworkedTillYear">
													<option value="">Select Year</option>
													</select>
												</div>
												<div class="col-sm-3">
												<select class="form-control" id="edworkedTillMonth" required	name="edworkedTillMonth">
													<option value="">Select Month</option>
													</select>
											   </div>
											</div>
										
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Reported to (Name & Position)</label>
												<div class="col-sm-3">
													<input id="edreported_to_name" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
														title="only alpha numerics are allowed" placeholder="Reported to Name"
													    autocomplete="off" name="edreported_to_name" class="form-control"  >
												</div>
												<div class="col-sm-3">
													<input id="edreported_to_position" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
														title="only alpha numerics are allowed" placeholder="Reported to Positon"
													    autocomplete="off" name="edreported_to_position" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Name of HR Manager</label>
												<div class="col-sm-4">
													<input id="edhrmgr" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="Name of HR Manager" name="edhrmgr" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Employment Type</label>
												<div class="col-sm-4">
													<label>Direct</label>&nbsp;<input type="radio" id="edemploymentType1" name="edemploymentType" value="Direct"/>&nbsp;<label>Agency</label>&nbsp;<input type="radio" id="edemploymentType2" name="edemploymentType" value="Agency" />&nbsp;<label>Self-employed</label>&nbsp;<input type="radio" id="edemploymentType3" name="edemploymentType" value="selfEmployed" />
												</div>
											</div>
										
										 <div class="form-group row"><label class="col-sm-3 control-label"> Note :
															</label><div class="col-lg-4 control-label"><span style="text-align:left;color:grey;font-size:small;vertical-align:top;">Please provide above employment contact number and email for verification(Important)</span>
	                                        </div></div>
	                                        	
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Contact Person Name</label>
												<div class="col-sm-4">
												<input type="text" name="edcpname" id="edcpname" placeholder="Contact Person Name"  class="form-control">
												</div>
											  </div> 
											  
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Contact Person Number</label>
												<div class="col-sm-4">
												<input type="text" name="edcpnumber" id="edcpnumber" 
													 placeholder="Contact Person Number"  class="form-control">
												</div>
											  </div> 
											  
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Contact person Email Id</label>
												<div class="col-sm-4">
												<input type="text" name="edcpemail" id="edcpemail" placeholder="Contact person Email Id"  class="form-control">
												</div>
											  </div> 
											  
											 
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Contact Person Name</label>
												<div class="col-sm-4">
												<span style="text-align:left;color:grey;font-size:small;vertical-align:top;"><b>Additional contact details (optional) :</b></span><br>
												<input type="text" name="edacpname" id="edacpname" placeholder="Contact Person Name"  class="form-control">
												</div>
											  </div> 
											  
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Contact Person Number</label>
												<div class="col-sm-4">
												<input type="text" name="edacpnumber" id="edacpnumber" 
													 placeholder="Contact Person Number"  class="form-control">
												</div>
											  </div> 
						<center><div class="text-center ml-3">
							<button type="button" id="btnUpdate" class="btn btn-primary btn-sm" onclick="btnUpdateClick()" disabled>Save Changes</button>
							<button type="button" id="closeEditEmploymentModal1" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
						</div></center>
					</form>
					</fieldset>
				</div>
				</div>
			</div>
		</div>
	</center>
	
		
			<!-- Animated -->
			
				<!-- <div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">Add Employment Details</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-md-11 col-sm-12">
									<fieldset>
										<form action="/" method="post" id="saveEmploymentDetailsForm" class="form-horizontal" enctype="multipart/form-data">
											 <legend><i class="fa fa-line-chart"></i>Raise NC</legend> 
	                                        <h4><b>Employment Details</b></h4> 
	                                         <div class="form-group row"><label class="col-sm-3 control-label"> Note :
															</label><div class="col-lg-7 control-label"> <span style="text-align:left;color:grey;font-size:small;vertical-align:top;">Please do not use abbreviations for company names.</span>
	                                        </div></div>
	                                         <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Company Name</label>
												<div class="col-sm-4">
													<input id="company_name" type="text" title="only alphabets are allowed" minlength="2" maxlength="100"
													autocomplete="off" placeholder="Company Name" name="company_name" class="form-control"  required>
												</div>
											</div>
											
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Position Held</label>
												<div class="col-sm-4">
												<input type="text" name="positionheld" id="positionheld"
													 placeholder="Position Held"  class="form-control">
												</div>
											  </div>  
											   <h6><b>Address (main office and branch where worked)</b></h6> <br> 
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-5">
													<input id="line1" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="line1" class="form-control"  required>
												</div>pattern="^[a-zA-Z\s]+$"
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-5">
													<input id="line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" placeholder="Enter Line2"
													 autocomplete="off" name="line2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-5">
													<input id="city" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="City" name="city" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-5">
													<input id="state" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="state" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-5">
													<input id="zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" 
													 autocomplete="off" placeholder="Zip Code" name="zipcode" class="form-control"  required>
												</div>
											</div> 					
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Company Telephone</label>
												<div class="col-sm-4">
													<input id="company_tele" type="text" placeholder="Company Telephone" name="company_tele" class="form-control"  required>
												</div>
											</div> 
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Employment Period</label>
												<div class="col-sm-3">
													<input id="fromDate" type="text"  minlength="2" maxlength="80" 
													 placeholder="From Date" name="fromDate" class="form-control"  required>
												</div>
												<div class="col-sm-3">
													<input id="toDate" type="text"  minlength="2" maxlength="80" 
													 placeholder="To Date" name="toDate" class="form-control"  required>
											   </div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Reported to (Name & Position)</label>
												<div class="col-sm-3">
													<input id="reported_to_name" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
														title="only alpha numerics are allowed" placeholder="Reported to (Name & Position)"
													    autocomplete="off" name="reported_to_name" class="form-control"  >
												</div>
												<div class="col-sm-3">
													<input id="reported_to_position" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
														title="only alpha numerics are allowed" placeholder="Reported to Positon"
													    autocomplete="off" name="reported_to_position" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Name of HR Manager</label>
												<div class="col-sm-4">
													<input id="hrmgr" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="Name of HR Manager" name="hrmgr" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Employment Type</label>
												<div class="col-sm-4">
													<label>Direct</label>&nbsp;<input type="radio" name="employmentType" value="Direct"/>&nbsp;<label>Agency</label>&nbsp;<input type="radio" name="employmentType" value="Agency" />&nbsp;<label>Self-employed</label>&nbsp;<input type="radio" name="employmentType" value="selfEmployed" />
												</div>
											</div>
										
										 <div class="form-group row"><label class="col-sm-3 control-label"> Note :
															</label><div class="col-lg-7 control-label"><span style="text-align:left;color:grey;font-size:small;vertical-align:top;">Please provide above employment contact number and email for verification(Important)</span>
	                                        </div></div>
	                                        	
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Contact Person Name</label>
												<div class="col-sm-4">
												<input type="text" name="cpname" id="cpname" placeholder="Contact Person Name"  class="form-control">
												</div>
											  </div> 
											  
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Contact Person Number</label>
												<div class="col-sm-4">
												<input type="text" name="cpnumber" id="cpnumber" 
													 placeholder="Contact Person Number"  class="form-control">
												</div>
											  </div> 
											  
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Contact person Email Id</label>
												<div class="col-sm-4">
												<input type="text" name="cpemail" id="cpemail" placeholder="Contact person Email Id"  class="form-control">
												</div>
											  </div> 
											  
											  <h5><b>Additional contact details (optional) :</b></h5><br>
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Contact Person Name</label>
												<div class="col-sm-4">
												<input type="text" name="acpname" id="acpname" placeholder="Contact Person Name"  class="form-control">
												</div>
											  </div> 
											  
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Contact Person Number</label>
												<div class="col-sm-4">
												<input type="text" name="acpnumber" id="acpnumber" 
													 placeholder="Contact Person Number"  class="form-control">
												</div>
											  </div> 
											
										<div class='form-group row' id="add">
                                       <label for="inputPassword" class="col-sm-3 control-label">Add Previous Employment Details</label>
												<div class="col-xs-4">
													<button type="button" class="btn btn-success addButton">
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                        </div>
											<div id="addotheremployment" class="form-group" style="display:none;">
												 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Company Name</label>
												<div class="col-sm-4">
													<input id="othr_company_name" type="text" title="only alphabets are allowed" minlength="2" maxlength="100"
													autocomplete="off" placeholder="Company Name" name="othr_company_name[]" class="form-control"  required>
												</div>
											</div>
											
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Position Held</label>
												<div class="col-sm-4">
												<input type="text" name="othr_positionheld[]" id="othr_positionheld"
													 placeholder="Position Held"  class="form-control">
												</div>
											  </div> 
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-5">
													<input id="othr_line1" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="othr_line1[]" class="form-control"  required>
												</div>pattern="^[a-zA-Z\s]+$"
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-5">
													<input id="othr_line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha nu[]rics are allowed" placeholder="Enter Line2"
													 autocomplete="off" name="othr_line2[]" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-5">
													<input id="othr_city" type="text"  minlength="2" maxlength="25"
													title="on[] Characters are allowed"  
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
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Company Telephone</label>
									<div class="col-sm-4">
													<input id="othr_company_tele" type="text" placeholder="Company Telephone" name="othr_company_tele[]" class="form-control"  required>
												</div>
											</div> 
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Employment Period</label>
												<div class="col-sm-3">
													<input id="othr_fromDate" type="text"  minlength="2" maxlength="80" 
													 placeholder="From Date" name="othr_fromDate[]" class="form-control"  required>
												</div>
												<div class="col-sm-3">
													<input id="othr_toDate" type="text"  minlength="2" maxlength="80" 
													 placeholder="To Date" name="othr_toDate[]" class="form-control"  required>
											   </div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Reported to (Name & Position)</label>
												<div class="col-sm-3">
													<input id="othr_reported_to_name" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
														title="only alpha numerics are allowed" placeholder="Reported to Name"
													    autocomplete="off" name="othr_reported_to_name[]" class="form-control"  >
												</div>
												<div class="col-sm-3">
													<input id="othr_reported_to_position" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
														title="only alpha numerics are allowed" placeholder="Reported to Positon"
													    autocomplete="off" name="othr_reported_to_position[]" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Name of HR Manager</label>
												<div class="col-sm-4">
													<input id="othr_hrmgr" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="Name of HR Manager" name="othr_hrmgr[]" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Employment Type</label>
												<div class="col-sm-4">
													<select name="othr_employmentType[]">
													
													</select>
													
													<label>Direct</label>&nbsp;<input type="radio"  value="Direct"/>&nbsp;<label>Agency</label>&nbsp;<input type="radio" name="othr_employmentType[]" value="Agency" />&nbsp;<label>Self-employed</label>&nbsp;<input type="radio" name="othr_employmentType[]" value="selfEmployed" />
													 <br>
												</div>
											</div>
											<br>
											 <div class="form-group row"><label class="col-sm-3 control-label"> Note :
															</label><div class="col-lg-7 control-label"><span style="text-alig:left;color:grey;font-size:small;vertical-align:top;">Please provide above employment contact number and email for verification(Important)</span>
	                                       					</div>
	                                        </div>
	                                        	
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Contact Person Name</label>
												<div class="col-sm-4">
												<input type="text" name="othr_cpname[]" id="othr_cpname" 
													 placeholder="Contact Person Name"  class="form-control">
												</div>
											  </div> 
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Contact Person Number</label>
												<div class="col-sm-4">
												<input type="text" name="othr_cpnumber[]" id="othr_cpnumber"
													 placeholder="Contact Person Number"  class="form-control">
												</div>
											  </div> 
											  
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Contact person Email Id</label>
												<div class="col-sm-4">
												<input type="text" name="othr_cpemail[]" id="othr_cpemail"
													 placeholder="Contact person Email Id"  class="form-control">
												</div>
											  </div> 
											  
											  <h5><b>Additional contact details (optional) :</b></h5><br>
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label" ><Span style="color:red;">*</Span>Contact Person Name</label>
												<div class="col-sm-4">
												<input type="text" name="othr_acpname[]" id="othr_acpname" 
													 placeholder="Contact Person Name"  class="form-control">
												</div>
											  </div> 
											  
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Contact Person Number</label>
												<div class="col-sm-4">
												<input type="text" name="othr_acpnumber[]" id="othr_acpnumber" 
													 placeholder="Contact Person Number"  class="form-control">
												</div>
											  </div>
											   
										</div>
										
											<div class="text-center ml-3">
												<input type="button" class="btn btn-default" id="submitid" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Submit"  onclick="btnClick()">
												<button type="reset" class="btn btn-default" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;">Reset</button> 
											</div>
										</form>
									</fieldset>
								</div>
							</div>
						</div>
					</div>
				</div>
		</div> -->
	
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
<script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script src="resources/preDefined/goback.js"></script>
<script type="text/javascript">

$("#closeEditEmploymentModal").click(function(event) {
	getsesVal().done(function(data){
		if(data!=""){
	$('#EditEmploymentModal').modal('hide');
   var candId=$('#candidate_id').val();
   window.location.href="employmentdetails?candidateId="+candId+"";
		}else{ window.location.href="loginpage";}});
});
$("#closeEditEmploymentModal").click(function(event) {
	getsesVal().done(function(data){
		if(data!=""){
	$('#EditEmploymentModal').modal('hide');
   var candId=$('#candidate_id').val();
   window.location.href="employmentdetails?candidateId="+candId+"";
		}else{ window.location.href="loginpage";}});
});

  
function btnUpdateClick(){
	getsesVal().done(function(data){
		if(data!=""){
	$('#updateEmploymentDetailsForm').formValidation('validate');
	if( !$('#updateEmploymentDetailsForm').data('formValidation').isValid())
		 {
		 }
	else{
		       $("#btnUpdate").attr("disabled", true);
				var form = $('#updateEmploymentDetailsForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "updateEmploymentDetails", //this is the submit URL
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
function btnClick(){
	getsesVal().done(function(data){
		if(data!=""){
	$('#saveEmploymentDetailsForm').formValidation('validate');
	if( !$('#saveEmploymentDetailsForm').data('formValidation').isValid())
		 {
		 }
	else{
		  //document.getElementById("saveEmploymentDetailsForm").submit();
		       $("#btnSubmit").attr("disabled", true);
				var form = $('#saveEmploymentDetailsForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "saveEmploymentDetails", //this is the submit URL
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
    window.location.href="employmentdetails?candidateId="+candId+"";
		}else{ window.location.href="loginpage";}});
});
</script>
<script type="text/javascript">
var othercl=0;
var MAX_OPTIONS = 3;
$('#saveEmploymentDetailsForm')
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
    company_name: {
            validators: {
            	notEmpty: {
                    message: 'Company Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Company Name must be more than 2 and less than 100 characters long. '
                },
                regexp: {
                	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                     message: 'Company Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                }
            }
        },
        reported_to_name: {
            validators: {
            	notEmpty: {
                    message: 'Reported  to name is mandatory'
                },
                stringLength: {
                    min: 1,
                    max: 40,
                    message: 'Reported to name must be more than 1 and less than 40 characters long'
                },
                regexp: {
                	regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                    message: 'Reported to name accepts alphabets and Space allowed but is not at beginning or end of the word'
                },
            }
        },
        reported_to_position: {
            validators: {
            	notEmpty: {
                    message: 'Reported to Position is mandatory'
                },
                stringLength: {
                    min: 1,
                    max: 40,
                    message: 'Reported to Position must be more than 1 and less than 40 characters long'
                },
                regexp: {
                	regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                    message: 'Reported to Position accepts alphabets and Space allowed but is not at beginning or end of the word'
                },
            }
        },
        hrmgr: {
            validators: {
            	notEmpty: {
                    message: 'HR Manager Name is mandatory'
                },
                stringLength: {
                    min: 1,
                    max: 40,
                    message: 'HR Manager must be more than 1 and less than 40 characters long'
                },
                regexp: {
                	regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                    message: 'HR Manager accepts alphabets and Space allowed but is not at beginning or end of the word'
                },
            }
        },
    positionheld : {
            validators: {
            	notEmpty: {
                    message: 'Position Held is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Position Held min length 4 and max length 20 '
                },
                regexp: {
                	regexp: /^(?!\d\s+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &():\/\\-]*)?$/,
                    message: 'Position Held accepts alphanumeric, specical characters like &-()/: allowed and Space allowed but is not at beginning or end of the word'
                },
            }
        },
    employmentType:{
        validators: {
        	notEmpty: {
                message: 'Please Choose Employment Type'
            }
        }
    },
    startedYear:{
        validators: {
        	notEmpty: {
                message: 'Please Select Year'
            }
        }
    },
    startedMonth:{
        validators: {
        	notEmpty: {
                message: 'Please Select Month'
            }
        }
    },
    workedTillYear:{ 
        validators: {
        	notEmpty: {
                message: 'Please Select Year'
            }
        }
    },
    workedTillMonth:{
        validators: {
        	notEmpty: {
                message: 'Please Select Month'
            }
        }
    },
    company_tele:{
        validators: {
        	notEmpty: {
                message: 'Company Telephone Number is mandatory'
        	 },
             stringLength: {
             min: 12,
             max: 12,
             message: 'Company Telephone Number must be more 10 or Not less than 10 Numbers long'
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
                    max: 25,
                    message: 'Line2 should have more than 2 and less than 80 characters '
                },
                regexp: {
                  regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 accepts alpha numerics '
                }
            }
        },
        line2 : {
            validators: {
            	/*  notEmpty: {
                    message: 'Line1 is mandatory'
                }, */
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line2 should have more than 2 and less than 80 characters '
                },
                regexp: {
                  regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 accepts alpha numerics '
                }
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
                   message: 'City accepts characters'
                }
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
                }
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
                }
            }
        },    
      cpname: {
            validators: {
            	notEmpty: {
                    message: 'Contact Person Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 40,
                    message: 'Contact Person Name must be more than 2 and less than 40 characters long'
                },
                regexp: {
                  regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                   message: 'Contact Person Name accepts alphabets and Space allowed but is not at beginning or end of the word'
                }
            }
        },  
        cpemail: {
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
                	regexp: /^[a-zA-Z0-9](\.?[a-zA-Z0-9_-]){0,}@[a-zA-Z0-9-]+\.([a-zA-Z]{1,6}\.)?[a-zA-Z]{2,6}$/,
                    message: 'Please enter valid e-mail ID'
                },
            }
        },
        cpnumber : {
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
        acpname: {
            validators: {
            	isEmpty: {
                    message: 'Contact Person Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 40,
                    message: 'Contact Person Name must be more than 2 and less than 40 characters long'
                },
                regexp: {
                  regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                   message: 'Contact Person Name accepts alphabets and Space allowed but is not at beginning or end of the word'
                }
            }
        }, 
        acpnumber : {
            validators: {
            	isEmpty: {
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
        }
     }
}).on('click', '[name="currentcompany"]', function(e) {
	 var currentcompany = $("input[name='currentcompany']:checked").val();
		if(currentcompany=='Yes'){
			 $('#saveEmploymentDetailsForm').bootstrapValidator('enableFieldValidators','workedTillYear',false);
		     $('#saveEmploymentDetailsForm').bootstrapValidator('enableFieldValidators','workedTillMonth',false);
			var today = new Date();
			var mm = today.toLocaleString('default', { month: 'long' })
			var yyyy = today. getFullYear();
			$("#workedTillMonth,#workedTillYear").empty();
			$('#workedTillYear').append($('<option/>').attr("value", yyyy).text(yyyy));
			$('#workedTillMonth').append($('<option/>').attr("value", mm).text(mm));
			 
			  //   $("#workedTillMonth,#workedTillYear").empty();
			    // loadCurrMonthYear();//
				   /* $("#workedTillMonth").children('option').hide();
				   $("#workedTillYear").children('option').hide();
				   $("#workedTillMonth").children("option[value^=" + mm + "]").show();
				   $("#workedTillYear").children("option[value^=" + yyyy + "]").show() */
		        /*  var $dropdown3 = $("select[name='workedTillYear']");
				 $dropdown3.find('option[value="' + yyyy + '"]').attr('selected', true);
				 var $dropdown4 = $("select[name='workedTillMonth']");
				 $dropdown4.find('option[value="' + mm + '"]').attr('selected', true);
			     $("#workedTillMonth,#workedTillYear").attr("readonly",true); */	
			    
		}else{
			
					$('#saveEmploymentDetailsForm').bootstrapValidator('enableFieldValidators','workedTillYear',true);
				     $('#saveEmploymentDetailsForm').bootstrapValidator('enableFieldValidators','workedTillMonth',true);
				     
			     $('#workedTillYear option:selected').removeAttr('selected');
			     $('#workedTillMonth option:selected').removeAttr('selected');
			     $('#startedYear option:selected').removeAttr('selected');
			     $("#workedTillMonth,#workedTillYear").empty();
			     $("#workedTillYear").attr("readonly",true);
			     $('#workedTillMonth').append($('<option/>').attr("value", '').text("Select Month"));
			     $('#workedTillYear').append($('<option/>').attr("value", '').text("Select Year"));
			     loadCurrMonthYear();
			     $("#workedTillYear").empty();
			     $('#workedTillYear').append($('<option/>').attr("value", '').text("Select Year"));
			     $("#workedTillMonth,#workedTillYear").attr("disabled",false);
		      
		}
}).on('error.validator.bv', function(e, data) {
            data.element
                .data('bv.messages')
                .find('.help-block[data-bv-for="' + data.field + '"]').hide()
                .filter('[data-bv-validator="' + data.validator + '"]').show();
 });
 

$('#startedYear').on('change', function() {   
	var ddlYears = $('#startedYear').val();
	var today = new Date();
	var yyyy = today. getFullYear();
	 $("#workedTillYear").attr("readonly",false);
	 $("#workedTillYear").empty();
	 $('#workedTillYear').append($('<option/>').attr("value", '').text("Select Year"));
	for (var y = ddlYears; y <= yyyy; y++) {
        var optn = document.createElement("OPTION");
        optn.text = y;
        optn.value = y;
        document.getElementById('workedTillYear').options.add(optn);
   }
});
	$('#edstartedYear').on('change', function() {   
		var editYears = $('#edstartedYear').val();
	
		var today = new Date();
		var yyyy = today. getFullYear();
		 $("#edworkedTillYear").attr("readonly",false);
		 $("#edworkedTillYear").empty();
		 
		for (var y = editYears; y <= yyyy; y++) {
	        var optn = document.createElement("OPTION");
	        optn.text = y;
	        optn.value = y;
	        document.getElementById('edworkedTillYear').options.add(optn);
	   }
    
    });
$('#updateEmploymentDetailsForm')
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
    edcompany_name: {
            validators: {
            	notEmpty: {
                    message: 'Company Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Company Name must be more than 2 and less than 100 characters long. '
                },
                regexp: {
                	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                     message: 'Company Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                }
            }
        },
        edreported_to_name: {
            validators: {
            	notEmpty: {
                    message: 'Reported  to name is mandatory'
                },
                stringLength: {
                    min: 1,
                    max: 40,
                    message: 'Reported to name must be more than 1 and less than 40 characters long'
                },
                regexp: {
                	regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                    message: 'Reported to name accepts alphabets and Space allowed but is not at beginning or end of the word'
                },
            }
        },
        edreported_to_position: {
            validators: {
            	notEmpty: {
                    message: 'Reported to Position is mandatory'
                },
                stringLength: {
                    min: 1,
                    max: 40,
                    message: 'Reported to Position must be more than 1 and less than 40 characters long'
                },
                regexp: {
                	regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                    message: 'Reported to Position accepts alphabets and Space allowed but is not at beginning or end of the word'
                },
            }
        },
        edhrmgr: {
            validators: {
            	notEmpty: {
                    message: 'HR Manager Name is mandatory'
                },
                stringLength: {
                    min: 1,
                    max: 40,
                    message: 'HR Manager must be more than 1 and less than 40 characters long'
                },
                regexp: {
                	regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                    message: 'HR Manager accepts alphabets and Space allowed but is not at beginning or end of the word'
                },
            }
        },
        edpositionheld : {
            validators: {
            	notEmpty: {
                    message: 'Position Held is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Position Held min length 4 and max length 20 '
                },
                regexp: {
                	regexp: /^(?!\d\s+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &():\/\\-]*)?$/,
                    message: 'Position Held accepts alphanumeric, specical characters like &-()/: allowed and Space allowed but is not at beginning or end of the word'
                },
            }
        },
        edemploymentType:{
        validators: {
        	notEmpty: {
                message: 'Please Choose Employment Type'
            }
        }
    },
    edstartedYear:{
        validators: {
        	notEmpty: {
                message: 'Please Select Year'
            }
        }
    },
    edstartedMonth:{
        validators: {
        	notEmpty: {
                message: 'Please Select Month'
            }
        }
    },
    edworkedTillYear:{
        validators: {
        	notEmpty: {
                message: 'Please Select Year'
            }
        }
    },
    edworkedTillMonth:{
        validators: {
        	notEmpty: {
                message: 'Please Select Month'
            }
        }
    },
    edcompany_tele:{
        validators: {
        	notEmpty: {
                message: 'Company Telephone Number is mandatory'
        	 },
             stringLength: {
             min: 12,
             max: 12,
             message: 'Company Telephone Number must be more 10 or Not less than 10 Numbers long'
            }
        }
  	}, 
  	edline1 : {
            validators: {
            	 notEmpty: {
                    message: 'Line1 is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 25,
                    message: 'Line2 should have more than 2 and less than 80 characters '
                },
                regexp: {
                  regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 accepts alpha numerics '
                }
            }
        },
        edline2 : {
            validators: {
            	/*  notEmpty: {
                    message: 'Line1 is mandatory'
                }, */
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line2 should have more than 2 and less than 80 characters '
                },
                regexp: {
                  regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 accepts alpha numerics '
                }
            }
        },
        edcity : {
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
                   message: 'City accepts characters'
                }
            }
        },
        edstate : {
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
                }
            }
        },
        edzipcode : {
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
                }
            }
        },    
        edcpname: {
            validators: {
            	notEmpty: {
                    message: 'Contact Person Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 40,
                    message: 'Contact Person Name must be more than 2 and less than 40 characters long'
                },
                regexp: {
                  regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                   message: 'Contact Person Name accepts alphabets and Space allowed but is not at beginning or end of the word'
                }
            }
        },  
        edcpemail: {
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
                	regexp: /^[a-zA-Z0-9](\.?[a-zA-Z0-9_-]){0,}@[a-zA-Z0-9-]+\.([a-zA-Z]{1,6}\.)?[a-zA-Z]{2,6}$/,
                    message: 'Please enter valid e-mail ID'
                },
            }
        },
        edcpnumber : {
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
        edacpname: {
            validators: {
            	isEmpty: {
                    message: 'Contact Person Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 40,
                    message: 'Contact Person Name must be more than 2 and less than 40 characters long'
                },
                regexp: {
                  regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                   message: 'Contact Person Name accepts alphabets and Space allowed but is not at beginning or end of the word'
                }
            }
        }, 
        edacpnumber : {
            validators: {
            	isEmpty: {
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
        }
     }
})
.on('error.validator.bv', function(e, data) {
            data.element
                .data('bv.messages')
                .find('.help-block[data-bv-for="' + data.field + '"]').hide()
                .filter('[data-bv-validator="' + data.validator + '"]').show();
 });
</script>
<script type="text/javascript">
function loadMonthYear() {
	var dt = new Date();
	var cur_month = dt.getMonth();
	var prev_month = 0;
	if (cur_month != 0) {
		prev_month = cur_month - 1;
	}
	var cur_year = dt.getFullYear();
	var mlist = [  "January", "February", "March",
			"April", "May", "June", "July", "August", "September",
			"October", "November", "December" ];
	for (var i = 0; i < mlist.length; i++) {
		$('#startedMonth').append(
				$('<option/>').attr("value", mlist[i]).text(mlist[i]));
		$('#edstartedMonth').append(
				$('<option/>').attr("value", mlist[i]).text(mlist[i]));
		$('#edworkedTillMonth').append(
				$('<option/>').attr("value", mlist[i]).text(mlist[i]));
	}
	var myDate = new Date();
	var year = myDate.getFullYear();
	for (var y = myDate.getFullYear(); y >= 1950; y--) {
        var optn = document.createElement("OPTION");
        optn.text = y;
        optn.value = y;
        document.getElementById('startedYear').options.add(optn);
   }
	for (var y = myDate.getFullYear(); y >= 1950; y--) {
        var optn = document.createElement("OPTION");
        optn.text = y;
        optn.value = y;
        document.getElementById('edstartedYear').options.add(optn);
   }
	for (var y = myDate.getFullYear(); y >= 1950; y--) {
        var optn = document.createElement("OPTION");
        optn.text = y;
        optn.value = y;
        document.getElementById('edworkedTillYear').options.add(optn);
   }
}
function loadCurrMonthYear() {
	var dt = new Date();
	var cur_month = dt.getMonth();
	var prev_month = 0;
	if (cur_month != 0) {
		prev_month = cur_month - 1;
	}
	var cur_year = dt.getFullYear();
	var mlist = [  "January", "February", "March",
			"April", "May", "June", "July", "August", "September",
			"October", "November", "December" ];
	for (var i = 0; i < mlist.length; i++) {
		$('#workedTillMonth').append(
				$('<option/>').attr("value", mlist[i]).text(mlist[i]));
	}
	var myDate = new Date();
	var year = myDate.getFullYear();
	
	for (var y = myDate.getFullYear(); y >= 1950; y--) {
        var optn = document.createElement("OPTION");
        optn.text = y;
        optn.value = y;
        document.getElementById('workedTillYear').options.add(optn);
   }
}
window.onload = loadMonthYear;
function addEmployment(){
	getsesVal().done(function(data){
		if(data!=""){
	var currentcompany = $("input[name='currentcompany']:checked").val();
	if(currentcompany=="Yes"){
		//loadCurrMonthYear();
		var today = new Date();
		var mm = today.toLocaleString('default', { month: 'long' })
		var yyyy = today. getFullYear();
		$('#saveEmploymentDetailsForm').bootstrapValidator('enableFieldValidators','workedTillYear',false);
	     $('#saveEmploymentDetailsForm').bootstrapValidator('enableFieldValidators','workedTillMonth',false);
		  // $('#workedTillMonth').val(mm);$('#workedTillYear').val(yyyy);
		  	$('#workedTillYear').append($('<option/>').attr("value", yyyy).text(yyyy));
			$('#workedTillMonth').append($('<option/>').attr("value", mm).text(mm)); 
		  
	}else{
			
			$('#saveEmploymentDetailsForm').bootstrapValidator('enableFieldValidators','workedTillYear',true);
		     $('#saveEmploymentDetailsForm').bootstrapValidator('enableFieldValidators','workedTillMonth',true);
		
	}
	$('#AddEmploymentModal').modal('show');
		}else{ window.location.href="loginpage";}});
	}
/* function editEmployment(employmentId,edcompany_name,edpositionheld,edcompany_tele,edreported_to_name,edreported_to_position,edhrmgr,edemploymentType,
		edline1,edline2,edcity,edstate,edzipcode,startedYear,startedMonth,workedTillYear,workedTillMonth,cpname,cpemail,cpnumber,acpname,acpnumber,edcontactId){
	 */
	 //$('#currentcompany').on('click', function() {
		
function editEmployment(employmentId){
	getsesVal().done(function(data){
		if(data!=""){
	$.ajax({
    	type : "GET",
        asyn : false,
        contentType: "application/json", // NOT dataType!
        url  :"getCandidateEmploymentDetailsByEmploymentId",
        data:{"employmentId":employmentId},
        success  : function(response){
        	 if(response!=null || response!=""){
        			$('#edemploymentId').val(response.employment_id);
        			$('#edcontactId').val(response.contact_id);
        			$('#edcompany_name,#edcompany_name1').val(response.company_name);
        			$('#edpositionheld,#edpositionheld1').val(response.positionheld);
        			$('#edcompany_tele,#edcompany_tele1').val(response.company_phone);
        			$('#edreported_to_name,#edreported_to_name1').val(response.reported_to_name);
        			$('#edreported_to_position,#edreported_to_position1').val(response.reported_to_position);
        			$('#edhrmgr,#edhrmgr1').val(response.hrmgr_name);
        			$('#employmentTypeEd').val(response.employmentType);
        			$('#edline1,#edline11').val(response.line1);
        			$('#edline2,#edline21').val(response.line2);
        			$('#edcity,#edcity1').val(response.city);
        			$('#edstate,#edstate1').val(response.state);
        			$('#edzipcode,#edzipcode1').val(response.zipcode);
        			$('#edstartedYear1').val(response.startedYear);
        			$('#edstartedMonth1').val(response.startedMonth);
        			$('#edworkedTillYear1').val(response.workedTillYear);
        			$('#edworkedTillMonth1').val(response.workedTillMonth);
        			
        			$('#edcpname,#edcpname1').val(response.cpname);
        			$('#edcpemail,#edcpemail1').val(response.cpemail);
        			$('#edcpnumber,#edcpnumber1').val(response.cpnumber);
        			$('#edacpname,#edacpname1').val(response.acpname);
        			$('#edacpnumber,#edacpnumber1').val(response.acpnumber);
        			
        				 var $dropdown1 = $("select[name='edstartedYear']");
        				 $dropdown1.find('option[value="' + response.startedYear + '"]').attr('selected', true);
        				
        				var $dropdown2 = $("select[name='edstartedMonth']");
        				 $dropdown2.find('option[value="' + response.startedMonth + '"]').attr('selected', true);

        				 var $dropdown3 = $("select[name='edworkedTillYear']");
        				 $dropdown3.find('option[value="' + response.workedTillYear + '"]').attr('selected', true);

        				 var $dropdown4 = $("select[name='edworkedTillMonth']");
        				 $dropdown4.find('option[value="' + response.workedTillMonth + '"]').attr('selected', true);
        			
        			if(response.employmentType=='Direct'){
        				$('#edemploymentType1').prop("checked",true)
        				}
        			else if(response.employmentType=='Agency'){
        				   $('#edemploymentType2').prop("checked",true)
        				 }else{
        				   $('#edemploymentType3').prop("checked",true)
        				}
        		// alert(response.verifier_employment_status);
				 if(response.verifier_employment_status=='Approved'){
					 $('#updateEmploymentDetailsForm input').attr('disabled', 'disabled');
					 $('input[type="text"], textarea,select').each(function(){
					     $(this).attr('disabled','disabled');
					  });
					 $("#btnUpdate").attr("disabled",true).prop("title","Manager status is approved, can't update details");
				   }
	   	        }
	   	      else{
	   	          window.location.href="loginpage";
	   	   	      }
        	 $('#EditEmploymentModal').modal('show');
            }
	    });
		}else{ window.location.href="loginpage";}});
	
/* 	var candId=$('#candidate_id').val();
	$.ajax({
    	type : "GET",
        asyn : false,
        contentType: "application/json", // NOT dataType!
        url  :"getCandidateFormsStatusById",
        data:{"candidateId":candId},
        success  : function(response){
        	 if(response!=null || response!=""){
				 if(response.verifier_employment_status=='Approved'){
					 $('#updateEmploymentDetailsForm input').attr('disabled', 'disabled');
					 $('input[type="text"], textarea,select').each(function(){
					     $(this).attr('disabled','disabled');
					  });
				 }else{
					
				  }
	   	        }
	   	      else{
	   	          window.location.href="loginpage";
	   	   	      }
        	 $('#EditEmploymentModal').modal('show');
            }
	    }); */
}	
/* $('form').on('reset', function() {
	$('#saveEmploymentDetailsForm').data('formValidation').resetForm();
	}); */
$('input[name="cpnumber"]').mask('999-999-9999');
$('input[name="acpnumber"]').mask('999-999-9999');
$('input[name="company_tele"]').mask('999-999-9999');
$('input[name="edcompany_tele"]').mask('999-999-9999');
$('input[name="edcpnumber"]').mask('999-999-9999');
$('input[name="edacpnumber"]').mask('999-999-9999');
</script> 
<script type="text/javascript">
$('#edcompany_name').on('keyup', function() {
    if($('#edcompany_name').val()==$('#edcompany_name1').val())
           {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}   });
$('#edpositionheld').on('keyup', function() {
    if($('#edpositionheld').val()==$('#edpositionheld1').val())
           {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}   });
$('#edcompany_tele').on('keyup', function() {
           if($('#edcompany_tele').val()==$('#edcompany_tele1').val())
                  {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} });
$('#edreported_to_name').on('keyup', function() {
           if($('#edreported_to_name').val()==$('#edreported_to_name1').val())
                  {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
$('#edreported_to_position').on('keyup', function() {
 if($('#edreported_to_position').val()==$('#edreported_to_position1').val())
        {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
$('#edhrmgr').on('keyup', function() {
           if($('#edhrmgr').val()==$('#edhrmgr1').val())
                  {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
$('#edcpname').on('keyup', function() {
    if($('#edcpname').val()==$('#edcpname1').val())
           {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
$('#edcpemail').on('keyup', function() {   
    if($('#edcpemail').val()==$('#edcpemail1').val())
           {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
$('#edcpnumber').on('keyup', function() {
    if($('#edcpnumber').val()==$('#edcpnumber1').val())
           {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });

$('#edacpname').on('keyup', function() {
	if($('#edacpname').val()==$('#edacpname1').val())
		{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });

$('#edacpnumber').on('keyup', function() {
	if($('#edacpnumber').val()==$('#edacpnumber1').val())
		{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });

$('#edstartedYear').on('change', function() {   
    if($('#edstartedYear').val()==$('#edstartedYear1').val())
           {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
$('#edstartedMonth').on('change', function() {
    if($('#edstartedMonth').val()==$('#edstartedMonth1').val())
           {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });

$('#edworkedTillYear').on('change', function() {
	if($('#edworkedTillYear').val()==$('#edworkedTillYear1').val())
		{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });

$('#edworkedTillMonth').on('change', function() {
	if($('#edworkedTillMonth').val()==$('#edworkedTillMonth1').val())
		{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });		


$('#edline1').on('keyup', function() {
	 if($('#edline1').val()==$('#edline11').val())
	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
  });
$('#edline2').on('keyup', function() {
	 if($('#edline2').val()==$('#edline21').val())
	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
  });

$('#edcity').on('keyup', function() {
	 if($('#edcity').val()==$('#edcity1').val())
	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
  });
$('#edstate').on('keyup', function() {
	 if($('#edstate').val()==$('#edstate1').val())
	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
 });
$('#edzipcode').on('keyup', function() {
	 if($('#edzipcode').val()==$('#edzipcode1').val())
	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
  });
  
  
$("input[name='edemploymentType']").on('click', function() {
 if($("input[name='edemploymentType']:checked").val()==$('#employmentTypeEd').val())
	{
 	 document.getElementById('btnUpdate').disabled=true;
	}else if($("input[name='employmentType']:checked").val()!=$('#employmentTypeEd').val()){
		document.getElementById('btnUpdate').disabled=false;
	}
});
$('input').attr("autocomplete", 'off');

$("#btnResetId").click(function(event) {
	$('#saveEmploymentDetailsForm').bootstrapValidator('resetForm', true);
	$('#workedTillMonth,#workedTillYear').empty();
	var currentcompany = $("input[name='currentcompany']:checked").val();
	if(currentcompany!="")
	{
		$("input[name=currentcompany][value='Yes']").prop('checked', true);
	
	var today = new Date();
	var mm = today.toLocaleString('default', { month: 'long' })
	var yyyy = today. getFullYear();
	  	$('#workedTillYear').append($('<option/>').attr("value", yyyy).text(yyyy));
		$('#workedTillMonth').append($('<option/>').attr("value", mm).text(mm)); 
	}
});
$('#AddEmploymentModal').on('hide.bs.modal', function()
{
	$('#saveEmploymentDetailsForm').bootstrapValidator('resetForm', true);
	$('#workedTillMonth,#workedTillYear').empty();
	var currentcompany = $("input[name='currentcompany']:checked").val();
	if(currentcompany!="")
	{
		$("input[name=currentcompany][value='Yes']").prop('checked', true);
	
	var today = new Date();
	var mm = today.toLocaleString('default', { month: 'long' })
	var yyyy = today. getFullYear();
	  	$('#workedTillYear').append($('<option/>').attr("value", yyyy).text(yyyy));
		$('#workedTillMonth').append($('<option/>').attr("value", mm).text(mm)); 
	}
});
</script>
</body>
</html>
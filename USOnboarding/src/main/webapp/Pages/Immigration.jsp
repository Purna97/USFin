
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.net.URLDecoder"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/css/select2.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="resources/css/css/datepicker3.min.css" />
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
</head>
<style type="text/css">
.field-error .control-label, .field-error .help-block, .field-error .form-control-feedback
	{
	color: red;
}

.field-success .control-label, .field-success .help-block,
	.field-success .form-control-feedback {
	color: #3c763d;
}
.btn-colorb{
	background-color:#195AAD!important;
}
#comment:focus {
	border-color: red;
	/* background: yellow;
  color: red; */
}

#uploadLCA .form-group {
	width: 130%;
}

#approvedlca .form-group {
	width: 130%;
}

#lcaqueInitDiv .form-group {
	width: 130%;
}

#lcaqueDiv .form-group {
	width: 130%;
}
#approvedh1b .form-group{
    width:130%;
}
#approvedh1bD .form-group{
    width:130%;
}
#eapprovedh1b .form-group{
    width:100%;
}
#eapprovedh1bD .form-group{
    width:100%;
}
#addOtherLocationDiv .form-group {
	width: 130%;
}
#OtherLocationBtnDiv .form-group {
	width: 130%;
}
#vOtherLocationBtnDiv .form-group {
	width: 130%;
}
#uaddOtherLocationDiv .form-group {
	width: 130%;
}
#inituaddOtherLocationDiv .form-group {
	width: 130%;
}


/* .modal:nth-of-type(even) {
    z-index: 1052 !important;
}
.modal-backdrop.show:nth-of-type(even) {
    z-index: 1051 !important;
} */

</style>

<body>
	<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<!-- id="cc" -->
					<div class="col">
						<div class="card">
							<h5 class="card-header">
								<center>List Of Candidates and Clients For Immigration
								</center>
							</h5>
							<input type="hidden" id="candidateid" name="candidateid">
							<input type="hidden" id="clientid" name="clientid"> <input
								type="hidden" id="candidateidname" name="candidateidname">
							<input type="hidden" name="empno" id="empno" value="${empno}">
							<input type="hidden" id="cand_id">
							
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">

										<div class="form-group row">
											<label for="inputPassword" class="col-sm-5 control-label"><Span
												style="color: red;">*</Span>Select Candidate</label>
											<div class="col-sm-4">
												<select name="candidate" autoComplete="off"
													class="form-control text-left" id="candidate" required>
													<option value="">Select Candidate</option>
													<c:forEach var="clist" items="${candidateList}">
														<c:if test="${not empty clist.emp_type}">
															<option value="${clist.candidate_id}">${clist.fullname}</option>
														</c:if>
														<c:if test="${empty clist.emp_type}">
															<option value="${clist.candidate_id}">${clist.fullname} / Prospect</option>
														</c:if>
													</c:forEach>
												</select>
											</div>
											<!-- <label for="inputPassword" class="col-sm-2 control-label"><Span
												style="color: red;">*</Span>Select Client</label>
											<div class="col-sm-4">
												<select name="client" autoComplete="off"
													class="form-control text-left" id="client" required>
												</select>
											</div> -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row" id="immi">
					<div class="col">
						<div class="payment-pillTab">
							<ul class="nav nav-pills mb-6" id="pills-tab" role="tablist">
								<li class="nav-item" style="width: 25%; align-content: center;"><a
									class="nav-link active" id="lcatab" data-toggle="pill"
									href="#pills-payTenant" role="tab" aria-controls="pills-home"
									aria-selected="true">LCA</a></li>
								<li class="nav-item" style="width: 25%; align-content: center;"><a
									class="nav-link" id="h1btab" data-toggle="pill"
									href="#pills-Owner" role="tab" aria-controls="pills-profile"
									aria-selected="false" disabled>H1B</a></li>
								<li class="nav-item" style="width: 25%; align-content: center;"><a
									class="nav-link" id="paftab" data-toggle="pill"
									href="#pills-Owner" role="tab" aria-controls="pills-profile"
									aria-selected="false" disabled>PAF</a></li>
								<li class="nav-item"
									style="width: 25%; align-content: center; color: white;"><a
									class="nav-link" id="taskstab" data-toggle="pill"
									href="#pills-Owner" role="tab" aria-controls="pills-profile"
									aria-selected="false" disabled>Tasks</a></li>
							</ul>
						</div>
					</div>
				</div>
				<br>
				<div class="row" id="lcadiv">
					<div class="col-md-12">
						<button
							style="letter-spacing: 0px; background-color: #15aabf; color: white;"
							id="lcadetails" class="btn btn-info btn-sm addButton">
							LCA Questionnaire Report</button>
						<!-- <button	style="letter-spacing: 0px; background-color: #15aabf; color: white;"
							id="lcahistory" class="btn btn-info btn-sm addButton">
							LCA History</button> -->
						<button
							style="letter-spacing: 0px; background-color: #15aabf; color: white;display:none;"
							id="amendment" class="btn btn-info btn-sm addButton">
							Amendment Details</button>
						<button
							style="letter-spacing: 0px; background-color: #15aabf; color: white;"
							id="uploadlcadetails" class="btn btn-info btn-sm addButton">
							Upload Document</button>
						<br>						
						<br>
						<%-- <center> --%>
						<div id="initiatediv" style="display: none">
							<button type="button"
								style="margin-left: 0px; margin-right: auto; margin-top: 1%; margin-bottom: 1%; border-radius: 12px;"
								class="btn btn-success btn-sm" id="initiatebutton">Initiate
								LCA</button>
						</div>
						<%-- </center> --%>
						<button type="button"
							style="margin-left: 0px; margin-right: auto; display: block; margin-top: 1%; margin-bottom: 1%; border-radius: 12px; background-color: #205081;"
							class="btn btn-primary btn-sm collapsibletask">Task
							Details</button>
						<div id="alltasksListId">
							<div class="row">
								<div class="col">
									<div class="card">
										<h5 class="card-header" style="padding: 0.0rem;">
											Task Details <span style="float: right;">Add New Task
												<i class="fa fa-plus" id="addtask"></i>
											</span>
										</h5>
										<div class="card-body">
											<div class="row">
												<div class="col-lg-12">
													<%-- <center><div class="form-group row">
														<label for="inputPassword" class="col-sm-3 control-label"><Span
															style="color: red;">*</Span>Select Client</label>
														<div class="col-sm-4"  >
															<select name="client" autoComplete="off"
																class="form-control text-left" id="client" style="width:60%;" required>
															</select>
														</div>
													</div></center> --%>

													<table id="alltasktableid"
														class="table table-hover table-bordered"
														style="text-align: center;">
														<thead>
															<tr>
																<th style="text-align: center">Candidate Name</th>
																<th style="text-align: center">Task Name</th>
																<th style="text-align: center">Task Description</th>
																<th style="text-align: center">LCA/Ref.No</th>
																<!-- <th style="text-align: center">Client Name</th> -->
																<th style="text-align: center">Created Date</th>
																<th style="text-align: center">Due Date</th>
																<th style="text-align: center">Task Status</th>
																<th style="text-align: center">Action</th>
															</tr>
														</thead>
														<tbody id="tskDetails">

														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<button type="button"
							style="margin-left: 0px; margin-right: auto; display: block; margin-top: 1%; margin-bottom: 1%; padding: 2px; border-radius: 12px; background-color: #205081;"
							class="btn btn-primary btn-sm addButton collapsiblelca">LCA
							Details</button>
						<!--   background-color:peru;color:white;line-height:0.728571;cursor: pointer; -->
						<div id="alllcadocListId">
							<div class="row">
								<div class="col">
									<div class="card">
										<h5 class="card-header" style="padding: 0.0rem;">LCA
											Details</h5>
										<div class="card-body">
											<div class="row">
												<div class="col-lg-12">
													<%-- 	<center><div class="form-group row">
														<label for="inputPassword" class="col-sm-3 control-label"><Span
															style="color: red;">*</Span>Select Client</label>
														<div class="col-sm-4"  >
															<select name="lcaclient" autoComplete="off"
																class="form-control text-left" id="lcaclient" style="width:60%;" required>
															</select>
														</div>
													</div></center> --%>
													<table id="alllcatableid"
														class="table table-hover table-bordered"
														style="text-align: center;">
														<thead>
															<tr>
																<th style="text-align: center">LCA#</th>
																<th style="text-align: center">LCA Questionnaire Details</th>
																<th style="text-align: center">End Client Name</th>
																<th style="text-align: center">End Client Status</th>
																<th style="text-align: center">Status</th>
																<th style="text-align: center">LCA Status</th>
																<!-- 	<th style="text-align: center">Action</th> -->
															</tr>
														</thead>
														<tbody>

														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row" id="h1bdiv">
				<div class="col-md-12">
				<center><label><h6><b>Work Authorization :</b></h6></label>&nbsp;&nbsp;<h7><b><span id="visa_workauth" style="color: blue"></span></b></h7>&nbsp;&nbsp;&nbsp;<label><b><h6>Visa Expire Date :</b></h6></label></center><br>
			</div>
				<div class="col-md-12">
							<!-- <button	style="letter-spacing: 0px; background-color: #15aabf; color: white;"
							id="lcadetails" class="btn btn-info btn-sm addButton">
							LCA Questionnaire Report</button>
							<button	style="letter-spacing: 0px; background-color: #15aabf; color: white;"
							id="lcahistory" class="btn btn-info btn-sm addButton">
							LCA History</button> -->
							<!--  <button style="letter-spacing: 0px; background-color: #15aabf; color: white;"
							id="uploadh1bdetails" class="btn btn-info btn-sm addButton">
							Upload Document</button> H4/H4 EAD -->
							<center><label for="inputPassword" class="col-sm-2 control-label">Applicant Current Status</label>
							<span id="currInitStatus" class="label label-success" style="color:darkgreen;font-weight:bold;"></span></center>
							<center><button	style="letter-spacing: 0px; background-color: #15aabf; color: white;"
							id="initiateh1b" class="btn btn-info btn-sm addButton">
							New H1B Initiation</button>	
							<button	style="letter-spacing: 0px; background-color: #15aabf; color: white;"
							id="initiateh4" class="btn btn-info btn-sm addButton">
							 Dependent Details</button>	</center>
						<br>
						<center>
						<div class="col-md-12" >
						 <div id="init_h1bDiv" style="display:none;">
						<form action="/" enctype="multipart/form-data" id="saveH1InitiationForm">
						<input type="hidden" id="init_h1bcandidateid" name="init_h1bcandidateid">
						<br>
						<div class="form-group row">
							<label for="inputPassword" class="col-sm-4 control-label" id="h1initlabel"><span
								style="color: red">*</span>Applicant Initiation Type</label>
							<div class="col-sm-2">
							<select name="h1initVal" id="h1initVal" class="form-control">
							<option value="">Select Type</option>
							</select>
							</div>
					   </div>
					   
					   <div class="form-group row" id="spanmstatus">
							<label for="inputPassword" class="col-sm-4 control-label"><span
							style="color: red">*</span>Marital Status</label>
							<div class="col-sm-2">
								<label>Single</label>&nbsp;<input type="radio" name="marital_status" id="marital_status" value="Single" style=" width: 20px;height: 20px;"/>&nbsp;&nbsp;<label>Married</label>&nbsp;<input type="radio" name="marital_status" id="marital_status" value="Married" style=" width: 20px;height: 20px;"/>
							</div>
					   </div>
					   
					   <div class="form-group row" id="spousefilingId" style="display:none;">
							<label for="inputPassword" class="col-sm-4 control-label"><span
							style="color: red">*</span>Are You Filing Dependent Visa for Spouse?</label>
							<div class="col-sm-2">
								<label>Yes</label>&nbsp;&nbsp;<input type="radio" name="spousefiling" id="spousefiling" value="Yes" style=" width: 20px;height: 20px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>No</label>&nbsp;&nbsp;<input type="radio" name="spousefiling" id="spousefiling" value="No" style=" width: 20px;height: 20px;"/>
							</div>
					   </div>
					   
					   	<div class="form-group row" id="spousedependId" style="display:none;">
							<label for="inputPassword" class="col-sm-4 control-label"><span
								style="color: red">*</span>Are You Filing H4-EAD for Spouse?</label>
							<div class="col-sm-2">
								<label>Yes</label>&nbsp;&nbsp;<input type="radio" name="spousefilingead" id="spousefilingead" value="Yes" style=" width: 20px;height: 20px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>No</label>&nbsp;&nbsp;<input type="radio" name="spousefilingead" id="spousefilingead" value="No" style=" width: 20px;height: 20px;"/>
							<!--<select name="spouseh4dependVal" id="spouseh4dependVal" class="form-control">
							 <option value="">Select Type</option>
							<option value="4">H4</option>
							<option value="5">H4 EAD</option> 
							</select>-->
						</div>
					   </div>
					   	<div class="form-group row" id="kidsId" style="display:none;">
							<label for="inputPassword" class="col-sm-4 control-label"><span
							style="color: red">*</span>Have Kids</label>
							<div class="col-sm-2">
								<label>Yes</label>&nbsp;&nbsp;<input type="radio" name="kids_status" id="kids_status" value="Yes" style=" width: 20px;height: 20px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>No</label>&nbsp;&nbsp;<input type="radio" name="kids_status" id="kids_status" value="No" style=" width: 20px;height: 20px;"/>
							</div>
					   </div>
					   <div class="form-group row" id="kidsfilingId" style="display:none;">
							<label for="inputPassword" class="col-sm-4 control-label"><span
							style="color: red">*</span>Are You Filing Dependent Visa for Kids?</label>
							<div class="col-sm-2">
								<label>Yes</label>&nbsp;&nbsp;<input type="radio" name="kidsfiling" id="kidsfiling" value="Yes" style=" width: 20px;height: 20px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>No</label>&nbsp;&nbsp;<input type="radio" name="kidsfiling" id="kidsfiling" value="No" style=" width: 20px;height: 20px;"/>
							</div>
					   </div>
					 
					 <!--   	<div class="form-group row" id="kidsdependId" style="display:none;">
							<label for="inputPassword" class="col-sm-4 control-label"><span
								style="color: red">*</span>Select Visa Type</label>
							<div class="col-sm-2">
							<select name="kidsh4dependVal" id="kidsh4dependVal" class="form-control">
							<option value="">Select Type</option>
							<option value="4">H4</option>
							<option value="5">H4 EAD</option>
							</select>
						</div>
					   </div> -->
					  
					   <div class="form-group row"  id="initsubh1bid" style="display:none;">
					   <label for="inputPassword" class="col-sm-4 control-label"></label>
							<button type="button" class="btn btn-info btn-sm addButton" id="init_subh1bid"  
							style="padding:2px;border-radius: 12px;background-color:#15aabf;">Initiate</button>
							&nbsp;&nbsp;<button type="button" class="btn btn-info btn-sm addButton" id="init_reseth1bid"  
							style="padding:2px;border-radius: 12px;background-color:#205081;">Reset</button>
						</div>
						</form>
					  </div>
				
						 <div id="uinit_h1bDiv" style="display:none;">
						<form action="/" enctype="multipart/form-data" id="updateH1InitiationForm">
						<input type="hidden" id="uinitiate_id" name="uinitiate_id">
						<br>
						<div class="form-group row">
							<label for="inputPassword" class="col-sm-4 control-label" id="h1initlabel"><span
								style="color: red"></span>Applicant Current Status</label>
							<div class="col-sm-2">
							<span id="uh1initVal" class="label label-success" style="color:darkgreen;font-weight:bold;"></span>
							</div>
					   </div>
					   <div class="form-group row">
							<label for="inputPassword" class="col-sm-4 control-label"><span
							style="color: red">*</span>Marital Status</label>
							<div class="col-sm-2">
								<label>Single</label>&nbsp;<input type="radio" name="umarital_status" id="marital_status1" value="Single" style=" width: 20px;height: 20px;"/>&nbsp;&nbsp;<label>Married</label>&nbsp;<input type="radio" name="umarital_status" id="marital_status2" value="Married" style=" width: 20px;height: 20px;"/>
							</div>
					   </div>
					   
					   <div class="form-group row" id="uspousefilingId" style="display:none;">
							<label for="inputPassword" class="col-sm-4 control-label"><span
							style="color: red">*</span>Are You Filing Dependent Visa for Spouse?</label>
							<div class="col-sm-2">
								<label>Yes</label>&nbsp;&nbsp;<input type="radio" name="uspousefiling" id="spousefiling1" value="Yes" style=" width: 20px;height: 20px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>No</label>&nbsp;&nbsp;<input type="radio" name="uspousefiling" id="spousefiling2" value="No" style=" width: 20px;height: 20px;"/>
							</div>
					   </div>
					   
					   <div class="form-group row" id="uspousedependId" style="display:none;">
							<label for="inputPassword" class="col-sm-4 control-label"><span
								style="color: red">*</span>Are You Filing H4-EAD for Spouse?</label>
							<div class="col-sm-2">
								<label>Yes</label>&nbsp;&nbsp;<input type="radio" name="uspousefilingead" id="uspousefilingead1" value="Yes" style=" width: 20px;height: 20px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>No</label>&nbsp;&nbsp;<input type="radio" name="uspousefilingead" id="uspousefilingead2" value="No" style=" width: 20px;height: 20px;"/>
						</div>
					   </div>
					   
					   <!-- 	<div class="form-group row" id="uspousedependId" style="display:none;">
							<label for="inputPassword" class="col-sm-4 control-label"><span
								style="color: red">*</span>Select Visa Type</label>
							<div class="col-sm-2">
							<select name="uspouseh4dependVal" id="uspouseh4dependVal" class="form-control">
							<option value="">Select Type</option>
							<option value="4">H4</option>
							<option value="5">H4 EAD</option>
							</select>
						</div>
					   </div> -->
					   	<div class="form-group row" id="ukidsId" style="display:none;">
							<label for="inputPassword" class="col-sm-4 control-label"><span
							style="color: red">*</span>Have Kids</label>
							<div class="col-sm-2">
								<label>Yes</label>&nbsp;&nbsp;<input type="radio" name="ukids_status" id="kids_status1" value="Yes" style=" width: 20px;height: 20px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>No</label>&nbsp;&nbsp;<input type="radio" name="ukids_status" id="kids_status2" value="No" style=" width: 20px;height: 20px;"/>
							</div>
					   </div>
					   <div class="form-group row" id="ukidsfilingId" style="display:none;">
							<label for="inputPassword" class="col-sm-4 control-label"><span
							style="color: red">*</span>Are You Filing Dependent Visa for Kids?</label>
							<div class="col-sm-2">
								<label>Yes</label>&nbsp;&nbsp;<input type="radio" name="ukidsfiling" id="kidsfiling1" value="Yes" style=" width: 20px;height: 20px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>No</label>&nbsp;&nbsp;<input type="radio" name="ukidsfiling" id="kidsfiling2" value="No" style=" width: 20px;height: 20px;"/>
							</div>
					   </div>
					 
					   	<!-- <div class="form-group row" id="ukidsdependId" style="display:none;">
							<label for="inputPassword" class="col-sm-4 control-label"><span
								style="color: red">*</span>Select Visa Type</label>
							<div class="col-sm-2">
							<select name="ukidsh4dependVal" id="ukidsh4dependVal" class="form-control">
							</select>
						</div>
					   </div> -->
					  
					   <div class="form-group row" id="uinitsubh1bid" style="display:none;">
					   <label for="inputPassword" class="col-sm-4 control-label"></label>
							<button type="button" class="btn btn-info btn-sm addButton" id="uinit_subh1bid"  
							style="padding:2px;border-radius: 12px;background-color:#205081;">Initiate H4</button>
						</div>
						</form>
					  </div>
						</div>
						</center>
					<div class="col-md-12">
						<button type="button"
							style="margin-left: 0px; margin-right: auto; display: block; margin-top: 1%; margin-bottom: 1%;padding:2px;border-radius: 12px;background-color:#205081;"
						  class="btn btn-primary btn-sm addButton collapsibleh1docs">Employee Document Details</button> 		
						 <div id="h1EmpDocsDiv">
						 <div class="row">
							<div class="col">
								<div class="card">
									<h5 class="card-header">Admin/Immigration Team Submitted Documents</h5>
									<div class="card-body">
										<div class="row">
											<div class="col-lg-12">
												<table id="hdoctable"
													class="table table-hover table-bordered"
													style="text-align: center;">
													<thead>
														<tr>
																	<th style="text-align: center">Template Name</th>
																	<th style="text-align: center">Candidate Name</th>
																	<th style="text-align: center">Document Name</th>
																	<!-- <th style="text-align: center">Sub Document Name</th> -->
																	<th style="text-align: center">Status</th>
																	<th style="text-align: center">Action</th>
																	<th style="text-align: center">Download</th>
														</tr>
													</thead>
													<tbody id="hdoclist">
														
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="candidatepanel" style="display:none;">
										     <div class="col-md-12">
											<div class="card" id="dataTBL">
												<h5 class="card-header">Candidate Submitted Documents</h5>
												<div class="card-body">
													<div><!-- style="max-width:auto; white-space: nowrap;" -->
														<%-- <center>
															<span><strong
																style="font-size: 18px; color: 00cc00;">
																	 Submitted Documents</strong></span>
														</center>  --%>
														<form action="/"  id="remindermailformid" >
														<table id="employeeTableId"	class="table table-hover table-bordered"
												style="text-align: center;">
															<thead>
																<tr>
																   <!--  <th style="display:none;">Id</th> -->
																    <th>Sl.no</th> 
																	<th style="text-align: center">Template Name</th>
																	<th style="text-align: center">Beneficiary Type</th>
																	<th style="text-align: center">Candidate Name</th>
																	<th style="text-align: center">Document Name</th>
																	<!-- <th style="text-align: center">Sub Document Name</th> -->
																	<th style="text-align: center">Candidate Status</th>
																	<th style="text-align: center">Admin Status</th>
																	<th style="text-align: center">Action</th>
																	<th style="text-align: center">Download</th>
																	 <th style="text-align: center">Reminder</th>
																	<!-- <th style="text-align: center">Print        </th> -->
																</tr>
															</thead>
															<!--  id="candidatediv" -->
															<tbody>
																
															</tbody>
														</table>
														</form>
														<center>
																	<button type="button" class="btn btn-primary btn-sm"
																	     id="rembtn" >Send Reminder Mail</button>
															</center>
													</div>
												</div>
											</div>
										</div>
										     
										     </div>
						<!-- -->
						
						</div>
						<!-- </div>  -->
						<input type="hidden" id="qns_initiateid" name="qns_initiateid">
						<input type="hidden" id="qns_candidateid" name="qns_candidateid">
						<button type="button"
							style="margin-left: 0px; margin-right: auto; display: block; margin-top: 1%; margin-bottom: 1%;padding:2px;border-radius: 12px;background-color:#205081;"
						  class="btn btn-primary btn-sm addButton collapsibleh1que">Questionnaire Details</button> 
						<div id="h1QuestionnaireDiv"> 
						 <div class="row">
							<div class="col">
								<div class="card">
									<h5 class="card-header">Employee Questionnaire Forms</h5>
									<div class="card-body">
										<div class="row">
											<div class="col-lg-12">
												<table id="hdoctable1"
													class="table table-hover table-bordered"
													style="text-align: center;">
													<thead>
														<tr>
														<!-- 	<th style="text-align: center">Candidate Name</th> -->
															<th style="text-align: center">Form Name</th>
															<th style="text-align: center">Candidate Status</th>
															<th style="text-align: center">Approver status</th>
															<th style="text-align: center">Action</th>
															<th style="text-align: center">Download Questionnaire</th>
														</tr>
													</thead>
													<tbody id="hdocformlist">
														<!-- <tr>
														<td>Public Benefits Checklist</td>
														<td><span class="label label-info"  id="pbc_canstatus"></span></td>
														<td><span class="label label-info"  id="pbc_adminstatus"></span></td>
														<td>
														<button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" 
														class="btn btn-success btn-sm addButton" onclick="benefitsdetails()" id="pid">
														<i class="fa fa-edit" aria-hidden="true"></i></button>
											    		</td>
											    		<td>
											    		<button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" 
														class="btn btn-success btn-sm addButton" id="downloadpbcQuestionnaires" >
														<i class="fa fa-download" aria-hidden="true"></i></button>
											    		</td>
											    		</tr>
														<tr>
														<td>H1B Questionnaire</td>
														<td><span class="label label-info"  id="h1b_canstatus"></span></td>
														<td><span class="label label-info"  id="h1b_adminstatus"></span></td>
														<td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" 
														class="btn btn-success btn-sm addButton" onclick="h1bdetails()" id="hid">
														<i class="fa fa-edit" aria-hidden="true"></i></button></td>
														<td>
														<button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" 
														class="btn btn-success btn-sm addButton" id="downloadh1bQuestionnaires">
														<i class="fa fa-download" aria-hidden="true"></i></button>														
														</td>
														</tr>
														<tr>
														<td>Client & Vendor Questionnaire</td>
														<td><span class="label label-info"  id="client_canstatus"></span></td>
														<td><span class="label label-info"  id="client_adminstatus"></span></td>
														<td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" 
														class="btn btn-success btn-sm addButton" onclick="clientvendordetails()" id="cid">
														<i class="fa fa-edit" aria-hidden="true"></i></button></td>
														<td>
														<button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" 
														class="btn btn-success btn-sm addButton" id="downloadcvQuestionnaires">
														<i class="fa fa-download" aria-hidden="true"></i></button>
														
														
														</td>
														</tr> -->
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</div>
						<button type="button"
							style="margin-left: 0px; margin-right: auto; display: block; margin-top: 1%; margin-bottom: 1%;padding:2px;border-radius: 12px;background-color:#205081;"
						  class="btn btn-primary btn-sm addButton collapsibleh1task">Task Details</button> 
						<div id="h1taskDiv">
						<div class="row">
							<div class="col">
								<div class="card">
									<h5 class="card-header">Task Details <span style="float:right;">Add New Task <i class="fa fa-plus" id="addh1task"></i></span></h5>
									<div class="card-body">
										<div class="row">
											<div class="col-lg-12">
												<table id="allh1btasktableid"
													class="table table-hover table-bordered"
													style="text-align: center;">
													<thead>
														<tr>
															<th style="text-align: center">Candidate Name</th>
															<th style="text-align: center">Task Name</th>
															<th style="text-align: center">Task Description</th>
															<th style="text-align: center">Created Date</th>
															<th style="text-align: center">Due Date</th>
															<th style="text-align: center">Task Status</th>
															<th style="text-align: center">Action</th>
														</tr>
													</thead>
													<tbody id="htskDetails">
														
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</div>
						
						
						<button type="button"
							style="margin-left: 0px; margin-right: auto; display: block; margin-top: 1%; margin-bottom: 1%;padding:2px;border-radius: 12px;background-color:#205081;"
						  class="btn btn-primary btn-sm addButton collapsibleh1h">H1B Initiated History</button> 
						<!--   background-color:peru;color:white;line-height:0.728571;cursor: pointer; -->
						<div id="allh1hdocListId">
							<div class="row">
							<div class="col">
								<div class="card">
									<h5 class="card-header" style="padding:0.0rem;">H1B Initiated Details </h5>
									<div class="card-body">
									<div class="row"> 
											<div class="col-lg-12">
										<!-- alllcatableid -->
												<table id="h1initatehistory" 
													class="table table-hover table-bordered"
													style="text-align: center;">
													<thead>
														<tr>
														<th style="text-align: center">Initiation Id</th>
														<th style="text-align: center">Initiation Type</th>
														<th style="text-align: center">Submitted Date</th>
														<!-- <th style="text-align: center">Petition Packet</th> --> 
														<th style="text-align: center">Upload H1B Petition Packet</th>
														<th style="text-align: center">Download H1B Petition Packet</th>
														<th style="text-align: center">Status</th>
														<th style="text-align: center">History</th>
														<th style="text-align: center">Comments</th>
														</tr>
													</thead>
													<tbody>
													
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</div>
					</div>
				</div>
			</div>
				<div class="row" id="pafdiv">
					<div class="col-md-12">
						<center>
							<div class="col-md-12">
								<br>
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-4 control-label"><span style="color: red"></span>Select LCA Number</label>
									<div class="col-sm-2">
										<select name="paflcalist" id="paflcalist" class="form-control">
											
										</select>
									</div>
								</div>
							</div>
						</center>
						<div id="pafdetailsdiv" style="display: none">
							<div class="row">
							<div class="col">
								<div class="card">
									<h5 class="card-header" style="padding:0.0rem;">PAF Details </h5>
									<div class="card-body">
									<div class="row"> 
											<div class="col-lg-12">
												<table id="paflisttable"
													class="table table-hover table-bordered"
													style="text-align: center;">
													<thead>
														<tr>
														<th style="text-align: center">Document Name</th>
														<th style="text-align: center">Upload Modified PAF Documents</th>
													
														</tr>
													</thead>
													<tbody> 
													<tr><td id="paftd"><a href="#" onclick="downloadpaf()" style="color: blue">Tekskills Inc-PAF <i class="fa fa-download"></i></a></td><td id="paftd1"><a class="btn btn-secondary btn-sm" style="letter-spacing: 0px; background-color: #6aca2e; color: white;" data-toggle="modal" onclick="Modifiedpaf()" ><i class="fa fa-upload"></i></a></td></tr>
													<tr>
													<!-- onclick="downloadNoticewithoutpaf()" -->
													<td id="withoutpaftd" style="display:none"><a href="#"  style="color: blue"><span id="withoutpafspan"></span><i class="fa fa-download"></i></a></td><td id="withoutpaftd1"><a class="btn btn-secondary btn-sm" style="letter-spacing: 0px; background-color: #6aca2e; color: white;" data-toggle="modal" onclick="Modifiedpafnotice()" ><i class="fa fa-upload"></i></a></td>
													</tr>
													<tr><td id="certifiedtd" style="display:none"><a href="#" style="color: blue"><span id="certifiedspan"></span><i class="fa fa-download"></i></a></td><td id="certifiedtd1"></td>
													</tr>
														
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</div>
					</div>
				</div>

				<!-- <div class="row" id="tasksdiv"> -->
				
				
				<!-- ////////////////////////////////////////////////////////// -->
							
				<button type="button" id="viewalltaskdetailsbtn"
							style="margin-left: 0px; margin-right: auto; display: block; margin-top: 1%; margin-bottom: 1%;padding:2px;border-radius: 12px;background-color:#205081;"
						  class="btn btn-primary btn-sm addButton collapsibleh1task">All Task Details</button> 
				<div class="row" id="tasksdiv">
								<div class="row">
							<div class="col">
								<div class="card">
									<h5 class="card-header">All Task Details <!-- <span style="float:right;">Add New Task <i class="fa fa-plus" id="addtasks"></i></span> --></h5>
									<div class="card-body">
										<div class="row">
											<div class="col-lg-12">
												<table id="viewalltasktableid"
													class="table table-hover table-bordered"
													style="text-align: center;">
													<thead>
														<tr>
															<th style="text-align: center">Task Type</th>
															<th style="text-align: center">Task Name</th>
															<th style="text-align: center">Created Date</th>
															<th style="text-align: center">Due Date</th>
															<th style="text-align: center">Task Status</th>
														    <th style="text-align: center">Action</th> 
														</tr>
													</thead>
													<tbody id="">
														
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
							</div>
							<!-- ////////////////////////////////////////////////////////// -->
				<!-- </div> -->
				
				</div>
								<div class="modal fade" id="h1scandocuments" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width: 70%"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<center>
									<h5 class="modal-title" id="exampleModalLabel"
										style="font-size: 15px">
										<b>Upload H1B Petition Packet</b>
									</h5>
								</center>
							</div>
							<div class="modal-body">
								<form action="/" method="post" id="addh1bscanDetailsForm" enctype="multipart/form-data"
									id="">
									<div class="row">
										<input type="hidden" id="sinitiated" name="sinitiated">
										<input type="hidden" id="scandidateid" name="scandidateid">
										<input type="hidden" id="buttoncount" name="buttoncount">


										<div class="col-md-12 col-sm-12">


											<div class='form-group row'>
												<label for="inputPassword" class="col-sm-3 control-label">Upload
													Documents</label>
												<div class="col-xs-4">
													<button type="button" id="add"
														class="btn btn-success btn-sm addButton">
														<i class="fa fa-plus"></i>
													</button>
												</div>
											</div>
	                                           <div id="addrow"></div>
                                    <div class="text-center ml-5" id="scah1bbtnSubId">
												<button type="submit" class="btn btn-info btn-sm"
													id="scah1bbtnSubmit">Save</button>
											</div>
											
												<table id="scantableid"
													class="table table-hover table-bordered"
													style="text-align: center;">
													<thead>
														<tr>
															<!-- <th>Id</th>
															<th>Beneficiary Name</th>
															<th>File Name</th>
																<th>Doc Type</th>	
															<th>Doc Sub Stype</th>
															<th>Doc Input</th>
															<th>Submitted On</th>
															<th>Submitted By</th>
															<th>Status</th>	 -->
															
															<th>Candidate Name</th>
															<th>File Name</th>
															<th>Input Value</th>
															 <th>Submitted By</th>
															<!-- <th>Status</th> -->
															<!-- <th>Initiate ID</th> -->
															<!-- <th>Posted by</th> -->
															<th>Submitted Date</th>	 
															
															
														
														</tr>
													</thead>
													<tbody>

													</tbody>
												</table>
											
											
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				
<div class="modal fade" id="uploadmodifiedpafmodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width: 70%"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<center>
									<h5 class="modal-title" id="exampleModalLabel"
										style="font-size: 15px">
										<b> Upload PAF Document</b>
									</h5>
								</center>
							</div>
							<div class="modal-body">
								<form action="/" method="post" id="pafForm" enctype="multipart/form-data"
									id="">
									<div class="row">
										<input type="hidden" id="paf_lcaid" name="paf_lcaid">
										<input type="hidden" id="pafcandidateid" name="pafcandidateid">
										<input type="hidden" id="paf_type" name="paf_type">
										<div class="col-md-12 col-sm-12">

													<div class="form-group row">
													<label for="inputPassword" class="col-sm-2 control-label"></label> 
													<div class="col-sm-4">
														<input type="text" class="form-control" placeholder="Enter document name" id="pafdocname" name="pafdocname" required >
													</div>
													<div class="col-sm-4">
													<input type="file" class="form-control" name="paffile"  id="paffile" onchange="ValidatePAFFile(this)" required>
													
													</div>
												</div>
	                                           
                                    <div class="text-center ml-5">
												<button type="button" class="btn btn-info btn-sm"
													id="pafsubmitid">Save</button>
											</div>
											
												<table id="pafmodifiedtable"
													class="table table-hover table-bordered"
													style="text-align: center;">
													<thead>
														<tr>
															
															<th>PAF Document Name</th>
															<th>Candidate Name</th>
															<th>File Name</th>
															<th>Document Name</th>
															 <th>Submitted By</th>
															<th>Submitted Date</th>	 
															<!-- <th>Status</th>	  -->
															
															
														
														</tr>
													</thead>
													<tbody>

													</tbody>
												</table>
											
											
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>				
				
			<div class="modal fade" id="commentmodalid" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width: 70%"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<center>
									<h5 class="modal-title" id="exampleModalLabel"
										style="font-size: 15px">
										<b>Comments</b>
									</h5>
								</center>
							</div>
							<div class="modal-body">
								<form action="/" method="post" id="cmtformid">
									<div class="row">
										
										<div class="col-md-12 col-sm-12">

													<div class="form-group row">
													<label for="inputPassword" class="col-sm-2 control-label"><span style="color:red;">*</span>Comments</label> 
													<div class="col-sm-8">
													<input type="hidden" name="inithistid" id="inithistid">
													<textarea id="cmntid" name="cmntid" type="text" required  class="form-control" 
											   		 placeholder="Please Enter comments" row="3" column="50"></textarea>
														<!-- <input type="text" class="form-control" placeholder="Please Enter comments" id="cmntid" name="cmntid" required >
													 --></div>
													
												</div>
	                                           
                                    <div class="text-center ml-5">
												<button type="submit" class="btn btn-info btn-sm"
													id="cmntsave">Save</button>
											</div>
											
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>				
				
				
				
				
				
        <!--Task related all popup starts -->
				
				<div class="modal fade" id="taskmodal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<!-- addtaskmodal -->
					<div class="modal-dialog modal-lg" style="max-width: 50%"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b>Update Task Details</b>
								</h5>
							</div>

							<div class="modal-body">
								<form action="/" enctype="multipart/form-data"
									id="updateTaskForm">
									<div class="row">
										<!-- <form action="/" enctype="multipart/form-data"	id="updatTaskForm"> -->
										<input type="hidden" id="taskid" name="taskid">
										<div class="col-md-12 col-sm-12">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Task Name</label>
												<div class="col-sm-6">
													<input id="taskname" name="task_name" class="form-control"
														readonly />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">Task
													Description</label>
												<div class="col-sm-6">
													<input id="description" name="udescription"
														class="form-control" />

												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Task Created Date</label>
												<div class="col-sm-6">
													<input id="createddate" name="createddate"
														class="form-control" readonly />
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Task Due Date</label>
												<div class="col-sm-6">
													<input id="duedate" name="duedate" onkeydown="return false"
														class="form-control" required autocomplete="off"/>
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Task Status</label>
												<div class="col-sm-6">
													<select class="form-control" id="taskstatus"
														name="taskstatus">
														<option value="">Select Status</option>
														<option value="Open">Open</option>
														<option value="Inprogress">Inprogress</option>
														<option value="Closed">Close</option>
													</select>
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label">Comments</label>
												<div class="col-sm-6">
													<textarea id="comments" name="comments"
														class="form-control"></textarea>

												</div>
											</div>

											<!-- <div class="text-center ml-5">
												<button type="button" class="btn btn-info btn-sm"
													id="btnSubmit">Update</button>
												<button id="cancle" class="btn btn-info btn-sm"
													>Close</button>
											</div> -->

										</div>
										<!-- </form> -->
									</div>
								</form>
								<div class="text-center ml-5">
									<button type="button" class="btn btn-info btn-sm"
										id="btnSubmit">Update</button>
									<button type="button" id="btn-colorb" data-dismiss="modal"
										class="btn btn-info btn-sm">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="modal fade" id="addtaskmodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width: 50%"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b>Add Task</b>
								</h5>
							</div>
							<div class="modal-body">
								<form action="/" enctype="multipart/form-data" id="addTaskForm">
									<input type="hidden" id="client_id" name="client_id">
									<input type="hidden" id="canid" name="candidateid">
									<div class="row">
										<div class="col-md-12 col-sm-12">
											<div class="form-group row">
														<label class="col-sm-3 col-form-label">
														<span style="color: red">*</span>LCA/Ref.no</label>
														<div class="col-sm-6">
														<select name="lcaRefNoListTask" autoComplete="off"
															class="form-control text-left" id="lcaRefNoListTask" required>
														</select>
														</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">
												<span style="color: red">*</span>Task Name</label>
												<div class="col-sm-6">
													<input id="ataskname" name="taskname" class="form-control"
														required />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">Task
												<span style="color: red">*</span>Description</label>
												<div class="col-sm-6">
													<textarea id="adescription" name="description" required
														class="form-control"></textarea>
													<!-- <input id="adescription" name="description" required
																class="form-control" /> -->

												</div>
											</div>

											<div class="form-group row" style="display: none;">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Task Due Date</label>
												<div class="col-sm-6">
													<input id="aduedate" name="duedate" autocomplete="off"
														onkeydown="return false" class="form-control" />
												</div>
											</div>
										</div>
										<!-- </form> -->
									</div>

									<div class="text-center ml-5">
										<button type="button" class="btn btn-info btn-sm"
											id="abtnSubmit">Save</button>
										<!-- <button type="button" id="btn-colorb"  data-dismiss="modal"  class="btn btn-info btn-sm">Close</button> -->
										<button type="button" data-dismiss="modal"
											class="btn btn-info btn-sm btn-colorb">Close</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="modal fade" id="addh1taskmodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width: 50%"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b>Add Task</b>
								</h5>
							</div>
							<div class="modal-body">
								<form action="/" enctype="multipart/form-data" id="addh1TaskForm">
									<input type="hidden" id="ah1candidateid" name="ah1candidateid">
									<div class="row">
										<div class="col-md-12 col-sm-12">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Task Name</label>
												<div class="col-sm-6">
													<input id="ah1taskname" name="ah1taskname" class="form-control"
														required />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">Task
													Description</label>
												<div class="col-sm-6">
													<textarea id="ah1description" name="ah1description" required
														class="form-control"></textarea>
													<!-- <input id="adescription" name="description" required
																class="form-control" /> -->

												</div>
											</div>

											<div class="form-group row" style="display: none;">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Task Due Date</label>
												<div class="col-sm-6">
													<input id="ah1duedate" name="ah1duedate" autocomplete="off"
														onkeydown="return false" class="form-control" />
												</div>
											</div>
										</div>
										<!-- </form> -->
									</div>

									<div class="text-center ml-5">
										<button type="button" class="btn btn-info btn-sm"
											id="ah1btnSubmit">Save</button>
										<!-- <button type="button" id="btn-colorb"  data-dismiss="modal"  class="btn btn-info btn-sm">Close</button> -->
										<button type="button" data-dismiss="modal"
											class="btn btn-info btn-sm btn-colorb">Close</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				
				
				
				<div class="modal fade" id="updateh1taskmodal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<!-- addtaskmodal -->
					<div class="modal-dialog modal-lg" style="max-width: 50%"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b>Update Task Details</b>
								</h5>
							</div>

							<div class="modal-body">
								<form action="/" enctype="multipart/form-data"
									id="updateh1TaskForm">
									<div class="row">
										<!-- <form action="/" enctype="multipart/form-data"	id="updatTaskForm"> -->
										<input type="hidden" id="h1taskid" name="h1taskid">
										<div class="col-md-12 col-sm-12">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Task Name</label>
												<div class="col-sm-6">
													<input id="uh1task_name" name="uh1task_name" class="form-control"
														readonly />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">Task
													Description</label>
												<div class="col-sm-6">
													<input id="uh1description" name="uh1description"
														class="form-control" />

												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Task Created Date</label>
												<div class="col-sm-6">
													<input id="uh1createddate" name="uh1createddate"
														class="form-control" readonly />
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Task Due Date</label>
												<div class="col-sm-6">
													<input id="uh1duedate" name="uh1duedate" onkeydown="return false"
														class="form-control" autocomplete="off" required />
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Task Status</label>
												<div class="col-sm-6">
													<select class="form-control" id="uh1taskstatus"
														name="uh1taskstatus">
														<option value="">Select Status</option>
														<option value="Open">Open</option>
														<option value="Inprogress">Inprogress</option>
														<option value="Closed">Close</option>
													</select>
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label">Comments</label>
												<div class="col-sm-6">
													<textarea id="uh1comments" name="uh1comments"
														class="form-control"></textarea>

												</div>
											</div>

											<!-- <div class="text-center ml-5">
												<button type="button" class="btn btn-info btn-sm"
													id="btnSubmit">Update</button>
												<button id="cancle" class="btn btn-info btn-sm"
													>Close</button>
											</div> -->

										</div>
										<!-- </form> -->
									</div>
								</form>
								<div class="text-center ml-5">
									<button type="button" class="btn btn-info btn-sm"
										id="uh1btnUpdate">Update</button>
									<button type="button" id="btn-colorb" data-dismiss="modal"
										class="btn btn-info btn-sm">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
						<div class="modal fade" id="updatealltaskmodal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<!-- addtaskmodal -->
					<div class="modal-dialog modal-lg" style="max-width: 50%"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b>Update Task Details</b>
								</h5>
							</div>

							<div class="modal-body">
								<form action="/" enctype="multipart/form-data"
									id="updateallTaskForm">
									<div class="row">
										<!-- <form action="/" enctype="multipart/form-data"	id="updatTaskForm"> -->
										<input type="hidden" id="alltaskid" name="taskid">
										<div class="col-md-12 col-sm-12">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Task Name</label>
												<div class="col-sm-6">
													<input id="ualltask_name" name="task_name" class="form-control"
														readonly />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">Task
													Description</label>
												<div class="col-sm-6">
													<input id="ualldescription" name="description"
														class="form-control" />

												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Task Created Date</label>
												<div class="col-sm-6">
													<input id="uallcreateddate" name="createddate"
														class="form-control" readonly />
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Task Due Date</label>
												<div class="col-sm-6">
													<input id="uallduedate" name="duedate" onkeydown="return false"
														class="form-control" required autocomplete="off"/>
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Task Status</label>
												<div class="col-sm-6">
													<select class="form-control" id="ualltaskstatus"
														name="taskstatus">
														<option value="">Select Status</option>
														<option value="Open">Open</option>
														<option value="Inprogress">Inprogress</option>
														<option value="Closed">Close</option>
													</select>
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label">Comments</label>
												<div class="col-sm-6">
													<textarea id="uallcomments" name="comments"
														class="form-control"></textarea>

												</div>
											</div>

											<!-- <div class="text-center ml-5">
												<button type="button" class="btn btn-info btn-sm"
													id="btnSubmit">Update</button>
												<button id="cancle" class="btn btn-info btn-sm"
													>Close</button>
											</div> -->

										</div>
										<!-- </form> -->
									</div>
								</form>
								<div class="text-center ml-5">
									<button type="button" class="btn btn-info btn-sm"
										id="uallbtnUpdate">Update</button>
									<button type="button" id="btn-colorb" data-dismiss="modal"
										class="btn btn-info btn-sm">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				 <!--Task related all popup ends -->

				 <!--LCA module related all popups starts -->
			<div class="modal fade" id="initlcadetailsmodal"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width: 80%"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b>Add LCA Questionnaire Details</b>
								</h5>
							</div>

							<div class="modal-body">
								<form action="/" enctype="multipart/form-data"
									id="init_LCAQDetailsForm" autocomplete="off">
									<input type="hidden" id="init_candidateid"
										name="init_candidateid"> <input type="hidden"
										id="init_endClientId" name="init_endClientId"> <input
										type="hidden" id="init_end_addressId"
										name="init_end_addressId"> <input type="hidden"
										id="init_remote_addressId" name="init_remote_addressId">
									<!--     <input type="hidden" id="education1" >
                                      <input type="hidden" id="working_location1" >  <input type="hidden" id="reason_lca1" >
                                       <input type="hidden" id="end_line1">  <input type="hidden" id="end_line2" >
                                      <input type="hidden" id="end_city" > <input type="hidden" id="end_state" >
                                      <input type="hidden" id="end_zipcode" >
                                      <input type="hidden" id="remoteline1" >   <input type="hidden" id="remoteline2" > 
                                     <input type="hidden" id="remotecity">   <input type="hidden" id="remotestate"> 
                                     <input type="hidden" id="remotezipcode">
                                      <input type="hidden" id="remotecounty">  <input type="hidden" id="remotesoc_code"> -->


									<!-- 	<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red"></span>LCA/Ref.no</label>
														<div class="col-sm-6">
														<select name="lcaqueRefNoList" autoComplete="off"
															class="form-control text-left" id="lcaqueRefNoList" required>
														</select>
														</div>
												</div> -->
									<div id="lcaqueInitDiv">
										<div class="row">
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-2 control-label"><span
													style="color: red"></span></label>
												<div class="col-sm-6">
													<label>In House Project</label>&nbsp;&nbsp;<input
														type="radio" name="lcaType" id="lcaTypeInP"
														value="In House Project"
														style="width: 20px; height: 20px;" required />&nbsp;&nbsp;&nbsp;<label>Client
														Project</label>&nbsp;<input type="radio" name="lcaType"
														id="lcaTypeCP" value="Client Project"
														style="width: 20px; height: 20px;" /> <br>
												</div>
											</div>
											<div class="col-md-6 col-sm-12">

												<div class="form-group row">
													<label class="col-sm-3 col-form-label"><span
														style="color: red">*</span>End Client Name</label>
													<div class="col-sm-6">
														<select name="init_endClientName" autoComplete="off"
															class="form-control text-left" id="init_endClientName"
															required>
														</select>
														<span id="init_endClientSpan" style="color:green;"></span>
														<!-- <input type="text" id="init_endClientName" name="init_endClientName"
																placeholder="End Client Name" class="form-control" /> -->
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-3 col-form-label"><span
														style="color: red"></span>Organization Name</label>
													<div class="col-sm-6">
														<input id="init_organization" name="init_organization"
															class="form-control" readonly value="Tekskills Inc" />
													</div>
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Education</label>
													<div class="col-sm-6">
														<input id="init_education" type="text" minlength="2"
															maxlength="100" title="only alphabets are allowed"
															placeholder="Education" name="init_education"
															class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Reason for filing LCA</label>
													<div class="col-sm-6">
														<select id="init_reason_lca" name="init_reason_lca"
															class="form-control">
															<option value="">Select Reason</option>
															<option value="H1B Extension">H1B Extension</option>
															<option value="H1B Transfer">H1B Transfer</option>
															<option value="H1B CAP">H1B CAP</option>
															<option value="H1B Amendment">H1B Amendment</option>
															 <option value="H1B Amendment+Extension">H1B Amendment+Extension</option>
														</select>
													</div>
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Candidate Job Title</label>
													<div class="col-sm-6">
														<input id="init_cand_job_title" type="text" minlength="2"
															maxlength="100" title="only alphabets are allowed"
															placeholder="Candidate Job Title"
															name="init_cand_job_title" class="form-control">
													</div>
												</div>
												<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Job Duties</label>
												<div class="col-sm-6">
													<textarea id="init_duties" type="text" rows="6" cols="100" 
													autocomplete="off" placeholder="Job Duties" name="init_duties" class="form-control"  required></textarea>
												</div>
											   </div>
											</div>
											<div class="col-md-6 col-sm-12">
												<h5>
													<b>End Client Address</b>
												</h5>
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>Line1</label>
													<div class="col-sm-6">
														<input id="init_endline1" type="text" minlength="2"
															maxlength="80" required title="Enter address"
															placeholder="Employee Address" name="init_endline1"
															class="form-control">
													</div>
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;"></Span>Line2</label>
													<div class="col-sm-6">
														<input id="init_endline2" type="text"
															pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*" minlength="2"
															maxlength="80" title="only alpha numerics are allowed"
															placeholder="line2" name="init_endline2"
															class="form-control">
													</div>
													<!-- pattern="^[a-zA-Z\s]+$" -->
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>City</label>
													<div class="col-sm-6">
														<input id="init_endcity" type="text" minlength="2"
															maxlength="40" required
															title="only Characters are allowed" placeholder="City"
															name="init_endcity" class="form-control">
													</div>
													<!--pattern="^[a-zA-Z\s]+$" " -->
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>State</label>
													<div class="col-sm-6">
														<input id="init_endstate" type="text" minlength="2"
															maxlength="25" title="only Characters are allowed"
															autocomplete="off" placeholder="State"
															name="init_endstate" class="form-control" required>
													</div>
													<!-- pattern="^[a-zA-Z\s]+$" -->
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>Zip Code</label>
													<div class="col-sm-6">
														<input id="init_endzipcode" type="text" required
															title="only alphabets are allowed" pattern="[0-9]{5}"
															minlength="5" maxlength="5" placeholder="Zip Code"
															name="init_endzipcode" class="form-control">
													</div>
													<!-- pattern="^[a-zA-Z\s]+$" -->
												</div>
												<div class="form-group row">
												    <label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Metro Politan Area</label>
												    <div class="col-sm-6">
													  <input id="init_end_metro_politan_area" type="text"  minlength="2" maxlength="25"
													    title="only alphabets are allowed" 
													    autocomplete="off" placeholder="Metro Politan Area" name="init_end_metro_politan_area" class="form-control">
												     </div>
											     </div>
											</div>

											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span
													style="color: red;">*</Span>Are you working/supporting at :</label>
												<div class="col-sm-5">
													<label class="control-label">Remote/Home</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
														type="radio" name="init_workinglocation"
														id="init_worklocation1" value="Remote/Home"
														style="width: 20px; height: 20px;" />&nbsp;&nbsp;&nbsp;&nbsp;<label>End
														client location</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
														type="radio" name="init_workinglocation" value="EndClient"
														id="init_worklocation2" style="width: 20px; height: 20px;" />

													<!-- <label class="control-label">Remote/Home</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="init_workinglocation" value="Remote/Home" style=" width: 20px;height: 20px;"/>&nbsp;&nbsp;&nbsp;&nbsp;<label>End client location</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="init_workinglocation" value="EndClient" style=" width: 20px;height: 20px;"/> -->
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
												<div id="init_remoteAddress" style="display: none;">
													<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;">*</Span>Line1</label>
														<div class="col-sm-6">
															<input id="init_remote_line1" type="text" minlength="2"
																maxlength="80" required title="Enter address"
																placeholder="Employee Address" name="init_remote_line1"
																class="form-control">
														</div>
													</div>
													<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;">*</Span>City</label>
														<div class="col-sm-6">
															<input id="init_remote_city" type="text" minlength="2"
																maxlength="40" required
																title="only Characters are allowed" placeholder="City"
																name="init_remote_city" class="form-control">
														</div>
														<!--pattern="^[a-zA-Z\s]+$" " -->
													</div>
													<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;">*</Span>Zip Code</label>
														<div class="col-sm-6">
															<input id="init_remote_zipcode" type="text" required
																title="only alphabets are allowed" pattern="[0-9]{5}"
																minlength="5" maxlength="5" placeholder="Zip Code"
																name="init_remote_zipcode" class="form-control">
														</div>
														<!-- pattern="^[a-zA-Z\s]+$" -->
													</div>
												</div>
												 <br>
											</div>
											<div class="col-md-6 col-sm-12">
												<div id="init_remoteAddress1" style="display: none;">
													<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;"></Span>Line2</label>
														<div class="col-sm-6">
															<input id="init_remote_line2" type="text"
																pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*" minlength="2"
																maxlength="80" title="only alpha numerics are allowed"
																placeholder="line2" name="init_remote_line2"
																class="form-control">
														</div>
														<!-- pattern="^[a-zA-Z\s]+$" -->
													</div>
													<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;">*</Span>State</label>
														<div class="col-sm-6">
															<input id="init_remote_state" type="text" minlength="2"
																maxlength="25" title="only Characters are allowed"
																autocomplete="off" placeholder="State"
																name="init_remote_state" class="form-control" required>
														</div>
														<!-- pattern="^[a-zA-Z\s]+$" -->
													</div>
													<div class="form-group row">
												    <label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Metro Politan Area</label>
												    <div class="col-sm-6">
													  <input id="init_remote_metro_politan_area" type="text"  minlength="2" maxlength="25"
													    title="only alphabets are allowed" 
													    autocomplete="off" placeholder="Metro Politan Area" name="init_remote_metro_politan_area" class="form-control">
												     </div>
											        </div>
												</div>
												 <br>
											</div>
											
											<div class="col-md-6 col-sm-12">
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>County</label>
													<div class="col-sm-6">
														<input id="init_remote_county" type="text" minlength="4"
															maxlength="20" title="only alphabets are allowed"
															placeholder="County" name="init_remote_county"
															class="form-control">
													</div>
												</div>
											</div>
											
											<div class="col-md-6 col-sm-12">
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>SOC code</label>
													<div class="col-sm-6">
														<!-- <input id="init_remote_soc_code" type="text" minlength="7"
															maxlength="7" title="only alphabets are allowed"
															placeholder="SOC code" name="init_remote_soc_code"
															class="form-control"> -->
															<select id="init_remote_soc_code" name="init_remote_soc_code"
															class="form-control">
															</select>
															
													</div>
												</div>
											</div>
											
											<!-- <input type="hidden" id="locid" name="locbtncount">
											<div class="col-md-6 col-sm-12">
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Add More Locations</label>
													<div class="col-sm-6">
														<button type="button" id="addloc" class="btn btn-success btn-sm addButton" onclick="moreLocations()">
														<i class="fa fa-plus"></i>
													</button>
													
													</div>
													
												</div>
												<div id="OtherLocationBtnDiv"></div>
											</div> -->
											
											
											<div class="col-md-6 col-sm-12">
												<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>LCA Filing  Date</label>
														<div class="col-sm-6">
															<input type="text"  id="init_lcaPostedDate" name="init_lcaPostedDate" autocomplete="off"
																class="form-control" onkeydown="return true" placeholder="LCA Filing Date" />
														</div>
											  </div>
												<div class="form-group row">
													<label class="col-sm-3 col-form-label"><span
														style="color: red">*</span>LCA Begin Date</label>
													<div class="col-sm-6">
														<input type="text" id="init_lcaBeginDate"
															name="init_lcaBeginDate" class="form-control" autocomplete="off"
															onkeydown="return true" placeholder="LCA Begin Date" />
													</div>
												</div>
												
											</div>
											<div class="col-md-6 col-sm-12">
											
											<div class="form-group row">
													<label class="col-sm-3 col-form-label"><span
														style="color: red">*</span>Wage Rate</label>
													<div class="col-sm-4">
														<input type="text" id="init_wageRate" name="init_wageRate"
															class="form-control" placeholder="Wage Rate" minlength="2" maxlength="10"
															 title="please enter valid format as ex: 12.00 or 12"
											 				 onkeypress="javascript:return isNumber(event)"//>
													</div>
													<div class="col-sm-2">
														<select id="iwr_option" name="iwr_option" class="form-control">
													 			<option value="">Select Option</option>
															 	<option value="Per/Hour">Per/Hour</option>
															 	<option value="Per/Year">Per/Year</option>
													 		</select>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-3 col-form-label"><span
														style="color: red">*</span>LCA End Date</label>
													<div class="col-sm-6">
														<input type="text" id="init_lcaEndDate"
															name="init_lcaEndDate" class="form-control" autocomplete="off"
															onkeydown="return true" placeholder="LCA End Date" disabled/>
													</div>
												</div>
											</div>

											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label">To
													get Counties</label>
												<div class="col-sm-3">
													<span><a href="https://www.getzips.com/zip.htm"
														target="_blank" style="color: blue;">https://www.getzips.com/zip.htm</a></span>
												</div>
												<label for="inputPassword" class="col-sm-0 control-label">To
													get SOC</label>
												<div class="col-sm-3">
													<span><a href="https://www.flcdatacenter.com/"
														target="_blank" style="color: blue;">https://www.flcdatacenter.com/</a></span><br>
													<br>
												</div>
											</div>
										</div>
									</div>
									
									<div id="init_addOtherLocation" class="form-group" style="display: none;">
									 <h5><b>LCA Location Details</b></h5>
											<input type="hidden" id="initulcaotherloc_addrid" name="initulcaotherloc_addrid[]" >
											<div class="row" id="inituaddOtherLocationDiv">
											<div class="col-md-6 col-sm-12">
												<!-- <div id="init_remoteAddress" style="display: none;"> -->
													<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												    <div class="col-sm-6">
													    <input id="initulca_othr_line1" type="text"  minlength="2" maxlength="80" 
													      autocomplete="off" placeholder="Enter Line1" name="initulca_othr_line1[]" class="form-control"  required>
												      </div>
												    <!--   <div class="col-xs-4">
													<button type="button" class="btn btn-danger removeButton removeButtonloc">
														<i class="fa fa-minus"></i>
													</button>
												    </div> -->
											      </div> 
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>City</label>
													<div class="col-sm-6">
														<input id="initulca_othr_city" type="text" minlength="2"
															maxlength="25" title="only Characters are allowed"
															autocomplete="off" placeholder="City" name="initulca_othr_city[]"
															class="form-control" required>
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Zip Code</label>
													<div class="col-sm-6">
														<input id="initulca_othr_zipcode" type="text" pattern="[0-9]{5}"
															minlength="5" maxlength="5"
															title="only digits are allowed" autocomplete="off"
															placeholder="Zip Code" name="initulca_othr_zipcode[]"
															class="form-control" required>
													</div>
												</div>
											<!-- </div> -->
											</div>
											<div class="col-md-6 col-sm-12">
												<!-- <div id="init_remoteAddress1" style="display: none;"> -->
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Line2</label>
													<div class="col-sm-6">
														<input type="text"
															pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*" minlength="2"
															maxlength="80" title="only alpha numerics are allowed"
															placeholder="Enter Line2" autocomplete="off"
															name="initulca_othr_line2[]" id="initulca_othr_line2" class="form-control">
													</div>
												</div> 
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>State</label>
													<div class="col-sm-6">
														<input id="initulca_othr_state" type="text" minlength="2"
															maxlength="25" title="only Characters are allowed"
															autocomplete="off" placeholder="State"
															name="initulca_othr_state[]" class="form-control" required>
													</div>
												</div>
												<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;">*</Span>Metro Politan Area</label>
														<div class="col-sm-6">
															<input id="initulca_othr_remote_metro" type="text" minlength="2"
																maxlength="25" title="only Characters are allowed"
																autocomplete="off" placeholder="Metro Politan Area"
																name="initulca_othr_remote_metro[]" class="form-control" required>
														</div>
													</div>
												<!-- </div> -->
											</div>
											</div>
											</div>
									
									<div class="col-md-6 col-sm-12">
											<div class='form-group row' id="add">
                                       <label for="inputPassword" class="col-sm-3 control-label">Add More Locations</label>
												<div class="col-xs-4">
													<button type="button" class="btn btn-success addButton addButtonloc">
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                        </div>
                                        </div>
									<div id="addOtherLocation" class="form-group" style="display: none;">
											<div class="row" id="addOtherLocationDiv">
											<div class="col-md-6 col-sm-12">
												<!-- <div id="init_remoteAddress" style="display: none;"> -->
													<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												    <div class="col-sm-6">
													    <input id="lca_othr_line1" type="text"  minlength="2" maxlength="80" 
													      autocomplete="off" placeholder="Enter Line1" name="lca_othr_line1[]" class="form-control"  required>
												      </div>
												      <div class="col-xs-4">
													<button type="button" class="btn btn-danger removeButton removeButtonloc">
														<i class="fa fa-minus"></i>
													</button>
												    </div>
											      </div> 
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>City</label>
													<div class="col-sm-6">
														<input id="lca_othr_city" type="text" minlength="2"
															maxlength="25" title="only Characters are allowed"
															autocomplete="off" placeholder="City" name="lca_othr_city[]"
															class="form-control" required>
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Zip Code</label>
													<div class="col-sm-6">
														<input id="lca_othr_zipcode" type="text" pattern="[0-9]{5}"
															minlength="5" maxlength="5"
															title="only digits are allowed" autocomplete="off"
															placeholder="Zip Code" name="lca_othr_zipcode[]"
															class="form-control" required>
													</div>
												</div>
											<!-- </div> -->
											</div>
											<div class="col-md-6 col-sm-12">
												<!-- <div id="init_remoteAddress1" style="display: none;"> -->
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Line2</label>
													<div class="col-sm-6">
														<input type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*" minlength="2"
															maxlength="80" title="only alpha numerics are allowed"
															placeholder="Enter Line2" autocomplete="off"
															name="lca_othr_line2[]" id="lca_othr_line2" class="form-control">
													</div>
												</div> 
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>State</label>
													<div class="col-sm-6">
														<input id="lca_othr_state" type="text" minlength="2"
															maxlength="25" title="only Characters are allowed"
															autocomplete="off" placeholder="State"
															name="lca_othr_state[]" class="form-control" required>
													</div>
												</div>
												<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;">*</Span>Metro Politan Area</label>
														<div class="col-sm-6">
															<input id="lca_othr_remote_metro" type="text" minlength="2"
																maxlength="25" title="only Characters are allowed"
																autocomplete="off" placeholder="Metro Politan Area"
																name="lca_othr_remote_metro[]" class="form-control" required>
														</div>
													</div>
												<!-- </div> -->
											</div>
											</div>
											</div>

									<div class="text-center ml-5" id="init_lcaqbtnUpdateId">
										<button type="button" class="btn btn-info btn-sm"
											id="init_lcaqbtnUpdate">Save</button>
										<button type="button" class="btn btn-info btn-sm"
											id="btn-colorb" data-dismiss="modal">Cancel</button>	
									</div>
								</form>
							</div>

						</div>
					</div>
				</div>

				
    
				<div class="modal fade" id="lcadetailsmodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width: 80%"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b>LCA Questionnaire Details</b>
								</h5>
							</div>

							<div class="modal-body">
								<form action="/" enctype="multipart/form-data"
									id="updateLCAQDetailsForm" autocomplete="off">

									<input type="hidden" id="endClientId" name="endClientId">
									<input type="hidden" id="end_addressId" name="end_addressId">
									<input type="hidden" id="remote_addressId"
										name="remote_addressId"> <input type="hidden"
										id="job_title1"> <input type="hidden" id="education1">

									<input type="hidden" id="working_location1"> <input
										type="hidden" id="reason_lca1"> <input type="hidden"
										id="end_line1"> <input type="hidden" id="end_line2">
									<input type="hidden" id="end_city"> <input
										type="hidden" id="end_state"> <input type="hidden"
										id="end_zipcode"> <input type="hidden"
										id="remoteline1"> <input type="hidden"
										id="remoteline2"> <input type="hidden"
										id="remotecity"> <input type="hidden" id="remotestate">
									<input type="hidden" id="remotezipcode"> <input
										type="hidden" id="remotecounty"> <input type="hidden"
										id="remotesoc_code"> <input type="hidden"
										id="ulcaBeginDate"> 
										<input type="hidden" id="ulcaPostedDate"> <input type="hidden" id="umetro_politan_area">
										 


									<div class="form-group row">
										<label class="col-sm-4 col-form-label"><span
											style="color: red"></span>LCA/Ref.no</label>
										<div class="col-sm-4">
											<select name="lcaqueRefNoList" autoComplete="off"
												class="form-control text-left" id="lcaqueRefNoList" required>
											</select>
										</div>
									</div>
									<div id="lcaqueDiv" style="display: none;">
										<div class="row">
											<div class="col-md-6 col-sm-12">

												<div class="form-group row">
													<label class="col-sm-3 col-form-label"><span
														style="color: red">*</span>End Client Name</label>
													<div class="col-sm-6">
														<input id="endClientName" name="endClientName"
															class="form-control" />
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-3 col-form-label"><span
														style="color: red"></span>Organization Name</label>
													<div class="col-sm-6">
														<input id="organization" name="organization"
															class="form-control" readonly />
													</div>
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Education</label>
													<div class="col-sm-6">
														<input id="education" type="text" minlength="2"
															maxlength="100" title="only alphabets are allowed"
															placeholder="Education" name="education"
															class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Reason for filing LCA</label>
													<div class="col-sm-6">
														<select id="reason_lca" name="reason_lca"
															class="form-control">
															<option value="">Select Reason</option>
															<option value="H1B Extension">H1B Extension</option>
															<option value="H1B Transfer">H1B Transfer</option>
															<option value="H1B CAP">H1B CAP</option>
															<option value="H1B Amendment">H1B Amendment</option>
															 <option value="H1B Amendment+Extension">H1B Amendment+Extension</option>
															<!--  <option value="H1B Amendment">H1B Amendment</option> -->
														</select>
													</div>
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Candidate Job Title</label>
													<div class="col-sm-6">
														<input id="cand_job_title" type="text" minlength="2"
															maxlength="100" title="only alphabets are allowed"
															placeholder="Candidate Job Title" name="cand_job_title"
															class="form-control">
													</div>
												</div>
												<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Job Duties</label>
												<div class="col-sm-6">
													<textarea id="u_duties" type="text" rows="6" cols="100" 
													autocomplete="off" placeholder="Job Duties" name="u_duties" class="form-control"  required></textarea>
												</div>
											   </div>
											</div>
											<div class="col-md-6 col-sm-12">
												<h5>
													<b>End Client Address</b>
												</h5>
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>Line1</label>
													<div class="col-sm-6">
														<input id="endline1" type="text" minlength="2"
															maxlength="80" required title="Enter address"
															placeholder="Employee Address" name="endline1"
															class="form-control">
													</div>
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;"></Span>Line2</label>
													<div class="col-sm-6">
														<input id="endline2" type="text"
															pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*" minlength="2"
															maxlength="80" title="only alpha numerics are allowed"
															placeholder="line2" name="endline2" class="form-control">
													</div>
													<!-- pattern="^[a-zA-Z\s]+$" -->
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>City</label>
													<div class="col-sm-6">
														<input id="endcity" type="text" minlength="2"
															maxlength="40" required
															title="only Characters are allowed" placeholder="City"
															name="endcity" class="form-control">
													</div>
													<!--pattern="^[a-zA-Z\s]+$" " -->
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>State</label>
													<div class="col-sm-6">
														<input id="endstate" type="text" minlength="2"
															maxlength="25" title="only Characters are allowed"
															autocomplete="off" placeholder="State" name="endstate"
															class="form-control" required>
													</div>
													<!-- pattern="^[a-zA-Z\s]+$" -->
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>Zip Code</label>
													<div class="col-sm-6">
														<input id="endzipcode" type="text" required
															title="only alphabets are allowed" pattern="[0-9]{5}"
															minlength="5" maxlength="5" placeholder="Zip Code"
															name="endzipcode" class="form-control">
													</div>
													<!-- pattern="^[a-zA-Z\s]+$" -->
												</div>
												<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Metro Politan Area</label>
												<div class="col-sm-6">
													<input id="u_metro_politan_area" type="text"  minlength="2" maxlength="25"
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="Metro Politan Area" name="u_metro_politan_area" class="form-control">
												</div>
											    </div>
												
											</div>

											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span
													style="color: red;">*</Span>Are you working/supporting at :</label>
												<div class="col-sm-5">
													<label class="control-label">Remote/Home</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
														type="radio" name="workinglocation" id="worklocation1"
														value="Remote/Home" style="width: 20px; height: 20px;"
														checked />&nbsp;&nbsp;&nbsp;&nbsp;<label>End
														client location</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
														type="radio" name="workinglocation" value="EndClient"
														id="worklocation2" style="width: 20px; height: 20px;" />
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
												<div id="remoteAddress" style="display: none;">
													<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;">*</Span>Line1</label>
														<div class="col-sm-6">
															<input id="remote_line1" type="text" minlength="2"
																maxlength="80" required title="Enter address"
																placeholder="Employee Address" name="remote_line1"
																class="form-control">
														</div>
													</div>
													<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;">*</Span>City</label>
														<div class="col-sm-6">
															<input id="remote_city" type="text" minlength="2"
																maxlength="40" required
																title="only Characters are allowed" placeholder="City"
																name="remote_city" class="form-control">
														</div>
														<!--pattern="^[a-zA-Z\s]+$" " -->
													</div>
													<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;">*</Span>Zip Code</label>
														<div class="col-sm-6">
															<input id="remote_zipcode" type="text" required
																title="only alphabets are allowed" pattern="[0-9]{5}"
																minlength="5" maxlength="5" placeholder="Zip Code"
																name="remote_zipcode" class="form-control">
														</div>
														<!-- pattern="^[a-zA-Z\s]+$" -->
													</div>
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
												<div id="remoteAddress1" style="display: none;">
													<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;"></Span>Line2</label>
														<div class="col-sm-6">
															<input id="remote_line2" type="text"
																pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*" minlength="2"
																maxlength="80" title="only alpha numerics are allowed"
																placeholder="line2" name="remote_line2"
																class="form-control">
														</div>
														<!-- pattern="^[a-zA-Z\s]+$" -->
													</div>
													<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;">*</Span>State</label>
														<div class="col-sm-6">
															<input id="remote_state" type="text" minlength="2"
																maxlength="25" title="only Characters are allowed"
																autocomplete="off" placeholder="State"
																name="remote_state" class="form-control" required>
														</div>
														<!-- pattern="^[a-zA-Z\s]+$" -->
													</div>
													<div class="form-group row">
												    <label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Metro Politan Area</label>
												    <div class="col-sm-6">
													  <input id="uremote_metro" type="text"  minlength="2" maxlength="25"
													    title="only alphabets are allowed" 
													    autocomplete="off" placeholder="Metro Politan Area" name="uremote_metro" class="form-control">
												     </div>
											        </div>
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>County</label>
													<div class="col-sm-6">
														<input id="remote_county" type="text" minlength="4"
															maxlength="20" title="only alphabets are allowed"
															placeholder="County" name="remote_county"
															class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>SOC code</label>
													<div class="col-sm-6">
														<!-- <input id="remote_soc_code" type="text" minlength="7"
															maxlength="7" title="only alphabets are allowed"
															placeholder="SOC code" name="remote_soc_code"
															class="form-control"> -->
														<select id="remote_soc_code" name="remote_soc_code"
															class="form-control">
															</select>	
													</div>
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
												<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>LCA Filing  Date</label>
														<div class="col-sm-6">
															<input type="text"  id="u_lcaPostedDate" name="u_lcaPostedDate" autocomplete="off"
																class="form-control" onkeydown="return true" placeholder="LCA Filing Date" />
														</div>
											    </div>
												<div class="form-group row">
													<label class="col-sm-3 col-form-label"><span
														style="color: red">*</span>LCA Begin Date</label>
													<div class="col-sm-6">
														<input type="text" id="u_lcaBeginDate"
															name="u_lcaBeginDate" class="form-control" autocomplete="off"
															onkeydown="return true" placeholder="LCA Begin Date" />
													</div>
												</div>
												
											</div>
											<div class="col-md-6 col-sm-12">
											<div class="form-group row">
													<label class="col-sm-3 col-form-label"><span
														style="color: red">*</span>Wage Rate</label>
													<div class="col-sm-4">
														<input type="text" id="u_wageRate" name="u_wageRate"
															class="form-control" placeholder="Wage Rate" minlength="2" maxlength="10"
															 title="please enter valid format as ex: 12.00 or 12"
											 				 onkeypress="javascript:return isNumber(event)"/>
													</div>
													<div class="col-sm-2">
														<select id="uwr_option" name="uwr_option" class="form-control">
													 			<option value="">Select Option</option>
															 	<option value="Per/Hour">Per/Hour</option>
															 	<option value="Per/Year">Per/Year</option>
													 		</select>
													</div>
												</div>
											   
												<div class="form-group row">
													<label class="col-sm-3 col-form-label"><span
														style="color: red">*</span>LCA End Date</label>
													<div class="col-sm-6">
														<input type="text" id="u_lcaEndDate" name="u_lcaEndDate"
															class="form-control" onkeydown="return true"
															placeholder="LCA End Date" autocomplete="off"/>
													</div>
												</div>
												
											</div>

											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label">To
													get Counties</label>
												<div class="col-sm-3">
													<span><a href="https://www.getzips.com/zip.htm"
														target="_blank" style="color: blue;">https://www.getzips.com/zip.htm</a></span>
												</div>
												<label for="inputPassword" class="col-sm-0 control-label">To
													get SOC</label>
												<div class="col-sm-3">
													<span><a href="https://www.flcdatacenter.com/"
														target="_blank" style="color: blue;">https://www.flcdatacenter.com/</a></span><br>
													<br>
												</div>
											</div>
											<div class="form-group" id="OtherLocationBtnDiv"></div>
											
											<div id="uaddOtherLocation" class="form-group" style="display: none;">
											<h5><b>LCA Location Details</b></h5>
											<input type="hidden" id="ulcaotherloc_addrid" name="ulcaotherloc_addrid[]" >
											<div class="row" id="uaddOtherLocationDiv">
											<div class="col-md-6 col-sm-12">
												<!-- <div id="init_remoteAddress" style="display: none;"> -->
													<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												    <div class="col-sm-6">
													    <input id="ulca_othr_line1" type="text"  minlength="2" maxlength="80" 
													      autocomplete="off" placeholder="Enter Line1" name="ulca_othr_line1[]" class="form-control"  required>
												      </div>
												    <!--   <div class="col-xs-4">
													<button type="button" class="btn btn-danger removeButton removeButtonloc">
														<i class="fa fa-minus"></i>
													</button>
												    </div> -->
											      </div> 
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>City</label>
													<div class="col-sm-6">
														<input id="ulca_othr_city" type="text" minlength="2"
															maxlength="25" title="only Characters are allowed"
															autocomplete="off" placeholder="City" name="ulca_othr_city[]"
															class="form-control" required>
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Zip Code</label>
													<div class="col-sm-6">
														<input id="ulca_othr_zipcode" type="text" pattern="[0-9]{5}"
															minlength="5" maxlength="5"
															title="only digits are allowed" autocomplete="off"
															placeholder="Zip Code" name="ulca_othr_zipcode[]"
															class="form-control" required>
													</div>
												</div>
											<!-- </div> -->
											</div>
											<div class="col-md-6 col-sm-12">
												<!-- <div id="init_remoteAddress1" style="display: none;"> -->
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Line2</label>
													<div class="col-sm-6">
														<input id="ulca_othr_line2" type="text"
															pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*" minlength="2"
															maxlength="80" title="only alpha numerics are allowed"
															placeholder="Enter Line2" autocomplete="off"
															name="ulca_othr_line2[]" id="ulca_othr_line2" class="form-control">
													</div>
												</div> 
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>State</label>
													<div class="col-sm-6">
														<input id="ulca_othr_state" type="text" minlength="2"
															maxlength="25" title="only Characters are allowed"
															autocomplete="off" placeholder="State"
															name="ulca_othr_state[]" class="form-control" required>
													</div>
												</div>
												<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;">*</Span>Metro Politan Area</label>
														<div class="col-sm-6">
															<input id="ulca_othr_remote_metro" type="text" minlength="2"
																maxlength="25" title="only Characters are allowed"
																autocomplete="off" placeholder="Metro Politan Area"
																name="ulca_othr_remote_metro[]" class="form-control" required>
														</div>
													</div>
												<!-- </div> -->
											</div>
											</div>
											</div>
											
										</div>
									</div>

									<div class="text-center ml-5" id="lcaqUdiv">
										<button type="button" class="btn btn-info btn-sm"
											id="lcaqbtnUpdate">Update</button>
										<button type="button" class="btn btn-info btn-sm btn-colorb"
											id="lcaqbtnCancel" data-dismiss="modal">Cancel</button>	
									</div>
								</form>
							</div>


							
						</div>
					</div>
				</div>
			
			<div class="modal fade" id="viewlcadetailsmodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
				<div class="modal-dialog modal-lg" style="max-width: 80%"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b>LCA Questionnaire Details</b>
								</h5>
							</div>

							<div class="modal-body">
								<form action="/" enctype="multipart/form-data"
									id="vlupdateLCAQDetailsForm" autocomplete="off">

									


									<!-- <div class="form-group row">
										<label class="col-sm-4 col-form-label"><span
											style="color: red"></span>LCA/Ref.no</label>
										<div class="col-sm-4">
											<select name="lcaqueRefNoList" autoComplete="off"
												class="form-control text-left" id="lcaqueRefNoList" required>
											</select>
										</div>
									</div> -->
									<div id="lcaqueDiv" >
										<div class="row">
											<div class="col-md-6 col-sm-12">

												<div class="form-group row">
													<label class="col-sm-3 col-form-label"><span
														style="color: red"></span>End Client Name</label>
													<div class="col-sm-6">
														<input id="vlendClientName" name="endClientName"
															class="form-control" />
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-3 col-form-label"><span
														style="color: red"></span>Organization Name</label>
													<div class="col-sm-6">
														<input id="vlorganization" name="organization"
															class="form-control" readonly />
													</div>
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Education</label>
													<div class="col-sm-6">
														<input id="vleducation" type="text" minlength="2"
															maxlength="100" title="only alphabets are allowed"
															placeholder="Education" name="education"
															class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Reason for filing LCA</label>
													<div class="col-sm-6">
														<select id="vlreason_lca" name="reason_lca"
															class="form-control">
															<option value="">Select Reason</option>
															<option value="H1B Extension">H1B Extension</option>
															<option value="H1B Transfer">H1B Transfer</option>
															<option value="H1B CAP">H1B CAP</option>
															<option value="H1B Amendment">H1B Amendment</option>
															 <option value="H1B Amendment+Extension">H1B Amendment+Extension</option>
															<!--  <option value="H1B Amendment">H1B Amendment</option> -->
														</select>
													</div>
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Candidate Job Title</label>
													<div class="col-sm-6">
														<input id="vlcand_job_title" type="text" minlength="2"
															maxlength="100" title="only alphabets are allowed"
															placeholder="Candidate Job Title" name="cand_job_title"
															class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
												<h5>
													<b>End Client Address</b>
												</h5>
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;"></Span>Line1</label>
													<div class="col-sm-6">
														<input id="vlendline1" type="text" minlength="2"
															maxlength="80" required title="Enter address"
															placeholder="Employee Address" name="endline1"
															class="form-control">
													</div>
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;"></Span>Line2</label>
													<div class="col-sm-6">
														<input id="vlendline2" type="text"
															pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*" minlength="2"
															maxlength="80" title="only alpha numerics are allowed"
															placeholder="line2" name="endline2" class="form-control">
													</div>
													<!-- pattern="^[a-zA-Z\s]+$" -->
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;"></Span>City</label>
													<div class="col-sm-6">
														<input id="vlendcity" type="text" minlength="2"
															maxlength="40" required
															title="only Characters are allowed" placeholder="City"
															name="endcity" class="form-control">
													</div>
													<!--pattern="^[a-zA-Z\s]+$" " -->
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;"></Span>State</label>
													<div class="col-sm-6">
														<input id="vlendstate" type="text" minlength="2"
															maxlength="25" title="only Characters are allowed"
															autocomplete="off" placeholder="State" name="endstate"
															class="form-control" required>
													</div>
													<!-- pattern="^[a-zA-Z\s]+$" -->
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;"></Span>Zip Code</label>
													<div class="col-sm-6">
														<input id="vlendzipcode" type="text" required
															title="only alphabets are allowed" pattern="[0-9]{5}"
															minlength="5" maxlength="5" placeholder="Zip Code"
															name="endzipcode" class="form-control">
													</div>
													<!-- pattern="^[a-zA-Z\s]+$" -->
												</div>
											</div>

											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span
													style="color: red;"></Span>Are you working/supporting at :</label>
												<div class="col-sm-5">
													<label class="control-label">Remote/Home</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
														type="radio" name="workinglocation" id="vlworklocation1"
														value="Remote/Home" style="width: 20px; height: 20px;"
														checked />&nbsp;&nbsp;&nbsp;&nbsp;<label>End
														client location</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
														type="radio" name="workinglocation" value="EndClient"
														id="vlworklocation2" style="width: 20px; height: 20px;" />
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
												<div id="remoteAddress" style="display: none;">
													<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;"></Span>Line1</label>
														<div class="col-sm-6">
															<input id="vlremote_line1" type="text" minlength="2"
																maxlength="80" required title="Enter address"
																placeholder="Employee Address" name="remote_line1"
																class="form-control">
														</div>
													</div>
													<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;"></Span>City</label>
														<div class="col-sm-6">
															<input id="vlremote_city" type="text" minlength="2"
																maxlength="40" required
																title="only Characters are allowed" placeholder="City"
																name="remote_city" class="form-control">
														</div>
														<!--pattern="^[a-zA-Z\s]+$" " -->
													</div>
													<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;"></Span>Zip Code</label>
														<div class="col-sm-6">
															<input id="vlremote_zipcode" type="text" required
																title="only alphabets are allowed" pattern="[0-9]{5}"
																minlength="5" maxlength="5" placeholder="Zip Code"
																name="remote_zipcode" class="form-control">
														</div>
														<!-- pattern="^[a-zA-Z\s]+$" -->
													</div>
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
												<div id="remoteAddress1" style="display: none;">
													<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;"></Span>Line2</label>
														<div class="col-sm-6">
															<input id="vlremote_line2" type="text"
																pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*" minlength="2"
																maxlength="80" title="only alpha numerics are allowed"
																placeholder="line2" name="remote_line2"
																class="form-control">
														</div>
														<!-- pattern="^[a-zA-Z\s]+$" -->
													</div>
													<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;"></Span>State</label>
														<div class="col-sm-6">
															<input id="vlremote_state" type="text" minlength="2"
																maxlength="25" title="only Characters are allowed"
																autocomplete="off" placeholder="State"
																name="remote_state" class="form-control" required>
														</div>
														<!-- pattern="^[a-zA-Z\s]+$" -->
													</div>
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>County</label>
													<div class="col-sm-6">
														<input id="vlremote_county" type="text" minlength="4"
															maxlength="20" title="only alphabets are allowed"
															placeholder="County" name="remote_county"
															class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>SOC code</label>
													<div class="col-sm-6">
														<!-- <input id="remote_soc_code" type="text" minlength="7"
															maxlength="7" title="only alphabets are allowed"
															placeholder="SOC code" name="remote_soc_code"
															class="form-control"> -->
														<select id="vlremote_soc_code" name="remote_soc_code"
															class="form-control">
															</select>	
													</div>
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
												<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red"></span>LCA Filing  Date</label>
														<div class="col-sm-6">
															<input type="text"  id="vlu_lcaPostedDate" name="u_lcaPostedDate" autocomplete="off"
																class="form-control" onkeydown="return true" placeholder="LCA Filing Date" />
														</div>
											    </div>
												<div class="form-group row">
													<label class="col-sm-3 col-form-label"><span
														style="color: red"></span>LCA Begin Date</label>
													<div class="col-sm-6">
														<input type="text" id="vlu_lcaBeginDate"
															name="u_lcaBeginDate" class="form-control" autocomplete="off"
															onkeydown="return true" placeholder="LCA Begin Date" />
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-3 col-form-label"><span
														style="color: red"></span>Wage Rate</label>
													<div class="col-sm-4">
														<input type="text" id="vlu_wageRate" name="u_wageRate"
															class="form-control" placeholder="Wage Rate" minlength="2" maxlength="10"
															 title="please enter valid format as ex: 12.00 or 12"
											 				 onkeypress="javascript:return isNumber(event)"//>
													</div>
													<div class="col-sm-2" >
														<select id="vluwr_option" name="uwr_option" class="form-control" readonly>
													 			<option value="">Select Option</option>
															 	<option value="Per/Hour">Per/Hour</option>
															 	<option value="Per/Year">Per/Year</option>
													 		</select>
													</div>
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Metro Politan Area</label>
												<div class="col-sm-6">
													<input id="vlu_metro_politan_area" type="text"  minlength="2" maxlength="25"
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="Metro Politan Area" name="u_metro_politan_area" class="form-control">
												</div>
											    </div>
												<div class="form-group row">
													<label class="col-sm-3 col-form-label"><span
														style="color: red"></span>LCA End Date</label>
													<div class="col-sm-6">
														<input type="text" id="vlu_lcaEndDate" name="u_lcaEndDate"
															class="form-control" onkeydown="return true" autocomplete="off"
															placeholder="LCA End Date" />
													</div>
												</div>
												
											</div>

											<!-- <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label">To
													get Counties</label>
												<div class="col-sm-3">
													<span><a href="https://www.getzips.com/zip.htm"
														target="_blank" style="color: blue;">https://www.getzips.com/zip.htm</a></span>
												</div>
												<label for="inputPassword" class="col-sm-0 control-label">To
													get SOC</label>
												<div class="col-sm-3">
													<span><a href="https://www.flcdatacenter.com/"
														target="_blank" style="color: blue;">https://www.flcdatacenter.com/</a></span><br>
													<br>
												</div>
											</div> -->
											<div class="form-group" id="vOtherLocationBtnDiv"></div>
										</div>
									</div>

									
								</form>
							</div>

						</div>
					</div>
				</div>
				<div class="modal fade" id="lcahistorymodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width: 85%"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b>LCA History Details</b>
								</h5>
							</div>

							<div class="modal-body">
								<div class="row">
									<div class="col">
										<!-- 	 <div class="text-center ml-5">
												 <div class="form-group row">
														<label class="col-sm-4 col-form-label"><span
															style="color: red"></span>Select LCA/Ref.no</label>
														<div class="col-sm-3">
														<select name="lcaList" autoComplete="off"
															class="form-control text-left" id="lcaList">
														</select>
														</div>
												</div>
										</div> color=red-->

										<center>
											<font><strong>Employee Name :</strong></font><b>&nbsp;&nbsp;<span
												id="empname" style="color:blue;"></span></b><font><strong>&nbsp;End
													Client Name :</strong></font><b>&nbsp;&nbsp;<span id="clientname"  style="color:blue;"></span></b>
											<font><strong>&nbsp;Job Title :</strong></font><b>&nbsp;&nbsp;<span
												id="h_jobtitle" style="color:blue;"></span></b>
										</center>
										<div class="row">
											<div class="col-lg-12"
												style="max-width: 1250px; overflow-x: auto; white-space: nowrap;">
												<table id="lcadatatable"
													class="table table-hover table-bordered"
													style="text-align: center;">
													<thead>
														<tr>

															<th style="text-align: center">LCA#</th>
															<th style="text-align: center">Document Sub Type</th>
															<th style="text-align: center">Start Date</th>
															<th style="text-align: center">End Date</th>
															<!-- <th style="text-align: center">End Client Name</th>
														<th style="text-align: center">Job Title</th> -->
															<th style="text-align: center">File Name</th>
														<!-- 	<th style="text-align: center">Action</th> -->
														</tr>
													</thead>
													<tbody id="lcalistatble">

													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="modal fade" id="uploadlcadetailsmodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width: 80%;"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b>Upload Document Details</b>
								</h5>
							</div>

							<div class="modal-body">
								<form action="/" enctype="multipart/form-data"
									id="addLCADetailsForm" autocomplete="off">
									<input type="hidden" id="lcacandidateId" name="lcacandidateId" />
									<input type="hidden" id="lcapayrateId" name="lcapayrateId" />
									<input type="hidden" id="lcaclientId" name="lcaclientId" /> <input
										type="hidden" id="subdocname" name="subdocname" />
									<div class="row" id="uploadLCA">

										<div class="col-md-6 col-sm-12">
											<div class="form-group row" style="display: none;">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Document Type</label>
												<div class="col-sm-6">
													<select name="documenttype" autoComplete="off"
														class="form-control text-left" id="documenttype" required>
													</select>
												</div>
											</div>

											<input type="hidden" id="documenttypeId"
												name="documenttypeId" />
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color:red">*</span>LCA/Ref.no</label>
												<div class="col-sm-6">
													<select name="lcaRefNoList" autoComplete="off"
														class="form-control text-left" id="lcaRefNoList" required>
													</select>
												</div>
											</div>
											<input type="hidden" id="docCount" name="docCount" />
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color:red">*</span>Document Name </label>
												<div class="col-sm-6">
													<input type="text" id="lcaDocName" name="lcaDocName"
														class="form-control" placeholder="Document Name" /> <span
														id="lcaDocInput" style="color:red;"></span>
												</div>
											</div>
											<div class="form-group row" id="std">
												<label class="col-sm-3 col-form-label"><span
													style="color:red"></span>Start Date</label>
												<div class="col-sm-6">
													<input type="text" id="startdate" name="startdate"
														placeholder="Start Date" class="form-control"
														onkeydown="return true" autocomplete="off"/>
												</div>
											</div>

											<center>
												<b><span id="lcaspan" style="color: red;"></span></b>
											</center>
											<br>
											<div class="form-group row" id="lcadisp">
												<label class="col-sm-3 col-form-label"><span
													style="color: red">*</span>LCA Number</label>
												<div class="col-sm-6">
													<input type="text" id="lcaNumber" name="lcaNumber"
														minlength="18" maxlength="18" class="form-control"
														placeholder="LCA Number e.g : I-123-12345-123456" /> <span
														id="checklca" style="color: red;" style=" width: 300%;"></span>
												</div>
											</div>

										</div>
										<div class="col-md-6 col-sm-12">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Document Sub Type</label>
												<div class="col-sm-6">
													<select name="documentsubtype" autoComplete="off"
														class="form-control text-left" id="documentsubtype">
													</select>
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red">*</span>Upload Document </label>
												<div class="col-sm-6">
													<input type="file" id="lcaDocument" name="lcaDocument"
														class="form-control"
														onchange="ValidateSizeImmigration(this)" />
												</div>
											</div>

											<div class="form-group row" id="end">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>End Date</label>
												<div class="col-sm-6">
													<input type="text" id="enddate" name="enddate"
														placeholder="End Date" class="form-control"
														onkeydown="return true" autocomplete="off"/>
												</div>
											</div>
										</div>
									</div>
									<!-- <div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red"></span>LCA upload</label>
														
													</div> -->

									<div class="row" id="approvedlca">
										<div class="col-md-6 col-sm-12">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red">*</span>Case Type</label>
												<div class="col-sm-6">
													<input type="text" id="caseType" name="caseType"
														class="form-control" placeholder="Case Type" />

												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>LCA Begin Date</label>
												<div class="col-sm-6">
													<input type="text" id="lcaBeginDate" name="lcaBeginDate"
														class="form-control" onkeydown="return true"
														placeholder="LCA Begin Date" readonly/>
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red">*</span>LCA Certified Date</label>
												<div class="col-sm-6">
													<input type="text" id="lcaCertifiedDate"
														name="lcaCertifiedDate" class="form-control" autocomplete="off"
														onkeydown="return true" placeholder="LCA Certified Date" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red">*</span>SOC</label>
												<div class="col-sm-6">
													<input type="text" id="soc_code" name="soc_code"
														placeholder="SOC" class="form-control" readonly/>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red">*</span>Prevailing Wage</label>
												<div class="col-sm-6">
													<input type="text" id="prevailingWage"
														name="prevailingWage" class="form-control"
														placeholder="Prevailing Wage" />
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red">*</span>County</label>
												<div class="col-sm-6">
													<input type="text" id="lcacounty" name="lcacounty"
														class="form-control" placeholder="County" readonly/>
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>End Client Address</label>
												<div class="col-sm-6">
													<input type="text" id="location1" name="location1"
														class="form-control" readonly />
												</div>
											</div>

										</div>
										<div class="col-md-6 col-sm-12">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Employee Name</label>
												<div class="col-sm-6">
													<input type="text" id="lcaCandName" name="lcaCandName"
														class="form-control" readonly/>
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>LCA Submitted Date</label>
												<div class="col-sm-6">
													<input type="text" id="lcaSubDate" name="lcaSubDate"
														class="form-control" onkeydown="return true"
														placeholder="LCA Submitted Date" readonly/>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>LCA End Date</label>
												<div class="col-sm-6">
													<input type="text" id="lcaEndDate" name="lcaEndDate"
														class="form-control" onkeydown="return true"
														placeholder="LCA End Date" readonly/>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>JOB Title</label>
												<div class="col-sm-6">
													<input type="text" id="job_title" name="job_title"
														class="form-control" placeholder="JOB Title" readonly/>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Wage Rate</label>
												<div class="col-sm-6">
													<input type="text" id="wageRate" name="wageRate"
														class="form-control" placeholder="Wage Rate" readonly/>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red">*</span>Wage Level</label>
												<div class="col-sm-6">
													<select id="wageLevel" name="wageLevel"
														class="form-control">
														<option value="">Select Wage Level</option>
														<option value="level1">level 1</option>
														<option value="level2">level 2</option>
														<option value="level3">level 3</option>
														<option value="level4">level 4</option>
													</select>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span>Remote/Home Address</label>
												<div class="col-sm-6">
													<input type="text" id="location2" name="location2"
														class="form-control" readonly />
												</div>
											</div>
											<!-- <div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red"></span>Location 3</label>
														<div class="col-sm-6">
															<input id="soc" name="soc" class="form-control" />
														</div>
													</div> -->
										</div>
									</div>


									<div class="text-center ml-5">
										<button type="button" class="btn btn-info btn-sm"
											id="lcabtnSubmit">Save</button>
										<button type="button" data-dismiss="modal"
											class="btn btn-info btn-sm" id="btn-colorb">Close</button>
									</div>
								</form>
								<br />
								<br />
							</div>
						</div>
					</div>
				</div>

				<div class="modal fade" id="amendmentmodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width: 50%"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b>Add Amendment Details</b>
								</h5>
							</div>
							<div class="modal-body">
								<form action="/" enctype="multipart/form-data"
									id="amendmentForm">

									<div class="row">
										<input type="hidden" id="amcandidateid" name="candidateid">
										<input type="hidden" id="amclientid" name="clientid">
										<div class="col-md-12 col-sm-12">
											<div class="form-group row">
												<label class="col-sm-6 col-form-label"><span
													style="color: red"></span>Duties Change</label>
												<!-- <div class="col-sm-6"> -->
												<input type="checkbox" id="duties" name="amendmentchange"
													value="duties" style="width: 20px; height: 20px;" />&nbsp;&nbsp;&nbsp;&nbsp;
												<span id="spanDuties" style="color: blue;"></span>
												<!-- </div> -->
											</div>
											<div class="form-group row">
												<label class="col-sm-6 col-form-label">Rate Change</label>
												<!-- <div class="col-sm-6"> -->
												<input type="checkbox" id="rate" name="amendmentchange"
													value="rate" style="width: 20px; height: 20px;" />&nbsp;&nbsp;&nbsp;&nbsp;
												<span id="spanRate" style="color: blue;"></span>

												<!-- </div> -->
											</div>
											<div class="form-group row">
												<label class="col-sm-6 col-form-label"><span
													style="color: red"></span>Role Change</label>
												<!-- <div class="col-sm-6"> -->
												<input type="checkbox" id="role" name="amendmentchange"
													value="role" style="width: 20px; height: 20px;" />
												<!-- </div> -->
											</div>

											<div class="form-group row">
												<label class="col-sm-6 col-form-label"><span
													style="color: red"></span>MSA Change</label>
												<!-- <div class="col-sm-6"> -->
												<input type="checkbox" id="msa" value="msa"
													name="amendmentchange" style="width: 20px; height: 20px;" />&nbsp;&nbsp;&nbsp;&nbsp;
												<span id="spanMsa" style="color: blue;"></span>
												<!-- </div> -->
											</div>

											<div class="form-group row">
												<label class="col-sm-6 col-form-label"><span
													style="color: red"></span>None</label>
												<!-- <div class="col-sm-6"> -->
												<input type="checkbox" id="None" value="None"
													name="amendmentchange" style="width: 20px; height: 20px;" />
												<!-- </div> -->
												<center>
													<br>
													<span id="spanError" style="color: red;"></span>
												</center>
											</div>

											<div class="text-center ml-5">
												<button type="button" class="btn btn-info btn-sm"
													id="saveid">Save</button>

											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<center>
					<div class="modal fade" id="EditLCADocumentModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true" style="top: 100px;">
						<div class="modal-dialog modal-sm" style="max-width: 50%"
							role="document">
							<div class="modal-content">
								<div class="modal-header" style="padding: .5rem;">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<center>
										<h5 class="modal-title" id="exampleModalLabel"
											style="font-size: 15px">
											<b><span id="editlcaDoc"></span></b>
										</h5>
									</center>
								</div>
								<form class='form form-horizontal validate-form' action="/"
									method="post" id="edlcadocsForm" style='margin-bottom: 0;'
									enctype="multipart/form-data">
									<input type="hidden" id="lcadocumentid" name="lcadocumentid">
									<input type="hidden" id="lcaedcandidateid"
										name="lcaedcandidateid">
									<!-- 	<input type="hidden" id="eddocName" name="eddocName">
						<input type="hidden" id="edcandidateid" name="edcandidateid">
						<input type="hidden" id="edchklistId" name="edchklistId">  -->
									<div class="modal-body">
										<div class="form-group row">
											<label class="col-lg-3 control-label"><Span
												style="color: red;"></Span>Upload File :</label>
											<div class="col-sm-4">
												<input type="text" id="edinputval" name="edinputval"
													placeholder="Document Name" class="form-control" required />
											</div>
											<div class="col-lg-4">
												<input type="file" id="lcaeditFile" name="lcaeditFile"
													class="form-control text-left"
													onchange="ValidateFile(this)" required /> <span
													id="lcaedfileName" style="color: blue;"></span>
											</div>
										</div>

										<div class="form-group row" id="edstd">
											<label class="col-lg-3 control-label"></label>
											<div class="col-sm-4">
												<input type="text" id="edstartdate" name="edstartdate"
													placeholder="Start Date" class="form-control"
													onkeydown="return true" autocomplete="off"/>
											</div>
											<div class="col-sm-4">
												<input type="text" id="edenddate" name="edenddate"
													placeholder="End Date" class="form-control"
													onkeydown="return true" autocomplete="off"/>
											</div>
										</div>


									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary btn-sm"
											data-dismiss="modal">Close</button>
										<button type="button" id="edlcadocsaveid"
											class="btn btn-primary btn-sm">Save changes</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</center>
				<center>
					<div class="modal fade" id="DocumentHistoryModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true" style="top: 90px;">
						<div class="modal-dialog modal-sm" style="max-width: 60%"
							role="document">
							<div class="modal-content">
								<div class="modal-header" style="padding: .5rem;">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<center>
										<h5 class="modal-title" id="exampleModalLabel"
											style="font-size: 15px">
											<b><span id="h1bHistory"></span></b>
										</h5>
									</center>
								</div>
								<div class="modal-body">
									<table id="h1bdochisorytable"
										class="table table-hover table-bordered"
										style="text-align: center;">
										<thead>
											<tr>
												<th>Id</th>
												<th>File Name</th>
												<th>Doc Type</th>
												<th>Doc Sub Stype</th>
												<th>Doc Input</th>
												<th>Submitted On</th>
												<th>Submitted By</th>
												<!-- <th>Status</th>	 -->
											</tr>
										</thead>
										<tbody id="consulatntBody">

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</center>
				<div class="modal fade" id="lcahistorybyidmodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width: 60%"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b><span id="typeid"></span> History</b>
								</h5>
							</div>

							<div class="modal-body">
								<div class="row">
									<div class="col">

										<center>
											<font color=red><strong>Employee Name :</strong></font><b>&nbsp;&nbsp;<span
												id="hidempname"></span></b> <font color=red><strong>End
													Client Name :</strong></font><b>&nbsp;&nbsp;<span id="hidclientname"></span></b>
											<font color=red><strong>Job Title :</strong></font><b>&nbsp;&nbsp;<span
												id="hid_jobtitle"></span></b>
										</center>
										<div class="row">
											<div class="col-lg-12"
												style="max-width: 1250px; overflow-x: auto; white-space: nowrap;">
												<table id="hisotybyidtable"
													class="table table-hover table-bordered"
													style="text-align: center;">
													<thead>
														<tr>
															<th style="text-align: center">Id</th>
															<th style="text-align: center">LCA#</th>
															<th style="text-align: center">Document Sub Type</th>
															<th style="text-align: center">Start Date</th>
															<th style="text-align: center">End Date</th>
															<th style="text-align: center">File Name</th>
														</tr>
													</thead>
													<tbody>

													</tbody>
												</table>
											</div>
										</div>
										<!-- </div>
								</div> -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				

				
 
				

 <!--LCA module related all popups End -->
				
				
				
				<!--H1B module related all popups starts -->
							<center>
		<div class="modal fade" id="CandDocVerifierStautsModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="top:10px;">
			<div class="modal-dialog modal-lg"   style="max-width:85%;" role="document">
				<div class="modal-content" style="height:100%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b><span id="h1bHistory1"></span></b>
							</h5>
						</center>
					</div>
						<div class="modal-body">
							<div class="col-md-12">	
							<form action="/"id="saveimmidocumentbydocIdForm"
									enctype="multipart/form-data" method="post">
									<input type="hidden" id="OtherBtnCount" nam="OtherBtnCount">
									<input type="hidden" id="subdoclength" name="subdoclength">
									<input type="hidden" id="initiateid1" name="initiateid">
									<input type="hidden" id="candidateId2" name="candidateId2">
									<input type="hidden" id="profile_id" name="profile_id">
									<input type="hidden" id="benf_type" name="benf_type"> 
									<input type="hidden" id="docsubdoclength" name="docsubdoclength">
									<input type="hidden" id="repodocsubdoclength" name="repodocsubdoclength">
									<input type="hidden" id="docid" name="docid">
									<input type="hidden" id="is_same" name="is_same">
									<input type="hidden" id="profile_name" name="profile_name">
										<input type="hidden" id="questionnarie_id" name="questionnarie_id">
								<%-- 	<div class='form-control' style='display: contents;'>
										<center>
											<label style='font-size: 20px;'>Document Name :</label><span
												id="catname" style='color: red; font-size: 20px;'></span>
										</center>
										<br>
									</div> --%>
									
									<div class="form-group row" style="display: none"
										id="subdoclistdiv">
										<label class="col-sm-3 col-form-label"><span
											style="color: red"></span>Document Type</label>
										<div class="col-sm-6">
											<select name="doc_subtype" autoComplete="off"
												class="form-control text-left" id="doc_subtype"
												multiple="multiple" style="width: 100%;">
											</select>
										</div>
									</div>

									<div id="listAbtnDiv"></div>

									<div id="OtherBtnDiv"></div>
									
									<div id="pendingdiv"></div>
									
									<!-- <div id="inputdivid"></div> -->
									
									 <div id="testdivtable" style="display:none;">
									<table id="divtable"
									class="table table-striped text-center " border="1"  style="width: 45%;" >
									<thead style="background-color:#728FCE;color:white;font-size:16px;">
										<tr>
									    	<th>Document Name</th>
											<th>File name</th>
										</tr>
									</thead>

									<tbody id="inputdivid">

									</tbody>
								</table>
								
									</div> 
								 	
                                  <!--      <button type="button"  id="repo" 
											style="margin-left: 0px; margin-right: auto; display: block; margin-top: 1%; margin-bottom: 1%; padding: 2px; border-radius: 12px; background-color: #205081;"
											class="btn btn-primary btn-sm" data-toggle='modal'  data-target='#repomodal1' >
											<b><span id="r_id"></span> Repository</b>
										</button>  -->
										
										  <button type="button"  id="repo" 
											style="margin-left: 0px; margin-right: auto; display: block; margin-top: 1%; margin-bottom: 1%; padding: 2px; border-radius: 12px; background-color: #205081;"
											class="btn btn-primary btn-sm" >
											<b><span id="r_id"></span> Repository</b>
										</button> 
										
									<br>
									<div id="edocumentsTable1_wrapper" style="display: none;">
										<table id="edocumentsTable1"
											class="table table-striped text-center ">
											<thead>
												<tr>
													<th>Document Type</th>
													<th>File name</th>
													<th>Status</th>
													<th>Edit</th>
												</tr>
											</thead>
											<tbody id="edit1"></tbody>
										</table>
									</div>

									<div class="text-center ml-5">
										<input type='button' id='savesubmitid'
											class='btn btn-primary btn-sm' value='Save'>
									</div>
								</form>
					   		</div>
					   		<table id="immiCandDoctable" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>Beneficiary Name</th>
								<th>File Name</th>
							<!-- 	<th>Doc Type</th>	 -->							
								<th><span id="dst"> </span></th>
								<!-- <th>Doc Input</th> -->
								<th>Submitted On</th>
								<th>Submitted By</th>
								<!-- <th>Status</th>	 -->		
								</tr>
								</thead>
								<tbody id="consulatntBody">
								
								</tbody>
							</table>
							
								
							
						<div class="col-md-12">	
						<form class='form form-horizontal validate-form'
						action="/" id="updateCandDocVerifierStatusForm" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="h1binitiateid1" name="h1binitiateid">
						<input type="hidden" id="h1bcandidateId" name="h1bcandidateId">
						<input type="hidden" id="h1bdoctypeid" name="h1bdoctypeid">
						<input type="hidden" id="h1bprofile_id" name="h1bprofile_id">
						<input type="hidden" id="h1bbenf_type" name="h1bbenf_type">
						<input type="hidden" id="h1bquestionnarie_id" name="h1bquestionnarie_id">
						 
						
						<div class="form-group row">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Select Status</label>
									<div class="col-sm-5">
												<select id="candocapprstatus" name="candocapprstatus" class="form-control">
												<option value="">-Select Status-</option>
												<option value="Approved" >Approve</option>
												<option value="Rejected" >Reject</option> 
												</select>
											</div>
								</div> 
					       <div class="form-group row">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Comments</label>
									<div class="col-sm-5">
										<textarea type="text"  id="h1bcandicomments" name="h1bcandicomments" rows="4" cols="50" minlength="2"
										 placeholder="Enter Comment"  class="form-control" required></textarea>
									</div>
									<div class="col-sm-0" id="h1bchdivId" style="display:none;">
									<button type="button" class="btn btn-primary btn-sm" style="letter-spacing: 1px; background-color: #15aabf; color: white;" id="h1bchistoryId" data-toggle="modal" ><i class="fa fa-history"></i></button>
									</div>
						   </div> 
							<center>
								<div class="text-center ml-3">
								<button type="button" id="cdverifierBtnId" class="btn btn-primary btn-sm">Submit</button>
								<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
								</div>
							</center>
					       </form>
					   </div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="repomodal1" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true"
						style="top: 60px;">
						<div class="modal-dialog modal-lg" style="max-width: 60%;"
							role="document">
							<div class="modal-content" style="height: 100%;">
								<div class="modal-header" style="padding: .5rem;">
									<button class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>

									<center>
										<h5 class="modal-title" id="exampleModalLabel"
											style="font-size: 15px">
											<b><span id="r_id1"></span> Repository</b>
										</h5>
									</center>
								</div>
								<div class="modal-body">
									<div>
										<div class="content">
										<form action="/" method="post" id=""
										enctype="multipart/form-data" id="">
										<div id="repodiv"></div>
											<table id="edurepotable"
												class="table table-hover table-bordered"
												style="text-align: center;">
												<thead>
													<tr>
													   <!--  <th>Initiation ID</th>
													    <th>Initiation Type</th> --> 
														<th>Sub Document</th>
														<th>FileName</th>
														<th>Mapping</th>
													</tr>
												</thead>
												<tbody>

												</tbody>
											</table>
									
											<center>
														<button type="button" class="btn btn-primary btn-sm" f
													id="repobtn" >Add</button>
											</center>
											</form>
										</div>
									</div>
								</div>
								
							</div>
						</div>
					</div>

				
	
</center>
	<center>
		<div class="modal fade" id="ImmiDocCommenthistoryModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 70px;">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content" style="width:100%;">
					<div class="modal-header" style="padding: .25rem;">
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
	</center>
							
							
							<%-- 	<center> --%>
		
	<%-- </center> --%>
								
							<div class="modal fade" id="ah1bDocsModal" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true" style="top:10px;">
								<div class="modal-dialog modal-lg" style="max-width:90%;"
									role="document">
									<div class="modal-content">
										<div class="modal-header" style="padding: .5rem;">
											<button class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<center><h5 class="modal-title" id="exampleModalLabel"
												style="font-size: 15px">
												<b><span id="h1bHeader"></span></b>
											</h5></center>
										</div>
										<div class="modal-body">
										<form action="/" enctype="multipart/form-data"	id="addh1bDetailsForm">
										<div class="row">
											<input type="hidden" id="ah1initiated" name="ah1initiated">
											<input type="hidden" id="ah1dccandidateid" name="ah1candidateid">
											<input type="hidden" id="ah1doctypeid" name="ah1doctypeid">
											<input type="hidden" id="ah1subdocname" name="ah1subdocname">
											<input type="hidden" id="ah1bentype" name="ah1bentype">
											<input type="hidden" id="ah1profileid" name="ah1profileid">
											<input type="hidden" id="ah1queid" name="ah1queid">
											
											
											<div class="col-md-12 col-sm-12">
													<div class="row" id="approvedh1bD">
													 <div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>Document Type</label>
														<div class="col-sm-6">
														<select name="ah1document_subtype" autoComplete="off"
															class="form-control text-left" id="ah1document_subtype">
														</select>
														</div>
													 </div>
													<div class="form-group row">
															<label for="inputPassword" class="col-sm-3 control-label"><Span
																style="color: red;">*</Span>Is this document to be
																shown to candidate?</label>
															<div class="col-sm-6">
																<label>Yes</label>&nbsp;<input type="radio"
																	name="isdocshown" id="isdocshown" value="Yes"
																	style="width: 20px; height: 20px;"required />&nbsp;<label>No</label>&nbsp;<input
																	type="radio" id="isdocshown" name="isdocshown"
																	value="No" style="width: 20px; height: 20px;" /> <br>
															</div>
													 </div>
													 <div class="form-group row" id="ah1docId">
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>Document Upload</label>
														<div class="col-sm-6">
														<input type="file" id="ah1document" name="ah1document" class="form-control" onchange="ValidateFileSize4(this)"/>
														</div>
													 </div>
												</div> 
												   <div class="row" id="approvedh1b">
												   <div class="col-md-6 col-sm-12">
													<div class="form-group row" id="h1bdisp" >
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>H-1B Number</label>
														<div class="col-sm-6" >
															<input type="text" id="h1bNumber" name="h1bNumber" minlength="16" maxlength="16"
																class="form-control" placeholder="H1B Number e.g : SRC-16-022-57890"
																tile="Please Enter H1B Number e.g : SRC-16-022-57890"/>
																<span id="checkh1bNo" style="color: red;" style=" width: 300%;"></span>
														</div>
													</div>
													<!--  SRC-16-022-57890 -->
													<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>H1B Valid From Date</label>
														<div class="col-sm-6">
															<input type="text"  id="h1bvFromDate" name="h1bvFromDate" autocomplete="off"
																class="form-control" onkeydown="return false" placeholder="H1B Valid From Date" />
														</div>
													</div>

													<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>H1B Valid To Date</label>
														<div class="col-sm-6">
															<input type="text" id="h1bvToDate" name="h1bvToDate" autocomplete="off"
															 class="form-control" onkeydown="return false" placeholder="H1B Valid To Date"/>
														</div>
													</div>
													</div>
													 <div class="col-md-6 col-sm-12">
													 <div class="form-group row" id="h1bdisp" >
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>I-94 Number</label>
														<div class="col-sm-6" >
															<input type="text" id="i94Number" name="i94Number" minlength="15" maxlength="15"
																class="form-control" placeholder="I-94 Number"/>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>I-94 Valid From Date</label>
														<div class="col-sm-6">
															<input type="text" id="i94vFromDate" name="i94vFromDate" autocomplete="off"
															 class="form-control" onkeydown="return false" placeholder="I-94 Valid From Date"/>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>I-94 Valid To Date</label>
														<div class="col-sm-6">
															<input type="text" id="i94vToDate" name="i94vToDate"  autocomplete="off"
															class="form-control" onkeydown="return false" placeholder="I-94 Valid To Date"/>
														</div>
													</div>
													</div>
													</div>
													
										 <div class='form-group row' id="rfesupadd"  style="display:none;">
                                       <label for="inputPassword" class="col-sm-3 control-label"  id="rfesupaddlbl">RFE Supporting Documents</label>
												<div class="col-xs-4">
													<button type="button" class="btn btn-success btn-sm addButton">
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                        </div>
                                      
							     				<div id="rfesuph1Documents" class="form-group" style="display:none;">
							     				<div class="row" id="approvedh1bD">
							     				 <div class="col-md-8 col-sm-12">
							     			     <div class="form-group row">
							     			         <label class="col-sm-3 col-form-label"></label>
													 <div class="col-sm-4">
														<input type="text" id="rfeh1documentInput" name="rfeh1documentInput[]"
														placeholder="Enter Document Name" class="form-control"/>
													</div>
													 <div class="col-sm-4">
														<input type="file" id="rfeh1document[]" name="rfeh1document[]" class="form-control" onchange="ValidateFileSize4(this)"/>
													</div>
													<div class="col-xs-4">
													<button type="button" class="btn btn-danger btn-sm removeButton">
														<i class="fa fa-minus"></i>
													</button>
												    </div>
												</div>
												</div>
												</div>
										     </div>
										     <div class="text-center ml-5" id="ah1bbtnSubId">
												<button type="button" class="btn btn-info btn-sm"
													id="ah1bbtnSubmit">Save</button>
											</div>
							<div id="approvedH1DocsId" style="display:none;">			     
							<table id="immiApprovedDoctable" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>Beneficiary Name</th>
								<th>File Name</th>
							<!-- 	<th>Doc Type</th>	 -->							
								<th>Doc Sub Type</th>
								<th>Doc Input</th>
								<th>Submitted On</th>
								<th>Submitted By</th>
								<th>Action</th>
								<!-- <th>Status</th>	 -->		
								</tr>
								</thead>
								<tbody id="consulatntBody">
								
								</tbody>
							</table>
							</div>
										     
											<!-- <div class="form-group row">
													<label class="col-sm-3 control-label"><b>Add Documents</b></label>
													<div class="col-lg-3 control-label">
														<button class="btn btn-success btn-sm" type="button"
															onclick="OtherAdditional();">
															<span class="glyphicon glyphicon-plus" aria-hidden="true">+</span>
														</button>
													</div>
												</div>
												<div id="OtherBtnDiv"></div> -->
												
											</div>
										</div>
									</form>
									<center>
									   <div class="row" id="h1docslist"  style="display:none;">
											<div class="col-lg-12">
												<table id="h1bdocstable"
													class="table table-hover table-bordered"
													style="text-align: center;">
													<thead>
														<tr>
															<th style="text-align: center">Document Name</th>
															<th style="text-align: center">Document Type</th>
															<th style="text-align: center">Document Sub Type</th>
															<th style="text-align: center">Document Input</th>
															<th style="text-align: center">Submitted On</th>
															<th style="text-align: center">Submitted By</th>
															<th style="text-align: center">Action</th>
														</tr>
													</thead>
													<tbody>
														
													</tbody>
												</table>
											</div>
										</div>
										</center>
									 </div>
									</div>
								</div>
							</div>
							
							<div class="modal fade" id="edith1bApprovedDocModal" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true" style="top:65px;">
								<div class="modal-dialog modal-lg" 
									role="document" style="max-width:70%;">
									<div class="modal-content" style="width:100%;">
										<div class="modal-header" style="padding: .5rem;">
											<button class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<center><h5 class="modal-title" id="exampleModalLabel"
												style="font-size: 15px">
												<b><span id="apph1bHeader"></span></b>
											</h5></center>
										</div>
										<div class="modal-body">
										<form action="/" id="apph1bDetailsForm" enctype="multipart/form-data">
										<div class="row">
											<input type="hidden" id="apph1documentid" name="apph1documentid">
											<input type="hidden" id="apph1id" name="apph1id">
											
											<div class="col-md-12 col-sm-12">
													<div class="row" id="eapprovedh1bD">
													 <div class="form-group row">
															<label for="inputPassword" class="col-sm-3 control-label"><Span
																style="color: red;">*</Span>Is this document to be
																shown to candidate?</label>
															<div class="col-sm-6">
																<label>Yes</label>&nbsp;<input type="radio"
																	name="uhisdocshown" id="uhisdocshown1" value="Yes"
																	style="width: 20px; height: 20px;"required />&nbsp;<label>No</label>&nbsp;<input
																	type="radio" id="uhisdocshown2" name="uhisdocshown"
																	value="No" style="width: 20px; height: 20px;" /> <br>
															</div>
													 </div>
													 <div class="form-group row" id="eah1docId">
														<label class="col-sm-3 col-form-label"><span
															style="color: red"></span>Document Upload</label>
														<div class="col-sm-6">
														<input type="file" id="apph1document" name="apph1document" class="form-control" onchange="ValidateFileSize4(this)"/>
														<!-- <br> --><span id="appfileSpan" style="color:green;"></span>
														</div>
													 </div>
												</div> 
												   <div class="row" id="eapprovedh1b">
												   <div class="col-md-6 col-sm-12">
													<div class="form-group row" id="eh1bdisp" >
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>H-1B Number</label>
														<div class="col-sm-6" >
															<input type="text" id="eh1bNumber" name="eh1bNumber" minlength="16" maxlength="16"
																class="form-control" placeholder="H1B Number e.g : SRC-16-022-57890"
																tile="Please Enter H1B Number e.g : SRC-16-022-57890"/>
																<span id="checkh1bNo" style="color: red;" style=" width: 300%;"></span>
														</div>
													</div>
													<!--  SRC-16-022-57890 -->
													<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>H1B Valid From Date</label>
														<div class="col-sm-6">
															<input type="text"  id="eh1bvFromDate" name="eh1bvFromDate" autocomplete="off"
																class="form-control" onkeydown="return false" placeholder="H1B Valid From Date" />
														</div>
													</div>
													

													<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>H1B Valid To Date</label>
														<div class="col-sm-6">
															<input type="text" id="eh1bvToDate" name="eh1bvToDate" autocomplete="off"
															 class="form-control" onkeydown="return false" placeholder="H1B Valid To Date"/>
														</div>
													</div>
													</div>
													 <div class="col-md-6 col-sm-12">
													 <div class="form-group row" id="h1bdisp" >
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>I-94 Number</label>
														<div class="col-sm-6" >
															<input type="text" id="ei94Number" name="ei94Number" minlength="15" maxlength="15"
																class="form-control" placeholder="I-94 Number"/>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>I-94 Valid From Date</label>
														<div class="col-sm-6">
															<input type="text" id="ei94vFromDate" name="ei94vFromDate" autocomplete="off"
															 class="form-control" onkeydown="return false" placeholder="I-94 Valid From Date"/>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>I-94 Valid To Date</label>
														<div class="col-sm-6">
															<input type="text" id="ei94vToDate" name="ei94vToDate"  autocomplete="off"
															class="form-control" onkeydown="return false" placeholder="I-94 Valid To Date"/>
														</div>
													</div>
													</div>
													</div>
										     <div class="text-center ml-5" id="apph1bbtnSubId">
												<button type="button" class="btn btn-info btn-sm"
													id="apph1bbtnUpdate">Update</button>
											</div>
											</div>
										</div>
									</form>
									 </div>
									</div>
								</div>
							</div>
			<div class="modal fade" id="edith1bDocsModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 70px;">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content" style="width:100%;">
								<div class="modal-header" style="padding: .25rem;">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<center><h5 class="modal-title" id="exampleModalLabel"
												style="font-size: 15px">
												<b><span id="eh1Header"></span></b>
							</h5></center>
					</div>
					 <div class="modal-body"> 
								<form action="/" enctype="multipart/form-data"
									id="h1updateuserdocformid">
									<input type="hidden" id="rfeh1docid" name="rfeh1docid">
											<div class="form-group row">
															<label for="inputPassword" class="col-sm-4 control-label"><Span
																style="color: red;">*</Span>Is this document to be
																shown to candidate?</label>
															<div class="col-sm-5">
																<label>Yes</label>&nbsp;<input type="radio"
																	name="uisdocshown" id="uisdocshown1" value="Yes"
																	style="width: 20px; height: 20px;"required />&nbsp;<label>No</label>&nbsp;<input
																	type="radio" id="uisdocshown2" name="uisdocshown"
																	value="No" style="width: 20px; height: 20px;" /> <br>
															</div>
										 </div>
									
										<div class="form-group row">
										<label class="col-sm-4 control-label"><span
											style="color: red;">*</span>Document Name</label>
										<div class="col-sm-5">
											<input type="text" title="only alphabets are allowed"
												name="h1edinputval" id="h1edinputval" class="form-control" />
										</div>
										</div>
										<div class="form-group row">
										 <label class="col-sm-4 control-label"><span
											style="color: red;">*</span>Document Upload</label>
										<div class="col-sm-5">
											<input type="file" class="form-control" name="h1filenameid" onchange="ValidateFileSize4(this)" required/>
											<span id="h1edfileSpan" style="color:green;"></span>
										</div>
										</div>
									
									<div class="text-center ml-5">
										<button type="button" id="h1updatebuttonid"
											class="btn btn-primary btn-sm">Update</button>
									</div>
								</form>
									</div>
				</div>
			</div>
		</div>
		
		
				<div class="modal fade" id="editdocmodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true" style="top: 180px;">
					<div class="modal-dialog modal-lg" style="max-width: 45%;"
						role="document">
						<div class="modal-content" style="width: 90%; height: 50%;">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<center><h5 class="modal-title" id="exampleModalLabel"
												style="font-size: 15px">
												<b><span id="eh1bHeader"></span></b>
							</h5></center>
							</div>
							<div class="modal-body">
								<form action="/" enctype="multipart/form-data"
									id="updatedocformid">
									<!-- <span style='color: blue;' id="subcatname"></span> <span
										style='color: blue;' id="filenameid"></span>
									 <input type="text" id="editdocid" name="editdocid">  -->
									<input type="hidden" id="eh1documentid" name="eh1documentid">
									<div class="form-group row">
															<label for="inputPassword" class="col-sm-4 control-label"><Span
																style="color: red;">*</Span>Is this document to be
																shown to candidate?</label>
															<div class="col-sm-5">
																<label>Yes</label>&nbsp;<input type="radio"
																	name="urisdocshown" id="urisdocshown1" value="Yes"
																	style="width: 20px; height: 20px;"required />&nbsp;<label>No</label>&nbsp;<input
																	type="radio" id="urisdocshown2" name="urisdocshown"
																	value="No" style="width: 20px; height: 20px;" /> <br>
															</div>
									 </div>
									<div class="form-group row">
										<label class="col-sm-4 col-form-label"><span
											style="color: red;"></span>Document Upload</label>
										<div class="col-sm-5">
												<input type="file"  class="form-control" id="eh1bfilename" name="eh1bfilename" onchange="ValidateFileSize4(this)" required>
										   <span id="eh1edfileSpan" style="color:green;"></span>
										</div>
									</div>
									<div class="text-center ml-5">
										<button type="button" id="updatedocid"
											class="btn btn-primary btn-sm">Update</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!--H1B module related all popups End -->
			<!-- </div> -->
			<!-- .animated -->
		</div>
	</div>
	<script src="resources/js/js/jquery-2.1.4.min.js"></script>
	<script src="resources/js/newjs/bootstrap.min.js"></script>
	<script src="resources/js/newjs/formValidation.min.js"></script>
	<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
	<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
		<script type="text/javascript" src="resources/js/js/select2.min.js"></script>
	<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
	<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript" src="resources/preDefined/lcavalidate.js"></script>
	<script type="text/javascript" src="resources/preDefined/h1bvalidate.js"></script>
	<script src="resources/preDefined/goback.js"></script>
	<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!-- 	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script> -->
	
</body>

<script>
//$("#saveimmidocumentbydocId").validate(); 
/* $('#immi,#lcadiv,#h1bdiv,#pafdiv,#tasksdiv,#h1taskDiv,#h1EmpDocsDiv,#allh1hdocListId,#init_h1bDiv').hide(); */
$('#immi,#lcadiv,#h1bdiv,#pafdiv,#tasksdiv,#h1taskDiv,#h1EmpDocsDiv,#h1QuestionnaireDiv,#allh1hdocListId,#init_h1bDiv,#dependId,#kidsId,#uinit_h1bDiv,#uinitsubh1bid,#viewalltaskdetailsbtn').hide();
$('#client').select2({
    placeholder: "Select Client",
});
$('#candidate').select2({	
    placeholder: "Select Candidate",
});
/* $('#init_remote_soc_code').select2({	
    placeholder: "Select Soc Code"
});
$('#remote_soc_code').select2({	
    placeholder: "Select Soc Code"
}); */
				$("#candidate").change(function() {
					getsesVal().done(function(data){
						  if(data!=""){
				//$("#client").select2().val(null).trigger("change");
				var cand_id=$('#cand_id').val();
				var candidate = document.getElementById('candidate').value;
				if(candidate=="" && cand_id=="") {
					$('#candidate').empty();
				} else {
					if(cand_id!="") {
					   if(cand_id!=candidate){
						   var candname=$("#candidate option:selected").text();
						     candname = candname.replace(/\//g, "/");
							alert("You Have Selected "+candname+"")
						}
					  }
					$.ajax({
						type : "GET",
						asyn : false,
						contentType : "application/json", // NOT dataType!
						url : "getCanidateDetailsByCanId",
						data : {
							candidateid : candidate
						},
						success : function(response) {
						if(response!=null){
						var workauth=response.work_authorization;var emp_type=response.emp_type;
						
						$('#visa_workauth').text(workauth)
						if((emp_type=="W2 Admin" || emp_type=="W2" || emp_type==null) && (workauth!="Green Card" || workauth!="US Citizen")){
							$('#initiatediv').show()
						}else{
							$('#initiatediv').hide()
						}
						}
						$('#candidateid').val(candidate);
						$('#immi,#lcadiv').hide();
						var candiname=$("#candidate option:selected").text();
						$('#candidateidname').val(candiname);
						$('#lcadiv').hide();
						$('#immi').show();
						$('#cand_id').val(candidate);
						$("#pills-tab").find(".active").trigger('click');
						}
					});
					
					}
						  }else{window.location.href="loginpage";}});
				/* 	$.ajax({
						type : "GET",
						asyn : false,
						contentType : "application/json", // NOT dataType!
						url : "getendclientlist",
						data : {
							candidateid : candidate
						},
						success : function(response) {
							$('#client').empty();
							$('#client').append($('<option/>').attr("value", '').text("Select Client"));
							for (var i = 0; i < response.length; i++) {
								$('#client').append($('<option/>').attr("value",response[i].clientid).text(response[i].clientName));
							}
						}
					}); */
				
			});

	 var datePicker = $(".calendar").datepicker({});
	 var t ;
	 $( document ).on(
	    'DOMMouseScroll mousewheel scroll',
	    '#initlcadetailsmodal', 
	    function(){       
	        window.clearTimeout( t );
	        t = window.setTimeout( function(){            
	            $('.calendar').datepicker('place')
	        }, 100 );        
	    }
	);
	 
	 
	 /* $('#saveimmidocumentbydocId').on('submit', function(){
	        var filename=($(this).find('input[name="filename[]"]').val()).length;
	        var otherAddtnlinput=($(this).find('input[name="otherAddtnlinput[]"]').val()).length;
	        alert(filename+"********"+otherAddtnlinput);
	        if (filename==0 || otherAddtnlinput==0){
	            alert('please enter value');
	            return false;
	        }else{
	            //submit
	        }

	    }); */
	 //   $("#inputdiv").hide();
</script>
<script>
var candid=sessionStorage.getItem("candId");
var name=sessionStorage.getItem("candName");
var ref=sessionStorage.getItem("Ref");
		if(candid!=null && name!=null){
			$("#candidate").val(candid).trigger('change');
			 $("#h1btab").trigger('click');
			 sessionStorage.clear();
		}
		if(ref!=null && candid!=null){
			$("#candidate").val(candid).trigger('change');
			 $("#lcatab").trigger('click');
			 sessionStorage.clear();
		}
		
		 var candi=sessionStorage.getItem("candys");
		if(candi!=null){
			$("#candidate").val(candi).trigger('change');
			 $("#h1btab").trigger('click');
			 sessionStorage.clear();
		} 	
	
</script>
</html>
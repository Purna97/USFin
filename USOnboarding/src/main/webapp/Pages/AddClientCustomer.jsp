<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/css/datepicker3.min.css" />
<link rel="stylesheet" href="resources/css/css/select2.min.css"	rel="stylesheet" />
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
</style>
<body class="sidebar-mini fixed">
   <div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">
							<c:if test="${empType eq 'W2' || empType eq '1099'}">
							US Onboarding- Add Client & Customer Details
							</c:if>
							<c:if test="${empType eq 'C2C'}">
							US Onboarding- Add Client & Vendor Details
							</c:if>
							</h5>
							<div class="card-body">
	               <c:if test="${empType eq 'W2'}">
					<c:choose>
					<c:when test="${countObj.clientcount gt 0 && (countObj.inhousecount lt 1 || empty countObj.inhousecount)}"> 
				    <h6 style="text-align-last:end;color:green"><a href="#"  onclick="addInhouseproject('${candidate_id}','${empType}')" 
					class="label label-success" style="color:green;" title="Add In-house project">
					Add In-house Project <i class="fas fa-home"></i></a></h6><br>
					</c:when>
					<c:when test="${countObj.clientcount lt 1 && (countObj.inhousecount lt 1|| empty countObj.inhousecount)}"> 
				   <h6 style="text-align-last:end;color:green"><a href="#"  onclick="addInhouseproject('${candidate_id}','${empType}')"  
					class="label label-success" style="color:green;" title="Add In-house project">
					Add In-house Project <i class="fas fa-home"></i></a></h6><br>
					</c:when>
					<c:when test="${countObj.clientcount gt 0 && (countObj.inhousecount gt 0 || countObj.inhousecount eq 1)}"> 
				    
				   <h6 style="text-align-last:end;color:red"><a href="#"  onclick="alert('In-house project is active, you can not add another In-house project');"  
					class="label label-success" style="color:red;" title="Add In-house project">
					Add In-house Project <i class="fas fa-home"></i></a></h6><br>
					</c:when>
					<c:when test="${countObj.clientcount eq 0 && countObj.inhousecount eq 1}"> 
					<%-- <h6 style="text-align-last:end;color:green"><a href="#"  onclick="addInhouseproject('${candidate_id}','${empType}')"  
					class="label label-success" style="color:green;" title="Add In-house project">
					Add In-house Project <i class="fas fa-home"></i></a></h6><br> --%>
					<h6 style="text-align-last:end;color:red"><a href="#"  onclick="alert('In-house project is active, you can not add another In-house project');"  
					class="label label-success" style="color:red;" title="Add In-house project">
					Add In-house Project <i class="fas fa-home"></i></a></h6><br>
					</c:when>
					</c:choose> 
					</c:if>
								<div class="row">
								<div class="col-md-8 col-lg-12">
										<fieldset>
										<%-- <center><font color=red>Employee Name :</font>&nbsp;&nbsp;<b>${empobj.fullname}</b>&nbsp;&nbsp;<font color=red>Employee Number :</font>&nbsp;&nbsp;<b>${empobj.emp_number}</b>&nbsp;&nbsp;<font color=red>Employee Username :</font>&nbsp;&nbsp;<b>${empobj.username}</b></center> --%>
										<%-- <center><font color=red>Employee Name :</font><b>&nbsp;&nbsp;${basicObj.full_name}</b>&nbsp;&nbsp;<font color=red>Employee Type :</font><b>&nbsp;&nbsp;${basicObj.emp_type}</b></center> --%>
										<div class="form-group row">
										 <label for="inputPassword" class="col-sm-3 control-label"></label>
										<center><font color=red><strong>Employee Name :</strong></font><b>&nbsp;&nbsp;${basicObj.full_name}</b>&nbsp;&nbsp;<font color=red><strong>Employee Type :</strong></font><b>&nbsp;&nbsp;${basicObj.emp_type}</b></center>&nbsp;&nbsp;<font color=red><strong>Work Authorization :</strong></font><b>&nbsp;&nbsp;${basicObj.work_authorization}</b></center>
										</div>
										<br>
										<br>
										<c:if test="${(countObj.clientcount eq 0 || countObj.clientcount gt 0) && (countObj.inhousecount eq 0 || countObj.inhousecount eq 1)}">
										<form action="/" method="post" class="form-horizontal" id="addClientVendorForm" enctype="multipart/form-data">
										<input type="hidden" name="candidate_id" id="candidate_id" value="${candidate_id}">
										<input type="hidden" name="emp_type" id="emp_type" value="${empType}">
										<input type="hidden" name="work_authorization" id="work_authorization" value="${basicObj.work_authorization}">
                                            <h4><b>Customer Details</b></h4>
											<br>
											<div class="form-group row">  
									    	   <label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Select Customer</label>
											   <div class="col-sm-5">
											     <select name="customertype" autoComplete="off" class="form-control text-left" id="customertype" onchange="loadcustomer()" required>
										             <option value="" selected="selected">--Select Customer--</option>
										             <c:forEach var="custl" items="${cutomerList}">
															<option value="${custl.companyId}">${custl.companyName}</option>
														</c:forEach>
										         </select>
										    </div> 
										    </div>
										<div id="customerDiv" style="display:none;">	
									       <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Customer Name</label>
												<div class="col-sm-5">
													<input id="customer_name" type="text" 
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="Customer Name" name="customer_name" class="form-control"  readonly>
												</div>
											</div>
											
											 <div class="form-group row ">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Customer Address</label>
												<div class="col-sm-5">
													<input id="customer_add" type="text" minlength="2"
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="Customer Address" name="customer_add" class="form-control"  readonly>
												</div>
											</div>
											
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Customer Person Contact No</label>
												<div class="col-sm-5">
													<input id="customer_phne_no" type="text" pattern="\d*" minlength="10" maxlength="13" title="Enter Only Digits"
													autocomplete="off" placeholder="Customer Person Contact No" name="customer_phne_no"  class="form-control"  readonly>
												</div>
											</div>
											
											 <div class="form-group row ">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Customer Manager e-mail ID</label>
												<div class="col-sm-5">
													<input id="customer_mgr_emailid" type="text"  
													title="Enter Valid Email format ex:xyz@gmail.com" 
													autocomplete="off" placeholder="Customer Manager e-Mail ID" name="customer_mgr_emailid" class="form-control"  readonly>
												</div>
											</div>

										<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span
													style="color: red;">*</Span>Invoicing terms</label>
												<div class="col-sm-2">
												<select name="invoice_terms" class="form-control text-left"
															id="invoice_terms" required>
												</select>
												<!-- <input class="form-control" id=''  autocomplete="off" pattern="^[a-zA-Z0-9\s]+$"
															title="Enter Invoice Terms"
														name="" placeholder='Enter Invoice Terms as NET 30' type='text'> -->
												</div>
												<label for="inputPassword" class="col-sm-2 control-label"><Span
													style="color: red;">*</Span>Invoicing Period</label>
												<div class="col-lg-2">
												<select id="invoice_period" class="form-control" name="invoice_period">
								       <option value="">Select Type</option>
								       <option value="Weekly">Weekly</option>
								       <option value="Bi-Weekly">Bi-Weekly</option>
								       <option value="Semi-Monthly">Semi-Monthly</option>
								       <option value="Monthly">Monthly</option>
								       <option value="Calendar">Calendar</option>
								     </select>
													<!-- <input id="invoice_period" type="text"  minlength="1"  maxlength="2"
														  title="Enter Only digits"	autocomplete="off" placeholder="Invoicing Period" name="invoice_period" 
														class="form-control" > -->
												</div>
											</div>
											<input type="hidden" name="bcurrency" id="bcurrency" value="$">
                                            <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span
													style="color: red;">*</Span>Bill Rate</label>
														
												<div class="col-lg-2 col-md-2">
											
													<input id="bill_rate" type="text"  minlength="2"  maxlength="7"
														  title="Enter Only digits"	autocomplete="off" placeholder="Bill Rate" name="bill_rate" 
														class="form-control" >
												</div><div class="col-md-0" style="line-height: 2.8;">$</div>
												
											</div>

											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span
													style="color: red;">*</Span>Project start date</label>
												<div class="col-sm-5">
													<input type="text" id="pro_startdate" class="form-control text-left"
														pattern="(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}"
														title="Enter date in MM/DD/YYYY format only" name="pro_startdate" onkeydown="return false"
														placeholder="Project start date" class="form-control" autocomplete="off">
												</div>
											</div>

											<div class="form-group row ">
												<label for="inputPassword" class="col-sm-3 control-label"><Span
													style="color: red;">*</Span>Project end date</label>
												<div class="col-sm-5">
													<input type="text" id="pro_enddate" class="form-control text-left"
														pattern="(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}"
														title="Enter date in MM/DD/YYYY format only" name="pro_enddate" onkeydown="return false"
														placeholder="Project end date" class="form-control" autocomplete="off">
												</div>
											</div>
											<div class="form-group row">
											<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Timesheet Type</label>
											   <div class="col-sm-5">
											   
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
											<br>
											<br>
									<div class="form-group row">
									  <label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Uploded MSA</label>
										<div class="col-sm-5" id="uploadMsa">
										
								    	</div>
									</div>
									<div class="form-group row" id="MsaDates">
									  <label for="inputPassword" class="col-sm-3 control-label"></label>
									<label id="MsaSd">Start Date : <span id="csdate"></span></label>&nbsp&nbsp&nbsp&nbsp<label id="MsaEd">End Date : <span id="cedate"></span></label>
									</div>
									<div class="form-group row" id="upmam"  style="display:none">
									  <label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Management Approved e-mail(Customer)</label>
										<div class="col-sm-5"  id="uploadmam">
								    	</div>
									</div>
									
									<div class="form-group row">
									  <label for="inputPassword" id="cust_work_order" class="col-sm-3 control-label">
									  <Span id="vlab" style="color:red;">*</Span>Upload WO/PO</label>
										<input type="hidden" value="cust_work_order" name="cust_work_order" />
										<div class="col-sm-3">
										<input type="file" id="cw_order" name="cw_order" onchange="cwoValidateSize(this)"><br>
									</div>
									<div class="col-sm-2" >
										<input type="text" id="cwofromdate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="cwofromdate" placeholder="Start Date" class="form-control"> 
									</div>
									<div class="col-sm-2">
										<input type="text" id="cwoexpirydate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="cwoexpirydate" placeholder="End Date" class="form-control">
									</div>
									<div class="col-sm-2">
												Exception: <input type="checkbox" id="myCheck" name="myCheck">
									</div>
									</div>
								</div>
								<div class="form-group row" id="map"  style="display:none;">
												<label for="inputPassword"	class="col-sm-3 control-label">
												<Span style="color: red;">*</Span>Management Approval e-mail(Consultant) </label>
												<div class="col-sm-5">
													<input type="hidden" value="Manager_Approved_Email_CWO" name="Manager_Approved_Email_CWO" /> 
													<input type="file" id="mgr_approved_mail_CWO" name="mgr_approved_mail_CWO"  accept=".msg,.eml" onchange="ValidateMsgFile(this)"><br>
												</div>
							     </div>
						   		    <c:choose>
						   			<c:when test="${empType=='C2C'}">
						                <h4><b>Select Vendor</b></h4>
									        <br>
											<div class="form-group row">  
									    	   <label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Select Vendor</label>
											   <div class="col-sm-5">
											     <select name="vendortype" autoComplete="off" class="form-control text-left" id="vendortype" onchange="loadvendor()" required>
										             <option value="" selected="selected">--Select Vendor--</option>
										              <c:forEach var="venl" items="${vendorList}">
															<option value="${venl.companyId}">${venl.companyName}</option>
														</c:forEach>
										         </select>
										    </div> 
										    </div>
										</c:when>
										</c:choose>
										<div id="vendor" style="display:none;">
									       <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Vendor Name</label>
												<div class="col-sm-5">
													<input id="vendor_name" type="text" 
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="vendor Name" name="vendor_name" class="form-control" readonly>
												</div>
											</div>
											
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Vendor Address</label>
												<div class="col-sm-5">
													<input id="vendor_add" type="text" 
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="Vendor Address" name="vendor_add"  class="form-control" readonly>
												</div>
											</div>
											
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Vendor Person Contact No</label>
												<div class="col-sm-5">
													<input id="vendor_phne_no" type="text" pattern="\d*" maxlength="13" title="Enter Only Digits"
													autocomplete="off" placeholder="Vendor Person Contact No" name="vendor_phne_no" class="form-control" readonly>
												</div>
											</div>
											
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Vendor Manager e-mail ID</label>
												<div class="col-sm-5">
													<input id="vendor_mgr_emailid" type="text" 
													title="Enter Valid Email format ex:xyz@gmail.com" 
													autocomplete="off" placeholder="Vendor Manager e-Mail ID" name="vendor_mgr_emailid" class="form-control" readonly>
												</div>
											</div>
												<!--  pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$" -->
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span
													style="color: red;">*</Span>Payment terms</label>
												<div class="col-sm-5">
												<input class="form-control" id='payment_terms'  autocomplete="off" 
															title="Enter Payment Terms"
														name="payment_terms" placeholder='Enter Payment Terms as NET 30' type='text'>
												</div>
											</div>	
											<input type="hidden" name="pcurrency" id="pcurrency" value="$">
                                            <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span
													style="color: red;">*</Span>Pay Rate</label>
												<div class="col-lg-2 col-md-2">
													<input id="pay_rate" type="text" minlength="2"  maxlength="7"
													       title="Enter Only digits" autocomplete="off" placeholder="Pay Rate" name="pay_rate"
														class="form-control" > 
												</div>
												<label>$</label>
											</div>  
									<div class="form-group row">
										 <label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Uploded MSA</label>
										<div class="col-sm-5" id="vMSA">
									    </div> 
									</div>
									<div class="form-group row" id="vMSADates">
									  <label for="inputPassword" class="col-sm-3 control-label"></label>
									<label id="vMSA1Sd">Start Date : <span id="vMSAsdate"></span></label>&nbsp&nbsp&nbsp&nbsp<label id="vMSAEd">End Date : <span id="vMSAedate"></span></label>
									</div>
									<h4>Upload Business Compliance</h4>
									<div class="form-group row" id="BCdocs1Id">
									  <label for="inputPassword" class="col-sm-3 control-label" ></label>
									 <div class="col-lg-8" id="BCdocs1">
									 </div>
									</div>
									<div class="form-group row" id="BCdocs1Dates">
									  <label for="inputPassword" class="col-sm-3 control-label"></label>
									<label id="BCdocs1Sd">Start Date : <span id="bcd1sdate"></span></label>&nbsp&nbsp&nbsp&nbsp<label id="BCdocs1Ed">End Date : <span id="bcd1edate"></span></label>
									</div>
									<div class="form-group row" id="BCdocs2Id">
									  <label for="inputPassword" class="col-sm-3 control-label" ></label>
									 <div class="col-lg-8" id="BCdocs2">
									</div>
									</div>
									<div class="form-group row" id="BCdocs2Dates">
									  <label for="inputPassword" class="col-sm-3 control-label"></label>
									<label id="BCdocs2Sd">Start Date : <span id="bcd2sdate"></span></label>&nbsp&nbsp&nbsp&nbsp<label id="BCdocs2Ed">End Date : <span id="bcd2edate"></span></label>
									</div>
									<div class="form-group row" id="BCdocs3Id">
									  <label for="inputPassword" class="col-sm-3 control-label" ></label>
									 <div class="col-lg-8" id="BCdocs3">
									</div>
									</div>
									<div class="form-group row" id="BCdocs3Dates">
									  <label for="inputPassword" class="col-sm-3 control-label"></label>
									<label id="BCdocs3Sd">Start Date : <span id="bcd3sdate"></span></label>&nbsp&nbsp&nbsp&nbsp<label id="BCdocs3Ed">End Date : <span id="bcd3edate"></span></label>
									</div>
									<div class="form-group row" id="BCdocs4Id">
									  <label for="inputPassword" class="col-sm-3 control-label" ></label>
									 <div class="col-lg-8" id="BCdocs4">
									</div>
									</div>
									<div class="form-group row" id="upam"  style="display:none">
									  <label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Management Approved e-mail(Vendor)</label>
										<div class="col-sm-5"  id="uplodmam">
								    	</div>
									</div>
									
									<div class="form-group row">
									  <label for="inputPassword" id="ven_work_order" class="col-sm-3 control-label">
									  <Span id="vlab1" style="color:red;">*</Span>Upload WO</label>
										<input type="hidden" value="ven_work_order" name="ven_work_order" />
										<div class="col-sm-3">
										<input type="file" id="w_order" name="w_order" onchange="vwoValidateSize(this)"><br>
									</div>
									<div class="col-sm-2" >
										<input type="text" id="vwofromdate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="vwofromdate" placeholder="Start Date" class="form-control"> 
									</div>
									<div class="col-sm-2">
										<input type="text" id="vwoexpirydate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="vwoexpirydate" placeholder="End Date" class="form-control">
									</div>
									 <div class="col-lg-2">
												Exception: <input type="checkbox" id="myCheck1" name="myCheck1">
									 </div>
									</div>
									
								<div class="form-group row">
									  <label for="inputPassword" id="Consultant_Consent_Agreement" class="col-sm-3 control-label">
									  <Span id="vlab2" style="color:red;">*</Span>Consultant Consent Agreement</label>
										<input type="hidden" value="Consultant_Consent_Agreement" name="Consultant_Consent_Agreement" />
										<div class="col-sm-5">
										<input type="file" id="cagreement" name="cagreement" onchange="ccaValidateSize(this)"><br>
										</div>
									</div>	
	                              
								<div class="form-group row">
									  <label for="inputPassword" id="Consultant_Compliance" class="col-sm-3 control-label">
									  <Span id="vlab3" style="color:red;">*</Span>Consultant Compliance</label>
										<input type="hidden" value="Consultant_Compliance" name="Consultant_Compliance" />
										<div class="col-sm-3">
										<input type="file" id="cCompliance" name="cCompliance" 	onchange="ccValidateSize(this)"><br>
										</div>
									<div class="col-sm-2" >
										<input type="text" id="ccfromdate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="ccfromdate" placeholder="Start Date" class="form-control"> 
									</div>
									<div class="col-sm-2">
										<input type="text" id="ccexpirydate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="ccexpirydate" placeholder="End Date" class="form-control">
									</div> 
								</div>
							</div>
							<div class="form-group row" id="map2"  style="display:none;">
												<label for="inputPassword"	class="col-sm-3 control-label">
												<Span style="color: red;">*</Span>Management Approval e-mail(Consultant) </label>
												<div class="col-sm-5">
													<input type="hidden" value="Manager_Approved_Email_VWO" name="Manager_Approved_Email_VWO" /> 
													<input type="file" id="mgr_approved_mail_VWO" name="mgr_approved_mail_VWO"  accept=".msg,.eml" onchange="ValidateMsgFile(this)"><br>
												</div>
							</div>
							<h4><b>End Client Details</b></h4>
							<br>
							     <div id="client">
							     <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Project Name</label>
												<div class="col-sm-5">
													<input id="project_name" type="text"  minlength="2" maxlength="100"
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="Project Name" name="project_name" class="form-control">
												</div>
											</div>
										   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>End Client Name</label>
												<div class="col-sm-5">
													<input id="client_name" type="text"  minlength="2" maxlength="100"
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="End Client Name" name="client_name" class="form-control"  required>
												</div>
											</div>
										 
										 	<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Federal ID</label>
												<div class="col-sm-5">
												<input  type="text" name="fed_id" id="fed_id" 
													 placeholder="Federal ID"  class="form-control" ></input>
												</div>
											 </div> 
											 
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>End Client Manager Name</label>
												<div class="col-sm-5">
													<input id="client_mgr_name" type="text" 
													title="only alphabets are allowed" minlength="2"  maxlength="100"
													autocomplete="off" placeholder="End Client Manager Name" name="client_mgr_name" class="form-control"  >
												</div>
											</div>
										    
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>End Client Manager e-mail ID</label>
												<div class="col-sm-5">
													<input id="client_mgr_emailid" type="text"  title="Enter Valid e-mail" 
													autocomplete="off" placeholder="End Client Manager e-mail ID" name="client_mgr_emailid"
													minlength="10" maxlength="80" class="form-control" >
												</div>
											</div>
											<!-- pattern="^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$"  -->
											 <div class="form-group row">
												<label class="col-sm-3 control-label" ><Span style="color:red;"></Span>Manager Desk Extension Number</label> 
													 <div class="col-sm-5">
													<input class="form-control" id='mgrdeskNumber'  autocomplete="off" title="Enter Desk number" minlength="12" maxlength="12"
													name="mgrdeskNumber"  placeholder='Manager Desk Extension Number' type='text'>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Employee e-mail ID At Client Location</label>
												<div class="col-sm-5">
													<input id="emp_emailid" type="text"  title="Enter Valid Email" 
													autocomplete="off" placeholder="Employee e-mail ID at Client Location" name="emp_emailid" 
													minlength="10" maxlength="80" class="form-control">
												</div>
											</div>
											 <!--  pattern="/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/" -->
											<div class="form-group row">
												<label class="col-sm-3 control-label" ><Span style="color:red;"></Span>Employee Client Desk Extension 
													Number</label> 
													 <div class="col-sm-5">
													<input class="form-control" id='empdeskNumber'  autocomplete="off" title="Enter Desk number" minlength="12" maxlength="12"
													name="empdeskNumber"  placeholder='Enter Employee Client Desk Number' type='text'>
												</div>
											</div>
											
											<h4><b>End Client Address</b></h4>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-5">
													<input id="line1" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="line1" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-5">
													<input id="col-sm-5" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
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
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Metro Politan Area</label>
												<div class="col-sm-5">
													<input id="metro_politan_area" type="text"  minlength="2" maxlength="25"
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="Metro Politan Area" name="metro_politan_area" class="form-control">
												</div>
											 </div>
										</div>
										
										<c:if test="${not empty basicObj.work_authorization}">
										<c:if test="${basicObj.work_authorization=='H-1B'  && empType eq 'W2'}">
										<h4><b>LCA Questionnaire</b></h4>
									  	    <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Organization Name</label>
												<div class="col-sm-5">
													<select id="organization_name" name="organization_name" class="form-control">
													 <option value=""disabled>Select Organization Name</option>
													<option value="Tekskills Inc">Tekskills Inc</option>
													</select>
												</div>
											 </div>
											 
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Reason for filing LCA</label>
												<div class="col-sm-5">
													<select id="reason_lca" name="reason_lca" class="form-control">
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
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Candidate Job Title</label>
												<div class="col-sm-5">
													<input id="cand_job_title" type="text"  minlength="2" maxlength="100"
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="Candidate Job Title" name="cand_job_title" class="form-control">
												</div>
											 </div>
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Job Duties</label>
												<div class="col-sm-5">
													<textarea id="job_duties" type="text" rows="6" cols="100" 
													autocomplete="off" placeholder="Job Duties" name="job_duties" class="form-control"  required></textarea>
												</div>
											   </div>
											 
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Education</label>
												<div class="col-sm-5">
													<input id="education" type="text"  minlength="2" maxlength="100"
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="Education" name="education" class="form-control">
												</div>
											 </div>
											 
											 <div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>LCA Begin Date</label>
														<div class="col-sm-5">
															<input type="text"  id="lcaBeginDate" name="lcaBeginDate"
																class="form-control" onkeydown="return false" placeholder="LCA Begin Date" />
														</div>
											   </div>
											   <div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>LCA End Date</label>
														<div class="col-sm-5">
															<input type="text"  id="lcaEndDate" name="lcaEndDate"
																class="form-control" onkeydown="return false" placeholder="LCA End Date" />
														</div>
											  </div>
											   <div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>LCA Filing Date</label>
														<div class="col-sm-5">
															<input type="text"  id="lcaPostedDate" name="lcaPostedDate"
																class="form-control" onkeydown="return false" placeholder="LCA Filing Date" />
														</div>
											  </div>
											  <div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red">*</span>Wage Rate</label>
														<div class="col-sm-3">
															<input type="text" id="wageRate" minlength="2" maxlength="10"
															 name="wageRate" class="form-control" placeholder="Wage Rate"
															 title="please enter valid format as ex: 12.00  or 12"
											 				 onkeypress="javascript:return isNumber(event)" />
														</div>
														<div class="col-sm-2">
														<select id="wr_option" name="wr_option" class="form-control">
													 			<option value="">Select Option</option>
															 	<option value="Per/Hour">Per/Hour</option>
															 	<option value="Per/Year">Per/Year</option>
													 		</select>
														</div>
											 </div>
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>County</label>
												<div class="col-sm-5">
													<input id="remote_county" type="text"  minlength="4" maxlength="20"
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="County" name="remote_county" class="form-control">
												</div>
											 </div>
											 
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>SOC code</label>
												<div class="col-sm-5">
													<!-- <input id="remote_soc_code" type="text"  minlength="7" maxlength="7"
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="SOC code" name="remote_soc_code" class="form-control"> -->
													 <select name="remote_soc_code" autoComplete="off" class="form-control text-left" id="remote_soc_code" required>
										             <option value="" selected="selected">--Select SOC Code--</option>
										             <c:forEach var="socl" items="${soccodeList}">
															<option value="${socl.soc_code}">${socl.soc_code}</option>
														</c:forEach>
										             </select>
												</div>
											 </div>
											 
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label">To get Counties</label>
												<div class="col-sm-3">
													<span><a href="https://www.getzips.com/zip.htm" target="_blank"style="color:blue;">https://www.getzips.com/zip.htm</a></span>
												</div>
												<label for="inputPassword" class="col-sm-0 control-label">To get SOC</label>
												<div class="col-sm-3">
												 <span><a href="https://www.flcdatacenter.com/" target="_blank"style="color:blue;">https://www.flcdatacenter.com/</a></span><br><br>
												</div>
											  </div>
											  
											 
											<%--  <center>
											<span> <br><a href="https://www.flcdatacenter.com/" target="_blank"style="color:blue;">You can find all the states from search wizard</a></span>
										   <span> <br><br><a href="https://www.flcdatacenter.com/" target="_blank"style="color:blue;">You can find the county from this website by entering zip code</a></span><br><br>
										   </center> --%>
											 
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Are you working/supporting client project from Remote/Home or end client location :</label>
												<div class="col-sm-5">
												 <label class="control-label">Remote/Home</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="workinglocation" name="workinglocation" value="Remote/Home" style=" width: 20px;height: 20px;" required/>&nbsp;&nbsp;&nbsp;&nbsp;<label>End client location</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="workinglocation" id="workinglocation" value="EndClient" style=" width: 20px;height: 20px;"/>
												</div>
											 </div>
											   <div id="remoteAddress" class="form-group" style="display:none;">
											   
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-5">
													<input id="remote_line1" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="remote_line1" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-5">
													<input id="remote_line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" placeholder="Enter Line2"
													 autocomplete="off" name="remote_line2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-5">
													<input id="remote_city" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="City" name="remote_city" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-5">
													<input id="remote_state" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="remote_state" class="form-control"  required>
												</div>
											</div>
											 
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-5">
													<input id="remote_zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" 
													 autocomplete="off" placeholder="Zip Code" name="remote_zipcode" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Metro Politan Area</label>
												<div class="col-sm-5">
													<input id="remote_metro_politan_area" type="text"  minlength="2" maxlength="25"
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="Metro Politan Area" name="remote_metro_politan_area" class="form-control">
												</div>
											 </div>
											 </div>
											 
										<c:if test="${not empty basicObj.work_authorization}">
										<c:if test="${basicObj.work_authorization=='H-1B'  && empType eq 'W2'}">	  
									    <div class='form-group row' id="add">
                                       <label for="inputPassword" class="col-sm-3 control-label">Add More Locations(LCA)</label>
												<div class="col-xs-4">
													<button type="button" class="btn btn-success addButton addButtonloc">
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                        </div>
                                        </c:if>
                                        </c:if>
											 
									<div id="addOtherLocation" class="form-group" style="display: none;">
													<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												    <div class="col-sm-5">
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
														style="color: red;"></Span>Line2</label>
													<div class="col-sm-5">
														<input type="text"
															pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*" minlength="2"
															maxlength="80" title="only alpha numerics are allowed"
															placeholder="Enter Line2" autocomplete="off"
															name="lca_othr_line2[]" id="lca_othr_line2" class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>City</label>
													<div class="col-sm-5">
														<input id="lca_othr_city" type="text" minlength="2"
															maxlength="25" title="only Characters are allowed"
															autocomplete="off" placeholder="City" name="lca_othr_city[]"
															class="form-control" required>
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>State</label>
													<div class="col-sm-5">
														<input id="lca_othr_state" type="text" minlength="2"
															maxlength="25" title="only Characters are allowed"
															autocomplete="off" placeholder="State"
															name="lca_othr_state[]" class="form-control" required>
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Zip Code</label>
													<div class="col-sm-5">
														<input id="lca_othr_zipcode" type="text" pattern="[0-9]{5}"
															minlength="5" maxlength="5"
															title="only digits are allowed" autocomplete="off"
															placeholder="Zip Code" name="lca_othr_zipcode[]"
															class="form-control" required>
													</div>
												</div>
												<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;">*</Span>Metro Politan Area</label>
														<div class="col-sm-5">
															<input id="lca_othr_remote_metro" type="text" minlength="2"
																maxlength="25" title="only Characters are allowed"
																autocomplete="off" placeholder="Metro Politan Area"
																name="lca_othr_remote_metro[]" class="form-control" required>
														</div>
												</div>
											</div>
										</c:if>
										</c:if>	
											
									 <div class='form-group row' id="add">
                                       <label for="inputPassword" class="col-sm-3 control-label">Add Other Client Details</label>
												<div class="col-xs-4">
													<button type="button" class="btn btn-success addButton addButtonclient">
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                        </div>
							     <div id="addotherclient" class="form-group" style="display:none;">
												
												 <div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Select Type of Client</label>
													 <div class="col-sm-5">
														<select class="form-control" id="othr_client_type" 
															name="othr_client_type[]" placeholder="Select Type of Client" required>
															<option value="">Select Type of Client</option>
															<option value="Primary Vendor">Primary Vendor</option>
															<option value="MSP">MSP</option>
															<option value="Implementation Partner">Implementation Partner</option>
														</select>
													</div>
													<div class="col-xs-4">
													<button type="button" class="btn btn-danger removeButton removeButtonclient">
														<i class="fa fa-minus"></i>
													</button>
												    </div>
												</div>
												
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Client Name</label>
													<div class="col-sm-5">
														<input class="form-control" id="othr_client_name" minlength="2" maxlength="100"
															name="othr_client_name[]" placeholder="Client Name"
															title="Enter Only alphabets" type="text" required>
													</div>
													<!-- <div class="col-xs-4">
													<button type="button" class="btn btn-danger removeButton">
														<i class="fa fa-minus"></i>
													</button>
												    </div> -->
												</div>
												<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Federal ID</label>
												<div class="col-sm-5">
												<input  type="text" name="othr_fed_id[]" id="othr_fed_id" minlength="10" maxlength="10"
													 placeholder="Federal ID"  class="form-control" required></input>
												</div>
											     </div> 
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Client Manager Name</label>
													<div class="col-sm-5">
														<input class="form-control" id="othr_client_mgr"
															name="othr_client_mgr[]" placeholder="Client Manager Name"
															title="Enter Only alphabets" minlength="2" maxlength="100"
															type="text" >
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Client Manager e-mail ID</label>
													<div class="col-sm-5">
														<input class="form-control" id="othr_client_mgr_email"
															name="othr_client_mgr_email[]" minlength="10" maxlength="80"
															placeholder="Client Manager e-mail ID"
															title="Enter e-mail" type="text">
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Manager Desk Extension Number</label>
													<div class="col-sm-5">
														<input class="form-control" id="othr_client_mgr_extn"
															name="othr_client_mgr_extn[]" pattern="[0-9]+"
															placeholder="Manager Desk Extension Number"
															data-masked-input="999-999-9999" minlength="12"
															maxlength="12" title="Enter Only digits" type="text">
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Employee e-mail ID At Client
														Location</label>
													<div class="col-sm-5">
														<input class="form-control" id="othr_emp_email_client"
															name="othr_emp_email_client[]" minlength="10" maxlength="80"
															placeholder="Employee e-mail ID AT Client Location"
															title="Enter Only e-mail" type="text">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Employee Client Desk Extension
														Number</label>
													<div class="col-sm-5">
														<input class="form-control" title="Enter Desk number"
															placeholder="Enter Employee Client Desk Number"
															id="othr_emp_client_extn" name="othr_emp_client_extn[]"
															data-masked-input="999-999-9999" minlength="10"
															maxlength="12" name="othr_emp_client_extn">
													</div>
												</div>
												
											<h4><b>Other Client Address</b></h4>
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
										</div>
											<div class="text-center ml-3">										
												   <input type="button" class="btn btn-default" id="btnSubmit" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Submit"  onclick="btnClick()">
												<!-- <button type="submit" id="submit" class="btn btn-default">Submit</button> -->
												<button type="reset" class="btn btn-default" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;">Reset</button> 
												<button  type="button" onclick="goBack()" class="btn btn-default btn-sm" style="padding:7px;background-color:grey;color:white;line-height:0.728571;">Back</button>
											</div>
										</form>		
										</c:if>
										</fieldset>
							    	</div>
							   </div>
						  </div>
					 </div>
				 </div>
			</div>
			<center><div class="modal fade" id="myModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true" style="top:150px;">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding:.5rem;">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<center>
							 <div class="modal-body">
								<table>
									<tr>
										<th>Bill Rate : </th>
										<th>Pay Rate : </th>
										<td style="padding: 6px;"><strong><span
												style="color:red" id="brate"></span></strong></td>
										<td style="padding: 6px;"><strong><span
												style="color:red" id="prate"></span></strong></td>		
									</tr>
								</table>
							</div>
							<b><span style="color: red"> Pay rate is greater than Bill rate. Please confirm again.</span></b>
							</center>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary" onclick="submitForm()">Ok</button>
							</div>
						</div>
					</div>
				</div></center>
				
	<center>
		<div class="modal fade" id="DocumentHistoryModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="top:90px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content" style="width:175%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
						<div class="modal-body">							
					   		<table id="sampleTable2" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>FileName</th>
								<th>FileType</th>								
								<th>Start Date</th>
								<th>End Date</th>
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
<div class="modal fade" id="addinhouseporejectmodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-sm" style="max-width: 40%;"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b>Add In-house project</b>
								</h5>
							</div>

							<div class="modal-body">
								<form action="/" enctype="multipart/form-data"
									id="addInhouseForm" autocomplete="off">
									<input type="hidden" name="candidateid" id="in_candidateid">
									<input type="hidden" name="emp_type" id="in_emptype">
									<input type="hidden" name="dbdate" id="dbdate">
									<input type="hidden" name="payrateid" id="in_payrateid">
									
									<div class="row">
										<div class="col-md-12 col-sm-12">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red">*</span>Project Name</label>
												<div class="col-sm-6">
													<input type="text" id="in_projectname" name="projectname"
														class="form-control" placeholder="Project Name" />

												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red">*</span> Start Date</label>
												<div class="col-sm-6">
													<input type="text" id="in_startdate" name="in_startdate"
														class="form-control" onkeydown="return true"
														placeholder="Start Date" />
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span> End Date</label>
												<div class="col-sm-6">
													<input type="text" id="in_enddate"
														name="in_enddate" class="form-control" autocomplete="off"
														onkeydown="return true" placeholder="End Date" />
												</div>
											</div>
											<div class="form-group row">
											<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Timesheet Type</label>
											   <div class="col-sm-6">
											   
											   <select name="payrolltype" class="form-control text-left" id="payrolltype">
										             <option value="">--Select Timesheet Type--</option>
										             <option value="Weekly">Weekly</option>
										             <option value="Bi-Weekly1">Bi-Weekly1</option>
										             <option value="Bi-Weekly2">Bi-Weekly2</option>
										             <option value="Semi-Monthly">Semi-Monthly</option>
										             <option value="Monthly">Monthly</option>
										         </select>
												</div>
										    </div>
											
											<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>Line1</label>
													<div class="col-sm-6">
														<input id="in_line1" type="text" minlength="2"
															maxlength="80" required title="only alpha numerics are allowed"
															placeholder="Line1" name="in_line1"
															class="form-control">
													</div>
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;"></Span>Line2</label>
													<div class="col-sm-6">
														<input id="in_line2" type="text"
															pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*" minlength="2"
															maxlength="80" title="only alpha numerics are allowed"
															placeholder="line2" name="in_line2" class="form-control">
													</div>
													<!-- pattern="^[a-zA-Z\s]+$" -->
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>City</label>
													<div class="col-sm-6">
														<input id="in_city" type="text" minlength="2"
															maxlength="40" required
															title="only Characters are allowed" placeholder="City"
															name="in_city" class="form-control">
													</div>
													<!--pattern="^[a-zA-Z\s]+$" " -->
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>State</label>
													<div class="col-sm-6">
														<input id="in_state" type="text" minlength="2"
															maxlength="25" title="only Characters are allowed"
															autocomplete="off" placeholder="State" name="in_state"
															class="form-control" required>
													</div>
													<!-- pattern="^[a-zA-Z\s]+$" -->
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>Zip Code</label>
													<div class="col-sm-6">
														<input id="in_zipcode" type="text" required
															title="only alphabets are allowed" pattern="[0-9]{5}"
															minlength="5" maxlength="5" placeholder="Zip Code"
															name="in_zipcode" class="form-control">
													</div>
													<!-- pattern="^[a-zA-Z\s]+$" -->
												</div>
										</div>
									</div>
									<div class="text-center ml-5">
										<button type="button" class="btn btn-info btn-sm" id="inhousesubmitid">Save</button>
										<button type="button" data-dismiss="modal" class="btn btn-info btn-sm" id="btn-colorb">Close</button>
									</div>
								</form>
								<br />
								<br />
							</div>
						</div>
					</div>
				</div>	
	<center>
		<div class="modal fade" id="DocumentVendorHistoryModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="top:90px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content" style="width:175%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
						<div class="modal-body">							
					   		<table id="sampleTable3" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>FileName</th>
								<th>FileType</th>
								<th>InputValue</th>									
								<th>Start Date</th>
								<th>End Date</th>
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
				
			</div>
			
			  <form action="searchlist" method="post" id="bformid" style="display: none;">
				<input type="text"  name="semp_type"  value="${semp_type}">
				<input type="text" name="susername"  value="${susername}">
  	        	<input type="text"  name="sfullname"  value="${sfullname}">
			    <input type="text"  name="spendingdocs"  value="${spendingdocs}">
			    <input type="text" name="s_subtype"  value="${s_subtype}">
			    <input type="hidden" name="empstatus" value="${sempstatus}">
				</form>
			
			
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
<script type="text/javascript" src="resources/js/js/select2.min.js"></script>
<script src="resources/preDefined/goback.js"></script>
 <script  type="text/javascript">
 $('#customertype').select2({	
	    placeholder: "Select Customer",
	});
 
var othercl=0;
var MAX_OPTIONS = 3;
var otherloc=0;
var MAXOPTIONS = 3;
$('#addClientVendorForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {	
    	project_name: {
            validators: {
            	isEmpty: {
                    message: 'Project Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Project Name must be more than 2 and less than 100 characters long.'
                },
                regexp: {
                   regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                    message: ' Project Name accepts alphabets and spaces. Spaces are not allowed at the beginning or end of the Name'
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
        fed_id : {
            validators: {
            	 /* notEmpty: {
                    message: 'Federal ID is mandatory'
                }, */
                stringLength: {
                    min: 10,
                    max: 10,
                    message: 'Federal ID should be 9 digits'
                },
                regexp: {
                   regexp: /^([07][1-7]|1[0-6]|2[0-7]|[35][0-9]|[468][0-8]|9[0-589])-\d{7}$/,
                   message: 'Please enter valid Federal ID'
                },
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
        client_mgr_name: {
            validators: {
            	/* notEmpty: {
                    message: 'End Client Manager Name is mandatory'
                }, */
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'End Client Manager Name must be more than 2 and less than 100 characters long'
                },
                regexp: {
                	regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                    message: 'End Client Manager name accepts alphabets and Space allowed but is not at beginning or end of the word'
                }
            }
        },
        client_mgr_emailid:{
            validators: {
            	/* notEmpty: {
                    message: 'End Client Manager e-mail is mandatory'
            	 }, */
                 stringLength: {
                 min: 10,
                 max: 80,
                 message: 'End Client Manager e-mail must be more than 10 and less than 80 characters long'
                },
                  regexp: {
             	regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
                 message: 'Please enter valid e-mail ID'
             }
           }
      }, 
      mgrdeskNumber:{
          validators: {
        	  isEmpty: {
                  message: 'End Client Manager Desk Number is Not mandatory'
          	  },
               stringLength: {
               min: 12,
               max: 12,
               message: 'End Client Manager Desk Number must be more 10 or Not less than 10 Numbers long'
              }
          }
      },
      emp_emailid:{
          validators: {
          	/* notEmpty: {
                  message: 'Employee Email at Client Location is mandatory'
          	 }, */
               stringLength: {
               min: 10,
               max: 80,
               message: 'Employee e-mail at Client Location must be more than 10 and less than 80 characters long'
              },
                regexp: {
           	regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
               message: 'Please enter valid e-mail ID'
           }
         }
    }, 
    empdeskNumber:{
        validators: {
        	isEmpty: {
                message: 'Employee Desk Number at Client Location is Not mandatory'
        	 },
             stringLength: {
             min: 12,
             max: 12,
             message: 'Employee Desk Number at Client Location must be more 10 or Not less than 10 Numbers long'
            }
        }
     },
     customertype:{
         validators: {
         	notEmpty: {
                 message: 'Please select Customer'
             }
         }
     },
     vendortype:{
         validators: {
         	notEmpty: {
                 message: 'Please select Vendor'
             }
         }
     },
  invoice_terms:{
            validators: {
            	notEmpty: {
                    message: 'Invoice Terms is mandatory'
            	 }/* ,
                 regexp: {
                	 regexp: /^[a-zA-Z0-9]+( [a-zA-Z0-9]+)*$/,
                 message: 'Payment Terms accepts alphanumerical and Space allowed but is not at beginning or end of the word'
                  } */
               }
           },
           invoice_period:{
               validators: {
               	notEmpty: {
                       message: 'Invoice Period mandatory'
                   }
               }
           },         
        bill_rate:{
            validators: {
               notEmpty: {
                    message: 'Bill Rate is mandatory'
            },
           stringLength: {
                min: 2,
                max: 7,
                message: 'Bill Rate must be 2 digits and less than 7 digits long'
               },
            regexp: {
            	//regexp: /^(?:(?:0|[1-9][0-9]+\.[0-9]{2}))$/,
            	regexp: /^[1-9][0-9]*([.][0-9]{1,2}|)$/,
                message: 'Bill Rate accepts digits and max two decimals'
             }
           }
       },
       pro_startdate:{
           validators: {
           	notEmpty: {
                   message: 'Project Start Date is mandatory'
               },
               date: {
                   format: 'MM/DD/YYYY',
                   message: 'invalid Date'
               }
           }
       },
       
       pro_enddate:{
           validators: {
           	notEmpty: {
                   message: 'Project End Date is mandatory'
               },
               date: {
                   format: 'MM/DD/YYYY',
                   message: 'invalid Date'
               }
           }
       },
       payrolltype:{
           validators: {
           	notEmpty: {
                   message: 'Please Choose timesheet type'
               }
           }
       },
       cw_order:{
           validators: {
        	   notEmpty: {
                   message: 'Customer Work Order is mandatory'
               }/* ,
               file: {
				        extension: 'msg',
                   type: 'application/msg',
					maxSize: 50*1024*1024,
					message: 'The selected file is not valid or file size greater than 50MB'
              } */
            }
        },
      mgr_approved_mail_CWO:{  
            validators: {
          	  notEmpty: {
                         message: 'Manager Approved e-mail proof is mandatory'
                      }/* ,
                 file: {
					      extension: 'msg',
                          type: 'application/msg',
 					      maxSize: 50*1024*1024,
					      message: 'The selected file is not valid or file size greater than 50MB'
                   }  */
             }
        },
       payment_terms:{
           validators: {
           	notEmpty: {
                   message: 'Payment Terms is mandatory'
           	 },
                regexp: {
                	regexp: /^[a-zA-Z0-9]+( [a-zA-Z0-9]+)*$/,
                message: 'Payment Terms accepts alphanumerical and Space allowed but is not at beginning or end of the word'
                 }
              }
          },
        pay_rate:{
              validators: {
                 notEmpty: {
                      message: 'Pay Rate is mandatory'
                  }
              },
              stringLength: {
                  min: 2,
                  max: 7,
                  message: 'Pay Rate must be 2 digits and less than 7 digits long'
                 },
              regexp: {
              	 // regexp: /^(?:(?:0|[1-9][0-9]+\.[0-9]{2}))$/,
              	 regexp: /^[1-9][0-9]*([.][0-9]{1,2}|)$/,
                  message: 'Pay Rate accepts digits and max two decimals'
              }
         },
         w_order:{
            validators: {
            	notEmpty: {
                    message: 'Vendor Work Order is mandatory'
                }
             }
         },
         cagreement:{
             validators: {
            	 notEmpty: {
                     message: 'Consultant Compliance is mandatory'
                 }
              }
          },
          cCompliance:{  
              validators: {
            	  notEmpty: {
                      message: ' Consultant Consent Agreement is mandatory'
                  }
               }
          },
          mgr_approved_mail_VWO:{  
              validators: {
            	  notEmpty: {
                      message: 'Manager Approved e-mail proof is mandatory'
                  }/* ,
                file: {
					        extension: 'msg',
                            type: 'application/msg',
   					        maxSize: 50*1024*1024,
  					        message: 'The selected file is not valid or file size greater than 50MB'
                     }  */
                }
          },
          cwofromdate: {
        	  enabled: false,
	            validators: {
	            	 notEmpty: {
	   	                    message: 'Start Date is mandatory'
	   	                },
	                regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please enter Start Date in MM/DD/YYYY format'
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'Start Date is not a valid, please enter in MM/DD/YYYY format'
	                }
	            }
	        },
	        cwoexpirydate: {
	           enabled: false,
	            validators: {
	            	 notEmpty: {
	   	                    message: 'End Date is mandatory'
	   	                },
	                regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please enter End Date in MM/DD/YYYY format'
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'End Date is not a valid, please enter in MM/DD/YYYY format'
	                }
	            }
	        },
	        vwofromdate: {
	        	enabled: false,
	            validators: {
	            	 notEmpty: {
	   	                    message: 'Start Date is mandatory'
	   	                },
	                regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please enter Start Date in MM/DD/YYYY format'
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'Start Date is not a valid, please enter in MM/DD/YYYY format'
	                }
	            }
	        },
	        vwoexpirydate: {
	           enabled: false,
	            validators: {
	            	 notEmpty: {
	   	                    message: 'End Date is mandatory'
	   	                },
	                regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please enter End Date in MM/DD/YYYY format'
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'End Date is not a valid, please enter in MM/DD/YYYY format'
	                }
	            }
	        },
	        ccfromdate: {
    	   		enabled: false,
	   	            validators: {
	   	                notEmpty: {
	   	                    message: 'Start Date is mandatory'
	   	                },
	   	                regexp: {
	   	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	   	                    message: 'please enter Start Date in MM/DD/YYYY format. '
	   	                },
	   	                date: {
	   	                    format: 'MM/DD/YYYY', 
	   	                    message: 'Start Date is not a valid, please enter in MM/DD/YYYY format'
	   	                }
	   	            }
	   	        },
	   	     ccexpirydate: {
	   	    	enabled: false,
	   	            validators: {
	   	                 notEmpty: {
	   	                    message: 'End Date is mandatory'
	   	                },
	   	                regexp: {
	   	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	   	                    message: 'please enter End Date in MM/DD/YYYY format. '
	   	                },
	   	                date: {
	   	                    format: 'MM/DD/YYYY', 
	   	                    message: 'End Date is not a valid, please enter in MM/DD/YYYY format'
	   	                }
	   	            }
	   	        },
	   	     'lca_othr_line1[]' : {
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
		        'lca_othr_line2[]' : {
		            validators: {
		            	 isEmpty: {
		                    message: 'Line2 is mandatory'
		                },
		                stringLength: {
		                    min: 2,
		                    max: 80,
		                    message: 'Line2 should have minimum 2 and maximum 80 characters '
		                },
		                regexp: {
		                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
		                  message: 'Line2 accepts alpha numerics '
		                },
		            }
		        },
		        'lca_othr_city[]' : {
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
		        'lca_othr_state[]' : {
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
		        'lca_othr_zipcode[]' : {
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
		    'lca_othr_remote_metro[]' : {
		            validators: {
		            	notEmpty: {
		                    message: 'MetroPolitan Area is mandatory'
		                },
		                stringLength: {
		                	min: 2,
		                    max: 25,
		                    message: 'MetroPolitan Area should have 2 characters'
		                },
		                regexp: {
		                	//regexp: /^[a-zA-Z\s]+$/,
		                   regexp: /^[a-zA-Z]+(-[a-zA-Z]+)*$/,
		                   message: 'MetroPolitan Area accepts characters'
		                },
		            }
		        },           
	   	 'othr_client_type[]':{
		          validators: {
		           	notEmpty: {
		                   message: 'Please select Type of client '
		               }
		           }
		       },        
          'othr_client_name[]': {
        	  validators: {
	              	notEmpty: {
	                      message: 'Other Client Name is mandatory'
	                  },
	                  stringLength: {
	                      min: 2,
	                      max: 100,
	                      message: 'Other Client Name must be more than 2 and less than 100 characters long'
	                  },
	                  regexp: {
	                	  regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
	                      message: 'Other Client Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
	                  }
	              }
	          },
	          'othr_fed_id[]': {
	               validators: {
	               	/* notEmpty: {
	                       message: 'Federal ID is mandatory'
	                   }, */
	                 stringLength: {
	                       min: 10,
	                       max: 10,
	                       message: 'Federal ID should be 9 digits'
	                   },
	                   regexp: {
	                	   regexp: /^([07][1-7]|1[0-6]|2[0-7]|[35][0-9]|[468][0-8]|9[0-589])-\d{7}$/,
	                       message: 'Please enter valid Federal ID'
	                   }  
	               }
	           },
	           'othr_client_mgr[]': {
	               validators: {
	               	/* notEmpty: {
	                       message: 'Other Client Manager Name is mandatory'
	                   }, */
	                   stringLength: {
	                       min: 2,
	                       max: 100,
	                       message: 'Other Client Manager Name must be more than 2 and less than 100 characters long'
	                   },
	                   regexp: {
	                	   regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
	                       message: 'Other Client Manager Name accepts of alphabets and and Space allowed but is not at beginning or end of the word'
	                   }
	                   
	               }
	           
	           },
	          'othr_client_mgr_email[]':{
	               validators: {
	               	/* notEmpty: {
	                       message: 'Other Client Manager e-mail is mandatory'
	               	 }, */
	                    stringLength: {
	                    min: 10,
	                    max: 80,
	                    message: 'Other Client Manager e-mail must be more than 10 and less than 80 characters long'
	                   },
	                     regexp: {
	                	regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
	                    message: 'Please enter valid e-mail ID'
	                }
	              }
	         }, 
	         'othr_client_mgr_extn[]':{ 
	             validators: {
	           	  isEmpty: {
	                     message: 'End Client Manager Desk Number is Not mandatory'
	             	 },
	                  stringLength: {
	                  min: 12,
	                  max: 12,
	                  message: 'End Client Manager Desk Number must be more 10 or Not less than 10 Numbers long'
	                 }
	             }
	         },
	         'othr_emp_email_client[]':{
	             validators: {
	             /* 	notEmpty: {
	                     message: 'Employee Email at Client Location is mandatory'
	             	 }, */
	                  stringLength: {
	                  min: 10,
	                  max: 80,
	                  message: 'Employee e-mail at Client Location must be more than 10 and less than 80 characters long'
	                 },
	                   regexp: {
	              	regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
	                  message: 'Please enter valid e-mail ID'
	              }
	            }
	       }, 
	       'othr_emp_client_extn[]':{
	           validators: {
	           	isEmpty: {
	                   message: 'Employee Desk Number at Client Location is Not mandatory'
	           	 },
	                stringLength: {
	                min: 12,
	                max: 12,
	                message: 'Employee Desk Number at Client Location must be more 10 or Not less than 10 Numbers long'
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
	        reason_lca : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Please select reason fo filing LCA'
	                }
	            }
	          }, 
		    education : {
		            validators: {
		            	 notEmpty: {
		                    message: 'Education is mandatory'
		                },
		                stringLength: {
		                    min: 2,
		                    max: 80,
		                    message: 'Education should have minimum 2 and maximum 80 characters '
		                },
		                regexp: {
		                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
		                  message: 'Education accepts alpha numerics '
		                },
		            }
		        },
		        cand_job_title : {
		            validators: {
		            	notEmpty: {
		                    message: 'Job Title is mandatory'
		                },
		                stringLength: {
		                    min: 2,
		                    max: 100,
		                    message: 'Job Title min length 4 and max length 20 '
		                },
		                regexp: {
		                	regexp: /^(?!\d\s+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &():\/\\-]*)?$/,
		                    message: 'Job Title accepts alphanumeric, specical characters like &-()/: allowed and Space allowed but is not at beginning or end of the word'
		                },
		            }
		        },
	   wageRate : {
		            validators: {
		            	notEmpty: {
		                    message: 'Wage Rate is mandatory'
		                },
		                stringLength: {
		                	min: 2,
		                    max: 10,
		                    message: 'Wage Rate should have 2 digits'
		                },
		                regexp: {
		                	//regexp: /^[0-9]*$/,
		                	//regexp: /^[0-9]*\.[0-9]{2}/,
		                	regexp: /^[0-9]+(\.[0-9]{2})?$/,
		                    message: 'Wage Rate accepts digits'
		                }
		            }
		        }, 
		        wr_option : {
		            validators: {
		            	notEmpty: {
		                    message: 'Please select one option'
		                }
		            }
		        },
		   	   lcaBeginDate: {
			            validators: {
			            	notEmpty: {
			                    message: 'LCA Begin Date is mandatory'
			                },
			                regexp: {
			                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
			                    message: 'please enter LCA Begin Date in MM/DD/YYYY format'
			                },
			                date: {
			                    format: 'MM/DD/YYYY', 
			                    message: 'LCA Begin Date is not a valid, please enter in MM/DD/YYYY format'
			                }
			            }
			        },
			        lcaEndDate: {
			            validators: {
			            	notEmpty: {
			                    message: 'LCA End Date is mandatory'
			                },
			                regexp: {
			                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
			                    message: 'please enter LCA End Date in MM/DD/YYYY format'
			                },
			                date: {
			                    format: 'MM/DD/YYYY', 
			                    message: 'LCA End Date is not a valid, please enter in MM/DD/YYYY format'
			                }
			            }
			        },
			        lcaPostedDate: {
			            validators: {
			            	notEmpty: {
			                    message: 'LCA Filing Date is mandatory'
			                },
			                regexp: {
			                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
			                    message: 'please enter LCA End Date in MM/DD/YYYY format'
			                },
			                date: {
			                    format: 'MM/DD/YYYY', 
			                    message: 'LCA End Date is not a valid, please enter in MM/DD/YYYY format'
			                }
			            }
			        },
		        remote_county : {
		            validators: {
		            	notEmpty: {
		                    message: 'County is mandatory'
		                },
		                stringLength: {
		                    min: 4,
		                    max: 20,
		                    message: 'County min length 4 and max length 20 '
		                },
		                regexp: {
		                	regexp: /[a-zA-Z]/,
		                    message: 'County accepts character'
		                },
		            }
		        },
		        remote_soc_code : {
		            validators: {
		            	notEmpty: {
		                    message: 'Soc Code is mandatory'
		                }/* ,
		                stringLength: {
		                    min: 7,
		                    max: 7,
		                    message: 'Soc Code must be 6 digits'
		                },
		                regexp: {
		                	regexp: /[0-9]{2}-[0-9]{4}/,
		                    message: 'Soc Code accepts digits'
		                }, */
		            }
		        },
		        metro_politan_area : {
		            validators: {
		            	notEmpty: {
		                    message: 'MetroPolitan Area is mandatory'
		                },
		                stringLength: {
		                	min: 2,
		                    max: 25,
		                    message: 'MetroPolitan Area should have 2 characters'
		                },
		                regexp: {
		                	//regexp: /^[a-zA-Z\s]+$/,
		                	regexp: /^[a-zA-Z]+(-[a-zA-Z]+)*$/,
		                   message: 'MetroPolitan Area accepts characters'
		                },
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
		     },
		 remote_metro_politan_area: {
		            validators: {
		            	notEmpty: {
		                    message: 'MetroPolitan Area is mandatory'
		                },
		                stringLength: {
		                	min: 2,
		                    max: 25,
		                    message: 'MetroPolitan Area should have 2 characters'
		                },
		                regexp: {
		                	//regexp: /^[a-zA-Z\s]+$/,
		                   regexp: /^[a-zA-Z]+(-[a-zA-Z]+)*$/,
		                   message: 'MetroPolitan Area accepts characters'
		                },
		            }
		        }
    }
}).on('click', '.addButtonloc', function() {
	otherloc++;
	/* $('#element').removeAttr('style'); */
     var $template = $('#addOtherLocation'),
         $clone    = $template
                         .clone()
                         .removeAttr('style')
                         .removeAttr('id')
                         .attr('data-book-index', otherloc)
                         .insertAfter($template);

     // Add new field
     $('#addClientVendorForm')
     .formValidation('addField', $clone.find('[name="lca_othr_line1[]"]'))
     .formValidation('addField', $clone.find('[name="lca_othr_line2[]"]'))
     .formValidation('addField', $clone.find('[name="lca_othr_city[]"]'))
     .formValidation('addField', $clone.find('[name="lca_othr_state[]"]'))
     .formValidation('addField', $clone.find('[name="lca_othr_zipcode[]"]'))
     .formValidation('addField', $clone.find('[name="lca_othr_remote_metro[]"]'));
 })
 .on('click', '.removeButtonloc', function() {
        var $row  = $(this).parents('.form-group'),
        index = $row.attr('data-book-index');
        $lca_othr_line1 = $row.find('[name="lca_othr_line1[]"]');

     // Remove fields
     $('#addClientVendorForm')
          .formValidation('removeField', $row.find('[name="lca_othr_line1[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="lca_othr_line2[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="lca_othr_city[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="lca_othr_state[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="lca_othr_remote_metro[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="lca_othr_zipcode[' + index + ']"]'))
          .formValidation('removeField', $lca_othr_line1);

     // Remove element containing the fields
     $row.remove();
       })
       .on('added.field.fv', function(e, data) {
           if (data.field === 'lca_othr_line1[]') {
               if ($('#addClientVendorForm').find(':visible[name="lca_othr_line1[]"]').length >= MAXOPTIONS) {
                   $('#addClientVendorForm').find('.addButtonloc').attr('disabled', 'disabled');
               }
             }
        })
        .on('removed.field.fv', function(e, data) {
            if (data.field === 'lca_othr_line1[]') {
                 if ($('#addClientVendorForm').find(':visible[name="lca_othr_line1[]"]').length <= MAXOPTIONS) {
                     $('#addClientVendorForm').find('.addButtonloc').removeAttr('disabled');
                 }
             }
}).on('click', '.addButtonclient', function() {
	othercl++;
	/* $('#element').removeAttr('style'); */
     var $template = $('#addotherclient'),
         $clone    = $template
                         .clone()
                         .removeAttr('style')
                         .removeAttr('id')
                         .attr('data-book-index', othercl)
                         .insertAfter($template);

     // Add new field
     $('#addClientVendorForm')
     .formValidation('addField', $clone.find('[name="othr_client_type[]"]'))
     .formValidation('addField', $clone.find('[name="othr_client_name[]"]'))
     .formValidation('addField', $clone.find('[name="othr_client_addr[]"]'))
     .formValidation('addField', $clone.find('[name="othr_client_mgr[]"]'))
     .formValidation('addField', $clone.find('[name="othr_client_mgr_email[]"]'))
     .formValidation('addField', $clone.find('[name="othr_client_mgr_extn[]"]'))
     .formValidation('addField', $clone.find('[name="othr_emp_email_client[]"]'))
     .formValidation('addField', $clone.find('[name="othr_line1[]"]'))
     .formValidation('addField', $clone.find('[name="othr_line2[]"]'))
     .formValidation('addField', $clone.find('[name="othr_city[]"]'))
     .formValidation('addField', $clone.find('[name="othr_state[]"]'))
     .formValidation('addField', $clone.find('[name="othr_zipcode[]"]'))
     .formValidation('addField', $clone.find('[name="othr_fed_id[]"]'))
     .formValidation('addField', $clone.find('[name="othr_emp_client_extn[]"]'));
 })

 .on('click', '.removeButtonclient', function() {
     var $row  = $(this).parents('.form-group'),
         index = $row.attr('data-book-index');
        $othr_client_name = $row.find('[name="othr_client_name[]"]');

     // Remove fields
     $('#addClientVendorForm')
     	  .formValidation('removeField', $row.find('[name="othr_client_type[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_client_name[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_client_addr[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_client_mgr[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_client_mgr_email[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_client_mgr_extn[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_emp_email_client[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_emp_client_extn[' + index + ']"]'))
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
               if ($('#addClientVendorForm').find(':visible[name="othr_client_name[]"]').length >= MAX_OPTIONS) {
                   $('#addClientVendorForm').find('.addButtonclient').attr('disabled', 'disabled');
               }
           }
        })
        .on('removed.field.fv', function(e, data) {
            if (data.field === 'othr_client_name[]') {
                 if ($('#addClientVendorForm').find(':visible[name="othr_client_name[]"]').length <= MAX_OPTIONS) {
                     $('#addClientVendorForm').find('.addButtonclient').removeAttr('disabled');
                 }
             }
         })
.on('click', '[name="myCheck"]', function() {
	 var emptype= $('#emp_type').val();
     var checkBox = document.getElementById("myCheck");
	  if(emptype=='1099' || emptype=='W2' || emptype=='C2C' ){
		  if (checkBox.checked == true){
		//	alert("1099***w2employee***if**"+emptype+"// if ///"+checkBox.checked);
			    $("#map").show();
			    $("#vlab").hide();
			    $("#cw_order").val('');
			    $('#addClientVendorForm').formValidation('enableFieldValidators','cw_order',false);
			    $('#addClientVendorForm').formValidation('enableFieldValidators', 'mgr_approved_mail_CWO',true);
			    document.getElementById('cw_order').disabled=true;
		  }else{
			  //alert("1099***w2employee***else**"+emptype+"\\else\\"+checkBox.checked);
			  $("#map").hide();
			  $("#vlab").show();
			  $("#mgr_approved_mail_CWO").val('');
			  $('#addClientVendorForm').formValidation('enableFieldValidators','cw_order',true);
			  $('#addClientVendorForm').formValidation('enableFieldValidators', 'mgr_approved_mail_CWO',false);
			  document.getElementById('cw_order').disabled=false;
		  }
	  }
  })
.on('click', '[name="myCheck1"]', function() {
	 var emptype= $('#emp_type').val();
    var checkBox = document.getElementById("myCheck1");
    if (checkBox.checked == true){
    	 //alert("***C2C***if**"+emptype+"// if ///"+checkBox.checked);
			    $("#map2").show();
			    $("#vlab1,#vlab2,#vlab3").hide();
			    $("#w_order,#cagreement,#cCompliance").val('');
			    $('#addClientVendorForm').formValidation('enableFieldValidators','w_order',false); 
			    $('#addClientVendorForm').formValidation('enableFieldValidators','cagreement',false);
			    $('#addClientVendorForm').formValidation('enableFieldValidators','cCompliance',false);
			    $('#addClientVendorForm').formValidation('enableFieldValidators', 'mgr_approved_mail_VWO',true);
			      
		  } else {
			//  alert("***C2C***if**"+emptype+"// else ///"+checkBox.checked);
			  $("#map2").hide();
			  $("#vlab1,#vlab2,#vlab3").show();
			  $("#mgr_approved_mail_VWO").val('');
			  $('#addClientVendorForm').formValidation('enableFieldValidators','w_order',true);
			  $('#addClientVendorForm').formValidation('enableFieldValidators','cagreement',true);
			  $('#addClientVendorForm').formValidation('enableFieldValidators','cCompliance',true);
			  $('#addClientVendorForm').formValidation('enableFieldValidators', 'mgr_approved_mail_VWO',false);
		  }
}).on('click', '[name="workinglocation"]', function(e) {
     var checkBox = document.getElementById("workinglocation");
	 if (checkBox.checked == true){
		//alert("**if***"+checkBox.checked);
	    $("#remoteAddress").show();
	    $('#addClientVendorForm').formValidation('enableFieldValidators','remote_line1',true);
	    $('#addClientVendorForm').formValidation('enableFieldValidators','remote_line2',true);
	    $('#addClientVendorForm').formValidation('enableFieldValidators','remote_city',true);
	    $('#addClientVendorForm').formValidation('enableFieldValidators','remote_state',true);
	    $('#addClientVendorForm').formValidation('enableFieldValidators','remote_zipcode',true);
	    $('#addClientVendorForm').formValidation('enableFieldValidators','remote_county',true);
	    $('#addClientVendorForm').formValidation('enableFieldValidators','remote_soc_code',true);
     }else if(checkBox.checked == false){
		//alert("**else**"+checkBox.checked);
        $("#remoteAddress").hide();
        $('#addClientVendorForm').formValidation('enableFieldValidators','remote_line1',false);
	    $('#addClientVendorForm').formValidation('enableFieldValidators','remote_line2',false);
	    $('#addClientVendorForm').formValidation('enableFieldValidators','remote_city',false);
	    $('#addClientVendorForm').formValidation('enableFieldValidators','remote_state',false);
	    $('#addClientVendorForm').formValidation('enableFieldValidators','remote_zipcode',false);
	    $('#addClientVendorForm').formValidation('enableFieldValidators','remote_county',true);
	    $('#addClientVendorForm').formValidation('enableFieldValidators','remote_soc_code',true);
     } 
});
</script> 
    <script type="text/javascript">
  function loadcustomer(){
	  getsesVal().done(function(data){
			if(data!=""){
 	 var custid=document.getElementById('customertype').value;
 	//var emp_type= $('#emp_type').val();
/* 	if(emp_type=='1099' || emp_type=='W2Employees' ){
		 $("#client").show();
		 $("#add").show();
	  } */
 	 if(custid=="AddCustomerDetails"){
 	    	window.location.href="USOBTAddCustomer_C2C.jsp?empno=${empobj.emp_number}";
 		 }else {
 			 $.ajax({
 		    	type : "GET",
 		        asyn : false,
 		        contentType: "application/json", // NOT dataType!
 		        url  :"CustomerDetailsById",
 		        data:{custid:custid},
 		        success  : function(response){
 		            var fname = response.fileName;
		          	var encoded = encodeURIComponent(fname);
		          	var cust = response.custObj;
		          	var cust_address = response.custAddressObj;
		          	var caddress=cust_address.line1+","+cust_address.line2+","+cust_address.city+","+cust_address.state+","+cust_address.zipcode;
		          	$("#customer_name").val(cust.customer_name);
		          	$("#customer_add").val(caddress);
		          	$("#customer_phne_no").val(cust.customer_contact_no);
		          	$("#customer_mgr_emailid").val(cust.mgr_email);
 		       if(response.fileType=="Manager_Approved_Email_CMSA"){
 		    	  $( "#uploadmam" ).empty();
 		    	  $( "#uploadMsa" ).empty();
 		    	  $( "#uploadMsa" ).append('<a>NA</a>');
 		    	  $("#upmam").show();
 		    	 $("#MsaDates").hide();
 		    	  $( "#uploadmam" ).append('<a href="downloadocs?filetype='+response.fileType+'&filename='+encoded+'&customerName='+cust.customer_name+'" style="color:blue">'+response.fileName+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewCustomerDocHistory(\''+response.fileId+'\',\''+response.fileType+'\');"><i class="fa fa-history"></i></a>'); 
 		       }else {
 		    	  $("#MsaDates").show();
 		    		var sdate="";var edate="";
		          	if(response.startdate!=null){
		          		sdate=response.startdate;
		          		$("#MsaSd").show();
		          		$("#csdate").text(sdate);
		          	}else{
		          		$("#MsaSd").hide();
		          		$("#csdate").text('');
		          	}
				if(response.expirydate!=null){
					edate=response.expirydate;
					$("#MsaEd").show();
	          		$("#cedate").text(edate);
		          	}else{
		          		$("#MsaEd").hide();
		          		$("#cedate").text('');
		          	}
 		    	  $( "#uploadMsa" ).empty();
 		    	  $( "#uploadmam" ).empty();
 		    	  $("#upmam").hide();
 		    //	 <br><label>Start Date : <span>'+sdate+'</span></label>&nbsp&nbsp&nbsp&nbsp<label>End Date : <span>'+edate+'</span></label>
 		          $("#uploadMsa").append('<a href="downloadocs?filetype='+response.fileType+'&filename='+encoded+'&customerName='+cust.customer_name+'" style="color:blue">'+response.fileName+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewCustomerDocHistory(\''+response.fileId+'\',\''+response.fileType+'\');"><i class="fa fa-history"></i></a>');  
 		      } 
 		       $("#invoice_terms,#bill_rate,#pro_startdate,#pro_enddate,#cw_order").attr("required", true);
 		     $( "#customerDiv" ).show();
 		      $("#pro_startdate").datepicker({
  				changeMonth:true,
  				changeYear:true,
  			})
              .on('changeDate', function(e) {
                  $('#addClientVendorForm').formValidation('revalidateField', 'pro_startdate');
                //  $('#pro_enddate').datepicker('setStartDate', new Date($(this).val()));
              });
              
              $("#pro_enddate").datepicker({
  				changeMonth:true,
  				changeYear:true,
  				
  			})
              .on('changeDate', function(e) {
                  $('#addClientVendorForm').formValidation('revalidateField', 'pro_enddate');
                 // $('#pro_startdate').datepicker('setEndDate', new Date($(this).val()));
              });          
 		     
 		        }
 			    });
 		  }
	}else{
				 window.location.href="loginpage";
			}
		});
  }	 
</script>
<script type="text/javascript">
function btnClick(){
	getsesVal().done(function(data){
		if(data!=""){
    var emptype= $('#emp_type').val();
	var brt=document.getElementById("bill_rate").value;
	var prt=document.getElementById("pay_rate").value;
	//alert("Brate"+brt+"Prate"+prt);
	 $('#addClientVendorForm').formValidation('validate');
	if( !$('#addClientVendorForm').data('formValidation').isValid())
		 {
		   // alert("Not Valid");
		 }
	else{
		if(emptype=='C2C'){
			if(parseInt(prt)>=parseInt(brt)){
			$('#brate').text(brt);
			$('#prate').text(prt);
			$('#myModal').modal('show');
	 	}else{
	 		//alert("Yes Valid");
	 		//document.getElementById("addClientVendorForm").submit();
	 	$("#btnSubmit").attr("disabled", true);
		var form = $('#addClientVendorForm')[0];
		var data = new FormData(form);
		$.ajax({
			url : "saveClientCustomerDetails", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(response) {
				 if(response!=null || response!=""){
				     var message=response.message;
		   	         var candidateId=response.candidateId;
		   	         var emp_type=response.empType;
		   	         var bankstatus=response.bankstatus;
		   	      	  alert(message);
		   	       window.location.href="viewClientVendor?candidate_id="+candidateId+"&empType="+emp_type+"";
   	   	         }else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			}
		});
	 	} 
		 }else{
				$("#btnSubmit").attr("disabled", true);
				var form = $('#addClientVendorForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "saveClientCustomerDetails", //this is the submit URL
					type : "POST",
					enctype : 'multipart/form-data',
					data : data,
					processData : false,
					contentType : false,
					cache : false,
					success : function(response) {
						 if(response!=null || response!=""){
							     var message=response.message;
					   	         var candidateId=response.candidateId;
					   	         var emp_type=response.empType;
					   	         var bankstatus=response.bankstatus;
					   	      	  alert(message);
					   	       window.location.href="viewClientVendor?candidate_id="+candidateId+"&empType="+emp_type+"";
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
	
function submitForm(){
	getsesVal().done(function(data){
		if(data!=""){
	$("#btnSubmit").attr("disabled", true);
	var form = $('#addClientVendorForm')[0];
	var data = new FormData(form);
	$.ajax({
		url : "saveClientCustomerDetails", //this is the submit URL
		type : "POST",
		enctype : 'multipart/form-data',
		data : data,
		processData : false,
		contentType : false,
		cache : false,
		success : function(response) {
			 if(response!=null || response!=""){
			     var message=response.message;
	   	         var candidateId=response.candidateId;
	   	         var emp_type=response.empType;
	   	         var bankstatus=response.bankstatus;
	   	      	  alert(message);
	   	      	  window.location.href="viewClientVendor?candidate_id="+candidateId+"&empType="+emp_type+"";
	   	         }
   	   	      else{
   	   	          window.location.href="loginpage";
   	   	   	      }
		}
	});
	 $('#myModal').modal('hide');
	}else{
			 window.location.href="loginpage";
		}
	});
	}
function closeModal(){
	//$ ('#myModal').hide();
}
function goBack() {
getsesVal().done(function(data){
		if(data!=""){	
	document.getElementById("bformid").submit();
}else{
	 window.location.href="loginpage";
}
});
	}
</script>
<script type="text/javascript">

  function loadvendor(){
	 getsesVal().done(function(data){
			if(data!=""){  
	  //var emp_type= $('#emp_type').val();
 	 var venid=document.getElementById('vendortype').value;
 /* 	if(emp_type=='C2C'){
		 $("#client").show();
	} */
 	/* if(venid=="AddVendorDetails"){ */
 	if(venid==""){
     //	window.location.href="USOBTAddVendor_C2C.jsp?empno=${empobj.emp_number}";
	 }else{
		 $.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "application/json", // NOT dataType!
		        url  : "VendorDetailsById",
		        data:{venid:venid},
		        success  : function(response){
		        	var vdocObj=response.venDocsObj;
		           // var vDocsList=response.vendorDocs;
		        	var ven = response.vendObj;
		        	var ven_address = response.vendorAddressObj;
		          	var vaddress=ven_address.line1+","+ven_address.line2+","+ven_address.city+","+ven_address.state+","+ven_address.zipcode;
		          	
		        	 $("#vendor_name").val(ven.vendorname);
			         $("#vendor_add").val(vaddress);
			         $("#vendor_phne_no").val(ven.vendor_contact_no);
			         $("#vendor_mgr_emailid").val(ven.vendor_mgr_email);
			         $("#BCdocs1,#BCdocs2,#BCdocs3,#BCdocs4,#vMSA,#uplodmam").empty();
			         if(vdocObj.ven_msa!=null){
			        	   var fname=vdocObj.ven_msa;
		 		          	var encoded = encodeURIComponent(fname);
		 		          	var inputval="";
		 		          	var sdate="";var edate="";
		 		          	if(vdocObj.vmsastartdate!=null){
		 		          		sdate=vdocObj.vmsastartdate;
		 		          		$("#vMSADates").show();
		 		          		$("#vMSASd").show();
				          		$("#vMSAsdate").text(sdate);
		 		          	}else{
		 		          		$("#vMSADates").hide();
		 		          		$("#vMSASd").hide();
				          		$("#vMSAsdate").text('');
		 		          	}
							if(vdocObj.vmsaexpirydate!=null){
								edate=vdocObj.vmsaexpirydate;
								$("#vMSADates").show();
								$("#vMSAEd").show();
				          		$("#vMSAedate").text(edate);
		 		          	}else{
		 		          		$("#vMSADates").hide();
		 		          		$("#vMSAEd").hide();
				          		$("#vMSAedate").text('');
		 		          	}
				        	 $("#vMSA").append('<a href="downloadocs?filetype='+vdocObj.msafiletype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vdocObj.ven_msa+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory(\''+vdocObj.vmsafileid+'\',\''+vdocObj.msafiletype+'\',\'\');"><i class="fa fa-history"></i></a>');
			         }else{
			        	 $("#vMSADates").hide();
			         }
			         if(vdocObj.irsfilename!=null){
			        	 $("#BCdocs1Id").show();
			        	 var sdate="";var edate="";
			        	 var fname=vdocObj.irsfilename;
		 		         var encoded = encodeURIComponent(fname);
		 		        if(vdocObj.irsstartdate!=null){
	 		          		sdate=vdocObj.irsstartdate;
	 		          		$("#BCdocs1Dates").show();
	 		          		$("#BCdocs1Sd").show();
			          		$("#bcd1sdate").text(sdate);
	 		          	}else{
	 		          		$("#BCdocs1Dates").hide();
	 		          		$("#BCdocs1Sd").hide();
			          		$("#bcd1sdate").text('');
	 		          	}
						if(vdocObj.irsexpirydate!=null){
							edate=vdocObj.irsexpirydate;
							$("#BCdocs1Dates").show();
							$("#BCdocs1Ed").show();
			          		$("#bcd1edate").text(edate);
	 		          	}else{
	 		          		$("#BCdocs1Dates").hide();
	 		          		$("#BCdocs1Ed").hide();
			          		$("#bcd1edate").text('');
	 		          	}
					//	<br><label>Start Date : <span>'+sdate+'</span></label>&nbsp&nbsp&nbsp&nbsp<label>End Date : <span>'+edate+'</span></label>
						 //BCdocs1Id
			        	 $("#BCdocs1").append('<label>Executed IRS W-9 Form :</label>&nbsp&nbsp&nbsp&nbsp<a href="downloadocs?filetype='+vdocObj.bcfiletype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vdocObj.irsfilename+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory(\''+vdocObj.irsfileid+'\',\''+vdocObj.bcfiletype+'\',\''+vdocObj.irsinputval+'\');"><i class="fa fa-history"></i></a>');
			         }else{
			        	 $("#BCdocs1Dates,#BCdocs1Id").hide();
			         }
			         if(vdocObj.icfilename!=null){
			        	 $("#BCdocs2Id").show();
			        	 var sdate="";var edate="";
			        	 var fname=vdocObj.icfilename;
		 		         var encoded = encodeURIComponent(fname);
		 		         
		 		        if(vdocObj.icstartdate!=null){
	 		          		sdate=vdocObj.icstartdate;
	 		          		$("#BCdocs2Dates").show();
	 		          		$("#BCdocs2Sd").show();
			          		$("#bcd2sdate").text(sdate);
	 		          	}else{
	 		          		$("#BCdocs2Dates").hide();
	 		          		$("#BCdocs2Sd").hide();
			          		$("#bcd2sdate").text('');
	 		          	}
						if(vdocObj.icexpirydate!=null){
							edate=vdocObj.icexpirydate;
							$("#BCdocs2Dates").show();
							$("#BCdocs2Ed").show();
			          		$("#bcd2edate").text(edate);
	 		          	}else{
	 		          		$("#BCdocs2Dates").hide();
	 		          		$("#BCdocs2Ed").hide();
			          		$("#bcd2edate").text('');
	 		          	}
			        	 $("#BCdocs2").append('<label>Insurance Certificate :</label>&nbsp&nbsp&nbsp&nbsp<a href="downloadocs?filetype='+vdocObj.bcfiletype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vdocObj.icfilename+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory(\''+vdocObj.icfileid+'\',\''+vdocObj.bcfiletype+'\',\''+vdocObj.icinputval+'\');"><i class="fa fa-history"></i></a>');
			         }else{ $("#BCdocs2Dates,#BCdocs2Id").hide(); }
			         if(vdocObj.gscfilename!=null){
			        	 $("#BCdocs3Id").show();
			        	 var sdate="";var edate="";
			        	 var fname=vdocObj.gscfilename;
		 		         var encoded = encodeURIComponent(fname);
		 		        if(vdocObj.gscstartdate!=null){
	 		          		sdate=vdocObj.gscstartdate;
	 		          		$("#BCdocs3Dates").show();
	 		          		$("#BCdocs3Sd").show();
			          		$("#bcd3sdate").text(sdate);
	 		          	}else{
	 		          		$("#BCdocs3Dates").hide();
	 		          		$("#BCdocs3Sd").hide();
			          		$("#bcd3sdate").text('');
	 		          	}
						if(vdocObj.gscexpirydate!=null){
							edate=vdocObj.gscexpirydate;
							$("#BCdocs3Dates").show();
							$("#BCdocs3Ed").show();
			          		$("#bcd3edate").text(edate);
	 		          	}else{
	 		          		$("#BCdocs3Dates").hide();
	 		          		$("#BCdocs3Ed").hide();
			          		$("#bcd3edate").text('');
	 		          	}
			        	 $("#BCdocs3").append('<label>Good Standing Certificate :</label>&nbsp&nbsp&nbsp&nbsp<a href="downloadocs?filetype='+vdocObj.bcfiletype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vdocObj.gscfilename+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory(\''+vdocObj.gscfileid+'\',\''+vdocObj.bcfiletype+'\',\''+vdocObj.gscinputval+'\');"><i class="fa fa-history"></i></a>');
			         }else{ $("#BCdocs3Dates,#BCdocs3Id").hide(); }
			         if(vdocObj.cifilename!=null){
			        	 $("#BCdocs4Id").show();
			        	 var fname=vdocObj.cifilename;
		 		         var encoded = encodeURIComponent(fname);
			        	 $("#BCdocs4").append('<label>Certificate Incorporation :</label>&nbsp&nbsp&nbsp&nbsp<a href="downloadocs?filetype='+vdocObj.bcfiletype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vdocObj.cifilename+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory(\''+vdocObj.cifileid+'\',\''+vdocObj.bcfiletype+'\',\''+vdocObj.ciinputval+'\');"><i class="fa fa-history"></i></a>');
			         }else{ $("#BCdocs4Id").hide(); }
			         
			         if(vdocObj.ven_mgr_apr_mail_proof!=null){
			        	 $("#uplodmam").append('<a href="downloadocs?filetype='+vdocObj.mgrfiletype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vdocObj.ven_mgr_apr_mail_proof+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory(\''+vdocObj.vmgrfileid+'\',\''+vdocObj.mgrfiletype+'\',\'\');"><i class="fa fa-history"></i></a>');
		 		    	  $("#upam").show();
			          }
			          else{
			        	  $("#upam").hide();
			             }
			/*      $("#BCdocs").empty();
		            $( "#uplodmam" ).empty();<label>'+vdocObj.irsinputval+' :</label>&nbsp&nbsp&nbsp&nbsp
		            $("#vMSA").empty();
		            $("#upam").hide();
		            for(var i=0;i<vDocsList.length;i++){
		            	var fname=vDocsList[i].file_name;
	 		          	var encoded = encodeURIComponent(fname);
	 		          	var inputval="";
		          if(vDocsList[i].filetype=="Vendor_MSA"){
		          $("#vMSA").append('<a href="downloadocs?filetype='+vDocsList[i].filetype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vDocsList[i].file_name+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory(\''+ven.vendorid+'\',\''+vDocsList[i].filetype+'\',\'\');"><i class="fa fa-history"></i></a>');
		          } else if(vDocsList[i].filetype=="Business Compliance"){
		        	  if(vDocsList[i].inputval=="Executed_irs_w9_form"){
		        	  $( "#BCdocs1" ).append('<Span style="color:black;">'+vDocsList[i].inputval+ '</Span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="downloadocs&filetype='+vDocsList[i].filetype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vDocsList[i].file_name+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory(\''+ven.vendorid+'\',\''+vDocsList[i].filetype+'\',\''+vDocsList[i].inputval+'\');"><i class="fa fa-history"></i></a><br><br>');
		        	  }else if(vDocsList[i].inputval=="insurance_certificate"){
			        	  $( "#BCdocs2" ).append('<Span style="color:black;">'+vDocsList[i].inputval+ '</Span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="downloadocs&filetype='+vDocsList[i].filetype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vDocsList[i].file_name+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory(\''+ven.vendorid+'\',\''+vDocsList[i].filetype+'\',\''+vDocsList[i].inputval+'\');"><i class="fa fa-history"></i></a><br><br>');
		        	  }else if(vDocsList[i].inputval=="certificate_incorporation"){
			        	  $( "#BCdocs3" ).append('<Span style="color:black;">'+vDocsList[i].inputval+ '</Span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="downloadocs&filetype='+vDocsList[i].filetype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vDocsList[i].file_name+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory(\''+ven.vendorid+'\',\''+vDocsList[i].filetype+'\',\''+vDocsList[i].inputval+'\');"><i class="fa fa-history"></i></a><br><br>');
		        	  }else if(vDocsList[i].inputval=="standing_certificate"){
			        	  $( "#BCdocs4" ).append('<Span style="color:black;">'+vDocsList[i].inputval+ '</Span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="downloadocs&filetype='+vDocsList[i].filetype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vDocsList[i].file_name+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory(\''+ven.vendorid+'\',\''+vDocsList[i].filetype+'\',\''+vDocsList[i].inputval+'\');"><i class="fa fa-history"></i></a><br><br>');
		        	  }
		          }
		          else if(vDocsList[i].filetype=="Manager_Approved_Email_VMSA"){
		        	  $("#uplodmam").append('<a href="downloadocs?filetype='+vDocsList[i].filetype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vDocsList[i].file_name+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory(\''+ven.vendorid+'\',\''+vDocsList[i].filetype+'\',\'\');"><i class="fa fa-history"></i></a>');
	 		    	  $("#upam").show();
		          }
		          else{
		        	  $("#upam").hide();
		             }
		           }  */
		            $("#payment_terms,#pay_rate,#w_order,#cagreement,#cCompliance").attr("required", true);
		            $("#vendor").show();
		        }
	       });
	 }
	}else{
				 window.location.href="loginpage";
			}
		});
  }  
</script>
<script type="text/javascript">
$('form').on('reset', function() {
	$('#addClientVendorForm').data('formValidation').resetForm();
	});
$('input[name="mgrdeskNumber"]').mask('999-999-9999');
$('input[name="empdeskNumber"]').mask('999-999-9999');
$('input[name="fed_id"]').mask('99-9999999');
//$('input[name="remote_soc_code"]').mask('99-9999');
$('input[name="othr_fed_id[]"]').mask('99-9999999');
$('input[name="othr_client_mgr_extn[]"]').mask('999-999-9999');
$('input[name="othr_emp_client_extn[]"]').mask('999-999-9999');
$("#mgrdeskNumber").blur(function () {
    $('#addClientVendorForm').bootstrapValidator('revalidateField', 'mgrdeskNumber');
});
$("#empdeskNumber").blur(function () {
    $('#addClientVendorForm').bootstrapValidator('revalidateField', 'empdeskNumber');
});
$("#fed_id").blur(function () {
    $('#addClientVendorForm').bootstrapValidator('revalidateField', 'fed_id');
});

/* $("#othr_fed_id[]").blur(function () {
    $('#addClientVendorForm').bootstrapValidator('revalidateField', 'othr_fed_id');
});
$("#othr_client_mgr_extn[]").blur(function () {
    $('#addClientVendorForm').bootstrapValidator('revalidateField', 'othr_client_mgr_extn[]');
});
$("#othr_emp_client_extn[]").blur(function () {
    $('#addClientVendorForm').bootstrapValidator('revalidateField', 'othr_emp_client_extn[]');
}); */
$("#cwoexpirydate,#vwoexpirydate,#ccexpirydate,#pro_enddate").attr("disabled", true);
$("#pro_startdate").on('change', function(){
	   var fromdate1=$('#pro_startdate').val();
	   if(fromdate1!=""){
	     var minDate=new Date(fromdate1);
	     $('#pro_enddate').datepicker('setStartDate', minDate);
	     $("#pro_enddate").attr("disabled", false);
	   }else{
		    $("#pro_enddate").attr("disabled", true);
		    $('#pro_enddate').val('').datepicker('update');
	   }
});
$("#pro_enddate").on('change', function(){
	   var expirydate1=$('#pro_enddate').val();
	   if(expirydate1!=""){
	     var minDate=new Date(expirydate1);
	     $('#pro_startdate').datepicker('setEndDate', minDate);
	   }
});
$("#cwofromdate").datepicker({
}).on('changeDate', function(selected) {
	/*  var minDate = new Date(selected.date.valueOf());
     $('#cwoexpirydate').datepicker('setStartDate', minDate); */
    $('#addClientVendorForm').formValidation('revalidateField', 'cwofromdate');
});	
$("#cwoexpirydate").datepicker({
}).on('changeDate', function(selected) {
      /*   var minDate = new Date(selected.date.valueOf());
        $('#cwofromdate').datepicker('setEndDate', minDate); */
    $('#addClientVendorForm').formValidation('revalidateField', 'cwoexpirydate');
});
$("#cwofromdate").on('change', function(){
	   var fromdate1=$('#cwofromdate').val();
	   if(fromdate1!=""){
	     var minDate=new Date(fromdate1);
	     $('#cwoexpirydate').datepicker('setStartDate', minDate);
	     $("#cwoexpirydate").attr("disabled", false);
	   }else{
		    $("#cwoexpirydate").attr("disabled", true);
		    $('#cwoexpirydate').val('').datepicker('update');
	   }
});
$("#cwoexpirydate").on('change', function(){
	   var expirydate1=$('#cwoexpirydate').val();
	   if(expirydate1!=""){
	     var minDate=new Date(expirydate1);
	     $('#cwofromdate').datepicker('setEndDate', minDate);
	   }
});  
 
$("#vwofromdate").datepicker({
}).on('changeDate', function(selected) {
	/*  var minDate = new Date(selected.date.valueOf());
     $('#vwoexpirydate').datepicker('setStartDate', minDate); */
    $('#addClientVendorForm').formValidation('revalidateField', 'vwofromdate');
});	
$("#vwoexpirydate").datepicker({
}).on('changeDate', function(selected) {
	/* var minDate = new Date(selected.date.valueOf());
    $('#vwofromdate').datepicker('setEndDate', minDate); */
    $('#addClientVendorForm').formValidation('revalidateField', 'vwoexpirydate');
});
$("#vwofromdate").on('change', function(){
	   var fromdate1=$('#vwofromdate').val();
	   if(fromdate1!=""){
	     var minDate=new Date(fromdate1);
	     $('#vwoexpirydate').datepicker('setStartDate', minDate);
	     $("#vwoexpirydate").attr("disabled", false);
	   }else{
		    $("#vwoexpirydate").attr("disabled", true);
		    $('#vwoexpirydate').val('').datepicker('update');
	   }
});
$("#vwoexpirydate").on('change', function(){
	   var expirydate1=$('#vwoexpirydate').val();
	   if(expirydate1!=""){
	     var minDate=new Date(expirydate1);
	     $('#vwofromdate').datepicker('setEndDate', minDate);
	   }
});
$("#ccfromdate").datepicker({
}).on('changeDate', function(selected) {
	/*  var minDate = new Date(selected.date.valueOf());
     $('#ccexpirydate').datepicker('setStartDate', minDate); */
    $('#addClientVendorForm').formValidation('revalidateField', 'ccfromdate');
});	
$("#ccexpirydate").datepicker({
}).on('changeDate', function(selected) {
       /*  var minDate = new Date(selected.date.valueOf());
        $('#ccfromdate').datepicker('setEndDate', minDate); */
    $('#addClientVendorForm').formValidation('revalidateField', 'ccexpirydate');
});
$("#ccfromdate").on('change', function(){
	   var fromdate1=$('#ccfromdate').val();
	   if(fromdate1!=""){
	     var minDate=new Date(fromdate1);
	     $('#ccexpirydate').datepicker('setStartDate', minDate);
	     $("#ccexpirydate").attr("disabled", false);
	   }else{
		    $("#ccexpirydate").attr("disabled", true);
		    $('#ccexpirydate').val('').datepicker('update');
	   }
});
$("#ccexpirydate").on('change', function(){
	   var expirydate1=$('#ccexpirydate').val();
	   if(expirydate1!=""){
	     var minDate=new Date(expirydate1);
	     $('#ccfromdate').datepicker('setEndDate', minDate);
	   }
});
</script> 
<script >
//cw_order w_order cagreement cCompliance
function ccValidateSize(file) {
	getsesVal().done(function(data){
		if(data!=""){
	  if($(file).val()!=""){
		var FileSize = file.files[0].size/1024/1024;
		 var filename = file.files[0].name;
		 var type = $(file).val().split(".").pop().toLowerCase();
	        if (FileSize > 50) {
	            alert('File size exceeds 50 MB');
	            $(file).val('');
	        } else {
	        	if(type=="pdf" || type=="png" || type=="docx" || type=="doc"|| type=="jpg"|| type=="jpeg" || type=="xlsx" || type=="xls" || type=="pptx" || type=="txt" || type=="tiff"){
	        	$.ajax({
	        		type : "GET",
	 		        asyn : false,
	 		        contentType: "application/json",
					url : "checkSelectedFileName?filename="+filename,
					cache : false,
					async : false,
					success : function(response) {
					  if(response=='Uploaded'){
							alert("This file is already "+response + ". Please check");
							$(file).val('');
						}else{
							// if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#certi_corp').val() != '' && $('#certi_corp').val() == $('#std_cert').val() != '' && $('#std_cert').val())
					//	if ($('#cw_order').val() != '' && $('#cw_order').val() == $('#w_order').val() != '' && $('#w_order').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val())		
					if($('#cw_order').val() != '' && $('#cw_order').val() == $('#w_order').val() != '' && $('#w_order').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val() || $('#w_order').val() != '' && $('#w_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#w_order').val() != '' && $('#w_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val() || $('#cagreement').val() != '' && $('#cagreement').val() == $('#cCompliance').val() != '' && $('#cCompliance').val())	
					{
							         alert("You can not send two or more same files.");
							         $('#cCompliance').val('');
							       //  $('#btnSubmit').attr('disabled',true);
							     }else{
							     	//alert("else**********");
							     	 $('#addClientVendorForm').formValidation('enableFieldValidators', 'ccfromdate',true);
									 $('#addClientVendorForm').formValidation('enableFieldValidators', 'ccexpirydate',true);
							     	//$('#btnSubmit').attr('disabled',false);
							     }
						}
					},
					error : function() {
					}
				});
	        	}else{
	    	    	 $(file).val('');
	    	    	 alert("Please upload file with docx, doc, png, jpg, jpeg, xls, xlsx, pptx, txt, tiff or pdf file format");
	    		    }
	        }
	  }else{
		  	// alert("file empty");	
	  		//$('#btnSubmit').attr('disabled',false);
	  		 $('#addClientVendorForm').formValidation('enableFieldValidators', 'ccfromdate',false);
			 $('#addClientVendorForm').formValidation('enableFieldValidators', 'ccexpirydate',false);
	  	}
  }else{
			 window.location.href="loginpage";
		}
	});
} 

function vwoValidateSize(file) {
	getsesVal().done(function(data){
		if(data!=""){
  	if($(file).val()!=""){
  		 var FileSize = file.files[0].size/1024/1024;
		 var filename = file.files[0].name;
		 var type = $(file).val().split(".").pop().toLowerCase();
	        if (FileSize > 50) {
	            alert('File size exceeds 50 MB');
	            $(file).val('');
	        } else {
	        	if(type=="pdf" || type=="png" || type=="docx" || type=="doc"|| type=="jpg"|| type=="jpeg" || type=="xlsx" || type=="xls" || type=="pptx" || type=="txt" || type=="tiff"){
	        	$.ajax({
	        		type : "GET",
	 		        asyn : false,
	 		        contentType: "application/json",
					url : "checkSelectedFileName?filename="+filename,
					cache : false,
					async : false,
					success : function(response) {
					  if(response=='Uploaded'){
							alert("This file is already "+response + ". Please check");
							$(file).val('');
						}else{
							// if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#certi_corp').val() != '' && $('#certi_corp').val() == $('#std_cert').val() != '' && $('#std_cert').val())
							//if ($('#cw_order').val() != '' && $('#cw_order').val() == $('#w_order').val() != '' && $('#w_order').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val())	
							if($('#cw_order').val() != '' && $('#cw_order').val() == $('#w_order').val() != '' && $('#w_order').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val() || $('#w_order').val() != '' && $('#w_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#w_order').val() != '' && $('#w_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val() || $('#cagreement').val() != '' && $('#cagreement').val() == $('#cCompliance').val() != '' && $('#cCompliance').val())
							{
							         alert("You can not send two or more same files.");
							         $('#w_order').val('');
							         //$('#btnSubmit').attr('disabled',true);
							     }else{
							     //	alert("else**********");
							     $('#addClientVendorForm').formValidation('enableFieldValidators', 'vwofromdate',true);
								 $('#addClientVendorForm').formValidation('enableFieldValidators', 'vwoexpirydate',true);
							     	$('#btnSubmit').attr('disabled',false);
							     }
						}
					},
					error : function() {
					}
				});
	        	}else{
	    	    	 $(file).val('');
	    	    	 alert("Please upload file with docx, doc, png, jpg, jpeg, xls, xlsx, pptx, txt, tiff or pdf file format");
	    		    }
	        }
  	}else{
  	 // alert("file empty");	
  	  $('#addClientVendorForm').formValidation('enableFieldValidators', 'vwofromdate',false);
	  $('#addClientVendorForm').formValidation('enableFieldValidators', 'vwoexpirydate',false);
  		$('#btnSubmit').attr('disabled',false);
  	}
  }else{
			 window.location.href="loginpage";
		}
	});
} 

   



function ccaValidateSize(file) {
	getsesVal().done(function(data){
		if(data!=""){
  	if($(file).val()!=""){
  		 var FileSize = file.files[0].size/1024/1024;
		 var filename = file.files[0].name;
		 var type = $(file).val().split(".").pop().toLowerCase();
	        if (FileSize > 50) {
	            alert('File size exceeds 50 MB');
	            $(file).val('');
	        } else {
	        	if(type=="pdf" || type=="png" || type=="docx" || type=="doc"|| type=="jpg"|| type=="jpeg" || type=="xlsx" || type=="xls" || type=="pptx" || type=="txt" || type=="tiff"){
	        	$.ajax({
	        		type : "GET",
	 		        asyn : false,
	 		        contentType: "application/json",
					url : "checkSelectedFileName?filename="+filename,
					cache : false,
					async : false,
					success : function(response) {
					  if(response=='Uploaded'){
							alert("This file is already "+response + ". Please check");
							$(file).val('');
						}else{
							// if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#certi_corp').val() != '' && $('#certi_corp').val() == $('#std_cert').val() != '' && $('#std_cert').val())
						//	if ($('#cw_order').val() != '' && $('#cw_order').val() == $('#w_order').val() != '' && $('#w_order').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val())	
						if($('#cw_order').val() != '' && $('#cw_order').val() == $('#w_order').val() != '' && $('#w_order').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val() || $('#w_order').val() != '' && $('#w_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#w_order').val() != '' && $('#w_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val() || $('#cagreement').val() != '' && $('#cagreement').val() == $('#cCompliance').val() != '' && $('#cCompliance').val())	
						{
							         alert("You can not send two or more same files.");
							         $('#cagreement').val('');
							         //$('#btnSubmit').attr('disabled',true);
							     }else{
							     //	alert("else**********");
							     	$('#btnSubmit').attr('disabled',false);
							     }
						}
					},
					error : function() {
					}
				});
	        	}else{
	    	    	 $(file).val('');
	    	    	 alert("Please upload file with docx, doc, png, jpg, jpeg, xls, xlsx, pptx, txt, tiff or pdf file format");
	    		    }
	        }
  	}else{
  	 // alert("file empty");	
  		$('#btnSubmit').attr('disabled',false);
  	}
}else{
			 window.location.href="loginpage";
		}
	});
} 

function cwoValidateSize(file) {
	getsesVal().done(function(data){
		if(data!=""){
  	if($(file).val()!=""){
  		 var FileSize = file.files[0].size/1024/1024;
		 var filename = file.files[0].name;
		 var type = $(file).val().split(".").pop().toLowerCase();
	        if (FileSize > 50) {
	            alert('File size exceeds 50 MB');
	            $(file).val('');
	        } else {
	        	if(type=="pdf" || type=="png" || type=="docx" || type=="doc"|| type=="jpg"|| type=="jpeg" || type=="xlsx" || type=="xls" || type=="pptx" || type=="txt" || type=="tiff"){
	        	$.ajax({
	        		type : "GET",
	 		        asyn : false,
	 		        contentType: "application/json",
					url : "checkSelectedFileName?filename="+filename,
					cache : false,
					async : false,
					success : function(response) {
					  if(response=='Uploaded'){
							alert("This file is already "+response + ". Please check");
							$(file).val('');
						}else{
							// if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#certi_corp').val() != '' && $('#certi_corp').val() == $('#std_cert').val() != '' && $('#std_cert').val())
						//	if ($('#cw_order').val() != '' && $('#cw_order').val() == $('#w_order').val() != '' && $('#w_order').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val())	
						if($('#cw_order').val() != '' && $('#cw_order').val() == $('#w_order').val() != '' && $('#w_order').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val() || $('#w_order').val() != '' && $('#w_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#w_order').val() != '' && $('#w_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val() || $('#cagreement').val() != '' && $('#cagreement').val() == $('#cCompliance').val() != '' && $('#cCompliance').val())
						{
							         alert("You can not send two or more same files.");
							         $('#cw_order').val('');
							         //$('#btnSubmit').attr('disabled',true);
							     }else{
							     //	alert("else**********");
							         $('#addClientVendorForm').formValidation('enableFieldValidators', 'cwofromdate',true);
									 $('#addClientVendorForm').formValidation('enableFieldValidators', 'cwoexpirydate',true);
							     	$('#btnSubmit').attr('disabled',false);
							     }
						}
					},
					error : function() {
					}
				});
	        	}else{
	    	    	 $(file).val('');
	    	    	 alert("Please upload file with docx, doc, png, jpg, jpeg, xls, xlsx, pptx, txt, tiff or pdf file format");
	    		    }
	        }
  	}else{
  	 // alert("file empty");
  	 $('#addClientVendorForm').formValidation('enableFieldValidators', 'cwofromdate',false);
	 $('#addClientVendorForm').formValidation('enableFieldValidators', 'cwoexpirydate',false);
  		$('#btnSubmit').attr('disabled',false);
  	}
}else{
			 window.location.href="loginpage";
		}
	});
} 

var tablec = $('#sampleTable2').DataTable({
	 "order": [[0, "desc"]],
   bLengthChange: true,
   paging: true
});

function viewCustomerDocHistory(docId,fileType){
	getsesVal().done(function(data){
		if(data!=""){
	$.ajax({
    	type : "get",
        url  : "getCustomerDocumentHistiryById",
        contentType:"application/json",
        cache : false,
        async : false,
        data:{"docId":docId},
        success  : function(response){
        	 if (tablec) tablec.clear();
        	 $('#sampleTable2').dataTable().fnClearTable();
        	  	if(response!=""){
            	  for(var i=0;i<response.length;i++){
            		//  alert(response[i].startdate);
            			var fname=response[i].file_name;
	 		          	var encoded = encodeURIComponent(fname);
                       tablec.row.add([
                    	''+response[i].document_id+'',
                    	  '<a href="downloadocs?filetype='+response[i].filetype+'&filename='+encoded+'&customerName='+response[i].custName+'" style="color:blue">'+response[i].file_name+'</a>',
                    	//'<span onclick="downloadDocCust('+response[i].file_name+','+response[i].filetype+','+custName+')" style="color: blue">'+response[i].file_name+'</span>',
                    	''+response[i].filetype+'',
                    	''+response[i].startdate+'',
                    	''+response[i].expirydate+'',
                    	''+response[i].submit_date+'',
						''+response[i].posted_by+''
                     ]).draw();                  
                   }
          	}else{
          	  // alert("No data found");
             } 
        	  	var title="";
             	 if(fileType=='Customer_MSA'){
             		title="Customer MSA ";	
             	 }else if(fileType=='Manager_Approved_Email_CMSA'){
             		title="Manager Approved e-mail(CMSA) ";
             	 }	
             	$('h5').text(title+"Document History");	  	
        $('#DocumentHistoryModal').modal('show');
      },
  //	''+response[i].docStatus+''
     error: function(){  
     alert('Error while request..');
    }
  });
}else{
			 window.location.href="loginpage";
		}
	});
}
$('#remote_soc_code').select2({	
    placeholder: "Select Soc Code",
});
var tablev = $('#sampleTable3').DataTable({
	 "order": [[0, "desc"]],
   bLengthChange: true,
   paging: true
});

function viewVendorDocHistory(docId,fileType,inputVal){	
	getsesVal().done(function(data){
	if(data!=""){
	$.ajax({
   	type : "get",
       url  : "getVendorDocumentHistiryById",
       contentType:"application/json",
       cache : false,
       async : false,
       data:{"docId":docId,"fileType":fileType,"inputVal":inputVal},
       success  : function(response){
       	 if (tablev) tablev.clear();
       	 $('#sampleTable3').dataTable().fnClearTable();
       	  	if(response!=""){
           	  for(var i=0;i<response.length;i++){
           		//  alert(response[i].startdate);
           		 var inputval="";
       		  if(response[i].inputval!=null){
       			  inputval=response[i].inputval;
       		   }
           			var fname=response[i].file_name;
	 		          	var encoded = encodeURIComponent(fname);
                      tablev.row.add([
                   	    ''+response[i].document_id+'',
                   	  '<a href="downloadocs?filetype='+response[i].filetype+'&filename='+encoded+'&vendorName='+response[i].venName+'" style="color:blue">'+response[i].file_name+'</a>',
                   	//'<span onclick="downloadDocCust('+response[i].file_name+','+response[i].filetype+','+custName+')" style="color: blue">'+response[i].file_name+'</span>',
                   	''+response[i].filetype+'',
                   	''+inputval+'',
                   	''+response[i].startdate+'',
                   	''+response[i].expirydate+'',
                   	''+response[i].submit_date+'',
                   	''+response[i].posted_by+''
                    ]).draw();                  
                  }
           	//  '<input type="hidden" value='+response[i].document_id+'>',
         	}else{
         	  // alert("No data found");
            }
       	 var title="";
      	 if(fileType=='Vendor_MSA'){
      		title="Vendor MSA ";	
      	 }else if(fileType=='Business Compliance'){
      		 var title2;
      		var title1="Business Compliance - ";
      		 if(inputVal=='Executed_irs_w9_form'){
      			title2="Executed IRS W-9 Form ";
      		 }else if(inputVal=='insurance_certificate'){
      			title2="Insurance Certificate ";
      		 }else if(inputVal=='certificate_incorporation'){
      			title2="Certificate Incorporation ";
      		 }else if(inputVal=='standing_certificate'){
      			title2="Good Standing Certificate ";
      		 }
      		title=title1+title2;
      	 }else if(fileType=='Manager_Approved_Email_VMSA'){
      		title="Management Approved e-mail(Vendor) ";
      	 }
      	$('h5').text(title+"Document History"); 	
       	  	
       $('#DocumentVendorHistoryModal').modal('show');
     },
 //	''+response[i].docStatus+''
    error: function(){  
    alert('Error while request..');
   }
 });
}else{
		 window.location.href="loginpage";
	}
});
} 

var workauth=$("#work_authorization").val();
var emp_type=$("#emp_type").val();
if(workauth=='H-1B' && emp_type=='W2'){
	$("#lcaEndDate").attr("disabled", true);
	var val="Tekskills Inc";
	var $dropdown2 = $("select[name='organization_name']");
	$dropdown2.find('option[value="' + val + '"]').attr('selected', true);	
	$("#lcaBeginDate").datepicker({
	}).on('changeDate', function(selected) {
		var minDate = new Date(selected.date.valueOf());
		$('#lcaEndDate').datepicker('setStartDate', minDate);
	    $('#addClientVendorForm').formValidation('revalidateField', 'lcaBeginDate');
	});	
	$("#lcaEndDate").datepicker({
	}).on('changeDate', function(selected) {
		var minDate = new Date(selected.date.valueOf());
		 $('#lcaBeginDate').datepicker('setEndDate', minDate);
	    $('#addClientVendorForm').formValidation('revalidateField', 'lcaEndDate');
	});
	$("#lcaPostedDate").datepicker({
	}).on('changeDate', function(selected) {
	    $('#addClientVendorForm').formValidation('revalidateField', 'lcaPostedDate');
	});
}
$("#in_startdate").on('change', function(){
	   var fromdate1=$('#in_startdate').val();
	   if(fromdate1!=""){
	     var minDate=new Date(fromdate1);
	     $('#in_enddate').datepicker('setStartDate', minDate);
	     $("#in_enddate").attr("disabled", false);
	   }else{
		    $("#in_enddate").attr("disabled", true);
		    $('#in_enddate').val('').datepicker('update');
	   }
});
$("#in_enddate").on('change', function(){
	   var expirydate1=$('#in_enddate').val();
	   if(expirydate1!=""){
	     var minDate=new Date(expirydate1);
	     $('#in_startdate').datepicker('setEndDate', minDate);
	   }
});
$("#lcaBeginDate").on('change', function(){
	   var fromdate1=$('#lcaBeginDate').val();
	   if(fromdate1!=""){
	     var minDate=new Date(fromdate1);
	     $('#lcaEndDate').datepicker('setStartDate', minDate);
	     $("#lcaEndDate").attr("disabled", false);
	   }else{
		   $("#lcaEndDate").attr("disabled", true);
		    $('#lcaEndDate').val('').datepicker('update');
	   }
});
$("#lcaEndDate").on('change', function(){
	   var expirydate1=$('#lcaEndDate').val();
	   if(expirydate1!=""){
	     var minDate=new Date(expirydate1);
	     $('#lcaBeginDate').datepicker('setEndDate', minDate);
	   }
});

function isNumber(evt) {
    var iKeyCode = (evt.which) ? evt.which : evt.keyCode
    if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57)){
    	return false;
    }
    return true;
}
//if ($('#file_1').val() != '' && $('#file_1').val() == $('#file_2').val() != '' && $('#file_2').val() ||	$('#file_1').val() != '' && $('#file_1').val() == $('#file_3').val() != '' && $('#file_3').val() || $('#file_1').val() != '' && $('#file_1').val() == $('#file_4').val() != '' && $('#file_4').val() || $('#file_2').val() != '' && $('#file_2').val() == $('#file_3').val() != '' && $('#file_3').val() ||	$('#file_3').val() != '' && $('#file_3').val() == $('#file_4').val() != '' && $('#file_4').val())


//cw_order w_order cagreement cCompliance
//if($('#cw_order').val() != '' && $('#cw_order').val() == $('#w_order').val() != '' && $('#w_order').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val() || $('#w_order').val() != '' && $('#w_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#w_order').val() != '' && $('#w_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val() || $('#cagreement').val() != '' && $('#cagreement').val() == $('#cCompliance').val() != '' && $('#cCompliance').val())

function addInhouseproject(candidate_id,emptype){
	getsesVal().done(function(data){
	if(data!=""){
	//$('#addInhouseForm').bootstrapValidator('resetForm', true);
	$('#in_candidateid').val(candidate_id);
	$('#in_emptype').val(emptype);
	$('#in_projectname').val("Tekskills In-house");
	$('#in_line1').val("5 Independence Way, Suite 135");
	$('#in_city').val("Princeton");
	$('#in_state').val("New Jersey");
	$('#in_zipcode').val("08540");
	$('#in_payrateid').val(0);
	$("#in_enddate").attr("disabled", true);
	$('#addinhouseporejectmodal').modal('show');
   }else{
			 window.location.href="loginpage";
		}
	});
}
/* $("#in_startdate,#in_enddate").datepicker({
	changeMonth:true,
	changeYear:true,
	autoclose: true,
}).on('changeDate', function(selected) {
    $('#addInhouseForm').formValidation('revalidateField', 'in_startdate');
    $('#addInhouseForm').formValidation('revalidateField', 'in_startdate');
}); */
$("#in_startdate").datepicker({
}).on('changeDate', function(selected) {
	/*  var minDate = new Date(selected.date.valueOf());
	 $('#in_enddate').datepicker('setStartDate', minDate); */
    $('#addInhouseForm').formValidation('revalidateField', 'in_startdate');
});	
$("#in_enddate").datepicker({
}).on('changeDate', function(selected) {
	 /* var minDate = new Date(selected.date.valueOf());
	 $('#in_startdate').datepicker('setEndDate', minDate); */
    $('#addInhouseForm').formValidation('revalidateField', 'in_enddate');
});	

$('#addInhouseForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {	
    	project_name: {
            validators: {
            	isEmpty: {
                    message: 'Project Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Project Name must be more than 2 and less than 100 characters long.'
                },
                regexp: {
                   regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                    message: ' Project Name accepts alphabets and spaces. Spaces are not allowed at the beginning or end of the Name'
                }
            }
        },
        in_startdate:{
            validators: {
            	notEmpty: {
                    message: 'Project Start Date is mandatory'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'invalid Date'
                }
            }
        },
        
        in_enddate:{
            validators: {
            	 isEmpty: {
                    message: 'Project End Date is mandatory'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'invalid Date'
                }
            }
        },
        payrolltype:{
            validators: {
            	notEmpty: {
                    message: 'Please select timesheet type'
                }
            }
        }
    }
    });
$("#inhousesubmitid").click(function(event) {
	event.preventDefault();
	getsesVal().done(function(data){
		if(data!=""){
	$('#addInhouseForm').formValidation('validate');
	if (!$('#addInhouseForm').data('formValidation').isValid()) {
		//alert("not Valid");
	} else {
		$("#inhousesubmitid").attr("disabled", true);
		var candidate_id=$("#in_candidateid").val();
		var empType=$("#in_emptype").val();
		var form = $('#addInhouseForm')[0];
		var data = new FormData(form);
		var in_payrateid=$("#in_payrateid").val();
		
		$.ajax({
			url : "saveupdateinhouseproject", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(response) {
				 if(response!=null || response!=""){
	   	            	alert(response)
	   	            	window.location.href="viewClientVendor?candidate_id="+candidate_id+"&empType="+empType+"";
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


</script>
<script type = "text/javascript" > 
$('#addinhouseporejectmodal').on('hidden.bs.modal', function (){
	var candidate_id=$("#in_candidateid").val();
	var empType=$("#in_emptype").val();
   	window.location.href="addClientCustomer?candidate_id="+candidate_id+"&empType="+empType+"";
//	$('#addInhouseForm').bootstrapValidator('"src/main/webapp/Pages/AddClientVendor.jsp"resetForm', true);
});
	
    function preventBack() { window.history.forward(); }  
    setTimeout("preventBack()", 0);  
    window.onunload = function () { null };  
    
    window.onload=function(){
    	$.ajax({
    		type : "GET",
    		asyn : false,
    		contentType : "application/text",
    		url : "getallpaymentterms",
    		success : function(response) {
    		      $('#invoice_terms').empty(); 
    			  const obj = JSON.parse(response);
    				$('#invoice_terms').append($('<option/>').attr("value", '').text("Select Payment Terms"));
    			    $.each(obj.IntuitResponse.QueryResponse.Term, function (index, value) {  
    				$('#invoice_terms').append($('<option/>').attr("value",value.Id).text(value.Name));
    			 });
    		}
    	});
    };
</script>
 </body>
</html>
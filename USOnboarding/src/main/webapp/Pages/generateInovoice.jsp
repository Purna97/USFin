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
<link rel="stylesheet" href="resources/css/css/select2.min.css"	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet" href= "resources/css/css/datepicker3.min.css" />
<!-- <script src="/plugins/jquery/js/jQuery-2.1.4.min.js"></script> -->


</head>
<style type="text/css">
#pendingdocs {
	width: 105% !important;
}

.col-lg-2 {
	padding-right: 5px;
}

.form-control {
	font-size: 12px;
}
</style>
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
#comment:focus {
 border-color:red;
 /* background: yellow;
  color: red; */
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
							<h5 class="card-header">Search All Approved Timesheet </h5>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
										<input type="hidden" name="emptype" id="emptype" value="${emptype}">
										 <input type="hidden" name="role" id="role" value="${role}"> 
											<input type="hidden" name="dept" id="dept" value="${dept}">
											<input type="hidden" name="lgworkAuth" id="lgworkAuth" value="${lgworkAuth}">
											<input type="hidden" name="lgfullname" id="lgfullname" value="${lgfullname}">
											<input type="hidden" name="loginUserid" id="loginUserid" value="${loginUserid}">
											
											<!-- generateInvoice -->
										<fieldset>
											<form action="searchAllCandidateApprovedTimesheet" id="searchApprovedTimesheetById" method="post"
												class="form-horizontal">
												<div class="form-group row">
												<%-- <div class="col-lg-2">
												<select name="candidate" autoComplete="off"
													class="form-control text-left" id="candidate" onchange="loadCustomer()">
													<option value="">Select Candidate</option>
													<c:forEach var="clist" items="${candidateList}">
														<c:if test="${not empty clist.emp_type}">
														<option value="${clist.candidate_id}">${clist.fullname}</option>
														<option value="${clist.candidate_id}" ${clist.candidate_id eq scandidate ? 'selected="selected"' : ''}>${clist.fullname}</option>
														</c:if>
													</c:forEach>
												</select>
											  </div> --%>
												<div class="col-lg-2">
														<select id="year" name="year" class="form-control"
															style="height: 39px; border: 2px solid #ccc;" required>
															<script type="text/javascript">
														var myDate = new Date();
														var year = myDate.getFullYear();
														for(y = year-1; y <= year + 1; y++) {
														  var optn = document.createElement("OPTION");
														  optn.text = y; optn.value = y;
       													 if (y == year) {   // if year is 2015 selected
         												   optn.selected = true;
      														  }
        												document.getElementById('year').options.add(optn);
																}
															</script>
															<!-- <script>
											   var myDate = new Date();
												var year = myDate.getFullYear();
												for (var i = year-1; i < year + 2; i++) {
												document.write('<option value="'+i+'">'+ i+ '</option>');
													}
												</script> -->
														</select>
													</div>
													<div class="col-lg-2" id="mnt">
														<select id="month" autocomplete="off" name="month"
															class="form-control" onchange="getPeriod()"
															style="height: 39px; border: 2px solid #ccc;" required>
															<option value="">--Select Month--</option>
															<c:forEach var="ml" items="${monthsList}">
															<option value="${ml}" ${ml eq month ? 'selected="selected"' : ''}>${ml}</option>
																<%-- <option value="${ml}">${ml}</option> --%>
															</c:forEach>
														</select>
													</div> 
													 <!-- <div class="col-lg-2">
											     <select name="customertype" autoComplete="off" class="form-control text-left" id="customertype" onchange="loadInvTerms()" >
										         </select>
										        </div>
										            <div class="col-lg-2">
														<input type="text" id="invTerm"
															autocomplete="off" name="invTerm" 
															class="form-control" readonly>
													</div> -->
										        
													<!-- <div class="col-lg-2">
														<input type="text" id="fromdate"
															class="form-control text-left" autocomplete="off"
															title="Enter date in MM/DD/YYYY format only"
															name="fromdate" placeholder="From Date"
															class="form-control" onkeydown="return false" required>
													</div>
													<div class="col-lg-2">
														<input type="text" id="todate"
															class="form-control text-left" autocomplete="off"
															title="Enter date in MM/DD/YYYY format only"
															name="todate" placeholder="To Date"
															class="form-control" onkeydown="return false" disabled required>
													</div> -->

													<%--<div class="col-lg-2" id="mnt">
														<select id="period" autocomplete="off" name="period"
															class="form-control"
															style="height: 39px; border: 2px solid #ccc;">
															<option value="">--Select Period--</option>

														</select>
													</div> --%>
										   
													<%-- <c:if test="${emptype eq 'Admin'}">
													<div class="col-lg-2" id="mnt" style="display: none">
														<select id="status" autocomplete="off" name="status"
															class="form-control" 
															style="height: 39px; border: 2px solid #ccc;">
															<option value="">--Select Status--</option>
															<option value="Submitted">Submitted</option>
															<option value="Approved">Approved</option>
															<option value="Rejected">Rejected</option>
														</select>
													</div></c:if>
													<c:if test="${emptype ne 'Admin'}">
													<div class="col-lg-2" id="mnt">
														<select id="status" autocomplete="off" name="status"
															class="form-control" 
															style="height: 39px; border: 2px solid #ccc;">
															<option value="">--Select Status--</option>
															<option value="Submitted">Submitted</option>
															<option value="Approved">Approved</option>
															<option value="Rejected">Rejected</option>
														</select>
													</div></c:if> --%>
													<div class="col-sm-2"> <!-- onclick="generateInv()" -->
														<input type="submit" style="background: #205081; height: 39px; border: 2px solid #ccc;"
															class="btn btn-info btn-sm" value="Search"> <br>
													</div>
												</div>
											</form>
										</fieldset>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<h5 class="card-header" style="padding: .2rem;">Pending Invoices</h5>
									<div class="card-body">
										<div style="max-width: 1200px;">
											<table id="employeeTableId"
												class="table table-hover table-bordered"
												style="text-align: center;">
												<thead>
													<tr>
													    <th style="text-align: center">CandidateName</th>
														<th style="text-align: center;">Year</th>
														<th style="text-align: center;">Month</th>
														<!-- <th style="text-align: center">Payment Terms</th> -->
														<th style="text-align: center">Customer Name</th>
														<th style="text-align: center">Generate Invoice</th>
													</tr>
												</thead>
												<tbody>

													<c:forEach var="rlist" items="${timesheetList}">
														<tr>
														    <input type="hidden" id="canid" value="${rlist.candidate_id}">
															<td>${rlist.fullname}</td>
															<td id="yeartd">${rlist.year}</td>
															<td id="monthtd">${rlist.month}</td>
															<c:if test="${empty rlist.customer_name}">
															<td>NA</td>
															</c:if>
															<c:if test="${not empty rlist.customer_name}">
															<td id="customer_name${rlist.candidate_id}">${rlist.customer_name}</td>
															</c:if>
															<td><button class="btn btn-success btn-sm"
																	onclick="generateInvoice('${rlist.candidate_id}','${rlist.payrateid}','${rlist.year}','${rlist.month}','${rlist.invoice_terms}')"
																	data-toggle="modal"
																	style="padding: 2px 1px; font-size: 12px;">Generate Invoice</button>
															</td>
														</tr>
													</c:forEach>

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
		
		<div class="modal fade" id="invoicemodal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" style="max-width: 90%;height: 80%;"
				role="document">
				<div class="modal-content" style="height: auto">
					<div class="modal-header" style="padding: .5rem;">
						<button class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h5 class="modal-title" id="exampleModalLabel"
							style="font-size: 15px">
							<b>Generate Invoice</b>
						</h5>
					</div>
					<div class="modal-body">
						
						<div class="col">
							<input type="hidden" id="customer_id">
							<input type="hidden" id="payrate_id">
							
							<input type="hidden" id="inv_termsId"><input type="hidden" id="billrateId">
							<input type="hidden" id="cand_id" name="cand_id">
							<input type="hidden" id="invPeriodId">
							<input type="hidden" id="ptlistId"><input type="hidden" id="nontlistId">
							<center>
								<font><strong>Customer Name :</strong></font><b>&nbsp;&nbsp;<span id="customer_name_span" style="color:blue;"></span></b><font>&nbsp;<strong>Payment Terms :</strong></font><b>&nbsp;&nbsp;<span id="invTerms" style="color:blue;"></span></b><font><strong>&nbsp;
								 Invoice Period :</strong></font><b>&nbsp;&nbsp;<span id="invPeriod" style="color:blue;"></span></b>
								<font><strong>&nbsp;Bill Rate :</strong></font><b>&nbsp;&nbsp;<span id="bill_rate" style="color:blue;"></span></b>
							</center>
							</div><br>
						<div class="row">
							<!-- <div class="col-md-10 col-sm-10">
							   <div class="form-group row">
								<label class="col-sm-4 col-form-label">
								    Invoice Terms:</label>
								    <div class="col-sm-3">
								     <span id="invTerms" style="color: blue"></span>
								   </div>
								   <label class="col-sm-3 col-form-label">
								    Invoice Period:</label>
								    <div class="col-sm-1">
								     <span id="invPeriod" style="color: blue"></span>
								   </div>
								</div>
							</div> -->
							 <div class="col-md-10 col-sm-10">
							     <div class="form-group row" id="invtermId">
								    <label class="col-sm-4 col-form-label">
								    Invoice Generation Period:</label>
								    <div class="col-sm-3">
								     <select id="invTermsId" class="form-control" name="invTermsId">
								    
								     </select>
								   </div>
								 </div>
								 
								 <div class="form-group row" id="invtermId1">
								    <label class="col-sm-4 col-form-label">
								    Generate Invoice For :</label>
								    <div class="col-sm-2">
								    <input type="text" id="fromdate"
															class="form-control text-left" autocomplete="off"
															title="Enter date in MM/DD/YYYY format only"
															name="fromdate" placeholder="From Date"
															class="form-control" onkeydown="return false" required>
								   </div>
								   <div class="col-sm-2">
								    <input type="text" id="todate"
															class="form-control text-left" autocomplete="off"
															title="Enter date in MM/DD/YYYY format only"
															name="todate" placeholder="To Date"
															class="form-control" onkeydown="return false" required>
								   </div>
								 </div>
								<!--  <div class="form-group row">
								    <label class="col-sm-4 col-form-label">
								       Invoice Date</label>
								    <div class="col-lg-2">
														<input type="text" id="fromdate"
															class="form-control text-left" autocomplete="off"
															title="Enter date in MM/DD/YYYY format only"
															name="fromdate" placeholder="Inovice Date"
															class="form-control" onkeydown="return false" required>
									</div>
									<label class="col-sm-3 col-form-label">
								       Invoice Due Date</label>
									<div class="col-lg-2">
														<input type="text" id="todate"
															class="form-control text-left" autocomplete="off"
															title="Enter date in MM/DD/YYYY format only"
															name="todate" placeholder="Due Date"
															class="form-control" onkeydown="return false" disabled required>
									</div>
								 </div>
								  -->
								  <div class="text-center ml-5">
								    <div class="form-group row">
										<div class="col-sm-9">
											<center>
											<c:if test="${(dept eq 3 && emptype eq 'W2 Admin') || (dept eq 8 && emptype eq 'W2 Admin') || ((dept eq 1 && role == 4)&& (emptype eq 'W2 Admin' || emptype eq 'Admin'))}">
											<button type="button" class="btn btn-primary btn-sm"
												id="inv_id" onclick="generatePDF()">Create Invoice</button>
											</c:if></center>
										</div>
									</div>
									</div>
									<div class="text-center ml-5">
									<center>
								<span id="invmsg" style="color:red;"></span><br></center>
							<div class="col">
							<center>
								<font><strong>From Date :</strong></font><b>&nbsp;&nbsp;<span id="fromdate_span" style="color:blue;"></span></b><font>&nbsp;<strong>To Date :</strong></font><b>&nbsp;&nbsp;<span id="todate_span" style="color:blue;"></span></b>&nbsp;
								<font><strong>&nbsp;Billable Hours :</strong></font><b>&nbsp;&nbsp;<span id="invbillablehrs_spn" style="color:blue;"></span></b>
							<br>
							</center>
							</div>
								 <input type="hidden" id="invbillablehrs" name="invbillablehrs">
								 <input type="hidden" id="fileName" name="fileName">
								 <input type="hidden" id="nodays" name="nodays">
								 <!-- fileNameSpan -->
								 
									</div>
						      </div>
							
							<div class="col-md-12">
							<div class="modal-header" style="padding: .5rem;">
						     <h5 class="modal-title" id="exampleModalLabel"
							style="font-size: 15px;line-height: 0.5;">
							<b>Approved TimeSheets</b>
						     </h5>
					        </div>
							     <table id="invoiceTable" class="table table-hover table-bordered"
								   style="text-align: center;">
							    	<thead>
									   <tr>
										<th style="text-align: center">CandidateName</th>
										<th style="text-align: center">Year</th>
										<th style="text-align: center">Month</th>
										<th style="text-align: center">From Date</th>
										<th style="text-align: center">To Date</th>
									    <th style="text-align: center">Total Billable Hours</th>
									    <th style="text-align: center">Time Sheet Status</th>
								    	</tr>
								  </thead>
								  <tbody>
									
								  </tbody>
							  </table>
							  
							<!--   <button type="button" class="btn btn-secondary btn-sm"
											    data-dismiss="modal">Close</button> -->
							</div>
							
							<div class="col-md-12" id="nontsId">
							<div class="modal-header" style="padding: .5rem;">
						     <h5 class="modal-title" id="exampleModalLabel"
							style="font-size: 15px;line-height: 0.5;">
							<b>Rejected/Submitted TimeSheets</b>
						     </h5>
					        </div>
							     <table id="nonTsTable" class="table table-hover table-bordered"
								   style="text-align: center;">
							    	<thead>
									   <tr>
										<th style="text-align: center">CandidateName</th>
										<th style="text-align: center">Year</th>
										<th style="text-align: center">Month</th>
										<th style="text-align: center">From Date</th>
										<th style="text-align: center">To Date</th>
									    <th style="text-align: center">Total Billable Hours</th>
									    <th style="text-align: center">Time Sheet Status</th>
								    	</tr>
								  </thead>
								  <tbody>
									
								  </tbody>
							  </table>
							  
							<!--   <button type="button" class="btn btn-secondary btn-sm"
											    data-dismiss="modal">Close</button> -->
							</div>
							
							<div class="col-md-12" id="igId">
							<div class="modal-header" style="padding: .5rem;">
						     <h5 class="modal-title" id="exampleModalLabel"
							style="font-size: 15px;line-height: 0.5;">
							<b>Generated Invoice List</b>
						     </h5>
					        </div>
							     <table id="igtable" class="table table-hover table-bordered"
								   style="text-align: center;">
							    	<thead>
									   <tr>
										<!-- <th style="text-align: center">CandidateName</th> -->
										<th style="text-align: center">Year</th>
										<th style="text-align: center">Month</th>
										<th style="text-align: center">Customer Name</th>
										<th style="text-align: center">From Date</th>
										<th style="text-align: center">To Date</th>
									<!--     <th style="text-align: center">Total Billable Hours</th>
									    <th style="text-align: center">Time Sheet Status</th> -->
								    	</tr>
								  </thead>
								  <tbody>
									
								  </tbody>
							  </table>
							  
							<!--   <button type="button" class="btn btn-secondary btn-sm"
											    data-dismiss="modal">Close</button> -->
							</div>
							
							<div class="col-md-12" id="ptsId">
							<br><br>
							<div class="modal-header" style="padding: .5rem;">
						     <h5 class="modal-title" id="exampleModalLabel"
							style="font-size: 15px;line-height: 0.5;">
							<b>Pending TimeSheets</b>
						     </h5>
					        </div>
							<%-- <div class="col">
							<center>
								<font><strong style="color:blue;">Pending TimeSheets :</strong></font></center> --%>
							     <table id="pendigTsTable" class="table table-hover table-bordered"
								   style="text-align: center;">
							    	<thead>
									   <tr>
										<th style="text-align: center">Year</th>
										<th style="text-align: center">Month</th>
										<th style="text-align: center">From Date</th>
										<th style="text-align: center">To Date</th>
								    	</tr>
								  </thead>
								  <tbody>
									
								  </tbody>
							  </table>
							  
							<!--   <button type="button" class="btn btn-secondary btn-sm"
											    data-dismiss="modal">Close</button> -->
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
<!-- <form action="gettimesheet" method="post" id="vformid" > -->
	<form action="timesheet" method="post" id="vformid" >
		    <input type="hidden" name="year" value="${year}">
		    <input type="hidden" name="status" value="${status}">
		    <input type="hidden" name="month" value="${month}">
		    <input type="hidden" name="customertype" value="${customertype}">
		    
			</form>

	
<script src="resources/js/js/jquery-2.1.4.min.js"></script> 
	<script src="resources/js/newjs/bootstrap.min.js"></script>
	<script src="resources/js/newjs/formValidation.min.js"></script>
	<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
	<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
	<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
    <script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
		<script src="resources/preDefined/goback.js"></script>
<script>
$("#todate,#inv_id").attr("disabled", true);
$("#fromdate").datepicker({
}).on('changeDate', function(selected) {
	var fromdate = $('#fromdate').val();
	 var invp = $('#invPeriodId').val();
	 $('#nodays').val('');
	if(fromdate!=""){
	if(invp=='Weekly'){
		 const d = new Date(fromdate);
		 d.setDate(d.getDate() + 6);
		 $('#todate').val((d.getMonth()+1).toString().padStart(2, "0")+"/"+d.getDate().toString().padStart(2, "0")+"/"+d.getFullYear());
		  $('#todate').trigger('change');
		  $("#nodays").val(7)
	}else if(invp=='Bi-Weekly'){
		 const d = new Date(fromdate);
		 d.setDate(d.getDate() + 13);
		 $('#todate').val((d.getMonth()+1).toString().padStart(2, "0")+"/"+d.getDate().toString().padStart(2, "0")+"/"+d.getFullYear());
		  $('#todate').trigger('change');
		  $("#nodays").val(14)
	}else if(invp=='Monthly'){
		var date = new Date(fromdate);
		const d = new Date(date.getFullYear(), date.getMonth() + 1, 0);
		$('#todate').val((d.getMonth()+1).toString().padStart(2, "0")+"/"+d.getDate().toString().padStart(2, "0")+"/"+d.getFullYear());
		 $('#todate').trigger('change');
		 let date1 = new Date(fromdate);
		// let longMonth = date1.toLocaleString('en-us', { month: 'long' });
		// let month = d.getMonth();
		 var days=daysInMonth(d.getMonth(),d.getFullYear());
		 $('#nodays').val(days);
	}else if(invp=='Semi-Monthly'){
		 const d1 = new Date(fromdate);
		 if(d1.getDate()>15){
			 var date = new Date(fromdate);
			 const d = new Date(date.getFullYear(), date.getMonth() + 1, 0);
			 $('#todate').val((d.getMonth()+1).toString().padStart(2, "0")+"/"+d.getDate().toString().padStart(2, "0")+"/"+d.getFullYear()); 
		 }
		 else{
			 const d = new Date(fromdate);
			 d.setDate(d.getDate() + 14);
		 $('#todate').val((d.getMonth()+1).toString().padStart(2, "0")+"/"+d.getDate().toString().padStart(2, "0")+"/"+d.getFullYear());
		 }
		 $('#todate').trigger('change');
	  }
	 $("#todate").attr("disabled", false);
	}else{
		 $("#todate").val('');	
		 $("#todate").attr("disabled", true);
	}
	 // $('#todate').datepicker('setEndDate', new Date(new Date().setDate(minDate + 7)));
	 
});	

$("#todate").on('change', function(){
	   var todate1=$('#todate').val();
	   var fromdate1=$('#fromdate').val();
	 //  alert(fromdate1+"***"+todate1);
	   if(todate1!=""){
	    /*  var minDate=new Date(todate1);
	     $('#fromdate').datepicker('setEndDate', minDate); */
		   var fromdate=$('#fromdate').val();
			var todate=$('#todate').val();
			var candidate_id=$('#cand_id').val();
			var customer_id=$('#customer_id').val();
			var invPeriod=$('#invPeriod').val();
			var payrate_id=$('#payrate_id').val();
			    $.ajax({
			    	type : "GET",
			        asyn : false,
			        contentType: "application/json", // NOT dataType!
			        url  : "getBillableHoursDetailsByDates",
			        data: {
			        	"candidate_id":candidate_id,
			        	"customer_id":customer_id,
			    		"fromdate":fromdate,
			    		"todate":todate,
			    		"payrate_id":payrate_id,
			    		"invPeriod":invPeriod
			    	  },
			        success  : function(response){
			        	  if(response!=""){
			        		$('#invbillablehrs,#fileName').val('');
			        		$('#invbillablehrs_spn,#fromdate_span,#todate_span,#invmsg').text('');
			        		if(response.totalbillablehours!=null){
			        			$('#invbillablehrs').val(response.totalbillablehours);
				        		$('#invbillablehrs_spn').text(response.totalbillablehours);
			        		var tsstatus=response.timesheetstatus;
			        		if(tsstatus.includes("Submitted")|| tsstatus.includes("Rejected")){
			        			$('#invmsg').text("Some of the timesheets are not yet Approved/Rejected, You can't generate invoice");
			        			$('#invbillablehrs_spn').text(response.totalbillablehours);
			        			$("#inv_id").attr("disabled", true);
			        		}else if(response.invoice_status!=null){
			        			if(response.invoice_status=='IG'){
			        				$('#invmsg').text("Invoice Generated for some of selected dates and Mail Not Sent, You can update invoice");
				        			$('#invbillablehrs_spn').text(response.totalbillablehours);
				        			$("#inv_id").attr("disabled", true);
			        			}else{
			        				$('#invmsg').text("Invoice generated for some of selected dates and Mail Sent, You can't generate invoice again");
				        			$('#invbillablehrs_spn').text(response.totalbillablehours);
				        			$("#inv_id").attr("disabled", true);
			        			}
			        			
			        		}
			        		else{
			        		//alert($("#nodays").val()+""+response.dayscount);
			        		if(response.dayscount==$("#nodays").val()){
			        			$("#inv_id").attr("disabled", false);
				        		$('#invbillablehrs').val(response.totalbillablehours);
				        		$('#invbillablehrs_spn').text(response.totalbillablehours);
			        		}else{
			        			$('#invmsg').text("Some of the timesheets are not yet Submitted, You can't generate invoice");
			        			$("#inv_id").attr("disabled", true);
			        		   }
			        		  }
			        		}
			        		else{
			        			//(response.totalbillablehours="" || response.totalbillablehours==null)
			        			$('#invmsg').text("Some of the timesheets are not yet Submitted, You can't generate invoice");
			        			$("#inv_id").attr("disabled", true);
			        		}
			        	  }
			        		
			        		$('#fileName').val(response.fileName);
			        		$('#fileNameSpan').text(response.fileName);
			        		$('#fromdate_span').text(fromdate);
			        		$('#todate_span').text(todate);
			           }
				    });
	   }
});

function loadCustomer()
{
	$('#invlistId').hide(); 
	var candidate = document.getElementById("candidate").value;
	if (candidate!="") 
		{ 
	 $.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "application/json", // NOT dataType!
	        url  : "getCustomersById?candidate_id="+candidate+"",
	        success  : function(response){
	          $('#customertype').empty();
	    	  $('#customertype').append($('<option/>').attr("value", '').text("--Select Customer--"));
	        for(var i=0;i<response.length;i++)
	     	    {
	        		$('#customertype').append($('<option/>').attr("value", response[i].payrate_id).text(response[i].custname));
	            }
	        }
		    });
		}else{
			$('#fromdate,#todate').val('').datepicker('update');
			$('#customertype').empty();
		}
}
function loadInvTerms()
{
	$('#invlistId').hide();
	$('#fromdate,#todate').val('').datepicker('update');
	var candidate = document.getElementById("candidate").value;
	var payrateid = document.getElementById("customertype").value;
	if (payrateid!="") 
		{
		 $.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "application/json", // NOT dataType!
		        url  : "getEmpPayRateDetailsById?candidate_id="+candidate+"&&payrate_id="+payrateid+"",
		        success  : function(response){
		               $('#invTerm').val('');
		               $('#invTerm').val(response.invoice_terms);
		               var minDate=new Date(response.proj_startDate);
		      	       $('#fromdate').datepicker('setStartDate', minDate);
		      	       $('#todate').datepicker('setStartDate', minDate);
		           }
			    });
		
		}else{
			$('#invlistId').hide(); 
		}
}
function generateInv()
{ 
	$('#candNameTd').html($("#candidate option:selected").text());
	$('#custNameTd').html($("#customertype option:selected").text());
	$('#fdatetd').html($('#fromdate').val());
	$('#tdatetd').html($('#todate').val());
	$('#thrstd').html(168.00);
	$('#blratetd').html(60.00);
	//$('#idbtn').html($("#candidate option:selected").text());
	$('#invlistId').show(); 
}
var invtable = $('#invoiceTable').DataTable({
	"order" : [ [ 0, "desc" ] ],
	lengthMenu : [ [ 5, 10, 15, -1 ], [ 5, 10, 15, "All" ] ],
	bLengthChange : false,
	searching : false,
	paging : false,
	"ordering": false,
	info: false
});
var ptstable = $('#pendigTsTable').DataTable({
	"order" : [ [ 0, "desc" ] ],
	lengthMenu : [ [ 5, 10, 15, -1 ], [ 5, 10, 15, "All" ] ],
	bLengthChange : false,
	searching : false,
	paging : false,
	"ordering": false,
	info: false
});
var nontstable = $('#nonTsTable').DataTable({
	"order" : [ [ 0, "desc" ] ],
	lengthMenu : [ [ 5, 10, 15, -1 ], [ 5, 10, 15, "All" ] ],
	bLengthChange : false,
	searching : false,
	paging : false,
	"ordering": false,
	info: false
});
var igtable = $('#igtable').DataTable({
	"order" : [ [ 0, "desc" ] ],
	lengthMenu : [ [ 5, 10, 15, -1 ], [ 5, 10, 15, "All" ] ],
	bLengthChange : false,
	searching : false,
	paging : false,
	"ordering": false,
	info: false
});

function daysInMonth(month, year) {
    var days;
    switch (month) {
        case 1: // Feb, our problem child
            var leapYear = ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0);
            days = leapYear ? 29 : 28;
            break;
        case 3: case 5: case 8: case 10: 
            days = 30;
            break;
        default: 
            days = 31;
        }
    return days;
}

function generateInvoice(candidate,payrateid,year,month,invoice_terms)
{ 
	var customer_name=$('#customer_name'+candidate).html();
	$.ajax({
	    url: "searchApprovedTimesheetById", //this is the submit URL
	    type: "GET",
	    asyn : false,
	    data: {"candidate":candidate,
	    		"year":year,
	    		"month":month,
	    		"payrate_id":payrateid,
	    	  },
	    success: function(response){
	    	if(response!=null || response!=""){
	    		var tlist=response.approvedtimesheetList;
	    		var nontlist=response.nonapprovedtimesheetList;
	    		var ptlist=response.pendingtimesheetList;
	    		var payrateObj=response.payrateObj;
	    		var igList=response.generatedinvoiceList;
	    		  $('#customer_id,#cand_id,#inv_termsId,#billrateId,#payrate_id,#invPeriodId').val('');
	    	 	  $('#invTerms,#invPeriod,#bill_rate,#customer_name_span').text('');
	    	 	  $('#customer_name_span').text(customer_name);
	    	 	  $('#cand_id').val(candidate); 
	    	 	   $('#invmsg').text('');
	    	 	  $('#payrate_id').val(payrateObj.payrate_id); 
	    	 	   $('#customer_id').val(payrateObj.customer_id); 
	    	 	   $('#invPeriodId').val(payrateObj.invoice_period); 
	               //$('#invTerms').text(payrateObj.invoice_terms);
	               $('#invPeriod').text(payrateObj.invoice_period); 
	               $('#bill_rate').text(payrateObj.billrate);
	               $('#billrateId').val(payrateObj.billrate);
	               $('#inv_termsId').val(payrateObj.invoice_terms);
	               if(ptlist!="" || nontlist!=""){
	            	   $('#ptlistId,#nontlistId').val('');
    		    	  if(ptlist.length>0 || nontlist.length>0){
    		    		  $('#ptlistId').val(ptlist.length);
    		    		  $('#nontlistId').val(nontlist.length);
    		    	  }
	               }
	              /*  if(payrateObj.invoice_period=='Monthly'){
	            	   var monthlytemplate=response.monthlytemplate;
	            	   var minDate=new Date(monthlytemplate.fromdate);
		               var endDate=new Date(monthlytemplate.todate);
		               $('#fromdate').datepicker('setStartDate', minDate);
		               $('#fromdate').datepicker('setEndDate', endDate);
		               if(ptlist!="" || nontlist!=""){
		            	   $('#fromdate,#todate').val('');
	    		    	  if(ptlist.length>0 || nontlist.length>0){
	    		    		$("#todate,#fromdate").attr("disabled", true);
	    		    		$('#fromdate').val(monthlytemplate.fromdate);
	    		    		$('#todate').val(monthlytemplate.todate);
	    		    		$('#invmsg').text("You Cannot Generate Invoice, Some TimeSheets are yet not Approved/Submitted");
	    		    	  }
		               }
	               }else if(payrateObj.invoice_period=='Bi-Weekly'){
	            	   $("#todate,#fromdate").attr("disabled", false);
	            	   var monthlytemplate=response.monthlytemplate;
	            	   var minDate=new Date(monthlytemplate.fromdate);
		               var endDate=new Date(monthlytemplate.todate);
		               $('#fromdate').datepicker('setStartDate', minDate);
		               $('#fromdate').datepicker('setEndDate', endDate);
	               }else if(payrateObj.invoice_period=='Semi-Monthly'){
	            	   $("#todate,#fromdate").attr("disabled", false);
	            	   var monthlytemplate=response.monthlytemplate;
	            	   var minDate=new Date(monthlytemplate.fromdate);
		               var endDate=new Date(monthlytemplate.todate);
		               $('#fromdate').datepicker('setStartDate', minDate);
		               $('#fromdate').datepicker('setEndDate', endDate);
	               }else if(payrateObj.invoice_period=='Weekly'){ */
	            	   $("#fromdate").attr("disabled", false);
	            	   var minDate=new Date(response.fromdate);
		               var endDate=new Date(response.todate);
		               $('#fromdate').datepicker('setStartDate', minDate);
		               $('#fromdate').datepicker('setEndDate', endDate);
	             //  }
	               
	               if(payrateObj.invoice_period==30){
	            	   $('#invtermId').hide(); 
	               }else {
	            	   var month=$('#month').val();
	            	   var year=$('#year').val();
	            	   $('#invtermId').show();
	            	  /*  $.ajax({
	            		    url: "getPeriod", //this is the submit URL
	            		    type: "POST",
	            		    asyn : false,
	            		    data: {"month":month,"year":year},
	            		    //contentType: "application/json",
	            		    success: function(response){
	            		    	if(response!=null || response!=""){
	            		    	$('#invTermsId').empty(); 
	            		    	$('#invTermsId').append($('<option/>').attr("value", '').text("--Select Period--"));
	            			     for(var i=0;i<response.length;i++)
	            		  	      {
	            		     	    $('#invTermsId').append($('<option/>').attr("value",response[i]).text(response[i]));
	            		           } 
	            			       $('#invtermId').show();
	            		    	}else{
	            		        	window.location.href="loginpage";
	            		            }
	            		    }
	            		}); */
	               }
	               //alert(tlist.length+"***"+payrateObj.invoice_terms);
	    		$('#invoiceTable').dataTable().fnClearTable();
	    		if (invtable)invtable.clear();
	    		$('#pendigTsTable').dataTable().fnClearTable();
	    		if (ptstable)ptstable.clear();
	    		$('#nonTsTable').dataTable().fnClearTable();
	    		if (nontstable)nontstable.clear();
	    		
	    		$('#igtable').dataTable().fnClearTable();
	    		if (igtable)igtable.clear();
	    		
	    		
	    		
	    		$('#invTermsId').empty(); 
		    	$('#invTermsId').append($('<option/>').attr("value", '').text("--Select Period--"));
		    	 $('#invtermId').hide();
		    	$('#invtermId1').show(); 
		    	/* if(payrateObj.invoice_period=='Weekly'){
		    		 if(tlist.length>0){
		    		 for (var i = 0; i < tlist.length; i++) {
    			     $('#invTermsId').append($('<option/>').attr("value",tlist[i].timesheet_id).text(tlist[i].fromdate+"-"+tlist[i].todate));
    			     $('#invtermId').show();
    			     $('#invtermId1').hide();
    		    	}
		    	  }
		    	 }
		    	 else {
		    		 $('#invtermId').hide();
		    		 $('#invtermId1').show();
    		    	} */
	    		for (var i = 0; i < tlist.length; i++) {
	    			invtable.row.add(
							[ 
							  '' + tlist[i].fullname + '',  
							  '' + tlist[i].year + '',
							  '' + tlist[i].month + '',
							  '' + tlist[i].fromdate + '',
							  '' + tlist[i].todate + '',
							  '' + tlist[i].totalbillablehours + '',
							  '' + tlist[i].timesheet_status + ''
							  ]).draw();
				   }
    		    	$('#nontsId,#ptsId,#igId').hide();
    		    	if(igList!=""){
    		    		if(igList.length>0){
    		    		$('#igId').show();
    		    	 	for (var i = 0; i < igList.length; i++) {
    		    	 		igtable.row.add(
        							[ 
        							  '' + igList[i].year + '',
        							  '' + igList[i].month + '',
        							  '' + igList[i].customer_name + '',
        							  '' + igList[i].fromdate + '',
        							  '' + igList[i].todate + '',
        							  ]).draw();
        				   }
    		    		}
    		    	}
    		    	
    		    	/*if(nontlist!=""){
    		    		if(nontlist.length>0){
    		    		$('#nontsId').show();
    		    	 	for (var i = 0; i < nontlist.length; i++) {
        	    			nontstable.row.add(
        							[ 
        							  '' + nontlist[i].fullname + '',  
        							  '' + nontlist[i].year + '',
        							  '' + nontlist[i].month + '',
        							  '' + nontlist[i].fromdate + '',
        							  '' + nontlist[i].todate + '',
        							  '' + nontlist[i].totalbillablehours + '',
        							  '' + nontlist[i].timesheet_status + ''
        							  ]).draw();
        				   }
    		    		}
    		    	}else{
    		    		$('#nontsId').hide();
    		    	}
    		    	
    		    	if(ptlist!=""){
    		    		if(ptlist.length>0){
    		    			$('#ptsId').show();
    		    			for (var i = 0; i < ptlist.length; i++) {
        		    			
        						    	ptstable.row.add(
        	        							[ 
        	        							  '' + ptlist[i].year + '',
        	        							  '' + ptlist[i].month + '',
        	        							  '' + ptlist[i].week_fromdate + '',
        	        							  '' + ptlist[i].week_todate + ''
        	        							  ]).draw();	
            				}
    		    		 }
    		    	}else{
    		    		$('#ptsId').hide();
    		    	}*/
	    		$('#invoicemodal').modal('show');
	    }else{
         	window.location.href="loginpage";
	            }
	      }
	}),
	  $.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/text",
			url : "getpaymentterms",
			data : {
				"paytermId" : invoice_terms
			},
			success : function(response) {
				  const obj = JSON.parse(response);
				//  $('#invdueDays').val(obj.IntuitResponse.Term.Name);
				  $('#invTerms').text(obj.IntuitResponse.Term.Name);
			}
		});
 /* <c:forEach var="reportlist" items="${timesheetDto}">
                                                                                         <tr><!-- toprecord -->
                                                                                         <td id="yeartd${reportlist.week_id}">${reportlist.fullname}</td>
                                                                                         <td id="yeartd${reportlist.week_id}">${reportlist.year}</td>
                                                                                         <td id="monthtd${reportlist.week_id}">${reportlist.month}</td>
                                                                                         <td id="weekstd${reportlist.week_id}" style="display:none">${reportlist.weeks}</td>
                                                                                         <td id="fromtd${reportlist.week_id}">${reportlist.week_fromdate}</td>
                                                                                         <td id="totd${reportlist.week_id}">${reportlist.week_todate}</td>
                                                                                         
                                                                                         <td>
                                                                                         <button id="btn-colorb" class="btn btn-success btn-sm"  style="padding: 4px 1px;font-size: 12px;" 
                                                                                         onclick="sendMail(${reportlist.candidate_id},${reportlist.week_id})">Send Mail
                                                                                         <c:if test="${reportlist.mailcount gt 0}">
																	     				(${reportlist.mailcount})
																	    				</c:if></button>
                                                                                         <a href="#" onclick="viewHistory(${reportlist.candidate_id},${reportlist.week_id})"
																							class="label label-success" style="color:white;" title="Mail Reminder History">
																							<img src="resources/ICONS/empHistory.png" style="max-width: 7%;"></a>
                                                                                         </td>
                                                                                         
                                                                                         </tr>
                                                                                 </c:forEach> 
                                                                                 
	$.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "application/json", // NOT dataType!
	        url  : "searchApprovedTimesheetById?candidate="+candidate+"&&year="+year+"&&month="+month+"",
	        success  : function(response){
	               $('#invTerms,#invPeriod').text('');
	               $('#invTerms').text(response.invoice_terms);
	               $('#invPeriod').text(response.invoice_period);
	                var minDate=new Date(response.proj_startDate);
	      	       $('#fromdate').datepicker('setStartDate', minDate);
	      	       $('#todate').datepicker('setStartDate', minDate); 
	      	       $('#invoicemodal').modal('show');
	             }
		    });  */
}
 
$('#invoicemodal').on('hidden.bs.modal', function (){
	$('#fromdate,#todate').val('');
	$('#invbillablehrs').val('');
	$('#invbillablehrs_spn,#fromdate_span,#todate_span').text('');
	$("#todate,#inv_id").attr("disabled", true);
});
 
function generatePDF(){
	getsesVal().done(function(data){
	if(data!=""){
	var fromdate=$('#fromdate').val();
	var todate=$('#todate').val();
	var candidate_id=$('#cand_id').val();
	var customer_id=$('#customer_id').val();
	var invbillablehrs=$('#invbillablehrs').val();
	var inv_terms=$('#inv_termsId').val();
	var billrate=$('#billrateId').val();
	var payrate_id=$('#payrate_id').val();
	var fileName=$('#fileName').val();
	var encoded = encodeURIComponent(fileName);
	/* $.ajax({
		type : "POST",
        asyn : false,
        url  : "createinvoicepage",
        data: {
        	"fromdate":fromdate,
        	"todate":todate,
    		"candidate_id":candidate_id,
    		"invbillablehrs":invbillablehrs,
    		"payrate_id":payrate_id,
    		"fileName":encoded
    	  },
        success  : function(response){
        	  }
	    });  */
	// window.location.href="createinvoicepage?timesheetId="+invTermsId+"&&candidate_id="+candidate_id+"";
	// window.location.href="createinvoicepage?fromdate="+fromdate+"&&todate="+todate+"&&candidate_id="+candidate_id+"&&customer_id="+customer_id+"&&invbillablehrs="+invbillablehrs+"&&inv_terms="+inv_terms+"&&billrate="+billrate+"&&payrate_id="+payrate_id+"&&fileName="+fileName+"";
	 window.location.href="createinvoicepage?fromdate="+fromdate+"&&todate="+todate+"&&candidate_id="+candidate_id+"&&invbillablehrs="+invbillablehrs+"&&payrate_id="+payrate_id+"&&fileName="+encoded+"";
	/* if(fromdate!="" && todate!=""){
	   $.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "application/json", // NOT dataType!
	        url  : "getBillableHoursDetailsByDates",
	        data: {
	        	"candidate_id":candidate_id,
	        	"customer_id":customer_id,
	    		"fromdate":fromdate,
	    		"todate":todate
	    	  },
	        success  : function(response){
	        	  if(response!=""){
	        		$('#invbillablehrs').val('');
	        		$('#invbillablehrs_spn,#fromdate_span,#todate_span').text('');
	        		$('#invbillablehrs').val(response.totalbillablehours);
	        		$('#invbillablehrs_spn').text(response.totalbillablehours);
	        		$('#fromdate_span').text(fromdate);
	        		$('#todate_span').text(todate);
	              // $('#invbillablehrs,#invfromdate,#invtodate').text('');
	             //  $('#invTerm,#fromdate,#todate').val('');
	        	  }
	           }
		    }); 
	
	 
	//   window.location.href="createinvoicepage?timesheetId="+invTermsId+"&&candidate_id="+candidate_id+"";
	}else{
		if($('#todate').val()!=""){
			 
		 }else{
			 $('#todate').focus(); 
		 }
		  if($('#fromdate').val()!=""){
			 
		       }else{
			    $('#fromdate').focus(); 
		       }
	  } 
	
	 */
	
	}else{
			 window.location.href="loginpage";
		 }
	});
}
/* function generatePDF(){
	getsesVal().done(function(data){
	if(data!=""){
	var invTermsId=$('#invTermsId').val();
	if(invTermsId!=""){
	var candidate_id=$('#cand_id').val();
	   window.location.href="createinvoicepage?timesheetId="+invTermsId+"&&candidate_id="+candidate_id+"";
	}else{
		$('#invTermsId').focus();
	  }
	}else{
			 window.location.href="loginpage";
		 }
	});
} */
</script>


</body>
</html>

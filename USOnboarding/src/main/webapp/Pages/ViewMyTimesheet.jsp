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
	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" /> -->
<link rel="stylesheet" type="text/css" href="resources/dist/bootstrap-clockpicker.min.css">
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
							<h5 class="card-header">Search My Timesheet</h5>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
										    <input type="hidden" name="emptype" id="emptype" value="${emptype}">
											<input type="hidden" name="role" id="role" value="${role}"> 
											<input type="hidden" name="dept" id="dept" value="${dept}">
											<input type="hidden" name="lgworkAuth" id="lgworkAuth" value="${lgworkAuth}">
											<input type="hidden" name="lgfullname" id="lgfullname" value="${lgfullname}">
											<input type="hidden" name="loginUserid" id="loginUserid" value="${loginUserid}">
											<input type="hidden" name="month" id="smonth" value="${month}">
											<input type="hidden" name="year" id="syear" value="${year}">
											
											
										<fieldset>
											<form action="mytimesheet" method="post"
												class="form-horizontal">
												<div class="form-group row">
													<div class="col-lg-2">
														<select id="year" name="year" class="form-control"
															style="height: 39px; border: 2px solid #ccc;">
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
		
														</select>
													</div>
													<div class="col-lg-2" id="mnt">
														<select id="month" autocomplete="off" name="month"
															class="form-control" onchange="getPeriod()"
															style="height: 39px; border: 2px solid #ccc;">
															<option value="">--Select Month--</option>
															<c:forEach var="ml" items="${monthsList}">
																<%-- <option value="${ml}">${ml}</option> --%>
																 <option value="${ml}" ${ml eq month ? 'selected="selected"' : ''}>${ml}</option>
															</c:forEach>
														</select>
													</div>
													<c:if test="${emptype eq 'W2 Admin'}">
													<div class="col-lg-2" style="display: none">
														<select name="customertype" autoComplete="off"
															class="form-control text-left" id="customertype">
															<option value="" selected="selected">--Select Customer--</option>
															<c:forEach var="plist" items="${cutomerList}">
															<c:choose>
													<c:when test="${not empty plist.custname}">
													<option value="${plist.payrate_id}" ${plist.payrate_id == customertype ? 'selected="selected"' : ''}>
													${plist.custname}
													</option>
													</c:when>
													<c:otherwise>
													<option value="${plist.payrate_id}" ${plist.payrate_id == customertype ? 'selected="selected"' : ''}>
													TekSkills In-house Project
													</option>
													</c:otherwise>
													</c:choose>
													
													<%-- <option value="${plist.payrate_id}">${plist.custname}</option> --%>
													</c:forEach>
															<%-- <c:forEach var="custl" items="${cutomerList}">
																<option value="${custl.companyId}"
																	${custl.companyId eq customertype ? 'selected="selected"' : ''}>${custl.companyName}</option>
															</c:forEach> --%>
														</select>
													</div>
													</c:if>
													<c:if test="${emptype ne 'W2 Admin'}">
													<div class="col-lg-2">
														<select name="customertype" autoComplete="off"
															class="form-control text-left" id="customertype">
															<option value="" selected="selected">--Select Customer--</option>
															<c:forEach var="plist" items="${cutomerList}">
													<c:choose>
													<c:when test="${not empty plist.custname}">
													<option value="${plist.payrate_id}" ${plist.payrate_id == customertype ? 'selected="selected"' : ''}>
													${plist.custname}
													</option>
													</c:when>
													<c:otherwise>
													<option value="${plist.payrate_id}" ${plist.payrate_id == customertype ? 'selected="selected"' : ''}>
													TekSkills In-house Project
													</option>
													</c:otherwise>
													</c:choose>
													<%-- <option value="${plist.payrate_id}">${plist.custname}</option> --%>
													</c:forEach>
															<%-- <c:forEach var="custl" items="${cutomerList}">
																<option value="${custl.companyId}"
																	${custl.companyId eq customertype ? 'selected="selected"' : ''}>${custl.companyName}</option>
															</c:forEach> --%>
														</select>
													</div>
													</c:if>
													

													<div class="col-lg-2" id="mnt" style="display: none">
														<select id="status" autocomplete="off" name="status"
															class="form-control" 
															style="height: 39px; border: 2px solid #ccc;">
															<option value="">--Select Status--</option>
															<option value="Submitted">Submitted</option>
															<option value="Approved">Approved</option>
															<option value="Rejected">Rejected</option>
														</select>
													</div>
													<div class="col-sm-2">
														<input type="submit"
															style="background: #205081; height: 39px; border: 2px solid #ccc;"
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
									<h5 class="card-header" style="padding: .2rem;">View My Timesheet
										Details</h5>
									<div class="card-body">
										<div style="text-align: center;"></div>
										<div style="max-width: 1200px;">
											<table id="employeeTableId"
												class="table table-hover table-bordered"
												style="text-align: center;">
												<thead>
													<tr>
													 <th style="text-align: center;display:none">CandidateName</th>
														<th style="text-align: center;display:none">Year</th>
														<th style="text-align: center;display:none">Month</th> 
														<th style="text-align: center">From Date</th>
														<th style="text-align: center">To Date</th>
														<c:if test="${emptype eq 'W2' || emptype eq 'C2C'  || emptype eq '1099'}">
														<th style="text-align: center">Customer Name</th>
														</c:if>
														<th style="text-align: center;display:none">Week</th>
														 <th style="text-align: center;display:none">Timesheet Status</th> 
														<th style="text-align: center">Verifier Status</th>
														<th style="text-align: center">Verifier Name</th>
														<!-- <th style="text-align: center">HR Status</th>
														<th style="text-align: center">HR Name</th> -->
														<th style="text-align: center; display: none;">ManagerComments</th>
													<!-- 	<th style="text-align: center;  display: none;">HRComments</th> -->
														<th style="text-align: center">Action</th>

													</tr>
												</thead>
												<tbody>

													<c:forEach var="rlist" items="${timesheetList}">
														<tr>
														<input type="hidden" id="canid" value="${rlist.candidate_id}">
														<input type="hidden" id="tsid" value="${rlist.timesheet_id}">
														<td style="display:none">${rlist.fullname}</td>
															<td id="yeartd${rlist.timesheet_id}" style="display:none">${rlist.year}</td>
															<td id="monthtd${rlist.timesheet_id}" style="display:none">${rlist.month}</td>
															<td id="fdatetd${rlist.timesheet_id}">${rlist.fromdate}</td>
															<td id="tdatetd${rlist.timesheet_id}">${rlist.todate}</td>
															<c:if test="${emptype eq 'W2' || emptype eq 'C2C'  || emptype eq '1099'}">
															<td>${rlist.customer_name}</td>
															</c:if>
															<td id="periodtd${rlist.timesheet_id}" style="display:none">${rlist.week_or_period}</td>
															<td id="ts_status${rlist.timesheet_id}" style="display:none">${rlist.timesheet_status}</td>
															<td>${rlist.manager_status}</td>
															<%-- <td>${rlist.hr_status}</td> --%>
															<td>${rlist.manager_name}</td>
															<%-- <td>${rlist.hr_name}</td> --%>
															
															<td id="mgr_com${rlist.timesheet_id}" style="display: none;">${rlist.manager_comments}</td>
															<%-- <td id="hr_com${rlist.timesheet_id}" style="display: none;">${rlist.hr_comments}</td> --%>
															
															<td><button class="btn btn-success btn-sm"
																	onclick="getDetailsByCanId('${rlist.candidate_id}','${rlist.timesheet_id}')"
																	data-toggle="modal"
																	style="padding: 2px 1px; font-size: 12px;">View</button>
																	
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
		<div class="modal fade" id="statusmodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width:79%" role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding:.5rem;">
							<button class="close" data-dismiss="modal"
									aria-label="Close"><span aria-hidden="true">&times;</span>
								</button>
									<h5 class="modal-title" id="exampleModalLabel"
										style="font-size: 15px">
										<b>Timesheet Details</b>
									</h5>
							</div>
							<div class="modal-body">
								<form action="/"  id="formid" name="formid" enctype="multipart/form-data">
									<div class="row">
										<div class="col-md-10 col-sm-12">
										<input type="hidden" id="candidate_id" name="canidateId">
										<input type="hidden" id="timesheetId" name="timesheetId">
										<input type="hidden" id="fdate" name="fdate">
										<input type="hidden" id="tdate" name="tdate">
										
										<!-- <input type="text" id="tablength" name="tablength"> -->
										<center>Note : <span id="usermsg" style="color: blue;font-size: smaller;">Please enter comments if you have any Leaves or NonBillable or OverTime Hours ,or  Billable Hours not equal to 8 hours.<br> 00:00 should be entered in Billable Hours section when leave is taken or Holiday</span><br></center>
										<table id="i9fromTable"
											class="table table-hover table-bordered"
											style="text-align: center;">
											<thead>
												<tr>
													<th style="text-align: center">Date</th>
													<th style="text-align: center">Day</th>
													<th style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BillableHours</th>
													<th style="text-align: center">NonBillableHours</th>
													<th style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OverTime</th>
													<th style="text-align: center">Leaves</th>
													<th style="text-align: center">Comments</th>
												</tr>
											</thead>
											<tbody id="tsdetails">
												
											</tbody>
										</table></div></div>
										<div>
									<center>	<div class="form-group row">
														<label class="col-sm-4 col-form-label">
															Manager Approved Timesheet <Span id="mat" style="color:red;">*</Span>:</label>
														<div class="col-sm-4">
														<%-- <c:if test="${lgemptype eq 'W2 Admin' || lgemptype eq 'Admin'}">
															<input type="file" name="mgrapprovedts" id="mgrapprovedts">
															</c:if>
															<c:if test="${lgemptype ne 'W2 Admin' || lgemptype ne 'Admin'}">
															<input type="file" name="mgrapprovedts" id="mgrapprovedts" required >
															</c:if> --%>
															<input type="file" name="mgrapprovedts" id="mgrapprovedts">
															<br>
															
															<b><span id="mgrfilename" style="color: blue" onclick="downloadManagerfile(this)"></span></b>
														</div></div>
													
												
										<div class="form-group row">
														<label class="col-sm-4 col-form-label">
															Leave Letter:</label>
														<div class="col-sm-4">
														<c:if test="${role ne 4}">
															<input type="file" name="leaveletter" id="leaveletter" multiple required>
														</c:if>
															<span id="leavefilename" style="color: blue"></span><br>	
														</div>
												</div></center>
												<%-- <div class="col-md-12 col-sm-12" >
													<center><table 
														class="table table-hover table-bordered"
														style="text-align: center;">
														<thead>
															<tr>
																<th style="text-align: center">Manager Comments</th>
																<th style="text-align: center">HR Comments</th>
															</tr>
														</thead>
														<tbody>
															<tr>
															<td><span id="amgr_com"></span></td>
															<td><span id="ahr_com"></span></td></tr>
														</tbody>
													</table></center>
													</div> --%>
									<div class="form-group row"  id="comid" style="display: none">
										<label class="col-sm-4 col-form-label">Verifier Comments</label>
										<div class="col-sm-3">
											<textarea id="amgr_com" name="amgr_com" class="form-control" rows="4" readonly></textarea>
										</div>
									</div>
										
										<!-- <div class="form-group row">
										<label class="col-sm-4 col-form-label">Comments</label>
										<div class="col-sm-3">
											<textarea id="tscomments" name="tscomments" class="form-control" rows="4 "style="width: 180px;" readonly disabled></textarea>
										</div>
									</div> -->
								
									</div>
									
										
									<div class="form-group row">
										<div class="col-sm-12">
											<center>
											
										<button type="button" class="btn btn-primary btn-sm"
													 id="submitid" onclick="UpdateTimesheet()">Update</button>
												<button type="button" class="btn btn-secondary btn-sm"
													data-dismiss="modal">Close</button>
											</center>
										</div>
									</div>
									
								</form></div>
							</div>
						</div>
					</div>
				</div>

<!-- <form action="getmytimesheet" method="post" id="vformid" > -->
	<form action="mytimesheet" method="post" id="vformid" >
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
	<!--	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script> -->
<script type="text/javascript" src="resources/dist/bootstrap-clockpicker.min.js"></script>
<script src="resources/preDefined/goback.js"></script>
		<script>
function updateStatus(){
	getsesVal().done(function(data){
		if(data!=""){
var status=$('#statusid').val();
var candidate_id=$('#candidate_id').val();
var timesheetId=$('#timesheetId').val();
var tscomments=$('#tscomments').val();
$('#formid').formValidation('validate');
if( !$('#formid').data('formValidation').isValid())
	 {
	 }
else{ 
$.ajax({
	    url: "updatetsstatus", //this is the submit URL
	    type: "POST",
	    asyn : false,
	    data: {"candidateid":candidate_id,"status":status,"timesheetId":timesheetId,"tscomments":tscomments},
	    success: function(response){
	    	 if(response!=null || response!=""){
  	 alert(response)
  	document.getElementById("vformid").submit();
   	}else{
       	window.location.href="loginpage";
       }
	    }
	});
  }
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
	    	 leaveletter: {
	    		 enabled: false, 
		            validators: {
		            	notEmpty: {
		                   message: 'Upload leave letter'
		                }
		            }
	        },
	         mgrapprovedts:{
	        	 enabled: false, 
	            validators: {
	            	isEmpty: {
	                    message: 'Upload manager apporved timesheet'
	                }
	            }
	        }, 
	        status:{
	            validators: {
	            	notEmpty: {
	                    message: 'Select status'
	                }
	            }
	        },
	        tscomments:{
	            validators: {
	            	notEmpty: {
	                    message: 'Enter comments'
	                }
	            }
	        },
	        'billablehrs[]' : {
	            validators: {
	            	notEmpty: {
	                    message: 'Billable hour is mandatory'
	                },
	                stringLength: {
	                    min: 1,
	                    max: 2,
	                    message: 'Billable hours length 5'
	                },
	                regexp: {
	                	  regexp: /^[0-9]$/,
	                	  message: 'Accepts only numbers'
	                },
	            }
	        },
	        'nonbillablehrs[]': {
	            validators: {
	            	notEmpty: {
	                    message: 'Non billable hour is mandatory'
	                },
	                stringLength: {
	                    min: 1,
	                    max: 2,
	                    message: 'Non billable hours length 5'
	                },
	                regexp: {
	                   regexp: /^[0-9]$/,
	                   message: 'Accepts only numbers'
	                },
	            }
	        },
	        'over_time[]': {
	            validators: {
	            	notEmpty: {
	                    message: 'Over time is mandatory'
	                },
	                stringLength: {
	                    min: 1,
	                    max: 2,
	                    message: 'Over time length 5'
	                },
	                regexp: {
	                   regexp: /^[0-9]$/,
	                   message: 'Accepts only numbers'
	                },
	            }
	        },
	        'comments[]':{
	            validators: {
	            	notEmpty: {
	                    message: 'Please enter comments'
	                }
	            }
	        },
	        'leave[]':{
	            validators: {
	            	notEmpty: { 
	                    message: 'Please enter leave'
	                }
	               /*  regexp: {
	                	  regexp: /^[0-9]$/,
	                   message: 'Accept only numbers'
	                } */
	            }
	        }
	    }
	});
</script>
	<script>
	var lgworkAuth=$('#lgworkAuth').val();
	var lgemptype=$('#emptype').val();
	var loginUserid=$('#loginUserid').val();	
	
	if(lgemptype=="W2 Admin" || lgemptype=="Admin"){
		 $('#mat').hide();
		 }else{
			 $('#mat').show();
			 }
	 
var table = $('#i9fromTable').DataTable({
	"paging":   false,
    "ordering": false,
    "info":     false,
    "searching": false
 }); 


function UpdateTimesheet(){
 	$('#formid').formValidation('validate');
	if(lgemptype=="W2 Admin" || lgemptype=="Admin"){
		 $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',false);
		 }/* else{
			 $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',true); 
			 } */
	
		if( !$('#formid').data('formValidation').isValid())
			 {
			 }
		else{ 
			
			var array=[];
			var	rowvalue=true;
			var	billablerowvalue=true;
			var arrayleave=[];
			var arraybillable=[];
			var	rowvalueleave=true;var arrayovertime=[];
			var	billablecheckvlaue=true;var arraybillablecheck=[];
			var	overtimeValue=true;
			var	commentvalue=true;var arraycomment=[];
	      $('#i9fromTable tr').each(function(row, tr){
	          if(row!=0){
		    	    date = $(tr).find('td:eq(0)').text()
	          		dayname =$(tr).find('td:eq(1) input').val()
	          		billhrs =$(tr).find('td:eq(2) input').val()
	       			nonbillhrs =$(tr).find('td:eq(3) input').val()
	       			overtime =$(tr).find('td:eq(4) input').val()
	     			leave = $(tr).find('td:eq(5) input').val()
	     			comments =$(tr).find('td:eq(6) textarea').val()
	     			
	     			if((billhrs=="" || billhrs=='') && (dayname=='Monday' || dayname=='Tuesday'  || dayname=='Wednesday'  || dayname=='Thursday' || dayname=='Friday')){
     					$(tr).find('td:eq(6) textarea').focusout();
     					$(tr).find('td:eq(2) input').attr("placeholder", "Select Billable hours").css( "border-color", "red" ).focus();
         				billablecheckvlaue=false;
     	          		arraybillablecheck.push(billablecheckvlaue);
     			}
 				if((billhrs=="00:00") && comments==""){
 				$(tr).find('td:eq(6) textarea').attr("placeholder", "Enter Comments").css( "border-color", "red" ).focus();
     					billablerowvalue=false; arraybillable.push(billablerowvalue);
    	          		commentvalue=false;arraycomment.push(commentvalue);
 				}  
     			else{
     				var hrs;
     				if(billhrs=="10:00"){hrs=10;}
     				else if(billhrs=="11:00"){hrs=11;}else if(billhrs=="12:00"){hrs=12;}else if(billhrs=="13:00"){hrs=13;}
     				else if(billhrs=="14:00"){hrs=14;}else if(billhrs=="15:00"){hrs=15;}else if(billhrs=="16:00"){hrs=16;}
     				else if(billhrs=="17:00"){hrs=17;}else if(billhrs=="18:00"){hrs=18;}else if(billhrs=="19:00"){hrs=19;}
     				else if(billhrs=="20:00"){hrs=20;}else if(billhrs=="21:00"){hrs=21;}else if(billhrs=="22:00"){hrs=22;}
     				else if(billhrs=="23:00"){hrs=23;}else if(billhrs=="24:00"){hrs=24;}
     				else{hrs = billhrs.substring(1, 2);}
     				
     				if((hrs>8) && comments==""){
    	    	    	/*  if((hrs>0)){
    	          		 $(tr).find('td:eq(6) textarea').focusout();
    	          		 billablerowvalue=false; arraybillable.push(billablerowvalue); */
    	          		 $(tr).find('td:eq(6) textarea').attr("placeholder", "Enter Comments").css( "border-color", "red" ).focus();
         			billablerowvalue=false;	arraybillable.push(billablerowvalue);
         			commentvalue=false;	arraycomment.push(commentvalue);
    	     	           		} 
	    	    if((hrs>8) && (nonbillhrs!="" || nonbillhrs!="00:00") && comments!=""){
	    	    	$(tr).find('td:eq(6) textarea').attr("placeholder", "Enter Comments").css( "border-color", "red" ).focus();
	          		 billablerowvalue=false; arraybillable.push(billablerowvalue);
	          		rowvalue=false; array.push(rowvalue);
	     	           		} 
     		   if((hrs>0 && hrs<8) && comments==""){
     		 	$(tr).find('td:eq(6) textarea').attr("placeholder", "Enter Comments").css( "border-color", "red" ).focus();
     			billablerowvalue=false;	arraybillable.push(billablerowvalue);
     			commentvalue=false;	arraycomment.push(commentvalue);
	           		}  
			if((nonbillhrs!="" && nonbillhrs!="00:00") && comments==""){
				     $(tr).find('td:eq(6) textarea').attr("placeholder", "Enter Comments").css( "border-color", "red" ).focus();
				     rowvalue=false; array.push(rowvalue);
				     commentvalue=false; arraycomment.push(commentvalue);
				     billablerowvalue=false;	arraybillable.push(billablerowvalue);
				}
			if((overtime!="" && overtime!="00:00") && comments==""){
				$(tr).find('td:eq(6) textarea').attr("placeholder", "Enter Comments").css( "border-color", "red" ).focus();
				overtimeValue=false;arrayovertime.push(overtimeValue);
				commentvalue=false;arraycomment.push(commentvalue);
				billablerowvalue=false;	arraybillable.push(billablerowvalue);
			}
			if((leave!="" && leave!=0)){
				rowvalueleave=false;
				arrayleave.push(rowvalueleave);
				}
	    	    }
	          }
		           }); 
	         var tablength = document.getElementById("i9fromTable").rows.length;
	         var leavefilename = $('#leaveletter').val();
	       	var mgrapprovedfile = $('#mgrapprovedts').val();
	       	var leavefilespan = $('#leavefilename').text();
	       	var mgrfilespan = $('#mgrfilename').text();
	       	if(arraybillablecheck.includes(false)){
	          	 alert("Please fill the timesheet before submitting");
	          	}
	          	else if(arraycomment.includes(false)){
	      			alert("Please enter comments");
	      		}
	     else{
	    	  
	    	 if(lgemptype=="W2 Admin" || lgemptype=="Admin"){
	             if(arrayleave.includes(false) && (leavefilename=="" && leavefilespan=="")){
	           		  alert("Please upload leave letter");
	           		  $('#formid').bootstrapValidator('enableFieldValidators','leaveletter',true);
	           		  $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',false);
	                 }else{
	               	  $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',false);
	               	  $('#tablength').val(tablength-1)
	     				fnUpdateTimesheet()
	                 }
	   	  }
	   	  else{//lgemptype=="W2" || lgemptype=="1099" "C2C"
	    	 if(array.includes(false) && arraybillable.includes(false)){
	    		 if(arrayleave.includes(false) && (leavefilename=="" && leavefilespan=="")){
 	       			alert("Please upload leave letter");
          		  $('#formid').bootstrapValidator('enableFieldValidators','leaveletter',true);  
                 }else{
	          	  if(mgrapprovedfile=="" && mgrfilespan!=""){
	          		$('#tablength').val(tablength-1)
		       		fnUpdateTimesheet()
	          	  }else{
	       		  alert("Please upload manager approved timesheet");
	       		  $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',true);
	       	  }}
	             }
	    	 
	         else{
	        	 
	        	 
	        	 if(arraybillable.includes(false) && mgrapprovedfile==""){
	        		 
	        		 if(arrayleave.includes(false) && (leavefilename=="" && leavefilespan=="")){
	  	       			alert("Please upload leave letter");
	           		  $('#formid').bootstrapValidator('enableFieldValidators','leaveletter',true);  
	                  }else{
	       		 if(mgrapprovedfile=="" && mgrfilespan!=""){
	       			$('#tablength').val(tablength-1)
		       		fnUpdateTimesheet()
	       		 }else{
	       			   alert("Please upload manager approved timesheet");
	            		  $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',true);
	                   }
	       		 }}
	        	 
	       	   else if(arraybillable.includes(false) && array.includes(false)){
		       		if(mgrapprovedfile=="" && mgrfilespan!=""){
		       			$('#tablength').val(tablength-1)
			       		fnUpdateTimesheet()
		       		}else{
		               		  $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',true);
		               	  }
		                     }
	            else if(arrayovertime.includes(false)){
	            	if(mgrapprovedfile=="" && mgrfilespan!=""){
	            		 
	            	  }else{
	            		  $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',true);  
	            	  }
	                       }
	             else if(arraybillable.includes(false) && arrayleave.includes(false)){
	                	 if((mgrapprovedfile=="" && mgrfilespan!="") && (leavefilename=="" && leavefilespan!="")){
		            		  $('#tablength').val(tablength-1)
			       				fnUpdateTimesheet()
		            	  }else{
		            		  alert("Please upload manager approved timesheet and leave letter")
		            		  $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',true);
		            		  $('#formid').bootstrapValidator('enableFieldValidators','leaveletter',true);
		            	  }
	                       }
	                 else{
	                     	$('#formid').bootstrapValidator('enableFieldValidators','leaveletter',false); 
	            	 			 $('#tablength').val(tablength-1)
	            				fnUpdateTimesheet()
	            			}
	                 }
	   	  }
	   	}//else
	       	
	      
		}
	      
	}
function fnUpdateTimesheet(){
	getsesVal().done(function(data){
		if(data!=""){
	$("#candidate_id").val($("#candidate_id").val());
	$("#timesheetId").val($("#timesheetId").val())
	//$("#fdate").val($("#fdatetd").val())
	//$("#tdate").val($("#tdatetd").val())
	$("#submitid").attr("disabled",true);
	 var form = $('#formid')[0];
    var data = new FormData(form);
	$.ajax({
           url: "updatetimesheet", //this is the submit URL
           type: "POST",
           enctype: 'multipart/form-data',
           data: data,
           processData: false,
           contentType: false,
           cache: false,
           success: function(response){
        	   if(response!=null || response!=""){
  	            alert(response);
  	          document.getElementById("vformid").submit();
       	}else{
           	window.location.href="loginpage";
           }
           }
       });
		}else{
			 window.location.href="loginpage";
		}
	});
}
$( "#statusid" ).change(function() {
	var status=$('#statusid').val();
	var tsid=$('#tsid').val();
	 var db_status=$("#ts_status"+tsid).html();
	if(status==db_status){
		 $('#updateid').attr("disabled",true);
	}
	else{
		 $('#updateid').attr("disabled",false);
		}
	
	});
$('#comid').hide();
function getDetailsByCanId(candidateid,timesheet_id){
	getsesVal().done(function(data){
		if(data!=""){
    $('#leavefilename').empty();
	$('#timesheetId').val(timesheet_id);
	 $('#candidate_id').val(candidateid);
	 var fdate=$("#fdatetd"+timesheet_id).html();
	 var tdate=$("#tdatetd"+timesheet_id).html();
	 $("#fdate").val(fdate);
	 $("#tdate").val(tdate);
	 
	 var ts_status=$("#ts_status"+timesheet_id).html();
	 var mgr_com=$("#mgr_com"+timesheet_id).html();
	 var hr_com=$("#hr_com"+timesheet_id).html();
	 $("#amgr_com").val('');
	// || hr_com!="" $("#ahr_com").text('');
	 if(mgr_com!=""){
		 $('#comid').show();
		 $("#amgr_com").val(mgr_com); 
		 //$("#ahr_com").text(hr_com);
	   }else{
		   $('#comid').hide();
	   }
	
	 if(ts_status=="Approved"){
			$('#submitid,#updateid').attr("disabled",true);
	 		}else{
	 		$('#submitid,#updateid').attr("disabled",false);
	 	 	}
	
	  $.ajax({
 	    url: "getTimesheetDetailsById", //this is the submit URL
 	    type: "POST",
 	    asyn : false,
 	    data: {"candidateid":candidateid,"timesheet_id":timesheet_id},
 		//contentType: "application/json",
 	    success: function(response){
 	    	 var dateNow = new Date();
 	    	 if(response!=null || response!=""){
 	 	 	    var tsDetails=response.tsDetails;
 	 	 	 	var detailedTSList=response.detailedTSList;
 	 	 		var leavefilesList=response.leavefilesList;
 	 	 	    var mgr_appr_filename=tsDetails.client_mgr_approved_fie;
 	 	 	    if(mgr_appr_filename!=""){
 	 	 	    	$('#mgrfilename').text(mgr_appr_filename);
 	 	 	 	    }else{
 	 	 	 	    $('#mgrfilename').text("");
 	 	 	 	    }
 	 	 		/* var tscomments= */$('#tscomments').val(tsDetails.manager_comments);
 	 	 		var stsvalue=[];
 	 	 		var mgrsts=tsDetails.manager_status;
 	 	 		var hrsts=tsDetails.hr_status;
 	 	 		var tssts=tsDetails.timesheet_status;
 	 	 		stsvalue.push(tssts);
 	 	 		if(mgrsts!=null){
 	 	 			stsvalue.push(mgrsts);
 	 	 		}
				if(hrsts!=null){
					stsvalue.push(hrsts);
 	 	 		}
				if(stsvalue!=""){
					if(stsvalue.includes("Rejected") || stsvalue.includes("Submitted")){
	 	 	 			 $('#submitid').attr("disabled",false);
	 	 	 	 		}else{
	 	 	 	 		  $('#submitid').attr("disabled",true);
	 	 	 	 	    }
				}
				
 	 	 		var $dd = $("select[name='tsstatus']");
 	 			 $dd.find('option[value="' + tsDetails.timesheet_status + '"]').attr('selected', true);
 	 			
 	 	 	    
 	 	      if (table) table.clear();
   	    	 $.each(detailedTSList, function(i, item) {
                  table.row.add([
                 	 '<input type="text" name="dates[]" id="dates" readonly value='+ item.date+' max="5" style="width: 100px;" class="form-control">'
                 	 ,'<input type="text" name="dayname[]" id="dayname" readonly value="'+ item.day_name+'" min="5" max="5" style="width: 100px;" class="form-control">'
                 	,'<div class="input-group clockpicker" id="datetimepicker'+ i+'" data-target-input="nearest"><input type="text" value="'+ item.billable_hours+'"  class="form-control" onkeydown="return false" datetimepicker-input" name="billablehrs[]" id="billablehrs'+i+'" data-target="#datetimepicker'+i+'"><div class="input-group-append" data-target="#datetimepicker'+ i+'" data-toggle="datetimepicker"><span class="input-group-addon"><i class="fa fa-clock-o"></i></span></div>'
                 	 ,'<div class="input-group clockpicker" id="datetimepickernon'+i+'" data-target-input="nearest"><input type="text"  value="'+ item.nonbillable_hours+'"  class="form-control" onkeydown="return false" datetimepicker-input" name="nonbillablehrs[]" id="nonbillablehrs'+i+'" data-target="#datetimepickernon'+i+'"><div class="input-group-append" data-target="#datetimepickernon'+ i+'" data-toggle="datetimepicker"><span class="input-group-addon"><i class="fa fa-clock-o"></i></span></div>'
                 	,'<div class="input-group clockpicker" id="overtimedatetimepicker'+i+'" data-target-input="nearest"><input type="text" value="'+ item.over_time+'" class="form-control"  onkeydown="return false" datetimepicker-input" name="over_time[]" id="over_time'+i+'"  data-target="#overtimedatetimepicker'+i+'"><div class="input-group-append" data-target="#overtimedatetimepicker'+ i+'" data-toggle="datetimepicker"><span class="input-group-addon"><i class="fa fa-clock-o"></i></span></div>'
                 	 /* ,'<input type="number" name="billablehrs[]" id="billablehrs" value="'+ item.billable_hours+'"  on  step="0.5" min="0.5" max="24" style="width: 90px;" class="form-control" >'
                 	 ,'<input type="number" name="nonbillablehrs[]" id="nonbillablehrs" value="'+ item.nonbillable_hours+'"   step="0.5" min="0.5" max="24"  style="width: 90px;" class="form-control">' */
                 	 ,'<input type="number" name="leave[]" id="leave" onkeydown="return false"  value="'+ item.leaves+'" step="0.5"  min="0" max="1"  style="width: 90px;" class="form-control">'
                 	 ,'<textarea name="comments[]" id="comments" value="'+ item.comments+'" style="width: 240px;" class="form-control">'+ item.comments+'</textarea>'])
                 	 .draw();
              	 	
                  $('#datetimepicker'+i).clockpicker({
              		placement: 'bottom',
              		align: 'left',
              		autoclose: true,
              		'default': '08:00'
              	});
                
                $('#datetimepickernon'+i).clockpicker({
            		placement: 'bottom',
            		align: 'left',
            		autoclose: true,
            		'default': '00:00'
            	  });
                
                $('#overtimedatetimepicker'+i).clockpicker({
            		placement: 'bottom',
            		align: 'left',
            		autoclose: true,
            		'default': '00:00'
            	  });
             	/*  $('#datetimepicker'+i).datetimepicker({
             		use24hours: true,
                    format: 'HH:mm',
                      defaultDate:moment(dateNow).hours(8).minutes(0),  
                    defaultTime: false,
                    pickDate: false,
                    pickSeconds: false,
                 });
           	 $('#datetimepickernon'+i).datetimepicker({
           		use24hours: true,
                format: 'HH:mm',
                  defaultDate:moment(dateNow).hours(0).minutes(0),  
                defaultTime: false,
                pickDate: false,
                pickSeconds: false,
                });
           	 $('#overtimedatetimepicker'+i).datetimepicker({
          	  use24hours: true,
              format: 'HH:mm',
                defaultDate:moment(dateNow).hours(0).minutes(0),  
              defaultTime: false,
              pickDate: false,
              pickSeconds: false,
             });  */
         	 $("#billablehrs"+i).val(item.billable_hours);
        	$("#nonbillablehrs"+i).val(item.nonbillable_hours);
        	$("#over_time"+i).val(item.over_time);
        	

             	 }); 
   	    	$('#statusmodal').modal('show');
         	 if(leavefilesList!=""){
             	 var ftype="";
         		$.each(leavefilesList, function(i, item) {
         			  let node = document.createElement('li');
         			  node.innerHTML = '<span id="files'+item.leaves_id+'" onclick="downloadFile('+item.leaves_id+')">'+item.leave_filename+'</span> <i style="color:red" onclick="Delete('+item.leaves_id+','+candidateid+','+timesheet_id+')" class="fa fa-trash"></i>';
         			  document.getElementById('leavefilename').appendChild(node);
   	     	});
   	    	
   	    }
 	 	 	    
 	   }else{
          	window.location.href="loginpage";
          }
     	  
 	    }
 	});
		}else{
			 window.location.href="loginpage";
		}
	});
}
function Delete(leaveid,canid,tsid){
	getsesVal().done(function(data){
		if(data!=""){
	$.ajax({
	    url: "deleteLeaveLetter", //this is the submit URL
	    type: "POST",
	    asyn : false,
	    data: {"leaves_id":leaveid},
	    success: function(response){
	    	 if(response!=null || response!=""){
	    	getDetailsByCanId(canid,tsid);
	    	$('#leavefilename').empty();
	    }else{
          	window.location.href="loginpage";
          }
	    }
	});
		}else{
			 window.location.href="loginpage";
		}
	});
}
function downloadFile(fid){
	getsesVal().done(function(data){
		if(data!=""){
	var filetype="";
	var id =$('#files'+fid).text();
	var candidate_id =$('#candidate_id').val();
	if(id==""){
		alert("File not available");
		}else{
	var res = encodeURIComponent(id);
	window.location.href="downloadocs?filename="+res+"&filetype="+filetype+"&candidate_id="+candidate_id;
		}
		}else{
			 window.location.href="loginpage";
		}
	});
	}

function downloadManagerfile(ele){
	getsesVal().done(function(data){
		if(data!=""){
	var filetype="";
	var id =$('#mgrfilename').text();
	var candidate_id =$('#candidate_id').val();
	if(id==""){
		alert("File not available");
		}else{
	var res = encodeURIComponent(id);
	window.location.href="downloadocs?filename="+res+"&filetype="+filetype+"&candidate_id="+candidate_id;
		}
		}else{
			 window.location.href="loginpage";
		}
	});
	}
	
	/*
	var array=[];
			var	rowvalue=true;
			var arrayleave=[];
			var	rowvalueleave=true;
			var	billablerowvalue=true;
			var arraybillable=[];
            $('#i9fromTable tr').each(function(row, tr){
                if(row!=0){
   	    	    date = $(tr).find('td:eq(0)').text()
                dayname =$(tr).find('td:eq(1)').text()
                billhrs =$(tr).find('td:eq(2) input').val()
             	nonbillhrs =$(tr).find('td:eq(3) input').val()
           		leave = $(tr).find('td:eq(4) input').val()
           		comments =$(tr).find('td:eq(5) textarea').val()
           		
           		var hrs = billhrs.substring(1, 2);
        		   if((hrs<8 && hrs!="") && comments==""){
        		 $(tr).find('td:eq(5) textarea').focus();
        		billablerowvalue=false;
        		arraybillable.push(billablerowvalue);
	           		}   
           		
				if(nonbillhrs!="" && comments==""){
					     $(tr).find('td:eq(5) textarea').focus();
					     rowvalue=false;
					     array.push(rowvalue);
					}

   	    	 if((leave!="" && leave!=0)){
					rowvalueleave=false;
					arrayleave.push(rowvalueleave);
					}
                }
   	           }); 
	       
            if(array.includes(false)){
            }
                	else{
                		
                		var filespan = $('#leavefilename').text();
                   	 var filename = $('#leaveletter').val();
                   	if(arraybillable.includes(false)){
                     	//$('#formid').bootstrapValidator('enableFieldValidators','leaveletter',true); 
                        }
                    else 
                       if(arrayleave.includes(false) && filename==""){
                        	$('#formid').bootstrapValidator('enableFieldValidators','leaveletter',true); 
                           }else{
                               
                           	$('#formid').bootstrapValidator('enableFieldValidators','leaveletter',false); 
                     			 var tablength = document.getElementById("i9fromTable").rows.length;
                  	 			 $('#tablength').val(tablength-1)
                  				fnUpdateTimesheet()
                  			}
                       }
	*/
</script>

</body>
</html>

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
<body>
	<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">Search All Report</h5>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
										<input type="hidden" name="emptype" id="emptype"
											value="${emptype}"> <input type="hidden" name="role"
											id="role" value="${role}"> 
											<input type="hidden"	name="dept" id="dept" value="${dept}">
												<input type="hidden" name="lgworkAuth" id="lgworkAuth" value="${lgworkAuth}">
											<input type="hidden" name="lgfullname" id="lgfullname" value="${lgfullname}">
											
										<fieldset>
											<form action="viewallstatusreports" method="post"
												class="form-horizontal" id="formid">
												<div class="form-group row">
													<div class="col-lg-2">
														<select id="year" name="year" class="form-control"
															style="height: 39px; border: 2px solid #ccc;">
															<script>
											   var myDate = new Date();
												var year = myDate.getFullYear();
												for (var i = year; i < year + 2; i++) {
												document.write('<option value="'+i+'">'+ i+ '</option>');
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
																<option value="${ml}">${ml}</option>
															</c:forEach>
														</select>
													</div>

													<div class="col-lg-2" id="mnt">
														<select id="period" autocomplete="off" name="period"
															class="form-control"
															style="height: 39px; border: 2px solid #ccc;">
															<option value="">--Select Period--</option>

														</select>
													</div>
													<div class="col-lg-2" id="mnt">
														<select id="status" autocomplete="off" name="status"
															class="form-control" 
															style="height: 39px; border: 2px solid #ccc;">
															<option value="">--Select Status--</option>
															<option value="Submitted">Submitted</option>
															<option value="Approved">Approved</option>
															<option value="Rejected">Rejected</option>
														</select>
													</div>
													
													
													<div class="col-lg-2">
											     <select name="customertype" autoComplete="off" class="form-control text-left" id="customertype" >
										             <option value="" selected="selected">--Select Customer--</option>
										             <c:forEach var="custl" items="${cutomerList}">
															<%-- <option value="${custl.companyId}">${custl.companyName}</option> --%>
															
															<option value="${custl.companyId}" ${custl.companyId eq customertype ? 'selected="selected"' : ''}>${custl.companyName}</option>
														</c:forEach>
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
									<h5 class="card-header" style="padding: .2rem;">View All Status Report
										Details</h5>
									<div class="card-body">
										<div style="text-align: center;"></div>
										<!-- style="max-width: 980px; overflow-x: auto; white-space: nowrap;" -->
										<div>
											<table id="employeeTableId"
												class="table table-hover table-bordered"
												style="text-align: center;">
												<thead>
													<tr>
														<th style="text-align: center">Year</th>
														<th style="text-align: center">Month</th>
														<th style="text-align: center">Period</th>
														<th style="text-align: center">Customer Name</th>
														<th style="text-align: center">Status</th>
														<th style="text-align: center">CandidateName</th>
														<th style="text-align: center">Approved By</th>
														<th style="display: none">Periodname</th>
														<th style="text-align: center">Action</th>

													</tr>
												</thead>
												<tbody>

													<c:forEach var="rlist" items="${reportList}">
														<tr>
														<input type="hidden" id="canid" value="${rlist.candidate_id}">
															<td id="yeartd${rlist.status_report_id}">${rlist.year}</td>
															<td id="monthtd${rlist.status_report_id}">${rlist.month}</td>
															<td id="periodtd${rlist.status_report_id}">${rlist.period}</td>
															<c:if test="${empty rlist.customer_name}">
															<td>NA</td>
															</c:if>
															<c:if test="${not empty rlist.customer_name}">
															<td>${rlist.customer_name}</td>
															</c:if>
															<td>${rlist.status}</td>
															<td>${rlist.fullname}</td>
															<td>${rlist.approvedby}</td>
															<td id="periodnametd${rlist.status_report_id}"
																style="display: none">${rlist.period_name}</td>
															<td><button class="btn btn-success btn-sm"
																	onclick="getDetailsByCanId('${rlist.candidate_id}','${rlist.status_report_id}','${rlist.submitted_date}')"
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
		<div class="modal fade" id="statusmodal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header" style="padding: .5rem;">
						<button class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h5 class="modal-title" id="exampleModalLabel"
							style="font-size: 15px">
							<b>Candidate Details</b>
						</h5>
					</div>
					<div class="modal-body"  id="print">
						<form action="/" id="formidmodal">
							<div class="row">
								<div class="col-md-10 col-sm-12">
									<input type="hidden" id="canidateId" name="canidateId">
									<input type="hidden" id="syear" name="year"> <input
										type="hidden" id="smonth" name="month"> <input
										type="hidden" id="speriod" name="period"> <input
										type="hidden" id="speriodname" name="periodname"> <input
										type="hidden" id="statureportId" name="statureportId">

									<div class="form-group row">
										<label class="col-sm-4 col-form-label">Candidate Name</label>
										<div class="col-sm-6">
											<input type="text" id="candiname" class="form-control"
												readonly>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-4 col-form-label">Client Name</label>
										<div class="col-sm-6">
											<input type="text" id="clienttname" class="form-control"
												readonly>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-4 col-form-label">Client Address</label>
										<div class="col-sm-6">
											<input type="text" id="clientaddres" class="form-control"
												readonly>
										</div>
									</div>

									<div class="form-group row">
										<label class="col-sm-4 col-form-label">Project Name</label>
										<div class="col-sm-6">
											<input type="text" id="projectname" class="form-control"
												readonly>
										</div>

									</div>
									<div class="form-group row">
												<label class="col-sm-4 col-form-label">Report Period</label>
												<div class="col-sm-6">
													<input type="text" id="reportperiod" name="reportperiod" class="form-control"
														readonly>
												</div>

											</div>
									<div class="form-group row">
										<label class="col-sm-4 col-form-label">MileStones/Deliverables</label>
										<div class="col-sm-6">
											<textarea id="delivers" name="delivers" required
												class="form-control"></textarea>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-4 col-form-label">Outputs</label>
										<div class="col-sm-6">
											<textarea  id="outputs" name="outputs" required
												class="form-control"></textarea>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-4 col-form-label">Issues/Challenges</label>
										<div class="col-sm-6">
											<textarea  id="challenges" name="challenges" required
												class="form-control"></textarea>
										</div>
									</div>
									<%-- <c:if test="${role ne 4}">
									<div class="form-group row">
										<label class="col-sm-4 col-form-label">HR Comments</label>
										<div class="col-sm-6">
											<textarea id="comments1"  readonly
												class="form-control"></textarea>
										</div>
									</div>
									</c:if> --%>
									<%-- <c:if test="${role eq 4}"> --%>
									<div class="form-group row">
										<label class="col-sm-4 col-form-label">HR Comments</label>
										<div class="col-sm-6">
											<textarea  id="comments" name="comments" 
												class="form-control"></textarea>
										</div>
									</div> 
										<div class="form-group row">
											<label class="col-sm-4 col-form-label">Approve/Reject</label>
											<div class="col-sm-6">
												<select id="statusid" autocomplete="off" name="status" required
													class="form-control">
													<option value="">--Select Status--</option>
													<option value="Approved">Approve</option>
													<option value="Rejected">Reject</option>
												</select>
											</div>
										</div>
										
									<%-- </c:if> --%>
									<%-- <jsp:useBean id="date" class="java.util.Date" />
											<fmt:formatDate value="${date}" type="date"
												pattern="dd-MMM-yyyy" /> --%>
									<!--<div class="form-group row">
										<label class="col-sm-4 col-form-label">Date</label>
										<div class="col-sm-6">
											
												<span id="sumitted_on"></span>
										</div>
									</div>-->
									
										<div class="row">
											<div class="col">
												<center>
												<%-- <c:if test="${role ne 1}">
													<button type="button" class="btn btn-primary btn-sm"
														id="submitid" onclick="updateStatus()">Submit</button>
												</c:if>
												<c:if test="${role eq 1}">
													<button type="button"  class="btn btn-primary btn-sm"
														id="updateid" onclick="updateStatus()">Update</button>
												</c:if> --%>
												<button type="button"  class="btn btn-primary btn-sm"
														id="updateid" onclick="updateStatus()">Update</button>
													<button type="button" class="btn btn-secondary btn-sm"
														data-dismiss="modal">Close</button>
														<button type="button" class="btn btn-info btn-sm"
														id="downloadid"  onclick="getPDF()"><i class="fa fa-download"></i></button> 
														<!-- <button style="background: #205081" type="button" class="btn btn-warning btn-sm" id="downloadid">
														<i class="fa fa-download" aria-hidden="true"></i></button> -->
														
												</center>
											</div>
										</div>
									
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form action="viewallstatusreports" method="post" id="vformid" >
		    <input type="hidden" name="year" value="${year}"> <input
			type="hidden" name="month" value="${month}"> <input
			type="hidden" name="period" value="${period}"> <input
			type="hidden" name="status" value="${status}">
			 <input type="hidden" name="customertype" value="${customertype}">
			</form>

	
	<script src="resources/js/js/jquery-2.1.4.min.js"></script>
	<script src="resources/js/newjs/bootstrap.min.js"></script>
	<script src="resources/js/newjs/formValidation.min.js"></script>
	<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
	<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
	<script src="resources/preDefined/goback.js"></script>
	<script>
	var lgworkAuth=$('#lgworkAuth').val();
	var lgemptype=$('#emptype').val();
	
function getPeriod(){
	getsesVal().done(function(data){
		  if(data!=""){
var month=$('#month').val();
var year=$('#year').val();
$.ajax({
    url: "getPeriod", //this is the submit URL
    type: "POST",
    asyn : false,
    data: {"month":month,"year":year},
    //contentType: "application/json",
    success: function(response){
    	if(response!=null || response!=""){
    	$('#period').empty(); 
    	$('#period').append($('<option/>').attr("value", '').text("--Select Period--"));
	     for(var i=0;i<response.length;i++)
  	   {
     	$('#period').append($('<option/>').attr("value",response[i]).text(response[i]));
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

function getDetailsByCanId(candidateid,statusreportid,sumiteddate){
	getsesVal().done(function(data){
		  if(data!=""){
	 $('#canidateId').val(candidateid);
	 $('#speriodname').val($("#periodnametd"+statusreportid).html());
	  $('#syear').val($("#yeartd"+statusreportid).html());
	  $('#smonth').val($("#monthtd"+statusreportid).html());
	  $('#speriod').val($("#periodtd"+statusreportid).html());
	  $('#statureportId').val(statusreportid);
	  $('#statureportId').val(statusreportid);
	  $('#sumitted_on').text(sumiteddate);
	  
	  var peridname=$("#monthtd"+statusreportid).html()+"("+$("#periodtd"+statusreportid).html()+")";
	  $('#reportperiod').val(peridname);
	  $.ajax({
 	    url: "getCanStusDetailsById", //this is the submit URL
 	    type: "POST",
 	    asyn : false,
 	    data: {"candidateid":candidateid,"status_reportid":statusreportid},
 		//contentType: "application/json",
 	    success: function(response){
     	   if(response!=""){
 	    	$('#candiname').val(response.fullname);
 	    	$('#projectname').val(response.projectName);
 	    	$('#clientaddres').val(response.clientAddress);
 	    	$('#clienttname').val(response.clientName);
 	    	$('#delivers').val(response.deliverables);
 	    	$('#outputs').val(response.outputs);
 	    	$('#challenges').val(response.challenges);
 	    	$('#comments').val(response.comments);
 	    	$('#comments1').val(response.comments);
 	    	
 	    	$('#statusid').val('');
 	    	var status="";
 	    	if(response.status=='Approved'){
 	    		status="Approved";
 	    		$("#submitid,#updateid").attr("disabled",true);
 	 	    	}else if(response.status=='Rejected'){
 	 	    		status="Rejected";
 	 	    		$("#submitid,#updateid").attr("disabled",false);
 	 	 	    	}else{
 	 	 	    		status="";
 	 	 	    		$("#submitid,#updateid").attr("disabled",false);
 	 	 	 	    	}
 	    	if(status!=""){
 	    		   var professionVal = $("select[name='status']");
 				 	professionVal.find('option[value="'+status+'"]').text(status).attr('selected', true);
 	    	}
 	    		
			 $('#statusmodal').modal('show');
     	   }
     	  else{
       		 if((lgemptype=="W2 Admin") && (lgworkAuth!='US Citizen' || lgworkAuth!='Green Card')){
       			$('#clientaddres,#clienttname,#projectname').removeAttr("readonly",true);
       			$('#candiname').val(response.fullname);
       			$('#clienttname').val(response.clientName);
       			$('#clientaddres').val(response.clientAddress);
       			$('#delivers').val(response.deliverables);
     	    	$('#outputs').val(response.outputs);
     	    	$('#challenges').val(response.challenges);
     	    	$('#comments').val(response.comments);
     	    	$('#comments1').val(response.comments);

       			var status="";
     	    	if(response.status=='Approved'){
     	    		status="Approved";
     	    		$("#submitid,#updateid").attr("disabled",true);
     	 	    }else if(response.status=='Rejected'){
     	 	    	status="Rejected";
     	 	    	$("#submitid,#updateid").attr("disabled",false);
     	 	 	  }else{
     	 	 	    status="";
     	 	 	    $("#submitid,#updateid").attr("disabled",false);
     	 	 	 	 }
     	    	var professionVal = $("select[name='status']");
    			 	professionVal.find('option[value="'+status+'"]').text(status).attr('selected', true);
    			 $('#statusmodal').modal('show');
       			
       			}else{
           	   alert("client details yet to be added");
         		 $('#submitid').attr("disabled",true);
       			}
             	   }
 	    }
 	});
		  }else{
				 window.location.href="loginpage";
			}
		});
}

function updateStatus(){
	getsesVal().done(function(data){
		  if(data!=""){
	var statusid= $('#statusid').val();
	var comments= $('#comments').val();
	if(statusid!=""){
	$("#submitid,#updateid").attr("disabled",true);
		 var form = $('#formidmodal')[0];
	     var data = new FormData(form);
		$.ajax({
	            url: "updatestatus", //this is the submit URL
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
		   alert("Please Select status");
	 }
		  }else{
				 window.location.href="loginpage";
			}
		});
  }
function getPDF(){
	getsesVal().done(function(data){
		  if(data!=""){
	var lgfullname=$('#lgfullname').val();
	if(lgfullname!=null){
		
	var statureportId=$("#statureportId").val()
	window.location.href="downloadpdf?statureportId="+statureportId+"";
	}else{
    	window.location.href="loginpage";
    }
		  }else{
				 window.location.href="loginpage";
			}
		});
}

</script>


</body>
</html>

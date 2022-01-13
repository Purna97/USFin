<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.net.URLDecoder"%>
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
                                                <h5 class="card-header" ><center>List Of Clients</center></h5>
                                                <div class="card-body">
                                                       <div class="row">
                                                              <div class="col-lg-12">
                                                              
										<div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span
												style="color: red;">*</Span>Select Client</label>
											<div class="col-sm-4">
												<select name="payrateid" autoComplete="off"
													class="form-control text-left" id="payrateid" required
													onchange="getStatusReportByProject()" >
													<option value="">--Select Client--</option>
													<c:forEach var="plist" items="${payrateclientList}">
													<c:choose>
													<c:when test="${not empty plist.custname}">
													<option value="${plist.payrate_id}" ${plist.payrate_id == ses_payrateid ? 'selected="selected"' : ''}>
													${plist.custname}
													</option>
													</c:when>
													<c:otherwise>
													<option value="${plist.payrate_id}" ${plist.payrate_id == ses_payrateid ? 'selected="selected"' : ''}>
													TekSkills In-house Project
													</option>
													</c:otherwise>
													</c:choose>
													<%-- <c:if test="${ses_payrateid ne 0}">
													<option value="${plist.payrate_id}" ${plist.payrate_id == ses_payrateid ? 'selected="selected"' : ''}>${plist.custname}</option>
													</c:if> --%>
													<%-- <option value="${plist.payrate_id}">${plist.custname}</option> --%>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
                                                       </div>
                                                </div>
                                         </div>
                                  </div>
                           </div>
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header" ><span style="color:yellow;">${CustomerName}</span>Pending Status Report</h5>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
										<input type="hidden" name="emptype" id="emptype"
											value="${emptype}"> <input type="hidden" name="role"
											id="role" value="${role}"> 
											<input type="hidden" name="dept" id="dept" value="${dept}">
											<input type="hidden" name="lgworkAuth" id="lgworkAuth" value="${lgworkAuth}">
											<input type="hidden" name="lgfullname" id="lgfullname" value="${lgfullname}">
											 <input type="hidden" name="prid" id="prid" value="${ses_payrateid}">
											
										<table id="employeeTableId"
											class="table table-hover table-bordered"
											style="text-align: center;">
											<thead>
												<tr>
													<th style="text-align: center">Year</th>
													<th style="text-align: center">Month</th>
													<th style="text-align: center">Period</th>
													<th style="display: none">Periodname</th>
													
													<th style="text-align: center">Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="reportlist" items="${pendingreportList}">
													<tr>
													<td id="yeartd${reportlist.template_id}">${reportlist.year}</td>
													<td id="monthtd${reportlist.template_id}">${reportlist.month}</td>
													<td id="periodtd${reportlist.template_id}">${reportlist.period}</td>
													<td id="periodnametd${reportlist.template_id}" style="display: none">${reportlist.period_name}</td>
													
													<td>
                                                    <c:if test="${reportlist.template_id eq reportlist.toprecord}">
                                                    <button class="btn btn-danger btn-sm"  
													onclick="getDetailsByCanId('${loginUserid}',${reportlist.template_id})" data-toggle="modal" 
													style="padding: 2px 1px; font-size: 12px;">Submit</button>
                                                    </c:if>
                                                    
                                                    <c:if test="${reportlist.template_id ne reportlist.toprecord}">
                                                    <button class="btn btn-danger btn-sm"  
													disabled 
													style="padding: 2px 1px; font-size: 12px;">Submit</button>
                                                    </c:if>
                                                    </td>
													<%-- <td><button class="btn btn-danger btn-sm"  
													onclick="getDetailsByCanId('${loginUserid}',${reportlist.template_id})" data-toggle="modal" 
													style="padding: 2px 1px; font-size: 12px;">Submit</button>
													</td> --%>
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

			<!-- .animated -->
		</div>
	</div>
	
	<div class="modal fade" id="statusmodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding:.5rem;">
							<button class="close" data-dismiss="modal"
									aria-label="Close"><span aria-hidden="true">&times;</span>
								</button>
									<h5 class="modal-title" id="exampleModalLabel"
										style="font-size: 15px">
										<b>Candidate Details</b>
									</h5>
							</div>
							<div class="modal-body">
								<form action="/"  id="formid">
									<div class="row">
										<div class="col-md-10 col-sm-12">
										<input type="hidden" id="canidateId" name="canidateId">
										<input type="hidden" id="syear" name="year">
										<input type="hidden" id="smonth" name="month">
										<input type="hidden" id="speriod" name="period">
										<input type="hidden" id="speriodname" name="periodname">
										<input type="hidden" id="payrate_id" name="payrate_id">
										
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Candidate Name</label>
												<div class="col-sm-6">
													<input type="text" id="candiname" name="candiname" class="form-control"
														readonly>
												</div>
											</div> 
											<div class="form-group row">
												<label class="col-sm-4 col-form-label"><Span style="color:red;">*</Span>Client Name</label>
												<div class="col-sm-6">
													<input type="text" id="clienttname" name="clienttname" class="form-control"
														readonly>
												</div>
											</div> 
											<div class="form-group row">
												<label class="col-sm-4 col-form-label"><Span style="color:red;">*</Span>Client Address</label>
												<div class="col-sm-6">
													<textarea id="clientaddres" name="clientaddres" class="form-control"
														readonly></textarea>
												</div>
											</div> 
											
											<div class="form-group row">
												<label class="col-sm-4 col-form-label"><Span style="color:red;">*</Span>Project Name</label>
												<div class="col-sm-6">
													<input type="text" id="projectname" name="projectname" class="form-control"
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
												<label class="col-sm-4 col-form-label"><Span style="color:red;">*</Span>MileStones/Deliverables</label>
												<div class="col-sm-6">
													<textarea  id="delivers" name="delivers"
														class="form-control" required></textarea>
												</div>
											</div>
												<div class="form-group row">
												<label class="col-sm-4 col-form-label"><Span style="color:red;">*</Span>Outputs</label>
												<div class="col-sm-6">
													<textarea id="outputs"  name="outputs"
														class="form-control" required></textarea>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label"><Span style="color:red;">*</Span>Issues/Challenges</label>
												<div class="col-sm-6">
													<textarea  id="challenges" name="challenges"
														class="form-control" required></textarea>
												</div>
											</div>
											<!--<div class="form-group row">
												<label class="col-sm-4 col-form-label">Date</label>
												<div class="col-sm-6">
												<jsp:useBean id="date" class="java.util.Date"/>
												<fmt:formatDate value="${date}" type="date" pattern="dd-MMM-yyyy"/>
													
												</div>
											</div>-->
										</div>
									</div>
									<div class="row">
										<div class="col">
											<center>
												<button type="button" class="btn btn-primary btn-sm"
													 id="submitid" onclick="SubmitReport()">submit</button>
												<button type="button" class="btn btn-secondary btn-sm"
													data-dismiss="modal">Close</button>
											</center>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				
	
	<script src="resources/js/js/jquery-2.1.4.min.js"></script>
	<script src="resources/js/newjs/bootstrap.min.js"></script>
	<script src="resources/js/newjs/formValidation.min.js"></script>
	<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
	<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script src="resources/preDefined/goback.js"></script>
	<script>
	 function getStatusReportByProject(){
  	   var payrateid=$('#payrateid').val();
  	   window.location.href="w2addreport?payrateid="+payrateid+"";
     }

	var lgworkAuth=$('#lgworkAuth').val();
	var lgemptype=$('#emptype').val();
	
	 function getDetailsByCanId(candidateid,template_id){
		 getsesVal().done(function(data){
				if(data!=""){
		 $('#canidateId').val(candidateid);
		 var payrate_id=$('#prid').val();
         $('#payrate_id').val(payrate_id);
		 $('#speriodname').val($("#periodnametd"+template_id).html());
		  $('#syear').val($("#yeartd"+template_id).html());
		  $('#smonth').val($("#monthtd"+template_id).html());
		  $('#speriod').val($("#periodtd"+template_id).html());
		  var peridname=$("#monthtd"+template_id).html()+"("+$("#periodtd"+template_id).html()+")";
		  $('#reportperiod').val(peridname);
		  $.ajax({
      	    url: "getDetailsByCanId", //this is the submit URL
      	    type: "POST",
      	    asyn : false,
      	    data: {"candidateid":candidateid,"payrate_id":payrate_id},
      		//contentType: "application/json",
      	    success: function(response){
          	   if(response!=""){
          		 $('#projectname').removeAttr("readonly",true);
      	    	 $('#candiname').val(response.fullname);
      	    	 $('#projectname').val(response.projectName);
      	    	 $('#clientaddres').val(response.clientAddress);
      	    	 $('#clienttname').val(response.clientName);
      	    	$('#statusmodal').modal('show');
          	   }else{
          		 if((lgemptype=="W2 Admin") && (lgworkAuth!='US Citizen' || lgworkAuth!='Green Card')){
          			$('#clientaddres,#clienttname,#projectname').removeAttr("readonly",true);
          			$('#statusmodal').modal('show');
          			$('#candiname').val($('#lgfullname').val());
          			$('#clienttname').val("Tekskills Inc");
          			$('#clientaddres').val("5 Independence Way,Suite 135,Princeton NJ,08540");
          			
          			
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
	  
function UpdateReport(candidateid,template_id){
	getsesVal().done(function(data){
		if(data!=""){
		 $('#canidateId').val(candidateid);
		 
		 $('#speriodname').val($("#periodnametd"+template_id).html());
		  $('#syear').val($("#yeartd"+template_id).html());
		  $('#smonth').val($("#monthtd"+template_id).html());
		  $('#speriod').val($("#periodtd"+template_id).html());
		  $.ajax({
      	    url: "getDetailsByCanId", //this is the submit URL
      	    type: "POST",
      	    asyn : false,
      	    data: {"candidateid":candidateid},
      		//contentType: "application/json",
      	    success: function(response){
      	    	if(response!=null || response!=""){
      	    	 $('#candiname').val(response.fullname);
      	    	 $('#projectname').val(response.projectName);
      	    	 $('#clientaddres').val(response.clientAddress);
      	    	 $('#clienttname').val(response.clientName);
          	   }else{
	            	window.location.href="loginpage";
	            }
      	    }
      	});
		 $('#statusmodal').modal('show');
		}else{
			 window.location.href="loginpage";
		}
	});
  }
	  function SubmitReport(){
		  getsesVal().done(function(data){
				if(data!=""){
		  $('#formid').formValidation('validate');
			if (!$('#formid').data('formValidation').isValid()) {
				//alert("not Valid");
			} else {
			$("#submitid").attr("disabled",true);
				 var form = $('#formid')[0];
			     var data = new FormData(form);
				$.ajax({
			            url: "savereport", //this is the submit URL
			            type: "POST",
			            enctype: 'multipart/form-data',
			            data: data,
			            processData: false,
			            contentType: false,
			            cache: false,
			            success: function(response){
			            	if(response!=null || response!=""){
			   	            alert(response);
			   	            	window.location.href="addreport";
			            	 }else{
					            	window.location.href="loginpage";
						            }
			            }
			        });
		  }
				}else{
					 window.location.href="loginpage";
				}
			});
	  }
	  $('#statusmodal').on('hide.bs.modal', function(){
		  document.getElementById("formid").reset();
		$('#formid').bootstrapValidator('resetForm', true);
	});
	  $('#formid').formValidation({
		    framework: 'bootstrap',
		    row: {
		        valid: 'field-success',
		        invalid: 'field-error'
		    },
		    fields: {
		        clienttname: {
		            validators: {
		            	notEmpty: {
		                    message: 'Please enter client name'    
		                }
		            }
		        },
		        clientaddres: {
		            validators: {
		            	notEmpty: {
		                    message: 'Please enter client addres'    
		                }
		            }
		        },
		        projectname: {
		            validators: {
		            	notEmpty: {
		                    message: 'Please enter project name'    
		                }
		            }
		        },
		        delivers: {
		            validators: {
		            	notEmpty: {
		                    message: 'Please enter delivers'    
		                }
		            }
		        },
		        outputs: {
		            validators: {
		            	notEmpty: {
		                    message: 'Please enter outputs'    
		                }
		            }
		        },
		        challenges: {
		            validators: {
		            	notEmpty: {
		                    message: 'Please enter challenges'    
		                }
		            }
		        }
		    }
		});
</script>
</body>
</html>
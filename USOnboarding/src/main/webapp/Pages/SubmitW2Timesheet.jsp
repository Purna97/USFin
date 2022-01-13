
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
<!-- <link rel="stylesheet" href="resources/css/css/datepicker3.min.css" /> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css"> -->
<!-- <link href="resources/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" /> -->
<!-- <link href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/bootstrap.timepicker/0.2.6/css/bootstrap-timepicker.min.css" rel="stylesheet"/> -->
<link rel="stylesheet" type="text/css" href="resources/dist/bootstrap-clockpicker.min.css">
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
#comment:focus {
border-color:red;
/* background: yellow;
  color: red; */
}

</style>
<body>
       <div id="right-panel" class="right-panel">
              <div class="content">
                     <!-- Animated -->
                     <div class="animated fadeIn">
                     <input type="hidden" id="payrateclientListsize" name="payrateclientListsize" value="${payrateclientListsize}">
                    <%-- <c:if test="${payrateclientListsize gt 1}">  --%>
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
													onchange="getTimesheetByProject()" >
													<option value="" >--Select Client--</option>
													<c:forEach var="plist" items="${payrateclientList}">
													<c:if test="${ses_payrateid ne 0}">
													<option value="${plist.payrate_id}" ${plist.payrate_id == ses_payrateid ? 'selected="selected"' : ''}>
													<c:choose>
													<c:when test="${not empty plist.custname}">
													${plist.custname}
													</c:when>
													<c:otherwise>
													TekSkills In-house Project
													</c:otherwise>
													</c:choose>
													</option>
													</c:if>
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
                           </div> <%-- </c:if>  --%>
                           <div class="row">
                                  <div class="col">
                                         <div class="card">
                                                <h5 class="card-header" ><span style="color:yellow;">${CustomerName}</span> Pending Timesheet</h5>
                                                <div class="card-body">
                                                       <div class="row">
                                                              <div class="col-lg-12">
                                                                     <input type="hidden" name="emptype" id="emptype"
                                                                           value="${emptype}"> <input type="hidden" name="role"
                                                                           id="role" value="${role}"> 
                                                                           <input type="hidden" name="dept" id="dept" value="${dept}">
                                                                           <input type="hidden" name="lgworkAuth" id="lgworkAuth" value="${lgworkAuth}">
                                                                           <input type="hidden" name="lgfullname" id="lgfullname" value="${lgfullname}">
                                                                           <input type="hidden" name="payrollType" id="payrollType" value="${timesheetDto.payrollType}">
                                                                           <input type="hidden" name="prid" id="prid" value="${timesheetDto.payrateid}">
                                                                           
                                                                          <%--  <c:choose>
                                                                          <c:when test="${empty timesheetDto.payrollType}">
                                                                           <center><h3>Payroll type missing, Please contact to your employer!</h3></center>
                                                                           </c:when>
                                                                           <c:otherwise> --%> 
                                                                           <table id="employeeTableId"
                                                                           class="table table-hover table-bordered"
                                                                           style="text-align: center;">
                                                                           <thead>
                                                                                  <tr>		
                                                                                  		<th style="text-align: center">Customer</th>
                                                                                         <th style="text-align: center">Year</th>
                                                                                         <th style="text-align: center">Month</th>
                                                                                         <th style="text-align: center;display:none" >Week/Period</th>
                                                                                         <th style="text-align: center">From Date</th>
                                                                                         <th style="text-align: center">To Date</th>
                                                                                         <th style="text-align: center">Action</th>
                                                                                  </tr>
                                                                           </thead>
                                                                           <tbody>
                                                                              <c:if test="${timesheetDto.payrollType eq 'Weekly'}">
                                                                                  <c:forEach var="reportlist" items="${timesheetDto.timesheetList}">
                                                                                         <tr><!-- toprecord -->
                                                                                          <td >${CustomerName}</td>
                                                                                         <td id="yeartd${reportlist.week_id}">${reportlist.year}</td>
                                                                                         <td id="monthtd${reportlist.week_id}">${reportlist.month}</td>
                                                                                         <td id="weekstd${reportlist.week_id}" style="display:none">${reportlist.weeks}</td>
                                                                                         <td id="fromtd${reportlist.week_id}">${reportlist.week_fromdate}</td>
                                                                                         <td id="totd${reportlist.week_id}">${reportlist.week_todate}</td>
                                                                                         
                                                                                         <td>
                                                                                         <c:if test="${reportlist.week_id eq reportlist.toprecord}">
                                                                                         <button class="btn btn-danger btn-sm"  onclick="getDetailsByweekId('${loginUserid}',${reportlist.week_id})" data-toggle="modal"  style="padding: 2px 1px; font-size: 12px;">Submit</button>
                                                                                         </c:if>
                                                                                         
                                                                                         <c:if test="${reportlist.week_id ne reportlist.toprecord}">
                                                                                         <button class="btn btn-danger btn-sm"  title="Cannot submit this timesheet until Old timesheets are submitted" disabled style="padding: 2px 1px; font-size: 12px;">Submit</button>
                                                                                         </c:if>
                                                                                         </td>
                                                                                         
                                                                                         </tr>
                                                                                 </c:forEach>
                                                                                  </c:if>
                                                                                  <c:if test="${timesheetDto.payrollType eq 'Semi-Monthly'}">
                                                                                  <c:forEach var="reportlist" items="${timesheetDto.timesheetList}">
                                                                                         <tr>
                                                                                           <td >${CustomerName}</td>
                                                                                         <td id="yeartd${reportlist.template_id}">${reportlist.year}</td>
                                                                                         <td id="monthtd${reportlist.template_id}">${reportlist.month}</td>
                                                                                         <%-- <td id="periodtd${reportlist.template_id}">${reportlist.period}</td> --%>
                                                                                         <td id="periodnametd${reportlist.template_id }" style="display:none">${reportlist.period_name}</td>
                                                                                         <td id="fromtd${reportlist.template_id}">${reportlist.week_fromdate}</td>
                                                                                         <td id="totd${reportlist.template_id}">${reportlist.week_todate}</td>
                                                                                         
                                                                                         <td>
                                                                                         <c:if test="${reportlist.template_id eq reportlist.toprecord}">
                                                                                         <button class="btn btn-danger btn-sm"  onclick="getDetailsByweekId('${loginUserid}',${reportlist.template_id})" data-toggle="modal"       style="padding: 2px 1px; font-size: 12px;">Submit</button>
                                                                                         </c:if>
                                                                                        
                                                                                         <c:if test="${reportlist.template_id ne reportlist.toprecord}">
                                                                                         <button class="btn btn-danger btn-sm"  title="Can't submit this timesheet until old timesheets are submitted" disabled style="padding: 2px 1px; font-size: 12px;">Submit</button>
                                                                                         </c:if>
                                                                                         </td>
                                                                                         
                                                                                         <%-- <td><button class="btn btn-danger btn-sm"  
                                                                                         onclick="getDetailsByweekId('${loginUserid}',${reportlist.template_id})" data-toggle="modal" 
                                                                                         style="padding: 2px 1px; font-size: 12px;">Submit</button>
                                                                                         </td> --%>
                                                                                         </tr>
                                                                                  </c:forEach>
                                                                                  </c:if>
                                                                                  <c:if test="${timesheetDto.payrollType eq 'Monthly'}">
                                                                                  <c:forEach var="reportlist" items="${timesheetDto.timesheetList}">
                                                                                         <tr>
                                                                                           <td >${CustomerName}</td>
                                                                                         <td id="yeartd${reportlist.month_id}">${reportlist.year}</td>
                                                                                         <td id="monthtd${reportlist.month_id}">${reportlist.month}</td>
                                                                                         <%-- <td id="periodtd${reportlist.template_id}">${reportlist.period}</td> --%>
                                                                                         <td id="periodnametd${reportlist.month_id }" style="display:none">${reportlist.month_no}</td>
                                                                                         <td id="fromtd${reportlist.month_id}">${reportlist.payroll_fromdate}</td>
                                                                                         <td id="totd${reportlist.month_id}">${reportlist.payroll_todate}</td>
                                                                                         
                                                                                         <td>
                                                                                         <c:if test="${reportlist.month_id eq reportlist.toprecord}">
                                                                                         <button class="btn btn-danger btn-sm"  onclick="getDetailsByweekId('${loginUserid}',${reportlist.month_id})" data-toggle="modal"  style="padding: 2px 1px; font-size: 12px;">Submit</button>
                                                                                         </c:if>
                                                                                         
                                                                                         <c:if test="${reportlist.month_id ne reportlist.toprecord}">
                                                                                         <button class="btn btn-danger btn-sm"  title="Can't submit this timesheet until old timesheets are submitted" disabled style="padding: 2px 1px; font-size: 12px;">Submit</button>
                                                                                         </c:if>
                                                                                         </td>
                                                                                         
                                                                                         <%-- <td><button class="btn btn-danger btn-sm"  
                                                                                         onclick="getDetailsByweekId('${loginUserid}',${reportlist.template_id})" data-toggle="modal" 
                                                                                         style="padding: 2px 1px; font-size: 12px;">Submit</button>
                                                                                         </td> --%>
                                                                                         </tr>
                                                                                  </c:forEach>
                                                                                   </c:if>
                                                                                  
                                                                                  <c:if test="${timesheetDto.payrollType eq 'Bi-Weekly1'}">
                                                                                  <c:forEach var="reportlist" items="${timesheetDto.timesheetList}">
                                                                                         <tr><!-- toprecord -->
                                                                                          <td >${CustomerName}</td>
                                                                                         <td id="yeartd${reportlist.biweek_id}">${reportlist.year}</td>
                                                                                         <td id="monthtd${reportlist.biweek_id}">${reportlist.month}</td>
                                                                                         <td id="weekstd${reportlist.biweek_id}" style="display:none">${reportlist.weeks}</td>
                                                                                         <td id="fromtd${reportlist.biweek_id}">${reportlist.week_fromdate}</td>
                                                                                         <td id="totd${reportlist.biweek_id}">${reportlist.week_todate}</td>
                                                                                         
                                                                                         <td>
                                                                                         <c:if test="${reportlist.biweek_id eq reportlist.toprecord}">
                                                                                         <button class="btn btn-danger btn-sm"  onclick="getDetailsByweekId('${loginUserid}',${reportlist.biweek_id})" data-toggle="modal"  style="padding: 2px 1px; font-size: 12px;">Submit</button>
                                                                                         </c:if>
                                                                                         
                                                                                         <c:if test="${reportlist.biweek_id ne reportlist.toprecord}">
                                                                                         <button class="btn btn-danger btn-sm"  title="Cannot submit this timesheet until Old timesheets are submitted" disabled style="padding: 2px 1px; font-size: 12px;">Submit</button>
                                                                                         </c:if>
                                                                                         </td>
                                                                                         
                                                                                         </tr>
                                                                                  </c:forEach>
                                                                                  </c:if>
                                                                                  
                                                                                  <c:if test="${timesheetDto.payrollType eq 'Bi-Weekly2'}">
                                                                                  <c:forEach var="reportlist" items="${timesheetDto.timesheetList}">
                                                                                         <tr><!-- toprecord -->
                                                                                           <td >${CustomerName}</td>
                                                                                         <td id="yeartd${reportlist.biweek_id}">${reportlist.year}</td>
                                                                                         <td id="monthtd${reportlist.biweek_id}">${reportlist.month}</td>
                                                                                         <td id="weekstd${reportlist.biweek_id}" style="display:none">${reportlist.weeks}</td>
                                                                                         <td id="fromtd${reportlist.biweek_id}">${reportlist.week_fromdate}</td>
                                                                                         <td id="totd${reportlist.biweek_id}">${reportlist.week_todate}</td>
                                                                                         
                                                                                         <td>
                                                                                         <c:if test="${reportlist.biweek_id eq reportlist.toprecord}">
                                                                                         <button class="btn btn-danger btn-sm"  onclick="getDetailsByweekId('${loginUserid}',${reportlist.biweek_id})" data-toggle="modal"  style="padding: 2px 1px; font-size: 12px;">Submit</button>
                                                                                         </c:if>
                                                                                         
                                                                                         <c:if test="${reportlist.biweek_id ne reportlist.toprecord}">
                                                                                         <button class="btn btn-danger btn-sm"  title="Cannot submit this timesheet until Old timesheets are submitted" disabled style="padding: 2px 1px; font-size: 12px;">Submit</button>
                                                                                         </c:if>
                                                                                         </td>
                                                                                         
                                                                                         </tr>
                                                                                  </c:forEach>
                                                                                  </c:if>
                                                                           </tbody>
                                                                     </table>
                                                                           <%--  </c:otherwise> 
                                                                           </c:choose> --%>
                                                                     
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
                                                                     <input type="hidden" id="canidateId" name="canidateId">
                                                                     <input type="hidden" id="yeartdnew" name="year">
                                                                     <input type="hidden" id="monthtdnew" name="month">
                                                                     <input type="hidden" id="weekstdnew" name="weeks">
                                                                     <input type="hidden" id="fromtdnew" name="fromdate">
                                                                     <input type="hidden" id="totdnew" name="todate">
                                                                     <input type="hidden" id="weekid" name="weekId">
                                                                     <input type="hidden" id="tablength" name="tablength">
                                                                      <input type="hidden" id="payrate_id" name="payrate_id">
                                                                     
                                                                     <center>Note : <span id="usermsg" style="color: blue;font-size: smaller;">Please enter comments if you have any Leaves or NonBillable or OverTime Hours ,or  Billable Hours not equal to 8 hours.<br> 00:00 should be entered in Billable Hours section when leave is taken or Holiday</span><br></center>
                                                                     <table id="i9fromTable"
                                                                           class="table table-hover table-bordered"
                                                                           style="text-align: center;">
                                                                           <thead>
                                                                                  <tr>
                                                                                  <!-- <th style="display: none">Ival</th> -->
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
                                                                     </table>
                                                              <c:if test="${lgemptype eq 'W2 Admin' || lgemptype eq 'Admin'}">
                                                                                         <div class="form-group row">
                                                                                                <label class="col-sm-4 col-form-label">Upload
                                                                                                       Manager Approved Timesheet <Span id="mat" style="color:red;"></Span>:</label>
                                                                                                <div class="col-sm-8">
                                                                                                       <input type="file" name="mgrapprovedts" id="mgrapprovedts">
                                                                                                </div>
                                                                                  </div></c:if>
                                                                                  <c:if test="${lgemptype ne 'W2 Admin' || lgemptype ne 'Admin'}">
                                                                                  <div class="form-group row">
                                                                                                <label class="col-sm-4 col-form-label">Upload
                                                                                                       Manager Approved Timesheet <Span id="mat" style="color:red;">*</Span>:</label>
                                                                                                <div class="col-sm-8">
                                                                                                       <input type="file" name="mgrapprovedts" id="mgrapprovedts" required >
                                                                                                </div>
                                                                                  </div></c:if>
                                                                                         <div class="form-group row">
                                                                                                <label class="col-sm-4 col-form-label">Upload
                                                                                                       Leave Letter:</label>
                                                                                                <div class="col-sm-8">
                                                                                                       <input type="file" name="leaveletter" id="leaveletter" 
                                                                                                       multiple required >
                                                                                                              
                                                                                                       
                                                                                                </div>
                                                                                  </div>
                                                       </div>
                                                              </div>
                                                              <div class="row">
                                                                     <div class="col">
                                                                           <center>
                                                                           
                                                                                  <button type="button" class="btn btn-primary btn-sm"
                                                                                         id="submitid" onclick="SubmitTimesheet()">Submit</button>
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
       <script src="resources/js/newdt/jquery.dataTables.min.js"></script>
    <script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
       <script       src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
       <!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script> -->
<script type="text/javascript" src="resources/dist/bootstrap-clockpicker.min.js"></script>
<script src="resources/preDefined/goback.js"></script>
       <script>
       
       function getTimesheetByProject(){
    	   getsesVal().done(function(data){
				if(data!=""){
    	   var payrateid=$('#payrateid').val();
    	   if(payrateid!=""){
    		   window.location.href="w2timesheet?payrateid="+payrateid+"";   
    	  }
				}else{
					 window.location.href="loginpage";
				}
			}); 
       }
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
                     notEmpty: {
                           message: 'Upload manager approved timesheet'
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
            	   enabled: false,
                   validators: {
                     notEmpty: { 
                           message: 'Please enter leave'
                       }
                   }
               }
           }
       });
</script>

<script>

       var table = $('#i9fromTable').DataTable({
              "paging":   false,
                  "ordering": false,
                  "info":     false,
                  "searching": false
     }); 
       var lgworkAuth=$('#lgworkAuth').val();
       var lgemptype=$('#emptype').val();
       var payrollType=$('#payrollType').val();
       
       

       if(lgemptype=="W2 Admin" || lgemptype=="Admin"){
              $('#mat').hide();
              }else{
                     $('#mat').show();
                     }
       
        var dateNow = new Date();
       function getDetailsByweekId(candidateid,weekid){
    	   getsesVal().done(function(data){
				if(data!=""){
              $('#canidateId').val(candidateid);
              $('#weekid').val(weekid);
              var payrate_id=$('#prid').val();
              $('#payrate_id').val(payrate_id);
       
              $('#yeartdnew').val($('#yeartd'+weekid).html());
              $('#monthtdnew').val($('#monthtd'+weekid).html());
              $('#weekstdnew').val($('#weekstd'+weekid).html());
              $('#fromtdnew').val($('#fromtd'+weekid).html());
              $('#totdnew').val($('#totd'+weekid).html());
              
               $('#statusmodal').modal('show');
              //$('#speriodname').val($("#periodnametd"+template_id).html());
                 $.ajax({
          url: "getDetailsByweekId", //this is the submit URL
          type: "POST",
          asyn : false,
          data: {"weekid":weekid,"payrollType":payrollType},
          success: function(response){
             if(response!=null || response!=""){
                  if (table) table.clear();
              $.each(response, function(i, item) {
                     table.row.add([
                     '<input type="text" name="dates[]" id="dates" readonly value='+ item.dates+' max="5" style="width: 100px;" class="form-control"><input type="hidden" name="ival" id="ival'+ i+'" value='+ i+'>'
                     ,'<input type="text" name="dayname[]" id="dayname" readonly value='+ item.dayname+' min="5" max="5" style="width: 100px;" class="form-control">'
                     ,'<div class="input-group date" id="datetimepicker'+ i+'" data-target-input="nearest"><input type="text" class="form-control" onkeydown="return false" datetimepicker-input" name="billablehrs[]" id="billablehrs'+i+'" data-target="#datetimepicker'+i+'"><div class="input-group-append" data-target="#datetimepicker'+ i+'" data-toggle="datetimepicker"><span class="input-group-addon"><i class="fa fa-clock-o"></i></span></div>'
                     ,'<div class="input-group date" id="datetimepickernon'+i+'" data-target-input="nearest"><input type="text" class="form-control"  onkeydown="return false" datetimepicker-input" name="nonbillablehrs[]" id="nonbillablehrs'+i+'" data-target="#datetimepickernon'+i+'"><div class="input-group-append" data-target="#datetimepickernon'+ i+'" data-toggle="datetimepicker"><span class="input-group-addon"><i class="fa fa-clock-o"></i></span></div>'
                     ,'<div class="input-group date" id="overtimedatetimepicker'+i+'" data-target-input="nearest"><input type="text" class="form-control"  onkeydown="return false" datetimepicker-input" name="over_time[]" id="over_time'+i+'" data-target="#overtimedatetimepicker'+i+'"><div class="input-group-append" data-target="#overtimedatetimepicker'+ i+'" data-toggle="datetimepicker"><span class="input-group-addon"><i class="fa fa-clock-o"></i></span></div>'
                     ,'<input type="number" name="leave[]" id="leave'+i+'"   onkeydown="return false" step="0.5"  min="0" max="1" style="width: 90px;" class="form-control">'
                     ,'<textarea name="comments[]" id="comments" class="form-control" style="width: 240px;"></textarea><span id="commentspan'+i+'" style="color:red;"></span>'])
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
                     
                     /* $('#datetimepicker'+i).datetimepicker({
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
                       });    */

                     // var ival=$("#ival"+i).val();
                     $("#billablehrs"+i).val('');
                     $("#nonbillablehrs"+i).val('');
                     $("#over_time"+i).val('');
                      }); 
               
                 
              $('#statusmodal').modal('show');
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

       
         function SubmitTimesheet(){
        	 getsesVal().done(function(data){
 				if(data!=""){
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
     				var hrs;var fhrs;
     				if(billhrs=="10:00"){hrs=10;}
     				else if(billhrs=="11:00"){hrs=11;}else if(billhrs=="12:00"){hrs=12;}else if(billhrs=="13:00"){hrs=13;}
     				else if(billhrs=="14:00"){hrs=14;}else if(billhrs=="15:00"){hrs=15;}else if(billhrs=="16:00"){hrs=16;}
     				else if(billhrs=="17:00"){hrs=17;}else if(billhrs=="18:00"){hrs=18;}else if(billhrs=="19:00"){hrs=19;}
     				else if(billhrs=="20:00"){hrs=20;}else if(billhrs=="21:00"){hrs=21;}else if(billhrs=="22:00"){hrs=22;}
     				else if(billhrs=="23:00"){hrs=23;}else if(billhrs=="24:00"){hrs=24;}
     				else{hrs = billhrs.substring(1, 2);}
     				/* if((leave!="" && (leave==0||leave!=0))&&(billhrs=="")){
     					$(tr).find('td:eq(2) input').attr("placeholder", "Select Billable hours").css( "border-color", "red" ).focus();
     					billablecheckvlaue=false;
     	          		arraybillablecheck.push(billablecheckvlaue);
     					} */
     				if(hrs!=""){
     					fhrs=parseInt(hrs*60)+parseInt(billhrs.substring(3, 5));	
     				}else{
     					fhrs="";
     				}
     					
     				//var fhrs=parseInt(hrs*60)+parseInt(billhrs.substring(3, 5));
     				//alert(fhrs);
     				if((fhrs>480) && comments==""){
    	    	    	/*  if((hrs>0))
    	          		 $(tr).find('td:eq(6) textarea').focusout();
    	          		 billablerowvalue=false; arraybillable.push(billablerowvalue); */
    	          		 $(tr).find('td:eq(6) textarea').attr("placeholder", "Enter Comments").css( "border-color", "red" ).focus();
         			billablerowvalue=false;	arraybillable.push(billablerowvalue);
         			commentvalue=false;	arraycomment.push(commentvalue);
    	     	           		}
	    	    if((fhrs>480) && (nonbillhrs!="" || nonbillhrs!="00:00") && comments!=""){
	    	    	$(tr).find('td:eq(6) textarea').attr("placeholder", "Enter Comments").css( "border-color", "red" ).focus();
	          		 billablerowvalue=false; arraybillable.push(billablerowvalue);
	          		rowvalue=false; array.push(rowvalue);
	     	           		} 
     		   if((fhrs>0 && fhrs<480) && comments==""){
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
				}else{ 
					rowvalueleave=true;
					arrayleave.push(rowvalueleave);
				}
			
          }
          }
	           }); 
         var tablength = document.getElementById("i9fromTable").rows.length;
         var leavefilename = $('#leaveletter').val();
       	var mgrapprovedfile = $('#mgrapprovedts').val();
       	
  if(arraybillablecheck.includes(false)){
       	 alert("Please fill the timesheet before submitting");
       		
       	}
       	else if(arraycomment.includes(false)){
   			alert("Please enter comments");
   		}
  else{
	  

	  
	  if(lgemptype=="W2 Admin" || lgemptype=="Admin"){
          if(arrayleave.includes(false) && leavefilename==""){
        	  if( leavefilename==""){
        		  alert("Please upload leave letter");
        		  $('#formid').bootstrapValidator('enableFieldValidators','leaveletter',true);
        		  $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',false);
        	  }
              }else{
            	  $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',false);
            	  $('#tablength').val(tablength-1)
  				fnTimesheetSubmit()
              }
	  }
	  else{
		  //lgemptype=="W2" || lgemptype=="1099" "C2C"
       	if(array.includes(false) && arraybillable.includes(false)){
    	  if(mgrapprovedfile==""){
    		  alert("Please upload manager approved timesheet");
    		  $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',true);
    	  }else{  $('#tablength').val(tablength-1)
				fnTimesheetSubmit() } 
          }
      else{
    	  $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',true);
            	  if(arrayleave.includes(false)){
            	  if(leavefilename==""){
            		  alert("Please upload leave letter");
            		  $('#formid').bootstrapValidator('enableFieldValidators','leaveletter',true);
            	      }
                  }
              else{
            	  if(mgrapprovedfile==""){
            		  alert("Please upload manager approved timesheet");
            		  $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',true);
            	      }else{
            	    		$('#formid').bootstrapValidator('enableFieldValidators','leaveletter',false); 
             	 			$('#tablength').val(tablength-1)
             				fnTimesheetSubmit()
            	      }
         			}
              }
  }
	  
	  /* 
       	if(array.includes(false) && arraybillable.includes(false)){
    	  if(mgrapprovedfile==""){
    		  alert("Please upload manager approved timesheet");
    		  $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',true);
    	  }else{  $('#tablength').val(tablength-1)
				fnTimesheetSubmit() } 
          }
      else{
    	   if(arraybillable.includes(false) && mgrapprovedfile==""){
    		   if(mgrapprovedfile==""){
    			   alert("Please upload manager approved timesheet");
         		  $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',true);
         	  }
                }
    	   else if(arraybillable.includes(false) && array.includes(false)){
            	  if(mgrapprovedfile==""){
            		  $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',true);
            	  }else{ } 
                  }
              else if(arrayovertime.includes(false)){
            	  if(mgrapprovedfile==""){
            		  $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',true);
            	  }else{ }
                    }
              else if(arrayleave.includes(false) && leavefilename==""){
            	  if( leavefilename==""){
            		  alert("Please upload leave letter");
            		  $('#formid').bootstrapValidator('enableFieldValidators','leaveletter',true);
            	  }
                  }
              else if(arraybillable.includes(false) && arrayleave.includes(false)){
            	  if(mgrapprovedfile=="" && leavefilename==""){
            		  $('#formid').bootstrapValidator('enableFieldValidators','mgrapprovedts',true);
            		  $('#formid').bootstrapValidator('enableFieldValidators','leaveletter',true);
            	  }
            	  else{
            		  $('#tablength').val(tablength-1)
       				fnTimesheetSubmit()  
            	  }
                    }
              else{
                  	$('#formid').bootstrapValidator('enableFieldValidators','leaveletter',false); 
         	 			 $('#tablength').val(tablength-1)
         				fnTimesheetSubmit()
         			}
              } */
      
	}//else
	}
 				}else{
					 window.location.href="loginpage";
				}
			}); 
}

	


function fnTimesheetSubmit(){
	getsesVal().done(function(data){
		if(data!=""){
	var prid=$("#prid").val();
       $("#submitid").attr("disabled",true);
       var form = $('#formid')[0];
    var data = new FormData(form);
       $.ajax({
          url: "savetimesheet", //this is the submit URL
           type: "POST",
           enctype: 'multipart/form-data',
           data: data,
           processData: false,
           contentType: false,
           cache: false,
           success: function(response){
                 if(response!=null || response!=""){
                   alert(response);
                     window.location.href="w2timesheet?payrateid="+prid+"";
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
</script>

</body>
</html>




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
<!-- <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" /> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/css/select2.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/css/datepicker3.min.css" />
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->

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
</style>
<body>
	<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">View Timesheet Template</h5>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
										<input type="hidden" name="emptype" id="emptype"
											value="${emptype}"> <input type="hidden" name="role"
											id="role" value="${role}"> <input type="hidden"
											name="dept" id="dept" value="${dept}">

										<fieldset>
											<form action="viewweeklytemplate" method="post" class="form-horizontal">

												<div class="form-group row">
													<div class="col-lg-2">
														<select id="year" name="year" class="form-control"  required>
														
														<option value="">-Select Year-</option>
												<script type="text/javascript">
														var myDate = new Date();
														var year = myDate.getFullYear();
														for(y = year; y <= year + 5; y++) {
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
													<div class="col-sm-2">
														<input type="submit" id="generateid" style="background: #205081;" class="btn btn-info btn-sm"
															value="Search"> <br>
													</div>
												 <div class="col-sm-10">
														<br> <span id="msgid" style="color: red;"></span>
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
									<h5 class="card-header">Weekly Template Details</h5>
									<div class="card-body">
										<div style="text-align: center;">
												
												<input type="hidden" id="years" name="year" value="${year}">
												
											<table class="table table-striped table-bordered" id="i9fromTable">
												<thead>
													<tr>
														<!-- <th>Week</th> -->
														<th>Year</th>
														<th>Month</th>
														<th>From Date</th>
														<th>To Date</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="weektemp" items="${weeklytemplate}">
													<tr>
													<%-- <td>${weektemp.weekno}</td> --%>
													<td>${weektemp.year}</td>
													<td>${weektemp.month}</td>
													<td>${weektemp.fromdate}</td>
													<td>${weektemp.todate}</td>
													</tr>
												</c:forEach>
												
												</tbody>
												
											</table>
										
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<h5 class="card-header">Bi-Weekly1 Template Details</h5>
									<div class="card-body">
										<div style="text-align: center;">
												
											<table class="table table-striped table-bordered" id="historyid1">
												<thead>
													<tr>
														<!-- <th>Week</th> -->
														<th>Year</th>
														<th>Month</th>
														<th>From Date</th>
														<th>To Date</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="biweeek" items="${biweektemplate1}">
													<tr>
													<%-- <td>${biweeek.weekno}</td> --%>
													<td>${biweeek.year}</td>
													<td>${biweeek.month}</td>
													<td>${biweeek.fromdate}</td>
													<td>${biweeek.todate}</td>
													</tr>
												</c:forEach>
												
												</tbody>
												
											</table>
										
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<h5 class="card-header">Bi-Weekly2 Template Details</h5>
									<div class="card-body">
										<div style="text-align: center;">
												
											<table class="table table-striped table-bordered" id="supportTable">
												<thead>
													<tr>
														<!-- <th>Week</th> -->
														<th>Year</th>
														<th>Month</th>
														<th>From Date</th>
														<th>To Date</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="biweeek" items="${biweektemplate2}">
													<tr>
													<%-- <td>${biweeek.weekno}</td> --%>
													<td>${biweeek.year}</td>
													<td>${biweeek.month}</td>
													<td>${biweeek.fromdate}</td>
													<td>${biweeek.todate}</td>
													</tr>
												</c:forEach>
												
												</tbody>
												
											</table>
										
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<h5 class="card-header">Semi-Monthly Template Details  <span style="color:yellow">(Used for Status Reports and Timesheets)</span></h5>
									<div class="card-body">
										<div style="text-align: center;">
												
												
											<table class="table table-striped table-bordered" id="otherdocTable">
												<thead>
													<tr>
														<th>Year</th>
														<th>Month</th>
														<th>From Date</th>
														<th>To Date</th>
													</tr>
												</thead>
												<tbody>
												<%-- <c:forEach var="semimonth" items="${semiMonthTemplate}">
													<tr>
													<td>${semimonth.year}</td>
													<td>${semimonth.month}</td>
													<td>${semimonth.fromdate}</td>
													<td>${semimonth.todate}</td>
													</tr>
												</c:forEach> --%>
												<c:forEach var="semimonth" items="${templateList}">
													<tr>
													<fmt:parseDate value="${semimonth.from_date}" pattern="yyyy-MM-dd" var="fd"/>
													<fmt:formatDate value="${fd}" var="from_date" pattern="MM/dd/yyyy"/>
													
													<fmt:parseDate value="${semimonth.to_date}" pattern="yyyy-MM-dd" var="td"/>
													<fmt:formatDate value="${td}" var="to_date" pattern="MM/dd/yyyy"/>
															
													<td>${semimonth.year}</td>
													<td>${semimonth.month}</td>
													<td><c:out value="${from_date}"/></td>
													<td><c:out value="${to_date}"/></td>
													</tr>
												</c:forEach> 
												
												</tbody>
												
											</table>
										
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<h5 class="card-header">Monthly Template Details</h5>
									<div class="card-body">
										<div style="text-align: center;">
												
												
											<table class="table table-striped table-bordered" id="employeeTableId">
												<thead>
													<tr>
														<th>Year</th>
														<th>Month</th>
														<th>From Date</th>
														<th>To Date</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="monthly" items="${monthlytemplate}">
													<tr>
													<td>${monthly.year}</td>
													<td>${monthly.month}</td>
													<td>${monthly.fromdate}</td>
													<td>${monthly.todate}</td>
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
	</div>
	<script src="resources/js/js/jquery-2.1.4.min.js"></script>
	<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
	<script src="resources/js/newjs/bootstrap.min.js"></script>
	<script src="resources/js/newjs/formValidation.min.js"></script>
	<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/js/select2.min.js"></script>
	<script src="resources/preDefined/goback.js"></script>
	<script>
	var y=$('#years').val();	
	var yr = $("select[name='year']");
	yr.find('option[value="' + y + '"]').attr('selected', true);
		
	
	function getYear(){
		var year =$("#year").val();
		if(year==""){
			$("#submitid,#generateid").attr("disabled",true);
			}else{
		 $.ajax({
	      	    url: "checktstemplate", //this is the submit URL
	      	    type: "POST",
	      	    asyn : false,
	      	    data: {"year":year},
	      		//contentType: "application/json",
	      	    success: function(response){
	      	      if(response!=""){
	                  $('#msgid').text(response);
	              	$("#submitid,#generateid").attr("disabled",true);
	              	
	                  }
	              else{
	              	 $('#msgid').text('');
	              	$("#submitid,#generateid").attr("disabled",false);
	                  }
	      	    }
	      	});
	      	}
	}
	function submitForm(){
	  var years =$("#years").val();
	  alert(years);
	if(years==""){
		//alert("month required");
	}else{
	$("#submitid").attr("disabled",true);
		 var form = $('#formid')[0];
	     var data = new FormData(form);
		$.ajax({
	            url: "saveweeklytemplate", //this is the submit URL
	            type: "POST",
	            enctype: 'multipart/form-data',
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            success: function(response){
	            	if(response!=null || response!=""){
	   	            alert(response);
	   	            	window.location.href="weeklytemplate";
	            }else{
	            	window.location.href="loginpage";
		            }
	            }
	        });
	    }
	}


	
</script>
</body>
</html>

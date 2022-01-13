<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
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
							<h5 class="card-header">Add Status Report Template</h5>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
										<input type="hidden" name="emptype" id="emptype"
											value="${emptype}"> <input type="hidden" name="role"
											id="role" value="${role}"> <input type="hidden"
											name="dept" id="dept" value="${dept}">


										<fieldset>
											<form action="/"
												class="form-horizontal" id="formid">
												<div class="form-group row">
													<div class="col-lg-2">
														<select id="year" name="year"  class="form-control">
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
															class="form-control" >
															 <option value="">--Select Month--</option> 
										  			 <c:forEach var="ml" items="${monthsList}">
														  <option value="${ml}">${ml}</option>
													</c:forEach>
														</select>
													</div>
													
													
													<input id="p1hidden" type="hidden"	name="period1">
													<input id="p2hidden" type="hidden"	name="period2">
													<input id="mhidden" type="hidden"	name="months">
													<input id="yhidden" type="hidden"	name="years">
													
													<input id="fromdate1" type="hidden"	name="fromdate1">
													<input id="todate1" type="hidden"	name="todate1">
													<input id="fromdate2" type="hidden"	name="fromdate2">
													<input id="todate2" type="hidden"	name="todate2">
													

													<div class="col-sm-2">
														<input type="button" onclick="submitForm()" id="submitid" 
														style="background:#205081;" class="btn btn-info btn-sm"
															 value="Save">
													<!-- <input type="button" onclick="reset()" class="btn btn-default btn-sm" value="Reset"> -->
															<br>
													</div>
													<div class="col-sm-10">
															<br>
															<span id="msgid" style="color: red;"></span>
													</div>
													
												</div>
												
											</form>
										</fieldset>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row" id="tid">
							<div class="col-md-12">
								<div class="card">
									<h5 class="card-header">Template Details</h5>
									<div class="card-body">
										<div style="text-align: center;">
										
										<table
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th style="text-align: center;">Year</th>
											<th style="text-align: center;">Month</th>
											<th style="text-align: center;">Period</th>
										</tr>
									</thead>
									<tbody>
										<tr style="text-align:center;">
											<td><input type="text" placeholder="Year"  id="year1"
														 class="form-control" required style="width:30%;margin-left: 20%;" ></td> 
											<td style="text-align: center;">
											<input type="text" placeholder="Month"  id="month1"
														 class="form-control" required style="width:30%;margin-left: 20%;" >
											</td>
											<td><input id="period1" type="text" placeholder="Period" 
														 class="form-control"  required style="width:30%;margin-left: 20%;" ></td> 
										</tr>
										
										<tr style="text-align:center;">
											<td><input type="text" placeholder="Year"  id="year2"
														 class="form-control" required style="width:30%;margin-left: 20%;" ></td> 
											<td style="text-align: center;">
											<input type="text" placeholder="Month"  id="month2"
														 class="form-control" required style="width:30%;margin-left: 20%;" >
											</td>
											<td><input id="period2" type="text" placeholder="Period" 
														name="period2" class="form-control"  required style="width:30%;margin-left: 20%;" ></td> 
										</tr>
										
										
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
									<h5 class="card-header">View Template Details</h5>
									<div class="card-body">
										<div style="text-align: center;"></div>
										<div
											style="max-width: 980px; overflow-x: auto; white-space: nowrap;">
											<table id="employeeTableId"
												class="table table-hover table-bordered"
												style="text-align: center;">
												<thead>
													<tr>
														<th style="text-align: center">Month</th>
														<th style="text-align: center">Year</th>
														<th style="text-align: center">Period</th>
														
													</tr>
												</thead>
												<tbody>
													<c:forEach var="list" items="${templateList}">
														<tr>
															<td>${list.year}</td>
															<td>${list.month}</td>
															<td>${list.period}</td>
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
	function reset(){
		getsesVal().done(function(data){  
            if(data!=""){
		window.location.reload();
	 }else{
         window.location.href="loginpage";
	                }
               });
		}
	  $('#year,#month').select2();
	/*   $('#year,#month').select2({
		    minimumResultsForSearch: -1
		}); */
		
	
		/* $(document).ready(function() {
			$("#rejoining_Date").datepicker({
				changeMonth : true,
				changeYear : true,
				minDate : 0
			})
		}) */
	</script>
	
	<script>
	$("#tid").hide();
	var monthsMap = new Map([["January" , 0], ["February" ,1 ] ,["March", 2],["April" ,3 ],["May" ,4],["June" ,5],["July" ,6],["August",7],["September" ,8 ],["October" ,9],["November" ,10],["December" ,11 ]]);

	$('#formid').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {	
        year:{
            validators: {
            	notEmpty: {
                    message: 'Please select year'
                }
            }
        },
        
        month:{
            validators: {
            	notEmpty: {
                    message: 'Please select month'
                }
            }
        }
    }
})

.on('change', '[name="year"]', function(e) {
	 getsesVal().done(function(data){  
         if(data!=""){
    var month =$("#month").val();
    var year =$("#year").val();
    var monthno= monthsMap.get(month);
    var LastDay = new Date(year, monthno + 1, 0);
	var lastDate=LastDay.getDate();

	//alert(("0" + (monthno + 1)).slice(-2))
	$('#year1,#year2,#yhidden').val(year);
	$('#month1,#month2,#mhidden').val(month);
	$('#period1,#p1hidden').val("1-15");
	$('#period2,#p2hidden').val("16-"+lastDate);
	$('#period2,#p2hidden').val("16-"+lastDate);
	
	$('#fromdate1').val(year+"-"+("0" + (monthno + 1)).slice(-2)+"-01");
	$('#todate1').val(year+"-"+("0" + (monthno + 1)).slice(-2)+"-15");
	$('#fromdate2').val(year+"-"+("0" + (monthno + 1)).slice(-2)+"-16");
	$('#todate2').val(year+"-"+("0" + (monthno + 1)).slice(-2)+"-"+lastDate); 
	
	$("#tid").show();
    
	$.ajax({
        url: "checkTemplate?month="+month+"&year="+year+"", 
        type: "POST",
        enctype: 'multipart/form-data',
     //   data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function(response){
            if(response!=""){
                $('#msgid').text(response);
              //  $('#msgid').toast('show');
            	$("#submitid").attr("disabled",true);
                }
            else{
            	 $('#msgid').text('');
            	$("#submitid").attr("disabled",false);
                }
        }
    }); 
}else{
    window.location.href="loginpage";
            }
          });
     })
     
     
     .on('change', '[name="month"]', function(e) {
    	 getsesVal().done(function(data){  
             if(data!=""){
    var month =$("#month").val();
    var year =$("#year").val();
    var monthno= monthsMap.get(month);
    var LastDay = new Date(year, monthno + 1, 0);
	var lastDate=LastDay.getDate();

	//alert(("0" + (monthno + 1)).slice(-2))
	$('#year1,#year2,#yhidden').val(year);
	$('#month1,#month2,#mhidden').val(month);
	$('#period1,#p1hidden').val("1-15");
	$('#period2,#p2hidden').val("16-"+lastDate);
	$('#period2,#p2hidden').val("16-"+lastDate);
	
	$('#fromdate1').val(year+"-"+("0" + (monthno + 1)).slice(-2)+"-01");
	$('#todate1').val(year+"-"+("0" + (monthno + 1)).slice(-2)+"-15");
	$('#fromdate2').val(year+"-"+("0" + (monthno + 1)).slice(-2)+"-16");
	$('#todate2').val(year+"-"+("0" + (monthno + 1)).slice(-2)+"-"+lastDate); 

	$("#tid").show();
    
	$.ajax({
        url: "checkTemplate?month="+month+"&year="+year+"", 
        type: "POST",
        enctype: 'multipart/form-data',
     //   data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function(response){
            if(response!=""){
                $('#msgid').text(response);
              //  $('#msgid').toast('show');
            	$("#submitid").attr("disabled",true);
                }
            else{
            	 $('#msgid').text('');
            	$("#submitid").attr("disabled",false);
                }
        }
    }); 
             }else{
                 window.location.href="loginpage";
 		                }
 	                  });
     });
	  $('#msgid').click(function () { toastr.success('message', 'title'); });

function submitForm(){
	 getsesVal().done(function(data){  
         if(data!=""){
	  var month =$("#month").val();
	if(month==""){
		alert("month required");
	}else{
	$("#submitid").attr("disabled",true);
		 var form = $('#formid')[0];
	     var data = new FormData(form);
		$.ajax({
	            url: "saveTemplate", //this is the submit URL
	            type: "POST",
	            enctype: 'multipart/form-data',
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            success: function(response){
	            	if(response!=null || response!=""){
	   	            alert(response);
	   	            	window.location.href="addTemplate";
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

</script>  
</body>
</html>

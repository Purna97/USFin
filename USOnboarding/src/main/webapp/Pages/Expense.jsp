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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" href="resources/css/css/select2.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="resources/css/css/datepicker3.min.css" />

</head>

<body>
	<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">Create Purchase</h5>
							<br>
							<div class="col-md-11 col-sm-12">
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;">*</Span>Vendor</label>
									<div class="col-sm-4">
										<select name="vendorid" class="form-control text-left"
											id="vendorid" required>
											<option value="">Select Vendor</option>
											<option value="41">Hicks Hardware</option>
											<option value="57">Squeaky Kleen Car Wash</option>
											<option value="56">Bob's Burger Joint</option>
											<option value="50">Tania's Nursery</option>
											<option value="33">Chin's Gas and Oil</option>
											<option value="47">Pam Seitz</option>
											<option value="30">Books by Bessie</option>
											<option value="49">Robertson & Associates</option>
											<option value="52">Tony Rondonuwu</option>
											<option value="42">Lee Advertising</option>
											<option value="38">Ellis Equipment Rental</option>
											<option value="43">Mahoney Mugs</option>
										</select>
									</div>

								</div>

								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;">*</Span>Amount</label>
									<div class="col-sm-4">
										<input id="purchaseamt" type="text"
											title="only alphabets are allowed" minlength="2"
											maxlength="15" autocomplete="off" placeholder="Enter Amount"
											name="purchaseamt" class="form-control" required>
									</div>

								</div>
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;">*</Span>Payment
										Type</label>
									<div class="col-sm-4">
										<select name="paytype" class="form-control text-left"
											id="paytype" required>
											<option value="">Select Payment Type</option>
											<option value="Cash">Cash</option>
											<option value="Check">Check</option>
											<option value="CreditCard">CreditCard</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;">*</Span>Payment
										Mode</label>
									<div class="col-sm-4">
										<select name="paymode" class="form-control text-left"
											id="paymode" required>
											<option value="">Select Payment Mode</option>
											<option value="41">MasterCard</option>
											<option value="42">Visa</option>
											<option value="35">Cash</option>
											<option value="35">Check</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-2">
										<button type="button" style="margin-left: 460px;"
											id="createpurchasebtn" class="btn btn-info btn-sm">Purchase</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<center>
					<img id="loadid" src="resources/images/loader.gif">
				</center>
				<div id="expensediv">
					<div class="col">
						<div class="card">
							<h5 class="card-header">All Expenses/Purchases</h5>
							<br>
							<table id="expensetable"
								class="table table-hover table-bordered"
								style="text-align: center;">
								<thead style="background-color: lavender;">
									<tr>
										<th>Purchase ID</th>
										<th>Vendor</th>
										<th>Total amount</th>
										<th>Payment type</th>
										<th>Transaction date</th>
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
	<script src="resources/js/js/jquery-2.1.4.min.js"></script>
	<script src="resources/js/newjs/bootstrap.min.js"></script>
	<script src="resources/js/newjs/formValidation.min.js"></script>
	<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
	<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
	<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
	<script src="resources/js/newdt/datatables-init.js"></script>
	<script type="text/javascript" src="resources/js/js/select2.min.js"></script>
	<script src="resources/preDefined/goback.js"></script>
	<script>

		 var tabledocse1 = $('#expensetable').DataTable({
				"order" : [ [ 0, "asc" ] ],
				lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
				bLengthChange : true,
				paging : true
			});
		 $('#loadid').hide();
		 $('#expensediv').hide();
 		  window.onload=function(){
 			 $('#loadid').show();
			 $.ajax({
					type : "GET",
					asyn : false,
					contentType : "application/text",
					url : "getallpurchases",
					success : function(response) {
						 $('#loadid').hide();
						  $('#expensediv').show();
						  const obj = JSON.parse(response);
							$('#expensetable').dataTable().fnClearTable();
				  			if (tabledocse1)tabledocse1.clear();
				  			
					 	  $.each(obj.IntuitResponse.QueryResponse.Purchase, function (index, value) { 
					 		  
					 		  var Vendor=" ";
							    if(value.hasOwnProperty('EntityRef')){
							    	Vendor=value.EntityRef.name;
					 		    }else{
					 		    	Vendor="NA";
					 		    }
					
					 		  if(value!=undefined){
					 				tabledocse1.row.add([
							  			'' + value.Id	+ '',
							  		    '' + Vendor+ '',   
							  			'' + value.TotalAmt	+ '',
							  			'' + value.PaymentType	+ '',
							  			'' + value.TxnDate	+ ''
							              ]).draw();
					 		  }
						  }); 
					}
			 });
		 }  

	 $("#createpurchasebtn").click(function(event) {
	
		 var vendorid = $('#vendorid').val();
		 var purchaseamt = $('#purchaseamt').val();
		 var paytype = $('#paytype').val();
		 var paymode = $('#paymode').val();
		
		 $.ajax({
				type : "POST",
				asyn : false,
				url : "createpurchase",
				data : {
					"vendorid" : vendorid,
					"purchaseamt" : purchaseamt,
					"paytype" : paytype,
					"paymode" : paymode
				},
				success : function(response) {
					 Swal.fire({
						  position: 'top',
						  icon: 'success',
						  width:'500px',
						  height:'900px', 
						  title: 'Purchase Successful',
						  showConfirmButton: false,
						  timer: 1250
						});
				}
		 });
		 });

	</script>
</body>
</html>

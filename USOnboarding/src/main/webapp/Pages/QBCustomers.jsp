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

				<center>
					<img id="loadid" src="resources/images/loader.gif">
				</center>
				<div id="customerdiv">
					<div class="row">
						<div class="col">
							<div class="card">
								<h5 class="card-header">All Customers</h5>
								<br>
								<table id="customertable"
									class="table table-hover table-bordered"
									style="text-align: center;">

									<thead style="background-color: lavender;">
										<tr>
											<th>Customer ID</th>
											<th>Customer Name</th>
											<th>Phone Number</th>
											<th>Bill Address</th>
											<th>Ship Address</th>
											<th>Balance</th>
											<th>Currency</th>
											<th>PrimaryEmail</th>
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

		 var tabledocse1 = $('#customertable').DataTable({
				"order" : [ [ 0, "asc" ] ],
				lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
				bLengthChange : true,
				paging : true
			});
		 $('#loadid').hide();
		 $('#customerdiv').hide();
		  window.onload=function(){
			  $('#loadid').show();
			 $.ajax({
					type : "GET",
					asyn : false,
					contentType : "application/text",
					url : "getallcustomers",
					success : function(response) {
						  $('#loadid').hide();
						  $('#customerdiv').show();
						  const obj = JSON.parse(response);
							$('#customertable').dataTable().fnClearTable();
				  			if (tabledocse1)tabledocse1.clear();
				  			
					 	  $.each(obj.IntuitResponse.QueryResponse.Customer, function (index, value) {  
			           
					 		    var phone=" ";
							    if(value.hasOwnProperty('PrimaryPhone')){
							    	phone=value.PrimaryPhone.FreeFormNumber;
					 		    }else{
					 		    	phone="NA";
					 		    }
							    
							    var billaddress=" ";
							    if(value.hasOwnProperty('BillAddr')){
							    	billaddress=value.BillAddr.Line1+","+value.BillAddr.City;
					 		    }else{
					 		    	billaddress="NA";
					 		    }
							    
							    var shipaddress="";
							    if(value.hasOwnProperty('ShipAddr')){
							        shipaddress=value.ShipAddr.Line1+","+value.ShipAddr.City;
					 		    }else{
					 		    	shipaddress="NA";
					 		    }
							    
							tabledocse1.row.add([
				  			'' + value.Id	+ '',
				  			'' + value.DisplayName	+ '',
				  			'' + phone	+ '',
				  			'' + billaddress	+ '',
				  			'' + shipaddress	+ '',
				  			'' + value.Balance	+ '',
				  			'' + value.CurrencyRef.name	+ '',
				  			'' + value.PrimaryEmailAddr.Address	+ ''
				            ]).draw();
				
						  }); 
					}
			 });
		 } 



	</script>
</body>
</html>

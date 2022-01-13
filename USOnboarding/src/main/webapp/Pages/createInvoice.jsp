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
<style type="text/css">
.field-error .control-label, .field-error .help-block, .field-error .form-control-feedback
	{a
	color: red;
}
.swal2-popup {
  font-size: 0.8rem !important;
 }
  
.field-success .control-label, .field-success .help-block,
	.field-success .form-control-feedback {
	color: #3c763d;
}

#pendingdocs {
	width: 105% !important;
}

.col-lg-2 {
	padding-right: 5px;
}

#iconImgId {
	max-width: 30%;
}

.form-control {
	font-size: 12px;
}
#lcaqueDiv .form-group {
	width: 130%;
}
</style>
<body>
	<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
 			   <center>
					<img id="loadid" src="resources/images/loader.gif">
				</center>
				<div class="row"  id="disableform">
					<div class="col">
						<div class="card">
							<center><h5 class="card-header"><b>Create Invoice</b></h5></center>

							<form action="/" method="post" class="form-horizontal" id="createInvoiceForm" enctype="multipart/form-data">
							<input type="hidden" id="invid" name="invid">
							<input type="hidden" id="invstatus" name="invstatus">
							<input type="hidden" id="custmail1" name="custmail1">
							<input type="hidden" id="fileName" name="fileName" value="${timesheetDto.fileName}">
							<input type="hidden" id="candidate_id" name="candidate_id" value="${timesheetDto.candidate_id}">
							</form>
							<br>
							<input type="hidden" id="qb_customer_id" name="qb_customer_id" value="${timesheetDto.qbcustid}">																					
							<input type="hidden" id="qbproductid" name="qbproductid" value="${timesheetDto.qbproductid}">
							<input type="hidden" id="tsids" name="tsids" value="${timesheetDto.tsids}">
							<%-- <input type="hidden" id="timesheet_id" value="${timesheetDto.timesheet_id}"> --%>
							<input type="hidden" id="inv_terms" value="${timesheetDto.invoice_terms}">
							<input type="hidden" id="billable_hours" value="${timesheetDto.totalbillablehours}">
							
							
							<div id="lcaqueInitDiv">
										<div class="row">
										<br>
									<div class="col-md-6 col-sm-12">
									<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;"></Span>Customer</label>
									<div class="col-sm-6">
									<input name="customerName" class="form-control text-left"  
											id="customerName" readonly>
										
										<!-- <select name="customerid" class="form-control text-left"  
											id="customerid" required>
										</select> -->
										<!-- onchange="loadcustomerdetails()" -->
									</div>

								</div>

								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;"></Span>Customer email</label>
									<div class="col-sm-6">
										<textarea id="custmail" type="text"
											title="only alphabets are allowed" minlength="2" rows="2"
											maxlength="500" autocomplete="off" placeholder="Separate emails with comma"
											name="custmail" class="form-control" readonly></textarea>
									</div>
								</div>
								
									<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;"></Span>Billing address</label>
									<div class="col-sm-6">
										<textarea id="billaddrs" type="text"
											title="only alphabets are allowed" minlength="2" rows="2"
											maxlength="100" autocomplete="off" placeholder="Enter billing address"
											name="billaddrs" class="form-control" readonly></textarea>
									</div>
								</div>
								<input type="hidden" id="invdueDays">
								<input type="hidden" id="inv_term_id" value="${timesheetDto.invoice_terms}">
									<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;"></Span>Payment Terms</label>
									<div class="col-sm-6">
										<select name="invoiceterm" class="form-control text-left" onchange="" 
											id="invoiceterm" required>
										<option value="">Due on Receipt</option>
										<option value="10">Net 10</option>
										<option value="15">Net 15</option>
										<option value="30">Net 30</option>
										<option value="60">Net 60</option>
										<option value="custom">Custom</option>
										</select>
									</div>

								</div>
								
									<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;"></Span>Product/Service</label>
									<div class="col-sm-6">
									<input name="productName" class="form-control text-left"  
											id="productName" readonly>
										<!-- <select name="productid" class="form-control text-left" onchange="getPricebyId()" 
											id="productid" required>
										</select> -->
									</div>
								</div>
				
								<!-- <div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;">Taxable (8 %)</label>
									<div class="col-sm-6">
										<input type="checkbox" name="tax" id="tax" style="height:25px;width:25px;" 
											 required>
									</div>
								</div> -->
								<input type="hidden" id="fromdate" value="${timesheetDto.fromdate}"><input type="hidden" id="todate"  value="${timesheetDto.todate}">
								<div class="form-group row" style="display:none;">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;"></Span>From Date</label>
									<div class="col-sm-2">
										<input id="from_date"  type="text"
										 autocomplete="off" placeholder="Enter From Date" 
											name="fromdate" class="form-control" readonly>
									</div>
									<label for="inputPassword" class="col-sm-0.5 control-label"
										style="margin-top: .5%;"><Span style="color: red;"></Span>To Date</label>
									<div class="col-sm-2">
										<input id="to_date"  type="text"
										 autocomplete="off" placeholder="Enter To Date"
											name="to_date" class="form-control" readonly >
									</div>
								</div>
								<input type="hidden" name="qty" id="qty" />
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;"></Span>Quantity <b><span style="color:black;">(HH:MM)</span></b><%-- (<Span style="color: green;">Billable Hours - ${timesheetDto.totalbillablehours}</Span>) --%></label>
									<div class="col-sm-6">
										<input name="" class="form-control text-left"  placeholder="Enter billable hours"
											value="${timesheetDto.totalbillablehours}" readonly><!-- &nbsp;<button style="color:white;background-color:#25c347;border-color:#25c347;border-radius:10px;" id="billablebtn"><b>Get Time Sheet hours</b></button> -->
									</div>
								</div>
					 			<%-- <div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;">Attachments</label>
									<div class="col-sm-6">
									<span>${timesheetDto.fileName}</span>

									</div>
								</div> --%> 
								
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;">Attachments</label>
									<div class="col-sm-9">
									<a id="attachmentid" style="width:120px;"></a>
									</div>
								</div>
								
								
									</div>
									
									<div class="col-md-6 col-sm-12">
													<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;"></Span>Rate (per hour)</label>
									<div class="col-sm-6">
										<input name="productrate" class="form-control text-left" onchange=""  placeholder="Enter Rate"
											id="productrate" value="${timesheetDto.billrate}" readonly>
									</div>
								</div>
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;"></Span>Amount ($)</label>
									<div class="col-sm-6">
										<input type="text" name="amount" class="form-control text-left" onchange=""  placeholder="Enter Amount"
											id="amount" readonly>
									</div>
								</div>
									<!--  <div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;">Discount</label>
									 <div class="col-sm-3">
										<select name="distype" class="form-control text-left"  onchange="discounttypecheck()"
											id="distype" required>
									       <option value="">Discount Type</option>
										   <option value="valuebased">Value based</option>
										   <option value="percentbased">Percent based</option>
										</select>
									</div> 
									<div class="col-sm-3">
									<input type="text" name="discountamt" class="form-control text-left"  onkeyup="validateDiscount()"  placeholder="Enter Discount"
											id="discountamt" >
									</div>
								</div> --> 
								 
 								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;">*</Span>Invoice Date</label>
									<div class="col-sm-6">
										<input id="invdate"  type="date"
										 autocomplete="off" placeholder="Enter Invoice Date" onchange="getduedate()"
											name="invdate" class="form-control" required>
									</div>
								</div>
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top:.5%;"><Span style="color: red;">*</Span>Due Date</label>
									<div class="col-sm-6">
										<input id="duedate" type="date"
											 autocomplete="off"
											name="duedate" class="form-control" readonly>
									</div>
								</div> 
								 <div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top:.5%;">Product Description</label>
									<div class="col-sm-6">
										<textarea id="prod_desc" 
											 autocomplete="off"  placeholder="Enter Message"
											name="prod_desc" class="form-control" readonly></textarea>
									</div>
								</div> 
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top:.5%;"><Span style="color: red;">*</Span>Message on Invoice</label>
									<div class="col-sm-6">
										<textarea id="msg" 
											 autocomplete="off"  placeholder="Enter Message"
											name="msg" class="form-control" required></textarea>
									</div>
								</div>
									</div>
				
				</div>
				</div>
									<br>
										<div class="form-group row" >
										<button type="button"  style="border-radius:36px;margin-left:407px;width:120px;font-weight:25px;"
											id="invoicesavebtn" class="btn btn-primary btn-sm"><b>Save</b></button>&nbsp;
											<button type="button"  style="border-radius:36px;width:120px;"
											id="invoicebtn" class="btn btn-success btn-sm"><b>Save and Send</b></button>&nbsp;
											
											<button type="button"  style="border-radius:36px;width:120px;"  onclick="clrinvoice()"
											id="" class="btn btn-info btn-sm"><b>Clear</b></button>&nbsp;
											<button href="allinvoices" type="button"  style="border-radius:36px;;width:120px;" onclick="history.back()"
											id="" class="btn btn-danger btn-sm"><b>Cancel</b></button>
									</div>
							
						</div>
						
						<!-- <div class="card">
							<h5 class="card-header">All Invoices</h5>
							<br>
							<table id="allinvoicetable"
								class="table table-hover table-bordered"
								style="text-align: center;">
								<thead style="background-color: lavender;">
									<tr>
										<th>ID</th>
										<th>Customer Name</th>
										<th>Product Name</th>
										<th>Invoice Number</th>
										<th>Due Amount</th>
										<th>Due Date</th>
										<th>Download</th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>
						</div> -->
						
					</div>
				</div>

				<!-- 		<button type="button" id="btnh1bAppl"
							style="margin-left: 0px; margin-right: auto;margin-left: 3%; display: block; margin-top: 1%; margin-bottom: 1%;border-radius: 25px;background-color:steelblue;color:white;font-size:20px;width:200px;"
							class="btn btn-primary btn-sm collapsibleInvoice">All Invoices</button> -->

	
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
			 $('#productid').select2();
			 var tabledocse1 = $('#allinvoicetable').DataTable({
		 			"order" : [ [ 0, "asc" ] ],
		 			lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
		 			bLengthChange : true,
		 			paging : true
		 		});
			 $('#loadid').hide();
		  window.onload=function(){
				/* $.ajax({
					type : "GET",
					asyn : false,
					contentType : "application/text",
					url : "getallcustomers",
					success : function(response) {
					$('#customerid').empty(); 
						  const obj = JSON.parse(response);
							$('#customerid').append($('<option/>').attr("value", '').text("Select Customer"));
						    $.each(obj.IntuitResponse.QueryResponse.Customer, function (index, value) {  
							$('#customerid').append($('<option/>').attr("value",value.Id).text(value.DisplayName));
						 });
					}
				}), */
				
				var files= $('#fileName').val();
				var nameArr = files.split(',');
				var gethtml ='';
				for(i=0;i<=nameArr.length-1;i++){
					var filetype="";
					var candidate_id=$('#candidate_id').val();
					var res = encodeURIComponent(nameArr[i]);
				    var file ='<a href="downloadocs?filename='+res+'&amp;filetype='+filetype+'&amp;candidate_id='+candidate_id+'" style="color:blue"><b>'+nameArr[i]+'<b></a><br>';
				    gethtml += file;						    
				}
				let text =gethtml;
				document.getElementById("attachmentid").innerHTML = text;
						
				
				 $.ajax({
						type : "GET",
						asyn : false,
						contentType : "application/text",
						url : "getproducts",
						success : function(response) {
							    const obj = JSON.parse(response);
								$('#productid').append($('<option/>').attr("value", '').text("Select Product/Service"));
								$.each(obj.IntuitResponse.QueryResponse.Item, function (index, value) {  
								$('#productid').append($('<option/>').attr("value",value.Id).text(value.Name));
							});
						}
				 }),
				$.ajax({
						type : "GET",
						asyn : false,
						contentType : "application/text",
						url : "getallpaymentterms",
						success : function(response) {
						      $('#invoiceterm').empty(); 
							  const obj = JSON.parse(response);
								$('#invoiceterm').append($('<option/>').attr("value", '').text("Select Payment Terms"));
							    $.each(obj.IntuitResponse.QueryResponse.Term, function (index, value) {
								$('#invoiceterm').append($('<option/>').attr("value",value.Id).text(value.Name));
							 });
						}
				 }).done(function() {
						/*   var customer=$("select[name='customerid']");
						  customer.find('option[value="'+customer_id+'"]').attr('selected', true);
						  $('#customerid option[value="' + customer_id + '"]').show();
						  $('#customerid').children('option').hide(); */
						  $("#inv_term_id").val($("#inv_terms").val());
						  loadcustomerdetails();
						  getBillableHours();
						  getPricebyId();
						  var fromdt=$("#fromdate").val();
						  let date = new Date(fromdt); // 2020-06-21
						  let longMonth = date.toLocaleString('en-us', { month: 'long' });
						  let sDay = date.toLocaleString('en-us', { day: 'numeric' });
						  var fd=longMonth+" "+sDay;
						  
						  var todt=$("#todate").val();
						  let tdate = new Date(todt); // 2020-06-21
						  let tlongMonth = tdate.toLocaleString('en-us', { month: 'long' });
						  let tsDay = tdate.toLocaleString('en-us', { day: 'numeric' });
						  var td=tlongMonth+" "+tsDay;
						  $("#from_date,#to_date").val('');
						  $("#from_date").val(fd)
						  $("#to_date").val(td)
						  
					});
				/*  $.ajax({
		 				type : "GET",
		 				asyn : false,
		 				contentType : "application/text",
		 				url : "getallInvoiceIds",
		 				success : function(response) {
		 					// $('#loadid').hide();
		 					// $('#allinvoicediv').show();
		 					  const obj = JSON.parse(response);
		 						$('#allinvoicetable').dataTable().fnClearTable();
		 			  			if (tabledocse1)tabledocse1.clear();
		 			  			
		 					  $.each(obj.IntuitResponse.QueryResponse.Invoice, function (index, value) { 
		 						  var product=" ";
		 						    if(value.hasOwnProperty('SalesItemLineDetail')){
		 						    	product=value.Line[0].SalesItemLineDetail.ItemRef.name;
		 				 		    }else{
		 				 		    	product="NA";
		 				 		    }
		 						    
		 						   var amt=" ";
		 						    if(value.hasOwnProperty('Amount')){
		 						    	amt=value.Line[0].Amount;
		 				 		    }else{
		 				 		    	amt="NA";
		 				 		    }
		 						    
		 						    
		 						tabledocse1.row.add([
		 			  			'' + value.Id	+ '',
		 			  			'' + value.CustomerRef.name	+ '',
		 			  			'' + product+ '',
		 			  			'' + value.DocNumber	+ '',
		 			  			'' + amt 	+ '',
		 			  			'' + value.DueDate	+ '',
		 			            '<a class="btn btn-primary btn-sm" style="color:white;" onclick="downloadinvoice('+value.Id+')"  ><i class="fa fa-download"></i></a> '  ]).draw();
		 					  });
		 				}
				 }) */
		 } 
		  function clrinvoice(){
			  $('#invoiceterm').val("");
			  $('#discountamt').val("");
			  $('#distype').val("");
			  $('#invdate').val("");
			  $('#duedate').val("");
			  $('#msg').val("");
			  $("input[type='checkbox']").attr("checked",false);
		  }
		  
		  /* function cancelinvoice(){
			  var custid=$('#qb_customer_id').val();
			  window.location.href="getcustomerpage?custid="+custid+"";
		  } */
		  
		  
		  function getDueDays(){
			  var inv_term_id=$("#inv_term_id").val();
			  $('#invdueDays').val('');
			  $.ajax({
					type : "GET",
					asyn : false,
					contentType : "application/text",
					url : "getpaymentterms",
					data : {
						"paytermId" : inv_term_id
					},
					success : function(response) {
						  const obj = JSON.parse(response);
						  $('#invdueDays').val(obj.IntuitResponse.Term.DueDays);
					}
				});
		  }
		 
		  $('#invoiceterm').on('change', function() {
				if($('#invoiceterm').val()==$('#inv_term_id').val())
					{
					   $('#invdate,#duedate').val('');
					   getDueDays();
					}else{
						 $('#invdate,#duedate').val('');
						 var inv_term_id=$('#invoiceterm').val();
						  $('#invdueDays').val('');
						  $.ajax({
								type : "GET",
								asyn : false,
								contentType : "application/text",
								url : "getpaymentterms",
								data : {
									"paytermId" : inv_term_id
								},
								success : function(response) {
									  const obj = JSON.parse(response);
									  $('#invdueDays').val(obj.IntuitResponse.Term.DueDays);
								}
							});
						}});		
		  
		  function getBillableHours(){
			    var billablehours=$("#billable_hours").val();
			    var hrs=billablehours.split(':').shift();
			    var mins=billablehours.split(':').pop();
                var min = parseInt(mins)/60;
			    var billable=parseInt(hrs)+parseFloat(min);
				$('#qty').val('');
				$('#qty').val(billable.toFixed(2));
				getAmount();
		  }
		  function getduedate(){
			  var fromdate = $('#invdate').val();
			  var terms = $('#invdueDays').val();
			 // var terms =$("#invoiceterm option:selected").text();
			  $('#duedate').val('');
			  if(terms!='custom'){
				  const d = new Date(fromdate);
				  d.setDate(d.getDate() + parseInt(terms));
				  //alert(d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate())
				//  $('#duedate').val(d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate());
				  $('#duedate').val(d.getFullYear()+"-"+(d.getMonth()+1).toString().padStart(2, "0")+"-"+d.getDate().toString().padStart(2, "0"));
			  }
		  }
		  
		  function  getAmount(){
			  var quantity=$('#qty').val();
			  var rate=$('#productrate').val();
			  var finalamount=quantity*rate;
			  $('#amount').val(finalamount);
			  
			 /*  var taxamount=8;
			   if($("#tax").is(':checked')){
				  $('#amount').val((taxamount/100*finalamount)+finalamount);
			  }else{
				  $('#amount').val(finalamount);
			  }  */
		  }
		  function  getPricebyId(){
				var productid = $('#qbproductid').val();
				var productName1=$( "#productid option:selected" ).text();
				var productName=productName1.split('_').shift();
				$('#productName,#productrate,#prod_desc').val(''); 
				$.ajax({
					type : "GET",
					asyn : false,
					contentType : "application/text",
					url : "getUnitPricebyId",
					data : {
						"productid" : productid,
					},
					success : function(response) {
						  const obj = JSON.parse(response);
						  $('#productName').val(obj.IntuitResponse.Item.Name);
						  $('#productrate').val(obj.IntuitResponse.Item.UnitPrice);
						  $('#prod_desc').val(obj.IntuitResponse.Item.Description);
					}
				});/* ,
				$.ajax({
					type : "GET",
					asyn : false,
					contentType : "application/text",
					url : "getQbEmpId",
					data : {
						"productName" : productName,
					},
					success : function(response) {
						  const obj = JSON.parse(response);
						  var qbEmpId=obj.IntuitResponse.QueryResponse.Employee.Id;
						 $.ajax({
								type : "GET",
								asyn : false,
								contentType : "application/text",
								url : "getCandidateIdbyQbEmpId",
								data : {
									"productName" : productName,
								},
								success : function(response) {
									
								}
						  }); 
					}
				}); */
			 }
		  
         function loadcustomerdetails(customerid){
			/* 	var customerid = $('#customerid').val(); */
			 var customerid=$("#qb_customer_id").val();
				$('#billaddrs,#customerName,#custmail').val(''); 
				$.ajax({
					type : "GET",
					asyn : false,
					contentType : "application/text",
					url : "getcustomerbyid",
					data : {
						"customerid" : customerid,
					},
					success : function(response) {
					 const obj = JSON.parse(response);
					// var billaddrs= obj.IntuitResponse.Customer.GivenName+" "+obj.IntuitResponse.Customer.FamilyName+" "+obj.IntuitResponse.Customer.FullyQualifiedName+" "+obj.IntuitResponse.Customer.BillAddr.Line1+" "+obj.IntuitResponse.Customer.BillAddr.City+","+ obj.IntuitResponse.Customer.BillAddr.CountrySubDivisionCode+" "+obj.IntuitResponse.Customer.BillAddr.PostalCode;
	                var billaddrs=obj.IntuitResponse.Customer.CompanyName+" "+obj.IntuitResponse.Customer.BillAddr.Line1+" "+obj.IntuitResponse.Customer.BillAddr.City+","+ obj.IntuitResponse.Customer.BillAddr.CountrySubDivisionCode+","+obj.IntuitResponse.Customer.BillAddr.Country+" "+obj.IntuitResponse.Customer.BillAddr.PostalCode;
 					 $('#customerName').val(obj.IntuitResponse.Customer.CompanyName);
	                 $('#custmail').val(obj.IntuitResponse.Customer.PrimaryEmailAddr.Address);
	                 
	               //  $('#inv_term_id').val(obj.IntuitResponse.Customer.SalesTermRef);
			         $('#billaddrs').val(billaddrs);
					}
				}).done(function() {
					  var inv_term_id=$("#inv_term_id").val();
				      var invoiceterm=$("select[name='invoiceterm']");
				      invoiceterm.find('option[value="'+inv_term_id+'"]').attr('selected', true);
					 // $('#invoiceterm option[value="' + inv_term_id + '"]').show();
					//  $('#invoiceterm').children('option').hide(); 
					  getDueDays();
				});
			 }
    	 $("#invoicebtn").click(function(event) {
    		 $('#invstatus').val("");
    		 $('#invstatus').val("send");
    		 
    		if($('#invdate').val()!="" && $('#duedate').val()!="" && $('#msg').val()!="" && $('#invoiceterm').val()!=""){
    			 $("#invoicebtn").attr("disabled", true);
        		 $("#invoicesavebtn").attr("disabled", true);
    			 var customerid = $('#qb_customer_id').val();
        		 var productid = $('#qbproductid').val();
        		 var quantity = $('#qty').val();
        		 var productrate = $('#productrate').val();
        		 var prod_desc = $('#prod_desc').val();
        		 var amount = $('#amount').val();
        		 var fromdate = $('#invdate').val();
        		 var duedate = $('#duedate').val(); 
        		 var invstartdate = $('#from_date').val();
        		 var invtodate = $('#to_date').val();
        		 var msg = $('#msg').val();
        		 var mail = $('#custmail').val();
        		 
        		 $('#custmail1').val('');
				 $('#custmail1').val(mail);

        		 var discountamt = $('#discountamt').val();
        		 var pay_term_id = $('#invoiceterm').val();
        		 var tsids = $('#tsids').val();
        		 var candidate_id=$("#candidate_id").val();
        		 var invfdate = $('#fromdate').val();
        		 var invtdate = $('#todate').val();
        		 var fileName = $('#fileName').val();
        		 var mail = $('#custmail').val();
        		 var discount_type=$('#distype').val();
        		 
        		 $.ajax({
        				type : "POST",
        				asyn : false,
        				url : "createinvoice",
        				data : {
        					"customerid" : customerid,
        					"productid" : productid,
        					"quantity" : quantity,
        					"productrate" : productrate,
        					"amount" : amount,
        					"fromdate" : fromdate,
        					"duedate" : duedate,
        					"msg" : msg,
        				//	"discountamt" : discountamt,
        					"prod_desc" : prod_desc,
        					"invstartdate" : invstartdate,
        					"invtodate" : invtodate,
        					"pay_term_id" : pay_term_id,
        					"tsids":tsids,
        					"candidate_id":candidate_id,
        					"fileName":fileName,
        					"invfdate" : invfdate,
        					"invtdate" : invtdate,
        					"mail" : mail,
        				//	"discount_type" : discount_type
        				},
        				success : function(response) {
        					 Swal.fire({
       						  position: 'top',
       						  icon: 'success',
       						  width:'500px',
       						  title: 'Invoice Sent Successfully',
       						  showConfirmButton: false,
       						  timer: 1250
       						});
        					 
        					 const obj = JSON.parse(response);
         					 var invoiceId= obj.IntuitResponse.Invoice.Id;
         					 
         				   $('#invid').val('');
       					   $('#invid').val(invoiceId);
       					   $('html, body').animate({ scrollTop: 0 }, 'fast');
       					   $('#loadid').show();
       					$("#disableform").fadeOut(2000)
       			        	var form = $('#createInvoiceForm')[0];
       			 			var data = new FormData(form);
       			 			$.ajax({
       			 				url : "attachables", 
       			 				type : "POST",
       			 				enctype : 'multipart/form-data',
       			 				data : data,
       			 				processData : false,
       			 				contentType : false,
       			 				cache : false,
       			 				success : function(response) {
       			 				if(response!=""){
       			 				$('#loadid').hide();
       			 			window.location.href="getcustomerpage?custid="+customerid+"";	
	       							//	window.location.href="allinvoices";	
	       							}
       			 				}
       			 			 });

        				}
        		 });
    		 }else{
 				if($('#msg').val()!=""){}
 				else{$('#msg').focus(); }
 				
				if($('#duedate').val()!=""){}
				else{$('#duedate').focus(); }
   			
				if($('#invdate').val()!=""){}
				else{$('#invdate').focus(); }
				
   			   if($('#invoiceterm').val()!=""){}
   			   else{$('#invoiceterm').focus(); }
    		 }
    		 });
    	 
    	 $("#invoicesavebtn").click(function(event) {
    		 $('#invstatus').val("save");
     		if($('#invdate').val()!="" && $('#duedate').val()!="" && $('#msg').val()!="" && $('#invoiceterm').val()!=""){
     			 $("#invoicebtn").attr("disabled", true);
        		 $("#invoicesavebtn").attr("disabled", true);
     			 var customerid = $('#qb_customer_id').val();
         		 var productid = $('#qbproductid').val();
         		 var quantity = $('#qty').val();
         		 var productrate = $('#productrate').val();
         		 var prod_desc = $('#prod_desc').val();
         		 var amount = $('#amount').val();
         		 var fromdate = $('#invdate').val();
         		 var duedate = $('#duedate').val();
         		 var invstartdate = $('#from_date').val();
         		 var invtodate = $('#to_date').val();
         		 var msg = $('#msg').val();
         		 var mail = $('#custmail').val();
         	//	 var discountamt = $('#discountamt').val();
         		 var pay_term_id = $('#invoiceterm').val();
         		 var tsids = $('#tsids').val();
         		 var candidate_id=$("#candidate_id").val();
         		 var invfdate = $('#fromdate').val();
         		 var invtdate = $('#todate').val();
         		 var fileName = $('#fileName').val();
         		 var mail = $('#custmail').val();
         	//	 var discount_type=$('#distype').val();
         	  // $("#can_id").val(candidate_id);
         		 $.ajax({
         				type : "POST",
         				asyn : false,
         				url : "createinvoice",
         				data : {
         					"customerid" : customerid,
         					"productid" : productid,
         					"quantity" : quantity,
         					"productrate" : productrate,
         					"amount" : amount,
         					"fromdate" : fromdate,
         					"duedate" : duedate,
         					"msg" : msg,
         					//"discountamt" : discountamt,
         					"prod_desc" : prod_desc,
         					"invstartdate" : invstartdate,
         					"invtodate" : invtodate,
         					"pay_term_id" : pay_term_id,
         					"tsids":tsids,
         					"candidate_id":candidate_id,
         					"fileName":fileName,
         					"invfdate" : invfdate,
         					"invtdate" : invtdate,
         					"mail" : mail
         				//	"discount_type" : discount_type
         				},
         				success : function(response) {
         					 Swal.fire({
        						  position: 'top',
        						  icon: 'success',
        						  width:'500px',
        						  title: 'Invoice Saved Successfully',
        						  showConfirmButton: false,
        						  timer: 1250
        						});
         					 const obj = JSON.parse(response);
         					 var invoiceId= obj.IntuitResponse.Invoice.Id;
         					 
         					$('#invid').val('');
       					    $('#invid').val(invoiceId);
       					 $('html, body').animate({ scrollTop: 0 }, 'fast');
       					 $('#loadid').show();
       					$("#disableform").fadeOut(2000)
       			        	var form = $('#createInvoiceForm')[0];
       			 			var data = new FormData(form);
       			 			$.ajax({
       			 				url : "attachables", 
       			 				type : "POST",
       			 				enctype : 'multipart/form-data',
       			 				data : data,
       			 				processData : false,
       			 				contentType : false,
       			 				cache : false,
       			 				success : function(response) {
       			 				if(response!=""){
       			 				$('#loadid').hide();
       			 			window.location.href="getcustomerpage?custid="+customerid+"";	
       								//window.location.href="allinvoices";	
       							}
       			 				}
       			 			 });
         				}
         		 });
     		}else{
     			
 				if($('#msg').val()!=""){}
 				else{$('#msg').focus(); }
 				
 				if($('#duedate').val()!=""){}
 				else{$('#duedate').focus(); }
 				
 	   			if($('#invdate').val()!=""){}
 	   			else{$('#invdate').focus(); }
 	   			 
 	   			if($('#invoiceterm').val()!=""){}
 	   			else{$('#invoiceterm').focus(); }
 	   			
 	    		 }
     		});
    	 
    	 $("#billablebtn").click(function(event) {
    		 var customerid = $('#customerid').val();
    		 var fromdate = $('#fromdate').val();
    		 var todate = $('#todate').val();
    		 $.ajax({
 				type : "GET",
 				asyn : false,
 				contentType : "application/text",
 				url : "getbillablehours",
 				data : {
 					"customerid" : customerid,
 					"fromdate" : fromdate,
 					"todate" : todate
 				},
 				success : function(response) {
 					var hrs=response.split(':').shift();
 					var mins=response.split(':').pop();
                    var min = parseInt(mins)/60;
 					var billable=parseInt(hrs)+parseFloat(min);
 					$('#qty').val('');
 					$('#qty').val(billable.toFixed(2));
 					getAmount();
 				}
 		 });
    	 });
/* 
	  function validateDiscount(){
 		  var discountType=$('#distype').val();
 		  var discount=parseInt($('#discountamt').val()); 
 		  var amt=parseInt($('#amount').val());
 		  
 		  if(discountType!=""){
			  if(discountType=='percentbased'){
				  if(discount>100){
					  Swal.fire({
   						  position: 'top',
   						  icon: 'warning',
   						  width:'800px',
   						  height:'900px', 
   						  title: 'discount percentage can be between 0 to 100',
   						  showConfirmButton: false,
   						  timer: 2200
   						}).then((result) => {
   							$("#invoicebtn").attr("disabled", true);
  				    	    $("#invoicesavebtn").attr("disabled", true);
   						});
				  }else{
					  $("#invoicebtn").attr("disabled", false);
			    	  $("#invoicesavebtn").attr("disabled", false);
				  }
			  }else{
				  if(discount>amt){
					  Swal.fire({
   						  position: 'top',
   						  icon: 'warning',
   						  width:'800px',
   						  height:'900px', 
   						  title: 'discount can be less or equal to total Amount',
   						  showConfirmButton: false,
   						  timer: 2200
   						}).then((result) => {
   							$("#invoicebtn").attr("disabled", true);
  				    	    $("#invoicesavebtn").attr("disabled", true);
   						});
				  }else{
					  $("#invoicebtn").attr("disabled", false);
			    	  $("#invoicesavebtn").attr("disabled", false);
				  }
			  }
		  } 
	  }
	  $("#discountamt").prop("readonly", true);  
		 function discounttypecheck(){
			  $('#discountamt').val("");
 			  var discounttype=$('#distype').val();
 			  
 			  if($("#invoicebtn,#invoicesavebtn").attr("disabled", true)){
 				 $("#invoicebtn").attr("disabled", false);
		    	 $("#invoicesavebtn").attr("disabled", false);
 			  }
 			  if(discounttype!=""){
 				 $("#discountamt").prop("readonly", false);
 			  }else{
 				 $("#discountamt").prop("readonly", true);  
 			  }
 		  } */
		 

/* 	 $("#invoicebtn").click(function(event) {
		 var invoiceid = $('#invoice_id').val();
		 $.ajax({
				type : "GET",
				asyn : false,
				contentType : "application/json",
				url : "generateinvoice",
				data : {
					"invoiceid" : invoiceid,
				},
				success : function(response) {
				 	if(response==""){
						alert("Data not Available")
					}else{
			    const obj = JSON.parse(response);
	
			    var invoiceid=obj.IntuitResponse.Invoice.Id;
			    var DocNumber=obj.IntuitResponse.Invoice.DocNumber;
			    var DueDate=obj.IntuitResponse.Invoice.DueDate;
			    var customername=obj.IntuitResponse.Invoice.CustomerRef.name;
			    var amt=obj.IntuitResponse.Invoice.Line[0].Amount;
			    $('#historyview').empty();
			    var tr="<tr><td>"+invoiceid+"</td>"
           			tr=  tr+"<td>"+customername+"</td>"
           			tr=  tr+"<td>"+DocNumber+"</td>"
       	   			tr=  tr+"<td>"+amt+"</td>"
       	   		    tr=  tr+"<td>"+DueDate+"</td></tr>";
       				$('#historyview').append(tr); 
       			    $('#invoicediv').show();
					}
				}
		 });
		 }); */
	 
/* 	    var coll = document.getElementsByClassName("collapsibleInvoice");
		var i;
		for (i = 0; i < coll.length; i++) {
			coll[i].addEventListener("click", function() {
				//alert("collapsibleInvoice");
				this.classList.toggle("active");
				var content = this.nextElementSibling;
				if (content.style.display === "block") {
					content.style.display = "none";
				} else {
					content.style.display = "block";
				}
			});
		} */

	</script>
</body>
</html>

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
<style>
.swal2-popup {
  font-size: 0.8rem !important;
 }
 
</style>
<body>

<!-- 	<div id="right-panel" class="right-panel">
		<div class="content">
			Animated
			<div class="animated fadeIn">
			
			
			</div>
			</div>
			</div> -->
			


	<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">

           <div class="row">
				<div class="col">
						<div class="card">
							<h5 class="card-header"><b>Customer</b></h5><br>
							<div class="form-group row">
									<label for="inputPassword" class="col-sm-1 control-label"
										style="margin-top: .5%;"><Span style="color: red;border-radius:36px;"></Span><b>Customer</b></label>
									<div class="col-sm-3">
										<select name="customerid" class="form-control text-left"  
											id="customerid" required>
										</select>
									</div>&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" style="line-height:1.0;"  onclick="invbycustomers()"
											 class="btn btn-primary btn-sm"><b>Search</b></button>
					  </div>
					  </div>
					  </div>
					  </div>
				
			   <center>
					<img id="loadid" src="resources/images/loader.gif">
				</center>
				
				
				
			<div id="allinvoicediv">
			<div class="row">
					<div class="col">
						<div class="card">
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
										<th>Total Amount</th>
										<th>Balance</th>
										<th>Due Date</th>
										<th>Status</th>
										<th style="width:170px;">Action</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
					</div>
				</div>
				
				<div id="allinvoicebycust">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">All Invoices of &nbsp;&nbsp;<b><span id="custname" style="color:#f59e95;"></span></b></h5>
							<br>
							<table id="allinvoicetable1"
								class="table table-hover table-bordered"
								style="text-align: center;">
								<thead style="background-color: lavender;">
									<tr>
										<th>ID</th>
										<th>Customer Name</th>
										<th>Product Name</th>
										<th>Invoice Number</th>
										<th>Total Amount</th>
										<th>Balance</th>
										<th>Due Date</th>
										<th>Status</th>
										<th style="width:170px;">Action</th>
									</tr>
								</thead>
								<tbody id="invcust">
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
	
 	  $('#customerid').select2({
			placeholder: "Select Customer",
		  });  
	 
	 var tabledocse1 = $('#allinvoicetable').DataTable({
			"order" : [ [ 0, "asc" ] ],
			lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
			bLengthChange : true,
			paging : true
		});
	 
	 var tabledocse2 = $('#allinvoicetable1').DataTable({
			"order" : [ [ 0, "asc" ] ],
			lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
			bLengthChange : true,
			paging : true
		});
	 $('#loadid').hide();
	 $('#allinvoicediv').hide();
	 $('#allinvoicebycust').hide();
	  window.onload=function(){
		  $('#loadid').show();
		 $.ajax({
				type : "GET",
				asyn : false,
				contentType : "application/text",
				url : "getallInvoiceIds",
				success : function(response) {
					 $('#loadid').hide();
					 $('#allinvoicebycust').hide();
					 $('#allinvoicediv').show();
					  const obj = JSON.parse(response);
						$('#allinvoicetable').dataTable().fnClearTable();
			  			if (tabledocse1)tabledocse1.clear();
			  			
					  $.each(obj.IntuitResponse.QueryResponse.Invoice, function (index, value) { 
						    var product=" ";
						    	product=value.Line[0].SalesItemLineDetail.ItemRef.name;
						    
						    var status=value.EmailStatus;
						    var status1="";
						    var action="";

						    if(status=='NotSet'){
						    	status1="Saved";
						    }else{
						    	status1="<h5 style='color:green;'><b>Mail Sent</b></h5>";
						    }
						    
				
							   var pnote="";
							   if(value.hasOwnProperty('PrivateNote')){
								    pnote=value.PrivateNote;
								   if(pnote.includes("Voided")){
									   action='<a class="btn btn-primary btn-sm" style="color:white;" title="download" onclick="downloadinvoice('+value.Id+','+value.DocNumber+')"  ><i class="fa fa-download"></i></a> <a class="btn btn-danger btn-sm" style="color:white;" title="delete" onclick="deleteinvoice('+value.Id+','+value.SyncToken+')"><i class="fa fa-trash-alt"></i></a>';
								   }else{
									   action='<a class="btn btn-primary btn-sm" style="color:white;" title="download" onclick="downloadinvoice('+value.Id+','+value.DocNumber+')"  ><i class="fa fa-download"></i></a> <a class="btn btn-success btn-sm" style="color:white;" title="update" onclick="editinvoice('+value.Id+','+value.SyncToken+')" ><i class="fa fa-edit"></i></a> <a class="btn btn-secondary btn-sm" style="color:white;" title="void" onclick="voidinvoice('+value.Id+','+value.SyncToken+')"><i class="fa fa-eraser"></i></a> <a class="btn btn-danger btn-sm" style="color:white;" title="delete" onclick="deleteinvoice('+value.Id+','+value.SyncToken+')"><i class="fa fa-trash-alt"></i></a>';
								   }
							    } else{
							    	   action='<a class="btn btn-primary btn-sm" style="color:white;" title="download" onclick="downloadinvoice('+value.Id+','+value.DocNumber+')"  ><i class="fa fa-download"></i></a> <a class="btn btn-success btn-sm" style="color:white;" title="update" onclick="editinvoice('+value.Id+','+value.SyncToken+')" ><i class="fa fa-edit"></i></a> <a class="btn btn-secondary btn-sm" style="color:white;" title="void" onclick="voidinvoice('+value.Id+','+value.SyncToken+')"><i class="fa fa-eraser"></i></a> <a class="btn btn-danger btn-sm" style="color:white;" title="delete" onclick="deleteinvoice('+value.Id+','+value.SyncToken+')"><i class="fa fa-trash-alt"></i></a>';
							    }  
	
						tabledocse1.row.add([
			  			'' + value.Id	+ '',
			  			'' + value.CustomerRef.name	+ '',
			  			'' + product+ '',
			  			'' + value.DocNumber+ '',
			  			'' + value.TotalAmt+ '',
			  			'' + value.Balance+ '',
			  			'' + value.DueDate	+ '',
			  			'' + status1	+ '',
			            '' + action + '' ]).draw();
					  });
				}
		 }),$.ajax({
				type : "GET",
				asyn : false,
				contentType : "application/text",
				url : "getallcustomers",
				success : function(response) {
				$('#customerid').empty(); 
					  const obj = JSON.parse(response);
						$('#customerid').append($('<option/>').attr("value", '').text("Select Customer"));
					    $.each(obj.IntuitResponse.QueryResponse.Customer, function (index, value) {  
						$('#customerid').append($('<option/>').attr("value",value. Id).text(value.DisplayName));
					 });
				}
			});
		 
			/* $.ajax({
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
		 }) */
	 } 
	  function downloadinvoice(invoiceid,invoiceno){

		 	$.ajax({
				type : "GET",
				asyn : false,
				contentType : "application/pdf", // NOT dataType!
				url : "getinvoicepdf",
				data : {
					invoiceid : invoiceid,
					invoiceno : invoiceno
				},
				success : function(response) {
					if(response!=""){
						window.location.href="downloadinvoices?filename=Invoice_"+invoiceno+"_from_Tekskills_Inc.pdf";
						 Swal.fire({
							  position: 'top',
							  icon: 'success',
							  width:'500px',
							  title: 'Invoice downloaded',
							  showConfirmButton: false,
							  timer: 1250
							});
					}
				}
			}); 
				 }
	  
	  function deleteinvoice(invoiceid,synctoken){
		  
		  Swal.fire({
			  position: 'top',
			  width:'800px',
			  height:'900px', 
			  title: 'Are you sure you want to delete this transaction?',
			  showCancelButton: true,
			  showConfirmButton: true,
			}).then((result) => {
				  if (result.isConfirmed) {
					  $.ajax({
							type : "GET",
							asyn : false,
							contentType : "application/text", // NOT dataType!
							url : "deleteinvoice",
							data : {
								invoiceid : invoiceid,
								synctoken : synctoken
							},
							success : function(response) {
								if(response!=""){
									 Swal.fire({
										  position: 'top',
										  icon: 'success',
										  width:'500px',
										  title: 'Invoice Deleted',
										  showConfirmButton: false,
										  timer: 1250
										}).then((result) => {
											location.reload();
										});
								}
							}
						}); 
                  } 
			});
				 }
	  
	    function invbycustomers(){
	    	var custid=$('#customerid').val()
	    	if(custid!=""){
	    		 $('#allinvoicediv').hide();
	    		 $('#allinvoicebycust').hide();
	    		$.ajax({
					type : "GET",
					asyn : false,
					contentType : "application/text",// NOT dataType!
					url : "getallInvoiceIdsbyCustomer",
					data : {
						custid : custid,
					},
					success : function(response) {
						 const obj1 = JSON.parse(response);
						 const obj2 = obj1.IntuitResponse.QueryResponse;
				
                        if(obj2.hasOwnProperty('Invoice')){
						
						var obj3=obj2.Invoice
							 $('#custname').text($("#customerid option:selected").text())
							 $('#loadid').hide();
							 $('#allinvoicebycust').show();
							 
							  const obj = JSON.parse(response);
								$('#allinvoicetable1').dataTable().fnClearTable();
					  			if (tabledocse2)tabledocse2.clear();
					  			
					  			var maxresults=obj1.IntuitResponse.QueryResponse.maxResults;
					  			if(maxresults==1){
									     var product=obj3.Line[0].SalesItemLineDetail.ItemRef.name;
									     var status=obj3.EmailStatus;
										    var status1="";
										    var action="";

										    if(status=='NotSet'){
										    	status1="Saved";
										    }else{
										    	status1="<h5 style='color:green;'><b>Mail Sent</b></h5>";
										    }
										    
										    var pnote="";
											   if(obj3.hasOwnProperty('PrivateNote')){
												    pnote=obj3.PrivateNote;
												   if(pnote.includes("Voided")){
													   action='<a class="btn btn-primary btn-sm" style="color:white;" title="download" onclick="downloadinvoice('+obj3.Id+','+obj3.DocNumber+')"  ><i class="fa fa-download"></i></a> <a class="btn btn-danger btn-sm" style="color:white;" title="delete" onclick="deleteinvoice('+obj3.Id+','+obj3.SyncToken+')"><i class="fa fa-trash-alt"></i></a>';
														   }else{
													   action='<a class="btn btn-primary btn-sm" style="color:white;" title="download" onclick="downloadinvoice('+obj3.Id+','+obj3.DocNumber+')"  ><i class="fa fa-download"></i></a> <a class="btn btn-success btn-sm" style="color:white;" title="update" onclick="editinvoice('+obj3.Id+','+obj3.SyncToken+')" ><i class="fa fa-edit"></i></a> <a class="btn btn-secondary btn-sm" style="color:white;" title="void" onclick="voidinvoice('+obj3.Id+','+obj3.SyncToken+')"><i class="fa fa-eraser"></i></a> <a class="btn btn-danger btn-sm" style="color:white;" title="delete" onclick="deleteinvoice('+obj3.Id+','+obj3.SyncToken+')"><i class="fa fa-trash-alt"></i></a>';
														     }
											    } else{
											    	action='<a class="btn btn-primary btn-sm" style="color:white;" title="download" onclick="downloadinvoice('+obj3.Id+','+obj3.DocNumber+')"  ><i class="fa fa-download"></i></a> <a class="btn btn-success btn-sm" style="color:white;" title="update" onclick="editinvoice('+obj3.Id+','+obj3.SyncToken+')" ><i class="fa fa-edit"></i></a> <a class="btn btn-secondary btn-sm" style="color:white;" title="void" onclick="voidinvoice('+obj3.Id+','+obj3.SyncToken+')"><i class="fa fa-eraser"></i></a> <a class="btn btn-danger btn-sm" style="color:white;" title="delete" onclick="deleteinvoice('+obj3.Id+','+obj3.SyncToken+')"><i class="fa fa-trash-alt"></i></a>';
													  }  
			
										    
					  				 $('#invcust').empty();
								    var tr="<tr><td>" +obj3.Id+"</td>"
					           			tr=  tr+"<td>"+obj3.CustomerRef.name+"</td>"
					           			tr=  tr+"<td>"+product+"</td>"
					       	   			tr=  tr+"<td>"+obj3.DocNumber+"</td>"
					       	   		    tr=  tr+"<td>"+obj3.TotalAmt+"</td>"
					       	   		    tr=  tr+"<td>"+obj3.Balance+"</td>"
					       	   	        tr=  tr+"<td>"+obj3.DueDate+"</td>"
					       	            tr=  tr+"<td>"+status1+"</td>"
					       	   		    tr=  tr+"<td>"+action+"</td></tr>";
					       				$('#invcust').append(tr); 
					  			}else{
					  				 $.each(obj.IntuitResponse.QueryResponse.Invoice, function (index, value){ 
										    var product=" ";
										    product=value.Line[0].SalesItemLineDetail.ItemRef.name;
										    	
										    var amt=" ";
										    amt=value.TotalAmt;
										    
										    var status=value.EmailStatus;
										    var status1="";
										    var action="";

										    if(status=='NotSet'){
										    	status1="Saved";
										    }else{
										    	status1="<h5 style='color:green;'><b>Mail Sent</b></h5>";
										    }

										    var pnote="";
											   if(value.hasOwnProperty('PrivateNote')){
												    pnote=value.PrivateNote;
												   if(pnote.includes("Voided")){
													   action='<a class="btn btn-primary btn-sm" style="color:white;" title="download" onclick="downloadinvoice('+value.Id+','+value.DocNumber+')"  ><i class="fa fa-download"></i></a> <a class="btn btn-danger btn-sm" style="color:white;" title="delete" onclick="deleteinvoice('+value.Id+','+value.SyncToken+')"><i class="fa fa-trash-alt"></i></a>';
												   }else{
													   action='<a class="btn btn-primary btn-sm" style="color:white;" title="download" onclick="downloadinvoice('+value.Id+','+value.DocNumber+')"  ><i class="fa fa-download"></i></a> <a class="btn btn-success btn-sm" style="color:white;" title="update" onclick="editinvoice('+value.Id+','+value.SyncToken+')" ><i class="fa fa-edit"></i></a> <a class="btn btn-secondary btn-sm" style="color:white;" title="void" onclick="voidinvoice('+value.Id+','+value.SyncToken+')"><i class="fa fa-eraser"></i></a> <a class="btn btn-danger btn-sm" style="color:white;" title="delete" onclick="deleteinvoice('+value.Id+','+value.SyncToken+')"><i class="fa fa-trash-alt"></i></a>';
												   }
											    } else{
											    	action='<a class="btn btn-primary btn-sm" style="color:white;" title="download" onclick="downloadinvoice('+value.Id+','+value.DocNumber+')"  ><i class="fa fa-download"></i></a> <a class="btn btn-success btn-sm" style="color:white;" title="update" onclick="editinvoice('+value.Id+','+value.SyncToken+')" ><i class="fa fa-edit"></i></a> <a class="btn btn-secondary btn-sm" style="color:white;" title="void" onclick="voidinvoice('+value.Id+','+value.SyncToken+')"><i class="fa fa-eraser"></i></a> <a class="btn btn-danger btn-sm" style="color:white;" title="delete" onclick="deleteinvoice('+value.Id+','+value.SyncToken+')"><i class="fa fa-trash-alt"></i></a>';
											    }  
										    
										tabledocse2.row.add([
							  			'' + value.Id	+ '',
							  			'' + value.CustomerRef.name	+ '',
							  			'' + product+ '',
							  			'' + value.DocNumber+ '',
							  			'' + value.TotalAmt+ '',
							  			'' + value.Balance+ '',
							  			'' + value.DueDate	+ '',
							  			'' + status1	+ '',
							            '' + action + '' ]).draw();
									  });
					  			}
						}else{
							 Swal.fire({
	       						  position: 'top',
	       						  icon: 'warning',
	       						  width:'500px',
	       						  title: 'No Invoice found',
	       						  showConfirmButton: false,
	       						  timer: 1250
	       						}).then((result) => {
									location.reload();
								});
						}
					}
				});
	    	}else{
	    		$('#customerid').select2('open');
	    	}
	  } 
	   
	  function voidinvoice(invoiceid,synctoken){
		  
		  Swal.fire({
			  position: 'top',
			  width:'800px',
			  height:'900px', 
			  title: 'Are you sure you want to void this transaction?',
			  showCancelButton: true,
			  showConfirmButton: true,
			}).then((result) => {
				  if (result.isConfirmed){
						$.ajax({
							type : "GET",
							asyn : false,
							contentType : "application/text", // NOT dataType!
							url : "voidinvoice",
							data : {
								invoiceid : invoiceid,
								synctoken : synctoken
							},
							success : function(response){
								if(response!=""){
									 Swal.fire({
										  position: 'top',
										  icon: 'success',
										  width:'500px',
										  title: 'Invoice voided',
										  showConfirmButton: false,
										  timer: 1250
										}).then((result) => {
											location.reload();
										});
							  }
							}
						});
          } 
			});
				 }
	  
	  function editinvoice(invoiceid,synctoken){
		  
		  window.location.href="updateinvoicepage?invoiceid="+invoiceid+"";
		  
		  
		  //window.open("updateinvoicepage?invoiceid=" + invoiceid );
	  }

	</script>
</body>
</html>

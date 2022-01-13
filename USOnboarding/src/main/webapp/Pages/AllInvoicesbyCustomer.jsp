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
	<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
          <div class="row" >
					<div class="col">
					<input type="hidden" id="customerid">
						<div class="card" style="background-color:#e0f3f5;border-radius:25px;height:158px;width:1300px;margin-top:3px;margin-left:-4px;border: 5px solid #205081;"><br><h3>&nbsp;&nbsp;&nbsp;&nbsp;<span  id="custname"></span></h3><br>
						<h4>&nbsp;<i class="menu-icon fa fa-home"></i>&nbsp;&nbsp;<span  id="custaddrs"></span></h4><br>
						<h4>&nbsp;<i class="fa fa-envelope"></i>&nbsp;&nbsp;<span id="custmails"></span></h4>
						</div>
						</div>
						</div>
			   <center>
					<img id="loadid" src="resources/images/loader.gif">
			   </center>

				<div id="allinvoicebycust">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header"><b><span id="custname1" ></span>&nbsp;Invoices</b></h5>
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
	
 	
	 var tabledocse2 = $('#allinvoicetable').DataTable({
			"order" : [ [ 0, "asc" ] ],
			lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
			bLengthChange : true,
			paging : true
	 });

	 $('#loadid').hide();
	 $('#allinvoicebycust').hide();
	  window.onload=function(){
		  
		  const custdetails = ${custdetails};
		  
		  const obj=custdetails.IntuitResponse.Customer.BillAddr;
		  const obj1=custdetails.IntuitResponse.Customer;
		  
		  var custid=custdetails.IntuitResponse.Customer.Id;
		  var customerName=custdetails.IntuitResponse.Customer.DisplayName;
		  
		  $('#customerid').val(custid);
		    
		    var line1="";
		    if(obj.hasOwnProperty('Line1')){
		   	 line1=obj1.BillAddr.Line1+",";
		   	  if(line1==undefined || line1==""){
		   		  line1="";
		   	  }
		     }else{
		   	  line1="";
		     }
		    
		    var city="";
		    if(obj.hasOwnProperty('City')){
		   	 city=obj1.BillAddr.City+",";
		   	  if(city==undefined || city==""){
		   		  city="";
		   	  }
		     }else{
		   	  city="";
		     }
		    
		    var state="";
		    if(obj.hasOwnProperty('CountrySubDivisionCode')){
		   	 state=obj1.BillAddr.CountrySubDivisionCode+",";
		   	  if(state==undefined || state==""){
		   		  state="";
		   	  }
		     }else{
		   	  state="";
		     }
		    
		    var country="";
		    if(obj.hasOwnProperty('Country')){
		   	 country=obj1.BillAddr.Country+",";
		   	  if(country==undefined || country==""){
		   		  country="";
		   	  }
		     }else{
		   	  country="";
		     }
		    
		    var postalcode="";
		    if(obj.hasOwnProperty('PostalCode')){
		   	 postalcode=obj1.BillAddr.PostalCode;
		   	  if(postalcode==undefined || postalcode==""){
		   		  postalcode="";
		   	  }
		     }else{
		   	  postalcode="";
		     }

		    var emailAddr="";
		    if(obj1.hasOwnProperty('PrimaryEmailAddr')){
		    	emailAddr=obj1.PrimaryEmailAddr.Address;
 		    }else{
 		    	emailAddr="";
 		    }
		    
		    var billAddrs= line1+" "+city+" "+state+" "+country+" "+postalcode;
		    
			$('#custname').text(customerName);
			$('#custname1').text(customerName);
		    $('#custaddrs').text(billAddrs);
		    $('#custmails').text(emailAddr);
		    invbycustomers();
		
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
	    		$('#loadid').show();
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
							 $('#loadid').hide();
							 $('#allinvoicebycust').show();
							 
							  const obj = JSON.parse(response);
								$('#allinvoicetable').dataTable().fnClearTable();
					  			if (tabledocse2)tabledocse2.clear();
					  			 $('#loadid').hide();
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
							$('#loadid').hide();
							 Swal.fire({
	       						  position: 'top',
	       						  icon: 'warning',
	       						  width:'500px',
	       						  title: 'No Invoice found',
	       						  showConfirmButton: false,
	       						  timer: 1550
	       						}).then((result) => {
	       							if(response!=""){
	       								history.back();
	       							}
								});
						}
					}
				});
	    	}
	  } 
	   
	  function voidinvoice(invoiceid,synctoken){
		  
		  Swal.fire({
			  position: 'top',
			  width:'800px',
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

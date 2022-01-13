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
/* body {
   filter:blur(5px);
} */
</style>
<body>
	<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
			
				<div class="row" id="disableform">
					<div class="col">
						<div class="card">
							<center><h5 class="card-header"><b>Update Invoice</b></h5></center><br>
				<form action="/" method="post" class="form-horizontal" id="createInvoiceForm" enctype="multipart/form-data">
							<input type="hidden" id="invid" name="invid">
							<input type="hidden" id="invstatus" name="invstatus">
							<input type="hidden" id="synctoken" name="synctoken">
							<input type="hidden" id="custmail1" name="custmail1">
							<input type="hidden" id="fileName" name="fileName" >
							<input type="hidden" id="payment_term_id" name="payment_term_id" >
							<input type="hidden" id="candidate_id" name="candidate_id" >
							</form>
							<input type="hidden" id="qb_customer_id" name="qb_customer_id" >																					
							<input type="hidden" id="qbproductid" name="qbproductid" >
							<input type="hidden" id="tsids" name="tsids" >
							<input type="hidden" id="inv_terms">
							<input type="hidden" id="billable_hours">
							
							<!-- <input type="discounttype" id="discounttype">
							<input type="discountamount" id="discountamount">
							
							<input type="discounttype1" id="discounttype1">
							<input type="discountamount1" id="discountamount1"> -->
							
							<input type="hidden" id="msg1" name="msg1">
							<input type="hidden" id="invdate1" name="invdate1">
							<input type="hidden" id="inv_terms1" name="inv_terms1">
							<input type="hidden" id="discountamt1" name="discountamt1">
							<input type="hidden" id="discountamt2" name="discountamt2">
							<input type="hidden" id="distype1" name="distype1">
							<input type="hidden" id="mailstatus" name="mailstatus">
							<div id="lcaqueInitDiv">
										<div class="row">
										<br><br>
							
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
								<input type="hidden" id="inv_term_id">
									<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;"></Span>Payment Terms</label>
									<div class="col-sm-6">
										<select name="invoiceterm" class="form-control text-left" onchange="" 
											id="invoiceterm" required>
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
								<input type="hidden" id="fromdate"><input type="hidden" id="todate" >
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
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;"></Span>Quantity (Hrs)</label>
									<div class="col-sm-6">
										<input name="qty" class="form-control text-left" onkeyup="getAmount()"  placeholder="Enter billable hours"
											id="qty" readonly><!-- &nbsp;<button style="color:white;background-color:#25c347;border-color:#25c347;border-radius:10px;" id="billablebtn"><b>Get Time Sheet hours</b></button> -->
									</div>
								</div>
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
										style="margin-top: .5%;">Attachments</label>
									<div class="col-sm-9">
									<a id="attachmentid" style="width:120px;"></a>
									</div>
								</div>
								</div>
								
								<div class="col-md-6 col-sm-12">
								
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;"></Span>Amount ($)</label>
									<div class="col-sm-6">
										<input type="text" name="amount" class="form-control text-left" onchange=""  placeholder="Enter Amount"
											id="amount" readonly>
									</div>
								</div>
									<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;">Discount <!-- &nbsp;&nbsp;<span id="percentspan" style="color:#ff1e07;font-size:14px;"> --></label>
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
								</div> 
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;"></Span>Final Amount ($)</label>
									<div class="col-sm-6">
										<input type="text" name="famount" class="form-control text-left"  placeholder="Enter Discount"
											id="famount" readonly ">
									</div>
								</div>
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

									<br><br>
									<div class="form-group row" >
										</b><button type="button"  style="border-radius:36px;margin-left:-252px;width:120px;font-weight:25px;"
											id="invoicesavebtn" class="btn btn-primary btn-sm"><b>Save</b></button>&nbsp;
											<button type="button"  style="border-radius:36px;width:120px;"
											id="invoicebtn" class="btn btn-success btn-sm"><b>Save and Send</b></button>&nbsp;
											<button type="button"  style="border-radius:36px;width:120px;"  onclick="clrinvoice()"
											id="" class="btn btn-info btn-sm"><b>Clear</b></button>&nbsp;
											<button type="button"  style="border-radius:36px;width:120px;" onclick="history.back()"
											id="" class="btn btn-danger btn-sm"><b>Cancel</b></button>
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
			<script src="resources/js/newjs/bootstrap.min.js"></script>
			<script src="resources/js/newjs/formValidation.min.js"></script>
			<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
			<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
			<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
			<script src="resources/js/newdt/datatables-init.js"></script>
			<script type="text/javascript" src="resources/js/js/select2.min.js"></script>
			<script src="resources/preDefined/goback.js"></script>
			<script>

			 var tabledocse1 = $('#allinvoicetable').DataTable({
		 			"order" : [ [ 0, "asc" ] ],
		 			lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
		 			bLengthChange : true,
		 			paging : true
		 		});
			
		  window.onload=function(){
			  
 const obj = ${jsonString};
 
 var obj1=obj.IntuitResponse.Invoice;
 var invoiceId= obj1.Id;
 var SyncToken= obj1.SyncToken;
 var customer=obj1.CustomerRef.name;
 var customerid=obj1.CustomerRef.content;
 //var mail= obj1.BillEmail.Address;
 //var billAddrs= obj1.BillAddr.Line1+" "+obj1.BillAddr.City +" "+obj1.BillAddr.PostalCode;
 var famt=obj1.TotalAmt
 $('#famount').val(famt);
 
 var obj2=obj1.BillAddr
 var line1="";
 if(obj2.hasOwnProperty('Line1')){
	 line1=obj1.BillAddr.Line1+",";
	  if(line1==undefined || line1==""){
		  line1="";
	  }
  }else{
	  line1="";
  }
 
 var city="";
 if(obj2.hasOwnProperty('City')){
	 city=obj1.BillAddr.City+",";
	  if(city==undefined || city==""){
		  city="";
	  }
  }else{
	  city="";
  }
 
 var state="";
 if(obj2.hasOwnProperty('CountrySubDivisionCode')){
	 state=obj1.BillAddr.CountrySubDivisionCode+",";
	  if(state==undefined || state==""){
		  state="";
	  }
  }else{
	  state="";
  }
 
 var country="";
 if(obj2.hasOwnProperty('Country')){
	 country=obj1.BillAddr.Country+",";
	  if(country==undefined || country==""){
		  country="";
	  }
  }else{
	  country="";
  }
 
 var postalcode="";
 if(obj2.hasOwnProperty('PostalCode')){
	 postalcode=obj1.BillAddr.PostalCode;
	  if(postalcode==undefined || postalcode==""){
		  postalcode="";
	  }
  }else{
	  postalcode="";
  }

 var billAddrs= line1+" "+city+" "+state+" "+country+" "+postalcode;

 var paymentterms=obj1.SalesTermRef.name;
 var paymenttermid=obj1.SalesTermRef.content;
 var productname= obj1.Line[0].SalesItemLineDetail.ItemRef.name;
 var productid= obj1.Line[0].SalesItemLineDetail.ItemRef.content;
 var qty=obj1.Line[0].SalesItemLineDetail.Qty;
 var rate=obj1.Line[0].SalesItemLineDetail.UnitPrice;
 //var amt=obj1.Line[0].Amount;
 var productdesc=obj1.Line[0].Description;
 var mail_status=obj1.EmailStatus;
 
 //var disctype=obj1.Line[2].DiscountLineDetail.PercentBased;

	 var type=obj1.Line[2];
	 var disctype="";
	 
	 if(type!=undefined){
		 if(type.hasOwnProperty('DiscountLineDetail')){
			
			 var disctype= obj1.Line[2].DiscountLineDetail.PercentBased;
			 var val;
			    var dropdown = $("select[name='distype']"); 
			    if(disctype==true){
				 	 val="percentbased";
				 	$('#distype1').val(val);
				 	
				 	var discount=obj1.Line[2].Amount;
				 	var amt=obj1.Line[0].Amount;
				 	
				 	var finalPercent=(discount/amt)*100;
				 	
				 	 $('#discountamt').val(finalPercent);
				 	 $('#discountamt1').val(finalPercent);
				 	 $('#discountamt2').val(finalPercent);
				 	 
				 	/*  $('#percentspan').text('('+finalPercent+"%"+')');
				 	 $('#percentamt').val(finalPercent); */
				 	
					 dropdown.find('option[value="' + val + '"]').attr('selected', true);
				}else if(disctype==false){
					 val="valuebased";
					 $('#distype1').val(val);
					 
					 var discount=obj1.Line[2].Amount;
					 
					 $('#discountamt').val(discount);
				 	 $('#discountamt1').val(discount);
				 	 $('#discountamt2').val(discount);
				 	 
					 dropdown.find('option[value="' + val + '"]').attr('selected', true);
				}
		  }else{
			  disctype="";
		  }
	 }

  $('#mailstatus').val("");
  $('#mailstatus').val(mail_status);
 
 var amt="";
 if(obj1.hasOwnProperty('Id')){
	 amt=obj1.Line[0].Amount;
	  if(amt==undefined || amt==""){
		  amt="";
	  }
  }else{
	  amt="";
  }

/*  var discount="";
 if(obj1.Line[2] === undefined){
	 discount="";
 }else{
	 discount=obj1.Line[2].Amount;
 } */

 var mail="";
 if(obj1.hasOwnProperty('BillEmail')){
	 var mail= obj1.BillEmail.Address;
	  if(mail==undefined || mail==""){
		  mail="";
	  }
  }else{
	  mail="";
  }
 
 var fromdate=obj1.TxnDate;
 var duedate=obj1.DueDate;	 
 var msg=obj1.CustomerMemo;

 /* var invoiceterm=$("select[name='invoiceterm']");
 invoiceterm.find('option[value="'+paymenttermid+'"]').attr('selected', true); */
 
// $('#invoiceterm').append($('<option/>').attr("value",paymenttermid).text(paymentterms));
 $('#invid').val(invoiceId);
 $('#synctoken').val(SyncToken);
 $('#custmail1').val(mail);
 $('#custmail').val(mail);
 $('#customerName').val(customer);
 $('#qb_customer_id').val(customerid);
 $('#productName').val(productname);
 $('#qbproductid').val(productid);
 $('#qty').val(qty);
 $('#productrate').val(rate);
 $('#amount').val(amt);

 $('#invdate').val(fromdate);
 $('#invdate1').val(fromdate);
 
 $('#duedate').val(duedate);
 $('#prod_desc').val(productdesc);
 $('#billaddrs').val(billAddrs);
 $('#inv_terms').val(paymentterms);
 $('#inv_terms1').val(paymentterms);
 
 $('#msg').val(msg);
 $('#msg1').val(msg);
 
 $('#payment_term_id').val(paymenttermid);
 
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
}),$.ajax({
	type : "GET",
	asyn : false,
	contentType : "application/text",
	url : "getallattachables",
	data : {
		invid : invoiceId
	},
	success : function(response) {
	     const obj = JSON.parse(response);
	     var maxresults=obj.IntuitResponse.QueryResponse.maxResults;
	     var gethtml ='';
	     if(maxresults>1){
	    	    $.each(obj.IntuitResponse.QueryResponse.Attachable, function (index, value) {
	   	    	 var filename=value.FileName;
	   	    	 var link=value.TempDownloadUri;
	   	    	 var file ='<a href="'+link+'" style="color:blue"><b>'+filename+'<b></a><br>';
	   			    gethtml += file;	
	   		  }); 
	     }else if(maxresults == 1){
	    	 var filename=obj.IntuitResponse.QueryResponse.Attachable.FileName;
   	    	 var link=obj.IntuitResponse.QueryResponse.Attachable.TempDownloadUri;
   	    	 var file ='<a href="'+link+'" style="color:blue"><b>'+filename+'<b></a><br>';
   			    gethtml += file;
	     }
	     let text =gethtml;
		 document.getElementById("attachmentid").innerHTML = text;
	}
}).done(function() {
	 var inv_term_id=$("#payment_term_id").val();
     var invoiceterm=$("select[name='invoiceterm']");
     invoiceterm.find('option[value="'+inv_term_id+'"]').attr('selected', true);
	 getDueDays();
	  
 /* $.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/text",
		url : "getpaymentterms",
		data : {
			"paytermId" : paymenttermid
		},
		success : function(response) {
			  const obj = JSON.parse(response);
			//  $('#invdueDays').val(obj.IntuitResponse.Term.Name);
			  invoiceterm
			  $('#invTerms').text(obj.IntuitResponse.Term.Name);
		}
	}); */
  });
} 
/* 		  function checkupdate(){
			  var msg1=$('#msg1').val();
			  var invdate1=$('#invdate1').val();
	    	  var terms1=$('#inv_terms1').val();
	    	  var discount1=$('#discountamt1').val();
	    	  
			  var msg=$('#msg').val();
			  var invdate=$('#invdate').val();
	    	  var terms=$('#inv_terms').val();
	    	  var discount=$('#discountamt').val();
 	    
	    	  if((msg!="" && discount!="" && terms!="") && ((msg!=msg1) || (discount!=discount1) || (terms!=terms1)){
	    		  $("#invoicebtn").attr("disabled", false);
	    	  }else{
	    		  $("#invoicebtn").attr("disabled", true);
	    	  }
	    	 
 		  } */
 	
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
		  
		  $('#invoiceterm').on('change', function() {
				if($('#invoiceterm').val()==$('#payment_term_id').val()){
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
						}
				});
		  
		  function getDueDays(){
			  var inv_term_id=$("#payment_term_id").val();
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
		  
		  function clrinvoice(){
			  $('#invoiceterm').val("");
			  $('#discountamt').val("");
			  $('#distype').val("");
			  $('#discountamt1').val("");
			  $('#discountamt2').val("");
			  $('#distype2').val("");
			  $('#invdate').val("");
			  $('#duedate').val("");
			  $('#msg').val("");
			  $('#percentspan').text('');
			  $('#percentamt').val("");
			  $('#tax').val("");
			  $("input[type='checkbox']").attr("checked",false);
		  }
		  
		/*   function cancelinvoice(){
			  var custid=$('#qb_customer_id').val();
			  window.location.href="getcustomerpage?custid="+custid+"";
		  } */
		  
		  $("#invoicebtn").click(function(event) {
			  
			  var msg1=$('#msg1').val();
			  var invdate1=$('#invdate1').val();
	    	  var terms1=$('#inv_terms1').val();
	    	  var discount1=$('#discountamt1').val();
	    	  var invdate1=$('#invdate1').val();
	    	  var msg=$('#msg').val();
			  var invdate=$('#invdate').val();
	    	  var terms=$('#inv_terms').val();
	    	  var discount=$('#discountamt').val();
	    	  var invdate=$('#invdate').val();
	    	  var mailstatus=$('#mailstatus').val();
	    	  
	    	  if(mailstatus=='EmailSent'){
	    		  
		    		if(($('#invdate').val()!="" && $('#duedate').val()!="" && $('#msg').val()!="" && $('#invoiceterm').val()!="" )  && ((msg!=msg1) || (discount!=discount1) || (terms!=terms1) || (invdate!=invdate1)) ){
		    			
		    			 $("#invoicebtn").attr("disabled", true);
			    		 $("#invoicesavebtn").attr("disabled", true);
			    		 $('#invstatus').val("");
			    		 $('#invstatus').val("send");
			    		 
			    		 var invid=$('#invid').val();
			    		 var synctoken=$('#synctoken').val();
			    		 var msg=$('#msg').val();
			    		 var invdate=$('#invdate').val();
			    		 var duedate=$('#duedate').val();
			    		 var payterm_id=$('#invoiceterm').val();
			    		 var mail=$('#custmail').val();
			    		 var invstatus=$('#invstatus').val();
			    		 var discount=$('#discountamt').val();
			    		 var qty=$('#qty').val();
			    		 var productrate=$('#productrate').val();
			    		 var amount=$('#amount').val();
			    		 var productid=$('#qbproductid').val();
			    		 var description=$('#prod_desc').val();
			    		 var discount_type=$('#distype').val();
			    		 
			    		 var custid=$('#qb_customer_id').val();
		        		 $.ajax({
		        				type : "POST",
		        				asyn : false,
		        				url : "updateinvoice",
		        				data : {
		        					"invid" : invid,
		        					"synctoken" : synctoken,
		        					"msg" : msg,
		        					"invdate" : invdate,
		        					"duedate" : duedate,
		        					"payterm_id" : payterm_id,
		        					"mail" : mail,
		        					"invstatus" : invstatus,
		        					"discount" : discount,
		        					"qty" : qty,
		        					"productrate" : productrate,
		        					"amount" : amount,
		        					"productid" : productid,
		        					"description" : description	,
		        					"discount_type" : discount_type
		        					},
		        				success : function(response) {
		        					 Swal.fire({
		       						  position: 'top',
		       						  icon: 'success',
		       						  width:'500px',
		       						  title: 'Invoice Sent Successfully',
		       						  showConfirmButton: false,
		       						  timer: 1250
		       						}).then((result) => {
		       							if(response!=""){
		       								window.location.href="getcustomerpage?custid="+custid+"";	
		       							}
									});
		        				}
		        		 });
		    		 }else{
		    			 Swal.fire({
	  						  position: 'top',
	  						  icon: 'info',
	  						  width:'800px',
	  						  title: 'Please update atleast one field',
	  						  showConfirmButton: false,
	  						  timer: 1500
	  						}).then((result) => {
	  							
	  							if($('#msg').val()!=""){}
	  			 				else{$('#msg').focus(); }
	  			 				
	  			 				if($('#duedate').val()!=""){}
	  			 				else{$('#duedate').focus(); }
	  			 				
	  			 				if($('#invdate').val()!=""){}
	  			 				else{$('#invdate').focus(); }
	  			 				
	  			 				if($('#invoiceterm').val()!=""){}
	  			 				else{$('#invoiceterm').focus(); }
							});
		    		 }
	    	  }else{
	    		  
	    		  if(($('#invdate').val()!="" && $('#duedate').val()!="" && $('#msg').val()!="" && $('#invoiceterm').val()!="" )){
		    			
		    			 $("#invoicebtn").attr("disabled", true);
			    		 $("#invoicesavebtn").attr("disabled", true);
			    		 $('#invstatus').val("");
			    		 $('#invstatus').val("send");
			    		 
			    		 var invid=$('#invid').val();
			    		 var synctoken=$('#synctoken').val();
			    		 var msg=$('#msg').val();
			    		 var invdate=$('#invdate').val();
			    		 var duedate=$('#duedate').val();
			    		 var payterm_id=$('#invoiceterm').val();
			    		 var mail=$('#custmail').val();
			    		 var invstatus=$('#invstatus').val();
			    		 var discount=$('#discountamt').val();
			    		 var qty=$('#qty').val();
			    		 var productrate=$('#productrate').val();
			    		 var amount=$('#amount').val();
			    		 var productid=$('#qbproductid').val();
			    		 var description=$('#prod_desc').val();
			    		 var discount_type=$('#distype').val();
			    		 var custid=$('#qb_customer_id').val();
		        		 $.ajax({
		        				type : "POST",
		        				asyn : false,
		        				url : "updateinvoice",
		        				data : {
		        					"invid" : invid,
		        					"synctoken" : synctoken,
		        					"msg" : msg,
		        					"invdate" : invdate,
		        					"duedate" : duedate,
		        					"payterm_id" : payterm_id,
		        					"mail" : mail,
		        					"invstatus" : invstatus,
		        					"discount" : discount,
		        					"qty" : qty,
		        					"productrate" : productrate,
		        					"amount" : amount,
		        					"productid" : productid,
		        					"description" : description,
		        					"discount_type" : discount_type
		        					},
		        				success : function(response) {
		        					 Swal.fire({
		       						  position: 'top',
		       						  icon: 'success',
		       						  width:'500px',
		       						  title: 'Invoice Sent Successfully',
		       						  showConfirmButton: false,
		       						  timer: 1250
		       						}).then((result) => {
		       							if(response!=""){
		       								window.location.href="getcustomerpage?custid="+custid+"";	
		       							}
									});
		        				}
		        		 });
		    		 }
	    	  }

	    		 });

		  $("#invoicesavebtn").click(function(event) {

	    		if($('#invdate').val()!="" && $('#duedate').val()!="" && $('#msg').val()!="" && $('#invoiceterm').val()!=""){
	    			
	    			 $("#invoicebtn").attr("disabled", true);
		    		 $("#invoicesavebtn").attr("disabled", true);
		    		 $('#invstatus').val("");
		    		 $('#invstatus').val("save");

		    		 var invid=$('#invid').val();
		    		 var synctoken=$('#synctoken').val();
		    		 var msg=$('#msg').val();
		    		 var invdate=$('#invdate').val();
		    		 var duedate=$('#duedate').val();
		    		 var payterm_id=$('#invoiceterm').val();
		    		 var mail=$('#custmail').val();
		    		 var invstatus=$('#invstatus').val();
		    		 var discount=$('#discountamt').val(); 
		    		 var qty=$('#qty').val();
		    		 var productrate=$('#productrate').val();
		    		 var amount=$('#amount').val();
		    		 var productid=$('#qbproductid').val();
		    		 var description=$('#prod_desc').val();
		    		 var discount_type=$('#distype').val();
		    		 var custid=$('#qb_customer_id').val();
	        		 $.ajax({
	        				type : "POST",
	        				asyn : false,
	        				url : "updateinvoice",
	        				data : {
	        					"invid" : invid,
	        					"synctoken" : synctoken,
	        					"msg" : msg,
	        					"invdate" : invdate,
	        					"duedate" : duedate,
	        					"payterm_id" : payterm_id,
	        					"mail" : mail,
	        					"invstatus" : invstatus,
	        					"discount" : discount,
	        					"qty" : qty,
	        					"productrate" : productrate,
	        					"amount" : amount,
	        					"productid" : productid,
	        					"description" : description,
	        					"discount_type" : discount_type
	        				},
	        				success : function(response) {
	        					 Swal.fire({
	       						  position: 'top',
	       						  icon: 'success',
	       						  width:'500px',
	       						  title: 'Invoice Updated Successfully',
	       						  showConfirmButton: false,
	       						  timer: 1250
	       						}).then((result) => {
	       							if(response!=""){
	       								window.location.href="getcustomerpage?custid="+custid+"";
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

			 function discounttypecheck(){
				  $('#discountamt').val("");
	 			  var discounttype=$('#distype').val();
	 			  var discounttype1=$('#distype1').val();
	 			  
	 			  if($("#invoicebtn,#invoicesavebtn").attr("disabled", true)){
	 				 $("#invoicebtn").attr("disabled", false);
			    	 $("#invoicesavebtn").attr("disabled", false);
	 			  }
	 			  
	 			  if(discounttype!=""){
	 				 $("#discountamt").prop("readonly", false);
	 			  }else{
	 				 $("#discountamt").prop("readonly", true);  
	 			  }
	 			  
	 			 if(discounttype === discounttype1){
	 				 var currdisc=$('#discountamt2').val();
	 				 $('#discountamt').val(currdisc);
	 			 }
	 			
	 		/* 	 if(discounttype!='percentbased'){
	 				$('#percentspan').text('');
	 			  } else{
	 				if($('#percentamt').val()!=''){
	 				   $('#percentspan').text('('+$('#percentamt').val()+"%"+')');	
	 				}
	 			} */
	 		  }
			 
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

		/*  var inv_term_id=$("#payment_term_id").val();
		if(inv_term_id!=""){
	     var invoiceterm=$("select[name='invoiceterm']");
	     invoiceterm.find('option[value="'+inv_term_id+'"]').attr('selected', true);
		 getDueDays();
		} */
	</script>
</body>
</html>

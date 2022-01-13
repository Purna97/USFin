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
		<form id="form1">
			<!-- Animated -->
			
			<div class="animated fadeIn">
			
				<div class="row" >
					<div class="col">
						<div class="card">
							<h5 class="card-header"><b>Receive Payment</b></h5><br>
										<div class="row">
										<br><br>
								<div class="col-md-10 col-sm-12">
								<input type="hidden" id="custid" name="custid" >
								<input type="hidden" id="max_results" name="max_results" >
								<input type="hidden" id="max_results1" name="max_results1" >
								<!-- <input type="hidden" id="paysum" name="paysum" > -->
								<input type="hidden" id="invidarr" name="invidarr" >
								<input type="hidden" id="payarr" name="payarr" >
								
								<input type="hidden" id="tablelength" name="tablelength" >
								
								<input type="hidden" id="credpayarr" name="credpayarr" >
								<input type="hidden" id="payidarr" name="payidarr" >
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;"></Span>Customer</label>
									<div class="col-sm-5">
										<input type="text" name="custname" class="form-control text-left" onchange=""  placeholder=""
											id="custname" readonly>
									</div>
								</div>
								
								
								
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;">*</Span>Payment Method</label>
									<div class="col-sm-5">
										<select name="paymethod" class="form-control text-left" onchange="checkpaymethod()"
											id="paymethod" required>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;">*</Span>Reference Number</label>
									<div class="col-sm-5">
										<input type="text" name="refno" class="form-control text-left"  placeholder="Enter Reference Number"
											id="refno"  >
									</div>
								</div>
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;"></Span>Deposit To</label>
									<div class="col-sm-5">
										<select name="depositto" class="form-control text-left" 
											id="depositto" required>
									       <option value="">Choose an Account</option>
										   <option value="36">Savings</option>
										   <option value="35">Checking</option>
										   <option value="3">Prepaid Expenses</option>
										   <option value="32">Uncategorized Asset</option>
										   <option value="81">Inventory Asset</option>
										   <option value="4">Undeposited Funds</option>
										</select>
									</div>
								</div>
					
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top: .5%;"><Span style="color: red;">*</Span>Payment Received</label>
									<div class="col-sm-5">
										<input type="text" name="payamt" class="form-control text-left"  placeholder="Enter Payment Received"  
											id="payamt"  >
									</div>
								</div>
 								
								<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 control-label"
										style="margin-top:.5%;"><Span style="color: red;">*</Span>Payment Date</label>
									<div class="col-sm-5">
										<input id="paydate" type="date" autocomplete="off" name="paydate"   placeholder="Enter Payment Date" class="form-control">
									</div>
								</div> 
									</div>
							</div>
							</div>
							
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
							<h5 class="card-header"><b><!-- <span id="custname1" ></span>&nbsp; -->Outstanding Transactions</b></h5>
							<br>
							<table id="allinvoicetable"  
								class="table table-hover table-bordered"
								style="text-align: center;">
								<thead style="background-color: lavender;">
									<tr>
										<th>Invoice Id</th>
										<th>Total Amount</th>
										<th>Open Balance</th>
										<th>Due Date</th> 
										<th>Payment Adjusted</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="invcust">
								</tbody>
							</table>
						</div>
					</div>
					</div>
					<br>
					
					<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header"><b>Credits</b></h5>
							<br>
							<table id="allinvoicetable1"
								class="table table-hover table-bordered"
								style="text-align: center;">
								<thead style="background-color: lavender;">
									<tr>
										<th  style="width:353px;">Description</th>
										<th>Original Amount</th>
										<th>Available Credit</th>
										<th>Payment Adjusted</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="invcust1">
								</tbody>
							</table>
						</div>
					</div>
					</div>
					<br>
									<div class="form-group row" >
										<button type="button"  style="border-radius:36px;width:120px;font-weight:25px;margin-left:570px;"
											id="paybtn" class="btn btn-success btn-sm"><b>Save</b></button>&nbsp;
											
											<button type="button"  style="border-radius:36px;width:120px;font-weight:25px;" 
											id="clrpayment" class="btn btn-info btn-sm"><b>Clear</b></button>&nbsp;
											
											<button type="button"  style="border-radius:36px;width:120px;font-weight:25px;"  onclick="window.location.href='allqbcustomers'"
											id="cancelpayment" class="btn btn-danger btn-sm"><b>Cancel</b></button>
		                               </div>
				</div>
				</form>
</div>
	</div>//
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
					sStripeOdd: '',
					bLengthChange : true,
					paging : true
			 });
			 
			 var tabledocse3 = $('#allinvoicetable1').DataTable({
					"order" : [ [ 0, "asc" ] ],
					lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
					bLengthChange : true,
					paging : true
			 });
			 
			window.onload=function(){
				  
			var custname="${custName}";
			$('#custname1').text(custname);
			var custid=${custId};
			var balance=${balance};

			  $('#custname').val(custname);
			  $('#custid').val(custid);

			  $('#allinvoicebycust').hide();
			  $('#loadid').show();
			$.ajax({
				type : "GET",
				asyn : false,
				contentType : "application/text",
				url : "getallpaymentmethods",
				success : function(response){
					if(response!=""){
						 const obj = JSON.parse(response);
						 $('#paymethod').append($('<option/>').attr("value", '').text("Select Payment Methods"));
						    $.each(obj.IntuitResponse.QueryResponse.PaymentMethod, function (index, value) {
							$('#paymethod').append($('<option/>').attr("value",value.Id).text(value.Name));
						 });
				  }
				}
			}),
			$.ajax({
				type : "GET",
				asyn : false,
				contentType : "application/text",
				url : "getallcredits",
				data : {
					custid : custid,
				},
				success : function(response){
					if(response!=""){
						 const obj1 = JSON.parse(response);
						 const obj2 = obj1.IntuitResponse.QueryResponse;
						 var maxresults=obj1.IntuitResponse.QueryResponse.maxResults;
						 $('#max_results1').val(maxresults);
						 if(obj2.hasOwnProperty('Payment')){
							 var obj3=obj2.Payment
					  			if(obj3.UnappliedAmt > 0 && maxresults == 1){
					  				var num=0;
					                var num1=parseInt(num);
					  				var payreceived='<input type="number" id="payreceived10"   min="1"   class="form-control test" onkeyup="inputcheck1('+num1+')" />';
							        var checkbox='<input type="checkbox" class="test" id="chk1'+index+'" onclick="checkboxvali1('+obj3.Id+','+num1+')" style="width:25px;height:25px;" />';
							        var description= "Unapplied Payment # "+obj3.PaymentRefNum+" ("+obj3.TxnDate+")";
							        
							        tabledocse3.row.add([
						  			'<input type="hidden" id="payid'+num1+'" value='+obj3.Id+' class="form-control" />' + description	+ '',
						  			'' + obj3.TotalAmt	+ '',
						  			'' + obj3.UnappliedAmt	+ '',
						  			'' + payreceived	+ '',
						            '' + checkbox + '' ]).draw();
					  			}else{
					  				 $.each(obj1.IntuitResponse.QueryResponse.Payment, function (index, value){ 
										 if(value.UnappliedAmt > 0){
											var payreceived='<input type="number" id="payreceived1'+index+'"   min="1"   class="form-control test" onkeyup="inputcheck1('+index+')" />';
									        var checkbox='<input type="checkbox" class="test" id="chk1'+index+'" onclick="checkboxvali1('+value.Id+','+index+')" style="width:25px;height:25px;" />';
									        var description= "Unapplied Payment # "+value.PaymentRefNum+" ("+value.TxnDate+")";
									        
									        tabledocse3.row.add([
								  			'<input type="hidden" id="payid'+index+'" value='+value.Id+' class="form-control" />' + description	+ '',
								  			'' + value.TotalAmt	+ '',
								  			'' + value.UnappliedAmt	+ '',
								  			'' + payreceived	+ '',
								            '' + checkbox + '' ]).draw();
									 }
						  				});
					  			}
						 }
	
								  }
				  }
		    }),
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
						 $('#invcust').empty();
							 $('#allinvoicebycust').show();
							  const obj = JSON.parse(response);
								$('#allinvoicetable').dataTable().fnClearTable();
					  			if (tabledocse2)tabledocse2.clear();
					  			 $('#loadid').hide();
					  			$('#max_results').val("");
					  			var maxresults=obj1.IntuitResponse.QueryResponse.maxResults;
					  			$('#max_results').val(maxresults);
					  			var sum=0;
					  			$('#tablelength').val("");
					  		
					  			if(obj3.Balance>0 && maxresults == 1){
				                    var num=0;
				                    var num1=parseInt(num);
				       				var payreceived='<input type="number" id="payreceived0" min="1"  class="form-control" onkeyup="inputcheck('+num1+')" />';
							        var checkbox='<input type="checkbox" id="chk0" onclick="checkboxvali('+obj3.Id+','+num1+')" style="width:25px;height:25px;" />';
					
				  				 $('#invcust').empty();
				  				 
							   var tr="<tr class='test'><td>" +obj3.DocNumber+"</td>"
				           			tr=  tr+"<td><input type='hidden' id='invid0' value='"+obj3.Id+"' class='form-control' />"+obj3.TotalAmt+"</td>"
				           			tr=  tr+"<td>"+obj3.Balance+"</td>"
				           			tr=  tr+"<td>"+obj3.DueDate+"</td>"
				           			tr=  tr+"<td>"+payreceived+"</td>"
				       	   		    tr=  tr+"<td>"+checkbox+"</td></tr>";
				       				$('#invcust').append(tr); 
				       				$('#tablelength').val(1);
				  			}else if(maxresults > 1){
					  				 $.each(obj.IntuitResponse.QueryResponse.Invoice, function (index, value){ 
					  				if(value.Balance>0){
					  					sum=sum+1;
					  					var payreceived='<input type="number" id="payreceived'+index+'"   min="1"   class="form-control test" onkeyup="inputcheck('+index+')" />';
								        var checkbox='<input type="checkbox" id="chk'+index+'" onclick="checkboxvali('+value.Id+','+index+')" style="width:25px;height:25px;" />';
										
								        tabledocse2.row.add([
							  			'<input type="hidden" id="invid'+index+'" value='+value.Id+' class="form-control" />' + value.DocNumber	+ '',
							  			'' + value.TotalAmt	+ '',
							  			'' + value.Balance	+ '',
							  			'' + value.DueDate	+ '',
							  			'' + payreceived	+ '',
							            '' + checkbox + '' ]).draw();
					  				}
									  });
					  				$('#tablelength').val(sum);
					  				 
				  			}else{
				  				Swal.fire({
		       						  position: 'top',
		       						  icon: 'warning',
		       						  width:'500px',
		       						  title: 'No Pending Payments found',
		       						  showConfirmButton: false,
		       						  timer: 1550
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
				}).done(function() {
			          if($('#tablelength').val() == 0){
			        	    $(".test").attr("disabled", true);
				    		$("#form1 :input").attr("disabled", true);
				    		$("#cancelpayment").attr("disabled", false);
			         } 
			      });
			  } 
			  
			$("#depositto").attr("disabled", true);
			function checkpaymethod(){
				if($('#paymethod').val()=='1' || $('#paymethod').val()=='2'){
					$("#depositto").attr("disabled", false);
				}else{
					$("#depositto").attr("disabled", true);
				}
			} 
			
			 $("#paybtn").click(function(event) {
				 		$('#form1').formValidation('validate');
						if (!$('#form1').data('formValidation').isValid()) {

						} else {
					  $('#payarr,#invidarr,#credpayarr,#payidarr').val("");
					    var invs = [];
					    var pays=[];
			            for(var i=0;i<=$('#max_results').val();i++){
			            	if($('#chk'+i).is(':checked')) {
			            	var payment=$("#payreceived"+i).val();
			            	var invoiceid=$("#invid"+i).val();
			            	
			            	if(payment!="" && invoiceid!=""){
			            		invs.push(invoiceid);
				            	pays.push(payment);
			            	}
			              }
			            }
			            $('#invidarr').val(invs);
					    $('#payarr').val(pays);

					    var cred=[];
					    var paysid=[];
			            for(var i=0;i<=$('#max_results1').val();i++){
			            if($('#chk1'+i).is(':checked')) {
			            	var credpay=$("#payreceived1"+i).val();
			            	var paymentid=$("#payid"+i).val();
			            	
			            	if(credpay!="" && paymentid!=""){
			            		cred.push(credpay);
			            		paysid.push(paymentid);
			            	}
			              }
			            }
			            $('#credpayarr').val(cred);
					    $('#payidarr').val(paysid);
					    
					    //alert(cred+"-"+paysid)

					 $("#paybtn").attr("disabled", true);
					 $("#clrpayment").attr("disabled", true);
					 $("#cancelpayment").attr("disabled", true);
					 
		    		 var paymethod=$('#paymethod').val();
		    		 var refno=$('#refno').val();
		    		 var custid=$('#custid').val();
		    		 var payamt=$('#payamt').val();
		    		 var paydate=$('#paydate').val();
		    		 var depositto=$('#depositto').val();
		    		 var invoicesarr=$('#invidarr').val();
		    		 var paymentsarr=$('#payarr').val();
		    		 
		    		 var creditpayarr=$('#credpayarr').val();
		    		 var paymentidarr=$('#payidarr').val();
		    		 
	        		 $.ajax({
	        				type : "POST",
	        				asyn : false,
	        				url : "receivepayment",
	        				data : {
	        					"custid" : custid,
	        					"paymethod" : paymethod,
	        					"refno" : refno,
	        					"payamt" : payamt,
	        					"paydate" : paydate,
	        					"depositto" : depositto,
	        					"invoicesarr" : invoicesarr,
	        					"paymentsarr" : paymentsarr,
	        					"creditpayarr" : creditpayarr,
	        					"paymentidarr" : paymentidarr
	        				},
	        				success : function(response){
	        					if(response == 'success'){
	        						Swal.fire({
	  	       						  position: 'top',
	  	       						  icon: 'success',
	  	       						  width:'500px',
	  	       						  title: 'Payment Saved Successfully',
	  	       						  showConfirmButton: false,
	  	       						  timer: 1350
	  	       						}).then((result) => {
	  	       							if(response!=""){
	  	       								location.reload();
	  	       							}
	  								});
	        					}else{
	        						Swal.fire({
	  	       						  position: 'top',
	  	       						  icon: 'warning',
	  	       						  width:'500px',
	  	       						  title: 'Payment Not Adjusted Correctly',
	  	       						  showConfirmButton: false,
	  	       						  timer: 1550
	  	       						}).then((result) => {
	  	       							if(response!=""){
	  	       								location.reload();
	  	       							}
	  								});
	        					}
	        				}
	        		 });
				  }
			 });

		  	 function checkboxvali(invid,i){
				 var payment=$("#payreceived"+i).val();
				 if(payment==""){
					 $("#payreceived"+i).focus(); 
					 $("#chk"+i).prop('checked', false);
				 }
				 
				 if($("#chk"+i).prop('checked', false)){
					 $("#payreceived"+i).val(""); 
				 }
			 }   
			 
			 function inputcheck(i){
				 if($("#payreceived"+i).val()==""){
					 $("#chk"+i).prop('checked', false);
				 }else{
					 $("#chk"+i).prop('checked', true);
				 }
			 }

			 function checkboxvali1(invid,i){
				 var payment=$("#payreceived1"+i).val();
				 if(payment==""){
					 $("#payreceived1"+i).focus(); 
					 $("#chk1"+i).prop('checked', false);
				 }
				 
				 if($("#chk1"+i).prop('checked', false)){
					 $("#payreceived1"+i).val(""); 
				 }
				 
			 }   
			 
			 function inputcheck1(i){
				 if($("#payreceived1"+i).val()==""){
					 $("#chk1"+i).prop('checked', false);
				 }else{
					 $("#chk1"+i).prop('checked', true);
				 }
			 }
			 
			$("#clrpayment").click(function(event) {

				 $("input[type='checkbox']").attr("checked",false);
				 $("input[type='number']").val("");
				 $('#paymethod').val("");
				 $('#refno').val("");
				 $('#depositto').val("");
				 $('#payamt').val("");
				 $('#paydate').val("");
				 $('.help-block').empty();
			 });
			
			
			$('#form1').formValidation({
				framework : 'bootstrap',
				row : {
					valid : 'field-success',
					invalid : 'field-error'
				},
				fields : {
				 	refno : {
						validators : {
							notEmpty : {
								message : 'Please enter Reference No. '
							},
			             /*    stringLength: {
			                    min: 2,
			                    max: 80,
			                    message: 'Category Name should have minimum 2 and maximum 80 characters. '
			                },
			                regexp: {
			                	regexp: /^[^\s\d\@#$&*()_\/\\<>\[\]-]+([a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+\s)*[a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+$/,
			                	message: 'Category name accepts alphanumerical characters. Spaces are not allowed at beginning or end of the field. Accepts symbols @#$&*()_-\/<>[]'
			                }, */
						}
					},
					payamt : {
						validators : {
							notEmpty : {
								message : 'Please enter Payment Recieved Amount. '
							}
						}
					},
					depositto : {
						validators : {
							notEmpty : {
								message : 'Please select Deposit To. '
							}
						}
					},
					paymethod : {
						validators : {
							notEmpty : {
								message : 'Please select Payment Method. '
							}
						}
					},
					paydate : {
						validators : {
							notEmpty : {
								message : 'Please enter Payment Date. '
							}
						}
					}
					  
							
				}
			});
</script>
</body>
</html>
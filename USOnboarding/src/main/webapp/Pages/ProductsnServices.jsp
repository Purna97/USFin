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
{
	color: red;
}

.swal2-popup {
  font-size: 0.8rem !important;
 }
  
.field-success .control-label, .field-success .help-block,
	.field-success .form-control-feedback {
	color: #3c763d;
}
#lcaqueInitDiv .form-group {
	width: 130%;
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
				<div id="expensediv">
					<div class="col">
						<div class="card">
							<h5 class="card-header">All Products</h5>
							<br>
							<table id="expensetable"
								class="table table-hover table-bordered"
								style="text-align: center;">
								<thead style="background-color: lavender;">
									<tr>
										<th>Product ID</th>
										<th>Product Name</th>
										<th>Type</th>
										<th>UnitPrice</th>
										<th>Category</th>
										<th>Description</th>
										<th>Client Details</th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			
				<div class="modal fade" id="cleintdetailsmodal"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width: 80%"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b>Add Client & Customer Details</b>
								</h5>
							</div>

							<div class="modal-body">
								<form action="/" enctype="multipart/form-data"
									id="addClientDetailsForm" autocomplete="off">
									 <input type="hidden" id="qb_productid"	name="qb_productid">
									  <input type="hidden" id="qb_productName"	name="qb_productName">
									   <input type="hidden" id="qb_productDesc"	name="qb_productDesc">
									<div id="lcaqueInitDiv">
										<div class="row">
										<br>
										<div class="form-group row">
										 <label for="inputPassword" class="col-sm-3 control-label"></label>
										<center><font color=red><strong>Product Name :</strong></font><b>&nbsp;&nbsp;<span id="productNameSpan"></span></b></center>
										</div>
										   <br>
											<div class="col-md-6 col-sm-12">
											   <div class="form-group row">
													<label class="col-sm-3 col-form-label"><span
														style="color: red">*</span>Employee Name</label>
													<div class="col-sm-6">
														<select name="employeeName" autoComplete="off"  style="width:100%;"
															class="form-control text-left" id="employeeName" required>
														</select>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-3 col-form-label"><span
														style="color: red">*</span>Customer Name</label>
													<div class="col-sm-6">
														<select name="customerName" autoComplete="off" style="width:100%;"
															class="form-control text-left" id="customerName" required>
														</select>
													</div>
												</div>
												 <div class="form-group row ">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Customer Address</label>
												<div class="col-sm-6">
													<input id="customer_add" type="text" minlength="2"
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="Customer Address" name="customer_add" class="form-control"  readonly>
												</div>
											</div>
											
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Customer Person Contact No</label>
												<div class="col-sm-6">
													<input id="customer_phne_no" type="text" pattern="\d*" minlength="10" maxlength="13" title="Enter Only Digits"
													autocomplete="off" placeholder="Customer Person Contact No" name="customer_phne_no"  class="form-control"  readonly>
												</div>
											</div>
											
											 <div class="form-group row ">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Customer Manager e-mail ID</label>
												<div class="col-sm-6">
													<input id="customer_mgr_emailid" type="text"  
													title="Enter Valid Email format ex:xyz@gmail.com" 
													autocomplete="off" placeholder="Customer Manager e-Mail ID" name="customer_mgr_emailid" class="form-control"  readonly>
												</div>
											</div>
											<div class="form-group row">
									  <label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Uploded MSA</label>
										<div class="col-sm-8" id="uploadMsa">
										
								    	</div>
									</div>
									<div class="form-group row" id="MsaDates">
									  <label for="inputPassword" class="col-sm-3 control-label"></label>
									<label id="MsaSd">Start Date : <span id="csdate"></span></label>&nbsp&nbsp&nbsp&nbsp<label id="MsaEd">End Date : <span id="cedate"></span></label>
									</div>
									<div class="form-group row" id="upmam"  style="display:none">
									  <label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Management Approved e-mail(Customer)</label>
										<div class="col-sm-8"  id="uploadmam">
								    	</div>
									</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>End Client Name</label>
													<div class="col-sm-6">
														<input id="endClientName" type="text" minlength="2"
															maxlength="100" title="only alphabets are allowed"
															placeholder="End Client Name"
															name="endClientName" class="form-control" required>
													</div>
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span
													style="color: red;"></Span>Invoicing terms</label>
												<div class="col-sm-5">
													<select name="invoice_terms" class="form-control text-left"
														id="invoice_terms">
													</select>
												</div>
											</div>
											<input type="hidden" name="bcurrency" id="bcurrency" value="$">
                                            <div class="form-group row">
                                             	<label for="inputPassword" class="col-sm-3 control-label"><Span
													style="color: red;"></Span>Invoicing Period</label>
												<div class="col-sm-5">
													<select id="invoice_period" class="form-control"
														name="invoice_period">
														<option value="">Select Invoicing Period</option>
														<option value="Weekly">Weekly</option>
														<option value="Bi-Weekly">Bi-Weekly</option>
														<option value="Semi-Monthly">Semi-Monthly</option>
														<option value="Monthly">Monthly</option>
														<option value="Calendar">Calendar</option>
													</select>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span
													style="color: red;"></Span>Bill Rate</label>
												<div class="col-sm-5">
													<input id="bill_rate" type="text"  minlength="2"  maxlength="7"
														  title="Enter Only digits"	autocomplete="off" placeholder="Bill Rate" name="bill_rate" 
														class="form-control" readonly>
												</div><div class="col-md-0" style="line-height: 2.8;">$</div>
											</div>

											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span
													style="color: red;"></Span>Project start date</label>
												<div class="col-sm-5">
													<input type="text" id="pro_startdate" class="form-control text-left"
														pattern="(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}"
														title="Enter date in MM/DD/YYYY format only" name="pro_startdate" onkeydown="return false"
														placeholder="Project start date" class="form-control" autocomplete="off">
												</div>
											</div>

											<div class="form-group row ">
												<label for="inputPassword" class="col-sm-3 control-label"><Span
													style="color: red;"></Span>Project end date</label>
												<div class="col-sm-5">
													<input type="text" id="pro_enddate" class="form-control text-left"
														pattern="(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}"
														title="Enter date in MM/DD/YYYY format only" name="pro_enddate" onkeydown="return false"
														placeholder="Project end date" class="form-control" autocomplete="off">
												</div>
											</div>
											<div class="form-group row">
											<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Timesheet Type</label>
											   <div class="col-sm-5">
											   <select name="payrolltype" class="form-control text-left" id="payrolltype">
										             <option value="">--Select Timesheet Type--</option>
										             <option value="Weekly">Weekly</option>
										             <option value="Bi-Weekly1">Bi-Weekly1</option>
										             <option value="Bi-Weekly2">Bi-Weekly2</option>
										             <option value="Semi-Monthly">Semi-Monthly</option>
										             <option value="Monthly">Monthly</option>
										         </select>
												</div>
										    </div>
										    <div class="form-group row">
											<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Status</label>
											   <div class="col-sm-5">
											   <select name="statustype" class="form-control text-left" id="statustype">
										             <option value="">--Select Status Type--</option>
										             <option value="Active">Active</option>
										             <option value="InActive">InActive</option>
										         </select>
												</div>
										    </div>
											</div>
										</div>
									</div>
									<div class="text-center ml-5" id="init_lcaqbtnUpdateId">
										<button type="button" class="btn btn-info btn-sm"
											id="clientBtnAdd">Save</button>
										<button type="button" class="btn btn-info btn-sm"
											id="btn-colorb" data-dismiss="modal">Cancel</button>	
									</div>
								</form>
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
	<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
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
					url : "getproducts",
					success : function(response) {
						 $('#loadid').hide();
						  $('#expensediv').show();
						  const obj = JSON.parse(response);
							$('#expensetable').dataTable().fnClearTable();
				  			if (tabledocse1)tabledocse1.clear();
				  			
					 	  $.each(obj.IntuitResponse.QueryResponse.Item, function (index, value) { 
					 		  
					 		  var category=" ";
							    if(value.hasOwnProperty('ParentRef')){
							    	category=value.ParentRef.name;
					 		    }else{
					 		    	category="NA";
					 		    }
							    
							    var desc=" ";
							    if(value.hasOwnProperty('Description')){
							    	desc=value.Description;
					 		    }else{
					 		    	desc="NA";
					 		    }
							    var action="";
					 		  if(value!=undefined){
					 			 var productid = value.Id;
					 			 var action="";
						    	 $.ajax({
										type : "GET",
										asyn : false,
										url : "checkqbproduct",
										data : {
											"productid" : productid,
										},
										success : function(response) {
										//	alert(productid+"**"+response);
												if(response=='Not Exist'){
													action='<a class="btn btn-success btn-sm" style="color:white;"  onclick="addClientDetails('+productid+')"><i class="fa fa-plus"></i></a>';
												}else{
													action='<span class="label label-success" style="background-color:grey;color:white;">Added</span>';
												}
											//	$('#actTd'+productid).html(action);
											//	
										}
								    }).done(function() {
					 				tabledocse1.row.add([
							  			'' + value.Id	+ '',
							  			'' + value.Name	+ '',
							  			'' + value.Type	+ '',
							  			'' + value.UnitPrice	+ '',
							  		    '' + category+ '',   
							  			'' + desc+ '',
							  			'' + action+ ''
							              ]).draw();
							 });
					}
				});
			 }
 		    });
		 }  
 	//	 var customer_name=$('#productIdTd'+candidate).html();
	 $("#createpurchasebtn").click(function(event) {
	
		 var producttype = $('#paytype').val();
		 var productname = $('#purchaseamt').val();
		
		
		 $.ajax({
				type : "POST",
				asyn : false,
				url : "createproduct",
				data : {
					"productname" : productname,
					"producttype" : producttype,
				
				},
				success : function(response) {
					 Swal.fire({
						  position: 'top',
						  icon: 'success',
						  width:'500px',
						  height:'900px', 
						  title: 'Product created',
						  showConfirmButton: false,
						  timer: 1250
						});
				}
		 });
		 });
	function addClientDetails(productid){
		$('#bill_rate,#invoice_period,#pro_startdate,#pro_enddate,#endClientName,#qb_productDesc,#qb_productName,#qb_productid').val(''); 
		$('#productNameSpan').text('');
		// productNameSpan employeeName  cusomerName endClientName invoice_terms invoice_period  pro_startdate
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
				  if(obj.IntuitResponse.Item.UnitPrice>0){
				  $('#productNameSpan').text(obj.IntuitResponse.Item.Name);
				  $('#qb_productName').val(obj.IntuitResponse.Item.Name);
				  $('#qb_productid').val(obj.IntuitResponse.Item.Id);
				  $('#bill_rate').val(obj.IntuitResponse.Item.UnitPrice);
				  $('#qb_productDesc').val(obj.IntuitResponse.Item.Description);
				  var temp=obj.IntuitResponse.Item.Name.slice(-8);
				//  alert(temp.slice(4,8));
				  var temp1=temp.slice(0, 2)+"/"+temp.slice(2, 4)+"/"+temp.slice(4, 8);
				  $('#pro_startdate').val(temp1);
				  var minDate=new Date(temp1);
				  $('#pro_enddate').datepicker('setStartDate', minDate);
				  $('#clientBtnAdd').show();
				  }else{
					  alert("Please Add UnitPrice");
					  $('#clientBtnAdd').hide();
				  }
			}
		}),
		$.ajax({
    		type : "GET",
    		asyn : false,
    		contentType : "application/text",
    		url : "getallpaymentterms",
    		success : function(response) {
    		      $('#invoice_terms').empty(); 
    			  const obj = JSON.parse(response);
    				$('#invoice_terms').append($('<option/>').attr("value", '').text("Select Payment Terms"));
    			    $.each(obj.IntuitResponse.QueryResponse.Term, function (index, value) {  
    				$('#invoice_terms').append($('<option/>').attr("value",value.Name).text(value.Name));
    			 });
    		}
    	}),
    	 $.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "application/json", // NOT dataType!
		        url  : "getcustomers",
		        success  : function(response){
		          $('#customerName').empty();
		    	  $('#customerName').append($('<option/>').attr("value", '').text("--Select Customer--"));
		          for(var i=0;i<response.length;i++)
		     	   {
		        		$('#customerName').append($('<option/>').attr("value", response[i].companyId).text(response[i].companyName));
		           }
		        }
		   }),
    	
		 $.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "application/json", // NOT dataType!
		        url  : "getemployees",
		        success  : function(response){
		          $('#employeeName').empty();
		    	  $('#employeeName').append($('<option/>').attr("value", '').text("--Select Employee--"));
		          for(var i=0;i<response.length;i++)
		     	   {
		        		$('#employeeName').append($('<option/>').attr("value", response[i].candidate_id).text(response[i].fullname));
		           }
		        }
		   }).done(function() {
			       $('#employeeName').select2({
		  			placeholder: "Select Employee",
		  		  });
			       $('#customerName').select2({
			  			placeholder: "Select Customer",
			  		  });
			   
			 $('#cleintdetailsmodal').modal('show');
		  });
		/*   $.ajax({
				type : "GET",
				url : "getportalemployees",
				contentType : "application/text",
				success : function(response) {
					 var option = "";var select = "";
					const obj = JSON.parse(response);
					       option += '<option value="">Select Employee</option>';
			               $.each(obj, function (index, value) {
			            	   option += '<option value="'+ obj[index].candidate_id + '">' + obj[index].fullname + '</option>';
			               });
				}
		 }); */
	 }
	
	
	  $("#customerName").change(function() {
		  getsesVal().done(function(data){
				if(data!=""){
	 	 var custid=document.getElementById('customerName').value;
	 	 if(custid==""){
	 	    	//window.location.href="USOBTAddCustomer_C2C.jsp?empno=${empobj.emp_number}";
	 		 }else {
	 			 $.ajax({
	 		    	type : "GET",
	 		        asyn : false,
	 		        contentType: "application/json", // NOT dataType!
	 		        url  :"CustomerDetailsById",
	 		        data:{custid:custid},
	 		        success  : function(response){
	 		            var fname = response.fileName;
			          	var encoded = encodeURIComponent(fname);
			          	var cust = response.custObj;
			          	var cust_address = response.custAddressObj;
			          	var caddress=cust_address.line1+","+cust_address.line2+","+cust_address.city+","+cust_address.state+","+cust_address.zipcode;
			          	$("#customer_name").val(cust.customer_name);
			          	$("#customer_add").val(caddress);
			          	$("#customer_phne_no").val(cust.customer_contact_no);
			          	$("#customer_mgr_emailid").val(cust.mgr_email);
	 		       if(response.fileType=="Manager_Approved_Email_CMSA"){
	 		    	  $( "#uploadmam" ).empty();
	 		    	  $( "#uploadMsa" ).empty();
	 		    	  $( "#uploadMsa" ).append('<a>NA</a>');
	 		    	  $("#upmam").show();
	 		    	 $("#MsaDates").hide();
	 		    	  $( "#uploadmam" ).append('<a href="downloadocs?filetype='+response.fileType+'&filename='+encoded+'&customerName='+cust.customer_name+'" style="color:blue">'+response.fileName+'</a>'); 
	 		       }else {
	 		    	//  &nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewCustomerDocHistory(\''+response.fileId+'\',\''+response.fileType+'\');"><i class="fa fa-history"></i></a>
	 		    		var sdate="";var edate="";
			          	if(response.startdate!=null){
			          		sdate=response.startdate;
			          		$("#MsaSd").show();
			          		$("#csdate").text(sdate);
			          	}else{
			          		$("#MsaSd").hide();
			          		$("#csdate").text('');
			          	}
					if(response.expirydate!=null){
						edate=response.expirydate;
						$("#MsaEd").show();
		          		$("#cedate").text(edate);
			          	}else{
			          		$("#MsaEd").hide();
			          		$("#cedate").text('');
			          	}
	 		    	  $( "#uploadMsa" ).empty();
	 		    	  $( "#uploadmam" ).empty();
	 		    	  $("#upmam").hide();
	 		    //	 <br><label>Start Date : <span>'+sdate+'</span></label>&nbsp&nbsp&nbsp&nbsp<label>End Date : <span>'+edate+'</span></label>
	 		          $("#uploadMsa").append('<a href="downloadocs?filetype='+response.fileType+'&filename='+encoded+'&customerName='+cust.customer_name+'" style="color:blue">'+response.fileName+'</a>');  
	 		         //&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewCustomerDocHistory(\''+response.fileId+'\',\''+response.fileType+'\');"><i class="fa fa-history"></i></a>
	 		       } 
	 		       $("#invoice_terms,#invoice_period,#bill_rate,#pro_startdate,#pro_enddate").attr("required", true);
	 		     $( "#customerDiv" ).show();
	 		   /*  $("#pro_startdate").datepicker({
	  				changeMonth:true,
	  				changeYear:true,
	  			}); */
	 		          }
	 			    });
	 		  }
				}else{
					 window.location.href="loginpage";
				}
			});
	  });
	  $("#clientBtnAdd").click(function(event) {
			getsesVal().done(function(data){
				if(data!=""){
			event.preventDefault();
			$('#addClientDetailsForm').formValidation('validate');
			if (!$('#addClientDetailsForm').data('formValidation').isValid()) {
				//alert("not Valid");
			 } else {
				 $("#clientBtnAdd").attr("disabled", true);
					var form = $('#addClientDetailsForm')[0];
					var data = new FormData(form);
					$.ajax({
						url : "saveclientproductdetails", //this is the submit URL
						type : "POST",
						enctype : 'multipart/form-data',
						data : data,
						processData : false,
						contentType : false,
						cache : false,
						success : function(data) {
							 if(data!=null || data!=""){
								   alert(data);
								   $('#cleintdetailsmodal').modal('hide');
								   $('#addClientDetailsForm').bootstrapValidator('resetForm', true);
								   document.getElementById("addClientDetailsForm").reset();
								   window.location.href="products";
								 /*   $(".collapsibleh1docs").trigger('click'); */
				   	   	         }
				   	   	      else{
				   	   	          window.location.href="loginpage";
				   	   	   	      }
						}
					});
			   }
			}else{window.location.href="loginpage";}});
		});
	  
	  $('#addClientDetailsForm').formValidation({
		    framework: 'bootstrap',
		    row: {
		        valid: 'field-success',
		        invalid: 'field-error'
		    },
		    fields: {	
		    	endClientName: {
		            validators: {
		            	notEmpty: {
		                    message: 'End Client Name is mandatory'
		                },
		                stringLength: {
		                    min: 2,
		                    max: 100,
		                    message: 'End Client Name must be more than 2 and less than 100 characters long'
		                },
		                regexp: {
		                    regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
		                    message: 'End Client Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
		                }
		            }
		        },
		 employeeName:{
			         validators: {
				         	notEmpty: {
				                 message: 'Please select Employee'
				             }
				         }
				     },
		    customerName:{
		         validators: {
		         	notEmpty: {
		                 message: 'Please select Customer'
		             }
		         }
		     },
		  invoice_terms:{
		            validators: {
		            	isEmpty: {
		                    message: 'Invoice Terms is mandatory'
		            	 },
		                 regexp: {
		                	 regexp: /^[a-zA-Z0-9]+( [a-zA-Z0-9]+)*$/,
		                 message: 'Payment Terms accepts alphanumerical and Space allowed but is not at beginning or end of the word'
		                  }
		               }
		           },
		   bill_rate:{
		            validators: {
		               notEmpty: {
		                    message: 'Bill Rate is mandatory'
		            },
		           stringLength: {
		                min: 2,
		                max: 7,
		                message: 'Bill Rate must be 2 digits and less than 7 digits long'
		               },
		            regexp: {
		            	//regexp: /^(?:(?:0|[1-9][0-9]+\.[0-9]{2}))$/,
		            	regexp: /^[1-9][0-9]*([.][0-9]{1,2}|)$/,
		                message: 'Bill Rate accepts digits and max two decimals'
		             }
		           }
		       },
		       invoice_period:{
		           validators: {
		        	   isEmpty: {
		                   message: 'Invoice Period mandatory'
		               }
		           }
		       },
		       pro_startdate:{
		           validators: {
		           	notEmpty: {
		                   message: 'Project Start Date is mandatory'
		               },
		               date: {
		                   format: 'MM/DD/YYYY',
		                   message: 'invalid Date'
		               }
		           }
		       },
		       pro_enddate:{
		           validators: {
		        	   isEmpty: {
		                   message: 'Project End Date is mandatory'
		               },
		               date: {
		                   format: 'MM/DD/YYYY',
		                   message: 'invalid Date'
		               }
		           }
		       },
		       payrolltype:{
		           validators: {
		        	   isEmpty: {
		                   message: 'Please Choose timesheet type'
		               }
		           }
		       },
		       statustype:{
		           validators: {
			           	notEmpty: {
			                   message: 'Please Choose status type'
			               }
			           }
			       }
		    }
		});
	</script>
</body>
</html>

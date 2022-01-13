<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Portal</title>
<link rel="stylesheet" href= "resources/css/css/datepicker3.min.css" />
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

/* .col-sm-2 {
	flex: 0 0 14.666667%;
	max-width: 23.666667%;
} */
</style>
<body class="sidebar-mini fixed">
	<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">Add Customer</h5>
							<div class="card-body">
								<div class="row">
									<div class="col-md-11 col-sm-12">
										<fieldset>
											<form action="/" method="post" id="saveCustomerForm"
												class="form-horizontal" enctype="multipart/form-data">
												<!--  <legend><i class="fa fa-line-chart"></i>Raise NC</legend>  -->
												<h4>
													<b>Customer Details</b>
												</h4>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Customer Name</label>
													<div class="col-sm-4">
														<input id="cust_name" type="text"
															title="only alphabets are allowed" minlength="2"
															maxlength="100" autocomplete="off"
															placeholder="Customer Name" name="cust_name"
															class="form-control" required>
															<span id="custnamespan" style="color:red;"></span>
													</div>
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Federal ID</label>
													<div class="col-sm-4">
														<input type="text" name="fed_id" id="fed_id"
															maxlength="10" placeholder="Federal ID"
															class="form-control">
													</div>
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Customer Person Contact No</label>
													<div class="col-sm-4">
														<input id="cust_phne_no" type="text" minlength="12"
															maxlength="12" title="Enter Only 123-456-7890 format"
															autocomplete="off"
															placeholder="Customer Person Contact No"
															name="cust_phne_no" class="form-control" required>
													</div>
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Customer Manager e-mail ID</label>
													<div class="col-sm-4">
														<input id="cust_mgr_emailid" type="text"
															title="Enter Valid e-mail format ex:xyz@gmail.com"
															minlength="8" maxlength="100" autocomplete="off"
															placeholder="Customer Manager e-mail ID"
															name="cust_mgr_emailid" class="form-control" required>
													</div>
												</div>

												<h4>
													<b>Customer Address</b>
												</h4>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Line1</label>
													<div class="col-sm-4">
														<input id="line1" type="text" minlength="2" maxlength="80"
															autocomplete="off" placeholder="Enter Line1" name="line1"
															class="form-control" required>
													</div>
													<!-- pattern="^[a-zA-Z\s]+$" -->
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Line2</label>
													<div class="col-sm-4">
														<input id="line2" type="text"
															pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*" minlength="2"
															maxlength="80" title="only alpha numerics are allowed"
															placeholder="Enter Line2" autocomplete="off" name="line2"
															class="form-control">
													</div>
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>City</label>
													<div class="col-sm-4">
														<input id="city" type="text" minlength="2" maxlength="25"
															title="only Characters are allowed" autocomplete="off"
															placeholder="City" name="city" class="form-control"
															required>
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>State</label>
													<div class="col-sm-4">
														<input id="state" type="text" minlength="2" maxlength="25"
															title="only Characters are allowed" autocomplete="off"
															placeholder="State" name="state" class="form-control"
															required>
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Country</label>
													<div class="col-sm-4">
														<input id="country" type="text" minlength="2" maxlength="25"
															title="only Characters are allowed" autocomplete="off"
															placeholder="Country" name="country" class="form-control"
															required>
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Zip Code</label>
													<div class="col-sm-4">
														<input id="zipcode" type="text" pattern="[0-9]{5}"
															minlength="5" maxlength="5"
															title="only digits are allowed" autocomplete="off"
															placeholder="Zip Code" name="zipcode"
															class="form-control" required>
													</div>
												</div>

													<input type="hidden" name="payment_terms" id="payment_terms">
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"
														style="margin-top: .5%;"><Span style="color: red;">*</Span>Payment Terms</label>
													<div class="col-sm-4">
														<select name="payment_term_id" class="form-control text-left"
															id="payment_term_id" required>
														</select>
													</div>
												</div>
												
												<div class="form-group row">
													<label for="Customer_MSA" id="Customer_MSA"
														class="col-sm-3 control-label"> <Span id="clab"
														style="color: red;">*</Span>Upload Customer MSA
													</label> <input type="hidden" value="Customer_MSA"
														name="Customer_MSA" />
													<div class="col-sm-2">
														<input type="file" id="Cust_MSA" name="Cust_MSA"
															onchange="msaValidateSize(this)" required>
														<!-- <span id="msafileName" ></span> -->
													</div>
													<div class="col-sm-2">
														<input type="text" id="fromdate"
															class="form-control text-left" autocomplete="off"
															title="Enter date in MM/DD/YYYY format only"
															name="fromdate" placeholder="Start Date"
															class="form-control" onkeydown="return false">
													</div>
													<div class="col-sm-2">
														<input type="text" id="expirydate"
															class="form-control text-left" autocomplete="off"
															title="Enter date in MM/DD/YYYY format only"
															name="expirydate" placeholder="End Date"
															class="form-control" onkeydown="return false">
													</div>
													<div class="col-sm-2">
														<!-- &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp --> Exception : <input
															type="checkbox" id="myCheck" name="myCheck">
													</div>
												</div>
												<!-- <div class="form-group row" id="msafileId" style="display:none;">
										<label class="col-sm-3 control-label"></label><span id="msafileName"  style="width:700px;max-height:500px;color:blue;"></span>
										</div> -->


												<div class="form-group row" id="map" style="display: none;">
													<label for="inputPassword" class="col-sm-3 control-label">
														<Span style="color: red;">*</Span>Management Approval
														e-mail
													</label>
													<div class="col-sm-4">
														<input type="hidden" value="Manager_Approved_Email_CMSA"
															name="Manager_Approved_Email_CMSA" /> <input type="file"
															id="mgr_approved_mail" name="mgr_mail_proof_Cmsa"
															accept=".msg,.eml" onchange="mgrValidateMsgFile(this)"><br>
													</div>
												</div>
												<!-- <div class="form-group row" id="mgrfileId" style="display:none;">
											<label class="col-sm-3 control-label">Selected File :</label><span id="mgrfileName"  style="width:700px;max-height:500px;color:blue;"></span>
											</div> -->
												<div class="text-center ml-3">
													<input type="button" class="btn btn-default" id="submitid"
														style="padding: 7px; background-color: green; color: white; text-transform: INITIAL; line-height: 0.728571;"
														value="Submit" onclick="btnClick()">
													<button type="reset" class="btn btn-default" onClick="window.location.reload()"
														style="padding: 7px; background-color: red; color: white; text-transform: INITIAL; line-height: 0.728571;">Reset</button>
												</div>
											</form>
										</fieldset>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<!-- <div class="content-wrapper" id="listdiv"> -->
				<div class="row">
					<div class="col-md-12">
						<div class="card" id="dataTBL">
							<div class="card-body">
								<div style="text-align: center;"></div>
								<!-- 	<form action="" method="post"> -->
								<div style="max-width: 1150px;">
									<center>
										<span><strong style="font-size: 20px; color: red;">Customer
												Details</strong></span>
									</center>
									<table id="customerTable"
										class="table table-hover table-bordered"
										style="text-align: center;">
										<thead>
											<tr>
												<th style="text-align: center">Name</th>
												<th style="text-align: center">Federal ID</th>
												<th style="text-align: center">Address</th>
												<th style="text-align: center">Person Contact No</th>
												<th style="text-align: center">Manager e-Mail ID</th>
												<th style="text-align: center">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="custl" items="${cutomerList}">
												<tr>
													<td>${custl.companyName}</td>
													<td>${custl.companyfedId}</td>
													<td>${custl.line1},${custl.line2},${custl.city},
														${custl.state},${custl.country}  ${custl.zipcode}</td>
													<td>${custl.company_contactperson}</td>
													<td>${custl.company_mgr_email}</td>
													<td><button
															style="letter-spacing: 1px; background-color: #15aabf; color: white;"
															onclick="editCustomer(${custl.companyId});">
															<i class="fa fa-edit" aria-hidden="true"></i>
														</button></td>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div id="myModal" class="modal"
					style="height: 80px; width: 400px; align-items: center; top: 40%; left: 40%;">
					<div class="modal-content" id="popup-modal"
						style="background: #205081; color: #fff !important;">

						<p id="addsummaryfields" style="color: #fff" class="text-center"></p>
						<button class="close" id="closePopupSave" style="color: #fff">
							<i class="far fa-times-circle"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/js/jquery-2.1.4.min.js"></script>
	<script src="resources/js/newjs/bootstrap.min.js"></script>
	<script src="resources/js/newjs/formValidation.min.js"></script>
	<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
	<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
		<script src="resources/preDefined/goback.js"></script>
	<script type="text/javascript">

/* $('input[type=file]').change(function(e){
	  $in=$(this);
	  $in.next().html($in.val());
	}); */
	
function msaValidateSize(file) {
		   getsesVal().done(function(data){
                      if(data!=""){
  	if($(file).val()!=""){
  		 var FileSize = file.files[0].size/1024/1024;
		 var filename = file.files[0].name;
		 var type = $(file).val().split(".").pop().toLowerCase();
	        if (FileSize > 50) {
	            alert('File size exceeds 50 MB');
	            $(file).val('');
	        } else {
	        	if(type=="pdf" || type=="png" || type=="docx" || type=="doc"|| type=="jpg"|| type=="jpeg" || type=="xlsx" || type=="xls" || type=="pptx" || type=="txt" || type=="tiff"){
	        	$.ajax({
	        		type : "GET",
	 		        asyn : false,
	 		        contentType: "application/json",
					url : "checkSelectedFileName?filename="+filename,
					cache : false,
					async : false,
					success : function(response) {
					  if(response=='Uploaded'){
							alert("This file is already "+response + ". Please check");
							$(file).val('');
						}else{
							    /* $('#msafileId').show();
							    $('#msafileName').text(filename); */
							    $('#btnSubmit').attr('disabled',false);
						}
					},
					error : function() {
					}
				});
	        	}else{
	    	    	 $(file).val('');
	    	    	 alert("Please upload file with docx, doc, png, jpg, jpeg, xls, xlsx, pptx, txt, tiff or pdf file format");
	    		    }
	        }
  	}else{
  		/* $('#msafileName').text('');
  		$('#msafileId').hide(); */
  		$('#btnSubmit').attr('disabled',false);
  	}
	 }else{
         window.location.href="loginpage";
	                }
               })
} 

function mgrValidateMsgFile(file) {
	getsesVal().done(function(data){
        if(data!=""){
	if($(file).val()!=""){
	var FileSize = file.files[0].size/1024/1024;
	 var filename = file.files[0].name;
	 var type = $(file).val().split(".").pop().toLowerCase();
        if (FileSize > 50) {
            alert('File size exceeds 50 MB');
            $(file).val('');
        } else {
        	if(type=="msg" || type=="eml"){
        	$.ajax({
        		type : "GET",
 		        asyn : false,
 		        contentType: "application/json",
 		        url : "checkSelectedFileName?filename="+filename,
				cache : false,
				async : false,
				success : function(response) {
				  if(response=='Uploaded'){
						alert("This file is already "+response + ". Please check");
						$(file).val('');
					}else{
						 	$('#mgrfileId').show();
						    $('#mgrfileName').text(filename);
					}
				},
				error : function() {
				}
			});
        	}else{
    	    	 $(file).val('');
    	    	 alert("Please upload file with .msg or .eml file format");
    		    }
        }
	}else{
  		$('#mgrfileName').text('');
  		$('#mgrfileId').hide();
  		$('#btnSubmit').attr('disabled',false);
  	} 
        }else{
			
            window.location.href="loginpage";

	                }
                  });
}
$("#expirydate").attr("disabled", true); 
var date = new Date();
date.setDate(date.getDate()); 
$("#fromdate").datepicker({
}).on('changeDate', function(selected) {
	 /* var minDate = new Date(selected.date.valueOf());
     $('#expirydate').datepicker('setStartDate', minDate); */
     $("#expirydate").attr("disabled", false);
    $('#saveCustomerForm').formValidation('revalidateField', 'fromdate');
});	
$("#expirydate").datepicker({
}).on('changeDate', function(selected) {
        var minDate = new Date(selected.date.valueOf());
        $('#fromdate').datepicker('setEndDate', minDate);
    $('#saveCustomerForm').formValidation('revalidateField', 'expirydate');
});
$("#fromdate").on('change', function(){
	   var fromdate1=$('#fromdate').val();
	   if(fromdate1!=""){
	     var minDate=new Date(fromdate1);
	     $('#expirydate').datepicker('setStartDate', minDate);
	   }else{
		   $("#expirydate").attr("disabled", true);
		    $('#expirydate').val('').datepicker('update');
	   }
});
$("#expirydate").on('change', function(){
	   var expirydate1=$('#expirydate').val();
	   if(expirydate1!=""){
	     var minDate=new Date(expirydate1);
	     $('#fromdate').datepicker('setEndDate', minDate);
	   }
});
function editCustomer(id){
	getsesVal().done(function(data){
        if(data!=""){
	window.location.href="editCustomer?id="+id+"";
        }else{
            window.location.href="loginpage";
	                }
                  });
}
function btnClick(){
	 getsesVal().done(function(data){
         if(data!=""){
	$('#saveCustomerForm').formValidation('validate');
	if( !$('#saveCustomerForm').data('formValidation').isValid())
		 {
		 }
	else{
		  //document.getElementById("saveCustomerForm").submit();
		       $("#submitid").attr("disabled", true);
				var form = $('#saveCustomerForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "saveCustomerMaster", //this is the submit URL
					type : "POST",
					enctype : 'multipart/form-data',
					data : data,
					processData : false,
					contentType : false,
					cache : false,
					success : function(data) {
						 if(data!=null || data!=""){
							 $('#addsummaryfields').html(data);
			   	         	 $('#myModal').modal('show'); 
							/*  const obj = JSON.parse(data);
	    					 var qbcustomer_id= obj.IntuitResponse.Customer.Id;
	    					 var customer_name= obj.IntuitResponse.Customer.CompanyName;
	    					// var mail = $('#custmail').val();
	    					 $.ajax({
	    			 				type : "POST",
	    			 				asyn : false,
	    			 				url : "updateQBCustomerId",
	    			 				data : {
	    			 					"customer_name" : customer_name,
	    			 					"qbcustomer_id" : qbcustomer_id
	    			 				},
	    			 				success : function(response) {
	    			 				}
	    			 		  }); */
			   	   	         }
			   	   	      else{
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
$("#closePopupSave").click(function(event) {

	   getsesVal().done(function(data){
                  if(data!=""){
	$('#myModal').modal('hide');
	window.location.href="addCustomer";
                  }else{
                      window.location.href="loginpage";
      		                }
      	                  });
});
</script>
	<script type="text/javascript">
$('#saveCustomerForm')
.on('init.field.bv', function(e, data) {
            var field  = data.field,        // Get the field name
                $field = data.element,      // Get the field element
                bv     = data.bv;           // BootstrapValidator instance

            // Create a span element to show valid message
            // and place it right before the field
            var $span = $('<small/>')
                            .addClass('help-block validMessage')
                            .attr('data-field', field)
                            .insertAfter($field)
                            .hide();

            // Retrieve the valid message via getOptions()
            var message = bv.getOptions(field).validMessage;
            if (message) {
                $span.html(message);
            }
})
.formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {	       
    	cust_name: {
            validators: {
            	notEmpty: {
                    message: 'Customer Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Customer Name must be more than 2 and less than 100 characters long. '
                },
                regexp: {
                	 regexp: /^(?!\s\/&.,_-+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &.,_\/-]*)?$/,
                     message: 'Customer Name accepts alphabetical, specical characters like .,_&-/ allowed and Space allowed but is not at beginning or end of the word'
                }
            }
        },  
        fed_id: {
            validators: {
            	 isEmpty: {
                    message: 'Federal ID is mandatory'
                },
                callback:{
                    message: 'Federal ID is not valid',
                    callback: function(value, fed_id, $field){
                        if(value===''){
                            return true;
                         }
                        if(value.length < 10 || value.length > 10){
                            return {
                                valid: false,
                                message: 'Federal ID should be 9 digits.'
                            };
                        }
                        var re= /^([07][1-7]|1[0-6]|2[0-7]|[35][0-9]|[468][0-8]|9[0-589])-\d{7}$/;
                        if(!value.match(re)) {
                            return {
                                valid: false,
                                message: 'Please enter valid Federal ID.'
                            };
                        }
                        return true;
                    }               
                }
            }          
        },
        line1 : {
            validators: {
            	 notEmpty: {
                    message: 'Line1 is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 25,
                    message: 'Line2 should have more than 2 and less than 80 characters '
                },
                regexp: {
                  regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 accepts alpha numerics '
                }
            }
        },
        line2 : {
            validators: {
            	/*  notEmpty: {
                    message: 'Line1 is mandatory'
                }, */
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line2 should have more than 2 and less than 80 characters '
                },
                regexp: {
                  regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 accepts alpha numerics '
                }
            }
        },
        city : {
            validators: {
            	notEmpty: {
                    message: 'City is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'City should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'City accepts characters'
                }
            }
        },
        state : {
            validators: {
            	notEmpty: {
                    message: 'State is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'State should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'State accepts character'
                }
            }
        },
        country : {
            validators: {
            	notEmpty: {
                    message: 'Country is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'Country should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'Country accepts character'
                }
            }
        },
        payment_term_id : {
            validators: {
            	notEmpty: {
                    message: 'Payment terms is mandatory'
                }
            }
        },
        zipcode : {
            validators: {
            	notEmpty: {
                    message: 'Zipcode is mandatory'
                },
                stringLength: {
                    min: 5,
                    max: 5,
                    message: 'Zipcode must be 5 digits'
                },
                regexp: {
                	regexp: /[0-9]/,
                    message: 'Zipcode accepts digits'
                }
            }
        },    
   cust_mgr_emailid:{
            validators: {
            	notEmpty: {
                    message: 'Customer Manager e-mail ID is mandatory'
            	 },
                 stringLength: {
                 min: 8,
                 max: 100,
                 message: 'Customer Manager e-mail must be more than 8 and less than 100 characters long'
                },
                  regexp: {
                  regexp: /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9\-]+\.)+([a-zA-Z0-9\-\.]+)+([,]([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9\-]+\.)+([a-zA-Z0-9\-\.]+))*$/,
                //  regexp: /^(([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)(\s*;\s*|\s*$))*$/,
             	 // regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
             	 message: 'Please enter valid e-mail ID'
             }
           }
      },
   cust_phne_no:{
            validators: {
            	notEmpty: {
                    message: 'Customer Contact Number is mandatory'
            	 },
                 stringLength: {
                 min: 12,
                 max: 12,
                 message: 'Customer Contact Number must be more 10 or Not less than 10 Numbers long'
                }
            }
        },
        Cust_MSA: {
            validators: {
            	notEmpty: {
                    message: 'Customer MSA is mandatory'
                		}/* ,
                	file: {
   					        extension: 'doc,docx,pdf,zip',
                            type: 'application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/zip',
                            maxSize: 50*1024*1024,
         					message: 'The selected file type is not valid or file size greater than 50MB'
                       } */
  			    }
   			},
   		 fromdate: {
	            validators: {
	                regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please enter Start Date in MM/DD/YYYY format'
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'Start Date is not a valid, please enter in MM/DD/YYYY format'
	                }
	            }
	        },
	     expirydate: {
	            validators: {
	                regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please enter End Date in MM/DD/YYYY format'
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'End Date is not a valid, please enter in MM/DD/YYYY format'
	                }
	            }
	        },		
   			mgr_mail_proof_Cmsa: {
            validators: {
            	notEmpty: {
                    message: 'Manager Approved Eamil proof is mandatory'
                		}
  			    }
   			}
        }
})
.on('error.validator.bv', function(e, data) {
            // $(e.target)    --> The field element
            // data.bv        --> The BootstrapValidator instance
            // data.field     --> The field name
            // data.element   --> The field element
            // data.validator --> The current validator name

            data.element
                .data('bv.messages')
                // Hide all the messages
                .find('.help-block[data-bv-for="' + data.field + '"]').hide()
                // Show only message associated with current validator
                .filter('[data-bv-validator="' + data.validator + '"]').show();
 })
 .on('click', '[name="myCheck"]', function(e) {
    var checkBox = document.getElementById("myCheck");
		   if (checkBox.checked == true){
			// alert("**if***"+checkBox.checked);
		   $("#map").show();
		   $("#clab").hide();
		   $("#Cust_MSA").val('');
		   $('#saveCustomerForm').formValidation('enableFieldValidators','Cust_MSA',false);
		   $('#saveCustomerForm').formValidation('enableFieldValidators', 'mgr_mail_proof_Cmsa',true);
		   //document.getElementById('Cust_MSA').disabled=true;
		   $("#Cust_MSA").prop("disabled", true);
       } else if(checkBox.checked == false){
      		// alert("**else**"+checkBox.checked);
           $("#map").hide();
	       $("#clab").show();
	       $("#mgr_approved_mail").val('');
    	   $('#saveCustomerForm').formValidation('enableFieldValidators', 'Cust_MSA',true); 
    	   $('#saveCustomerForm').formValidation('enableFieldValidators','mgr_mail_proof_Cmsa',false);
    	   $("#Cust_MSA").prop("disabled", false);
    	  // document.getElementById('Cust_MSA').disabled=false;
       } 
     });
</script>
	<script type="text/javascript">
$('form').on('reset', function() {
	$('#saveCustomerForm').data('formValidation').resetForm();
	});
$('input[name="cust_phne_no"]').mask('999-999-9999');
$('input[name="fed_id"]').mask('99-9999999');
$("#cust_mgr_emailid").blur(function () {
    $('#saveCustomerForm').bootstrapValidator('revalidateField', 'cust_mgr_emailid');
});
$("#cust_phne_no").blur(function () {
    $('#saveCustomerForm').bootstrapValidator('revalidateField', 'cust_phne_no');
});
$("#fed_id").blur(function () {
    $('#saveCustomerForm').bootstrapValidator('revalidateField', 'fed_id');
});

$("#payment_term_id").change(function() {
	$('#payment_terms').val('');
	var payment_terms=$("#payment_term_id option:selected").text();
	$('#payment_terms').val(payment_terms);
});

window.onload=function(){
	$.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/text",
		url : "getallpaymentterms",
		success : function(response) {
		      $('#payment_term_id').empty(); 
			  const obj = JSON.parse(response);
				$('#payment_term_id').append($('<option/>').attr("value", '').text("Select Payment Terms"));
			    $.each(obj.IntuitResponse.QueryResponse.Term, function (index, value) {  
				$('#payment_term_id').append($('<option/>').attr("value",value.Id).text(value.Name));
			 });
		}
	});
};

var custnameInput = document.getElementById('cust_name');
var  custnametimeout= null;
custnameInput.onkeyup = function (e) {
clearTimeout(custnametimeout);
custnametimeout = setTimeout(function () {
	 var cust_name=$('#cust_name').val();
	 getsesVal().done(function(data){
 		if(data!=""){
	    if(cust_name==""){
	    	 $('#custnamespan').text('');
	    	 $("#submitid").attr("disabled", false);
	    }else{
	    var regex = new RegExp("^(?!\s\/&.,_-+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &.,_\/-]*)?$");
	    if(!regex.test(cust_name)){
	    	  // $('#emailspan').text("Please enter valid number");
	    	   $("#submitid").attr("disabled", true);
	    }else{
	    	 $.ajax({
	    		   	type : "GET",
	    		       asyn : false,
	    		       contentType: "text/plain", // NOT dataType!
	    		       url  : "checkCustomerName?cust_name="+cust_name+"",
	    		       success  : function(response){
	    		    	   if(response=='Exist'){
	    		    		   $('#custnamespan').text("Customer Name already exists");
	    		    		   $("#submitid").attr("disabled", true);
	    		    	   }else{
	    		    		   //$('#emailspan').text("Email id not available");
	    		    		   $('#custnamespan').text('');
	    		    		   $("#submitid").attr("disabled", false);  
	    		    	   }
	    		         }
	    			 });
	         }
	    }
 	 }else{
			 window.location.href="loginpage";
		 }
    });
}, 500);
};
</script>
</body>
</html>
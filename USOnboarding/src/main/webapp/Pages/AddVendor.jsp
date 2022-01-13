<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Portal</title>
<link rel="stylesheet" href="resources/css/css/datepicker3.min.css" />
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
							<h5 class="card-header">Add Vendor</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-md-11 col-sm-12">
									<fieldset>
										<form action="/" method="post" class="form-horizontal" id="saveVendorForm" enctype="multipart/form-data">
										<h4><b>Vendor Details</b></h4>
										
										<!-- <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Vendor Type</label>
												<div class="col-sm-4">
												<select name="vendor_type" class="form-control text-left" id="vendor_type" required>
										             <option value="">--Select Vendor Type--</option>
										             <option value="Primary Vendor">Primary Vendor</option>
										             <option value="Secondary Vendor">Secondary Vendor</option>
										             <option value="Implementation Partner">Implementation Partner</option>
										         </select>
												</div>
											  </div>  -->
	                                           <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Vendor Name</label>
												<div class="col-sm-4">
													<input id="vendor_name" type="text" 
													title="only alphabets are allowed" maxlength="100" 
													autocomplete="off" placeholder="Vendor Name" name="vendor_name" class="form-control"  required>
												</div>
											</div>
																				
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Federal ID</label>
												<div class="col-sm-4">
												<input  type="text" name="fed_id" id="fed_id" maxlength="10"
													 placeholder="Federal ID"  class="form-control">
												</div>
											  </div> 
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Vendor Person Contact No</label>
												<div class="col-sm-4">
													<input id="ven_phne_no" type="text" minlength="12" maxlength="12" title="Enter Only 123-456-7890 format" 
													autocomplete="off" placeholder="Vendor Person Contact No" name="ven_phne_no" class="form-control"  required>
												</div>
											</div>
											
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Vendor Manager e-mail ID</label>
												<div class="col-sm-4">
													<input id="ven_mgr_emailid" type="text"	title="Enter Valid e-mail" maxlength="80" 
													autocomplete="off" placeholder="Vendor Manager e-mail ID" name="ven_mgr_emailid" class="form-control">
												</div>
											</div> 
											
											<h4><b>Vendor Address</b></h4>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-4">
													<input id="line1" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="line1" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-4">
													<input id="line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" placeholder="Enter Line2"
													 autocomplete="off" name="line2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-4">
													<input id="city" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="City" name="city" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-4">
													<input id="state" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="state" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-4">
													<input id="zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" 
													 autocomplete="off" placeholder="Zip Code" name="zipcode" class="form-control"  required>
												</div>
											</div>
											
											<!-- pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$" -->
									<div class="form-group row">
									  <label for="Vendor_MSA" class="col-sm-3 control-label" id="Vendor_MSA">
									  <Span id="vlab" style="color:red;">*</Span>Upload Vendor MSA</label>
									  <input type="hidden" value="Vendor_MSA" name="Vendor_MSA" />
									<div class="col-sm-2">
										<input type="file" id="Ven_MSA" name="Ven_MSA" class="docfiles" onchange="msaValidateSize(this)" required><br>
									</div>
									<div class="col-sm-2" >
										<input type="text" id="msa_fromdate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="msa_fromdate" placeholder="Start Date" class="form-control"> 
									</div>
									<div class="col-sm-2">
										<input type="text" id="msa_expirydate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="msa_expirydate" placeholder="End Date" class="form-control"  >
									</div>
									<div class="col-sm-2">
										<!-- &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp --> Exception: <input type="checkbox" id="myCheck" name="myCheck">
									</div>
									</div>
								
	                                <h4><b>Documents For Business Compliance</b></h4><br>
						    		 <div class="form-group row">
									  <label for="Executed_irs_w9_form" class="col-sm-3 control-label" id="Executed_irs_w9_form">
									  <Span id="vlab1" style="color:red;">*</Span>Executed IRS W-9 Form</label>
										<div class="col-sm-2">
										<input type="hidden" value="Executed_irs_w9_form" name="Executed_irs_w9_form" />
										<input type="file" id="exe_irs_w9_form" name="exe_irs_w9_form" class="docfiles" onchange="irsValidateSize(this)" required><br>
									</div>
										<div class="col-sm-2" >
										<input type="text" id="irs_fromdate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="irs_fromdate" placeholder="Start Date" class="form-control"> 
									</div>
									<div class="col-sm-2">
										<input type="text" id="irs_expirydate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="irs_expirydate" placeholder="End Date" class="form-control"  >
									</div>
									</div>
									
									 <div class="form-group row">
									  <label for="insurance_certificate" class="col-sm-3 control-label" id="insurance_certificate">
									  <Span id="vlab2" style="color:red;">*</Span>Insurance Certificate</label>
										<div class="col-sm-2">
										<input type="hidden" value="insurance_certificate" name="insurance_certificate" />
										<input type="file" id="insu_certi" name="insu_certi" class="docfiles" onchange="icValidateSize(this)" required><br>
									</div> 
									<div class="col-sm-2" >
										<input type="text" id="ic_fromdate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="ic_fromdate" placeholder="Start Date" class="form-control" required> 
									</div>
									<div class="col-sm-2">
										<input type="text" id="ic_expirydate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="ic_expirydate" placeholder="End Date" class="form-control"  required>
									</div>
									</div>
									
									 <div class="form-group row">
									  <label for="certificate_incorporation"  class="col-sm-3 control-label" id="certificate_incorporation">
									  <Span id="vlab3" style="color:red;">*</Span>Certificate Incorporation</label>
										<div class="col-sm-4">
										<input type="hidden" value="certificate_incorporation" name="certificate_incorporation" />
										<input type="file" id="certi_corp" name="certi_corp" class="docfiles" onchange="ciValidateSize(this)" required><br>
									</div>
									</div>
									
									 <div class="form-group row">
									  <label for="standing_certificate" class="col-sm-3 control-label" id="standing_certificate">
									  <Span id="vlab4" style="color:red;">*</Span>Good Standing Certificate</label>
										<div class="col-sm-2">
										<input type="hidden" value="standing_certificate" name="standing_certificate" />
										<input type="file" id="std_cert" name="std_cert" class="docfiles" onchange="gscValidateSize(this)" required><br>
									</div>
										<div class="col-sm-2" >
										<input type="text" id="gsc_fromdate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="gsc_fromdate" placeholder="Start Date" class="form-control"> 
									</div>
									<div class="col-sm-2">
										<input type="text" id="gsc_expirydate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="gsc_expirydate" placeholder="End Date" class="form-control"  >
									</div>
									</div>
									<div class="form-group row" id="map"  style="display:none;">
												<label for="inputPassword"	class="col-sm-3 control-label">
												<Span style="color: red;">*</Span>Management Approval e-mail </label>
												<div class="col-sm-4">
													<input type="hidden" value="Manager_Approved_Email_VMSA" name="Manager_Approved_Email_VMSA" /> 
													<input type="file" id="mgr_mail_proof" name="mgr_mail_proof" accept=".msg,.eml" onchange="ValidateMsgFile(this)"><br>
												</div>
									</div>
											<div class="text-center ml-3">
												<input type="button" class="btn btn-default" id="btnSubmit" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Submit"  onclick="btnClick()">
												<button type="reset" class="btn btn-default" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;" onClick="window.location.reload()">Reset</button> 
											</div>
										</form>
									</fieldset>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	<div class="row">
		<div class="col-md-12">
			<div class="card" id="dataTBL">
				<div class="card-body">
					<div style="text-align: center;">
					</div>
					<!-- 	<form action="" method="post"> -->
					<div style="max-width:1150px;" >
					<center><span><strong style="font-size:20px;color:red;">Vendor Details</strong></span></center>
					<table id="vendorTable" class="table table-hover table-bordered"
						style="text-align: center;">
						<thead>
							<tr>
							  <!--  <th style="text-align: center">Vendor Type</th> -->
								<th style="text-align: center">Name</th>
								<th style="text-align: center">Federal ID</th>
							     <th style="text-align: center">Address</th>
							     <th style="text-align: center">Person Contact No</th>
								<th style="text-align: center">Manager e-Mail ID</th>
								<th style="text-align: center">Action</th>
							</tr>
						</thead>
						<tbody>
					<c:forEach var="venl" items="${vendorList}">
						 	<tr>   
						 		<%-- <td>${venl.vendor_type}</td> --%>
							    <td>${venl.companyName}</td>
							    <td>${venl.companyfedId}</td>
							    <td>${venl.line1}, ${venl.line2}, ${venl.city}, ${venl.state}, ${venl.zipcode}</td>
							    <td>${venl.company_contactperson}</td>
							    <td>${venl.company_mgr_email}</td>							    
								<td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											onclick="editVendor(${venl.companyId});">
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
	<!-- Javascripts-->
 <!-- <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script> -->
<script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script src="resources/preDefined/goback.js"></script>
<script type="text/javascript">
$("#msa_expirydate,#irs_expirydate,#ic_expirydate,#gsc_expirydate").attr("disabled", true); 
function editVendor(id){
	 getsesVal().done(function(data){  
         if(data!=""){
	window.location.href="editVendor?id="+id+"";
         }else{
             window.location.href="loginpage";
		                }
	                  });
}

$("#closePopupSave").click(function(event) {
	 getsesVal().done(function(data){  
         if(data!=""){
	$('#myModal').modal('hide');
	window.location.href="addVendor";
}else{
    window.location.href="loginpage";
            }
          });
});

</script>
<script>
function btnClick(){
	 getsesVal().done(function(data){  
         if(data!=""){
	$('#saveVendorForm').formValidation('validate');
	if( !$('#saveVendorForm').data('formValidation').isValid())
		 {
		 //   alert("Not Valid");
		 }
	else{
			$("#btnSubmit").attr("disabled", true);
			var form = $('#saveVendorForm')[0];
			var data = new FormData(form);
			$.ajax({
				url : "saveVendorMaster", //this is the submit URL
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
</script>
<script type="text/javascript">
$('#saveVendorForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {	       
    	vendor_name: {
            validators: {
            	notEmpty: {
                    message: 'Vendor Name is mandatory'
                },
                stringLength: {   
                    min: 2,
                    max: 100,
                    message: 'Vendor Name must be more than 2 and less than 100 characters long. '
                },
                regexp: {
                	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                     message: 'Vendor Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                }
                
            }
        
        }, 
        vendor_type: {
            validators: {
            	notEmpty: {
                    message: 'Vendor type is mandatory'
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
                        if (value.length < 10 || value.length > 10) {
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
                            }
                        }
                        return true;
                    }               
                }
            }          
        },
              /*   stringLength: {
                    min: 10,
                    max: 10,
                    message: 'Federal ID should be 9 digits'
                },
                regexp: {
                   regexp: /^([07][1-7]|1[0-6]|2[0-7]|[35][0-9]|[468][0-8]|9[0-589])-\d{7}$/,
                   message: 'Please enter valid Federal ID'
                },
            }
        }, */
        line1 : {
            validators: {
            	 notEmpty: {
                    message: 'Line1 is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line1 should have more than 2 and less than 80 characters '
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 accepts alpha numerics '
                },
            }
        },
        
        line2 : {
            validators: {
            	
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line2 should have more than 2 and less than 80 characters '
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line2 accepts alpha numerics '
                },
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
                },
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
                },
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
                },
            }
        },   
       ven_mgr_emailid:{
            validators: {
            	notEmpty: {
                    message: 'Vendor Manager e-mail ID is mandatory'
            	 },
            	 callback:{
                     message: 'e-mail ID is not valid',
                     callback: function(value, ven_mgr_emailid, $field){
                         if(value===''){
                             return true;
                          }
                         // Check the password strength
                         if (value.length < 8) {
                             return {
                                 valid: false,
                                 message: 'Vendor Manager e-mail must be 8 characters long'
                             };
                         }
                         if (value.length > 80) {
                             return {
                                 valid: false,
                                 message: 'Vendor Manager e-mail must be less than 80 characters long'
                             };
                         }
                         var re= /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/;
                         if(!value.match(re)) {
                             return {
                                 valid: false,
                                 message: 'Please enter valid e-mail ID'
                             }
                     }
                         return true;
                     }               
                 }
             }          
         },
              /*    stringLength: {
                 min: 8,
                 max: 80,
                 message: 'Vendor Manager e-mail must be more than 8 and less than 80 characters long'
                },
                  regexp: {
             	regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
                 message: 'Please enter valid e-mail ID'
                }
            }
      }, */
      
   ven_phne_no:{
            validators: {
            	notEmpty: {
                    message: 'Vendor Contact Number is mandatory. '
            	 },
                 stringLength: {
                 min: 12,
                 max: 12,
                 message: 'Vendor Contact Number must be more 10 or Not less than 10 Numbers long'
                }
            }
        },
    Ven_MSA: {
            validators: {
            	notEmpty: {
                    message: 'Vendor MSA is mandatory'
                		}
  			    }
   			},
   	insu_certi: {
             validators: {
             	notEmpty: {
                     message: 'Insurance Certificate is mandatory'
                 		}
   			    }
    		},
    std_cert: {
    	     validators: {
    	            	notEmpty: {
    	                    message: 'Standing Certificate is mandatory'
    	                		}
    	  			    }
    	   		},
    certi_corp: {
    	            validators: {
    	            	notEmpty: {
    	                    message: 'Certificate Incorporation is mandatory'
    	                		}
    	  			    }
    	   			},
    	   	ic_fromdate: {
    	   		enabled: false,
	   	            validators: {
	   	                notEmpty: {
	   	                    message: 'Start Date is mandatory'
	   	                },
	   	                regexp: {
	   	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	   	                    message: 'please enter Start Date in MM/DD/YYYY format. '
	   	                },
	   	                date: {
	   	                    format: 'MM/DD/YYYY', 
	   	                    message: 'Start Date is not a valid, please enter in MM/DD/YYYY format'
	   	                }
	   	            }
	   	        },
	   	     ic_expirydate: {
	   	    	enabled: false,
	   	            validators: {
	   	                 notEmpty: {
	   	                    message: 'End Date is mandatory'
	   	                },
	   	                regexp: {
	   	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	   	                    message: 'please enter End Date in MM/DD/YYYY format. '
	   	                },
	   	                date: {
	   	                    format: 'MM/DD/YYYY', 
	   	                    message: 'End Date is not a valid, please enter in MM/DD/YYYY format'
	   	                }
	   	            }
	   	        },
	   	     msa_fromdate: {
   	            validators: {
   	                regexp: {
   	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
   	                    message: 'please enter Start Date in MM/DD/YYYY format. '
   	                },
   	                date: {
   	                    format: 'MM/DD/YYYY', 
   	                    message: 'Start Date is not a valid, please enter in MM/DD/YYYY format. '
   	                }
   	            }
   	        },
   	     msa_expirydate: {
   	            validators: {
   	                regexp: {
   	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
   	                    message: 'please enter End Date in MM/DD/YYYY format. '
   	                },
   	                date: {
   	                    format: 'MM/DD/YYYY', 
   	                    message: 'End Date is not a valid, please enter in MM/DD/YYYY format. '
   	                }
   	            }
   	        },
   	     irs_fromdate: {
	            validators: {
	                regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please enter Start Date in MM/DD/YYYY format. '
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'Start Date is not a valid, please enter in MM/DD/YYYY format. '
	                }
	            }
	        },
	        irs_expirydate: {
	            validators: {
	                regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please enter End Date in MM/DD/YYYY format. '
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'v Date is not a valid, please enter in MM/DD/YYYY format. '
	                }
	            }
	        },
	        gsc_fromdate: {
   	            validators: {
   	                regexp: {
   	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
   	                    message: 'please enter Start Date in MM/DD/YYYY format. '
   	                },
   	                date: {
   	                    format: 'MM/DD/YYYY', 
   	                    message: 'From Date is not a valid, please enter in MM/DD/YYYY format. '
   	                }
   	            }
   	        },
   	     gsc_expirydate: {
   	            validators: {
   	                regexp: {
   	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
   	                    message: 'please enter End Date in MM/DD/YYYY format. '
   	                },
   	                date: {
   	                    format: 'MM/DD/YYYY', 
   	                    message: 'End Date is not a valid, please enter in MM/DD/YYYY format. '
   	                }
   	            }
   	        },  
    exe_irs_w9_form: {
     	            validators: {
     	            	notEmpty: {
     	                    message: 'Executed IRS W-9 Form is mandatory'
     	                		}
     	  			    }
     	   			},
     mgr_mail_proof: {
   			enabled: false,
            validators: {
            	notEmpty: {
                    message: 'Manager Approved Eamil proof  is mandatory'
                		}/* ,
                		file: {
   					        extension: 'msg',
                            type: 'application/msg',
         					maxSize: 50*1024*1024,
        					message: 'The selected file is not valid or file size greater than 50MB'
                       } */
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
		//   alert(checkBox);
		  $("#map").show();
		  $("#vlab,#vlab1,#vlab2,#vlab3,#vlab4").hide();
		   $('#saveVendorForm').formValidation('enableFieldValidators','Ven_MSA',false);
		   $('#saveVendorForm').formValidation('enableFieldValidators', 'insu_certi',false); 
    	   $('#saveVendorForm').formValidation('enableFieldValidators', 'std_cert',false); 
    	   $('#saveVendorForm').formValidation('enableFieldValidators', 'certi_corp',false); 
    	   $('#saveVendorForm').formValidation('enableFieldValidators', 'exe_irs_w9_form',false); 
		   $('#saveVendorForm').formValidation('enableFieldValidators', 'mgr_mail_proof',true);
		   $('#saveVendorForm').formValidation('enableFieldValidators', 'ic_fromdate',false);
		   $('#saveVendorForm').formValidation('enableFieldValidators', 'ic_expirydate',false);
		   }
		else if (checkBox.checked == false) {
    	   //alert("in else"+$(this).val());
    	   $("#map").hide();
		   $("#vlab,#vlab1,#vlab2,#vlab3,#vlab4").show();
    	   $('#saveVendorForm').formValidation('enableFieldValidators', 'Ven_MSA',true); 
    	   $('#saveVendorForm').formValidation('enableFieldValidators', 'insu_certi',true); 
    	   $('#saveVendorForm').formValidation('enableFieldValidators', 'std_cert',true); 
    	   $('#saveVendorForm').formValidation('enableFieldValidators', 'certi_corp',true); 
    	   $('#saveVendorForm').formValidation('enableFieldValidators', 'exe_irs_w9_form',true); 
    	   $('#saveVendorForm').formValidation('enableFieldValidators','mgr_mail_proof',false);
    	   $('#saveVendorForm').formValidation('enableFieldValidators', 'ic_fromdate',true);
		   $('#saveVendorForm').formValidation('enableFieldValidators', 'ic_expirydate',true);
       } 
});
var date = new Date();
date.setDate(date.getDate()); 

$("#msa_fromdate").datepicker({
}).on('changeDate', function(selected) {
	/*  var minDate = new Date(selected.date.valueOf());
    $('#msa_expirydate').datepicker('setStartDate', minDate); */
    $("#msa_expirydate").attr("disabled", false);
    $('#saveVendorForm').formValidation('revalidateField', 'msa_fromdate');
});	
$("#msa_expirydate").datepicker({
}).on('changeDate', function(selected) {
  /*   var minDate = new Date(selected.date.valueOf());
    $('#msa_fromdate').datepicker('setEndDate', minDate); */
    $('#saveVendorForm').formValidation('revalidateField', 'msa_expirydate');
});	
$("#msa_fromdate").on('change', function(){
	   var fromdate1=$('#msa_fromdate').val();
	   if(fromdate1!=""){
	     var minDate=new Date(fromdate1);
	     $('#msa_expirydate').datepicker('setStartDate', minDate);
	   }else{
		   $("#msa_expirydate").attr("disabled", true);
		    $('#msa_expirydate').val('').datepicker('update');
	   }
});
$("#msa_expirydate").on('change', function(){
	   var expirydate1=$('#msa_expirydate').val();
	   if(expirydate1!=""){
	     var minDate=new Date(expirydate1);
	     $('#msa_fromdate').datepicker('setEndDate', minDate);
	   }
});
$("#irs_fromdate").datepicker({
}).on('changeDate', function(selected) {
	 /* var minDate = new Date(selected.date.valueOf());
    $('#irs_expirydate').datepicker('setStartDate', minDate); */
    $("#irs_expirydate").attr("disabled", false);
    $('#saveVendorForm').formValidation('revalidateField', 'irs_fromdate');
});	
$("#irs_expirydate").datepicker({
}).on('changeDate', function(selected) {
   /*  var minDate = new Date(selected.date.valueOf());
    $('#irs_fromdate').datepicker('setEndDate', minDate); */
    $('#saveVendorForm').formValidation('revalidateField', 'irs_expirydate');
});
$("#irs_fromdate").on('change', function(){
	   var fromdate1=$('#irs_fromdate').val();
	   if(fromdate1!=""){
	     var minDate=new Date(fromdate1);
	     $('#irs_expirydate').datepicker('setStartDate', minDate);
	   }else{
		   $("#irs_expirydate").attr("disabled", true);
		    $('#irs_expirydate').val('').datepicker('update');
	   }
});
$("#irs_expirydate").on('change', function(){
	   var expirydate1=$('#irs_expirydate').val();
	   if(expirydate1!=""){
	     var minDate=new Date(expirydate1);
	     $('#irs_fromdate').datepicker('setEndDate', minDate);
	   }
});

$("#gsc_fromdate").datepicker({
}).on('changeDate', function(selected) {
	/* var minDate = new Date(selected.date.valueOf());
    $('#gsc_expirydate').datepicker('setStartDate', minDate); */
    $("#gsc_expirydate").attr("disabled", false);
    $('#saveVendorForm').formValidation('revalidateField', 'gsc_fromdate');
});	
$("#gsc_expirydate").datepicker({
}).on('changeDate', function(selected) {
   /*  var minDate = new Date(selected.date.valueOf());
    $('#gsc_fromdate').datepicker('setEndDate', minDate); */
    $('#saveVendorForm').formValidation('revalidateField', 'gsc_expirydate');
});
$("#gsc_fromdate").on('change', function(){
	   var fromdate1=$('#gsc_fromdate').val();
	   if(fromdate1!=""){
	     var minDate=new Date(fromdate1);
	     $('#gsc_expirydate').datepicker('setStartDate', minDate);
	   }else{
		   $("#gsc_expirydate").attr("disabled", true);
		   $('#gsc_expirydate').val('').datepicker('update');
	   }
});
$("#gsc_expirydate").on('change', function(){
	   var expirydate1=$('#gsc_expirydate').val();
	   if(expirydate1!=""){
	     var minDate=new Date(expirydate1);
	     $('#gsc_fromdate').datepicker('setEndDate', minDate);
	   }
});
$("#ic_fromdate").datepicker({
}).on('changeDate', function(selected) {
	/*  var minDate = new Date(selected.date.valueOf());
    $('#ic_expirydate').datepicker('setStartDate', minDate); */
    $("#ic_expirydate").attr("disabled", false);
    $('#saveVendorForm').formValidation('revalidateField', 'ic_fromdate');
});	
$("#ic_expirydate").datepicker({
}).on('changeDate', function(selected) {
   /*  var minDate = new Date(selected.date.valueOf());
    $('#ic_fromdate').datepicker('setEndDate', minDate); */
    $('#saveVendorForm').formValidation('revalidateField', 'ic_expirydate');
});	
$("#ic_fromdate").on('change', function(){
	   var fromdate1=$('#ic_fromdate').val();
	   if(fromdate1!=""){
	     var minDate=new Date(fromdate1);
	     $('#ic_expirydate').datepicker('setStartDate', minDate);
	   }else{
		   $("#ic_expirydate").attr("disabled", true);
		    $('#ic_expirydate').val('').datepicker('update');
	   }
});
$("#ic_expirydate").on('change', function(){
	   var expirydate1=$('#ic_expirydate').val();
	   if(expirydate1!=""){
	     var minDate=new Date(expirydate1);
	     $('#ic_fromdate').datepicker('setEndDate', minDate);
	   }
});
</script>
<script type="text/javascript">
$('form').on('reset', function() {
	$('#saveVendorForm').data('formValidation').resetForm();
	});
$('input[name="ven_phne_no"]').mask('999-999-9999');
$('input[name="fed_id"]').mask('99-9999999');
$("#ven_mgr_emailid").blur(function () {
    $('#saveVendorForm').bootstrapValidator('revalidateField', 'ven_mgr_emailid');
});
$("#ven_phne_no").blur(function () {
    $('#saveVendorForm').bootstrapValidator('revalidateField', 'ven_phne_no');
});
$("#fed_id").blur(function () {
    $('#saveVendorForm').bootstrapValidator('revalidateField', 'fed_id');
});
</script> 
<script >
function icValidateSize(file) {
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
							 if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#certi_corp').val() != '' && $('#certi_corp').val() == $('#std_cert').val() != '' && $('#std_cert').val())
								{
							         alert("You can not send two or more same files.");
							         $('#insu_certi').val('');
							       //  $('#btnSubmit').attr('disabled',true);
							     }else{
							     	//alert("else**********");
							     	 $('#saveVendorForm').formValidation('enableFieldValidators', 'ic_fromdate',true);
									 $('#saveVendorForm').formValidation('enableFieldValidators', 'ic_expirydate',true);
							     	 $('#btnSubmit').attr('disabled',false);
							     }
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
		  	 //alert("file empty");	
	  		 $('#btnSubmit').attr('disabled',false);
	  		// $('#saveVendorForm').formValidation('enableFieldValidators', 'ic_fromdate',false);
			// $('#saveVendorForm').formValidation('enableFieldValidators', 'ic_expirydate',false);
	        }
        }else{
            window.location.href="loginpage";
	                }
                  });
} 

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
							// if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#certi_corp').val() != '' && $('#certi_corp').val() == $('#std_cert').val() != '' && $('#std_cert').val())
							if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val())	
							{
							         alert("You can not send two or more same files.");
							         $('#Ven_MSA').val('');
							         //$('#btnSubmit').attr('disabled',true);
							     }else{
							     //	alert("else**********");
							     	$('#btnSubmit').attr('disabled',false);
							     }
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
  	 // alert("file empty");	
  		$('#btnSubmit').attr('disabled',false);
  	}
}else{
    window.location.href="loginpage";
            }
          });
} 

function gscValidateSize(file) {
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
							// if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#certi_corp').val() != '' && $('#certi_corp').val() == $('#std_cert').val() != '' && $('#std_cert').val())
							if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val())	
							{
							         alert("You can not send two or more same files.");
							         $('#std_cert').val('');
							         //$('#btnSubmit').attr('disabled',true);
							     }else{
							     //	alert("else**********");
							     	$('#btnSubmit').attr('disabled',false);
							     }
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
  	 // alert("file empty");	
  		$('#btnSubmit').attr('disabled',false);
  	}
        }else{
            window.location.href="loginpage";
	                }
                  });
} 

function irsValidateSize(file) {
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
							// if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#certi_corp').val() != '' && $('#certi_corp').val() == $('#std_cert').val() != '' && $('#std_cert').val())
							if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val())	
							{
							         alert("You can not send two or more same files.");
							         $('#exe_irs_w9_form').val('');
							         //$('#btnSubmit').attr('disabled',true);
							     }else{
							     //	alert("else**********");
							     	$('#btnSubmit').attr('disabled',false);
							     }
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
  	 // alert("file empty");	
  		$('#btnSubmit').attr('disabled',false);
  	}
}else{
    window.location.href="loginpage";
            }
          });
} 

function ciValidateSize(file) {
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
							// if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#certi_corp').val() != '' && $('#certi_corp').val() == $('#std_cert').val() != '' && $('#std_cert').val())
							if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val())	
							{
							         alert("You can not send two or more same files.");
							         $('#certi_corp').val('');
							         //$('#btnSubmit').attr('disabled',true);
							     }else{
							     //	alert("else**********");
							     	$('#btnSubmit').attr('disabled',false);
							     }
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
  	 // alert("file empty");	
  		$('#btnSubmit').attr('disabled',false);
  	}
        }else{
            window.location.href="loginpage";
	                }
                  });
} 


function EditValidateSize(file) {
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
								 if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#certi_corp').val() != '' && $('#certi_corp').val() == $('#std_cert').val() != '' && $('#std_cert').val())
									{
								         alert("You can not send two or more same files.");
								         $('#btnSubmit').attr('disabled',true);
								     }else{
								     //	alert("else**********");
								     	$('#btnSubmit').attr('disabled',false);
								     }
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
	  	 // alert("file empty");	
	  		$('#btnSubmit').attr('disabled',false);
	  	}
         }else{
             window.location.href="loginpage";
		                }
	                  });
} 
 </script>
<!-- <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
 <script type="text/javascript">
  checkDuplicates = function(e){
  	 var arr = [];
  	  var fileInputs = document.querySelectorAll(".docfiles");
  	   fileInputs.forEach(function(input){
  	    if(arr.length == 0){
  	      arr.push(input.files[0].name);
  	    } else {
  	      if(arr.indexOf(input.files[0].name) > -1){
  	        e.preventDefault();
  	        alert("there's a duplicate");
  	      } else {
  	        arr.push(input.files[0].name);
  	      }
  	    }
  	 });
  
  };
  </script> -->
</body>
</html>
<!--  if ($('#file_1').val() != '' && $('#file_1').val() == $('#file_2').val() != '' && $('#file_2').val() || $('#file_1').val() != '' && $('#file_1').val() == $('#file_3').val() != '' 
 && $('#file_3').val() || $('#file_2').val() != '' 
 && $('#file_2').val() == $('#file_3').val() != '' 
 && $('#file_3').val())
 && $('#file_1').val() == $('#file_4').val() != '' && $('#file_4').val() || $('#file_3').val() != '' && $('#file_3').val() == $('#file_4').val() != '' && $('#file_4').val() || $('#file_2').val() != '' && $('#file_2').val() == $('#file_4').val() != '' && $('#file_1').val() == $('#file_5').val() != '' && $('#file_5').val() || $('#file_4').val() != '' && $('#file_4').val() == $('#file_5').val() != '' && $('#file_5').val() || $('#file_3').val() != '' && $('#file_3').val() == $('#file_5').val() != '' && $('#file_5').val() || $('#file_2').val() != '' && $('#file_2').val() == $('#file_5').val() != ''
 
  -->
  
  
  <!-- if ($('#file_1').val() != '' && $('#file_1').val() == $('#file_2').val() != '' && $('#file_2').val() 
  || $('#file_1').val() != '' && $('#file_1').val() == $('#file_3').val() != '' && $('#file_3').val() 
  || $('#file_2').val() != '' && $('#file_2').val() == $('#file_3').val() != '' && $('#file_3').val())
   -->
  
  
  
<!-- if ($('#file_1').val() != '' && $('#file_1').val() == $('#file_2').val() != '' && $('#file_2').val() || $('#file_1').val() != '' && $('#file_1').val() == $('#file_3').val() != '' && $('#file_3').val() || $('#file_1').val() != '' && $('#file_1').val() == $('#file_4').val() != '' && $('#file_4').val() || $('#file_1').val() != '' && $('#file_1').val() == $('#file_5').val() != '' && $('#file_5').val() || $('#file_2').val() != '' && $('#file_2').val() == $('#file_3').val() != '' && $('#file_3').val()) || $('#file_2').val() != '' && $('#file_2').val() == $('#file_4').val() != '' && $('#file_4').val()) || $('#file_2').val() != '' && $('#file_2').val() == $('#file_5').val() != '' && $('#file_5').val()) || $('#file_3').val() != '' && $('#file_3').val() == $('#file_4').val() != '' && $('#file_4').val()) || $('#file_3').val() != '' && $('#file_3').val() == $('#file_5').val() != '' && $('#file_5').val()) || $('#file_4').val() != '' && $('#file_4').val() == $('#file_5').val() != '' && $('#file_5').val())         
 -->  
 
<!-- if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val()  

<!-- $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#certi_corp').val() != '' && $('#certi_corp').val() == $('#std_cert').val() != '' && $('#std_cert').val()) -->
           
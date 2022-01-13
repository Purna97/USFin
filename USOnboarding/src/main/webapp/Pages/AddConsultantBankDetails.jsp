<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Portal</title>
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
</style>	
<body>
 <div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">Add Direct Deposit Details</h5>
							<div class="card-body">
								<div class="row">
									<div class="col-md-8 col-sm-12">
									
										<fieldset>
										<%-- <font color=red>Employee Number :</font>&nbsp;&nbsp;<b>${empobj.emp_number}</b>&nbsp;&nbsp; --%>
										<%-- <center><font color=red>Employee Name :</font>&nbsp;&nbsp;<b>${empobj.fullname}</b>&nbsp;&nbsp;<font color=red>Employee Username :</font>&nbsp;&nbsp;<b>${empobj.username}</b></center> --%>
									<%-- 	<center><font color=red>Employee Name :</font><b>&nbsp;&nbsp;${basicObj.full_name}</b>&nbsp;&nbsp;<font color=red>Employee Type :</font><b>&nbsp;&nbsp;${basicObj.emp_type}</b></center> --%>
										<br>
										<form action="saveConsultantBankDetails" method="post" class="form-horizontal" enctype="multipart/form-data">
										    <input type="hidden" name="candidate_id"  id="candidate_id" value="${candidate_id}">
								        	<input type="hidden" name="empType" id="empType" value="${empType}">
									  <c:choose>
						   			   <c:when test="${empType=='C2C'}">
											<div class="form-group row">
													<label  for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Select Vendor</label>
													<div class="col-sm-4">
													<select name="vendorid" class="form-control text-left" id="vendorid" required>
										            <option value="" selected="selected">--Select Vendor--</option>
										                  <c:forEach var="venl" items="${vendorList}">
															<option value="${venl.vendid}">${venl.vendorname}</option>
														  </c:forEach>
										              </select>
													</div>
											</div>
											
											<div class="form-group row">
													<label  for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Select Payment Mode</label>
													<div class="col-sm-4">
														<select name="paymentMode" autoComplete="off" class="form-control text-left" id="paymentMode" required>
										                    <option value="" selected="selected">--Select Payment Mode--</option>
										                     <option value="Cheque">Cheque</option>
										                     <option value="DirectDeposit">Direct Deposit</option>
										                     <option value="Other">Others</option>									                
										              </select>
													</div>
											</div>
									</c:when>
									</c:choose>
											
									<%--     <c:choose>
						   			   <c:when test="${empType=='1099'}">
						   			    <div class="form-group row">
													<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Account Number</label>
													<div class="col-sm-4">
														<input class="form-control"  id='txtAccount'  autocomplete="off"
														name="acc_no" placeholder='Enter Account Number'
														pattern="^[0-9]*$" minlength="9"  maxlength="15" title="Enter Only digits" type='text'
														required>
													</div>
												</div>
										
											<div class="form-group row">
													<label  for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Bank Name</label>
													<div class="col-sm-4">
														<input  class="form-control" id='txtBank'  autocomplete="off" name="bank_name" placeholder='Enter Bank Name'
														pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"  title="Enter only Characters" type='text' required>
													</div>
												</div>
										
									         	<div class="form-group row">
													<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Bank Swift Code</label>
														<div class="col-sm-4">
														<input class="form-control" id='txtswift'  autocomplete="off" 
															title="Enter only Characters and numbers" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"
														name="swift_code" placeholder='Bank Swift Code' type='text'>
													</div>
												</div>
												
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>IBAN code</label>
														<div class="col-sm-4">
														<input class="form-control" id='txtiban'  autocomplete="off"  
															title="Enter only Characters and numbers" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"
														name="ibank_code" placeholder='IBAN code' type='text'>
													</div>
												</div>
										
									           	 <div class="form-group row">
													<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Bank Routing Number</label>
													<div class="col-sm-4">
														<input class="form-control"  id='txtrouting'  autocomplete="off"
														name="bank_routing" placeholder='Bank Routing Number'
														pattern="^[0-9]*$" maxlength="9" title="Enter Only digits" type='text'
														required>
													</div>
												</div>
												
							       	 <div class="form-group row">
									  <label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Bank Form</label>
										<div class="col-sm-4">
										<input type="file" id="bfile" name="bfile" onchange="ValidateSize(this)"><br>
									</div>
								    </div>
								
									<!--  <div class='form-group' id="add">
                                       <label for="inputPassword" class="col-lg-2 control-label">Add Other Bank Details</label>
												<div class="col-xs-4">
													<button type="button" class="btn btn-success addButton">
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                     </div>  -->
                                          <div class="form-group row">
                                   			 <label for="inputPassword" class="col-sm-4 control-label">Add Other Bank Details</label>
                                  			 <div class="text-center ml-3">
                                  			 <div class="input-group-btn addButton">
                                                <button class="btn btn-success" type="button" onclick="addfieldsBank();"> <i class="fa fa-plus" aria-hidden="true"></i></button>
                                            </div>
                                            </div>
                                            </div><br>
                                             <div id="addfieldsBank"></div>
						   			   </c:when>
						   			   </c:choose> --%>
								    
									<div id="Bank" class="form-group" style="display:none">
										<div class="form-group row">
													<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Account Number</label>
													<div class="col-sm-4">
														<input class="form-control"  id='txtAccount'  autocomplete="off"
														name="acc_no" placeholder='Enter Account Number'
														pattern="^[0-9]*$" minlength="9"  maxlength="20" title="Enter Only digits" type='text'
														required>
													</div>
												</div>
										
											<div class="form-group row">
													<label  for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Bank Name</label>
													<div class="col-sm-4">
														<input  class="form-control" id='txtBank'  autocomplete="off" name="bank_name" placeholder='Enter Bank Name'
														pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"  minlength="2" maxlength="100" title="Enter only Characters" type='text' required>
													</div>
												</div>
										
									         	<div class="form-group row">
													<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Bank Swift Code</label>
														<div class="col-sm-4">
														<input class="form-control" id='txtswift'  autocomplete="off" 
															title="Enter only Characters and numbers" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"
														name="swift_code" placeholder='Bank Swift Code' type='text'>
													</div>
												</div>
												
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>IBAN code</label>
														<div class="col-sm-4">
														<input class="form-control" id='txtiban'  autocomplete="off"  
															title="Enter only Characters and numbers" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"
														name="ibank_code" placeholder='IBAN code' type='text'>
													</div>
												</div>
										
									           	 <div class="form-group row">
													<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Bank Routing Number</label>
													<div class="col-sm-4">
														<input class="form-control"  id='txtrouting'  autocomplete="off"
														name="bank_routing" placeholder='Bank Routing Number'
														pattern="^[0-9]*$" maxlength="9" title="Enter Only digits" type='text'
														required>
													</div>
												</div>

													<div class="form-group row">
														<label for="inputPassword" class="col-sm-4 control-label"><Span
															style="color: red;"></Span>Bank Form</label>
														<div class="col-sm-4">
															<input type="file" id="bfile" name="bfile"
																onchange="ValidateSize(this)"><br>
														</div>
													</div>
												</div>
												
												
												<div class="text-center ml-3">										
											 	<input type="submit" class="btn btn-default" id="submitid" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Submit">
											   <!--  <input type="button" class="btn btn-default" id="submitid" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Submit"  onclick="btnClick()"> -->
												<button type="reset" class="btn btn-default" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;">Reset</button>
												<input type="button" value="Go to Search" onclick="goBack()" class="btn btn-default btn-sm"
													style="padding: 7px; background-color: grey; color: white; line-height: 0.728571;"> 
											</div>
										</form>		
									</fieldset>
								</div>
							</div>
						</div>
					</div>
				  </div>
			  </div>
		</div>
	 </div>
	 
	 		<form action="searchlist" method="post" id="bformid">
		        <input type="hidden"  name="semp_type"  value="${semp_type}">
				<input type="hidden" name="susername"  value="${susername}">
  	        	<input type="hidden"  name="sfullname"  value="${sfullname}">
			    <input type="hidden"  name="spendingdocs"  value="${spendingdocs}">
			    <input type="hidden" name="s_subtype"  value="${s_subtype}">
			    <input type="hidden" name="empstatus" value="${sempstatus}">
			</form>
</div>
    <!-- Javascripts-->
  <script src="resources/js/js/jquery-2.1.4.min.js"></script>
  <script src="resources/preDefined/goback.js"></script>
  <script type="text/javascript">
	var value = 0;
	var max_limit = 3;
	function addfieldsBank() {
		value++;
	//	$('#btncount').val(value);
		//alert(vbval);
		var objTo = document.getElementById('addfieldsBank');
		var divtest = document.createElement("div");
		divtest.setAttribute("class", "form-group removeclass" + value);
		var rdiv = 'removeclass' + value;
		divtest.innerHTML = '<div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;">*</Span>Account Number</label><div class="col-lg-4"><input class="form-control"  id="acc_name" autocomplete="off" name="acc_name'+value+'" placeholder="Enter Account Number" pattern="[0-9]+" minlength="9" maxlength="20" title="Enter Only digits" type="text" required><input type="hidden" value="'+value+'" name="btncount"></div><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="remove_add_fieldsV('+value+ ');"><span class="glyphicon glyphicon-minus" aria-hidden="true">-</span></button></div></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;">*</Span>Bank Name</label><div class="col-lg-4"><input class="form-control"  id="bank_name" autocomplete="off" name="bank_name'+ value+ '" placeholder="Bank Name"  pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" minlength="2" maxlength="100" title="Enter only Characters"  type="text" required></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:black;"></Span>Bank Swift Code</label><div class="col-lg-4"><input class="form-control"  id="swift_code" autocomplete="off" name="swift_code'+value+'" placeholder="Bank Swift Code"   title="Enter Only digits" type="text"></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:black;"></Span>IBAN code</label><div class="col-lg-4"><input class="form-control"  id="ibank_code" autocomplete="off" name="ibank_code'+value+'" placeholder="IBAN code" title="Enter Only digits" type="text"></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;">*</Span>Bank Routing Number</label><div class="col-lg-4"><input class="form-control"  id="bank_routing" autocomplete="off" name="bank_routing'+value+'" pattern="[0-9]+" minlength="9"  maxlength="9" placeholder="Bank Routing Number" title="Enter Only digits" type="text" required></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;"></Span>Amount</label><div class="col-lg-4"><input class="form-control"  id="bank_amount" autocomplete="off" name="bank_amount'+value+'" placeholder="Enter Amount" pattern="[0-9]+" maxlength="12" title="Enter Only digits" type="text"></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;"></Span>Bank Form</label><div class="col-lg-4"><input type="file" id="othrfile" name="ofile'+value+'" accept=".jpeg,.xls,.xlsx,.jpg,.png,.pdf,.doc,.docx" onchange="ValidateSize(this)"></div></div></div><div class="clear"></div>';
			if (value <= max_limit) {
			objTo.appendChild(divtest);
		} else if (value > max_limit) {
			alert("Can't add more than 3 Banks!!");
		}
	}
	function remove_add_fieldsV(rid) {
		$('.removeclass' + rid).remove();
		value--;
	}
</script>
<!--  <script type="text/javascript">
var otherbnk = 0;
var MAX_OPTIONS = 3;
$('#formid').formValidation({
    framework: 'bootstrap',
    icon: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {	         
    	txtAccount: {
            validators: {
            	notEmpty: {
                    message: 'Account Number is required'
                },
                stringLength: {   
                    min: 9,
                    max: 15,
                    message: 'Account Number must be more than 9 and less than 15 digits long'
                },
                regexp: {
                	regexp: /^[0-9]*$/,
                    message: 'Account Number can only consist of Numerical'
                }
                
            }
        
        },   
        txtBank: {
            validators: {
            	notEmpty: {
                    message: 'Account Name is required'
                },
                stringLength: {
                    min: 2,
                    message: 'Account Name must be more than 2 characters long'
                },
                 regexp: {
                	 regexp: /^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$/,
                     message: 'Account Name can only consist of alphabetical and double spaces not allowed'
                } 
            }
        
        },
  
        txtrouting :{
            validators: {
            	notEmpty: {
                    message: 'Bank Routing Number is required'
            	 },
                 stringLength: {
                 min: 9,
                 max: 9,
                 message: 'Bank Routing Number 9 digits long'
                },
                  regexp: {
                  regexp: /^[0-9]*$/,
                 message: 'Bank Routing Number only consist of Digits'
             }
           }
      },
      txtswift : {
          validators: {
          	isEmpty: {
                  message: 'Bank Swift code  is not required'
              },
               regexp: {
            	  regexp: /^[a-zA-Z0-9]+$/,
                  message: 'Bank Swift code can only consist of alphanumerical'
              } 
          }
      },
      txtiban: {
          validators: {
        	  isEmpty: {
                  message: 'Bank IBAN code is not required'
              },
              regexp: {
            	  regexp: /^[a-zA-Z0-9]+$/,
                  message: 'IBAN code can only consist of alphanumerical'
              } 
          }
      
      },
      vendorid :{
          validators: {
           	notEmpty: {
                   message: 'Please select Vendor..'
               }
           }
       },
       paymentMode :{
           validators: {
            	notEmpty: {
                    message: 'Please select Payment Mode..'
                }
            }
        },
      
      acc_name: {
    	     validators: {
    	    	    notEmpty: {    
    	    	                  message: 'Account Number is required'
    	    	              },
    	    	              stringLength: {   
    	    	                  min: 9,
    	    	                  max: 15,
    	    	                  message: 'Account Number must be more than 9 and less than 15 digits long'
    	    	              },
    	    	              regexp: {
    	    	              	regexp: /^[0-9]*$/,
    	    	                  message: 'Account Number can only consist of Numerical'
    	    	              }
    	    	              
    	    	          }
    	    	      
    	    	      },   
    	    	      bank_name: {
    	    	          validators: {
    	    	          	notEmpty: {
    	    	                  message: 'Account Name is required'
    	    	              },
    	    	              stringLength: {
    	    	                  min: 2,
    	    	                  message: 'Account Name must be more than 2 characters long'
    	    	              },
    	    	               regexp: {
    	    	            	   regexp: /^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$/,
    	    	                   message: 'Account Name can only consist of alphabetical and double spaces not allowed'
    	    	              } 
    	    	          }
    	    	      
    	    	      },

    	    	      bank_routing:{
    	    	          validators: {
    	    	          	notEmpty: {
    	    	                  message: 'Bank Routing Number is required'
    	    	          	 },
    	    	               stringLength: {
    	    	               min: 9,
    	    	               max: 9,
    	    	               message: 'Bank Routing Number 9 digits long'
    	    	              },
    	    	                regexp: {
    	    	                regexp: /^[0-9]*$/,
    	    	               message: 'Bank Routing Number only consist of Digits'
    	    	           }
    	    	         }
    	    	    },
    	    	    swift_code: {
    	    	        validators: {
    	    	        	isEmpty: {
    	    	                message: 'Bank Swift code  is not required'
    	    	            },
    	    	             regexp: {
    	    	          	  regexp: /^[a-zA-Z0-9]+$/,
    	    	                message: 'Bank Swift code can only consist of alphanumerical'
    	    	            } 
    	    	        }
    	    	    },
    	    	    ibank_code: {
    	    	        validators: {
    	    	      	  isEmpty: {
    	    	                message: 'Bank IBAN code is not required'
    	    	            },
    	    	            regexp: {
    	    	          	  regexp: /^[a-zA-Z0-9]+$/,
    	    	                message: 'IBAN code can only consist of alphanumerical'
    	    	            } 
    	    	        }
    	    	     },
    	    	  
    	    	     othr_bfile :{
    	    	         validators: {
    	    	       	  isEmpty: {
    	    	                 message: 'Bank File is not required'
    	    	             },
    	    	         }
    	    	     }
    	       }
 }); 
/* .on('click', '.addButton', function() {
	otherbnk++;
     var $template = $('#addotherbank'),
         $clone    = $template
                         .clone()
                         .removeClass('hide')
                         .removeAttr('id')
                         .attr('data-book-index', otherbnk)
                         .insertAfter($template);
         
    // var x = document.getElementById("bankbtncount").name = "bankbtncount"+otherbnk;
  //   var y = document.getElementById("othr_bfile").name = "othr_bfile"+otherbnk; 
     $('#bankbtncount').val(otherbnk);
     /* $('#acc_name').val(otherbnk);
     $('#bank_name').val(otherbnk);
     $('#bank_routing').val(otherbnk);
     $('#swift_code').val(otherbnk);
     $('#ibank_code').val(otherbnk);
     $('#othr_bfile').val(otherbnk); 
    alert("add button"+otherbnk);
     $('#formid')
     .formValidation('addField', $clone.find('[name="acc_name"]'))
     .formValidation('addField', $clone.find('[name="bank_name"]'))
     .formValidation('addField', $clone.find('[name="bank_routing"]'))
     .formValidation('addField', $clone.find('[name="swift_code"]'))
     .formValidation('addField', $clone.find('[name="ibank_code"]'))
     .formValidation('addField', $clone.find('[name="othr_bfile"]'));
 })

 .on('click', '.removeButton', function() {
     var $row  = $(this).parents('.form-group'),
         index = $row.attr('data-book-index');
        $acc_name = $row.find('[name="acc_name"]');
    	otherbnk--;
     // Remove fields
          $('#formid')
            .formValidation('removeField', $row.find('[name="acc_name' + index + '"]'))
            .formValidation('removeField', $row.find('[name="bank_name' + index + '"]'))
            .formValidation('removeField', $row.find('[name="bank_routing' + index + '"]'))
            .formValidation('removeField', $row.find('[name="swift_code' + index + '"]'))
            .formValidation('removeField', $row.find('[name="ibank_code' + index + '"]'))
            .formValidation('removeField', $row.find('[name="othr_bfile' + index + '"]'))
            .formValidation('removeField', $acc_name);

     // Remove element containing the fields
     $row.remove();
       })
       .on('added.field.fv', function(e, data) {
           if (data.field === 'acc_name') {
               if ($('#formid').find(':visible[name="acc_name"]').length >= MAX_OPTIONS) {
                   $('#formid').find('.addButton').attr('disabled', 'disabled');
               }
           }
        })
        .on('removed.field.fv', function(e, data) {
            if (data.field === 'acc_name') {
                 if ($('#formid').find(':visible[name="acc_name"]').length <= MAX_OPTIONS) {
                     $('#formid').find('.addButton').removeAttr('disabled');
                 }
             }
 });  */
</script>  -->
   
<script type="text/javascript">
    $(function () {
        $("#paymentMode").change(function () {
            if ($(this).val() == "DirectDeposit") { 
                $("#Bank").show();
                document.getElementById('txtAccount').required=true;
                document.getElementById('txtBank').required=true;
                document.getElementById('txtrouting').required=true;
            } else if ($(this).val() == "Cheque"){
                $("#Bank").hide();
                document.getElementById('txtAccount').required=false;
                document.getElementById('txtBank').required=false;
                document.getElementById('txtrouting').required=false;
            }else{
            	  $("#Bank").hide();
                  document.getElementById('txtAccount').required=false;
                  document.getElementById('txtBank').required=false;
                  document.getElementById('txtrouting').required=false;
            }
        });
    });
    function goBack() {
    	getsesVal().done(function(data){
    		if(data!=""){
    	document.getElementById("bformid").submit();
    		}else{
    			 window.location.href="loginpage";
    		}
    	});
    	}
</script>
 <!-- <script type="text/javascript">
function btnClick(){
	$('#formid').formValidation('validate');
	if( !$('#formid').data('formValidation').isValid())
		 {
		  alert("Not Valid");
		 }
	else{
		alert("Yes Valid");
		//document.getElementById("formid").submit();
		}
	}

</script> -->
</body>
</html>
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

.col-sm-2 {
	flex: 0 0 14.666667%;
    max-width: 23.666667%;
}
</style>
<body class="sidebar-mini fixed">
<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header"><span id="h1span">Add</span> SOC Code Details</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-md-11 col-sm-12">
									<fieldset>
										<form action="/" method="post" id="saveCustomerForm" class="form-horizontal">
										<input type="hidden" name="socid" id="socid">
	                                          <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>SOC Code</label>
												<div class="col-sm-5">
													<input id="soc_code" type="text"
													autocomplete="off" placeholder="SOC Code" name="soc_code" class="form-control"  required>
												</div>
											</div>
											 <!-- title="only alphabets are allowed"  -->
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>SOC Title</label>
												<div class="col-sm-5">
												<input type="text" name="soccode_title" id="soccode_title" 
													 placeholder="SOC Title"  class="form-control">
												</div>
											  </div> 
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Duties</label>
												<div class="col-sm-5">
													<textarea id="duties" type="text" rows="6" cols="100" 
													autocomplete="off" placeholder="Duties" name="duties" class="form-control"  required></textarea>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Wage Range From ($)</label>
												<div class="col-sm-5">
													<input id="from_wagerate" type="text" minlength="3" maxlength="10"
													autocomplete="off" placeholder="Wage Range From" name="from_wagerate" class="form-control"  required>
												</div>
											</div> 
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Wage Range To ($)</label>
												<div class="col-sm-5">
													<input id="to_wagerate" type="text" minlength="3" maxlength="10"
													autocomplete="off" placeholder="Wage Range To" name="to_wagerate" class="form-control"  required>
												</div>
											</div> 
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Occupation Classification</label>
												<div class="col-sm-5">
													<input id="occu_classfication" type="text" minlength="2" maxlength="10"
													autocomplete="off" placeholder="Occupation Classification" name="occu_classfication" class="form-control"  required>
												</div>
											</div> 
											
											<div class="text-center ml-3">
												<input type="button" class="btn btn-default" id="btnSubmit" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Submit"  onclick="btnClick()">
												<button type="button" id="btnResetId" class="btn btn-default" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;">Reset</button> 
												<button type="button" id="btnCancelId"  class="btn btn-default" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;display:none;" >Cancel</button> 
											</div>
										</form>
									</fieldset>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		
	
	<div class="row" id="soccodeListId">
		<div class="col-md-12">
			<div class="card" id="dataTBL">
			<h5 class="card-header">SOC Code Details</h5>
				<div class="card-body">
					<div style="text-align: center;">
					</div>
					<!-- 	<form action="" method="post"> -->
					<div style="max-width:1150px;" >
					<%-- <center><span><strong style="font-size:20px;color:blue;">SOC Code Details</strong></span></center> --%>
					<table id="customerTable" class="table table-hover table-bordered"
						style="text-align: center;">
						<thead>
							<tr>
								<th style="text-align: center">SOC Code</th>
								<th style="text-align: center">SOC Title</th>
							     <th style="text-align: center">Wage Range</th>
								 <th style="text-align: center">Action</th>  
							</tr>
						</thead>
						<tbody>
					<c:forEach var="soclist" items="${soccodeList}">
						 	 <tr>   
							    <td>${soclist.soc_code}</td>
							    <td>${soclist.soccode_title}</td>
							    <td>${soclist.from_wage_range} to ${soclist.to_wage_range}</td>
							    <td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											onclick="editSOCcode(${soclist.soc_id});" class="btn btn-info btn-sm addButton">
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script src="resources/preDefined/goback.js"></script>
<script type="text/javascript">

function editSOCcode(socid){
	getsesVal().done(function(data){
		if(data!=""){
	$('#saveCustomerForm').bootstrapValidator('resetForm', true);
	$('#socid').val(socid);
	$.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/json", // NOT dataType!
		url : "SOCDetailsById",
		data : {
			socid : socid
		      },
		success : function(response) {
			$('#soc_code').val(response.soc_code);
			$('#soccode_title').val(response.soccode_title);
			$('#duties').val(response.duties);
			$('#from_wagerate').val(response.from_wage_range);
			$('#to_wagerate').val(response.to_wage_range);
			$('#occu_classfication').val(response.occupation_calssification);
			$('#h1span').text("Update");
			$('#btnSubmit').val("Update");
			$('#btnResetId,#soccodeListId').hide();
			$('#btnCancelId').show();
		}
	});
		}else{
			 window.location.href="loginpage";
		}
	});
}
$("#btnResetId").click(function(event) {
    window.location.reload();
});
$("#btnCancelId").click(function(event) {
	getsesVal().done(function(data){
		if(data!=""){
	$('#saveCustomerForm').bootstrapValidator('resetForm', true);
	/* $('#from_wagerate').val(60000);
	$('#to_wagerate').val(140000);
	$('#from_wagerate').attr("readonly",true);	 */
	window.location.href="soccode";
		}else{
			 window.location.href="loginpage";
		}
	});
});

function btnClick(){
	getsesVal().done(function(data){
		if(data!=""){
	$('#saveCustomerForm').formValidation('validate');
	if( !$('#saveCustomerForm').data('formValidation').isValid())
		 {
		 }
	else{
		/* var url="";
	if(socid!=""){
		url="saveSoc";
	}else{
		url="updateSoc";
	} */
		  $("#btnSubmit").attr("disabled", true);
				var form = $('#saveCustomerForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "saveupdatesoc", //this is the submit URL
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
$("#closePopupSave").click(function(event) {
	$('#myModal').modal('hide');
	window.location.href="soccode";
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
    	soccode_title: {
            validators: {
            	notEmpty: {
                    message: 'SOC Code title is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'SOC Code title must be more than 2 and less than 100 characters long. '
                },
                regexp: {
                	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                     message: 'SOC Code title accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                }
            }
        },  
        soc_code: {
            validators: {
            	notEmpty: {
                    message: 'SOC Code is mandatory'
                },
                callback:{
                    message: 'SOC Code is not valid',
                    callback: function(value, soc_code, $field){
                        if(value===''){
                            return true;
                         }
                        if(value.length < 7 || value.length > 7){
                            return {
                                valid: false,
                                message: 'SOC Code should be 6 digits.'
                            };
                        }
                        var re= /^([07][1-7]|1[0-6]|2[0-7]|[35][0-9]|[468][0-8]|9[0-589])-\d{4}$/;
                        if(!value.match(re)) {
                            return {
                                valid: false,
                                message: 'Please enter valid SOC Code.'
                            };
                        }
                        return true;
                    }               
                }
            }          
        },
        duties : {
            validators: {
            	 notEmpty: {
                    message: 'Duties are mandatory'
                },
                /* stringLength: {
                    min: 2,
                    max: 25,
                    message: 'Duties should have more than 2 and less than 80 characters '
                }, */
                regexp: {
                  regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Duties accepts alpha numerics '
                }
            }
        },
       
        from_wagerate : {
            validators: {
            	notEmpty: {
                    message: 'From wage range is mandatory'
                },
                stringLength: {
                	min: 3,
                    max: 10,
                    message: 'From wage range should have 3 digits'
               //  	Pay Rate must be 2 digits and less than 7 digits
                },
                regexp: {
                	regexp: /^[0-9]*$/,
                    message: 'From wage range accepts digits'
                }
            }
        },
        to_wagerate : {
            validators: {
            	notEmpty: {
                    message: 'To wage range is mandatory'
                },
                stringLength: {
                	min: 3,
                    max: 10,
                    message: 'To wage range should have 3 digits'
                },
                regexp: {
                	regexp: /^[0-9]*$/,
                    message: 'To wage range accepts digits'
                }
            }
        },
        occu_classfication : {
            validators: {
            	notEmpty: {
                    message: 'Occupation Classification is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 5,
                    message: 'Occupation Classification must be 5 digits'
                },
                regexp: {
                	regexp: /^[0-9]*$/,
                    message: 'Occupation Classification accepts digits'
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
$(document).ready(function(){
$('#from_wagerate').val(60000);
$('#to_wagerate').val(140000);
$('#from_wagerate').attr("readonly",true);	
});
$('input[name="cust_phne_no"]').mask('999-999-9999');
$('input[name="soc_code"]').mask('99-9999');
</script> 
</body>
</html>
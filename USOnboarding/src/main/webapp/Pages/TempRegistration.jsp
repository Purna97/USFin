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
							<h5 class="card-header">Add New Candidate</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-md-11 col-sm-12">
									<fieldset>
										<form action="/" method="post" id="saveCandidateForm" class="form-horizontal" enctype="multipart/form-data">
	                                        <h4><b>Candidate Details</b></h4> 
	                                          <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>SSN</label>
												<div class="col-sm-4">
													<input type="text"  name="ssn" id="ssn"
												     placeholder="Enter SSN"  class="form-control">
												    <span id="ssnshow" style="color: red;"></span>
												</div>
											</div>
											
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>First Name</label>
												<div class="col-sm-4">
												<input type="text" id="fname" name="fname" minlength="2" maxlength="100" title="only alphabets are allowed"
													 placeholder="Enter First Name"  class="form-control"required>
												</div>
											  </div> 
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Last Name</label>
												<div class="col-sm-4">
												<input type="text" id="lname" name="lname" minlength="2" maxlength="100" title="only alphabets are allowed"
													 placeholder="Enter Last Name"  class="form-control"required>
												</div>
											  </div> 
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Phone</label>
												<div class="col-sm-4">
													<input id="phne_no" type="text" minlength="12" maxlength="12" title="Enter Only 123-456-7890 format"
													autocomplete="off" placeholder="Enter Phone No" name="phne_no" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Email</label>
												<div class="col-sm-4">
													<input id="emailid" type="text" title="Enter Valid e-mail format ex:xyz@gmail.com" minlength="8" maxlength="80"
													autocomplete="off" placeholder="Enter E-mail" name="emailid" class="form-control"  required>
												  <span id="emailshow" style="color: red;"></span>
												</div>
											</div> 
											<div class="text-center ml-3">
												<button type="button" class="btn btn-info btn-sm"
													id="submitid" onclick="btnClick()">Submit</button>
												<button type="reset" class="btn btn-info btn-sm"
													id="btn-colorb" onClick="window.location.reload()">Reset</button>
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
					<div style="max-width:1150px;" >
					<center><span><strong style="font-size:20px;color:red;">Candidate Details</strong></span></center>
					<table id="customerTable" class="table table-hover table-bordered"
						style="text-align: center;">
						<thead>
							<tr>
								<th style="text-align: center">SSN</th>
								<th style="text-align: center">Full Name</th>
							     <th style="text-align: center">Phone</th>
							     <th style="text-align: center">Email</th>
							    <!--   <th style="text-align: center">Password</th> -->
								 <th style="text-align: center">Action</th>  
							</tr>
						</thead>
						<tbody>
					<c:forEach var="cand" items="${candidateList}">
						 	 <tr>   
						 	    <td><c:choose>
									<c:when test="${not empty cand.ssn}">
									${cand.ssn}
									</c:when>
									<c:otherwise>
									<span class="label label-success" style="background-color:grey;color:white;">NA</span>
									</c:otherwise>
								</c:choose>
						 	    </td>
							    <td>${cand.fullname}</td>
							    <td>${cand.phone}</td>
							    <td>${cand.email}</td>
							    <td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" class="btn btn-info btn-sm addButton"
											onclick="editCandidate('${cand.candidate_id}','${cand.ssn}','${cand.firstname}','${cand.lastname}','${cand.phone}','${cand.email}');">
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
	
	
	<center>
		<div class="modal fade" id="EditCandidateModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 150px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content" style="width:140%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" id="closeEditCandidateModal">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Update Candidate Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="/" id="updateCandidateForm" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="candidateId" name="candidateId"> 
						<input type="hidden" id="efname1" name="efname1">
						<input type="hidden" id="elname1" name="elname1">
						<input type="hidden" id="essn1" name="essn1">
						<input type="hidden" id="ephne_no1" name="ephne_no1">
						<input type="hidden" id="eemailid1" name="eemailid1">
						<div class="modal-body">							
					   
					     <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>SSN</label>
												<div class="col-sm-4">
													<input type="text" name="essn" id="essn" placeholder="Enter SSN"  class="form-control"  >
													 <span id="essnshow" style="color: red;"></span>
												</div>
											</div> 
											
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>First Name</label>
												<div class="col-sm-4">
												<input type="text"  id="efname" name="efname" title="only alphabets are allowed" minlength="2" maxlength="100"
													autocomplete="off"
													 placeholder="Enter First Name"  class="form-control">
												</div>
												</div>
												<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Last Name</label>
												<div class="col-sm-4">
												<input type="text"  id="elname" name="elname" title="only alphabets are allowed" minlength="2" maxlength="100"
													autocomplete="off"
													 placeholder="Enter Last Name"  class="form-control">
												</div>
											  </div> 
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Phone</label>
												<div class="col-sm-4">
													<input id="ephne_no" type="text" minlength="12" maxlength="12" title="Enter Only 123-456-7890 format"
													autocomplete="off" placeholder="Enter Phone" name="ephne_no" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Email</label>
												<div class="col-sm-4">
													<input id="eemailid" type="text" title="Enter Valid e-mail format ex:xyz@gmail.com" minlength="8" maxlength="80"
													autocomplete="off" placeholder="Enter E-mail" name="eemailid" class="form-control"  required>
												    <span id="eemailshow" style="color: red;"></span>
												</div>
											</div> 
											
											<center>
											<div class="text-center ml-3">
								<button type="button" class="btn btn-primary btn-sm"
									id="esubmitid" onclick="updateCandidate()">Update</button>
								<button type="button" class="btn btn-secondary btn-sm"
										data-dismiss="modal">Close</button>
										</div>
							</center>
									   
						</div>
					</form>
				</div>
			</div>
		</div>
	</center>
	
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
function editCandidate(id,ssn,fname,lname, phone,email){
	getsesVal().done(function(data){
		if(data!=""){
	$('#esubmitid').attr('disabled',true);
    $('#candidateId').val(id);
    $('#essn,#essn1').val(ssn);
    $('#efname,#efname1').val(fname);
    $('#elname,#elname1').val(lname);
    $('#ephne_no,#ephne_no1').val(phone);
    $('#eemailid,#eemailid1').val(email);
    $('#EditCandidateModal').modal('show');
	}else{
			 window.location.href="loginpage";
		}
	});
};
 
$('#essn').on('keyup', function() {
	if($('#essn').val()==$('#essn1').val())
   {document.getElementById('esubmitid').disabled=true;}else{document.getElementById('esubmitid').disabled=false;}  });
 
$('#efname').on('keyup', function() {
	if($('#ename').val()==$('#efname1').val())
   {document.getElementById('esubmitid').disabled=true;}else{document.getElementById('esubmitid').disabled=false;}  });

$('#elname').on('keyup', function() {
	if($('#ename').val()==$('#elname1').val())
   {document.getElementById('esubmitid').disabled=true;}else{document.getElementById('esubmitid').disabled=false;}  });


$('#ephne_no').on('keyup', function() {
	if($('#ephne_no').val()==$('#ephne_no1').val())
   {document.getElementById('esubmitid').disabled=true;}else{document.getElementById('esubmitid').disabled=false;}  });

$('#eemailid').on('keyup', function() {
	if($('#eemailid').val()==$('#eemailid1').val())
   {document.getElementById('esubmitid').disabled=true;}else{document.getElementById('esubmitid').disabled=false;}  });
   
		
function btnClick(){
	 getsesVal().done(function(data){  
         if(data!=""){
	$('#saveCandidateForm').formValidation('validate');
	if( !$('#saveCandidateForm').data('formValidation').isValid())
		 {
		 }
	else{
		  $("#submitid").attr("disabled", true);
				var form = $('#saveCandidateForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "saveCandidateDetails", //this is the submit URL
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
	
$("#esubmitid").click(function(event) {
	 getsesVal().done(function(data){  
         if(data!=""){
	event.preventDefault(); 
	$('#updateCandidateForm').formValidation('validate');
	if (!$('#updateCandidateForm').data('formValidation').isValid()) {
		//alert("not Valid");
	} else {
		$("#esubmitid").attr("disabled", true);
		var form = $('#updateCandidateForm')[0];
		var data = new FormData(form);
		$.ajax({
			url : "updateCandidateDetails", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(data) {
				 if(data!=null || data!=""){
					 alert(data);
                     window.location.href="tempreg";
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
});

$("#closePopupSave").click(function(event) {
	getsesVal().done(function(data){  
        if(data!=""){
	$('#myModal').modal('hide');
	window.location.href="tempreg";
}else{
    window.location.href="loginpage";
            }
          });
});


var textInput = document.getElementById('essn');
var timeout = null;
textInput.onkeyup = function (e) {
clearTimeout(timeout);
timeout = setTimeout(function () {
	getsesVal().done(function(data){  
        if(data!=""){
	var ssn=$('#essn').val();
	    if(ssn==""){
	    	 $('#essnshow').text('');
	    	 $("#esubmitid").attr("disabled", false);
	    }else{
	    	var regex = new RegExp("^(?!\\b(\\d)\\1+-(\\d)\\1+-(\\d)\\1+\\b)(?!123-45-6789|219-09-9999|078-05-1120)(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$");
	    if(!regex.test(ssn)){
	    	   $('#essnshow').html("<font color=red>Not a valid SSN</font>");
	    	   $("#esubmitid").attr("disabled", true);
	    }else{
	    	   $.ajax({
	   	    	type : "GET",
	   	        asyn : false,
	   	        contentType: "text/plain", // NOT dataType!
	   	        url  : "ssncheckInTempReg?ssn_emp="+ssn+"",
	   	        //data: JSON.stringify(data),
	   	        success  : function(response){
	   	        //	alert(response);
	   	        	if(response!=""){
	   	        	     $('#essnshow').html("SSN Already Exists.");
  	        		     $("#esubmitid").attr("disabled", true);
	   	        	}
	   	        	else{
	   	        		$('#essnshow').html("<font color=#009900>Valid SSN number</font>");	   	        	
	   	        		$("#esubmitid").attr("disabled", false);
	   	        	} 
	   	          }
	    	  
	   		 });
	      }
	  }
        }else{
            window.location.href="loginpage";
	                }
                  });
}, 5);
};

var textInput = document.getElementById('ssn');
var timeout = null;
textInput.onkeyup = function (e) {
clearTimeout(timeout);
timeout = setTimeout(function () {
	 getsesVal().done(function(data){  
         if(data!=""){
	 var ssn_emp=$('#ssn').val();
	    if(ssn_emp==""){
	    	 $('#ssnshow').text('');
	    	 $("#submitid").attr("disabled", false);
	    }else{
	    	var regex = new RegExp("^(?!\\b(\\d)\\1+-(\\d)\\1+-(\\d)\\1+\\b)(?!123-45-6789|219-09-9999|078-05-1120)(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$");
	    if(!regex.test(ssn_emp)){
	    	   $('#ssnshow').html("<font color=red>Not a valid SSN</font>");
	    	   $("#submitid").attr("disabled", true);
	    }else{
	    	   $.ajax({
	   	    	type : "GET",
	   	        asyn : false,
	   	        contentType: "text/plain", // NOT dataType!
	   	        url  : "ssncheckInTempReg?ssn_emp="+ssn_emp+"",
	   	        //data: JSON.stringify(data),
	   	        success  : function(response){
	   	        	if(response!=""){
	   	        	     $('#ssnshow').html("SSN Already Exists.");
  	        		     $("#submitid").attr("disabled", true);
  	                     $("input[type=submit]").css("background-color", "grey");
	   	        	}
	   	        	else{
	   	        		$('#ssnshow').html("<font color=#009900>Valid SSN number</font>");	   	        	
	   	        		$("#reset").attr("disabled", false);
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
}, 5);
};


var textInput = document.getElementById('eemailid');
var timeout = null;
textInput.onkeyup = function (e) {
clearTimeout(timeout);
timeout = setTimeout(function () {
	 getsesVal().done(function(data){  
         if(data!=""){
	 var email=$('#eemailid').val();
	    if(email==""){
	    	 $('#eemailshow').text('');
	    	 $("#esubmitid").attr("disabled", false);
	    }else{
	    	   $.ajax({
	   	    	type : "GET",
	   	        asyn : false,
	   	        contentType: "text/plain", // NOT dataType!
	   	        url  : "emailcheckInTempReg?email_emp="+email+"",
	   	        //data: JSON.stringify(data),
	   	        success  : function(response){
	   	        //	alert(response);
	   	        	if(response!=""){
	   	        	     $('#eemailshow').html("e-mail Already Exists.");
  	        		     $("#esubmitid").attr("disabled", true);
	   	        	}
	   	        	else{
	   	        		$('#eemailshow').text('');
	   	        		$("#esubmitid").attr("disabled", false);
	   	        	} 
	   	          }
	   		 });
	  }
         }else{
             window.location.href="loginpage";
		                }
	                  });
}, 5);
};

var textInput = document.getElementById('emailid');
var timeout = null;
textInput.onkeyup = function (e) {
clearTimeout(timeout);
timeout = setTimeout(function () {
	getsesVal().done(function(data){  
        if(data!=""){
	 var email=$('#emailid').val();
	    if(email==""){
	    	 $('#emailshow').text('');
	    	 $("#submitid").attr("disabled", false);
	    }else{
	    	   $.ajax({
	   	    	type : "GET",
	   	        asyn : false,
	   	        contentType: "text/plain", // NOT dataType!
	   	        url  : "emailcheckInTempReg?email_emp="+email+"",
	   	        //data: JSON.stringify(data),
	   	        success  : function(response){
	   	        	//alert(response);
	   	        	if(response!=""){
	   	        	     $('#emailshow').html("e-mail Already Exists.");
  	        		     $("#submitid").attr("disabled", true);
	   	        	}
	   	        	else{
	   	        		$('#emailshow').text('');
	   	        		$("#submitid").attr("disabled", false);
	   	        	} 
	   	          }
	   		 });
	  }
}else{
    window.location.href="loginpage";
            }
          });
}, 5);
};
</script>
<script type="text/javascript">
$('#saveCandidateForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {	
    	ssn: {
            validators: {
            	isEmpty: {
                    message: 'SSN is mandatory'
                }
            }
        },
    	fname: {
            validators: {
            	notEmpty: {
                    message: 'First Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'First Name must be more than 2 and less than 10 characters long. '
                },
                regexp: {
                	 regexp: /^(?!\s\+$)(?:([a-zA-Z])[a-zA-Z ]*)?$/,
                     message: 'First Name accepts alphabetical and Space allowed but is not at beginning or end of the word'
                }
            }
        },
        lname: {
            validators: {
            	notEmpty: {
                    message: 'Last Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Last Name must be more than 2 and less than 10 characters long. '
                },
                regexp: {
                	 regexp: /^(?!\s\+$)(?:([a-zA-Z])[a-zA-Z ]*)?$/,
                     message: 'Last Name accepts alphabetical and Space allowed but is not at beginning or end of the word'
                }
            }
        },
     emailid:{
            validators: {
            	notEmpty: {
                    message: 'e-mail ID is mandatory'
            	 },
                 stringLength: {
                 min: 8,
                 max: 80,
                 message: 'e-mail must be more than 8 and less than 80 characters long'
                },
                  regexp: {
             	  regexp: /^[a-zA-Z0-9](\.?[a-zA-Z0-9_-]){0,}@[a-zA-Z0-9-]+\.([a-z]{1,6}\.)?[a-zA-Z]{2,6}$/,
             	 message: 'Please enter valid e-mail ID'
             }
           }
      },
   phne_no:{
            validators: {
            	notEmpty: {
                    message: 'Phone is mandatory'
            	 },
                 stringLength: {
                 min: 12,
                 max: 12,
                 message: 'Phone Number must be more 10 or Not less than 10 Numbers long'
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
 });


$('#updateCandidateForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {
    	essn: {
            validators: {
            	isEmpty: {
                    message: 'SSN is mandatory'
                }
            }
        },
    	efname: {
            validators: {
            	notEmpty: {
                    message: 'First Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'First Name must be more than 2 and less than 10 characters long. '
                },
                regexp: {
                	 regexp: /^(?!\s\+$)(?:([a-zA-Z])[a-zA-Z ]*)?$/,
                     message: 'First Name accepts alphabets and Space allowed but is not at beginning or end of the word'
                }
            }
        },
    	elname: {
            validators: {
            	notEmpty: {
                    message: 'Last Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Last Name must be more than 2 and less than 10 characters long. '
                },
                regexp: {
                	 regexp: /^(?!\s\+$)(?:([a-zA-Z])[a-zA-Z ]*)?$/,
                     message: 'Last Name accepts alphabets and Space allowed but is not at beginning or end of the word'
                }
            }
        },  
     eemailid:{
            validators: {
            	notEmpty: {
                    message: 'e-mail ID is mandatory'
            	 },
                 stringLength: {
                 min: 8,
                 max: 80,
                 message: 'e-mail must be more than 8 and less than 80 characters long'
                },
                  regexp: {
             	  regexp: /^[a-zA-Z0-9](\.?[a-z0-9_-]){0,}@[a-zA-Z0-9-]+\.([a-zA-Z]{1,6}\.)?[a-zA-Z]{2,6}$/,
             	 message: 'Please enter valid e-mail ID'
             }
           }
      },
   ephne_no:{
            validators: {
            	notEmpty: {
                    message: 'Phone is mandatory'
            	 },
                 stringLength: {
                 min: 12,
                 max: 12,
                 message: 'Phone Number must be more 10 or Not less than 10 Numbers long'
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
 });
</script>
<script type="text/javascript">
$('form').on('reset', function() {
	    $('#saveCandidateForm').data('formValidation').resetForm();
	});
$("#closeEditCandidateModal").click(function(event) {
	getsesVal().done(function(data){  
        if(data!=""){
	$('#EditCandidateModal').modal('hide');
   window.location.href="tempreg";
        }else{
            window.location.href="loginpage";
	                }
                  }); 
});
$('input[name="phne_no"]').mask('999-999-9999');
$('input[name="ssn"]').mask('999-99-9999');
$('input[name="ephne_no"]').mask('999-999-9999');
$('input[name="essn"]').mask('999-99-9999');
</script> 
</body>
</html>
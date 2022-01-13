<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
</style>
<body>
<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">Exit Details</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-lg-12">
									<input type="hidden" name="emptype" id="emptype" value="${emptype}">
									<input type="hidden" name="role" id="role" value="${role}">
									<input type="hidden" name="dept" id="dept" value="${dept}">
										<fieldset>
										<center><font color=red>Employee Name :</font><b>&nbsp;&nbsp;${basicObj.full_name}</b>&nbsp;&nbsp;<font color=red>Employee Type :</font><b>&nbsp;&nbsp;${basicObj.emp_type}</b></center>
										<br>
											<form action="/"  class="form-horizontal" id="formid">
											<!--  <legend><i class="fa fa-line-chart"></i>Raise NC</legend>  -->
											 <input type="hidden" name="candidate_id" id="candidate_id" value="${candidate_id}">
											 <%-- <input type="hidden" name="empno" value="${empno}">
											 <input type="hidden" name="ssn_no" value="${ssn_no}"> --%>
											 
											<input type="hidden"  name="susername"  value="${s_username}">
    	        							<input type="hidden"  name="sfullname"  value="${s_fullname}">
					    	        		<input type="hidden"  name="semptype"  value="${s_emptype}">
					    	        		<input type="hidden"  name="sssnno"  value="${s_ssnno}">
					    	        		<input type="hidden"  name="spendingdocs"  value="${s_pendingdocs}">
											
												<div class="form-group row"> 
												<label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;">*</Span>Last Working Date</label>
											<div class="col-lg-4">
												<input type="text" autocomplete="off" id="txtLWD" class="form-control text-left"  title= "Please enter MM/DD/YY format" placeholder="MM/DD/YYYY"
												 name="txtLWD" placeholder="Last Working Date" class="form-control" required >
											</div>
											</div>
											
											 <div class="form-group row">
                                               <label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;">*</Span>Termination Email Date</label>
                                                 <div class="col-lg-4">
                                                  <input type="text" 
                                                     id="terminationdate"  autocomplete="off" name="terminationdate"  title= "Please enter MM/DD/YY format" placeholder="MM/DD/YYYY"
                                                      autocomplete="off" 
                                                      class="form-control" required>
                                                    </div>
                                               </div>

											<div class="form-group row">
												<label class="col-lg-4 control-label" for="txttype" ><Span style="color:red;">*</Span>Select
													Reasons Of Exiting</label>
												<div class="col-lg-4">
													<select id="exitreason" autocomplete="off" name="exitreason" style="padding:6px 12px;"
													class="form-control" required>
														<option value="">-- Select Reasons Of Exiting--</option>
														<option value="Resignation">Resignation</option>
														<option value="Termination">Termination</option>
														<option value="Tekskills Released">Tekskills Release</option>
														<option value="Client Released">Client Release</option>
														<option value="Absconding">Absconding</option>
														<option value="Project Completed">Project Completed</option>
														<option value="Others">Others</option> 
													</select>
												</div>
											</div>
											
                                            <div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;"></Span>Comments</label>
												<div class="col-lg-4">
													<!-- <input id="comment" type="text" pattern="^[a-zA-Z\s]+$" data-minlength="3" 
													title="only alphabets are allowed"     pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
													autocomplete="off" placeholder="Employee Address" name="comment" class="form-control"  required> -->
													
													<textarea rows="4" cols="50" name="comments" id="comments" minlength="2"
													placeholder="Comments"  class="form-control"
													 title="Enter comments" ></textarea>
													 <span id="cid" style="color:red;"></span>
													
												</div>
											</div>
											
											<div class="text-center ml-12">										
												<input type="button" class="btn btn-primary btn-sm" value="Submit" onclick="saveExitDetails()" id="submitid" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;">
												<input type="Reset" class="btn btn-default btn-sm" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;" value="Reset">
												<input type="button" onclick="goBack()"  class="btn btn-default btn-sm" value="skip" style="padding: 7px; background-color: #205081; color: white; line-height: 0.728571;">
													
												</div>										
										</form>	
								    </fieldset>
								</div>
							</div>
							
							<form action="searchlist" method="post" id="bformid" style="display: none;">
				<input type="text"  name="semp_type"  value="${semp_type}">
				<input type="text" name="susername"  value="${susername}">
  	        	<input type="text"  name="sfullname"  value="${sfullname}">
			    <input type="text"  name="spendingdocs"  value="${spendingdocs}">
			    <input type="text" name="s_subtype"  value="${s_subtype}">
			    <input type="hidden" name="empstatus" value="${sempstatus}">
				</form>
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
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="resources/preDefined/goback.js"></script>
<script type="text/javascript">
    	$(document).ready(function(){
    	    $("#terminationdate").datepicker({
       		    //maxDate: 0
   			})
    	    	.on('changeDate', function(e) {
    	            // Revalidate the date field
    	            $('#formid').formValidation('revalidateField', 'terminationdate');
    		});
    	    	
        	 $("#txtLWD").datepicker({
           		    //maxDate: 0
       			})
        	    	.on('changeDate', function(e) {
        	            // Revalidate the date field
        	            $('#formid').formValidation('revalidateField', 'txtLWD');
        		});
    	})
    </script>
	
 <script>

 function saveExitDetails() {
	 getsesVal().done(function(data){
			if(data!=""){
	 $('#formid').formValidation('validate');
		if( !$('#formid').data('formValidation').isValid())
			 {
			//alert("Please enter required fields");
			 }
		else
		{
	var candidate_id = $('#candidate_id').val();
     var txtLWD = $('#txtLWD').val();
     var terminationdate = $('#terminationdate').val();
     var exitreason = $('#exitreason').val();
     var comments = $('#comments').val();
           var enquiry = {
        		   exit_lwd : txtLWD,
        		   termMailRecievedOn : terminationdate,
        		   reasons : exitreason,
        		   comments : comments,
        		   candidate_id :candidate_id
           }
           $.ajax({
                   type : "post",
                   url : "saveExitDetails",
                   cache : false,
                   async : false,
                   contentType : 'application/json',
                   data : JSON.stringify(enquiry),
                   success : function(response) {
                    
                    if(response!=null || response!=""){
                    	alert(response);
       		   	  	 window.location.href="ViewExitDetails?candidate_id="+candidate_id+"";
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
       
    	txtLWD: {
             validators: {
                 notEmpty: {
                     message: 'Last Working Date is required'
                 },
                 regexp: {
                	 regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                     message: 'please enter last working date in MM/DD/YYYY format'
                 },
                 date: {
                     format: 'MM/DD/YYYY',
                     message: 'The invalid Date'
                 }
             }
         },
         
         terminationdate: {
             validators: {
                 notEmpty: {
                     message: 'Termination Email date is required'
                 },
                 regexp: {
                	 regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                     message: 'please enter Termination Email date in MM/DD/YYYY format'
                 },
                 date: {
                     format: 'MM/DD/YYYY',
                     message: 'The invalid Date'
                 }
             }
         },
         
        exitreason: {
            validators: {
              notEmpty: {
                        message: 'Please select Exit Reason'
                }
            }
        
        },
       
       comments: {
            validators: {
            
                stringLength: {
                    min: 2,
                    message: 'comments length should be min 2'
                },
                regexp: {
                   //  regexp: /^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$/,
                   regexp: /^[^\s_@.#&-(),'"]+([a-zA-Z0-9_@.#&(),'"\s-])*[a-zA-Z0-9_@.#&(),'"\s-]+$/,
                    message: 'comments can only consist of alphabetical and Space allowed but is not at beginning or end of the word'
                },
                
            }
        
        }
    }
   
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
<script type="text/javascript">
$('form').on('reset', function() {
	$('#formid').data('formValidation').resetForm();
	});
</script>
</body>
</html>

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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" />
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
							<h5 class="card-header">Update Exit Details</h5>
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
												<input type="hidden"  id="txtLWD1" value="${exitObj.exit_lwd}">
												<input type="hidden" id="txtTRD1" value="${exitObj.termMailRecievedOn}">
												<input type="hidden" id="reason1" value="${exitObj.reasons}">
												<input type="hidden" id="comments1" value="${exitObj.comments}">
												<input type="hidden" id="candidate_id" name="candidate_id" value="${exitObj.candidate_id}">	
												
											<input type="hidden"  name="susername"  value="${s_username}">
    	        							<input type="hidden"  name="sfullname"  value="${s_fullname}">
					    	        		<input type="hidden"  name="semptype"  value="${s_emptype}">
					    	        		<input type="hidden"  name="sssnno"  value="${s_ssnno}">
					    	        		<input type="hidden"  name="spendingdocs"  value="${s_pendingdocs}">
					    	        		<input type="hidden"  name="stype"  value="${s_type}">
																					
												<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;">*</Span>Last Working Date</label>
											<div class="col-lg-4">
											
												<input type="text" autocomplete="off" id="txtLWD" class="form-control text-left"   value="${exitObj.exit_lwd}" 
												title= "Please enter MM/DD/YY format" placeholder="MM/DD/YYYY" name="txtLWD" placeholder="Last Working Date" class="form-control"  required>
											</div>
											
											</div>
											
											 <div class="form-group row">
                                               <label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;">*</Span>Termination Email Date</label>
                                                 <div class="col-lg-4">
                                                  <input type="text" 
                                                     id="txtTRD"  autocomplete="off" name="txtTRD"  title= "Please enter MM/DD/YY format" placeholder="MM/DD/YYYY" autocomplete="off" 
                                                      class="form-control" value="${exitObj.termMailRecievedOn}"  required>
                                                    </div>
                                               </div>

											<div class="form-group row" id="reasonid">
												<label for="inputPassword" class="col-lg-4 control-label" ><Span style="color:red;">*</Span>Select
													Reasons Of Exiting</label>
												<div class="col-lg-4">
													<select id="reason" autocomplete="off" name="txttype" style="padding:6px 12px;"
													class="form-control" required >
													<c:choose>
											   <c:when test="${empty exitObj.reasons || exitObj.reasons==''}">
											        <option value="">--Select Reason--</option>
														<option value="Resignation">Resignation</option>
														<option value="Termination">Termination</option> 
														<option value="Client Released">Client Release</option>
														<option value="Absconding">Absconding</option>
														<option value="Project Completed">Project Completed</option>
														<option value="Others">Others</option> 
											    </c:when>
											    <c:otherwise>
										             <option value="${exitObj.reasons}" selected>${exitObj.reasons}</option>
													<option value="">--Select Reason--</option>
														<option value="Resignation">Resignation</option>
														<option value="Termination">Termination</option> 
														<option value="Client Released">Client Release</option>
														<option value="Absconding">Absconding</option>
														<option value="Project Completed">Project Completed</option>
														<option value="Others">Others</option> 
											    </c:otherwise>
											    </c:choose>
													</select>
												</div>
											</div>
											
                                            <div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;"></Span>Comments</label>
												<div class="col-lg-4">
													<!-- <input id="comment" type="text" pattern="^[a-zA-Z\s]+$" data-minlength="3" 
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="Employee Address" name="comment" class="form-control"  required> -->
													
													<textarea rows="4" cols="50" name="comments"  id="comments" 
													placeholder="Comments"
													class="form-control" title="Enter comments"  >
													${exitObj.comments}</textarea>
													
												</div>
											</div>
											
											<div class="text-center ml-12">								
											     <input type="button" id="submitid" class="btn btn-default btn-sm" onclick="updateExitDetails()" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Update" disabled/>
											<input type="button" onclick="goBack()" class="btn btn-default btn-sm" style="padding:7px;background-color:grey;color:white;line-height:0.728571;" value="Back">     
												</div>										
										</form>
										
								    </fieldset>
								</div>
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
<script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="resources/preDefined/goback.js"></script>
<script>
function goBack() {
	getsesVal().done(function(data){
		  if(data!=""){
	document.getElementById("bformid").submit();
		  }else{
				 window.location.href="loginpage";
			}
		});
	}
function updateExitDetails(){
	getsesVal().done(function(data){
		  if(data!=""){
	var candidate_id=$("#candidate_id").val();
	$("#submitid").attr("disabled",true);
	 var form = $('#formid')[0];
	     var data = new FormData(form);
		$.ajax({
	            url: "updateExitDetails", //this is the submit URL
	            type: "POST",
	            enctype: 'multipart/form-data',
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            success: function(response){
	   	        if(response!=null || response!=""){
		   	    // var mesg=response.message;
		   	     //var candidate_id=response.candidate_id;
		   	     alert(response);
		   	  document.getElementById("bformid").submit();
		   	  //	 window.location.href="ViewExitDetails?candidate_id="+candidate_id+"";
	   	   	         }
	   	          else{
	   	          window.location.href="loginpage";
	   	   	            }
	            	
	            }
	        });
		  }else{
				 window.location.href="loginpage";
			}
		});
	}

	    var txtLWD=document.getElementById('txtLWD1').value; 
	 	var txtTRD=document.getElementById('txtTRD1').value;
	 	var reason=document.getElementById('reason1').value;
	 	var comments=document.getElementById('comments1').value;

	 	$('#txtLWD,#txtTRD,#reason').on('change', function() {
		 	   if($('#txtLWD')==txtLWD || $('#txtTRD')==txtTRD || $('#reason')==reason){
		 		  $("#submitid").attr("disabled",true);
			 	   }
		 	   else{
		 		  $("#submitid").attr("disabled",false);
			 	   }
	 	  });

		$('#comments').keyup(function() {
		 	   if($('#comments')==comments){
		 		  $("#submitid").attr("disabled",true);
			 	   }
		 	   else{
		 		  $("#submitid").attr("disabled",false);
			 	   }
	 	  });
		 $("#txtTRD").datepicker({
	   		  //  maxDate: 0
				})
		    	.on('changeDate', function(e) {
		            // Revalidate the date field
		            $('#formid').formValidation('revalidateField', 'txtTRD');
			});
		    	
	    	 $("#txtLWD").datepicker({
	       		   // maxDate: 0
	   			})
	    	    	.on('changeDate', function(e) {
	    	            // Revalidate the date field
	    	            $('#formid').formValidation('revalidateField', 'txtLWD');
	    		});
		
	
    </script>

<script type="text/javascript">
 $(document).ready(function(){
		var textarea=$('#comments'); 
        var rows = textarea.val().split( "\n" );
        for ( var counter = 0; counter < rows.length; counter++)
        {
           rows[ counter ] = rows[ counter ].trim();
           if ( rows[ counter ].length == 0 )
           {
              rows.splice( counter, 1 );
              counter--;
           }
        }
        textarea.val(rows.join( "\n" ))
 });
</script>
<script>
$('#formid').formValidation({
    framework: 'bootstrap',
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
                     message: 'Please enter Last Working date in MM/DD/YYYY format'
                 },
                 date: {
                     format: 'MM/DD/YYYY',
                     message: 'Invalid Date'
                 }
             }
         },
         
         txtTRD: {
             validators: {
                 notEmpty: {
                     message: 'Termination Email is required'
                 },
                 regexp: {
                     regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                     message: 'Please enter Termination Email date in MM/DD/YYYY format'
                 },
                 date: {
                     format: 'MM/DD/YYYY',
                     message: 'Invalid Date'
                 }
             }
         },
         
         txttype: {
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
                    regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                    message: 'only spaces not allowed'
                },
                
            }
        
        }
    }
   
});
</script> 
<script type="text/javascript">
$('form').on('reset', function() {
	$('#formid').data('formValidation').resetForm();
	});
</script> 
</body>
</html>

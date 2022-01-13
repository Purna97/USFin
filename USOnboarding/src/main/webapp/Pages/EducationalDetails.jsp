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
		<div class="animated fadeIn">
		<div class="row">
		<div class="col-md-12">
			<div class="col">
				<div class="card">
					<h5 class="card-header">Add Education Details</h5>
				<div class="card-body">
				<c:if test="${candformsStatusDBObj.verifier_education_status eq 'Approved'}">
				<h6 style="text-align-last:end;color:blue">Add Education&nbsp;<button type="button"  
								style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success addButton" title="Add Employment" disabled>
								<i class="fa fa-plus"></i></button></h6><br>
				</c:if>
				<c:if test="${candformsStatusDBObj.verifier_education_status ne 'Approved'}">
					<h6 style="text-align-last:end;color:blue">Add Education&nbsp;<button type="button"  onclick="addEducation('${candidateId}')"
								style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success addButton" title="Add Employment">
								<i class="fa fa-plus"></i></button></h6><br>
								</c:if>
					<input type="hidden" id="candidate_id" name="candidate_id" value="${candidateId}">
					<input type="hidden" id="verifierEduStatus" name="verifierEduStatus" value="${candformsStatusDBObj.verifier_education_status}">
					
					<c:if test="${not empty educationDetailsList}"> 
					<div style="max-width:1150px;" >
					 <center><span><strong style="font-size:20px;color:red;">Education Details</strong></span></center>
					<table id="customerTable" class="table table-hover table-bordered"
						style="text-align: center;">
						<thead>
							<tr>
								<th style="display:none;">College</th>
								<th style="text-align: center">College</th>
								<th style="text-align: center">University</th>
								<th style="text-align: center">Graduation</th>
								<th style="text-align: center">Qualification</th>
								 <th style="text-align: center">Action</th>  
							</tr>
						</thead>
						<tbody>
						 <c:forEach var="educationList" items="${educationDetailsList}">
						 	 <tr>   
						 	  	<td id="typeOfEductd${educationList.education_id}" style="display:none">${educationList.type_of_degree}</td>
							    <td id="collegetd${educationList.education_id}">${educationList.college_name}</td>
							    <td id="universitytd${educationList.education_id}">${educationList.university_name}</td>
							    <td>${educationList.graduation}</td>
							     <td id="qualificationtd${educationList.education_id}">${educationList.qualification}</td>
							    <td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton" onclick="editEducation('${educationList.education_id}','${educationList.course_Type}','${educationList.student_id}',
											'${educationList.education_fromDate}','${educationList.education_toDate}','${educationList.graduation}','${educationList.major_subject}');">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</button></td> 
							</tr>
						  </c:forEach>
						</tbody>
					</table>
				</div>
			 	</c:if> 
			<c:if test="${educationDetailsList.size()<1}"> 
			<h4 style="text-align-last:center;color:blue">Education Details Not Yet Added, please click on Add Education</h4>
			</c:if>
			</div>
		</div>
		</div>
	</div>
	</div>
	
	<div class="text-center ml-3">
		<a class="btn btn-default" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;" href="bgvFormsUser">Back</a> 
	</div>
</div>
		 
		
		<center>
		<div class="modal fade" id="AddEducationModal" tabindex="-1"style="overflow-y: hidden;"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top:20px;">
			<div class="modal-dialog modal-lg" style="height:100%;" role="document">
				<div class="modal-content" style="width:140%;height:90%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Educational Details</b>
							</h5>
						</center>
					</div>
					<div class="modal-body" style="overflow-y: auto;">
					<fieldset>
										<form action="/" method="post" id="saveEducationDetailsForm" class="form-horizontal" enctype="multipart/form-data" autocomplete="off">
	                                          <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>College Name and Address</label>
												<div class="col-sm-4">
													<textarea id="collegeNameAddr" type="text" title="only alphabets are allowed" minlength="2" maxlength="200"
													placeholder="College Name and Address" name="collegeNameAddr" class="form-control"  required></textarea>
												</div>
											</div>
											
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>University Name and Address</label>
												<div class="col-sm-4">
												<textarea type="text" name="universityNameAddr" id="universityNameAddr" minlength="2" maxlength="200"
													 placeholder="University Name and Address"  class="form-control"></textarea>
												</div>
											  </div> 
											
											 <div class="form-group row">
											<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Course Type</label>
											   <div class="col-sm-6">
											   		<label>Full Time</label>&nbsp;<input type="radio" name="courseType" value="Full Time" required/>&nbsp;&nbsp;<label>Part Time</label>&nbsp;<input type="radio" name="courseType" value="Part Time" />&nbsp;&nbsp;<label>Correspondence/Distance learning</label>&nbsp;&nbsp;<input type="radio" name="courseType" value="Correspondence/Distance learning" />
													 <br>
												</div>
										    </div>
	                                        
											<div class="form-group row">
											<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Graduation Period</label>
												<!-- <label>From</label> -->
												<div class="col-sm-3">
													<input id="fromDate" type="text"
													 placeholder="From Date" name="fromDate" class="form-control" onkeydown="return false" required>
												</div>
												<!-- <label>To</label> -->
												<div class="col-sm-3">
													<input id="toDate" type="text" disabled
													 placeholder="To Date" name="toDate" class="form-control" onkeydown="return false" required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Graduated</label>
												<div class="col-sm-4">
												<select class="form-control" id="graduatedYear" required name="graduatedYear">
													<option value="">Select Year</option>
													</select>
												</div>
											  </div>
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Student Id No./Enrollment No.</label>
												<div class="col-sm-4">
												<input type="text" name="enrollNo" id="enrollNo" maxlength="12"
													 placeholder="Student Id No./Enrollment No."  class="form-control">
												</div>
											  </div>
											 
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Type of Degree</label>
													<div class="col-sm-4">
														<select class="form-control dropdown" id="typeofeducation"
															name="typeofeducation">
															<option value="" selected="selected" disabled="disabled">--select one --</option>
															<option value="No formal education">No formal education</option>
															<option value="Primary education">Primary education</option>
															<option value="Secondary education">Secondary education or high school</option>
															<option value="GED">GED</option>
															<option value="Vocational qualification">Vocational	qualification</option>
															<option value="Bachelor's degree">Bachelor's degree</option>
															<option value="Master's degree">Master's degree</option>
															<option value="Doctorate or higher">Doctorate or
																higher</option>
														</select>
													</div>
											</div>
											<!-- <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Graduation Date</label>
												<div class="col-sm-4">
													<input id="gradDate" type="text" minlength="8" maxlength="80"
													 placeholder="Graduation Date" name="gradDate" class="form-control"  required>
												</div>
											</div> -->
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Subject Major</label>
												<div class="col-sm-4">
													<input id="subMajor" type="text" minlength="2" maxlength="80"
													 placeholder="Subject Major" name="subMajor" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Qualification</label>
												<div class="col-sm-4">
													<input id="qualification" type="text" minlength="2" maxlength="80"
													 placeholder="Qualification" name="qualification" class="form-control"  required>
												</div>
											</div>
											<div class="text-center ml-3">
												<input type="button" class="btn btn-primary btn-sm" id="btnSubmit" value="Save" onclick="btnClick()">
												<button type="button" id="btnResetId" class="btn btn-default" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;">Reset</button> 
											</div>
										</form>
									</fieldset>
					
					</div>
				</div>
			</div>
		</div>
	</center>
	
	<center>
		<div class="modal fade" id="EditEducationModal" tabindex="-1"style="overflow-y: hidden;"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top:20px;">
			<div class="modal-dialog modal-lg" style="height:100%;" role="document">
				<div class="modal-content" style="width:140%;height:90%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" id="closeEditEducationModal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Educational Details</b>
							</h5>
						</center>
					</div>
					<div class="modal-body" style="overflow-y: auto;">
					<fieldset>
										<form action="/" method="post" id="updateEducationDetailsForm" class="form-horizontal" enctype="multipart/form-data" autocomplete="off">
										<input type="hidden" id="ededucationId" name="ededucationId">
										<input type="hidden" id="edcollegeNameAddr1"> <input type="hidden" id="eduniversityNameAddr1"> 
  										<input type="hidden" id="edfromDate1"> <input type="hidden" id="edtoDate1"> 
 										 <input type="hidden" id="edgraduatedYear1"> <input type="hidden" id="edenrollNo1">
 										  <input type="hidden" id="edsubMajor1"> <input type="hidden" id="edqualification1"> 
  											 <input type="hidden" id="edcourseTypeId"><input type="hidden" id="edtypeofeducation1"> 
										
	                                          <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>College Name and Address</label>
												<div class="col-sm-4">
													<textarea id="edcollegeNameAddr" type="text" title="only alphabets are allowed" minlength="2" maxlength="200"
													placeholder="College Name and Address" name="edcollegeNameAddr" class="form-control"  required></textarea>
												</div>
											</div>
											
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>University Name and Address</label>
												<div class="col-sm-4">
												<textarea type="text" name="eduniversityNameAddr" id="eduniversityNameAddr" minlength="2" maxlength="200"
													 placeholder="University Name and Address"  class="form-control"></textarea>
												</div>
											  </div> 
											
											 <div class="form-group row">
											<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Course Type</label>
											   <div class="col-sm-6">
											   		<label>Full Time</label>&nbsp;<input type="radio" id="edcourseType1" name="edcourseType" value="Full Time" required/>&nbsp;&nbsp;<label>Part Time</label>&nbsp;<input type="radio"  id="edcourseType2"  name="edcourseType" value="Part Time" />&nbsp;&nbsp;<label>Correspondence/Distance learning</label>&nbsp;&nbsp;<input type="radio" id="edcourseType3" name="edcourseType" value="Correspondence/Distance learning" />
													 <br>
												</div>
										    </div>
	                                        
											<div class="form-group row">
											<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Graduation Period</label>
												<!-- <label>From</label> -->
												<div class="col-sm-3">
													<input id="edfromDate" type="text"
													 placeholder="From Date"  name="edfromDate" class="form-control" onkeydown="return false" required>
												</div>
												<!-- <label>To</label> -->
												<div class="col-sm-3">
													<input id="edtoDate" type="text" 
													 placeholder="To Date" name="edtoDate" class="form-control"  onkeydown="return false" required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Graduated</label>
												<div class="col-sm-4">
												<select class="form-control" id="edgraduatedYear" required name="edgraduatedYear">
													<option value="">Select Year</option>
													</select>
												</div>
											  </div>
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Student Id No./Enrollment No.</label>
												<div class="col-sm-4">
												<input type="text" name="edenrollNo" id="edenrollNo" maxlength="12"
													 placeholder="Student Id No./Enrollment No."  class="form-control">
												</div>
											  </div>
											 
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Type of Degree</label>
													<div class="col-sm-4">
														<select class="form-control dropdown" id="edtypeofeducation"
															name="edtypeofeducation">
															<option value="" selected="selected" disabled="disabled">--select one --</option>
															<option value="No formal education">No formal education</option>
															<option value="Primary education">Primary education</option>
															<option value="Secondary education">Secondary education or high school</option>
															<option value="GED">GED</option>
															<option value="Vocational qualification">Vocational	qualification</option>
															<option value="Bachelor's degree">Bachelor's degree</option>
															<option value="Master's degree">Master's degree</option>
															<option value="Doctorate or higher">Doctorate or
																higher</option>
														</select>
													</div>
											</div>
											<!-- <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Graduation Date</label>
												<div class="col-sm-4">
													<input id="gradDate" type="text" minlength="8" maxlength="80"
													 placeholder="Graduation Date" name="gradDate" class="form-control"  required>
												</div>
											</div> -->
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Subject Major</label>
												<div class="col-sm-4">
													<input id="edsubMajor" type="text" minlength="2" maxlength="80"
													 placeholder="Subject Major" name="edsubMajor" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Qualification</label>
												<div class="col-sm-4">
													<input id="edqualification" type="text" minlength="2" maxlength="80"
													 placeholder="Qualification" name="edqualification" class="form-control"  required>
												</div>
											</div>
											<div class="text-center ml-3">
												<button type="button" class="btn btn-primary btn-sm" id="btnUpdate" onclick="btnUpdateClick()" disabled>Save Changes</button>
												<button type="button" id="closeEditEducationModal1"class="btn btn-default btn-sm" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;">Close</button> 
											</div>
										</form>
									</fieldset>
					</div>
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
<script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script src="resources/preDefined/goback.js"></script>
<script type="text/javascript">
$("#closeEditEducationModal").click(function(event) {
	getsesVal().done(function(data){
		if(data!=""){
	$('#EditEducationModal').modal('hide');
   var candId=$('#candidate_id').val();
   window.location.href="educationaldetails?candidateId="+candId+"";
		}else{ window.location.href="loginpage";}});
});
$("#closeEditEducationModal1").click(function(event) {
	getsesVal().done(function(data){
		if(data!=""){
	$('#EditEducationModal').modal('hide');
   var candId=$('#candidate_id').val();
   window.location.href="educationaldetails?candidateId="+candId+"";
		}else{ window.location.href="loginpage";}});
});

function btnUpdateClick(){
	getsesVal().done(function(data){
		if(data!=""){
	$('#updateEducationDetailsForm').formValidation('validate');
	if( !$('#updateEducationDetailsForm').data('formValidation').isValid())
		 {
		 }
	else{
		       $("#btnUpdate").attr("disabled", true);
				var form = $('#updateEducationDetailsForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "updateEducationDetails", //this is the submit URL
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
	}else{ window.location.href="loginpage";}});
}
var date = new Date();
date.setDate(date.getDate()); 
$("#edfromDate").datepicker({
}).on('changeDate', function(selected) {
	 var minDate = new Date(selected.date.valueOf());
     $('#edtoDate').datepicker('setStartDate', minDate);
    $('#updateEducationDetailsForm').formValidation('revalidateField', 'edfromDate');
});	
$("#edtoDate").datepicker({
}).on('changeDate', function(selected) {
        var minDate = new Date(selected.date.valueOf());
        $('#edfromDate').datepicker('setEndDate', minDate);
    $('#updateEducationDetailsForm').formValidation('revalidateField', 'edtoDate');
});	

$("#fromDate").datepicker({
}).on('changeDate', function(selected) {
	 var minDate = new Date(selected.date.valueOf());
     $('#toDate').datepicker('setStartDate', minDate);
     $('#toDate').prop("disabled",false)
    $('#saveEducationDetailsForm').formValidation('revalidateField', 'fromDate');
});	
$("#toDate").datepicker({
}).on('changeDate', function(selected) {
        var minDate = new Date(selected.date.valueOf());
        $('#fromDate').datepicker('setEndDate', minDate);
    $('#saveEducationDetailsForm').formValidation('revalidateField', 'toDate');
});	

function editCustomer(id){
	window.location.href="editCustomer?id="+id+"";
}
function btnClick(){
	getsesVal().done(function(data){
		if(data!=""){
	$('#saveEducationDetailsForm').formValidation('validate');
	if( !$('#saveEducationDetailsForm').data('formValidation').isValid())
		 {
		 }
	else{
		  //document.getElementById("saveEducationDetailsForm").submit();
		  $("#btnSubmit").attr("disabled", true);
				var form = $('#saveEducationDetailsForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "saveEducationDetails", //this is the submit URL
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
		}else{ window.location.href="loginpage";}});
	}
$("#closePopupSave").click(function(event) {
	getsesVal().done(function(data){
		if(data!=""){
	$('#myModal').modal('hide');
	var candId=$('#candidate_id').val();
    window.location.href="educationaldetails?candidateId="+candId+"";
		}else{ window.location.href="loginpage";}});
});
</script>
<script type="text/javascript">
$('#saveEducationDetailsForm')
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
    	 collegeNameAddr: {
            validators: {
            	notEmpty: {
                    message: 'College Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 200,
                    message: 'College Name must be more than 2 and less than 200 characters long. '
                }
               /*  regexp: {
                	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                     message: 'College Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                } */
            }
        },
        universityNameAddr: {
            validators: {
            	notEmpty: {
                    message: 'University Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 200,
                    message: 'University Name must be more than 2 and less than 200 characters long. '
                }/* ,
                regexp: {
                	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                     message: 'University Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                } */
            }
        },
        qualification: {
            validators: {
            	notEmpty: {
                    message: 'Qualification is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Qualification must be more than 2 and less than 80 characters long. '
                },
                regexp: {
                	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                     message: 'Qualification accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                }
            }
        },
        graduatedYear:{
            validators: {
            	notEmpty: {
                    message: 'Please Choose Graduated Year'
                }
            }
        },
        typeofeducation:{
            validators: {
            	notEmpty: {
                    message: 'Please Choose Type'
                }
            }
        },
        courseType:{
            validators: {
            	notEmpty: {
                    message: 'Please Choose Course Type'
                }
            }
        },
        fromDate: {
            validators: {
                notEmpty: {
                    message: 'From Date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'please enter From Date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY', 
                    message: 'From Date is not a valid, please enter in MM/DD/YYYY format'
                }
            }
        },
        toDate: {
            validators: {
                notEmpty: {
                    message: 'To Date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'please enter To Date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY', 
                    message: 'To Date is not a valid, please enter in MM/DD/YYYY format'
                }
            }
        },
        enrollNo : {
            validators: {
            	isEmpty: {
                    message: 'EnrollNo is mandatory'
                },
                 stringLength: {
                    min: 5,
                    max: 12,
                    message: 'EnrollNo must be 5 alpha numerics'
                }, 
                regexp: {
                	regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                	//regexp: /[0-9]/,
                    message: 'EnrollNo accepts alpha numerics'
                }
            }
        },    
        subMajor:{
            validators: {
            	notEmpty: {
                    message: 'Major Subject is mandatory'
            	 },
            	 stringLength: {
                     min: 2,
                     max: 80,
                     message: 'Major Subject must be more than 2 and less than 80 characters long'
                 },
                 regexp: {
               	  regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                     message: 'Major Subject accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                 }
           }
      }
   }
})
.on('error.validator.bv', function(e, data) {
            data.element
                .data('bv.messages')
                .find('.help-block[data-bv-for="' + data.field + '"]').hide()
                .filter('[data-bv-validator="' + data.validator + '"]').show();
 });
 
$('#updateEducationDetailsForm')
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
    edcollegeNameAddr: {
        validators: {
        	notEmpty: {
                message: 'College Name is mandatory'
            },
            stringLength: {
                min: 2,
                max: 100,
                message: 'College Name must be more than 2 and less than 100 characters long. '
            }/* ,
            regexp: {
            	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                 message: 'College Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
            } */
        }
    },
    eduniversityNameAddr: {
        validators: {
        	notEmpty: {
                message: 'University Name is mandatory'
            },
            stringLength: {
                min: 2,
                max: 100,
                message: 'University Name must be more than 2 and less than 100 characters long. '
            },
            regexp: {
            	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                 message: 'University Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
            }
        }
    },
    edqualification: {
        validators: {
        	notEmpty: {
                message: 'Qualification is mandatory'
            },
            stringLength: {
                min: 2,
                max: 100,
                message: 'Qualification must be more than 2 and less than 100 characters long. '
            },
            regexp: {
            	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                 message: 'Qualification accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
            }
        }
    },
    edgraduatedYear:{
        validators: {
        	notEmpty: {
                message: 'Please Choose Graduated Year'
            }
        }
    },
    edtypeofeducation:{
        validators: {
        	notEmpty: {
                message: 'Please Choose Type'
            }
        }
    },
    edcourseType:{
        validators: {
        	notEmpty: {
                message: 'Please Choose Course Type'
            }
        }
    },
    edfromDate: {
        validators: {
            notEmpty: {
                message: 'From Date is required'
            },
            regexp: {
            	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                message: 'please enter From Date in MM/DD/YYYY format'
            },
            date: {
                format: 'MM/DD/YYYY', 
                message: 'From Date is not a valid, please enter in MM/DD/YYYY format'
            }
        }
    },
    edtoDate: {
        validators: {
            notEmpty: {
                message: 'To Date is required'
            },
            regexp: {
            	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                message: 'please enter To Date in MM/DD/YYYY format'
            },
            date: {
                format: 'MM/DD/YYYY', 
                message: 'To Date is not a valid, please enter in MM/DD/YYYY format'
            }
        }
    },
    edenrollNo : {
        validators: {
        	isEmpty: {
                message: 'EnrollNo is mandatory'
            },
             stringLength: {
                min: 5,
                max: 12,
                message: 'EnrollNo must be 5 alpha numerics'
            },
            regexp: {
            	regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
            	//regexp: /[0-9]/,
                message: 'EnrollNo accepts alpha numerics'
            }
        }
    },    
    edsubMajor:{
        validators: {
        	notEmpty: {
                message: 'Major Subject is mandatory'
        	 },
        	 stringLength: {
                 min: 2,
                 max: 100,
                 message: 'Major Subject must be more than 2 and less than 100 characters long'
             },
             regexp: {
           	  regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                 message: 'Major Subject accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
             }
       }
     }
   }
})
.on('error.validator.bv', function(e, data) {
            data.element
                .data('bv.messages')
                .find('.help-block[data-bv-for="' + data.field + '"]').hide()
                .filter('[data-bv-validator="' + data.validator + '"]').show();
 });
</script>
<script type="text/javascript">
function loadMonthYear() {
	var dt = new Date();
	var cur_month = dt.getMonth();
	var prev_month = 0;
	if (cur_month != 0) {
		prev_month = cur_month - 1;
	}
	/* var mlist = [  "January", "February", "March",
			"April", "May", "June", "July", "August", "September",
			"October", "November", "December" ];
	for (var i = 0; i < mlist.length; i++) {
		$('#startedMonth').append(
				$('<option/>').attr("value", mlist[i]).text(mlist[i]));
		$('#workedTillMonth').append(
				$('<option/>').attr("value", mlist[i]).text(mlist[i]));
		$('#edstartedMonth').append(
				$('<option/>').attr("value", mlist[i]).text(mlist[i]));
		$('#edworkedTillMonth').append(
				$('<option/>').attr("value", mlist[i]).text(mlist[i]));
	} */
	var myDate = new Date();
	var year = myDate.getFullYear();
	/* for(y = year-50; y <= year + 1; y++) {
        var optn = document.createElement("OPTION");
        optn.text = y;
        optn.value = y;
        document.getElementById('graduatedYear').options.add(optn);
   } */
	for (var y = myDate.getFullYear(); y >= 1950; y--) {
		    var optn = document.createElement("OPTION");
	        optn.text = y;
	        optn.value = y;
	        document.getElementById('graduatedYear').options.add(optn);
	}
	 for(y = year-50; y <= year + 1; y++) {
        var optn = document.createElement("OPTION");
        optn.text = y;
        optn.value = y;
        document.getElementById('edgraduatedYear').options.add(optn);
   } 
}
window.onload = loadMonthYear;
function addEducation(){
	getsesVal().done(function(data){
		if(data!=""){
	$('#saveEducationDetailsForm').bootstrapValidator('resetForm', true);
	$('#AddEducationModal').modal('show');
		}else{ window.location.href="loginpage";}});
	}
function editEducation(education_id,course_Type,student_id,education_fromDate,
		education_toDate,graduation,major_subject){
	getsesVal().done(function(data){
		if(data!=""){
	$('#edtypeofeducation1').val($('#typeOfEductd'+education_id).html());
    $('#edcollegeNameAddr,#edcollegeNameAddr1').val($('#collegetd'+education_id).html());
    $('#eduniversityNameAddr,#eduniversityNameAddr1').val($('#universitytd'+education_id).html());
    $('#edqualification,#edqualification1').val($('#qualificationtd'+education_id).html());
     
	$('#ededucationId').val(education_id);
//	$('#edcollegeNameAddr,#edcollegeNameAddr1').val(college_name);
	//$('#eduniversityNameAddr,#eduniversityNameAddr1').val(university_name);
	$('#edfromDate,#edfromDate1').val(education_fromDate);
	$('#edtoDate,#edtoDate1').val(education_toDate);
	$('#edgraduatedYear1').val(graduation);
//	$('#edtypeofeducation1').val(type_of_degree);
	$('#edenrollNo,#edenrollNo1').val(student_id);
	$('#edsubMajor,#edsubMajor1').val(major_subject);
	$('#edcourseTypeId').val(course_Type);

		var $dropdown1 = $("select[name='edgraduatedYear']");
		 $dropdown1.find('option[value="' + graduation + '"]').attr('selected', true);
		
		var $dropdown2 = $("select[name='edtypeofeducation']");
		 $dropdown2.find('option[value="' + $('#typeOfEductd'+education_id).html() + '"]').attr('selected', true);
		  
	if(course_Type=='Full Time'){
		$('#edcourseType1').prop("checked",true)
		}
	else if(course_Type=='Part Time'){
		   $('#edcourseType2').prop("checked",true)
		 }else{
		   $('#edcourseType3').prop("checked",true)
		}
	
	var candId=$('#candidate_id').val();
	
	var verifier_education_status=$('#verifierEduStatus').val();
	//alert(verifier_education_status);
	 if(verifier_education_status=='Approved'){
		 $('#updateEducationDetailsForm input').attr('disabled', 'disabled');
		 $('input[type="text"], textarea,select').each(function(){
		     $(this).attr('disabled','disabled');
		  });
		 $("#btnUpdate").attr("disabled",true).prop("title","Manager status is approved, can't update details");
	   }
	 $('#EditEducationModal').modal('show');
		}else{ window.location.href="loginpage";}});
	/* $.ajax({
    	type : "GET",
        asyn : false,
        contentType: "application/json", // NOT dataType!
        url  :"getCandidateFormsStatusById",
        data:{"candidateId":candId},
        success  : function(response){
        	 if(response!=null || response!=""){
				 if(response.verifier_education_status=='Approved'){
					 $('#updateEducationDetailsForm input').attr('disabled', 'disabled');
					 $('input[type="text"], textarea,select').each(function(){
					     $(this).attr('disabled','disabled');
					  });
					 $("#btnUpdate").attr("disabled",true).prop("title","Manager status is approved, can't update details");
				   }
	   	        }
	   	      else{
	   	          window.location.href="loginpage";
	   	   	      }
        	 $('#EditEducationModal').modal('show');
            }
	    }); */
	
}	
/* $('form').on('reset', function() {
	$('#saveEmploymentDetailsForm').data('formValidation').resetForm();
	}); */
/* $('input[name="cpnumber"]').mask('999-999-9999');
$('input[name="acpnumber"]').mask('999-999-9999');
$('input[name="othr_cpnumber[]"]').mask('999-999-9999');
$('input[name="othr_acpnumber[]"]').mask('999-999-9999'); */
</script> 
<script type="text/javascript">
$('#edcollegeNameAddr').on('keyup', function() {
    if($('#edcollegeNameAddr').val()==$('#edcollegeNameAddr1').val())
           {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}   });
$('#eduniversityNameAddr').on('keyup', function() {
    if($('#eduniversityNameAddr').val()==$('#eduniversityNameAddr1').val())
           {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}   });
$('#edgraduatedYear').on('change', function() {
           if($('#edgraduatedYear').val()==$('#edgraduatedYear1').val())
                  {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} });
$('#edenrollNo').on('keyup', function() {
           if($('#edenrollNo').val()==$('#edenrollNo1').val())
                  {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
$('#edqualification').on('keyup', function() {
 if($('#edqualification').val()==$('#edqualification1').val())
        {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
$('#edfromDate').on('change', function() {
           if($('#edfromDate').val()==$('#edfromDate1').val())
                  {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
$('#edtoDate').on('change', function() {
    if($('#edtoDate').val()==$('#edtoDate1').val())
           {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });
           
$('#edtypeofeducation').on('change', function() {
    if($('#edtypeofeducation').val()==$('#edtypeofeducation1').val())
           {document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;}  });           
$("input[name='edemploymentType']").on('click', function() {
 if($("input[name='edcourseType']:checked").val()==$('#edcourseTypeId').val())
	{
 	 document.getElementById('btnUpdate').disabled=true;
	}else if($("input[name='edcourseType']:checked").val()!=$('#edcourseTypeId').val()){
		document.getElementById('btnUpdate').disabled=false;
	}
});
$('input').attr("autocomplete", 'off');
$("#btnResetId").click(function(event) {
	$('#saveEducationDetailsForm').bootstrapValidator('resetForm', true);
});
$('#AddEducationModal').on('shown.bs.modal', function()
{
	$('#toDate').prop("disabled",true)
	$('#saveEducationDetailsForm').bootstrapValidator('resetForm', true);
});

</script>
</body>
</html>
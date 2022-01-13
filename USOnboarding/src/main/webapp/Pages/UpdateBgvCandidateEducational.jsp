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
/* input:read-only {
  background-color: white;
}
 */
.form-control[readonly] {
    background-color: white;
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
							<center><h5 class="card-header">View Educational Details</h5></center>
							<div class="card-body">
								<div class="row">
									<div class="col-md-11 col-sm-12">
									<fieldset>
									<input type="hidden" id="candidate_id" name="candidate_id" value="${candidateId}">
									<input type="hidden" id="verifierEduStatus" name="verifierEduStatus" value="${candformsStatusDBObj.verifier_education_status}">
									
								<c:if test="${not empty educationDetailsList}"> 
					<div style="max-width:1150px;" >
					 <center><span><strong style="font-size:20px;color:red;"></strong></span></center>
					<table id="customerTable" class="table table-hover table-bordered"
						style="text-align: center;">
						<thead>
							<tr>
								<th style="display:none;">College</th>
								<th style="text-align: center;">ID</th>
								<th style="text-align: center;">College</th>
								<th style="text-align: center;">University</th>
								<th style="text-align: center;">Graduation</th>
								<th style="text-align: center;">Qualification</th>
								 <th style="text-align: center;">Action</th>  
							</tr>
						</thead>
						<tbody>
						 <c:forEach var="educationList" items="${educationDetailsList}">
						 	 <tr>   
						 	  	<td id="typeOfEductd${educationList.education_id}" style="display:none">${educationList.type_of_degree}</td>
						 	  	<td>${educationList.education_id}</td>
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
			 	</fieldset>
			 	</div>
			</div>
		</div>
</div>
				</div>
			</div>
			
			
			<form class='form form-horizontal validate-form'
						action="/" id="updateemploymentStatusForm" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="candidate_id" name="candidate_id" value="${candidateId}">
						  <input type="hidden" id="verEduStatus" value="${candformsStatusDBObj.verifier_education_status}">
			 <div class="form-group row">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Select Status</label>
									<div class="col-sm-4">
												<select id="capprstatus" name="status" class="form-control" required>
												<!-- <option value="">-Select Status-</option>
												<option value="Approved">Approve</option>
												<option value="Rejected">Reject</option>-->
												<c:choose>
												<c:when test="${candformsStatusDBObj.verifier_education_status eq 'Approved'}">
												<option value="Approved" ${'Approved' eq candformsStatusDBObj.verifier_education_status ? 'selected="selected"' : ''}>Approved</option>
												<option value="Rejected" ${'Rejected' eq candformsStatusDBObj.verifier_education_status ? 'selected="selected"' : ''}>Reject</option>
												</c:when>
												<c:when test="${candformsStatusDBObj.verifier_education_status eq 'Rejected'}">
												<option value="Approved" ${'Approved' eq candformsStatusDBObj.verifier_education_status ? 'selected="selected"' : ''}>Approve</option>
												<option value="Rejected" ${'Rejected' eq candformsStatusDBObj.verifier_education_status ? 'selected="selected"' : ''}>Rejected</option>
											</c:when>
											<c:otherwise>
												<option value="Approved" ${'Approved' eq candformsStatusDBObj.verifier_education_status ? 'selected="selected"' : ''}>Approve</option>
												<option value="Rejected" ${'Rejected' eq candformsStatusDBObj.verifier_education_status ? 'selected="selected"' : ''}>Reject</option>
											</c:otherwise>
												</c:choose> 
												</select>
											</div>
								</div> 
					       <div class="form-group row">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Comments</label>
									<div class="col-sm-4">
										<textarea type="text"  id="candicomments" name="comment" rows="4" cols="50" minlength="2"
										 placeholder="Enter Comment"  class="form-control" required></textarea>
									</div>
									<div class="col-sm-0">
									<button type="button" style='letter-spacing: 1px; background-color: #15aabf; color: white;' id="CchistoryId" onclick="viewCommentHistory()" modal"type="button" class="btn btn-info btn-sm addButton"   data-toggle="modal" ><i class="fa fa-history"></i></button>
									</div>
							</div> 
							
							<div class="text-center ml-2">
								<button type="button" class="btn btn-info btn-sm" onclick="updateeducationstatus()">Submit</button>
								<a class="btn btn-info btn-sm"  id="btn-colorb" href="contractspanel">Cancel</a>
								</div>
		</form>
		<div class="modal fade" id="commenthistoryModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 160px;">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content" style="width:100%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Comment History Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="/" id="saveCommentsForm" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<div class="modal-body">							
					       <table id="CommentHistoryTable" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>Status</th>
								<th>Comments</th>
								<th>Submitted Date</th>
								<th>Submitted By</th>
								</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<center>
		<div class="modal fade" id="EditEducationModal" tabindex="-1"style="overflow-y: hidden;"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top:20px;">
			<div class="modal-dialog modal-lg" style="height:100%;" role="document">
				<div class="modal-content" style="width:138%;height:90%;">
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
										<form action="/" method="post" id="updateEducationDetailsForm" class="form-horizontal" enctype="multipart/form-data">
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
											   <input id="edcourseType" type="text" 
													 name="edcourseType" class="form-control"  required>
													 <br>
												</div>
										    </div>
	                                        
											<div class="form-group row">
											<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Graduation Period</label>
												<!-- <label>From</label> -->
												<div class="col-sm-3">
													<input id="edfromDate" type="text"
													 placeholder="From Date" name="edfromDate" class="form-control"  required>
												</div>
												<!-- <label>To</label> -->
												<div class="col-sm-3">
													<input id="edtoDate" type="text" 
													 placeholder="To Date" name="edtoDate" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Graduated</label>
												<div class="col-sm-4">
												<input type="text" class="form-control" id="edgraduatedYear" required name="edgraduatedYear">
												</div>
											  </div>
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Student Id No./Enrollment No.</label>
												<div class="col-sm-4">
												<input type="text" name="edenrollNo" id="edenrollNo" maxlength="10"
													 placeholder="Student Id No./Enrollment No."  class="form-control">
												</div>
											  </div>
											 
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Type of Degree</label>
													<div class="col-sm-4">
														<input type="text"class="form-control dropdown" id="edtypeofeducation"
															name="edtypeofeducation">
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
</div>
<script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
<script src="resources/preDefined/goback.js"></script>
<script type="text/javascript">

$("#closeEditEducationModal").click(function(event) {
	getsesVal().done(function(data){
		if(data!=""){
	$('#EditEducationModal').modal('hide');
   var candId=$('#candidate_id').val();
   window.location.href="vieweducationaldetails?candidateId="+candId+"";
		}else{ window.location.href="loginpage";}});
});

function editEducation(education_id,course_Type,student_id,education_fromDate,
		education_toDate,graduation,major_subject){
	getsesVal().done(function(data){
		if(data!=""){
	$('#edtypeofeducation').val($('#typeOfEductd'+education_id).html());
    $('#edcollegeNameAddr').val($('#collegetd'+education_id).html());
    $('#eduniversityNameAddr').val($('#universitytd'+education_id).html());
    $('#edqualification').val($('#qualificationtd'+education_id).html());
	$('#edfromDate').val(education_fromDate);
	$('#edtoDate').val(education_toDate);
	$('#edgraduatedYear').val(graduation);
	$('#edenrollNo').val(student_id);
	$('#edsubMajor').val(major_subject);
	$('#edcourseType').val(course_Type);
	var candId=$('#candidate_id').val();
	var verifier_education_status=$('#verifierEduStatus').val();
	//alert(verifier_education_status);
	 if(verifier_education_status=='Approved'){
		 $('#updateEducationDetailsForm input').attr('disabled', 'disabled');
		 $('input[type="text"], textarea,select').each(function(){
		     $(this).attr('disabled','disabled');
		  });
		// $("#btnUpdate").attr("disabled",true).prop("title","Manager status is approved, can't update details");
	   }
		$('#capprstatus,#candicomments').prop('readonly',false);
	 $('#EditEducationModal').modal('show');
		}else{ window.location.href="loginpage";}});
/* 	$.ajax({
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
				  }
	   	        }
	   	      else{
	   	          window.location.href="loginpage";
	   	   	      }
        	 $('#EditEducationModal').modal('show');
            }
	    }); */
	
}	

/* $('#saveEducationDetailsForm input').attr('readonly', 'readonly');
$('input[type="text"], textarea').each(function(){
    $(this).attr('readonly','readonly');
 }); */
$('#candicomments').prop('readonly',false);
function updateeducationstatus(){
	getsesVal().done(function(data){
		if(data!=""){
	var statusId=$("#capprstatus").val();
	var commentId=$("#candicomments").val();
   var candidateId=$("#candidate_id").val();
	/*$("#CbgcCandidateId").val(candidateId); */
	
	if(statusId!="" && commentId!=""){
		var form = $('#updateemploymentStatusForm')[0];
		var data = new FormData(form);
		$.ajax({
			url : "updateeducationstatus", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(data) {
				 if(data!=null || data!=""){
					 alert(data);
                    /*  loadContractPanel();
                     $('#candidateModal').modal('hide'); */
                     $('<a href="vieweducationaldetails?candidateId='+candidateId+'"></a>')[0].click();  
	   	   	         }
	   	   	      else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			}
		});
	}else{
		if (statusId == "") {
			alert("Please select  status");
			
		}else if (commentId == "") {
			alert("Please enter comments");
		}
		//$("#candicomments").focus();
	}
		}else{ window.location.href="loginpage";}});
}

var tablech = $('#CommentHistoryTable').DataTable({
	 "order": [[0, "desc"]],
	  lengthMenu: [[5, 10, 15, -1], [5, 10, 15, "All"]],
	  bLengthChange: true,
	  paging: true
	});
function viewCommentHistory(){
	getsesVal().done(function(data){
		if(data!=""){
	var candidateId=$("#candidate_id").val();
	 $.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "application/json", // NOT dataType!
	        url  :"viewformshistory",
	        data:{"candidateId":candidateId,"formtype":"Education"},
	        success  : function(response){
	        	 if (tablech) tablech.clear();
		         $('#CommentHistoryTable').dataTable().fnClearTable();
	        		 if(response!=""){
		            	  for(var i=0;i<response.length;i++){
		            		  var submittedby;
		            		  if(response[i].posted_by!='' || response[i].posted_by!=0 || response[i].posted_by!=null){
		            			  submittedby=response[i].posted_by;
		            		  }else{
		            			  submittedby=response[i].candidatename;
		            		  }
		            		  tablech.row.add([
		            			''+response[i].commentid+'',
		            			''+response[i].status+'',
		                    	''+response[i].comments+'',
		                      	''+response[i].subdate+'',
		                      	''+submittedby+''
		                     ]).draw();    
	        	    }
	            }
	        $('#commenthistoryModal').modal('show');
	        }		
	});
		}else{ window.location.href="loginpage";}});
}

var verEduStatus=$("#verEduStatus").val();
var $dropdown4 = $("select[name='status']");
 $dropdown4.find('option[value="' + verEduStatus + '"]').attr('selected', true);
$('input').attr("autocomplete", 'off');
</script>
</body>
</html>
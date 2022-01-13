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
							<h5 class="card-header">View Employment Details</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-md-11 col-sm-12">
									<fieldset>
										<!-- <form action="/" method="post" id="updateEmploymentDetailsForm" class="form-horizontal" enctype="multipart/form-data"> -->
											<!--  <legend><i class="fa fa-line-chart"></i>Employment Details</legend>  -->
									<input type="hidden" name="candidate_id" id="candidate_id" value="${candidateId}">
									<input type="hidden" name="profileId" id="profileId" value="${profileId}">
									<c:if test="${not empty employmentDetailsList}"> 
					<div style="max-width:1150px;" >
					 <center><span><strong style="font-size:20px;color:red;"></strong></span></center>
					<table id="customerTable" class="table table-hover table-bordered"
						style="text-align: center;">
						<thead>
							<tr>
								<th style="text-align: center">Company Name</th>
								<th style="text-align: center">Designation</th>
								<th style="text-align: center">Started Year</th>
								<th style="text-align: center">Started Month</th>
								<th style="text-align: center">End Year</th>
								<th style="text-align: center">End Month</th>
							    <th style="text-align: center">Address</th>
								<!-- <th style="text-align: center">Employment</th> -->
								 <th style="text-align: center">Action</th>  
							</tr>
						</thead>
						<tbody>
						 <c:forEach var="employmentList" items="${employmentDetailsList}">
						 	 <tr>   
							    <td>${employmentList.company_name}</td>
							    <td>${employmentList.positionheld}</td>
							    <td>${employmentList.startedYear}</td>
							     <td>${employmentList.startedMonth}</td>
							     <td>${employmentList.workedTillYear}</td>
							     <td>${employmentList.workedTillMonth}</td>
							    <td>${employmentList.line1} <c:if test="${not empty employmentList.line2}">, ${employmentList.line2} </c:if>, ${employmentList.city}, ${employmentList.state}, ${employmentList.zipcode}</td>
							    
							   <%--  <td>${employmentList.employmentType}</td> --%>
							    <td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton" onclick="editEmployment('${employmentList.employment_id}');">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</button></td> 
							</tr>
						  </c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>
	     <!--   </form> -->
									</fieldset>
								</div>
							</div>
						</div>
					</div>
					<form class='form form-horizontal validate-form'
						action="/" id="updateemploymentStatusForm" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						
						<input type="hidden" id="CbgcCandidateId" name="candidateId">
			  <input type="hidden" id="verEmpStatus" value="${candformsStatusDBObj.verifier_employment_status}">
			 <div class="form-group row">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Select Status</label>
									<div class="col-sm-4">
												<select id="capprstatus" name="status" class="form-control" required>
												<option value="">-Select Status-</option>
												<!-- <option value="Approved">Approve</option>
												<option value="Rejected">Reject</option>-->
												 <c:choose>
												<c:when test="${candformsStatusDBObj.verifier_employment_status eq 'Approved'}">
												<option value="Approved" ${'Approved' eq candformsStatusDBObj.verifier_employment_status ? 'selected="selected"' : ''}>Approved</option>
												<option value="Rejected" ${'Rejected' eq candformsStatusDBObj.verifier_employment_status ? 'selected="selected"' : ''}>Reject</option>
												</c:when>
												<c:when test="${candformsStatusDBObj.verifier_employment_status eq 'Rejected'}">
												<option value="Approved" ${'Approved' eq candformsStatusDBObj.verifier_employment_status ? 'selected="selected"' : ''}>Approve</option>
												<option value="Rejected" ${'Rejected' eq candformsStatusDBObj.verifier_employment_status ? 'selected="selected"' : ''}>Rejected</option>
											</c:when>
											<c:otherwise>
												<option value="Approved" ${'Approved' eq candformsStatusDBObj.verifier_employment_status ? 'selected="selected"' : ''}>Approve</option>
												<option value="Rejected" ${'Rejected' eq candformsStatusDBObj.verifier_employment_status ? 'selected="selected"' : ''}>Reject</option>
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
									<button type="button" style='letter-spacing: 1px; background-color: #15aabf; color: white;' id="CchistoryId" onclick="viewCommentHistory()" data-toggle="modal" type="button" class="btn btn-info btn-sm addButton" data-toggle="modal" ><i class="fa fa-history"></i></button>
									</div>
							</div> 
							
							<div class="text-center ml-3">
								<button type="button" class="btn btn-info btn-sm" onclick="updateemploymentstatus()">Submit</button>
								<a class="btn btn-info btn-sm" id="btn-colorb" href="contractspanel">Back</a>
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
		<div class="modal fade" id="EditEmploymentModal" tabindex="-1"style="overflow-y: hidden;"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top:20px;">
			<div class="modal-dialog modal-lg" style="height:100%;" role="document">
				<div class="modal-content" style="width:130%;height:90%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal" 
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button> -
						
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Employment Details</b>
							</h5>
						</center>
					</div>
					<div class="modal-body" style="overflow-y: auto;">
					<fieldset>
										<form action="/" method="post" id="updateEmploymentDetailsForm" class="form-horizontal" enctype="multipart/form-data">
										
										<input type="hidden" id="edemploymentId" name="employment_id">
										<input type="hidden" id="edcontactId" name="contact_id">
										
									<!-- 	 <input type="hidden" id="edcompany_name1"> 
										  <input type="hidden" id="edpositionheld1"> <input type="hidden" id="edcompany_tele1"> 
										  <input type="hidden" id="edreported_to_name1"> <input type="hidden" id="edreported_to_position1">
										   <input type="hidden" id="edhrmgr1"> <input type="hidden" id="edline11"> <input type="hidden" id="edline21"> 
										   <input type="hidden" id="edcity1"> <input type="hidden" id="edstate1"> <input type="hidden" id="edzipcode1"> 
										   <input type="hidden" id="edcpname1"> <input type="hidden" id="edcpemail1"> <input type="hidden" id="edcpnumber1"> 
										   <input type="hidden" id="edacpname1"> <input type="hidden" id="edacpnumber1"> <input type="hidden" id="edstartedYear1">
										    <input type="hidden" id="edstartedMonth1"> <input type="hidden" id="edworkedTillYear1"> 
										    <input type="hidden" id="edworkedTillMonth1"> <input type="hidden" id="employmentTypeEd"> -->
									
	                                         <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Company Name</label>
												<div class="col-sm-4">
													<input id="edcompany_name" type="text" title="only alphabets are allowed" minlength="2" maxlength="100"
													autocomplete="off" placeholder="Company Name" name="edcompany_name" class="form-control"  required>
												</div>
											</div>
											
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Position Held</label>
												<div class="col-sm-4">
												<input type="text" name="edpositionheld" id="edpositionheld"
													 placeholder="Position Held"  class="form-control" required>
												</div>
											  </div>  
											<span style="text-align:left;color:grey;font-size:small;vertical-align:top;"><b>Address (main office and branch where worked)</b><br></span> 
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-5">
													<input id="edline1" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="edline1" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-5">
													<input id="edline2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" placeholder="Enter Line2"
													 autocomplete="off" name="edline2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-5">
													<input id="edcity" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="City" name="edcity" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-5">
													<input id="edstate" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="edstate" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-5">
													<input id="edzipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" 
													 autocomplete="off" placeholder="Zip Code" name="edzipcode" class="form-control"  required>
												</div>
											</div> 					
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Company Telephone</label>
												<div class="col-sm-4">
													<input id="edcompany_tele" type="text" placeholder="Company Telephone" name="edcompany_tele" class="form-control"  required>
												</div>
											</div> 
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Started Working From</label>
												<div class="col-sm-3">
													 <input type="text" class="form-control" id="edstartedYear" required	name="edstartedYear">
												</div>
												<div class="col-sm-3">
													<input type="text" class="form-control" id="edstartedMonth" required	name="edstartedMonth">
											   </div>
											</div>
										
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Worked Till</label>
												<div class="col-sm-3">
													 <input type="text" class="form-control" id="edworkedTillYear" required	name="edworkedTillYear">
												</div>
												<div class="col-sm-3">
													<input type="text" class="form-control" id="edworkedTillMonth" required	name="edworkedTillMonth">
											   </div>
											</div>
										
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Reported to (Name & Position)</label>
												<div class="col-sm-3">
													<input id="edreported_to_name" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
														title="only alpha numerics are allowed" placeholder="Reported to Name"
													    autocomplete="off" name="edreported_to_name" class="form-control"  >
												</div>
												<div class="col-sm-3">
													<input id="edreported_to_position" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
														title="only alpha numerics are allowed" placeholder="Reported to Positon"
													    autocomplete="off" name="edreported_to_position" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Name of HR Manager</label>
												<div class="col-sm-4">
													<input id="edhrmgr" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="Name of HR Manager" name="edhrmgr" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Employment Type</label>
												<div class="col-sm-4">
												<input id="edemploymentType" type="text"  name="edemploymentType" class="form-control"  required>
												</div>
											</div>
										
									<!--  <div class="form-group row"><label class="col-sm-3 control-label"> Note :
															</label><div class="col-lg-7 control-label"><span style="text-align:left;color:grey;font-size:small;vertical-align:top;">Please provide above employment contact number and email for verification(Important)</span>
	                                        </div></div> -->
	                                        	<span style="text-align:left;color:grey;font-size:small;vertical-align:top;"><b>Contact details :</b></span><br>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Contact Person Name</label>
												<div class="col-sm-4">
												<input type="text" name="edcpname" id="edcpname" placeholder="Contact Person Name"  class="form-control">
												</div>
											  </div> 
											  
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Contact Person Number</label>
												<div class="col-sm-4">
												<input type="text" name="edcpnumber" id="edcpnumber" 
													 placeholder="Contact Person Number"  class="form-control">
												</div>
											  </div> 
											  
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Contact person Email Id</label>
												<div class="col-sm-4">
												<input type="text" name="edcpemail" id="edcpemail" placeholder="Contact person Email Id"  class="form-control">
												</div>
											  </div> 
											  
											 <span style="text-align:left;color:grey;font-size:small;vertical-align:top;"><b>Additional contact details :</b></span><br>
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Contact Person Name</label>
												<div class="col-sm-4">
												<input type="text" name="edacpname" id="edacpname" placeholder="Contact Person Name"  class="form-control">
												</div>
											  </div> 
											  
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Contact Person Number</label>
												<div class="col-sm-4">
												<input type="text" name="edacpnumber" id="edacpnumber" 
													 placeholder="Contact Person Number"  class="form-control">
												</div>
											  </div> 
						<%-- <center><div class="text-center ml-3">
							<button type="button" id="btnUpdate" class="btn btn-primary btn-sm" onclick="btnUpdateClick()" disabled>Save Changes</button>
							<button type="button" id="closeEditEmploymentModal1" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
						</div></center> --%>
					</form>
					</fieldset>
				</div>
				</div>
			</div>
		</div>
	</center>
		
				</div>
				
		
	
	<!-- <div class="content-wrapper" id="listdiv"> -->
	<%-- <div class="row">
		<div class="col-md-12">
			<div class="card" id="dataTBL">
				<div class="card-body">
					<div style="text-align: center;">
					</div>
					<!-- 	<form action="" method="post"> -->
					<div style="max-width:1150px;" >
					<center><span><strong style="font-size:20px;color:red;">Customer Details</strong></span></center>
					<table id="customerTable" class="table table-hover table-bordered"
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
							    <td>${custl.line1}, ${custl.line2}, ${custl.city}, ${custl.state}, ${custl.zipcode}</td>
							    <td>${custl.company_contactperson}</td>
							    <td>${custl.company_mgr_email}</td>
							    <td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
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
	 --%>
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
<script>
function updateemploymentstatus(){
	getsesVal().done(function(data){
		if(data!=""){
	var statusId=$("#capprstatus").val();
	var commentId=$("#candicomments").val();
	var candidateId=$("#candidate_id").val();
	$("#CbgcCandidateId").val(candidateId);
	if(statusId!="" && commentId!=""){
		var form = $('#updateemploymentStatusForm')[0];
		var data = new FormData(form);
		$.ajax({
			url : "updateemploymentstatus", //this is the submit URL
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
                     $('<a href="viewemploymentdetails?candidateId='+candidateId+'"></a>')[0].click();  
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
	        data:{"candidateId":candidateId,"formtype":"Employment"},
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
</script>
<script type="text/javascript">

function editEmployment(employmentId){
	getsesVal().done(function(data){
		if(data!=""){
	$.ajax({
    	type : "GET",
        asyn : false,
        contentType: "application/json", // NOT dataType!
        url  :"getCandidateEmploymentDetailsByEmploymentId",
        data:{"employmentId":employmentId},
        success  : function(response){
        	 if(response!=null || response!=""){
        			$('#edemploymentId').val(response.employment_id);
        			$('#edcontactId').val(response.contact_id);
        			$('#edcompany_name').val(response.company_name);
        			$('#edpositionheld').val(response.positionheld);
        			$('#edcompany_tele').val(response.company_phone);
        			$('#edreported_to_name').val(response.reported_to_name);
        			$('#edreported_to_position').val(response.reported_to_position);
        			$('#edhrmgr').val(response.hrmgr_name);
        			$('#edemploymentType').val(response.employmentType);
        			$('#edline1').val(response.line1);
        			$('#edline2').val(response.line2);
        			$('#edcity').val(response.city);
        			$('#edstate').val(response.state);
        			$('#edzipcode').val(response.zipcode);
        			$('#edstartedYear').val(response.startedYear);
        			$('#edstartedMonth').val(response.startedMonth);
        			$('#edworkedTillYear').val(response.workedTillYear);
        			$('#edworkedTillMonth').val(response.workedTillMonth);
        			
        			$('#edcpname').val(response.cpname);
        			$('#edcpemail').val(response.cpemail);
        			$('#edcpnumber').val(response.cpnumber);
        			$('#edacpname').val(response.acpname);
        			$('#edacpnumber').val(response.acpnumber);
        			
        			/* 	 var $dropdown1 = $("select[name='edstartedYear']");
        				 $dropdown1.find('option[value="' + response.startedYear + '"]').attr('selected', true);
        				
        				var $dropdown2 = $("select[name='edstartedMonth']");
        				 $dropdown2.find('option[value="' + response.startedMonth + '"]').attr('selected', true);

        				 var $dropdown3 = $("select[name='edworkedTillYear']");
        				 $dropdown3.find('option[value="' + response.workedTillYear + '"]').attr('selected', true);

        				 var $dropdown4 = $("select[name='edworkedTillMonth']");
        				 $dropdown4.find('option[value="' + response.workedTillMonth + '"]').attr('selected', true); */
        			
        			/* if(response.employmentType=='Direct'){
        				$('#edemploymentType1').prop("checked",true)
        				}
        			else if(response.employmentType=='Agency'){
        				   $('#edemploymentType2').prop("checked",true)
        				 }else{
        				   $('#edemploymentType3').prop("checked",true)
        				} */
				    
        			$('#updateEmploymentDetailsForm input').attr('disabled', 'disabled');
				 	$('#candicomments').prop('readonly',false);
	   	        }
	   	      else{
	   	          window.location.href="loginpage";
	   	   	      }
        	 $('#EditEmploymentModal').modal('show');
            }
	    });
		}else{ window.location.href="loginpage";}});
}

 var verEmpstatus=$("#verEmpStatus").val();
 var $dropdown4 = $("select[name='status']");
 $dropdown4.find('option[value="' + verEmpstatus + '"]').attr('selected', true);

function getprofile(){
	var canidateid=$("#candidate_id").val();
	var profileid=$("#profileId").val();
}
$('input').attr("autocomplete", 'off');
</script>
</body>
</html>
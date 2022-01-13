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
<link rel="stylesheet" href="resources/css/css/select2.min.css"	rel="stylesheet" />
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
							<h5 class="card-header">Profiles By Candidate</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-md-12 col-sm-12">
									<fieldset>
										<form action="/" method="post" id="saveCandidateForm" class="form-horizontal" enctype="multipart/form-data">
	                                        <h4><b>Profiles By Candidate</b></h4> 
											<br/>
											<div class="form-group row"> 
											    <label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Select Candidate</label>
											      <div class="col-sm-3">
											        <select name="candidate" autoComplete="off" class="form-control text-left" id="candidate" onchange="loadProfileCandidateById()"required>
										            <option value="">--Select Candidate--</option>
										        	 <c:forEach var="candlist" items="${candidateList}">
															<option value="${candlist.candidate_id}">${candlist.full_name}</option>
														</c:forEach>
										            </select>
										         </div>  
											
											 <label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Select Grouping Profile</label>
											   <div class="col-sm-3">
											    <select name="profileName" autoComplete="off" class="form-control text-left" id="profileName" onchange="loadContractPanel()" required>
										             <%-- <option value="">--Select Grouping Profile--</option>
										         <c:forEach var="prof" items="${profileList}">
															<option value="${prof.profile_id}">${prof.profile_name}</option>
														</c:forEach> --%>
										         </select> 
										    </div> 
										    </div>
										   <!--   <br/><br/> -->
										    <div id="cpanel" style="display:none;">
										     <div class="col-md-12">
											<div class="card" id="dataTBL">
												<div class="card-body">
													<div style="max-width:auto; white-space: nowrap;">
														<%-- <center>
															<span><strong
																style="font-size: 18px; color: 00cc00;">I9 Form
																	Additional Documents</strong></span>
														</center> 
														<br>--%>
														<table id="controlPanelTable"
															class="table table-hover table-bordered"
															style="text-align: center;">
															<thead>
																<tr>
																	<th style="text-align: center">Profile Name</th>
																	<th style="text-align: center">Candidate Name</th>
																	<th style="text-align: center">Category</th>
																	<th style="text-align: center">Sub Category</th>
																	<th style="text-align: center">Status</th>
																	<th style="text-align: center">Action</th>
																	
																</tr>
															</thead>
															<tbody>
																
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										     
										     </div>
										     <div id="candidatepanel" style="display:none;">
										     <div class="col-md-12">
											<div class="card" id="dataTBL">
												<div class="card-body">
													<div style="max-width:auto; white-space: nowrap;">
														<center>
															<span><strong
																style="font-size: 18px; color: 00cc00;">
																	Candidate Submitted Documents</strong></span>
														</center> 
														<br>
														<table id="employeeTableId"	class="table table-hover table-bordered"
												style="text-align: center;">
															<thead>
																<tr>
																	<th style="text-align: center">Profile Name</th>
																	<th style="text-align: center">Candidate Name</th>
																	<th style="text-align: center">Category</th>
																	<th style="text-align: center">Sub Category</th>
																	<th style="text-align: center">Candidate Status</th>
																	<th style="text-align: center">Admin Status</th>
																	<th style="text-align: center">Action</th>
																	
																</tr>
															</thead>
															<!--  id="candidatediv" -->
															<tbody>
																
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										     
										     </div>
										     
										<!-- 	IF PRE-OBT NEED TO ALL STATUS SHOULD BE COMPLETED
											POST OBT just proceed 
											<div class="text-center ml-5">
												<button type="button" class="btn btn-info btn-sm" id="proceedId" disabled>Proceed</button>
												<button type="button" class="btn btn-info btn-sm" id="completeId" disabled>Complete</button> 
											</div>-->
											  
										</form>
									</fieldset>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
				
	<div class="animated fadeIn"  id="formids" style="display:none;">
	<div class="row">
		<div class="col-md-12">
			<div class="card" id="dataTBL">
				<div class="card-body">
					<div style="text-align: center;">
					</div>
					<!-- 	<form action="" method="post"> -->
					<div style="max-width:1150px;" >
					<center><span><strong style="font-size:20px;">Candidate Mandatory Form Details</strong></span></center>
					<table id="customerTable" class="table table-hover table-bordered"
						style="text-align: center;">
						<thead>
							<tr>
								<th style="text-align: center">Form Name</th>
								<th style="text-align: center">Candidate Status</th>
								<th style="text-align: center">Admin/Manager Status</th>
								 <th style="text-align: center">Action</th>  
							</tr>
						</thead>
						<tbody> 
						 <tr id="personalDetailsid">   
							    <td>Personal Details</td> 
							    <td><span class="label label-info"  id="personalid"></span></td>
							    <td><span class="label label-info"  id="personalApprid"></span></td>
							    <td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton" onclick="viewpersonaldetails();" id="pid">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</button></td>
										<td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton"  id="dlpid">
											<i class="fa fa-download" aria-hidden="true"></i>
										</button></td>
							</tr>
							 <tr id="educationDetailsid">   
							    <td>Education Details</td>
							    <td><span class="label label-info"  id="educationid"></span></td>
							    <td><span class="label label-info"  id="educationApprid"></span></td>
							    <td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton" onclick="educationalDetails();" id="eid">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</button></td>
										<td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton"  id="dleid">
											<i class="fa fa-download" aria-hidden="true"></i>
										</button></td>
							</tr>
							 <tr id="employmentDetailsid">   
							    <td>Employment Details</td>
							    <td><span class="label label-info"  id="employmentid"></span></td>
							    <td><span class="label label-info"  id="employmentApprid"></span></td>
							    <td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton"onclick="viewemploymentDetails();" id="empid">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</button></td>
										<td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton"  id="dlempid">
											<i class="fa fa-download" aria-hidden="true"></i>
										</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</div>
	</div>
	
	<center>
		<div class="modal fade" id="commentModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 100px;">
			<div class="modal-dialog modal-lg" style="height:100%;">
				<div class="modal-content" style="width:120%;height:80%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Comment Details</b>
							</h5>
						</center>
					</div>
					<div class="modal-body">
					<div class="row">
					<div class="col-md-11 col-sm-12">
					<form class='form form-horizontal validate-form'
						action="/" id="saveCommentsForm" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="bgcChkId" name="bgcChkId">
						<input type="hidden" id="bgcCandidateId" name="bgcCandidateId">
						<input type="hidden" id="bgcProfileId" name="bgcProfileId">
						
						<div class="modal-body">
						<center><label><b>Category : </b></label>&nbsp;&nbsp;<span id="catName"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  <label><b>Sub Category : </b></label>&nbsp;&nbsp;<span id="subcatName"></span></center><br/>
					      <div class="form-group row">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Select Status</label>
									<div class="col-sm-5">
												<select id="statusId" name="bgcChkStatus" class="form-control">
												   
												</select>
											</div>
								</div> 
					       <div class="form-group row">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Comments</label>
									<div class="col-sm-5">
										<textarea type="text"  id="commentId" name="comment" rows="4" cols="50" minlength="2"
										 placeholder="Enter Comment"  class="form-control" required></textarea>
									</div>
									<div class="col-sm-0">
									<button type="button" class="btn btn-primary btn-sm" style="letter-spacing: 1px; background-color: #15aabf; color: white;" id="chistoryId" data-toggle="modal" ><i class="fa fa-history"></i></button>
									</div>
							</div> 
							
							 <div class="form-group row">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Upload File</label>
									<div class="col-sm-5">
										<input type="file" id="bgcfileId" name="bgcfile[]" class="form-control" multiple/>
									</div>
								 <button type="button" class="btn btn-primary btn-sm" style="letter-spacing: 1px; background-color: #15aabf; color: white;" id="fhistoryId" data-toggle="modal" ><i class="fa fa-history"></i></button>	
								</div> 
								
							<center>
							
								<div class="text-center ml-3">
								<button type="button" class="btn btn-primary btn-sm" onclick="updateComment()">Update</button>
								<button type="button" class="btn btn-secondary btn-sm" 
										data-dismiss="modal">Close</button>
										</div>
							</center>
									   
						</div>
					</form>
				</div>
				</div>
				</div>
			</div>
		</div>
		</div>
	</center>
	
	<center>
		<div class="modal fade" id="candidateModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 100px;">
			<div class="modal-dialog modal-lg" style="height:100%;">
				<div class="modal-content" style="width:120%;height:80%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Candidate Status Details</b>
							</h5>
						</center>
					</div>
					<div class="modal-body">
					<div class="row">
					<div class="col-md-11 col-sm-12">
					<form class='form form-horizontal validate-form'
						action="/" id="updatecanStauts" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="CbgcChkId" name="bgcChkId">
						<input type="hidden" id="CbgcCandidateId" name="bgcCandidateId">
						<input type="hidden" id="CbgcProfileId" name="bgcProfileId">
						
						<div class="modal-body">
						<center><label><b>Category : </b></label>&nbsp;&nbsp;<span id="CcatName"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  <label><b>Sub Category : </b></label>&nbsp;&nbsp;<span id="CsubcatName"></span></center><br/>
					      <div class="form-group row">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Select Status</label>
									<div class="col-sm-5">
												<select id="capprstatus" name="approveStatus" class="form-control">
												<option value="">-Select Status-</option>
												<option value="Approved">Approve</option>
												<option value="Rejected">Reject</option>
												
												   
												</select>
											</div>
								</div> 
					       <div class="form-group row">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Comments</label>
									<div class="col-sm-5">
										<textarea type="text"  id="candicomments" name="comment" rows="4" cols="50" minlength="2"
										 placeholder="Enter Comment"  class="form-control" required></textarea>
									</div>
							</div> 
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>File History</label>
									<div class="col-sm-1">
										<button type="button" style='letter-spacing: 1px; background-color: #15aabf; color: white;' id="CfhistoryId" data-toggle="modal" class="btn btn-info btn-sm addButton"><i class="fa fa-file"></i></button>
									</div>
							</div> 
							 <div class="form-group row">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Comments History</label>
									<div class="col-sm-1">
										<button type="button" id="CchistoryId" data-toggle="modal" style='letter-spacing: 1px; background-color: #15aabf; color: white;' class="btn btn-info btn-sm addButton" ><i class="fa fa-history"></i></button>
									</div>
							</div> 
							<center>
								<div class="text-center ml-3">
								<button type="button" class="btn btn-primary btn-sm" onclick="updateCanStatus()">Submit</button>
								<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
								</div>
							</center>
						</div>
					</form>
				</div>
				</div>
				</div>
			</div>
		</div>
		</div>
	</center>
	
	
	<center>
		<div class="modal fade" id="filehistoryModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 160px;">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content" style="width:120%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>File History Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="/" id="saveCommentsForm" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<div class="modal-body">							
					       <table id="filehistoryTable" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>Filename</th>
								<th>Submitted By</th>
								<th>Submitted Date</th>
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
	</center>
	<center>
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
</div>
<script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
 <script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="resources/js/js/select2.min.js"></script>
<script src="resources/preDefined/goback.js"></script>
<script type="text/javascript">
$('#profileName').select2({
	 placeholder: "Select Profile",
});
$('#candidate').select2({
	 placeholder: "Select Candidate",
});
//$('#employeeTableId').DataTable();
var table = $('#controlPanelTable').DataTable({
//	 "order": [[0, "desc"]],
   bLengthChange: true,
   paging: true
});
var table1 = $('#employeeTableId').DataTable({
//	 "order": [[0, "desc"]],
  bLengthChange: true,
  paging: true
});


function loadContractPanel(){
	getsesVal().done(function(data){
		if(data!=""){ 
	var candidateId=document.getElementById('candidate').value;
	 var profileId=document.getElementById('profileName').value;
	 $("#completeId,#proceedId").attr('disabled', true);
	
// educationid employmentid
	 
	 if(candidateId!="" && profileId!=""){
			 $.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "application/json", // NOT dataType!
		        url  :"ContrctsPanelDetailsById",
		        data:{"candidateId":candidateId,"profileId":profileId},
		        success  : function(response){
		        	
		        	 $("#cpanel").show();
		        	 if (table) table.clear();
		        	 $('#controlPanelTable').dataTable().fnClearTable();
		        	
		        	  	if(response!=""){
		        	  	var adminlist=response.adminList;
		        	  	var candidateList=response.candidateList;
		        	  	if(response.adminList.length>0){
		        	  	  var sarray=[];var array2=[];
		            	  for(var i=0;i<response.adminList.length;i++){
		            		  var status; var profile;
		            		  if(response.adminList[i].status==null){
		            			  status="Initiate";
		            		  }else{
		            			  status=response.adminList[i].status;
		            		  }
		            		  if(response.adminList[i].profileName!=""){
		            			  profile=response.adminList[i].profileName;
		            		  }else{
		            			  profile='<span class="label label-success" style="background-color:grey;color:white;">Candidate Specific</span>';
		            		  }
		            		  sarray.push(status);
		            		  array2.push(response.adminList[i].taskStatus);
		                       table.row.add([
		                    	''+profile+'',
		                    	''+response.adminList[i].candidateName+'',
		                    	'<div style=overflow-y:auto;overflow-x:auto;width:200px;max-height:200px;>'+response.adminList[i].catName+'</div>',
		                    	'<div style=overflow-y:auto;overflow-x:auto;width:200px;max-height:200px;>'+response.adminList[i].subcatName+'</div>',
		                    	'<input type="hidden" id="statusTd'+response.adminList[i].bgc_checklist_id+'" value="'+status+'"/>'+status+'',
		                    	'<a class="btn btn-success btn-sm" data-toggle="modal" onclick="addComment(\''+response.adminList[i].bgc_checklist_id+'\',\''+status+'\',\''+response.adminList[i].catName+'\',\''+response.adminList[i].subcatName+'\');" style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-eye"></i></a>'
		                    	
		                     ]).draw();                  
		                   }
		        	  	}
		        	  	 if (table1) table1.clear();
		        	 	var cstatus; var cprofile;var apprstatus;var action;
			        	 $('#employeeTableId').dataTable().fnClearTable();
		        	  	if(response.candidateList.length>0){
		        	  		$("#candidatepanel").show();
		        	  		for(var j=0;j<response.candidateList.length;j++){
		        	  		
			            		 if(response.candidateList[j].candidate_status==null){
			            			  cstatus="Pending";
			            			  action='<a class="btn btn-default btn-sm" data-toggle="modal"  style="letter-spacing: 1px; background-color: grey; color: white;"><i class="fa fa-eye"></i></a>'
			            		  }else{
			            			  cstatus=response.candidateList[j].candidate_status;
			            			  action='<a class="btn btn-success btn-sm" data-toggle="modal" onclick="updateCandidateStauts(\''+response.candidateList[j].bgc_checklist_id+'\',\''+cstatus+'\',\''+response.candidateList[j].catName+'\',\''+response.candidateList[j].subcatName+'\',\''+response.candidateList[j].status+'\');" style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-eye"></i></a>';
			            		  } 
			            		 if(response.candidateList[j].status==null){
			            			 apprstatus="Pending";
			            		  }else{
			            			  apprstatus=response.candidateList[j].status;
			            		  }
			            		 
			            		   if(response.candidateList[j].profileName!=""){
			            			  cprofile=response.candidateList[j].profileName;
			            		  }else{
			            			  cprofile='<span class="label label-success" style="background-color:grey;color:white;">Candidate Specific</span>';
			            		  }
			            		   table1.row.add([
				                    	''+cprofile+'',
				                    	''+response.candidateList[j].candidateName+'',
				                    	'<div style=overflow-y:auto;overflow-x:auto;width:200px;max-height:200px;><input type="hidden" id="tdcatid'+response.candidateList[j].bgc_checklist_id+'" value="'+response.candidateList[j].catName+'"/>'+response.candidateList[j].catName+'</div>',
				                    	'<div style=overflow-y:auto;overflow-x:auto;width:200px;max-height:200px;><input type="hidden" id="tdsubcatid'+response.candidateList[j].bgc_checklist_id+'" value="'+response.candidateList[j].subcatName+'"/>'+response.candidateList[j].subcatName+'</div>',
				                    	'<input type="hidden" id="tdstatusid'+response.candidateList[j].bgc_checklist_id+'" value="'+cstatus+'"/>'+cstatus+'',
				                    	'<input type="hidden" id="apprstatustd'+response.candidateList[j].bgc_checklist_id+'" value="'+apprstatus+'"/>'+apprstatus+'',
				                    	''+action+''
				                    	]).draw();  
			                }
		        	  	}
		        	  	
		        	  	  
		        	  	  
		        	  	
		        	  	var personal_status=response.personal_status;
		        	  	var education_status=response.education_status;
		        	  	var employment_status=response.employment_status;
		        	  	var personal_Apprstatus=response.personal_Apprstatus;
		        	  	var education_Apprstatus=response.education_Apprstatus;
		        	  	var employment_Apprstatus= response.employment_Apprstatus;
		        	  	
		        	  	if (response.personal_Details ==true) {
							$("#personalDetailsid").show();
						}else{ $("#personalDetailsid").hide(); }
						if (response.education_Details == true) {
							$("#educationDetailsid").show();
						}else{ $("#educationDetailsid").hide(); }
						if (response.employment_Details == true) {
							$("#employmentDetailsid").show();
						}else{ $("#employmentDetailsid").hide(); }
		        	  	
		        	  	if(personal_status==null){
		        	  		$("#personalid").text("Pending");
		        	  		$("#pid").attr("disabled",true).prop("title","candidate status still pending, can't open the link");
		        	  		
		        	  		}
		        	  	else{
		        	  			$("#personalid").text(personal_status);
		        	  			$("#pid").attr("disabled",false);
		        	  	}
		        	  	if(education_status==null){
		        	  		$("#educationid").text("Pending");
		        	  		$("#eid").attr("disabled",true).prop("title","candidate status still pending, can't open the link");
		        	  		}else{
		        	  			$("#educationid").text(education_status);
		        	  			$("#eid").attr("disabled",false);
		        	  	}
		        	  	if(employment_status==null){
		        	  		$("#employmentid").text("Pending");
		        	  		$("#empid").attr("disabled",true).prop("title","candidate status still pending, can't open the link");
		        	  		}else{$("#employmentid").text(employment_status);
		        	  		$("#empid").attr("disabled",false);
		        	  	}
		        	  	
		        	  	/*if(personal_Apprstatus==null){
		        	  		$("#personalApprid").text("Pending");
		        	  		}else{
		        	  			$("#personalApprid").text(personal_Apprstatus);
		        	  	}
		        	  	if(education_Apprstatus==null){
		        	  		$("#educationApprid").text("Pending");
		        	  		}else{
		        	  			$("#educationApprid").text(education_Apprstatus);
		        	  	}
		        	  	if(employment_Apprstatus==null){
		        	  		$("#employmentApprid").text("Pending");
		        	  		}else{
		        	  			$("#employmentApprid").text(employment_Apprstatus);
		        	  	}*/
		        	  	if (personal_Apprstatus == null) {
							$("#personalApprid").text("Pending");
							$("#dlpid").attr("disabled", true);
						} else {
							$("#personalApprid").text(personal_Apprstatus);
							if(personal_Apprstatus=="Approved"){
								$("#dlpid").attr("disabled", false);	
							}else{$("#dlpid").attr("disabled", true);}
						}
						if (education_Apprstatus == null) {
							$("#educationApprid").text("Pending");
							$("#dleid").attr("disabled", true);
						} else {
							$("#educationApprid").text(education_Apprstatus);
							if(education_Apprstatus=="Approved"){
								$("#dleid").attr("disabled", false);	
							}else{$("#dleid").attr("disabled", true);}
						}
						if (employment_Apprstatus == null) {
							$("#employmentApprid").text("Pending");
							$("#dlempid").attr("disabled", true);
						} else {
							$("#employmentApprid").text(employment_Apprstatus);
							if(employment_Apprstatus=="Approved"){
								$("#dlempid").attr("disabled", false);	
							}else{$("#dlempid").attr("disabled", true);}
							
						}
		        	  	
		        	  	$("#formids").show();
		        	  	
		            	  var bgcStatus="";
		            	  if(array2.includes("Pre Onboarding")){
		            		  $("#proceedId").attr('disabled', true);
		            		  if(sarray.includes("Initiate") || sarray.includes("In Progress")) {
				            		 $("#completeId").attr('disabled', true);
				            	 }else{
				            		   bgcStatus="Completed";
									   $("#completeId").attr('disabled', false);
									   $('#completeId').attr('onclick', 'bgcStatus(\''+candidateId+'\',\''+profileId+'\',\''+bgcStatus+'\')');
								   }
		            		 }else{
		            			 if(sarray.includes("Initiate") || sarray.includes("In Progress")) {
		            				// alert("if");
		            				 bgcStatus="Proceed";
				            		 $("#proceedId").attr('disabled', false);
				            		 $('#proceedId').attr('onclick', 'bgcStatus(\''+candidateId+'\',\''+profileId+'\',\''+bgcStatus+'\')');
				            	 }else{
				            		// alert("else");
				            		   bgcStatus="Completed";
									   $("#completeId").attr('disabled', false);
									   $('#completeId').attr('onclick', 'bgcStatus(\''+candidateId+'\',\''+profileId+'\',\''+bgcStatus+'\')');
								  } 
		            		 }
		          	 }else{
		          	  // alert("No data found");
		               } 
		            }
			    });
	 }else {
		 //$("#cpanel").empty();
		 $("#cpanel,#candidatepanel,#formids").hide();
	 }
		}else{ window.location.href="loginpage";}});
}

function loadStatus() {
	var slist = ["Initiate", "In Progress", "Complete"];
	 $('#statusId').empty();
	  $('#statusId').append($('<option/>').attr("value", '').text("Select Status"));
	for (var i = 0; i < slist.length; i++) {
		$('#statusId').append(
		$('<option/>').attr("value", slist[i]).text(slist[i])
		);
	}
}
function addComment(bgcChkId,status,catName,subCatName){
	getsesVal().done(function(data){
		if(data!=""){ 
	var candidateId=document.getElementById('candidate').value;
  var profileId=document.getElementById('profileName').value;
 $("#commentId,#bgcfileId").val('');
 var statusTd=$("#statusTd"+bgcChkId).html();
 loadStatus();
 /* $("#statusId").val('');*/
  //var profiletext=$("#statusId option:selected").text(); 
  //alert(statusTd);
 var $dropdown = $("select[name='bgcChkStatus']");
 $dropdown.find('option[value="' + status + '"]').attr('selected', true);
    $("#bgcCandidateId").val(candidateId);
    $("#bgcProfileId").val(profileId);
    $("#catName").text(catName);
    $("#subcatName").text(subCatName);
 	$("#bgcChkId").val(bgcChkId);
	$('#chistoryId').attr('onclick', 'viewCommentHistory('+bgcChkId+')');
	$('#fhistoryId').attr('onclick', 'viewfileHistory('+bgcChkId+','+candidateId+')');
	 $('#commentModal').modal('show');
		}else{ window.location.href="loginpage";}});
}

function updateCandidateStauts(bgcChkId,status,catName,subCatName,apprstatus){
	getsesVal().done(function(data){
		if(data!=""){ 
	/* var status=$("#tdstatusid"+bgcChkId).html();
	var catName=$("#tdcatid"+bgcChkId).html();
	var subCatName=$("#tdsubcatid"+bgcChkId).html();*/ 
	var apprstatustd=$("#apprstatustd"+bgcChkId).val();
	  var candidateId=document.getElementById('candidate').value;
	  var profileId=document.getElementById('profileName').value;
	 $("#candicomments").val('');
	 loadStatus();
	 
	 var $dropdown = $("select[name='approveStatus']");
	 $dropdown.find('option[value="' + apprstatus + '"]').attr('selected', true);
	    $("#CbgcCandidateId").val(candidateId);
	    $("#CbgcProfileId").val(profileId);
	    $("#CcatName").text(catName);
	    $("#CsubcatName").text(subCatName);
	 	$("#CbgcChkId").val(bgcChkId);
		$('#CchistoryId').attr('onclick', 'viewCommentHistory('+bgcChkId+')');
		$('#CfhistoryId').attr('onclick', 'viewfileHistory('+bgcChkId+','+candidateId+')');
		$('#candidateModal').modal('show');
		}else{ window.location.href="loginpage";}});
	}



function approveDocuments(bgcChkId,status,catName,subCatName){
	getsesVal().done(function(data){
		if(data!=""){ 
	var candidateId=document.getElementById('candidate').value;
	  var profileId=document.getElementById('profileName').value;
	 $("#commentId,#bgcfileId").val('');
	 var statusTd=$("#statusTd"+bgcChkId).html();
	 loadStatus();
	 /* $("#statusId").val('');*/
	  //var profiletext=$("#statusId option:selected").text(); 
	  //alert(statusTd);
	 var $dropdown = $("select[name='bgcChkStatus']");
	 $dropdown.find('option[value="' + status + '"]').attr('selected', true);
	    $("#bgcCandidateId").val(candidateId);
	    $("#bgcProfileId").val(profileId);
	    $("#catName").text(catName);
	    $("#subcatName").text(subCatName);
	 	$("#bgcChkId").val(bgcChkId);
		$('#chistoryId').attr('onclick', 'viewCommentHistory('+bgcChkId+')');
		$('#fhistoryId').attr('onclick', 'viewfileHistory('+bgcChkId+','+candidateId+')');
		 $('#commentModal').modal('show');
		}else{ window.location.href="loginpage";}});
	}

function loadProfileCandidateById(){
	getsesVal().done(function(data){
		if(data!=""){  
	var candidateId=document.getElementById('candidate').value;
	 //$("#cpanel").empty();
	 $("#cpanel,#candidatepanel,#formids").hide();
	 if(candidateId==""){
		 $('#profileName').empty();
		 }else {
			 $.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "application/json", // NOT dataType!
		        url  :"ProfilelistByCandidateId",
		        data:{"candidateId":candidateId},
		        success  : function(response){
		        	  $('#profileName').empty();
			    	  $('#profileName').append($('<option/>').attr("value", '').text("--Select Profile--"));
		        	for(var i=0;i<response.length;i++)
		     	       {
		        		$('#profileName').append($('<option/>').attr("value", response[i].profileid).text(response[i].profilename));
		               }
		            }
			    });
		  }
		}else{ window.location.href="loginpage";}});
}

function updateComment(){
	getsesVal().done(function(data){
		if(data!=""){ 
	var statusId=$("#statusId").val();
	var commentId=$("#commentId").val();
	var candidateId=$("#bgcCandidateId").val();
	var bgcProfileId=$("#bgcProfileId").val();
	if(statusId!="" && commentId!=""){
		var form = $('#saveCommentsForm')[0];
		var data = new FormData(form);
		$.ajax({
			url : "saveComments", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(data) {
				 if(data!=null || data!=""){
					 alert(data);
                   //  window.location.reload();
                     loadContractPanel();
                 //    window.location.href="ContrctsPanelDetailsById?candidateId="+candidateId+"&profileId="+bgcProfileId+""
                    // $("#statusId").val('');
                     $('#commentModal').modal('hide');
	   	   	         }
	   	   	      else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			}
		});
	}else{
		
		if (statusId != "" || statusId == undefined) {
			alert("Please enter comments");	
			
		}else{
			alert("Please select  status");	
		}
		//$("#commentId").focus();
	}
		}else{ window.location.href="loginpage";}});
}

function updateCanStatus(){
	getsesVal().done(function(data){
		if(data!=""){ 
	var statusId=$("#capprstatus").val();
	var commentId=$("#candicomments").val();
	var candidateId=$("#CbgcCandidateId").val();
	var bgcProfileId=$("#CbgcProfileId").val();
	if(statusId!="" && commentId!=""){
		var form = $('#updatecanStauts')[0];
		var data = new FormData(form);
		$.ajax({
			url : "updatecanstatus", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(data) {
				 if(data!=null || data!=""){
					 alert(data);
                     loadContractPanel();
                     $('#candidateModal').modal('hide');
	   	   	         }
	   	   	      else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			}
		});
	}else{
		if (statusId != "") {
			alert("Please enter comments");	
			
		}else{
			alert("Please select  status");	
			//$("#commentId").focus();
		}
		/* alert("Please enter comments")
		$("#commentId").focus(); */
	}
		}else{ window.location.href="loginpage";}});
}

var tablefh = $('#filehistoryTable').DataTable({
 "order": [[0, "desc"]],
lengthMenu: [[5, 10, 15, -1], [5, 10, 15, "All"]],
 bLengthChange: true,
 paging: true
});

function viewfileHistory(chkListId,candidateId){
	getsesVal().done(function(data){
		if(data!=""){  
	$.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "application/json", // NOT dataType!
	        url  :"viewFileHistoryByChkListId",
	        data:{"chkListId":chkListId},
	        success  : function(response){
	        	 if (tablefh) table.clear();
		         $('#filehistoryTable').dataTable().fnClearTable();
	        		 if(response!=""){
		            	  for(var i=0;i<response.length;i++){
		            		  var submittedby;
		            		  if(response[i].candidatename=='' || response[i].candidatename==0){
		            			  submittedby=response[i].posted_by;
		            		  }else{
		            			  submittedby=response[i].candidatename;
		            		  }
		            		  var encoded = encodeURIComponent(response[i].fileName);
		            		  var fileType="Cpanel"
		            		  tablefh.row.add([
		            			''+response[i].fileid+'',
		                    	//'<a href="downloadocs?filetype='+fileType+'&filename='+encoded+'&candidate_id='+candidateId+'" style="color:blue">'+response[i].fileName+'</a>',
		                    			'<a href="downloadbgvdocs?filename='+encoded+'&candidate_id='+candidateId+'" style="color:blue">'+response[i].fileName+'</a>',
		                    	''+submittedby+'',
		                    	''+response[i].subdate+'',
		                     ]).draw();    
	        	    }
	            }
	          $('#filehistoryModal').modal('show');
	        }		
	});
		}else{ window.location.href="loginpage";}});
}


var tablech = $('#CommentHistoryTable').DataTable({
 "order": [[0, "desc"]],
  lengthMenu: [[5, 10, 15, -1], [5, 10, 15, "All"]],
  bLengthChange: true,
  paging: true
});
function viewCommentHistory(chkListId){
	getsesVal().done(function(data){
		if(data!=""){  
	$.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "application/json", // NOT dataType!
	        url  :"viewCommentHistoryByChkListId",
	        data:{"chkListId":chkListId},
	        success  : function(response){
	        	 if (tablech) table.clear();
		         $('#CommentHistoryTable').dataTable().fnClearTable();
	        		 if(response!=""){
		            	  for(var i=0;i<response.length;i++){
		            		  var submittedby;
		            		  if(response[i].candidatename=='' || response[i].candidatename==0){
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




function bgcStatus(candId,profileId,bgcStatus){
	getsesVal().done(function(data){
		if(data!=""){ 
	$.ajax({
    	type : "GET",
        asyn : false,
        contentType: "application/json", // NOT dataType!
        url  :"saveBgcStatusById",
        data:{"candidateId":candId,"profileId":profileId,"bgcStatus":bgcStatus},
        success  : function(data){
        	 if(data!=null || data!=""){
				 alert(data);
                 window.location.href="contractspanel";
	   	         }
	   	      else{
	   	          window.location.href="loginpage";
	   	   	      }
            }
	    });
		}else{ window.location.href="loginpage";}});
}
function personalDetails(){ 
	getsesVal().done(function(data){
		if(data!=""){ 
	var candId=document.getElementById('candidate').value;
	$('<a href="personaldetails?candidateId='+candId+'" target="blank"></a>')[0].click();  
		}else{ window.location.href="loginpage";}});
}
function viewpersonaldetails(){
	getsesVal().done(function(data){
		if(data!=""){ 
	var candId=document.getElementById('candidate').value;
	$('<a href="viewpersonaldetails?candidateId='+candId+'" target="blank"></a>')[0].click();  
		}else{ window.location.href="loginpage";}});
}
function educationalDetails(){
	getsesVal().done(function(data){
		if(data!=""){ 
	var candId=document.getElementById('candidate').value;
	$('<a href="vieweducationaldetails?candidateId='+candId+'" target="blank"></a>')[0].click();  
		}else{ window.location.href="loginpage";}});
}
function viewemploymentDetails(){
	getsesVal().done(function(data){
		if(data!=""){ 
	var candId=document.getElementById('candidate').value;
	$('<a href="viewemploymentdetails?candidateId='+candId+'" target="blank"></a>')[0].click(); 
		}else{ window.location.href="loginpage";}});
}
function employmentDetails(candId){
	getsesVal().done(function(data){
		if(data!=""){ 
	var candId=document.getElementById('candidate').value;
	$('<a href="employmentdetails?candidateId='+candId+'" target="blank"></a>')[0].click();  
		}else{ window.location.href="loginpage";}});
}

$("#dlempid").click(function(){
	getsesVal().done(function(data){
		if(data!=""){  
	var qns_candidateid=document.getElementById('candidate').value;
	 var qns_initiateid=document.getElementById('profileName').value;
	 var qns_type="Employment";
		window.location.href="downloadbgcquestionnaires?qns_type="+qns_type+"&initiateid="+qns_initiateid+"&candidateid=" + qns_candidateid;
		}else{ window.location.href="loginpage";}});
		});
$("#dlpid ").click(function(){
	getsesVal().done(function(data){
		if(data!=""){  
	var qns_candidateid=document.getElementById('candidate').value;
	 var qns_initiateid=document.getElementById('profileName').value;
	 var qns_type="Personal";
		window.location.href="downloadbgcquestionnaires?qns_type="+qns_type+"&initiateid="+qns_initiateid+"&candidateid=" + qns_candidateid;
		}else{ window.location.href="loginpage";}});
		});
$("#dleid").click(function(){
	getsesVal().done(function(data){
		if(data!=""){  
	var qns_candidateid=document.getElementById('candidate').value;
	 var qns_initiateid=document.getElementById('profileName').value;
	 var qns_type="Education";
		window.location.href="downloadbgcquestionnaires?qns_type="+qns_type+"&initiateid="+qns_initiateid+"&candidateid=" + qns_candidateid;
		}else{ window.location.href="loginpage";}});
		});
</script> 
</body>
</html>
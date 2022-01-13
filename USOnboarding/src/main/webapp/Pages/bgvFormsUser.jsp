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
		<div class="col-md-12">
			<div class="card" id="dataTBL">
				<div class="card-body">
					<div style="text-align: center;">
					</div>
					<!-- 	<form action="" method="post"> -->
					<input type="hidden" id="candidate_id" name="candidate_id" value="${empno}">
					<div style="max-width:1150px;" >
					<center><span><strong style="font-size:20px;">Candidate Mandatory Form Details</strong></span></center>
					<table id="customerTable" class="table table-hover table-bordered"
						style="text-align: center;">
						<thead>
							<tr>
								<th style="text-align: center">Name</th>
								<th style="text-align: center">Candidate Status</th>
								<th style="text-align: center">Admin/Manager Status</th>
								 <th style="text-align: center">Action</th>  
							</tr>
						</thead>
						<tbody>
						<c:if test="${formsDto.personal_Details eq true}">
						 <tr>   
							    <td>Personal Details</td>
							       <c:choose>
	                               <c:when test="${empty formsDto.personal_status}">
									<td><span class="label label-info" style="color:red;">Pending</span></td>
							    	</c:when>
							    	<c:otherwise>
							    	<td><span class="label label-info" style="color:red;">${formsDto.personal_status}</span></td>
							    	</c:otherwise>
							    	</c:choose>
							    		 <c:choose>
	                               <c:when test="${empty formsDto.personal_Apprstatus}">
									<td><span class="label label-info" style="color:red;">Pending</span></td>
							    	</c:when>
							    	<c:otherwise>
							    	<td><span class="label label-info" style="color:red;">
							    	<button style='letter-spacing: 1px; background-color: #15aabf; color: white;' id="CchistoryId" 
							    	onclick="viewStatusCommentHistory('Personal')" data-toggle="modal"type="button"  data-toggle="modal" >${formsDto.personal_Apprstatus}</button>
							    	</span></td>
							    	</c:otherwise>
							    	</c:choose>
							    	 <c:choose>
	                               <c:when test="${empty formsDto.personal_status}">
	                               <c:choose>
	                                 <c:when test="${empty formsDto.personal_Apprstatus}">
									  <td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton" onclick="personalDetails(${empno});">
											<i class="fa fa-plus" aria-hidden="true"></i>
										</button></td>
							    	</c:when>
							    	<c:otherwise>
							    	<td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton" onclick="viewpersonaldetails(${empno});">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</button></td>
							    	</c:otherwise>
							    	</c:choose>
	                               
									 
							    	</c:when>
							    	<c:otherwise>
							    	 <td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton" onclick="viewpersonaldetails(${empno});">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</button></td>
							    	</c:otherwise>
							    	</c:choose>
							    	
							  <%--   <c:choose>
	                               <c:when test="${formsDto.personalObj gt 0}">
	                               <td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton" onclick="viewpersonaldetails(${empno});">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</button></td>
							    	</c:when>
							    	<c:otherwise>
							    	 <td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton" onclick="personalDetails(${empno});">
											<i class="fa fa-plus" aria-hidden="true"></i>
										</button></td>
							    	</c:otherwise>
							    	</c:choose> --%>
							</tr>
							</c:if>
						<c:if test="${formsDto.education_Details eq true}">
							 <tr>   
							    <td>Education Details</td>
							       <c:choose>
	                               <c:when test="${empty formsDto.education_status}">
									<td><span class="label label-info" style="color:red;">Pending</span></td>
							    	</c:when>
							    	<c:otherwise>
							    	<td><span class="label label-info" style="color:red;">${formsDto.education_status}</span></td>
							    	</c:otherwise>
							    	</c:choose>
							    	 <c:choose>
	                               <c:when test="${empty formsDto.education_Apprstatus}">
									<td><span class="label label-info" style="color:red;">Pending</span></td>
							    	</c:when>
							    	<c:otherwise>
							    	<td><span class="label label-info" style="color:red;">
							    	<button style='letter-spacing: 1px; background-color: #15aabf; color: white;' id="CchistoryId" 
							    	onclick="viewStatusCommentHistory('Education')" data-toggle="modal"type="button"  data-toggle="modal" >${formsDto.education_Apprstatus}</button>
							    	</span></td>
							    	</c:otherwise>
							    	</c:choose>
							    	 <c:choose>
	                               <c:when test="${empty formsDto.education_status}">
	                                 <c:choose>
	                                 <c:when test="${empty formsDto.education_Apprstatus}">
									   <td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton" onclick="educationalDetails(${empno});">
											<i class="fa fa-plus" aria-hidden="true"></i>
										</button></td>
							    	</c:when>
							    	<c:otherwise>
							    	<td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton" onclick="educationalDetails(${empno});">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</button></td>
							    	</c:otherwise>
							    	</c:choose>
							    	</c:when>
							    	<c:otherwise>
							    	<td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton" onclick="educationalDetails(${empno});">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</button></td>
							    	</c:otherwise>
							    	</c:choose>
							     <%-- <c:choose>
	                               <c:when test="${formsDto.educationList gt 0}">
									<td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton" onclick="educationalDetails(${empno});">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</button></td>
							    	</c:when>
							    	<c:otherwise>
							    	<td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											class="btn btn-success btn-sm addButton" onclick="educationalDetails(${empno});">
											<i class="fa fa-plus" aria-hidden="true"></i>
										</button></td>
							    	</c:otherwise>
							    	</c:choose> --%>
							</tr>
							</c:if>
						<c:if test="${formsDto.employment_Details eq true}">
							 <tr>   
							    <td>Employment Details</td>
							    <c:choose>
	                               <c:when test="${empty formsDto.employment_status}">
									<td><span class="label label-info" style="color:red;">Pending</span></td>
							    	</c:when>
							    	<c:otherwise>
							    	<td><span class="label label-info" style="color:red;">${formsDto.employment_status}</span></td>
							    	</c:otherwise>
							    	</c:choose>
							    	 <c:choose>
	                               <c:when test="${empty formsDto.employment_Apprstatus}">
									<td><span class="label label-info" style="color:red;">Pending</span></td>
							    	</c:when>
							    	<c:otherwise>
							    	<td><span class="label label-info" style="color:red;">
							    	<button style='letter-spacing: 1px; background-color: #15aabf; color: white;' id="CchistoryId" 
							    	onclick="viewStatusCommentHistory('Employment')" data-toggle="modal"type="button"  data-toggle="modal" >${formsDto.employment_Apprstatus}</button>
							    	</span></td>
							    	</c:otherwise>
							    	</c:choose>
							    	 <c:choose>
	                               <c:when test="${empty formsDto.employment_status}">
	                               <c:choose>
	                               <c:when test="${empty formsDto.employment_Apprstatus}">
									<td><button	style="letter-spacing: 1px;background-color: #15aabf; color: white;"
										class="btn btn-success btn-sm addButton"	onclick="employmentDetails(${empno});">
											<i class="fa fa-plus" aria-hidden="true"></i>
										</button></td>
							    	</c:when>
							    	<c:otherwise>
							    	<td><button	style="letter-spacing: 1px;background-color: #15aabf; color: white;"
										class="btn btn-success btn-sm addButton"	onclick="employmentDetails(${empno});">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</button></td>
							    	</c:otherwise>
							    	</c:choose>
							    	</c:when>
							    	<c:otherwise>
							    	<td><button	style="letter-spacing: 1px;background-color: #15aabf; color: white;"
										class="btn btn-success btn-sm addButton"	onclick="employmentDetails(${empno});">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</button></td>
							    	</c:otherwise>
							    	</c:choose>
							    <%-- <c:choose>
	                               <c:when test="${formsDto.employmentList gt 0}">
									<td><button	style="letter-spacing: 1px;background-color: #15aabf; color: white;"
										class="btn btn-success btn-sm addButton"	onclick="employmentDetails(${empno});">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</button></td>
							    	</c:when>
							    	<c:otherwise>
							    	<td><button	style="letter-spacing: 1px;background-color: #15aabf; color: white;"
										class="btn btn-success btn-sm addButton"	onclick="employmentDetails(${empno});">
											<i class="fa fa-plus" aria-hidden="true"></i>
										</button></td>
							    	</c:otherwise>
							    	</c:choose> --%>
							</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>		
		<div class="card" id="dataTBL">
				<div class="card-body">
					<div style="text-align: center;">
					</div>
					<!-- 	<form action="" method="post"> -->
					<div style="max-width:1150px;" >
					<center><span><strong style="font-size:20px;">Upload Documents</strong></span></center>
					<table id="employeeTableId" class="table table-hover table-bordered"
						style="text-align: center;">
						<thead>
																<tr>
																	<th style="text-align: center">Profile Name</th>
																	<th style="text-align: center">Category</th>
																	<th style="text-align: center">Sub Category</th>
																	<th style="text-align: center">Candidate Status</th>
																	<th style="text-align: center">Admin Status</th>
																	<th style="text-align: center">Action</th>
																	
																</tr>
															</thead>
						<tbody>
						 
						 <c:forEach var="custl" items="${formsDto.candidateList}">
						 	 <tr>  
						 	 <input type="hidden" id="doc_status${custl.bgc_checklist_id}" value="${custl.document_status}">
						 	  <input type="hidden" id="subcategory_id${custl.bgc_checklist_id}"value="${custl.subcategory_id}">
						 	  <c:choose>
	                               <c:when test="${empty custl.profileName}">
	                                <td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
	                               </c:when>
	                               <c:otherwise>
	                                <td>${custl.profileName}</td>
	                               </c:otherwise>
							   </c:choose>
							    <td id="catNametd${custl.bgc_checklist_id}">${custl.catName}</td>
							    <td id="subcatNametd${custl.bgc_checklist_id}">${custl.subcatName}</td>
							    <c:choose>
	                               <c:when test="${not empty custl.candidate_status}">
	                                <td id="tdstatusid${custl.bgc_checklist_id}">${custl.candidate_status}</td>
	                               </c:when>
	                               <c:otherwise>
	                               <td>Pending</td>
	                               </c:otherwise>
							   </c:choose>
							   
							   <c:choose>
	                               <c:when test="${not empty custl.status}">
	                               <td id="apprstatustd${custl.bgc_checklist_id}">${custl.status}</td>
	                               </c:when>
	                               <c:otherwise>
	                               <td>Pending</td>
	                               </c:otherwise>
							   </c:choose>
							    <td><a class="btn btn-secondary btn-sm" data-toggle="modal" onclick="updateCandidateStauts(${custl.bgc_checklist_id});" 
							    style="line-height: 0.5;background-color: #15aabf; color: white;"><i class="fa fa-eye"></i></a></td>
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
						<input type="hidden" id="CbgcChkId" name="bgcChkId">
						<input type="hidden" id="CandidateId" name="CandidateId" value="${empno}">
						<input type="hidden" id="bgcProfileId" name="bgcProfileId"> 
						
						<div class="modal-body">
						<center><label><b>Category : </b></label>&nbsp;&nbsp;<span id="catName"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  <label><b>Sub Category : </b></label>&nbsp;&nbsp;<span id="subcatName"></span></center><br/>
					      
					       <div class="form-group row" id="downloadzipId" style="display:none;">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Download Documents</label>
									<div class="col-sm-2">
										 <a class="btn btn-primary btn-sm" id="downloadzip"><i class="fa fa-download"></i></a><br>
									</div>
								</div> 
					      
					      <div class="form-group row">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Upload File</label>
									<div class="col-sm-5">
										<input type="file" id="bgcfileId" name="bgcfile[]" class="form-control" multiple/>
									</div>
								 <button type="button" class="btn btn-primary btn-sm" id="CfhistoryId" data-toggle="modal" ><i class="fa fa-history"></i></button>	
								</div> 
								 
					       <div class="form-group row">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Comments</label>
									<div class="col-sm-5">
										<textarea type="text"  id="candicomments" name="comment" rows="4" cols="50" minlength="2"
										 placeholder="Enter Comment"  class="form-control" required></textarea>
									</div>
									<div class="col-sm-0">
									<button type="button" class="btn btn-primary btn-sm" id="CchistoryId" data-toggle="modal" ><i class="fa fa-history"></i></button>
									</div>
							</div> 
								
							<center>
							
								<div class="text-center ml-3">
								<button type="button" class="btn btn-primary btn-sm" id="subid" onclick="updateComment()">Save</button>
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
								<th>File Name</th>
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
	<center>
	<div class="modal fade" id="statuscommenthistoryModal" tabindex="-1"
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
					       <table id="statusCommentHistoryTable" class="table table-hover table-bordered" style="text-align:center;">
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
function personalDetails(candId){
	getsesVal().done(function(data){
		if(data!=""){
	$('<a href="addpersonaldetails?candidateId='+candId+'" target="blank"></a>')[0].click();  
		}else{
			 window.location.href="loginpage";
		}
	});
}

function viewpersonaldetails(candId){
	getsesVal().done(function(data){
		if(data!=""){
	$('<a href="viewpersonaldetails?candidateId='+candId+'" target="blank"></a>')[0].click(); 
		}else{
			 window.location.href="loginpage";
		}
	});
}

function educationalDetails(candId){
	getsesVal().done(function(data){
		if(data!=""){
	$('<a href="educationaldetails?candidateId='+candId+'" target="blank"></a>')[0].click(); 
		}else{
			 window.location.href="loginpage";
		}
	});
}
function employmentDetails(candId){
	getsesVal().done(function(data){
		if(data!=""){
	$('<a href="employmentdetails?candidateId='+candId+'" target="blank"></a>')[0].click();  
		}else{
			 window.location.href="loginpage";
		}
	});
}

function viewemploymentDetails(candId){
	getsesVal().done(function(data){
		if(data!=""){
	$('<a href="viewemploymentdetails?candidateId='+candId+'" target="blank"></a>')[0].click();  
		}else{
			 window.location.href="loginpage";
		}
	});
}


$('input[name="cust_phne_no"]').mask('999-999-9999');
$('input[name="fed_id"]').mask('99-9999999');

function updateCandidateStauts(bgcChkId){
	getsesVal().done(function(data){
		if(data!=""){
	var apprstatustd=$("#apprstatustd"+bgcChkId).html();
 	  //var candidateId=document.getElementById('candidate').value;
	 // var profileId=document.getElementById('profileName').value;
	  var catName=$("#catNametd"+bgcChkId).html();
		var subCatName=$("#subcatNametd"+bgcChkId).html();
		 $("#candicomments,#bgcfileId").val('');
	var doc_status=$("#doc_status"+bgcChkId).val();
	
	var subcat_id=$("#subcategory_id"+bgcChkId).val();
	
	if(doc_status=="Yes"){
		$('#downloadzipId').show();
		$('#downloadzip').attr('href', 'downloadzip?subcat_id='+subcat_id+'');
	}else{
		$('#downloadzipId').hide();
	}
	if(apprstatustd=="Approved"){
		//document.getElementById('subid').disabled=true;
		$('#subid').attr("disabled",true).prop("title","Document has been approved, you can not submit");
	}else{
		$('#subid').attr("disabled",false);
		//document.getElementById('subid').disabled=false;
	}
	
	   var candidateId=$("#candidate_id").val();
	   // $("#CbgcProfileId").val(profileId);
	    $("#catName").text(catName);
	    $("#subcatName").text(subCatName);
	 	$("#CbgcChkId").val(bgcChkId); 
		$('#CchistoryId').attr('onclick', 'viewCommentHistory('+bgcChkId+')');
		$('#CfhistoryId').attr('onclick', 'viewfileHistory('+bgcChkId+','+candidateId+')'); 
		$('#candidateModal').modal('show');
		}else{
			 window.location.href="loginpage";
		}
	});
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
		        	 if (tablefh) tablefh.clear();
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
			            		  tablefh.row.add([
			            			''+response[i].fileid+'',
			                    	'<a href="downloadbgvdocs?filename='+encoded+'&candidate_id='+candidateId+'" style="color:blue">'+response[i].fileName+'</a>',
			                    	''+submittedby+'',
			                    	''+response[i].subdate+'',
			                     ]).draw();    
		        	    }
		            }
		          $('#filehistoryModal').modal('show');
		        }		
		});
			}else{
				 window.location.href="loginpage";
			}
		});
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
		        	 if (tablech) tablech.clear();
			         $('#CommentHistoryTable').dataTable().fnClearTable();
		        		 if(response!=""){
			            	  for(var i=0;i<response.length;i++){
			            		  var submittedby;var apprstatus;
			            		  if(response[i].candidatename=='' || response[i].candidatename==0){
			            			  submittedby=response[i].posted_by;
			            		  }else{
			            			  submittedby=response[i].candidatename;
			            		  }
			            		  
			            		  if(response[i].status==null){
				            			 apprstatus="Pending";
				            		  }else{
				            			  apprstatus=response[i].status;
				            		  }
			            		  tablech.row.add([
			            			''+response[i].commentid+'',
			            			''+apprstatus+'',
			                    	''+response[i].comments+'',
			                      	''+response[i].subdate+'',
			                      	''+submittedby+''
			                     ]).draw();    
		        	    }
		            }
		        $('#commenthistoryModal').modal('show');
		        }		
		});
			}else{
				 window.location.href="loginpage";
			}
		});
	}
	function updateComment(){
		getsesVal().done(function(data){
			if(data!=""){
		var statusId=$("#statusId").val();
		var commentId=$("#candicomments").val();
		var candidateId=$("#bgcCandidateId").val();
		var bgcProfileId=$("#bgcProfileId").val();
		if(statusId!="" && commentId!=""){
			var form = $('#saveCommentsForm')[0];
			var data = new FormData(form);
			$.ajax({
				url : "savebgvcandidatedocs", //this is the submit URL
				type : "POST",
				enctype : 'multipart/form-data',
				data : data,
				processData : false,
				contentType : false,
				cache : false,
				success : function(data) {
					 if(data!=null || data!=""){
						 alert(data);
						 $("#candicomments,#bgcfileId").val('');
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
			$("#candicomments").focus();
		}
			}else{
				 window.location.href="loginpage";
			}
		});
	}
	
	var tablest = $('#statusCommentHistoryTable').DataTable({
		 "order": [[0, "desc"]],
		  lengthMenu: [[5, 10, 15, -1], [5, 10, 15, "All"]],
		  bLengthChange: true,
		  paging: true
		});
	function viewStatusCommentHistory(formType){
		getsesVal().done(function(data){
			if(data!=""){
		//alert(formType);
		var candidateId=$("#candidate_id").val();
		 $.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "application/json", // NOT dataType!
		        url  :"viewformshistory",
		        data:{"candidateId":candidateId,"formtype":formType},
		        success  : function(response){
		        	 if (tablest) tablest.clear();
			         $('#statusCommentHistoryTable').dataTable().fnClearTable();
		        		 if(response!=""){
			            	  for(var i=0;i<response.length;i++){
			            		  var submittedby;
			            		  if(response[i].posted_by!='' || response[i].posted_by!=0 || response[i].posted_by!=null){
			            			  submittedby=response[i].posted_by;
			            		  }else{
			            			  submittedby=response[i].candidatename;
			            		  }
			            		  tablest.row.add([
			            			''+response[i].commentid+'',
			            			''+response[i].status+'',
			                    	''+response[i].comments+'',
			                      	''+response[i].subdate+'',
			                      	''+submittedby+''
			                     ]).draw();    
		        	    }
		            }
		        $('#statuscommenthistoryModal').modal('show');
		        }		
		});
			}else{
				 window.location.href="loginpage";
			}
		});
}	
</script> 
</body>
</html>
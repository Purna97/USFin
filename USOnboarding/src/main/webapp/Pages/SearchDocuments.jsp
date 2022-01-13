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
.field-error .control-label, .field-error .help-block, .field-error .form-control-feedback
	{
	color: red;
}

.field-success .control-label, .field-success .help-block,
	.field-success .form-control-feedback {
	color: #3c763d;
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
							<h5 class="card-header">Search Document</h5>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">

										<fieldset>
											<form action="searchdocumnet" method="post"
												class="form-horizontal">

												<div class="form-group row">
													<div class="col-lg-2">
														<select name="candidateid" autoComplete="off"
															class="form-control text-left" id="candidateid"
															required>
															<option value="">--Select Candidate--</option>
															<c:forEach var="canlist" items="${candidateList}">
															<option value="${canlist.candidate_id}"${canlist.candidate_id == candidateId ? 'selected="selected"' : ''}>${canlist.fullname}</option>
															</c:forEach>
														</select>
													</div>
													<div class="col-lg-2">
														<select name="documenttype" autoComplete="off"
															class="form-control text-left" id="documenttype"
															 required>
															<option value="">--Select Document Type--</option>
															<c:forEach var="doctype" items="${docTypeyList}">
															<%-- <option value="${canlist.candidate_id}">${canlist.fullname}</option> --%>
																<option value="${doctype.documenttype_id}"${doctype.documenttype_id == documentId ? 'selected="selected"' : ''}>${doctype.document_type}</option>
															</c:forEach>
														</select>
													</div>

													<div class="col-sm-2">
														<button type="submit" class="btn btn-info btn-sm">Search</button>
													</div>
												</div>
											</form>
										</fieldset>
									</div>
								</div>
							</div>
						</div>


						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<h5 class="card-header">Document Details</h5>
									<div class="card-body">
										<div style="text-align: center;"></div>
										<div
											style="max-width: 1250px; overflow-x: auto; white-space: nowrap;">
											<table id="employeeTableId"
												class="table table-hover table-bordered"
												style="text-align: center;">
												<thead>
													<tr>
														<th style="text-align: center">Candidate Name</th>
														<th style="text-align: center">File Name</th>
														<th style="text-align: center">Document Type</th>
														<th style="text-align: center">Submitted date</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="doclist" items="${documnetList}">
														<tr>
														<input type="hidden" id="candidate_id" name="candidate_id" value="${doclist.candidate_id}">
														<input type="hidden" id="doc_filename${doclist.document_id}" name="doc_filename" value="${doclist.file_name}">
														<td>${doclist.empName}</td>
														<td><span onclick="download(${doclist.document_id})" style="color:blue;">${doclist.file_name}</span></td>
														<td>${doclist.filetype}</td>
														<td>${doclist.submitted_on}</td>

														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
	<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
	<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript" src="resources/js/js/select2.min.js"></script>
	<script src="resources/preDefined/goback.js"></script>
<script>
 $('#candidateid').select2({
	     placeholder: "Select Candidate",
	});
 $('#documenttype').select2({
     placeholder: "Select Document Type",
});
</script> 
	<script>
					   function download(docid){
						   getsesVal().done(function(data){
								if(data!=""){
						var filename=$('#doc_filename'+docid).val() ;
						var encoded = encodeURIComponent(filename);
						var candidate_id=$('#candidate_id').val();
						window.location.href="downloadbgvdocs?filename="+encoded+"&candidate_id="+candidate_id+"";
								}else{
									 window.location.href="loginpage";
								}
							});
								}
						
						</script>
						
	<script type="text/javascript">
function loadContractPanel(){
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
		            			  profile='<span class="label label-success" style="background-color:grey;color:white;">NA</span>';
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
		        	 	var cstatus; var cprofile;var apprstatus;
			        	 $('#employeeTableId').dataTable().fnClearTable();
		        	  	if(response.candidateList.length>0){
		        	  		$("#candidatepanel").show();
		        	  		for(var j=0;j<response.candidateList.length;j++){
		        	  		
			            		 if(response.candidateList[j].candidate_status==null){
			            			  cstatus="Pending";
			            		  }else{
			            			  cstatus=response.candidateList[j].candidate_status;
			            		  } 
			            		 if(response.candidateList[j].status==null){
			            			 apprstatus="Pending";
			            		  }else{
			            			  apprstatus=response.candidateList[j].status;
			            		  }
			            		 
			            		   if(response.candidateList[j].profileName!=""){
			            			  cprofile=response.candidateList[j].profileName;
			            		  }else{
			            			  cprofile='<span class="label label-success" style="background-color:grey;color:white;">NA</span>';
			            		  }
			            		   table1.row.add([
				                    	''+cprofile+'',
				                    	''+response.candidateList[j].candidateName+'',
				                    	'<div style=overflow-y:auto;overflow-x:auto;width:200px;max-height:200px;><input type="hidden" id="tdcatid'+response.candidateList[j].bgc_checklist_id+'" value="'+response.candidateList[j].catName+'"/>'+response.candidateList[j].catName+'</div>',
				                    	'<div style=overflow-y:auto;overflow-x:auto;width:200px;max-height:200px;><input type="hidden" id="tdsubcatid'+response.candidateList[j].bgc_checklist_id+'" value="'+response.candidateList[j].subcatName+'"/>'+response.candidateList[j].subcatName+'</div>',
				                    	'<input type="hidden" id="tdstatusid'+response.candidateList[j].bgc_checklist_id+'" value="'+cstatus+'"/>'+cstatus+'',
				                    	'<input type="hidden" id="apprstatustd'+response.candidateList[j].bgc_checklist_id+'" value="'+apprstatus+'"/>'+apprstatus+'',
				                    	'<a class="btn btn-success btn-sm" data-toggle="modal" onclick="updateCandidateStauts(\''+response.candidateList[j].bgc_checklist_id+'\',\''+cstatus+'\',\''+response.candidateList[j].catName+'\',\''+response.candidateList[j].subcatName+'\',\''+response.candidateList[j].status+'\');" style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-eye"></i></a>'
				                    	]).draw();  
			                }
		        	  	}
		        	  	
		        	  	  
		        	  	  
		        	  	
		        	  	var personal_status=response.personal_status;
		        	  	var education_status=response.education_status;
		        	  	var employment_status=response.employment_status;
		        	  	var personal_Apprstatus=response.personal_Apprstatus;
		        	  	var education_Apprstatus=response.education_Apprstatus;
		        	  	var employment_Apprstatus= response.employment_Apprstatus;
		        	  	
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
		        	  	
		        	  	if(personal_Apprstatus==null){
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
		 $("#cpanel,#candidatepanel").hide();
	 }
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
}

function updateCandidateStauts(bgcChkId,status,catName,subCatName,apprstatus){
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
	}



function approveDocuments(bgcChkId,status,catName,subCatName){
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
	}

function loadCandidateByProfileId(){
	 var profileId=document.getElementById('profileName').value;
	 //$("#cpanel").empty();
	 $("#cpanel").hide();
	 if(profileId==""){
		 $('#candidate').empty();
		 }else {
			 $.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "application/json", // NOT dataType!
		        url  :"CandidatesByProfileId",
		        data:{profileId:profileId},
		        success  : function(response){
		        	  $('#candidate').empty();
			    	  $('#candidate').append($('<option/>').attr("value", '').text("--Select Candidate--"));
		        	for(var i=0;i<response.length;i++)
		     	       {
		        		$('#candidate').append($('<option/>').attr("value", response[i].candidate_id).text(response[i].fullname));
		               }
		            }
			    });
		  }
}

function updateComment(){
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
		$("#commentId").focus();
	}
}

function updateCanStatus(){
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
		$("#commentId").focus();
	}
}

var tablefh = $('#filehistoryTable').DataTable({
 "order": [[0, "desc"]],
lengthMenu: [[5, 10, 15, -1], [5, 10, 15, "All"]],
 bLengthChange: true,
 paging: true
});

function viewfileHistory(chkListId,candidateId){
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
}


var tablech = $('#CommentHistoryTable').DataTable({
 "order": [[0, "desc"]],
  lengthMenu: [[5, 10, 15, -1], [5, 10, 15, "All"]],
  bLengthChange: true,
  paging: true
});
function viewCommentHistory(chkListId){
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
}




function bgcStatus(candId,profileId,bgcStatus){
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
}
function personalDetails(){ 
	var candId=document.getElementById('candidate').value;
	$('<a href="personaldetails?candidateId='+candId+'" target="blank"></a>')[0].click();  
}
function viewpersonaldetails(){
	var candId=document.getElementById('candidate').value;
	$('<a href="viewpersonaldetails?candidateId='+candId+'" target="blank"></a>')[0].click();  
}
function educationalDetails(){
	var candId=document.getElementById('candidate').value;
	$('<a href="vieweducationaldetails?candidateId='+candId+'" target="blank"></a>')[0].click();  
}
function viewemploymentDetails(){
	var candId=document.getElementById('candidate').value;
	$('<a href="viewemploymentdetails?candidateId='+candId+'" target="blank"></a>')[0].click();  
}
function employmentDetails(candId){
	var candId=document.getElementById('candidate').value;
	$('<a href="employmentdetails?candidateId='+candId+'" target="blank"></a>')[0].click();  
}
</script>
</body>
</html>
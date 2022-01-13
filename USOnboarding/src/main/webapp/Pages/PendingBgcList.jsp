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
							<center><h5 class="card-header">Pending BGC List</h5></center>
							<div class="card-body">
								<div class="row">
								<div class="col-md-11 col-sm-12">
									<fieldset>
										<form action="/" method="post" id="saveCandidateForm" class="form-horizontal" enctype="multipart/form-data">
	                                      <!--   <h4><b>Pending BGC List</b></h4>  -->
											<br/>
											<%-- <div class="form-group row">  
											
											 <label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Select Grouping Profile</label>
											   <div class="col-sm-3">
											    <select name="profileName" autoComplete="off" class="form-control text-left" id="profileName" onchange="loadCandidateByProfileId()" required>
										             <option value="">--Select Grouping Profile--</option>
										         <c:forEach var="prof" items="${profileList}">
															<option value="${prof.profile_id}">${prof.profile_name}</option>
														</c:forEach>
										         </select> 
										    </div> 
									    	   <label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Select Candidate</label>
											   <div class="col-sm-3">
											     <select name="candidate" autoComplete="off" class="form-control text-left" id="candidate" onchange="loadContractPanel()" required>
										         </select>
										    </div> 
										    </div> --%>
										   <!--   <br/><br/> style="display:none;"-->
										    <div id="cpanel">
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
																			<c:forEach var="pbgc" items="${bgcPendingList}">
																				<tr>
																					<td>
																					<c:choose>
																					<c:when test="${not empty pbgc.profileName}">
																					${pbgc.profileName}
																					</c:when>
																					<c:otherwise>
																					<span class="label label-success" style="background-color:grey;color:white;">NA</span>
																					</c:otherwise>
																					</c:choose>
																					</td>
																					<td>${pbgc.candidateName}</td>
																					<td><div style=overflow-y:auto;overflow-x:auto;width:200px;max-height:200px;>${pbgc.catName}</div></td>
																					<td><div style=overflow-y:auto;overflow-x:auto;width:200px;max-height:200px;>${pbgc.subcatName}</div></td>
																					<td>
																					<c:if test="${empty pbgc.status}">
																					Initiate</c:if>
																					<c:if test="${not empty pbgc.status}">
																					${pbgc.status}</c:if>
																					
																					
																					</td>
																					<td><a style="letter-spacing: 1px; background-color: #15aabf; color: white;" class="btn btn-info btn-sm addButton" data-toggle="modal" onclick="addComment('${pbgc.candidateId}','${pbgc.bgc_checklist_id}','${pbgc.status}','${pbgc.catName}','${pbgc.subcatName}');"><i class="fa fa-eye"></i></a></td>
																				</tr>
																			</c:forEach>
																		</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									 </div>
										</form>
									</fieldset>
								</div>
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
						<div class="modal-body">
						<center><label><b>Category : </b></label>&nbsp;&nbsp;<span id="catName"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  <label><b>Sub Category : </b></label>&nbsp;&nbsp;<span id="subcatName"></span></center><br/>
					      <div class="form-group row">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Select Status</label>
									<div class="col-sm-5">
												<select id="statusId" name="bgcChkStatus" class="form-control"required>
												   
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
									<button type="button" class="btn btn-primary btn-sm addButton" style="letter-spacing: 1px; background-color: #15aabf; color: white;" id="chistoryId" data-toggle="modal" ><i class="fa fa-history"></i></button>
									</div>
							</div> 
							
							 <div class="form-group row">
								<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Upload File</label>
									<div class="col-sm-5">
										<input type="file" id="bgcfileId" name="bgcfile[]" class="form-control" multiple/>
									</div>
								 <button type="button" class="btn btn-primary btn-sm addButton" style="letter-spacing: 1px; background-color: #15aabf; color: white;" id="fhistoryId" data-toggle="modal" ><i class="fa fa-history"></i></button>	
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
<script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript">
var table = $('#controlPanelTable').DataTable({
//	 "order": [[0, "desc"]],
   bLengthChange: true,
   paging: true
});


function loadContractPanel(){
	 var candidateId=document.getElementById('candidate').value;
	 var profileId=document.getElementById('profileName').value;
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
		        	  		 var sarray=[];var array2=[];
		            	  for(var i=0;i<response.length;i++){
		            		  var status;
		            		  if(response[i].status==null){
		            			  status="Initiate";
		            		  }else{
		            			  status=response[i].status;
		            		  }
		            		  sarray.push(status);
		            		  array2.push(response[i].taskStatus);
		                       table.row.add([
		                    	''+response[i].catName+'',
		                    	''+response[i].subcatName+'',
		                    	''+status+'',
		                    	'<a class="btn btn-success btn-sm" data-toggle="modal" onclick="addComment(\''+response[i].bgc_checklist_id+'\',\''+status+'\',\''+response[i].catName+'\',\''+response[i].subcatName+'\');"><i class="fa fa-eye"></i></a>'
		                     ]).draw();                  
		                   }
		            	//alert("sarray***"+sarray);
		            	var bgcStatus="";
		            	  if(array2.includes("Pre Onboarding")){
		            		  $("#proceedId").attr('disabled', true);
		            		  if(sarray.includes("Initiate") && sarray.includes("InProgress")) {
				            		 $("#completeId").attr('disabled', true);
				            	 }else{
				            		   bgcStatus="Completed";
									   alert("else Pre Onboarding***"); 
									   $("#completeId").attr('disabled', false);
									   $('#completeId').attr('onclick', 'bgcStatus(\''+candidateId+'\',\''+profileId+'\',\''+bgcStatus+'\')');
								   }
		            		 }else{
		            			 bgcStatus="Proceed";
		            			 alert("if Post Onboarding***"); 
			            		 $("#proceedId").attr('disabled', false);
			            		 $('#proceedId').attr('onclick', 'bgcStatus('+candidateId+','+profileId+','+bgcStatus+')');
		            			 /* if(sarray.includes("Initiate") && sarray.includes("InProgress")) {
		            				 alert("if Post Onboarding***"); 
				            		 $("#proceedId").attr('disabled', false);
				            	 }else{
									   alert("in side else***"); 
									   $("#proceedId").attr('disabled', true);
								   } */
		            		 }
		          	}else{
		          	  // alert("No data found");
		             } 
		        	/*  for(var i=0;i<response.length;i++){
		        		    var objTo = document.getElementById('cpanel');
		        		    var divtest = document.createElement("div");
		        		    divtest.setAttribute("class", "form-group row");
		        		    if(response[i].fileName!=null){
		        		    	 divtest.innerHTML = '<label for="inputPassword" class="col-sm-3 control-label"> '+response[i].catName+'</label><div class="col-sm-5"><label for="inputPassword" class="col-sm-5 control-label"><h5>'+response[i].subcatName+'</h5></label><input type="button" class="btn btn-default" id="submitid" value="'+response[i].fileName+'"></div>';
				        		 objTo.appendChild(divtest); 
		        		    }else{
		        		    	 divtest.innerHTML = '<label for="inputPassword" class="col-sm-3 control-label">'+response[i].catName+'</label><div class="col-sm-5"><label for="inputPassword" class="col-sm-5 control-label"><h5>'+response[i].subcatName+'</h5></label><input type="hidden" id="comments'+response[i].comments+'" value="'+response[i].comments+'"/><select id="status'+response[i].bgc_checklist_id+'" name="status'+response[i].bgc_checklist_id+'" onchange="SelectStatus('+response[i].bgc_checklist_id+');"><option value="">Pending</option><Pending</option><option value="InProgress">InProgress</option><option value="Complete">Complete</option></select>&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-success btn-sm" data-toggle="modal" onclick="ViewCommentHistory('+response[i].bgc_checklist_id+');">History</a></div><input type="file" name="bgcfile"/>';
				        		 objTo.appendChild(divtest); 
		        		    }
		        	    } */
		            }
			    });
	 }else {
		 //$("#cpanel").empty();
		 $("#cpanel").hide();
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


function addComment(candidateId,bgcChkId,status,catName,subCatName){
	loadStatus();
 $("#commentId,#bgcfileId").val('');
var setStatus="";
 var $dropdown = $("select[name='bgcChkStatus']");
 if(status!=""){
	 setStatus=status;
 }else{
	 setStatus="Initiate";
 }
 $dropdown.find('option[value="' + setStatus + '"]').attr('selected', true);
    $("#bgcCandidateId").val(candidateId);
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
                     $('#commentModal').modal('hide');
                 //    loadContractPanel();
                     window.location.href="bgcpendinglist";
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
		}
		$("#commentId,#statusId").focus();
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
		            		  var encoded = encodeURIComponent(response[i].fileName);
		            		  tablefh.row.add([
		            			''+response[i].fileid+'',
		                    	'<a href="downloadbgvdocs?filename='+encoded+'&candidate_id='+candidateId+'" style="color:blue">'+response[i].fileName+'</a>',
		                    	''+response[i].posted_by+'',
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
	// $('#commentModal').modal('hide');
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
		            		  tablech.row.add([
		            			''+response[i].commentid+'',
		            			''+response[i].status+'',
		                    	''+response[i].comments+'',
		                      	''+response[i].subdate+'',
		                      	''+response[i].posted_by+''
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
</script> 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.net.URLDecoder"%>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" /> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" href="resources/css/css/select2.min.css"	rel="stylesheet" />

</head>
<body>

	<div id="right-panel" class="right-panel">
	

			
		<div class="content">
			<!-- Animated -->
				<div class="text-left">
<button  type="button" id="backbtn" title="redirect to H1B " class="btn btn-info btn-sm" style="color:white;" >
<i style="font-size:30px;" class="fa fa-arrow-circle-left"></i></button><br><br>
</div>


			<div class="animated fadeIn">

				<div class="row">
					<div class="col">
						<div class="card">
									<center><h5 class="card-header">Admin/Immigration Team Documents</h5></center>
								<input type="hidden" id="cand_id"><input type="hidden" id="init_id">
								
									<div class="card-body">
										<div class="row">
											<div class="col-lg-12">
												<table id="tbl1"
													class="table table-hover table-bordered"
													style="text-align: center;">
													<thead>
														<tr>
																	<th style="text-align: center">Template Name</th>
																	<th style="text-align: center">Candidate Name</th>
																	<th style="text-align: center">Document Name</th>
																	<!-- <th style="text-align: center">Sub Document Name</th> -->
																	<th style="text-align: center">Status</th>
																	<th style="text-align: center">Action</th>
																	<!-- <th style="text-align: center">Download</th> -->
														</tr>
													</thead>
													<tbody id="hdoclist">
														
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						<div class="row">
							<div class="col">
								<div class="card">
									<center><h5 class="card-header">Candidate Documents</h5></center>
									<div class="card-body">
										<div class="row">
											<div class="col-lg-12">
												<table id="tbl2"
													class="table table-hover table-bordered"
													style="text-align: center;">
													<thead>
														<tr>
																    <th>Sl.no</th> 
																	<th style="text-align: center">Template Name</th>
																	<th style="text-align: center">Beneficiary Type</th>
																	<th style="text-align: center">Candidate Name</th>
																	<th style="text-align: center">Document Name</th>
																	<th style="text-align: center">Candidate Status</th>
																	<th style="text-align: center">Admin Status</th>
																	<th style="text-align: center">Action</th>
														</tr>
													</thead>
													<tbody id="hdoclist">
														
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col">
								<div class="card">
									<center><h5 class="card-header"><b>Employee Questionnaire Forms</b></h5></center>
									<div class="card-body">
										<div class="row">
											<div class="col-lg-12">
												<table id="tbl3"
													class="table table-hover table-bordered"
													style="text-align: center;">
													<thead >
														<tr>
																	<th style="text-align: center">Form Name</th>
																	<th style="text-align: center">Candidate Status</th>
																	<th style="text-align: center">Approver Status</th>
																	<th style="text-align: center">Action</th>
																	<th style="text-align: center">Download Questionnaire</th>
														</tr>
													</thead>
													<tbody id="hdoclist">
														
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="modal fade" id="CandDocVerifierStautsModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="top:10px;">
			<div class="modal-dialog modal-lg"   style="max-width:85%;" role="document">
				<div class="modal-content" style="height:100%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b><span id="h1bHistory1"></span></b>
							</h5>
						</center>
					</div>
						<div class="modal-body">
							<b><span id="h1bHistory1"></span></b><b><span id="h1bHistory1"></span></b>
					   		<table id="immiCandDoctable" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>Beneficiary Name</th>
								<th>File Name</th>
							<!-- 	<th>Doc Type</th>	 -->							
								<th><span id="dst"> </span></th>
								<!-- <th>Doc Input</th> -->
								<th>Submitted On</th>
								<th>Submitted By</th>
								<!-- <th>Status</th>	 -->		
								</tr>
								</thead>
								<tbody id="consulatntBody">
								
								</tbody>
							</table>
							
								
							
						
				</div>
			</div>
		</div>
	</div>
	
						<div class="modal fade" id="ah1bDocsModal" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true" style="top:10px;">
								<div class="modal-dialog modal-lg" style="max-width:90%;"
									role="document">
									<div class="modal-content">
										<div class="modal-header" style="padding: .5rem;">
											<button class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<center><h5 class="modal-title" id="exampleModalLabel"
												style="font-size: 15px">
												<b><span id="h1bHeader"></span></b>
											</h5></center>
										</div>
										<div class="modal-body">
										<form action="/" enctype="multipart/form-data"	id="addh1bDetailsForm">
										<div class="row">
							<div class="col">
								<!-- <div class="card"> -->
									<%-- <center><h5 class="card-header"><b>Employee Questionnaire Forms</b></h5></center>--%>
									<div class="card-body"> 
										<div class="row">
											<div class="col-lg-12">
							<div id="approvedH1DocsId">			     
							<table id="tbl5" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>Beneficiary Name</th>
								<th>File Name</th>
							<!-- 	<th>Doc Type</th>	 -->							
								<th>Doc Sub Type</th>
								<th>Doc Input</th>
								<th>Submitted On</th>
								<th>Submitted By</th>
								<!-- <th>Status</th>	 -->		
								</tr>
								</thead>
								<tbody id="consulatntBody">
								
								</tbody>
							</table>
							</div>
							</div>
							</div>
							</div>
							</div>
							<!-- </div> -->
						
										     
											<!-- <div class="form-group row">
													<label class="col-sm-3 control-label"><b>Add Documents</b></label>
													<div class="col-lg-3 control-label">
														<button class="btn btn-success btn-sm" type="button"
															onclick="OtherAdditional();">
															<span class="glyphicon glyphicon-plus" aria-hidden="true">+</span>
														</button>
													</div>
												</div>
												<div id="OtherBtnDiv"></div> -->
												
										</div>
									</form>
									<center>
									   <div class="row" id="h1docslist"  style="display:none;">
											<div class="col-lg-12">
												<table id="h1bdocstable"
													class="table table-hover table-bordered"
													style="text-align: center;">
													<thead>
														<tr>
															<th style="text-align: center">Document Name</th>
															<th style="text-align: center">Document Type</th>
															<th style="text-align: center">Document Sub Type</th>
															<th style="text-align: center">Document Input</th>
															<th style="text-align: center">Submitted On</th>
															<th style="text-align: center">Submitted By</th>
															<th style="text-align: center">Action</th>
														</tr>
													</thead>
													<tbody>
														
													</tbody>
												</table>
											</div>
										</div>
										</center>
									 </div>
									</div>
								</div>
							</div>
							
						
						
						
						</div>
					</div>
					</div>
					
					
</body>
<script src="resources/js/js/jquery-2.1.4.min.js"></script>
	<script src="resources/js/newjs/bootstrap.min.js"></script>
	<script src="resources/js/newjs/formValidation.min.js"></script>
	<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
	<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
		<script type="text/javascript" src="resources/js/js/select2.min.js"></script>
	<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
	<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
<script>


var tablehb = $('#tbl1').DataTable({
	"order" : [ [ 0, "desc" ] ],
	lengthMenu : [ [ 5,10, 15, -1 ], [ 5,10, 15, "All" ] ],
	bLengthChange : true,
	paging : true
});
var table1 = $('#tbl2').DataTable({
	"order" : [ [ 0, "desc" ] ],
	lengthMenu : [ [ 5,10, 15, -1 ], [ 5,10, 15, "All" ] ],
	bLengthChange : true,
	paging : true
});
var tableh1bque = $('#tbl3').DataTable({
	"order" : [ [ 0, "desc" ] ],
	lengthMenu : [ [ 5,10, 15, -1 ], [ 5,10, 15, "All" ] ],
	bLengthChange : true,
	paging : true
});
var tableh1bcd = $('#immiCandDoctable').DataTable({
	 "order": [[0, "desc"]],
  lengthMenu : [ [ 5,10, 15, -1 ], [ 5,10, 15, "All" ] ],
  bLengthChange: true,
  paging: true
});
var tableh1bad = $('#tbl5').DataTable({
	 "order": [[0, "desc"]],
 lengthMenu : [ [ 5,10, 15, -1 ], [ 5,10, 15, "All" ] ],
 bLengthChange: true,
 paging: true
});

var initId=sessionStorage.getItem("initId");
var candid=sessionStorage.getItem("candId");
if(candid==null && initId==null){
	window.location.href="loginpage";
}
$('#cand_id').val(candid);
$('#init_id').val(initId);

$("#backbtn").click(function(event) {
	var candys=$('#cand_id').val();
	sessionStorage.setItem("candys",candys);
	window.location.href="immigration";

	
});
//alert(initId+"-"+candid+"open")

$.ajax({
	type : "GET",
	asyn : false,
	contentType : "application/json",
	url : "initiationhistorybyid",
	data : {
		"candidateid" : candid,
		"initiateid" : initId
	},
	success : function(response) {
		var adminlist=response.adminList;
	  	var candidateList=response.candidateList;
	  	var initiatedList=response.initiatedList;
	  	/* $('#qns_initiateid').val(response.initiate_id);
	  	$('#qns_candidateid').val(candid); */
	  	var profileName=response.profileName;
	  	/* if(profileName!=null){
	  		$('#currInitStatus').text(profileName);
	  	}else{
	  		$('#currInitStatus').text("NA");
	  	} */
	  	 $('#tbl2').dataTable().fnClearTable();
	  	 $('#tbl1').dataTable().fnClearTable();
	   if(tablehb)tablehb.clear();
	   if(adminlist!=null){
	   if(adminlist.length>0){
		   var status; var profile;var adminprs;var questionnarie_id="";var adminupload;
     	  for(var i=0;i<response.adminList.length;i++){
     		  if(response.adminList[i].approved_status==null){
     			  status="Pending";
     		  }else{
     			  status=response.adminList[i].approved_status;
     		  }
     		  if(response.adminList[i].profileName!=""){
     			  profile=response.adminList[i].profileName;
     		  }else{
     			  profile='<span class="label label-success" style="background-color:grey;color:white;">NA</span>';
     		  }
     		
     		 //alert(response.permit_to_posth1b);
     		 if(response.permit_to_posth1b=='Approved'){
     			      adminupload='<a class="btn btn-success btn-sm" onclick="addH1BDoc(\''+response.adminList[i].document_id+'\',\''+status+'\',\''+response.adminList[i].catName+'\',\''+response.adminList[i].initiate_id+'\',\''+response.adminList[i].profile_id+'\',\''+response.adminList[i].profile_type+'\');" style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-eye"></i></a>';
				}else{
					adminupload='<a class="btn btn-secondary btn-sm" style="letter-spacing: 1px; background-color:grey; color: white;" title="Documents not available" disabled><i class="fa fa-eye"></i></a>';
				}
     		//alert(aprintsts);
     		 tablehb.row.add([
             	''+profile+'',
             	''+response.adminList[i].candidateName+'',
             	'<div style=overflow-y:auto;overflow-x:auto;width:200px;max-height:200px;>'+response.adminList[i].catName+'</div>',
             	/* '<div style=overflow-y:auto;overflow-x:auto;width:200px;max-height:200px;>'+response.adminList[i].subcatName+'</div>', */
             	'<input type="hidden" id="statusTd'+response.adminList[i].document_id+'" value="'+status+'"/>'+status+'',
             	''+adminupload+'',
             	//''+adminprs+'',
             	]).draw();                  
            }
 	  	 }
	   }
	   if(response.candidateList!=null){
	   if(response.candidateList.length>0){
	  		$("#candidatepanel").show();
	  		var apprstatus;var cstatus;var printstatus;var printed_status;var candName;//var m;
	  		for(var j=0;j<response.candidateList.length;j++){
	  		      if(response.candidateList[j].approved_status==null){
   			     apprstatus="Pending";
   		      }else{
   			    apprstatus=response.candidateList[j].approved_status;
   		       }
	  		     var m=j+1;
       		 if(response.candidateList[j].candidate_status==null){
       			  cstatus="Pending";
       			  if(response.candidateList[j].profile_type=='Kids'){
       				 candName=response.candidateList[j].profile_type+"("+response.candidateList[j].beneficiary_Name+")";
           			//  action='<a class="btn btn-default btn-sm" data-toggle="modal" onclick="updateCandDocVerifierStauts(\''+response.candidateList[j].document_id+'\',\''+response.candidateList[j].catName+'\',\''+response.candidateList[j].initiate_id+'\',\''+response.candidateList[j].profile_id+'\',\''+response.candidateList[j].profile_type+'\',\''+apprstatus+'\',\''+response.candidateList[j].is_same+'\',\''+response.candidateList[j].profileName+'\',\''+response.candidateList[j].questionnarie_id+'\');" style="letter-spacing: 1px; background-color:#15aabf; color: white;"><i class="fa fa-eye"></i></a>';
           			action='<a class="btn btn-secondary btn-sm" style="letter-spacing: 1px; background-color:grey; color: white;" title="Documents not available" disabled><i class="fa fa-eye"></i></a>';

       			  }else{
       				candName=response.candidateList[j].profile_type;
           			//  action='<a class="btn btn-default btn-sm" data-toggle="modal" onclick="updateCandDocVerifierStauts(\''+response.candidateList[j].document_id+'\',\''+response.candidateList[j].catName+'\',\''+response.candidateList[j].initiate_id+'\',\''+response.candidateList[j].profile_id+'\',\''+response.candidateList[j].profile_type+'\',\''+apprstatus+'\',\''+response.candidateList[j].is_same+'\',\''+response.candidateList[j].profileName+'\',0);" style="letter-spacing: 1px; background-color:#15aabf; color: white;"><i class="fa fa-eye"></i></a>';
       				action='<a class="btn btn-secondary btn-sm" style="letter-spacing: 1px; background-color:grey; color: white;" title="Documents not available" disabled><i class="fa fa-eye"></i></a>';
       			  }
       			 remchk='<input type="checkbox" style="width:25px;height:25px;" id="remcheck'+j+'" name="remcheck" onclick="remcheckVal(\''+response.candidateList[j].catName+'\',\''+response.candidateList[j].profileName+'\',\''+candName+'\',\''+j+'\');" value='+j+'>';	
       		  }else{
       			  cstatus=response.candidateList[j].candidate_status;
       			  if(response.candidateList[j].profile_type=='Kids'){
       				 candName=response.candidateList[j].profile_type+"("+response.candidateList[j].beneficiary_Name+")";
           			  action='<a class="btn btn-success btn-sm" data-toggle="modal" onclick="updateCandDocVerifierStauts(\''+response.candidateList[j].document_id+'\',\''+response.candidateList[j].catName+'\',\''+response.candidateList[j].initiate_id+'\',\''+response.candidateList[j].profile_id+'\',\''+response.candidateList[j].profile_type+'\',\''+apprstatus+'\',\''+response.candidateList[j].is_same+'\',\''+response.candidateList[j].profileName+'\',\''+response.candidateList[j].questionnarie_id+'\');" style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-eye"></i></a>';
       			  }else{
       				candName=response.candidateList[j].profile_type;
           			  action='<a class="btn btn-success btn-sm" data-toggle="modal" onclick="updateCandDocVerifierStauts(\''+response.candidateList[j].document_id+'\',\''+response.candidateList[j].catName+'\',\''+response.candidateList[j].initiate_id+'\',\''+response.candidateList[j].profile_id+'\',\''+response.candidateList[j].profile_type+'\',\''+apprstatus+'\',\''+response.candidateList[j].is_same+'\',\''+response.candidateList[j].profileName+'\',0);" style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-eye"></i></a>';
       			  }
       			 remchk='<input type="checkbox" style="width:25px;height:25px;" id="remcheck'+j+'" name="remcheck" disabled>';
       		  } 
       		   if(response.candidateList[j].profileName!=""){
       			  cprofile=response.candidateList[j].profileName;
       		  }else{
       			  cprofile='<span class="label label-success" style="background-color:grey;color:white;">NA</span>';
       		  }
       	
       		/*  if(response.candidateList[j].candidate_status!=null){
        			if(response.candidateList[j].printed_status!=null){
              		  if(response.candidateList[j].printed_status=="Yes"){
              			 printstatus='<a class="btn btn-secondary btn-sm" style="letter-spacing: 0px; background-color: #15aabf; color: white;" data-toggle="modal" onclick="downloadcategories(\''+response.candidateList[j].document_id+'\',\''+response.candidateList[j].initiate_id+'\',\''+candidateid+'\')" ><i class="fa fa-download"></i></a><br><font color=red>Is it Printed?</font><br> Yes<input type="radio" name="isprinted'+j+'" id="isprintedyes'+j+'" onclick="getprintedYes(\''+response.candidateList[j].document_id+'\',\''+response.candidateList[j].initiate_id+'\',\''+response.candidateList[j].profile_id+'\',\''+response.candidateList[j].profile_type+'\',\''+candidateid+'\',\''+response.candidateList[j].questionnarie_id+'\')" value="Yes"  style="width: 15px; height: 15px;" checked/> No<input type="radio" name="isprinted'+j+'" id="isprintedno'+j+'" onclick="getprintedNo(\''+response.candidateList[j].document_id+'\',\''+response.candidateList[j].initiate_id+'\',\''+response.candidateList[j].profile_id+'\',\''+response.candidateList[j].profile_type+'\',\''+candidateid+'\',\''+response.candidateList[j].questionnarie_id+'\')" value="No"  style="width: 15px; height: 15px;"/>';
              		  }else { 
              			printstatus='<a class="btn btn-secondary btn-sm" style="letter-spacing: 0px; background-color: #15aabf; color: white;" data-toggle="modal" onclick="downloadcategories(\''+response.candidateList[j].document_id+'\',\''+response.candidateList[j].initiate_id+'\',\''+candidateid+'\')" ><i class="fa fa-download"></i></a><br><font color=red>Is it Printed?</font><br> Yes<input type="radio" name="isprinted'+j+'" id="isprintedyes'+j+'"  onclick="getprintedYes(\''+response.candidateList[j].document_id+'\',\''+response.candidateList[j].initiate_id+'\',\''+response.candidateList[j].profile_id+'\',\''+response.candidateList[j].profile_type+'\',\''+candidateid+'\',\''+response.candidateList[j].questionnarie_id+'\')" value="Yes" style="width: 15px; height: 15px;"/> No<input type="radio" name="isprinted'+j+'" id="isprintedno'+j+'" onclick="getprintedNo(\''+response.candidateList[j].document_id+'\',\''+response.candidateList[j].initiate_id+'\',\''+response.candidateList[j].profile_id+'\',\''+response.candidateList[j].profile_type+'\',\''+candidateid+'\',\''+response.candidateList[j].questionnarie_id+'\')" value="No"   style="width: 15px; height: 15px;" checked/>';
              		  }
      	  		  }else{
           			 printstatus='<a class="btn btn-secondary btn-sm" style="letter-spacing: 0px; background-color: #15aabf; color: white;" data-toggle="modal" onclick="downloadcategories(\''+response.candidateList[j].document_id+'\',\''+response.candidateList[j].initiate_id+'\',\''+candidateid+'\')" ><i class="fa fa-download"></i></a><br><font color=red>Is it Printed?</font><br> Yes<input type="radio" name="isprinted'+j+'" id="isprintedyes'+j+'" onclick="getprintedYes(\''+response.candidateList[j].document_id+'\',\''+response.candidateList[j].initiate_id+'\',\''+response.candidateList[j].profile_id+'\',\''+response.candidateList[j].profile_type+'\',\''+candidateid+'\',\''+response.candidateList[j].questionnarie_id+'\')" value="Yes" style="width: 15px; height: 15px;"/> No<input type="radio" name="isprinted'+j+'" id="isprintedno'+j+'" onclick="getprintedNo(\''+response.candidateList[j].document_id+'\',\''+response.candidateList[j].initiate_id+'\',\''+response.candidateList[j].profile_id+'\',\''+response.candidateList[j].profile_type+'\',\''+candidateid+'\',\''+response.candidateList[j].questionnarie_id+'\')" value="No" checked="true"  style="width: 15px; height: 15px;"/>';
              		  }
       			}else{
       				printstatus='<a class="btn btn-secondary btn-sm" style="letter-spacing: 0px; background-color: grey; color: white;" data-toggle="modal" disabled><i class="fa fa-download"></i></a><br><font color=red>Is it Printed?</font><br> Yes<input type="radio" name="isprinted'+j+'" id="isprintedyes'+j+'" onclick="getprintedYes(\''+response.candidateList[j].document_id+'\',\''+response.candidateList[j].initiate_id+'\',\''+response.candidateList[j].profile_id+'\',\''+response.candidateList[j].profile_type+'\',\''+candidateid+'\')" value="Yes" style="width: 15px; height: 15px;"disabled/>No<input type="radio" name="isprinted'+j+'" id="isprintedno'+j+'" onclick="getprintedNo(\''+response.candidateList[j].document_id+'\',\''+response.candidateList[j].initiate_id+'\',\''+response.candidateList[j].profile_id+'\',\''+response.candidateList[j].profile_type+'\',\''+candidateid+'\',\''+response.candidateList[j].questionnarie_id+'\')" value="No"  style="width: 15px; height: 15px;"disabled/>';
                }   */ 
       		table1.row.add([
       			''+m+'',
            	''+cprofile+'',
            	''+candName+'',
            	''+response.candidateList[j].candidateName+'',
            	''+response.candidateList[j].catName+'',
            	/* '<div style=overflow-y:auto;overflow-x:auto;width:200px;max-height:200px;><input type="hidden" id="tdsubcatid'+response.candidateList[j].h1b_checklist_id+'" value="'+response.candidateList[j].subcatName+'"/>'+response.candidateList[j].subcatName+'</div>', */
            	'<input type="hidden" id="tdstatusid'+response.candidateList[j].document_id+'" value="'+cstatus+'"/>'+cstatus+'',
            	'<input type="hidden" id="h1bapprstatustd'+response.candidateList[j].document_id+'" value="'+apprstatus+'"/>'+apprstatus+'',
				''+action+'',
				/* ''+printstatus+'',
				''+remchk+'', */
        	]).draw(); 
              }
	  	      }
	   }
	   
	   $('#tbl3').dataTable().fnClearTable();
	   if(tableh1bque)tableh1bque.clear();
	  var quearr=["Client & Vendor Questionnaire","H1B Questionnaire","Public Benefits Checklist"];
	  if(response.candidateList!=null){
		 if(response.candidateList.length>0){
	  for(var j=0;j<quearr.length;j++){
		   var tr1;var tr2;var tr3;var tr4;var tr5;
		   var clientObj=response.clientObj;var h1bObj=response.h1bObj;var pbcObj=response.pbcObj;
		  
		  if(quearr[j]=='Client & Vendor Questionnaire'){
			 
			   if(clientObj==null){
				   tr1=quearr[j];
				   tr2='<span class="label label-info" id="client_canstatus">Pending</span>';
				   tr3='<span class="label label-info"  id="client_adminstatus">Pending</span>';
				   tr4='<button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" class="btn btn-success btn-sm addButton" disabled title="Candidate yet to be submitted" id="cid"><i class="fa fa-edit" aria-hidden="true"></i></button>';
					tr5='<button style="letter-spacing: 1px; background-color: #15aabf; color: white;" class="btn btn-success btn-sm addButton" disabled title="Candidate yet to be submitted"><i class="fa fa-download" aria-hidden="true"></i></button>';
						//$("#client_canstatus").text("Pending");
					//$("#client_adminstatus").text("Pending");
					//$("#cid,#downloadcvQuestionnaires").attr("disabled",true).prop("title","Candidate yet to be submitted");
				}
				else{
					// alert(clientObj.candidate_status+"***cvl**"+clientObj.verifier_status);
					 var qnstype="cvQuestionnaires";
					 tr1=quearr[j];
				  	if (clientObj.candidate_status == null) {
						//$("#client_canstatus").text("Pending");
						 tr2='<span class="label label-info"  id="client_canstatus">Pending</span>';
						//$("#downloadcvQuestionnaires").attr("disabled",true).prop("title","Candidate yet to be submitted");
						 tr5='<button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" class="btn btn-success btn-sm addButton" id="downloadcvQuestionnaires" title="Candidate yet to be submitted" disabled><i class="fa fa-download" aria-hidden="true"></i></button>';
					} else {
						 tr4='<button	style="letter-spacing:1px;background-color:#15aabf;color:white;"class="btn btn-success btn-sm addButton" onclick="clientvendordetails()"  id="cid"><i class="fa fa-edit" aria-hidden="true"></i></button>';
					//	$("#client_canstatus").text(clientObj.candidate_status);
						 tr2='<span class="label label-info"  id="client_adminstatus">'+clientObj.candidate_status+'</span>';
					}
					if (clientObj.verifier_status == null) {
						//$("#client_adminstatus").text("Pending");
						 tr3='<span class="label label-info"  id="client_adminstatus">Pending</span>';
					} else {
						 tr3='<span class="label label-info"  id="client_adminstatus">'+clientObj.verifier_status+'</span>';
						//$("#client_adminstatus").text(clientObj.verifier_status);
						if(clientObj.verifier_status=='Approved'){
							//$("#downloadcvQuestionnaires").attr("disabled",false);
							 tr5='<button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" class="btn btn-success btn-sm addButton" id="downloadcvQuestionnaires" onclick="downloadque(\''+qnstype+'\')"><i class="fa fa-download" aria-hidden="true"></i></button>';
						}else{
							//$("#downloadcvQuestionnaires").attr("disabled",true).prop("title","Verifier yet to Approve");
							 tr5='<button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" class="btn btn-success btn-sm addButton" id="downloadcvQuestionnaires" title="Verifier yet to Approve" disabled><i class="fa fa-download" aria-hidden="true"></i></button>';
						}
					}
				}
			  
		   }
		  if(quearr[j]=='H1B Questionnaire'){
			   if(h1bObj==null){
					/*$("#h1b_canstatus").text("Pending");$("#h1b_adminstatus").text("Pending");
					$("#hid,#downloadh1bQuestionnaires").attr("disabled",true).prop("title","Candidate yet to be submitted");*/
				   tr1=quearr[j];
				   tr2='<span class="label label-info" id="client_canstatus">Pending</span>';
				   tr3='<span class="label label-info"  id="client_adminstatus">Pending</span>';
				   tr4='<button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" class="btn btn-success btn-sm addButton" disabled title="Candidate yet to be submitted" id="cid"><i class="fa fa-edit" aria-hidden="true"></i></button>';
				   tr5='<button style="letter-spacing: 1px; background-color: #15aabf; color: white;" class="btn btn-success btn-sm addButton" disabled title="Candidate yet to be submitted"><i class="fa fa-download" aria-hidden="true"></i></button>';
				}
				else{
					//alert(h1bObj.candidate_status+"***h1b**"+h1bObj.verifier_status);
					var qnstype="h1bQuestionnaires";
					 tr1=quearr[j];
					  	if (h1bObj.candidate_status == null) {
							//$("#client_canstatus").text("Pending");
							 tr2='<span class="label label-info"  id="client_canstatus">Pending</span>';
							//$("#downloadcvQuestionnaires").attr("disabled",true).prop("title","Candidate yet to be submitted");
							 tr5='<button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" class="btn btn-success btn-sm addButton" id="downloadh1bQuestionnaires" title="Candidate yet to be submitted" disabled><i class="fa fa-download" aria-hidden="true"></i></button>';
						} else {
							 tr4='<button	style="letter-spacing:1px;background-color:#15aabf;color:white;"class="btn btn-success btn-sm addButton" onclick="h1bdetails()"  id="cid"><i class="fa fa-edit" aria-hidden="true"></i></button>';
						//	$("#client_canstatus").text(clientObj.candidate_status);
							 tr2='<span class="label label-info"  id="client_adminstatus">'+h1bObj.candidate_status+'</span>';
						}
						if (h1bObj.verifier_status == null) {
							//$("#client_adminstatus").text("Pending");
							 tr3='<span class="label label-info"  id="client_adminstatus">Pending</span>';
						} else {
							 tr3='<span class="label label-info"  id="client_adminstatus">'+h1bObj.verifier_status+'</span>';
							//$("#client_adminstatus").text(clientObj.verifier_status);
							if(h1bObj.verifier_status=='Approved'){
								//$("#downloadcvQuestionnaires").attr("disabled",false);
								 tr5='<button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" class="btn btn-success btn-sm addButton" id="downloadh1bQuestionnaires" onclick="downloadque(\''+qnstype+'\')"><i class="fa fa-download" aria-hidden="true"></i></button>';
							}else{
								//$("#downloadcvQuestionnaires").attr("disabled",true).prop("title","Verifier yet to Approve");
								 tr5='<button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" class="btn btn-success btn-sm addButton" id="downloadh1bQuestionnaires" title="Verifier yet to Approve" disabled><i class="fa fa-download" aria-hidden="true"></i></button>';
							}
						}
				}
			   
			   
			   
		   }
		  if(quearr[j]=='Public Benefits Checklist'){
			   if(pbcObj==null){
					/*$("#h1b_canstatus").text("Pending");$("#h1b_adminstatus").text("Pending");
					$("#hid,#downloadh1bQuestionnaires").attr("disabled",true).prop("title","Candidate yet to be submitted");*/
				   tr1=quearr[j];
				   tr2='<span class="label label-info" id="client_canstatus">Pending</span>';
				   tr3='<span class="label label-info"  id="client_adminstatus">Pending</span>';
				   tr4='<button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" class="btn btn-success btn-sm addButton" disabled title="Candidate yet to be submitted" id="cid"><i class="fa fa-edit" aria-hidden="true"></i></button>';
				   tr5='';
				}
				else{
					// alert(pbcObj.candidate_status+"***pbc**"+pbcObj.verifier_status);
					 tr1=quearr[j];
					  	if (pbcObj.candidate_status == null) {
							//$("#client_canstatus").text("Pending");
							 tr2='<span class="label label-info"  id="client_canstatus">Pending</span>';
							//$("#downloadcvQuestionnaires").attr("disabled",true).prop("title","Candidate yet to be submitted");
						} else {
							 tr4='<button style="letter-spacing:1px;background-color:#15aabf;color:white;"class="btn btn-success btn-sm addButton" onclick="benefitsdetails()"  id="cid"><i class="fa fa-edit" aria-hidden="true"></i></button>';
						//	$("#client_canstatus").text(clientObj.candidate_status);
							 tr2='<span class="label label-info"  id="client_adminstatus">'+pbcObj.candidate_status+'</span>';
						}
						if (pbcObj.verifier_status == null) {
							//$("#client_adminstatus").text("Pending");
							 tr3='<span class="label label-info"  id="client_adminstatus">Pending</span>';
						} else {
							 tr3='<span class="label label-info"  id="client_adminstatus">'+pbcObj.verifier_status+'</span>';
							//$("#client_adminstatus").text(clientObj.verifier_status);
						}
						tr5='';
				}
		   }
		   
		   tableh1bque.row.add([
            	''+tr1+'',
            	''+tr2+'',
            	''+tr3+'',
            	''+tr4+'',
            	''+tr5+'',
        	]).draw();  
	     }
	   }
	}		 
  }

});
/* sessionStorage.clear();
 */
 function h1bdetails() {
		getsesVal().done(function(data){
			  if(data!=""){
					var candId=$('#cand_id').val();
					var initiateid=$('#init_id').val();
		//var candId = document.getElementById('candidate').value;
		$('<a href="h1bqueadmin?candidateId='+candId+'&&initiateid='+initiateid+'"" target="blank"></a>')[0].click();
			  }else{window.location.href="loginpage";}});
			  }
 
 function clientvendordetails() {
		getsesVal().done(function(data){
			  if(data!=""){
				  var initiateid=$('#init_id').val();
		var candId=$('#cand_id').val();
		$('<a href="cvlqueadmin?candidateId='+candId+'&&initiateid='+initiateid+'" target="blank"></a>')[0].click();
			  }else{window.location.href="loginpage";}});
			  }
 
 function benefitsdetails() {
		getsesVal().done(function(data){
			  if(data!=""){
				  var initiateid=$('#init_id').val();
		var candId=$('#cand_id').val();
		$('<a href="updatepbc?candidateId='+candId+'&&initiateid='+initiateid+'" target="blank"></a>')[0].click();
			  }else{window.location.href="loginpage";}});
			  }
 
 
function updateCandDocVerifierStauts(docTypeId,docTypeName,initiateid,profile_id,profile_type,apprstatus,is_same,profileName,questionnarie_id){
	  $('#CandDocVerifierStautsModal').modal('show');
	  $('#h1bHistory1').text(docTypeName+" Details");
	getsesVal().done(function(data){
		if(data!=""){
			var candidateid=$('#cand_id').val();
	$.ajax({
    	type : "get",
        url  : "getCandidateDocumentsByIds",
        contentType:"application/json",
        cache : false,
        async : false,
        data:{
        	"docTypeId":docTypeId,
        	"initiateid":initiateid,
        	"candidateid" : candidateid,
        	"profile_id" : profile_id,
        	"profile_type" : profile_type,
        	"questionnarie_id" : questionnarie_id,
        	},
        success  : function(response){
        	var dochistoryList=response.dochistoryList;
   
        	   if (tableh1bcd) tableh1bcd.clear();
        	   $('#immiCandDoctable').dataTable().fnClearTable();
        	   
        	  	if(dochistoryList!=""){
            	  for(var i=0;i<dochistoryList.length;i++){
            		   // alert(response[i].beneficiary_Name);
            		  var doctypeinput;
            			var fname=dochistoryList[i].file_name;
	 		          	var encoded = encodeURIComponent(fname);
	    				var inputval=dochistoryList[i].inputval;
	    				if(inputval!=null){
	    					 $('#dst').text("Document Input");
	    					
	    					tableh1bcd.row.add([
		                    	''+dochistoryList[i].document_id+'',
		                    	''+dochistoryList[i].beneficiary_Name+'',
		                    	'<a href="downloadh1bdocs?filename='+encoded+'&candidate_id='+candidateid+'" style="color:blue">'+dochistoryList[i].file_name+'</a>',
		                    	//'<span onclick="downloadDocCust('+response[i].file_name+','+response[i].filetype+','+custName+')" style="color: blue">'+response[i].file_name+'</span>',
		                    	//''+response[i].doctypename+'',
		                    	/*''+dochistoryList[i].subdoctypename+'',*/
		                    	''+inputval+'',
		                    	''+dochistoryList[i].submit_date+'',
								''+dochistoryList[i].posted_by+''
		                     ]).draw();
	    				}else{
	    					$('#dst').text("Document Sub Type");
	    					tableh1bcd.row.add([
		                    	''+dochistoryList[i].document_id+'',
		                    	''+dochistoryList[i].beneficiary_Name+'',
		                    	'<a href="downloadh1bdocs?filename='+encoded+'&candidate_id='+candidateid+'" style="color:blue">'+dochistoryList[i].file_name+'</a>',
		                    	//'<span onclick="downloadDocCust('+response[i].file_name+','+response[i].filetype+','+custName+')" style="color: blue">'+response[i].file_name+'</span>',
		                    	//''+response[i].doctypename+'',
		                    	''+dochistoryList[i].subdoctypename+'',
		                    	/*''+inputval+'',*/
		                    	''+dochistoryList[i].submit_date+'',
								''+dochistoryList[i].posted_by+''
		                     ]).draw();
	    				}
	    				                  
                   }
          	}
        
    	/*  var apprstatustd = $("#h1bapprstatustd"+docTypeId).val();
		 var $dropdown4=$("select[name='candocapprstatus']");
		 $dropdown4.find('option[value="'+apprstatustd+'"]').text(apprstatustd).attr('selected', true); */ 
			/*var $dropdown4=$("select[name='candocapprstatus']");
				$dropdown4.find('option[value="'+apprstatustd+'"]').attr('selected', true);*/
		
		
      
      },
      
  //	''+response[i].docStatus+''
     error: function(){  
     alert('Error while request..');
    }
      
  });
		}else{window.location.href="loginpage";}});
 }
 
function addH1BDoc(doctypeid,status,docName,intiateid,profile_id,profile_type){
	getsesVal().done(function(data){
		if(data!=""){
	var candidateid = document.getElementById('cand_id').value;
	$('#h1bHeader').text('');
	var view_type="Admin";
	 $.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "application/json", // NOT dataType!
	        url  :"getimmisubdocumentbydoctypeid",
	        data:{
	        	candidateid : candidateid,
	        	intiateid : intiateid,
	        	document_id : doctypeid,
	        	"profile_id" : profile_id,
	        	"benficiary_type" : profile_type,
	        	"view_type" : view_type,
	        	},
	        success  : function(response){
	        	var subDocTypeList=response.subdocttypeListAdmin;
	        	var docList=response.ah1docList;
	        	//approvedH1DocsId
	        	 if (tableh1bad) tableh1bad.clear();
	        	   $('#tbl5').dataTable().fnClearTable();
	        	 if(docList.length>0){
	        			//$('#approvedH1DocsId').show();
	        			var haction;
	            	  for(var i=0;i<docList.length;i++){
	            		   // alert(response[i].beneficiary_Name);
	            			var fname=docList[i].file_name;
		 		          	var encoded = encodeURIComponent(fname);
		 		          	var inputval="";
		    				if(docList[i].inputval!=null){
		    					inputval=docList[i].inputval;
		    				 }
		    				
		    				/*  if(docList[i].subdoctypename=='H1B Approval Copy'){
		    					 haction='<a class="btn btn-success btn-sm" data-toggle="modal" onclick="editH1BAprovalDoc(\''+docList[i].document_id+'\',\''+docList[i].subdoctypename+'\',\''+docList[i].file_name+'\',\''+docList[i].h1bId+'\',\''+docList[i].isdocshowntocand+'\');" style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-edit"></i></a>'; 
		    				 }else if(docList[i].subdoctypename=='H1B RFE Copy'){
		    					// data-toggle="modal" data-target="#edith1bDocsModal"
		    					 haction='<a class="btn btn-success btn-sm" data-toggle="modal" onclick="editRFEDoc(\''+docList[i].document_id+'\',\''+docList[i].subdoctypename+'\',\''+inputval+'\',\''+docList[i].file_name+'\',\''+docList[i].isdocshowntocand+'\');" style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-edit"></i></a>';
		    				 }else if(docList[i].subdoctypename=='Receipt Copy'){
		    					 haction='<a class="btn btn-success btn-sm" data-toggle="modal" onclick="editH1BDoc(\''+docList[i].document_id+'\',\''+docList[i].subdoctypename+'\',\''+docList[i].file_name+'\',\''+docList[i].isdocshowntocand+'\');" style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-edit"></i></a>'; 
		    				 }else{
		    					 haction='<a class="btn btn-success btn-sm" data-toggle="modal" " onclick="editH1BDoc(\''+docList[i].document_id+'\',\''+docList[i].subdoctypename+'\',\''+docList[i].file_name+'\',\''+docList[i].isdocshowntocand+'\');" style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-edit"></i></a>';  
		    				 } */
		    				tableh1bad.row.add([
	                    	''+docList[i].document_id+'',
	                    	''+docList[i].beneficiary_Name+'',
	                    	'<a href="downloadh1bdocs?filename='+encoded+'&candidate_id='+candidateid+'" style="color:blue">'+docList[i].file_name+'</a>',
	                    	//'<span onclick="downloadDocCust('+response[i].file_name+','+response[i].filetype+','+custName+')" style="color: blue">'+response[i].file_name+'</span>',
	                    	//''+response[i].doctypename+'',
	                    	''+docList[i].subdoctypename+'',
	                    	''+inputval+'',
	                    	''+docList[i].submit_date+'',
							''+docList[i].posted_by+'',
							//''+haction+'',
	                     ]).draw();                  
	                   }
	        	  	}else{
	        	  		//$('#approvedH1DocsId').hide();
	        	  	}
	        	 
	        	$('#h1bHeader').text(docName +" Details");
	        	$('#addh1bDetailsForm').bootstrapValidator('resetForm', true);
	        	$("#ah1bbtnSubmit").attr("disabled", false);
		        $('#ah1bDocsModal').modal('show');
	            }
	  });
		}else{window.location.href="loginpage";}});
}

 
sessionStorage.clear();

</script>
</html>
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

.btn-colorb{
	background-color:#195AAD!important;
}

/* #updateSubCategoryForm .form-group{
    width:130%;
} */
</style>
<body>
<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">Add Document Type</h5>
							<div class="card-body">
								<div class="row">
									<div class="col-md-8 col-sm-12">
										<form action="/" enctype="multipart/form-data"
											id="saveCategoryForm">
											<input type="hidden" name="empno" id="empno"value="${empno}">
											<div>
												<fieldset>

													<div>

														<div class="form-group row">
															<label class="col-sm-5 col-form-label"><span
																style="color: red">*</span>Document Type</label>
															<div class="col-sm-5">
																<input type="text" class="form-control" name="docname" placeholder="Enter document type"
																	id="docname"> <span id="catN"
																	style="color: red;"></span>
															</div>
														</div>
													</div>
												</fieldset>
											</div>
											<div></div>
											<div class="text-center ml-5">
												<button type="button" class="btn btn-info btn-sm"
													id="btnSubmit">Save</button>
												<button type="reset" class="btn btn-info btn-sm btn-colorb"
													id="btnResetId">Reset</button>
													<!-- onClick="window.location.reload()" -->
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						
						<div class="card">
							<h5 class="card-header">Add Sub Document Type</h5>
							<div class="card-body">
								<div class="row">
									<div class="col-md-8 col-sm-12">
										<form action="/" enctype="multipart/form-data"
											id="subsaveCategoryForm">
											
											<div>
												<fieldset>
												<input type="hidden" id="asamecatspanval" name="asamecatspanval"/>
													<div> 
														<div class="form-group row">
															<label class="col-sm-5 col-form-label"><span
																style="color: red">*</span>Select Document Type</label>
															<div class="col-sm-5">
																<select class="form-control" id="doctypeid"
																	name="doctypeid" required>
																	<option value="">--Select Category--</option>
																	<c:forEach var="catlist" items="${docTypeyList}">
																		<option value="${catlist.documenttype_id}">${catlist.document_type}</option>
																	</c:forEach>
																</select>
															</div>
														</div>

														<div class="form-group row">
															<label class="col-sm-5 col-form-label"><span
																style="color: red">*</span>Sub Document Type</label>
															<div class="col-sm-5">
																<input type="text" class="form-control" name="subdocname" id="subdocname" placeholder="Enter sub document type"> 
															<span id="subcatN" style="color: red;"></span>
															</div>
														</div>

														<div class="form-group row">
															<label for="inputPassword" class="col-sm-5 control-label"><Span
																style="color: red;">*</Span>Is this document to be
																submitted by candidate?</label>
															<div class="col-sm-5">
																<label>Yes</label>&nbsp;<input type="radio"
																	name="issubdocname" id="issubdocname" value="1"
																	style="width: 20px; height: 20px;" required />&nbsp;<label>No</label>&nbsp;<input
																	type="radio" id="issubdocname" name="issubdocname"
																	value="0" style="width: 20px; height: 20px;" /> <br>
															</div>
														</div>

														<div class="form-group row">
															<label for="inputPassword" class="col-sm-5 control-label">Is
																Sub Document Type Same As Document Type?</label>
															<div class="col-sm-5">
																<label></label>&nbsp;<input type="checkbox"
																	id="sameas_doctype" name="sameas_doctype"
																	style="width: 20px; height: 20px;" /> <br>
															</div>
															<span id="asamecatspanid" style="color:red"></span>
														</div>
														
													</div>
												</fieldset>
											</div>
											<div>
											</div>
											<div class="text-center ml-5">
												<button type="button" class="btn btn-info btn-sm"
													id="subbtnSubmit">Save</button>
												<button type="reset" class="btn btn-info btn-sm btn-colorb"
													onClick="window.location.reload()">Reset</button>
													<!-- id="ubtnResetId"  -->
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						 


						<div class="card" id="responseCard">
							<h5 class="card-header">Document Type Details</h5>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-striped" id="vendorTable">
										<thead>
											<tr>
												<th scope="col">Document Type</th>
												<th scope="col">Sub Document  Type</th>
												<th scope="col">Submitted by Candidate</th>
												<th scope="col">Document Type</th>
												<th scope="col">Sub Document Type</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="doclist" items="${docsList}">
												<tr>
												<input type="hidden" id="issameastd${doclist.subdoctypeid}" name="issameastd" value="${doclist.isameas_doctype}">
												<input type="hidden" id="doctypenameTd${doclist.subdoctypeid}" value="${doclist.doctypename}">
												<input type="hidden" id="subdoctypename${doclist.subdoctypeid}" name="doctypename" value="${doclist.subdoctypename}">
												<input type="hidden" id="issubycand${doclist.subdoctypeid}" name="issubycand" value="${doclist.issubycand}">
													<td>${doclist.doctypename}</td>
													<td>${doclist.subdoctypename}</td>
													<td>
													<c:if test="${doclist.issubycand==1}">
													<span style="color:blue;"><b>Yes</b></span>
													</c:if>
													<c:if test="${doclist.issubycand==0}">
													<b>No</b>
													</c:if>
													</td>
													<td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" 
											onclick="editDocument(${doclist.doctypeid},'${doclist.doctypename}');" class="btn btn-info btn-sm addButton">
											<i class="fa fa-edit" aria-hidden="true"></i>
								</button></td>
								<td>
								<c:choose>
								<c:when test="${not empty doclist.subdoctypeid}">
								<button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" 
											onclick="editSubDocument(${doclist.doctypeid},'${doclist.subdoctypeid}');" class="btn btn-info btn-sm addButton">
											<i class="fa fa-edit" aria-hidden="true"></i>
								</button>
								</c:when>
								<c:otherwise>
								<button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" 
											onclick="editSubDocument(${doclist.doctypeid},'${doclist.subdoctypeid}');" class="btn btn-info btn-sm addButton" disabled>
											<i class="fa fa-edit" aria-hidden="true"></i>
								</button>
								</c:otherwise>
								</c:choose>
								</td>
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
			
			
			<div class="modal fade" id="categorymodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width:50%" role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding:.5rem;">
							<button class="close" data-dismiss="modal"
									aria-label="Close"><span aria-hidden="true">&times;</span>
								</button>
									<h5 class="modal-title" id="exampleModalLabel"
										style="font-size: 15px">
										<b>Update Document Type Name</b>
									</h5>
							</div>
							
	
	
							<div class="modal-body">
								<form action="/"  id="updateCategoryForm"  enctype="multipart/form-data">
									<div class="row">
										<div class="col-md-10 col-sm-12">
										
										<center>		<input type="hidden" id="udocid" name="udocid" class="form-control" /> 
									<div class="form-group row">
										<label class="col-sm-4 col-form-label"><span style="color: red;">*</span>Document Name</label>
									
										<div class="col-sm-7">
											<input id="udocname" name="udocname" class="form-control" />
											<span id="docU" style="color: red;"></span>
										</div>
									</div>
									<center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span id="catU" style="color: red;"></span></center>
									</center>
								</div>
									</div>
										
									<div class="form-group row">
										<div class="col-sm-11">
											<center>
													<button type="button" class="btn btn-primary btn-sm"
														id="updateid" >Update</button>
												<button type="button" class="btn btn-secondary btn-sm"
													data-dismiss="modal">Close</button>
											</center>
										</div>
									</div>
									
									
								</form>
							</div>
						</div>
					</div>
				</div>
				
				<div class="modal fade" id="subcategorymodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width:50%" role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding:.5rem;">
							<button class="close" data-dismiss="modal"
									aria-label="Close"><span aria-hidden="true">&times;</span>
								</button>
									<h5 class="modal-title" id="exampleModalLabel"
										style="font-size: 15px">
										<b>Update Sub Document Type</b>
									</h5>
							</div>
						<div class="modal-body">
							<form action="/" id="updateSubCategoryForm"
								enctype="multipart/form-data">
								<input type="hidden" id="usubdocid" name="usubdocid"	class="form-control" />
								<input type="hidden" id="dbsubcatname" name="dbsubcatname" class="form-control" />
								<input type="hidden" id="udoctypeid" name="udoctypeid"/>
								<div class="row">
								<div class="col-md-12 col-sm-12">
								<div class="form-group row">
									<label class="col-sm-4 col-form-label">Document Type</label>
									<div class="col-sm-6">
									    <input class="form-control" id="udoctypename" name="udoctypename" readonly/>
										<%-- <select class="form-control" id="udoctypeid" name="udoctypeid"
											required>
											<option value="">--Select Category--</option>
											<c:forEach var="catlist" items="${docTypeyList}">
												<option value="${catlist.documenttype_id}">${catlist.document_type}</option>
											</c:forEach>
										</select> --%>
									</div>
								</div> 
									
										<center>
											
											<div class="form-group row">
												<label class="col-sm-4"><span
										style="color: red">*</span>Sub Document Type Name</label>
												<div class="col-sm-6">
													<input id="usubdocname" name="usubdocname"
														class="form-control" required/> <span id="subtypespan"
														style="color: red;"></span>
												</div>
											</div>
											<center><span id="upsubcatN" style="color:red;"></span></center>
											<%-- <center>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<span id="catU" style="color: red;"></span>
											</center> --%>
										</center>
										
										<div class="form-group row">
															<label for="inputPassword" class="col-sm-5 control-label"><Span
																style="color: red;">*</Span>Is this document to be
																submitted by candidate?</label>
															<div class="col-sm-5">
																<label>Yes</label>&nbsp;<input type="radio" 
																	name="uissubdocname" id="docsubycand" value="1"
																	style="width: 20px; height: 20px;" required />&nbsp;<label>No</label>&nbsp;<input
																	type="radio" id="isdocsubycand" name="uissubdocname"
																	value="0" style="width: 20px; height: 20px;" /> <br>
															</div>
										</div>
										
										<div class="form-group row">
															<label for="inputPassword" class="col-sm-5 control-label">Is
																Sub Document Type Same As Document Type?</label>
															<div class="col-sm-5">
																<label></label>&nbsp;<input type="checkbox"
																	id="isameascat" name="sameas_doctype"
																	style="width: 20px; height: 20px;" /> <br>
															</div>
														</div>
								</div>
						   </div>
							</form>
							<div class="text-center ml-5">
										<center>
											<button type="button" class="btn btn-primary btn-sm"
												id="subupdateid">Update</button>
											<button type="button" class="btn btn-secondary btn-sm"
												data-dismiss="modal">Close</button>
										</center>
							</div>
							<span id="samecatspanid" style="color:red"></span>
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
	
			<!-- .animated -->
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

function editDocument(docid,docname){
	
	$('#catU').text('');
	$('#udocid').val(docid);
	$('#udocname').val(docname);
	$('#categorymodal').modal('show');
}
function editSubDocument(docid,subdocid){
	
	$('#subtypespan,#usubdocname').text('');
	$('#udoctypeid').val(docid);
	$('#usubdocid').val(subdocid);
	var subdoctypename=$('#subdoctypename'+subdocid).val();
	var doctypenameTd=$('#doctypenameTd'+subdocid).val();
	var issubycand=$('#issubycand'+subdocid).val();
	var isameascat=$('#issameastd'+subdocid).val(); 
	if(issubycand==1){
		$("#docsubycand"). prop("checked", true);
	}else if(issubycand==0){
		$("#isdocsubycand"). prop("checked", true);
	}
	$('#usubdocname').val(subdoctypename);
	$('#dbsubcatname').val(subdoctypename);
	$('#udoctypename').val(doctypenameTd);
	//alert(isameascat)
	if(isameascat==1){
		$("#isameascat"). prop("checked", true);
		$("#usubdocname").attr("readonly",true);
		$("#isameascat").attr("disabled",true);
		$('#samecatspanid').text('Since Document Type and Sub-Document types are same for this Document type. In order to edit the name, please update it from Update/Edit Document Type Details');
	}else{
		//$("#isameascat").prop("checked",false);
		$("#isameascat").attr("disabled", true);
		$("#usubdocname").attr("readonly",false);
		$("#udoctypeid,#subupdateid").attr("disabled",false);
		$('#samecatspanid').text('');
	}
	
	
	$('#subcategorymodal').modal('show');
}

$("#isameascat").click(function(event) {
	   getsesVal().done(function(data){  
    if(data!=""){
	var sameas_category=$('input:checkbox[name=sameas_category]').is(':checked');
	var Category=$("#udoctypeid option:selected").text();
	var dbsubcatname=$('#dbsubcatname').val();
	//var val = this.checked ? this.value : '';
	var val=$('#sameas_doctype').is(":checked");
	if(val==true){
	//if(sameas_category==true){
		if(Category==''){
			alert("Please Select Category");
			$("#isameascat").prop("checked", false);
		}else{
		var cattext=$("#udoctypeid option:selected").text();
		$.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "immicheckDocumentSubType?docname=" + cattext + "",
			success : function(response) {
				if (response !="") {
					
					$('#subtypespan').text('Document already linked with Sub Document');
					//$('#updateid,#isameascat,#ucategory').attr("disabled", true);
					$('#subupdateid').attr("disabled", true);
					$("#usubdocname").val(cattext).attr("disabled",true);
				} else {
					
					$('#subtypespan,#catU').text('');
					$("#usubdocname").val(cattext).attr("disabled",true);
					$('#subupdateid').attr("disabled", false);
				}
			}
		});
		
		}
	}else{
		if(dbsubcatname!=""){
			$("#usubdocname").val(dbsubcatname).attr("disabled",false);
			$('#subtypespan').text('');$('#subupdateid').attr("disabled", false);
		}
		else{
			$("#usubdocname").val('');
		}
	}
}else{
    window.location.href="loginpage";
            }
          });
});

$('#udoctypeid').on('change', function() {
	var dbsubcatname=$('#dbsubcatname').val();
	var cattext=$("#udoctypeid option:selected").text();
	 $('#subtypespan').text('');
	$("#usubdocname").val(dbsubcatname);
	$('#subupdateid,#usubdocname').attr("disabled", false); 
	$("#isameascat"). prop("checked", false);
});
	 
$('#doctypeid').on('change', function() {
	   getsesVal().done(function(data){  
                  if(data!=""){
	var cattext=$("#doctypeid option:selected").text();
	 $("#subdocname").val('').attr("readonly",false);
	 $("#sameas_doctype"). prop("checked", false);
	 $('#subcatN,#subdocname').text('');
	var docTypeid=$("#doctypeid").val();
	if(cattext!=''){
	 $.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "immicheckDocumentTypeissame?docTypeid=" + docTypeid + "",
			success : function(response) {
				//alert(response.isameas_doctype+"**********"+response.subdocTypeCount);
				$('#asamecatspanval').val(response.isameas_doctype);
				if (response.isameas_doctype==1) {
					$('#asamecatspanid').text('Since Document Type and Sub-Document type are same for this Document type.');
					$('#subbtnSubmit').attr("disabled", true);
					$("#sameas_doctype").prop("disabled", true);
				 }else {
					 if (response.subdocTypeCount>=1) {
						 $("#sameas_doctype").prop("disabled", true);
					 }else{
						 $("#sameas_doctype").prop("disabled", false);
					 }
					$('#asamecatspanid').text('');
					$('#subbtnSubmit').attr("disabled", false);
				}
			}
		});
	 }
                  }else{
                      window.location.href="loginpage";
      		                }
      	                  });
});

$("#btnSubmit").click(function(event) {
	     getsesVal().done(function(data){  
         if(data!=""){		
        	event.preventDefault();
			$('#saveCategoryForm').formValidation('validate');
			if (!$('#saveCategoryForm').data('formValidation').isValid()) {
				//alert("not Valid");
			} else {
				$("#btnSubmit").attr("disabled", true);
				var form = $('#saveCategoryForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "immisavedoctype", //this is the submit URL
					type : "POST",
					enctype : 'multipart/form-data',
					data : data,
					processData : false,
					contentType : false,
					cache : false,
					success : function(data) {
						 if(data!=null || data!=""){
			   	            	/* $('#addsummaryfields').html(data);
			   	      		  	$('#myModal').show();  */
							 alert(data);
		                     window.location.href="immidocumenttype";
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
		});
		/* $("#closePopupSave").click(function(event) {
			$('#myModal').hide();
			window.location.reload();
		}); */
		$('#saveCategoryForm,#formid').formValidation({
			framework : 'bootstrap',
			row : {
				valid : 'field-success',
				invalid : 'field-error'
			},
			fields : {
				
		        docname : {
					validators : {
						notEmpty : {
							message : 'Please enter document type name. '
						},
		                stringLength: {
		                    min: 2,
		                    max: 80,
		                    message: 'document type should have minimum 2 and maximum 80 characters. '
		                },
		                regexp: {
		                	//regexp: /^(?!\s\/\\@#$&*()\[<>\]_-+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 @#$&*\]()\[<>_\/\\-]*)?$/,
		                	regexp: /^[^\s\d\@#$&*()_\/\\<>\[\]-]+([a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+\s)*[a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+$/,
		                	message: 'document type accepts alphanumerical characters. Spaces are not allowed at beginning or end of the field. Accepts symbols @#$&*()_-\/<>[]'
		                },
					}
				} 
			}
		});
		
		$('#updateCategoryForm').formValidation({
			framework : 'bootstrap',
			row : {
				valid : 'field-success',
				invalid : 'field-error'
			},
			fields : {
				
				udocname : {
					validators : {
						notEmpty : {
							message : 'Please enter document type name. '
						},
		                stringLength: {
		                    min: 2,
		                    max: 80,
		                    message: 'document type should have minimum 2 and maximum 80 characters. '
		                },
		                regexp: {
		                	regexp: /^[^\s\d\@#$&*()_\/\\<>\[\]-]+([a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+\s)*[a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+$/,
		                	message: 'document type accepts alphanumerical characters. Spaces are not allowed at beginning or end of the field. Accepts symbols @#$&*()_-\/<>[]'
		                },
					}
				} 
			}
		});

		 var textInput = document.getElementById('docname');
		var timeout = null;
		textInput.onkeyup = function(e) {
			clearTimeout(timeout);
			timeout = setTimeout(function() {
				
				 getsesVal().done(function(data){  
                     if(data!=""){
				var docname = $('#docname').val();
				 var empno=$('#empno').val();
		   if(empno!=null){
				if (docname == "") {
					$('#catN').text('');
				} else {
					$.ajax({
						type : "GET",
						asyn : false,
						contentType : "application/json", // NOT dataType!
						url : "immicheckDocumentType?docname=" + docname + "",
						success : function(response) {
							if (response !="") {
								$('#catN').text(docname+' already exists');
								$('#btnSubmit').attr("disabled", true);
							} else {
								$('#catN').text('');
								$('#btnSubmit').attr("disabled", false);
							}
						}
					});
				}
			}else{
				window.location.href="loginpage";
				}
                     }else{
                         window.location.href="loginpage";
         		                }
         	                  });
			}, 500);
		}; 
		
		$("#updateid").click(function(event) {
			 getsesVal().done(function(data){  
                 if(data!=""){
			event.preventDefault();
			$('#updateCategoryForm').formValidation('validate');
			if (!$('#updateCategoryForm').data('formValidation').isValid()) {
				//alert("not Valid");
			} else {
				$("#updateid").attr("disabled", true);
				var form = $('#updateCategoryForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "immiupdatedoctype", //this is the submit URL
					type : "POST",
					enctype : 'multipart/form-data',
					data : data,
					processData : false,
					contentType : false,
					cache : false,
					success : function(data) {
						 if(data!=null || data!=""){
			   	            	/* $('#addsummaryfields').html(data);
			   	      		  	$('#myModal').show();  */
							 alert(data);
		                     window.location.href="immidocumenttype";
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
		});
		
		$("#subupdateid").click(function(event) {
			 getsesVal().done(function(data){  
                 if(data!=""){
			event.preventDefault();
			var Category=$("#udoctypeid option:selected").text();
			$('#updateSubCategoryForm').formValidation('validate');
			if (!$('#updateSubCategoryForm').data('formValidation').isValid()) {
				//alert("not Valid");
			} else {
				$("#subupdateid").attr("disabled", true);
				var form = $('#updateSubCategoryForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "immiupdatesubdoctype", //this is the submit URL
					type : "POST",
					enctype : 'multipart/form-data',
					data : data,
					processData : false,
					contentType : false,
					cache : false,
					success : function(data) {
						 if(data!=null || data!=""){
			   	            	/* $('#addsummaryfields').html(data);
			   	      		  	$('#myModal').show();  */
							 alert(data);
		                     window.location.href="immidocumenttype";
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
		});
		
		var textInputupdate = document.getElementById('udocname');
		var timeoutup = null;
		textInputupdate.onkeyup = function(e) {
			clearTimeout(timeoutup);
			timeoutup = setTimeout(function() {
				getsesVal().done(function(data){  
                    if(data!=""){
				var udocname = $('#udocname').val();
				 var empno=$('#empno').val();
		   if(empno!=null){
				if (udocname == "") {$('#docU').text('');
				} else {
					$.ajax({
						type : "GET",
						asyn : false,
						contentType : "application/json", // NOT dataType!
						url : "immicheckDocumentType?docname=" + udocname + "",
						success : function(response) {
							if (response !="") {
								$('#docU').text(udocname+ ' already exists');
								$('#updateid').attr("disabled", true);
							} else {
								$('#docU').text('');
								$('#updateid').attr("disabled", false);
							}
						}
					});
				}
			}else{
				window.location.href="loginpage";
				}
			 }else{
	                window.location.href="loginpage";
			                }
		                  });
			}, 500);
		}; 
	</script>
	<script>
	$("#subbtnSubmit").click(function(event) {
		 getsesVal().done(function(data){  
             if(data!=""){
		event.preventDefault();
		$('#subsaveCategoryForm').formValidation('validate');
		if (!$('#subsaveCategoryForm').data('formValidation').isValid()) {
			//alert("not Valid");
		} else {
			$("#subbtnSubmit").attr("disabled", true);
			var form = $('#subsaveCategoryForm')[0];
			var data = new FormData(form);
			$.ajax({
				url : "immisavesubdoctype", //this is the submit URL
				type : "POST",
				enctype : 'multipart/form-data',
				data : data,
				processData : false,
				contentType : false,
				cache : false,
				success : function(data) {
					 if(data!=null || data!=""){
		   	            	/* $('#addsummaryfields').html(data);
		   	      		  	$('#myModal').show();  */
						 alert(data);
	                     window.location.href="immidocumenttype";
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
	});
	
	$('#subsaveCategoryForm').formValidation({
		framework : 'bootstrap',
		row : {
			valid : 'field-success',
			invalid : 'field-error'
		},
		fields : {
			doctypeid : {
				validators : {
					notEmpty : {
						message : 'Please select document type. '
					},
				}
			},
			issubdocname:{
	            validators: {
	            	notEmpty: {
	                    message: 'Please Choose Type'
	                }
	            }
	        },
			subdocname : {
				validators : {
					notEmpty : {
						message : 'Please enter sub document type name. '
					},
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'sub document type should have minimum 2 and maximum 80 characters. '
	                },
	                regexp: {
	                	regexp: /^[^\s\@#$&*()_\/\\<>\[\]-]+([a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+\s)*[a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+$/,
	                	message: 'sub document type accepts alphanumerical characters. Spaces are not allowed at beginning or end of the field. Accepts symbols @#$&*()_-\/<>[]'
	                },
				}
			} 
		}
	});
	
	$('#updateSubCategoryForm').formValidation({
		framework : 'bootstrap',
		row : {
			valid : 'field-success',
			invalid : 'field-error'
		},
		fields : {
			/* udoctypeid : {
				validators : {
					notEmpty : {
						message : 'Please select document type. '
					},
				}
			}, */
			uissubdocname:{
	            validators: {
	            	notEmpty: {
	                    message: 'Please Choose Type'
	                }
	            }
	        },
			usubdocname : {
				validators : {
					notEmpty : {
						message : 'Please enter sub document type name. '
					},
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'sub document type should have minimum 2 and maximum 80 characters. '
	                },
	                regexp: {
	                	regexp: /^[^\s\@#$&*()_\/\\<>\[\]-]+([a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+\s)*[a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+$/,
	                	message: 'sub document type accepts alphanumerical characters. Spaces are not allowed at beginning or end of the field. Accepts symbols @#$&*()_-\/<>[]'
	                },
				}
			} 
		}
	});
	
	var textUsubdocname = document.getElementById('usubdocname');
	var timeout = null;
	textUsubdocname.onkeyup = function(e) {
		clearTimeout(timeout);
		timeout = setTimeout(function() {
			
			getsesVal().done(function(data){  
                if(data!=""){
			var docname = $('#usubdocname').val();
			 var empno=$('#empno').val();
	   if(empno!=null){
			if (docname == "") {
				$('#subtypespan').text('');
			} else {
				$.ajax({
					type : "GET",
					asyn : false,
					contentType : "application/json", // NOT dataType!
					url : "immicheckDocumentSubType?docname=" + docname + "",
					success : function(response) {
						if (response !="") {
							$('#subtypespan').text(docname+' already exists');
							$('#subupdateid').attr("disabled", true);
						} else {
							$('#subtypespan').text('');
							$('#subupdateid').attr("disabled", false);
						}
					}
				});
			}
		}else{
			window.location.href="loginpage";
			}
                }else{
                    window.location.href="loginpage";
    		                }
    	                  });
		}, 500);
	};
	
	var textsubdocname = document.getElementById('subdocname');
	var timeout = null;
	textsubdocname.onkeyup = function(e) {
		clearTimeout(timeout);
		timeout = setTimeout(function() {
			getsesVal().done(function(data){  
                if(data!=""){
			var docname = $('#subdocname').val();
			 var empno=$('#empno').val();
	   if(empno!=null){
			if (docname == "") {
				$('#subcatN').text('');
			} else {
				$.ajax({
					type : "GET",
					asyn : false,
					contentType : "application/json", // NOT dataType!
					url : "immicheckDocumentSubType?docname=" + docname + "",
					success : function(response) {
						if (response !="") {
							$('#subcatN').text(docname+' already exists');
							$('#subbtnSubmit').attr("disabled", true);
						} else {
							
						if($('#asamecatspanval').val()==1){
							$('#asamecatspanid').text('Since Document Type and Sub-Document type are same for this Document type.');
							$('#subbtnSubmit').attr("disabled", true);
						   }else{
							   $('#asamecatspanid').text('');
							   $('#subbtnSubmit').attr("disabled", false);  
						    }
							$('#subcatN').text('');
						}
					}
				});
			}
		}else{
			window.location.href="loginpage";
			}
		 }else{
             window.location.href="loginpage";
		                }
	                  });
		}, 500);
	};
	
	$("#sameas_doctype").click(function(event) {
		 getsesVal().done(function(data){  
             if(data!=""){
		var sameas_doctype=$('#sameas_doctype').val();
		//var val = this.checked ? this.value : '';
		var val=$('#sameas_doctype').is(":checked");
		var doctypeid=$('#doctypeid').val();
		if(val==true){
			if(doctypeid==""){
				alert("Please Select Document Type");
				$("#sameas_doctype"). prop("checked", false);
			}else{
				var doctype=$("#doctypeid option:selected").text();
				$.ajax({
					type : "GET",
					asyn : false,
					contentType : "application/json", // NOT dataType!
					url : "immicheckDocumentSubType?docname=" + doctype + "",
					success : function(response) {
						if (response !="") {
						$('#subcatN').text('Sub Document Type already linked with Document Type');
						$('#subbtnSubmit,#sameas_doctype,#doctypeid').attr("disabled", true);
						$("#subdocname").val(doctype).attr("readonly",true);
					 } else {
						$('#subcatN').text('');
						$("#subdocname").val(doctype).attr("readonly",true);
						$('#subbtnSubmit').attr("disabled", false);
					}
				 }
			  });
			}
		}else{
			$("#subdocname").val('').attr("disabled",false);
			$("#subdocname").val('').attr("readonly",false);
			$('#subbtnSubmit').attr("disabled", false);
		}
	 }else{
         window.location.href="loginpage";
	                }
               });
	});
	$("#btnResetId").click(function(){
		 $('#saveCategoryForm').bootstrapValidator('resetForm', true);
		   document.getElementById("saveCategoryForm").reset();
		   $('#catN').text('');
		   $("#btnSubmit").prop("disabled", false);
	});
	
$('#categorymodal').on('hide.bs.modal', function()
{
	$('#updateCategoryForm').bootstrapValidator('resetForm', true);
});
$('#categorymodal').on('hidden.bs.modal', function(){
											// alert("hi close");
	$('#updateCategoryForm').bootstrapValidator('resetForm', true);
});	
$('#subcategorymodal').on('hide.bs.modal', function()
{
     $('#updateSubCategoryForm').bootstrapValidator('resetForm', true);
});
$('#subcategorymodal').on('hidden.bs.modal', function(){
								// alert("hi close");
	$('#updateSubCategoryForm').bootstrapValidator('resetForm', true);
});
/* 	$("#ubtnResetId").click(function(){
		 $('#subsaveCategoryForm').bootstrapValidator('resetForm', true);
		// document.getElementById("subsaveCategoryForm").reset();
		 $('#doctypeid').attr("readonly",false);
		 $("#subdocname").val('').attr("readonly",false);
		// $("#doctypeid").prop("selected", false);
		 $("#sameas_doctype"). prop("checked", false);
		 $("#sameas_doctype,#doctypeid,#subbtnSubmit"). prop("disabled", false);
		 $('#subcatN,#subdocname').text('');
	}); */
</script>
</body>
</html>
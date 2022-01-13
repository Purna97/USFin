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
</style>

<body>
<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">Create Sub Category</h5>
							<div class="card-body">
								<div class="row">
									<div class="col-md-8 col-sm-12">
										<form action="/" enctype="multipart/form-data"
											id="saveCategoryForm">
											<input type="hidden" name="empno" id="empno"value="${empno}">
											<div>
												<fieldset>
													<input type="hidden" id="asamecatspanval" name="asamecatspanval"/>
													<div>

														<div class="form-group row">
															<label class="col-sm-5 col-form-label"><span
																style="color: red">*</span>Category</label>
															<div class="col-sm-5">
																<select
													class="form-control" id="Category" name="Category" required>
													<option value="">--Select Category--</option>
													<c:forEach var="catlist" items="${categoryList}">
														<option value="${catlist.category_id}">${catlist.category_name}</option>
													</c:forEach>
												</select>
															</div>
														</div>
														<div class="form-group row">
															<label class="col-sm-5 col-form-label"><span
																style="color: red">*</span>Sub Category</label> 
																<div class="col-sm-5">
																<input type="text" class="form-control" name="SubCategory" id="SubCategory" required> 
																 <span id="subcatN" style="color:red;"></span>
																</div>
														</div>
														<div class="form-group row">
															<label class="col-sm-5 col-form-label"><span
																style="color: red">*</span>Document Type</label>
															<div class="col-sm-5">
																<select
													class="form-control" id="doctype" name="doctype" required>
													<option value="">--Document Type--</option>
													<c:forEach var="typelist" items="${docTypeyList}">
														<option value="${typelist.documenttype_id}">${typelist.document_type}</option>
													</c:forEach>
												</select>
															</div>
														</div>
														
											<div class="form-group row">
											<label for="inputPassword" class="col-sm-5 control-label"><span
																style="color: red">*</span>Do you want to upload document?</label>
											   <div class="col-sm-5">
													<label>Yes</label>&nbsp;<input type="radio" id="docupload" name="docupload" value="Yes" style=" width: 20px;height: 20px;" required/>&nbsp;<label>No</label>&nbsp;<input type="radio" id="docupload" name="docupload" value="No" style=" width: 20px;height: 20px;" />
													 <br>
												</div>
										    </div>
										   
										    <div class="form-group row" id="map" style="display:none;">
												<label for="inputPassword"	class="col-sm-5 control-label">
												<Span style="color: red;">*</Span>Upload Documents </label>
												<div class="col-sm-5">
													<input type="file" id="document" name="document[]" onchange="ValidateFile(this)" multiple><br>
												</div>
											</div>
														
											<div class="form-group row">
											<label for="inputPassword" class="col-sm-5 control-label"><Span style="color:red;">*</Span>Is this Sub Category submitted by Candidate?</label>
											   <div class="col-sm-5">
											   		<label>Yes</label>&nbsp;<input type="radio" name="subcattype" id="subcattype" value="1"  style=" width: 20px;height: 20px;" required/>&nbsp;<label>No</label>&nbsp;<input type="radio" id="subcattype" name="subcattype" value="0" style=" width: 20px;height: 20px;" />
													 <br>
												</div>
										    </div>
										    
											<div class="form-group row">
											<label for="inputPassword" class="col-sm-5 control-label">Is SubCategory Same As Category?</label>
											   <div class="col-sm-5">
											   		<label></label>&nbsp;<input type="checkbox" id="sameas_category" name="sameas_category"  style=" width: 20px;height: 20px;"/>
													 <br>
												</div>
										    </div>	
										    <span id="asamecatspanid" style="color:red"></span>   
										   </div>
										</fieldset>
											</div>
											<!-- <div></div> -->
											<div class="text-center ml-5">
												<button type="button" class="btn btn-info btn-sm"
													id="btnSubmit">Save</button>
												<button type="reset" class="btn btn-info btn-sm"
													id="btn-colorb" onClick="window.location.reload()">Reset</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>


						<div class="card" id="responseCard">
							<h5 class="card-header">Sub Category Details</h5>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-striped" id="vendorTable">
										<thead>
											<tr>
											<th scope="col">Category Name</th>
												<th scope="col">SubCategory Name</th>
												<th scope="col">Submitted by Candidate</th>
												
												<th scope="col">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="catl" items="${subcategoryList}">
												<tr>
												<input type="hidden" id="issameastd${catl.subcategory_id}" name="issameastd" value="${catl.isameas_category}">
												<input type="hidden" id="catidtd${catl.subcategory_id}" name="catidtd" value="${catl.category_id}">
												<input type="hidden" id="subcattd${catl.subcategory_id}" name="subcattd" value="${catl.subcategory_type}">
												<input type="hidden" id="doctypetd${catl.subcategory_id}" name="doctypetd" value="${catl.documenttype_id}">
												<input type="hidden" id="docuploadId${catl.subcategory_id}" name="docuploadId" value="${catl.docStatus}">
													<td id="catName${catl.subcategory_id}">${catl.category_name}</td>
													<td id="subcatName${catl.subcategory_id}">${catl.subcategory_name}</td>
													<td>
													<c:if test="${catl.subcategory_type==1}">
													<span style="color:blue;"><b>Yes</b></span>
													</c:if>
													<c:if test="${catl.subcategory_type==0}">
													<b>No</b>
													</c:if>
													</td>
													<td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
														onclick="editSubCategory(${catl.subcategory_id});" class="btn btn-info btn-sm addButton">
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
			</div>
			
			
			<div class="modal fade" id="categorymodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width:80%" role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding:.5rem;">
							<button class="close" data-dismiss="modal"
									aria-label="Close"><span aria-hidden="true">&times;</span>
								</button>
									<h5 class="modal-title" id="exampleModalLabel"
										style="font-size: 15px">
										<b>Update Sub Category</b>
									</h5>
							</div>
							<div class="modal-body">
								<form action="/"  id="updateCategoryForm"  enctype="multipart/form-data">
									<div class="row">
										<div class="col-md-12 col-sm-12">
										
										<div class="form-group row">
															<label class="col-sm-5 col-form-label"><span
																style="color: red">*</span>Category</label>
															<div class="col-sm-6">
															<input class="form-control" id="ucategory" name="ucategory" style="width:100%;" readonly/>
															<input type="hidden" class="form-control" id="u_category" name="u_category" style="width:100%;" readonly/>
															
													<%-- <select
													class="form-control" id="ucategory" name="ucategory" style="width:100%;">
													<option value="">--Select Category--</option>
													<c:forEach var="catlist" items="${categoryList}">
														<option value="${catlist.category_id}">${catlist.category_name}</option>
													</c:forEach>
												</select> --%>
															</div>
														</div>
										
										<center>		
									<input type="hidden" id="subcategoryid" name="subcategoryid" class="form-control" /> 
									<input type="hidden" id="u_isameascat" name="u_isameascat" class="form-control" /> 
									<input type="hidden" id="dbsubcatname" name="dbsubcatname" class="form-control" />
									<input type="hidden" id="dbudocupload" name="dbudocupload" class="form-control" />
									 
									<div class="form-group row">
										<label class="col-sm-5 col-form-label">Sub Category Name</label>
										<div class="col-sm-6">
											<input type="text"  id="UsubCategoryname" name="UsubCategoryname" class="form-control"/>
										
										</div>
										
									</div><center><span id="upsubcatN" style="color:red;"></span></center></center>
									<center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span id="catU" style="color: red;" style=" width: 300%;"></span></center>
									<div class="form-group row">
															<label class="col-sm-5 col-form-label"><span
																style="color: red">*</span>Document Type</label>
															<div class="col-sm-5">
																<select
													class="form-control" id="udoctype" name="udoctype" style="width:100%;">
													<option value="">--Document Type--</option>
													<c:forEach var="typelist" items="${docTypeyList}">
														<option value="${typelist.documenttype_id}">${typelist.document_type}</option>
													</c:forEach>
												</select>
															</div>
										</div>
										
										<div class="form-group row">
											<label for="inputPassword" class="col-sm-5 control-label"><span
																style="color: red">*</span>Do you want to upload document?</label>
											   <div class="col-sm-5">
													<label>Yes</label>&nbsp;<input type="radio" id="udocupload1" name="udocupload" value="Yes" style=" width: 20px;height: 20px;" required/>&nbsp;<label>No</label>&nbsp;<input type="radio" id="udocupload2" name="udocupload" value="No" style=" width: 20px;height: 20px;" />
													 <br>
												</div>
										    </div>
										   
										    <div class="form-group row" id="umap" style="display:none;">
												<label for="inputPassword"	class="col-sm-5 control-label">
												<Span style="color: red;" id="udocl" style="display:none;">*</Span>Upload Documents </label>
												<div class="col-sm-5"><!-- onchange="ValidateFile(this)" -->
													<input type="file" id="udocument" name="udocument[]"  multiple><br>
												</div>
											</div>
							 <center><div id="SubCatDocListTableId" style="display:none;">	
							 <input type="hidden" id="SubCatDocList" >
								<table id="SubCatDocListTable" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>Document Name</th>
								<th>Submitted Date</th>
								<th>Submitted By</th>
								<th>Status</th>
								<th>Action</th>
								</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>
							</div></center>
											
									<div class="form-group row">
											<label for="inputPassword" class="col-sm-5 control-label"><Span style="color:red;">*</Span>Is this Sub Category submitted by Candidate?</label>
											   <div class="col-sm-5">
											   
											   		<label>Yes</label>&nbsp;<input type="radio" name="usubcattype" id="rsubcattype" value="1" />&nbsp;<label>No</label>&nbsp;<input type="radio" id="ntsubcattype" name="usubcattype" value="0" />
													 <br>
												</div>
										    </div>
									
									<div class="form-group row">
											<label for="inputPassword" class="col-sm-5 control-label">Is SubCategory Same As Category?</label>
											   <div class="col-sm-5">
											   		<label></label>&nbsp;<input type="checkbox" id="isameascat" name="sameas_category"  style=" width: 20px;height: 20px;" readonly/>
													 <br>
												</div>
										    </div>
										    
								</div>
									</div>
										<br>
									<div class="form-group row">
										<div class="col-sm-10">
											<center>
													<button  class="btn btn-primary btn-sm"
														id="updateid" onclick="updateCategory()">Update</button>
												<button  class="btn btn-secondary btn-sm"
													onClick="window.location.reload()" data-dismiss="modal">Close</button>
											
											</center>
										</div>
									</div>
									<span id="samecatspanid" style="color:red"></span>
									
									
								</form>
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
<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="resources/js/js/select2.min.js"></script>
<script type="text/javascript" src="resources/preDefined/filevalidation.js"></script>
<script src="resources/preDefined/goback.js"></script>
<script type="text/javascript">
$('#Category').select2({//,#ucategory
    placeholder: "Select Category",
});
$('#doctype,#udoctype').select2({
    placeholder: "Select Document Type",
});

$("input[id=udocument]").change(function() {
	getsesVal().done(function(data){
		if(data!=""){
    var names = [];var dbfilenames = [];
    var subCatId=$('#subcategoryid').val();
    for (var i = 0; i < $(this).get(0).files.length; ++i) {
        names.push($(this).get(0).files[i].name);
    
    }
        
    $.ajax({
    	type : "GET",
        asyn : false,
        contentType: "application/json", // NOT dataType!
        url  :"viewSubCatDocListBySubCatId",
        data:{"subCatId":subCatId},
        success  : function(response){
       		 if(response!=""){
            	for(var i=0;i<response.length;i++){
            	var filename = response[i].file_name;
            	dbfilenames.push(filename);
       	    }
            	var duplicate = [];
            	for (var i=0; i<dbfilenames.length; i++) {
            	    var index = names.indexOf(dbfilenames[i]);
            	    if (index > -1) {
            	        duplicate.push(names[index]);
            	    }
            	}
            	
            	if(dbfilenames.length>0 || duplicate!=""){
            	alert(duplicate+" :Selected files are duplicates, so these file will not be saved even though submitted. ")
            	}
            	}
        }		
   });
		}else{ window.location.href="loginpage";}});
});
function editSubCategory(subcatid){
	getsesVal().done(function(data){
		if(data!=""){
	var isameascat=$('#issameastd'+subcatid).val(); 
	var catid=$('#catidtd'+subcatid).val(); 
	
	var subcattype=$('#subcattd'+subcatid).val(); 
	var doctypetd=$('#doctypetd'+subcatid).val(); 
	var catName=$('#catName'+subcatid).html();
	var subcatname=$('#subcatName'+subcatid).html();
	var docupload=$('#docuploadId'+subcatid).val();
	//if(catid!=''){
		  /*  $( "#ucategory option:selected" ).text(catName).attr('selected', true);
		    var $dropdown1 = $("select[name='ucategory']");
 		    $dropdown1.find('option[value="' + catid + '"]').attr('selected', true); 
		    var $dropdown2 = $("select[name='udoctype']");
			 $dropdown2.find('option[value="' + doctypetd + '"]').attr('selected', true);  */
		//   $( "#ucategory option:selected" ).text(catName).attr('selected', true);
		//}
		
			 $("#ucategory").val(catid).trigger("change");
			 $("#udoctype").val(doctypetd).trigger("change");
			 
			 $('#ucategory').val(catName);
			 $('#u_category').val(catid);
	//alert(subcatname)
	$('#dbudocupload').val(docupload);
	$('#categoryid').val(catid);
	$('#UsubCategoryname').val(subcatname);
	$('#dbsubcatname').val(subcatname);
	
	$('#subcategoryid').val(subcatid);
	$('#u_isameascat').val(isameascat);
	$('#catU').text(''); 
	if(isameascat==1){
		$("#isameascat"). prop("disabled", true);  
		$("#isameascat").attr("checked",true);
		$("#UsubCategoryname,#ucategory").attr("readonly",true);
		$('#samecatspanid').text('Since Category and Sub-Category names are same for this Category. In order to edit the name, please update it from Update/Edit Category Page');
	}else{
		$("#isameascat"). prop("checked", false);
		$("#isameascat"). prop("disabled", true);  
		$("#ucategory").attr("readonly",true);
		$("#UsubCategoryname,#updateid").attr("readonly",false);
		$('#samecatspanid').text('');
	}
	
	
	if(subcattype==1){
		$("#rsubcattype"). prop("checked", true);
	}else if(subcattype==0 && subcattype!=''){
		$("#ntsubcattype"). prop("checked", true);
	}
	if(docupload!=''){
	if(docupload=='Yes'){
		$("#umap").show();
		$("#udocl").hide();
		$("#udocupload1"). prop("checked", true);
		viewSubCatDocList(subcatid);
	 }else{
		 $("#umap,#SubCatDocListTableId").hide();
		// $("#SubCatDocListTableId").show();
		 $("#udocupload2"). prop("checked", true);
		 viewSubCatDocList(subcatid);
	    }
	  }else{
		  $("#umap,#SubCatDocListTableId").hide();
		  $("#udocupload2"). prop("checked", true);
	  }
	$('#categorymodal').modal('show');
		}else{ window.location.href="loginpage";}});
}

var tablech = $('#SubCatDocListTable').DataTable({
	 "order": [[0, "desc"]],
	  lengthMenu: [[5, 10, 15, -1], [5, 10, 15, "All"]],
	  bLengthChange: true,
	  paging: true
	});
	
function viewSubCatDocList(subCatId){
	getsesVal().done(function(data){
		if(data!=""){
	$.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "application/json", // NOT dataType!
	        url  :"viewSubCatDocListBySubCatId",
	        data:{"subCatId":subCatId},
	        success  : function(response){
	        	//alert(response.length);
	        	 if (tablech) tablech.clear();
	        	 var dtatus; var daction;
		         $('#SubCatDocListTable').dataTable().fnClearTable();
	        		 if(response!=""){
	        			 $('#SubCatDocList').val(response.length);
		            	  for(var i=0;i<response.length;i++){
		            		  var encoded = encodeURIComponent(response[i].file_name);
		            		  if(response[i].docStatus=='Active'){
		            			  dtatus='<font color="green"> <strong>'+response[i].docStatus+'</strong></font>';
		            			  daction='<button class="btn btn-danger btn-sm"  onclick="inActiveDocument(\''+response[i].doc_id+'\',\''+response[i].subcat_id+'\',\''+response[i].docStatus+'\');" data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"  title="Inactive the document">InActive</button>';
		            			  
		            		  }else{
		            			  dtatus='<font color="red"> <strong>'+response[i].docStatus+'</strong></font>';
		            			  daction='<button class="btn btn-success btn-sm"  onclick="inActiveDocument(\''+response[i].doc_id+'\',\''+response[i].subcat_id+'\',\''+response[i].docStatus+'\');" data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"  title="Active the document">Active</button>';
		            		  }
		            		  tablech.row.add([
		            			''+response[i].doc_id+'',
		            			'<a href="downloadbgvdocs?filename='+encoded+'&candidate_id=" target="_blank" style="color:blue">'+response[i].file_name+'</a>',
		                      	''+response[i].submitted_date+'',
		                      	''+response[i].posted_by+'',
		                      	''+dtatus+'',
		                      	''+daction+'',
		                     ]).draw();    
	        	    }
		          if(response.length>0){ 	  
		           $("#SubCatDocListTableId").show();
		           }
	            }
	        }		
	});
		}else{ window.location.href="loginpage";}});
}

function inActiveDocument(docid,subcat_id,docstatus){
	getsesVal().done(function(data){
		if(data!=""){
	var dstatus="";
	if(docstatus=="Active" || docstatus==""){
		dstatus="InActivated";
	}else{
		dstatus="Activated";
	}
	var result = confirm("Are you sure to "+dstatus+" the document?");
	if(result==true){
	$.ajax({
        type: "POST",
        url: "updateSubCatDocumentStatus?documentid="+docid+"&docstatus="+docstatus+"",
        cache: false,
        async: false, 
        success: function(response){
	         if(response=="updated"){
	        	 alert("Document "+dstatus+" Successfully");
	        	 editSubCategory(subcat_id);
	        	   // window.location.href="viewClientVendor?candidate_id="+canid+"&empType="+emptype+"";
		         }
          },
        error: function(){                                                                                 
        }                                                       
    }); 
	}else{
		
	}
		}else{ window.location.href="loginpage";}});
}

$('#Category').on('change', function() {
	getsesVal().done(function(data){
		if(data!=""){
	var cattext=$("#Category option:selected").text();
	$("#sameas_category"). prop("checked", false);
	 $('#subcatN,#SubCategory').text('');
	 $("#SubCategory").prop("readonly", false);
	 $("#SubCategory").val('').attr("disabled",false);
	
	 var docTypeid=$("#Category").val();
	 
		if(cattext!=''){
		 $.ajax({
				type : "GET",
				asyn : false,
				contentType : "application/json", // NOT dataType!
				url : "bgccheckDocumentTypeissame?docTypeid=" + docTypeid + "",
				success : function(response) {
					//alert(response.isameas_doctype)
					$('#asamecatspanval').val(response.isameas_doctype);
					if (response.isameas_doctype==1) {
						$('#asamecatspanid').text('Since Category Name and Sub-Category Name are same for this Category Name.');
						$('#btnSubmit').attr("disabled", true);
						$("#sameas_category").prop("disabled", true);
					 }else {
						 if (response.subdocTypeCount>1) {
							 $("#sameas_category").prop("disabled", true);
							 $('#asamecatspanid').text('');
							 $('#btnSubmit').attr("disabled", false);
						 }else{
							 $("#sameas_category").prop("disabled", false);
						 }
						$('#asamecatspanid').text('');
						$('#btnSubmit').attr("disabled", false);
					}
				}
			});
		 }
		}else{ window.location.href="loginpage";}});
	 });
	 	 
$("#sameas_category").click(function(event) {
	getsesVal().done(function(data){
		if(data!=""){
	var sameas_category=$('#sameas_category').val();
	//var val = this.checked ? this.value : '';
	var Category=$('#Category').val();
	var val=$('#sameas_category').is(":checked");
	if(val==true){
	//if(val=='on'){
		if(Category==""){
			alert("please Select Category");
			$("#sameas_category"). prop("checked", false);
		}else{
			var cattext=$("#Category option:selected").text();
		$.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "checkSubCategory?SubCategory=" + cattext + "",
			success : function(response) {
				if (response !="") {
					$('#subcatN').text('Category already linked with SubCategory');
					
					$('#btnSubmit,#sameas_category,#Category').attr("disabled", true);
					$("#SubCategory").val(cattext).attr("readonly",true);
				} else {
					
					$('#subcatN').text('');
					$("#SubCategory").val(cattext).attr("readonly",true);
					$('#btnSubmit').attr("disabled", false);
				}
			}
		});
		}
		$('#saveCategoryForm').formValidation('enableFieldValidators','SubCategory',false);
	}else{
		$("#SubCategory").val('').attr("disabled",false);
		$("#SubCategory").val('').attr("readonly",false);
		$('#btnSubmit').attr("disabled", false);
		$('#saveCategoryForm').formValidation('enableFieldValidators','SubCategory',true);
	}
		}else{ window.location.href="loginpage";}});
});


$('#ucategory').on('change', function() {
	var dbsubcatname=$('#dbsubcatname').val();
	var cattext=$("#ucategory option:selected").text();
	 $('#upsubcatN').text('');
	$("#UsubCategoryname").val(dbsubcatname);
	$('#updateid,#UsubCategoryname').attr("disabled", false); 
	$("#isameascat"). prop("checked", false);
	
	 });
	 
$("#isameascat").click(function(event) {
	getsesVal().done(function(data){
		if(data!=""){
	var sameas_category=$('input:checkbox[name=sameas_category]').is(':checked');
	//var Category=$('#ucategory').val();
	var Category=$("#ucategory option:selected").text();
	var dbsubcatname=$('#dbsubcatname').val();
	if(sameas_category==true){
		if(Category==''){
			alert("Please Select Category");
			$("#isameascat").prop("checked", false);
		}else{
		var cattext=$("#ucategory option:selected").text();
		//$("#UsubCategoryname").val(cattext).attr("disabled",true);
		$.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "checkSubCategory?SubCategory=" + cattext + "",
			success : function(response) {
				if (response !="") {
					
					$('#upsubcatN').text('Category already linked with SubCategory');
					//$('#updateid,#isameascat,#ucategory').attr("disabled", true);
					$('#updateid').attr("disabled", true);
					$("#UsubCategoryname").val(cattext).attr("disabled",true);
				} else {
					
					$('#upsubcatN,#catU').text('');
					$("#UsubCategoryname").val(cattext).attr("disabled",true);
					$('#updateid').attr("disabled", false);
				}
			}
		});
		
		}
	}else{
		
		if(dbsubcatname!=""){
			$("#UsubCategoryname").val(dbsubcatname).attr("disabled",false);
			$('#upsubcatN').text('');$('#updateid').attr("disabled", false);
		}
		else{
			$("#UsubCategoryname").val('');
		}
		
	}
		}else{ window.location.href="loginpage";}});
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
					url : "subcategory", //this is the submit URL
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
		                     window.location.href="subcategory";
			   	   	         }
			   	   	      else{
			   	   	          window.location.href="loginpage";
			   	   	   	      }
					}
				});
			}
				}else{ window.location.href="loginpage";}});
		});
		/* $("#closePopupSave").click(function(event) {
			$('#myModal').hide();
			window.location.reload();
		}); */
		$('#saveCategoryForm').formValidation({
			framework : 'bootstrap',
			row : {
				valid : 'field-success',
				invalid : 'field-error'
			},
			fields : {
				SubCategory : {
					validators : {
						notEmpty : {
							message : 'Please enter Sub Category Name. '
						},
		                stringLength: {
		                    min: 2,
		                    max: 80,
		                    message: 'Sub Category Name should have minimum 2 and maximum 80 characters. '
		                },
		                regexp: {
		                	regexp: /^[^\s\d\@#$&*()_\/\\<>\[\]-]+([a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+\s)*[a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+$/,
		                	message: 'Sub Category name accepts alphanumerical characters. Spaces are not allowed at beginning or end of the field. Accepts symbols @#$&*()_-\/<>[]'
		                },
					}
				},
		        doctype:{
		            validators: {
		            	notEmpty: {
		                    message: 'Please select Document Type'
		                }
		            }
		        },
				Category : {
					validators : {
						notEmpty : {
							message : 'Please select Category'
						}
					}
				},
				subcattype : {
					validators : {
						notEmpty : {
							message : 'Please Choose Option'
						}
					}
				},
				docupload : {
					validators : {
						notEmpty : {
							message : 'Please Choose Option'
						}
					}
				},
				'document[]' : {
					enabled: false,
					validators : {
						notEmpty : {
							message : 'Please upload documents'
						}
					}
				}
			}
		}).on('click', '[name="docupload"]', function(e) {
		    var checkBox = document.getElementById("docupload");
			 if (checkBox.checked == true){
				// alert("**if***"+checkBox.checked);
			   $("#map").show();
			   $("#document").val('');
			   $('#saveCategoryForm').formValidation('enableFieldValidators','document[]',true);
	       }else if(checkBox.checked == false){
	      		//alert("**else**"+checkBox.checked);
	           $("#map").hide();
	    	   $('#saveCategoryForm').formValidation('enableFieldValidators', 'document[]',false); 
	          } 
	     });
		 
		$('#updateCategoryForm').formValidation({
			framework : 'bootstrap',
			row : {
				valid : 'field-success',
				invalid : 'field-error'
			},
			fields : {
				UsubCategoryname : {
					validators : {
						notEmpty : {
							message : 'Please enter Sub Category Name. '
						},
		                stringLength: {
		                    min: 2,
		                    max: 80,
		                    message: 'Sub Category Name should have minimum 2 and maximum 80 characters. '
		                },
		                regexp: {
		                	regexp: /^[^\s\d\@#$&*()_\/\\<>\[\]-]+([a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+\s)*[a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+$/,
		                	message: 'Sub Category name accepts alphanumerical characters. Spaces are not allowed at beginning or end of the field. Accepts symbols @#$&*()_-\/<>[]'
		                },
					}
				},
				usubcattype:{
		            validators: {
		            	notEmpty: {
		                    message: 'Please Choose  Sub Category type'
		                }
		            }
		        },
				ucategory : {
					validators : {
						isEmpty : {
							message : 'Please select Category'
						}
					}
				},
				udoctype:{
		            validators: {
		            	notEmpty: {
		                    message: 'Please select Document Type'
		                }
		            }
		        },
				udocupload : {
					validators : {
						notEmpty : {
							message : 'Please Choose Option'
						}
					}
				},
				'udocument[]' : {
					enabled: false,
					validators : {
						notEmpty : {
							message : 'Please upload documents'
						}
					}
				}
			}
		}).on('click', '[name="udocupload"]', function(e) {
		    var checkBox = document.getElementById("udocupload1");
			   if (checkBox.checked == true){
			//	 alert("**if***"+checkBox.checked);
			   $("#umap,#udocl").show();
			   if($("#SubCatDocList").val()>0){
				   $("#SubCatDocListTableId").show();
			   }
			   $("#udocument").val('');
			   $('#updateCategoryForm').formValidation('enableFieldValidators','udocument[]',true);
	       }else if(checkBox.checked == false){
	      		//alert("**else**"+checkBox.checked);
	    	   if($("#SubCatDocList").val()>0){
				   $("#SubCatDocListTableId").show();
			   }
	           $("#umap,#udocl").hide();
	    	   $('#updateCategoryForm').formValidation('enableFieldValidators', 'udocument[]',false); 
	          } 
	     });

		var textInput = document.getElementById('SubCategory');
		var timeout = null;
		textInput.onkeyup = function(e) {
			clearTimeout(timeout);
			timeout = setTimeout(function() {
				var Category = $('#SubCategory').val();
				getsesVal().done(function(data){
					if(data!=""){
				if (Category == "") {
					$('#subcatN').text('');				
					} else {
					$.ajax({
						type : "GET",
						asyn : false,
						contentType : "application/json", // NOT dataType!
						url : "checkSubCategory?SubCategory=" + Category + "",
						success : function(response) {
							if (response !="") {
								$('#catN,#subcatN').text('Sub Category Already Exist');
								$('#btnSubmit').attr("disabled", true);
							} else {
								$('#catN,#subcatN').text('');
								$('#btnSubmit').attr("disabled", false);
							}
						}
					});
				}
					}else{ window.location.href="loginpage";}});
			}, 500);
		};
		
		$("#updateid").click(function(event) {
			getsesVal().done(function(data){
				if(data!=""){
			event.preventDefault();
			var Category=$("#ucategory option:selected").text();
			//var catid=$('#catidtd'+subcatid).val();
			$('#updateCategoryForm').formValidation('validate');
			if (!$('#updateCategoryForm').data('formValidation').isValid()) {
			} else {
				//$("#updateid").attr("disabled", true);
				var form = $('#updateCategoryForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "updatesubcategory", //this is the submit URL
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
		                     window.location.href="subcategory";
			   	   	         }
			   	   	      else{
			   	   	          window.location.href="loginpage";
			   	   	   	      }
					}
				});
			}
				}else{ window.location.href="loginpage";}});
		});
		
		var textInputupdate = document.getElementById('UsubCategoryname');
		var timeoutup = null;
		textInputupdate.onkeyup = function(e) {
			clearTimeout(timeoutup);
			timeoutup = setTimeout(function() {
				var Category = $('#UsubCategoryname').val();
				getsesVal().done(function(data){
					if(data!=""){
				if (Category == "") {
					$('#catU').text('');
				} else {
					$.ajax({
						type : "GET",
						asyn : false,
						contentType : "application/json", // NOT dataType!
						url : "checkSubCategory?SubCategory=" + Category + "",
						success : function(response) {
							if (response !="") {
								$('#catU').text('Sub Category Already Exist');
								$('#updateid').attr("disabled", true);
							} else {
								$('#catU').text('');
								$('#updateid').attr("disabled", false);
							}
						}
					});
				}
					}else{ window.location.href="loginpage";}});
			}, 500);
		};
		$('input').attr("autocomplete", 'off');
	</script>
</body>
</html>
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
																<input type="text" class="form-control" name="docname"
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
												<button type="reset" class="btn btn-info btn-sm"
													id="btn-colorb" onClick="window.location.reload()">Reset</button>
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
												<th scope="col">Document Type Name</th>
												<th scope="col">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="doclist" items="${docTypeyList}">
												<tr>
													<td>${doclist.document_type}</td>
													<td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;" 
											onclick="editDocument(${doclist.documenttype_id},'${doclist.document_type}');" class="btn btn-info btn-sm addButton">
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
					<div class="modal-dialog modal-lg" style="max-width:40%" role="document">
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
										<label class="col-sm-4 col-form-label">Document Name</label>
									
										<div class="col-sm-7">
											<input id="udocname" name="udocname" class="form-control" />
											<span id="catU" style="color: red;"></span>
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
	getsesVal().done(function(data){
		if(data!=""){
	$('#catU').text('');
	$('#udocid').val(docid);
	$('#udocname').val(docname);
	$('#categorymodal').modal('show');
		}else{ window.location.href="loginpage";}});
}
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
					url : "savedoctype", //this is the submit URL
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
		                     window.location.href="documenttype";
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
		$('#saveCategoryForm,#formid').formValidation({
			framework : 'bootstrap',
			row : {
				valid : 'field-success',
				invalid : 'field-error'
			},
			fields : {
				/* Category: {
		            validators: {
		            	 notEmpty: {
		                    message: 'Please enter Category Name. '
		                },
		                callback:{
		                    message: 'Category Name is not valid',
		                    callback: function(value, Category, $field){
		                        if(value===''){
		                            return true;
		                         }
		                        if(value.length<2 || value.length>80){
		                            return {
		                                valid: false,
		                                message: 'Category Name should have minimum 2 and maximum 80 characters. '
		                            };
		                        }
		                      //  var reg1=/^(?!\s\/\\@#$&*()\[<>\]_-+$)(?:([a-zA-Z@#$&*\]()\[<>_\/\\-])[a-zA-Z @#$&*\[()<>\]_\/\\-]*)?$/;
		                        var regexp1=/^(?!\s\/\\@#$&*()\[<>\]_-+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 @#$&*\]()\[<>_\/\\-]*)?$/;
		                        if(!value.match(regexp1)) {
		                            return {
		                                valid: false,
		                                message: 'Category name accepts alphanumerical characters. Spaces are not allowed at beginning or end of the field. Accepts symbols @#$&*()_-\/<>[]'
		                            };
		                        }
		                        return true;
		                    }               
		                }
		            }          
		        } */
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
				var docname = $('#docname').val();
				getsesVal().done(function(data){
					if(data!=""){
				if (docname == "") {
					$('#catN').text('');
				} else {
					$.ajax({
						type : "GET",
						asyn : false,
						contentType : "application/json", // NOT dataType!
						url : "checkDocumentType?docname=" + docname + "",
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
					}else{ window.location.href="loginpage";}});
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
					url : "updatedoctype", //this is the submit URL
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
		                     window.location.href="documenttype";
			   	   	         }
			   	   	      else{
			   	   	          window.location.href="loginpage";
			   	   	   	      }
					}
				});
			}
				}else{ window.location.href="loginpage";}});
		});
		
		 var textInputupdate = document.getElementById('udocname');
		var timeoutup = null;
		textInputupdate.onkeyup = function(e) {
			clearTimeout(timeoutup);
			timeoutup = setTimeout(function() {
				var udocname = $('#udocname').val();
				getsesVal().done(function(data){
					if(data!=""){
				if (udocname == "") {$('#catU').text('');
				} else {
					$.ajax({
						type : "GET",
						asyn : false,
						contentType : "application/json", // NOT dataType!
						url : "checkDocumentType?docname=" + udocname + "",
						success : function(response) {
							if (response !="") {
								$('#catU').text(udocname+ ' already exists');
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
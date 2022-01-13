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

#pendingdocs {
	width: 105% !important;
}

.col-lg-2 {
	padding-right: 5px;
}

#iconImgId {
	max-width: 30%;
}

.form-control {
	font-size: 12px;
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
							<h5 class="card-header">Document Repository</h5>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
										<%-- <input type="hidden" name="emptype" id="emptype" value="${emptype}">
									<input type="hidden" name="role" id="role" value="${role}">
									<input type="hidden" name="dept" id="dept" value="${dept}">
									
									<input type="hidden" id="semp_type1" value="${semp_type}"> --%>


										<fieldset>
											<form action="/" method="post" id="searchid"
												class="form-horizontal">
												<div class="form-group row">
													<%--  <div class="col-lg-2">
													<select id="sEmp_type" autocomplete="off" name="semp_type" class="form-control" style="height: calc(1.8rem + 2px);"
													onchange="loadEmpTypes()" title="Please Select" required>
														<option value="">Employee Type</option>
														<c:if test="${(emptype=='Admin' || emptype=='W2 Admin') && role==4}">
														<option value="Employees">Employees</option>
														<option value="Contractors">Contractors</option>
														</c:if>
														<c:if test="${emptype=='W2 Admin' && dept==2 && role==2}">
														<option value="Employees">Employees</option>
														</c:if>
														<c:if test="${emptype=='W2 Admin' && dept==5 && role==2}">
														<option value="Contractors">Contractors</option>
														</c:if>
													</select>
												</div> --%>
													
												
													<div class="col-lg-2" style="width: 14.67%;">
														<select name="candidate" autoComplete="off"
															class="form-control text-left" id="candidate"
															onchange="loaddocTypes()" required>
															<option value="">Full</option>
															<c:forEach var="clist" items="${candidateList}">
																
																	<option value="${clist.candidate_id}">${clist.username}</option>
															
															</c:forEach>
														</select>
													</div>
												
													<!-- <div class="col-lg-2">
														<select id="inittype"   autocomplete="off" name="inittype" 
															class="form-control">
														</select>
													</div>
													 -->
													
													<div class="col-lg-2">
														<select id="doctype" autocomplete="off" name="doctype"
															class="form-control"
															style="height: 39px; border: 2px solid #ccc;">
															<!-- <option value="">Document Type</option> -->
														</select>
													</div>
                                                   <div class="col-lg-2">
														<select id="subdoctype" autocomplete="off" name="subdoctype"
															class="form-control"
															style="height: 39px; border: 2px solid #ccc;">
															<!-- <option value="">Sub Document Type</option> -->
														</select>
													</div>

													<div class="col-sm-2">
														<button type="button" id="repoid" class="btn btn-info btn-sm">Search</button>
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
				<div id="searchdiv">
				<table id="searchtable"
												class="table table-hover table-bordered"
												style="text-align: center;">
												<thead style="background-color:lavender;">
													<tr>
													    <th>Beneficiary Name</th> 
														<th>Document Name</th>
														<th>SubDocument Name</th>
														<!-- <th>Action </th> -->
													</tr>
												</thead>
												<tbody>

												</tbody>
											</table></div>
			</div>
		</div>
	</div>
<script src="resources/js/js/jquery-2.1.4.min.js"></script> 
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script> 	
<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
<script src="resources/js/newdt/datatables-init.js"></script>
 <script type="text/javascript" src="resources/js/js/select2.min.js"></script>	
<script src="resources/preDefined/goback.js"></script>
	<script>
	$('#inittype').select2({
	    placeholder: "Initiation Type",
	});
	$('#doctype').select2({	
	    placeholder: "Document Type",
	});
	
	$('#subdoctype').select2({
	    placeholder: "Sub Document Type",
	});
	$('#candidate').select2({	
	    placeholder: "Select Username",
	});
	
	 $('#searchdiv').hide();
		function loaddocTypes() {
			getsesVal().done(function(data){  
                if(data!=""){
			$('#searchdiv').hide();
			$('#inittype,#doctype,#subdoctype').empty(); 
			$('#inittype,#doctype,#subdoctype').val('').trigger("change");
			
			var candid = $('#candidate').val();
			
			$.ajax({
				type : "GET",
				asyn : false,
				contentType : "application/json",
				url : "getDocTypesByCandId",
				data : {
					"candidateid" : candid
				},
				success : function(response) {
					
					var list=response.docList;
				
					$('#doctype').append($('<option/>').attr("value", '').text("Select document Type"));
					for (var i = 0; i < list.length; i++) {
						$('#doctype').append($('<option/>').attr("value",list[i].document_id).text(list[i].doctypename));
					}
				}
			});
                }else{
                    window.location.href="loginpage";
    		                }
    	                  });
		}
		
		
		
		 
		 $("#doctype").change(function(event) {
			 getsesVal().done(function(data){  
                 if(data!=""){
			 $('#subdoctype').empty(); 
			 $('#subdoctype').val('').trigger("change");
			 
			var candid = $('#candidate').val();
			var docid = $('#doctype').val();
			
			$.ajax({
				type : "GET",
				asyn : false,
				contentType : "application/json",
				url : "getsubDocTypesBydocId",
				data : {
					"candidateid" : candid,
					"docid"   : docid
				},
				success : function(response) {
					$('#subdoctype').append($('<option/>').attr("value", '').text("Select Sub Document Type"));
					
					var list=response.subdocList;
					for (var i = 0; i < list.length; i++) {
						$('#subdoctype').append($('<option/>').attr("value",list[i].subdocid).text(list[i].subdoctypename));
					}
				}
			});
                 }else{
                     window.location.href="loginpage";
     		                }
     	                  });
		 });
		 var tabledocse = $('#searchtable').DataTable({
				"order" : [ [ 0, "asc" ] ],
				lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
				bLengthChange : true,
				paging : true
			});
		 $('#searchid') 
		 .formValidation({
		     framework: 'bootstrap',
		     row: {
		         valid: 'field-success',
		         invalid: 'field-error'
		     },
		     fields: {	       
		    	 candidate: {
		             validators: {
		             	notEmpty: {
		                     message: 'Please select username'
		                 }
		               }
		            }
		         }
		     });
		     
		 $("#repoid").click(function(event) {
			 getsesVal().done(function(data){  
                 if(data!=""){
			 $('#searchid').formValidation('validate');
				if( !$('#searchid').data('formValidation').isValid())
					 {
					 }
				else{
			 var candid = $('#candidate').val();
			// var profileid = $('#inittype').val();
			 var docid = $('#doctype').val();
			 var subdocid = $('#subdoctype').val();
			//alert(candid+"-"+docid+"-"+subdocid)
			 $.ajax({
					type : "GET",
					asyn : false,
					contentType : "application/json",
					url : "getalldocs",
					data : {
						"candidateid" : candid,
					
						"docid" : docid,
						"subdocid" : subdocid
					},
					success : function(response) {
						var list=response.searchList;
						if(list.length>0){
							 $('#searchdiv').show();
							 if (tabledocse) tabledocse.clear();
				        	   $('#searchtable').dataTable().fnClearTable();
							 for (var i = 0; i < list.length; i++) {
										var encoded = encodeURIComponent(list[i].subdoctypename);
										var file=list[i].subdoctypename+".pdf"
										var btn='<button type="button" onclick="filemerge(\''+list[i].candidate_id+'\',\''+list[i].subdoctypename+'\',\''+list[i].subdocid+'\',\''+list[i].document_id+'\')" class="btn btn-info btn-sm"><i class="fa fa-file" aria-hidden="true"></i></button>';		
										
										tabledocse.row.add([
											     ''+list[i].beneficiary_Name+'', 
												''+list[i].doctypename+'',
												'<a onclick="filemerge(\''+list[i].candidate_id+'\',\''+list[i].subdoctypename+'\',\''+list[i].subdocid+'\',\''+list[i].document_id+'\')"   style="color:blue">'+list[i].subdoctypename+'</a>'
												/* ''+btn+'' */
												  
														]).draw(); 
									}
							
						}else{
							 if (tabledocse) tabledocse.clear();
				        	   $('#searchtable').dataTable().fnClearTable();
							 $('#searchdiv').show();
						}
											
					}
				}); 
			 }
                 }else{
                     window.location.href="loginpage";
     		                }
     	                  });
		 });
	function filemerge(candid,subdocname,subdocid,docid){
		getsesVal().done(function(data){  
            if(data!=""){
		alert("Downloading may take some time..Please wait")
	//	alert(candid+"-"+subdocname+"-"+subdocid+"-"+docid);
		 $.ajax({
				type : "GET",
				asyn : false,
				contentType : "application/json",
				url : "filemerge",
				data : {
					"candidateid" : candid,
					"subdocname" : subdocname,
					"subdocid" : subdocid,
					"docid" : docid
					
				},
				success : function(response) {
					//alert(response)
					if(response==="success"){
						var file=subdocname+".pdf";
						window.location.href="downloadh1bmrgdocs?filename="+file+" &candidate_id="+candid+" ";
					}else{
						alert("No documents available")
					}
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

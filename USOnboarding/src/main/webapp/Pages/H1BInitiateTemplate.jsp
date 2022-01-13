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
<link rel="stylesheet" href="resources/css/select2.min.css"/>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

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
<style>
 li {
  display:inline;
}


ul#closeChapter li {
		display: inline;
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
							<h5 class="card-header">Generate H1B Initiation Template </h5>
							<div class="card-body">
								<div class="row">
								<input type="hidden" name="empno" id="empno"value="${empno}">
									<div class="col-md-8 col-sm-12">
										 <form action="/" enctype="multipart/form-data"	id="saveCategoryForm">
										<!-- <form action="profilemaster" method="post" enctype="multipart/form-data"> -->
											
											<div>
												<fieldset>

													<div>

														<div class="form-group row">
															<label class="col-sm-5 col-form-label"><span
																style="color: red">*</span>Enter Template Name</label>
															<div class="col-sm-5">
															<input type="text" class="form-control" name="profilename"
																	id="profilename" required>
																	<%-- <select class="form-control" id="profilename" name="profilename" required>
																	<option value="" >--Select Initiate Type--</option>
																	<c:forEach var="initlist" items="${initiateList}">
																	<option value="${initlist.profile_id}">${initlist.profile_name}</option>
																	</c:forEach>
																	</select> --%>
																	 <span id="catN" style="color: red;"></span>
															</div>
														</div>
														<!-- <div class="form-group row">
															<label for="inputPassword" class="col-sm-5 control-label"><span
																style="color: red">*</span>Is This Template Dependent?</label>
															<div class="col-sm-5">
																<label>Yes</label>&nbsp;<input type="radio"
																	id="isdependent" name="isdependent" value="Yes"
																	style="width: 20px; height: 20px;" required />&nbsp;<label>No</label>&nbsp;<input
																	type="radio" id="isdependent" name="isdependent" value="No"
																	style="width: 20px; height: 20px;" /> <br>
															</div>
														</div> -->
														<div class="form-group row">
															<label class="col-sm-5 col-form-label"><span
																style="color: red"></span></label>
															<div class="col-sm-7"><br>
																<span style="color: blue;" id="subcolor"><i class='fa fa-circle'></i> Candidates Submits documents/forms under this Sub-Document Type </span>
																<br><span  id="subcolorblack"><i class='fa fa-circle'></i> Admin Uploads documents for this Document Type</span>
															</div>
														</div>
														<input type="hidden" id="subcatArray" name="subcatArray">
														<input type="hidden" id="catArray" name="catArray">
														<input type="hidden" id="bgclist" name="bgclist">
														
														
														<div class="form-group row" style="display: none;">
															<label class="col-sm-5 col-form-label"><span
																style="color: red">*</span>Category</label>
															<div class="col-sm-5">
																<select class="form-control" id="profilename" name="profilename" required>
																	<option value="" disabled>--Select Initiate Type--</option>
																	<c:forEach var="initlist" items="${initiateList}">
																	<option value="${initlist.profile_id}">${initlist.profile_name}</option>
																	</c:forEach>
																	</select>
															</div>
														</div>
														 <!-- <div id="listAbtnDiv"></div> -->
													</div>
													<!-- <div class="act-main-body"> -->
												<div class="act1-body" id="actiddiv">
												</div><!-- </div> -->
													
												</fieldset>
											</div>
											<div></div>
											<div class="text-center ml-5">
												<!-- <input  type="submit" class="btn btn-info btn-sm"
													 value="Submit"> -->
													<button  class="btn btn-info btn-sm"
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
							<h5 class="card-header">Documents Template Details</h5>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-striped" id="vendorTable">
										<thead>
											<tr>
											<th scope="col">Template Name</th>
												<th scope="col">Status</th>
												<th scope="col">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="plist" items="${templateList}">
												<tr>
													<td><a class='btn btn-info btn-sm' data-toggle='modal' style="padding:3px;line-height:0.728571; background-color: #15aabf; color: white;"
														onclick="viewtemplatedocuments(${plist.profile_id},'${plist.profile_name}');">
																	${plist.profile_name}
																</a></td>
													<td>${plist.status}</td>
													<td>
													<a class='btn btn-info btn-sm' data-toggle='modal' style="padding:3px;line-height:0.728571; background-color: #15aabf; color: white;"
																	onclick="editProfile(${plist.profile_id});">
																	<i class="fa fa-eye" aria-hidden="true"></i>
																</a>
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
			<div class="modal fade" id="lcahistorymodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width: 60%"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<center><b><span id="tname"></span> Template Documents</b></center>
								</h5>
							</div>

							<div class="modal-body">
								<div class="row">
									<div class="col">
										<div class="row">
											<div class="col-lg-12"
												style="max-width: 1250px; overflow-x: auto; white-space: nowrap;">
												<table id="lcadatatable"
													class="table table-hover table-bordered"
													style="text-align: center;">
													<thead>
														<tr>

															<th style="text-align: center">Document Type</th>
															<th style="text-align: center">Document Sub Type</th>
															<th style="text-align: center">Submit By</th>
															
														</tr>
													</thead>
													<tbody id="lcalistatble">

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
			<!-- .animated -->
		</div>
	</div>
		<div>
	<c:forEach var="actlist" items="${documentList}">
		<input type="hidden" name="catid" id="catid" value="${actlist.documenttype_id}" />
		<input type="hidden" name="catname" id="catname" value="${actlist.document_type}" />
	</c:forEach>
	</div>
 
 <script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> -->
<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="resources/js/js/select2.min.js"></script>
<script src="resources/preDefined/goback.js"></script>
<script>
  $('#Category').select2();
</script>
<script>
function editProfile(profileid) {
	getsesVal().done(function(data){
		if(data!=""){
/* 	var result = confirm("In order to edit this Grouping Template, you will be redirected to a new tab.");
	if(result==true){ */	
	window.open("updateimmitemplate?profileid=" + profileid );
		}else{
			 window.location.href="loginpage";
		}
	});
	//}
}

$( "#actiddiv" ).load( "ajax/test.html", function() {
	var actIdPK =document.getElementsByName("catid");
	  var actIdPK1 =[];	
	  var catname=[];
	  var ul=document.createElement('ul');
	
	  $("#actiddiv").empty();

	  for(var i = 0; i < actIdPK.length; i++){
		  actIdPK1[i]= document.getElementsByName("catid")[i].value;
	      catname[i]=document.getElementsByName("catname")[i].value;
	      var li = document.createElement("li");
			li.setAttribute("id","chapterview"+actIdPK1[i]);
			var div = document.createElement("div");
			div.innerHTML = '<p id="actToggl'+actIdPK1[i]+'" ><i id="angleright'+actIdPK1[i]+'" class="fas fa-angle-right"></i><i id="angledown'+actIdPK1[i]+'" style="display:none;" class="fas fa-angle-down"></i>&nbsp;&nbsp;&nbsp;<button id="viewchapid'+actIdPK1[i]+'"  style="padding:2px;border-radius: 12px;background-color:peru;color:white;line-height:0.728571;cursor: pointer;" onclick="viewSubCategories('+actIdPK1[i]+')" >'+catname[i]+'</button></p>';
			li.appendChild(div);  
			ul.appendChild(li);
			        
	   } 
			$("#actiddiv").append(ul);
	  	});
$("#subcolor,#subcolorblack").hide();
function viewSubCategories(acid){
	getsesVal().done(function(data){
		if(data!=""){
	var ul=document.createElement('ul');
	ul.setAttribute("id","sucat_id"+acid);
	$("#viewchapid"+acid).attr("disabled",true);
	$("#angleright"+acid).hide();	$("#angledown"+acid).show();
	
	$("#subcolor,#subcolorblack").show();
	
	$.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/json", // NOT dataType!
		url : "getSubDocumentsByDocid?Categoryid=" + acid + "",
		success : function(response) {
			
			if(response.length==0){
				 var li = document.createElement("li");
			        li.innerHTML='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:blue">No more Sub-Documents left under this Category</span>'
			        ul.appendChild(li);
			}else{
			 for(var i=0;i<response.length;i++){
				 var chapter_pk=response[i].subdocumenttype_id;
				   var subcatname=response[i].document_type;
				   var subcattype=response[i].issubycand;
				 var li = document.createElement("li");
					li.setAttribute("id", "subcategoryview"+chapter_pk)
					if(subcattype==1){
						li.innerHTML='<input type="hidden" id="category" name="category" value="'+acid+'">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="subcategory'+acid+'" name="subcategory'+acid+'" value="'+chapter_pk+'" style="width: 20px;height: 16px;" ><span style="color:blue;"><b>'+subcatname+'</b></span>'
					}else{
						li.innerHTML='<input type="hidden" id="category" name="category" value="'+acid+'">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="subcategory'+acid+'" name="subcategory'+acid+'" value="'+chapter_pk+'" style="width: 20px;height: 16px;" ><span style="color:black;">'+subcatname+'</span>'	
					}
						//li.innerHTML='<div id="subdiv'+acid+'"><input type="hidden" id="category" name="category" value="'+acid+'"><input type="checkbox" id="subcategory'+acid+'" name="subcategory'+acid+'" value="'+chapter_pk+'" style="width: 20px;height: 20px;" >'+subcatname+'</div>'
			        ul.appendChild(li);
			        //$("#chapterview"+acid).append(ul); 
			 }
		}
		}
	});
		   $("#chapterview"+acid).append(ul); 
		}else{
			 window.location.href="loginpage";
		}
	});		
}

</script>
<script type="text/javascript">


$('#saveCategoryForm').formValidation({
	framework : 'bootstrap',
	row : {
		valid : 'field-success',
		invalid : 'field-error'
	},
	fields : {
		profilename : {
			validators : {
				notEmpty : {
					message : 'Please Enter Template Name. '
				},
				 /*stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Grouping Name should have minimum 2 and maximum 80 characters. '
                },
                regexp: {
                	regexp: /^[^\s\d\@#$&*()_\/\\<>\[\]-]+([a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+\s)*[a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+$/,
                	message: 'Grouping name accepts alphanumerical characters. Spaces are not allowed at beginning or end of the field. Accepts symbols @#$&*()_-\/<>[]'
                }, */
			}
		},
		isdependent : {
			validators : {
				notEmpty : {
					message : 'Please choose one option. '
				}
			}
		}
	}
});



		$("#btnSubmit").click(function(event) {
			getsesVal().done(function(data){
				if(data!=""){
			event.preventDefault();
			$('#saveCategoryForm').formValidation('validate');
			if (!$('#saveCategoryForm').data('formValidation').isValid()) {
				//alert("not Valid");
			} else {
				 var map3;
				var array = [];var catId =[];var catArray =[];
				var categoryIds =document.getElementsByName("category");
				for(var i = 0; i <categoryIds.length; i++){
					var catIdVal = document.getElementsByName("category")[i].value;
					  if(catId.includes(catIdVal)) {
						 continue;
					 } 
						/* var favorite = [];
						$. each($("input[name='subcategory"+catIdVal+"']:checked"), function(){
						favorite. push($(this). val());
						});
						$("#bgclist").val(favorite); */
						 
					 catId[i] = catIdVal;
					 var checkboxes = document.getElementsByName('subcategory'+catIdVal);
					  for (var checkbox of checkboxes) {
					    if (checkbox.checked){
					    	array.push( checkbox.value );
					    	 $("#subcatArray").val(array); 
					    	 $("#catArray").val(catId); 
					    }   
					  }
					    /* map3 = new Map([[catIdVal, [favorite]]]); 
				    	console.log(map3);
				    	$("#bgclist").val(map3); */  
				}
				if(array.length>0){
		    	
				$("#btnSubmit").attr("disabled", true);
				var form = $('#saveCategoryForm')[0];
				var data = new FormData(form);
				//data.append("bgclist",map3);
				$.ajax({
					url : "immitemplatemaster", //this is the submit URL
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
		                     window.location.href="initiatetemplate";
			   	   	         }
			   	   	      else{
			   	   	          window.location.href="loginpage";
			   	   	   	      }
					}
				});
				}else{
			alert("Please select atleast one Sub Category to generate Grouping Profile");
				
				}
			}
				}else{
					 window.location.href="loginpage";
				}
			});
		});
		
		
		
		/* $("#profilename").change(function() {
			var profilename=$("#profilename option:selected").text();
			var profileid=$("#profilename").val();
			$.ajax({
				type : "GET",
				asyn : false,
				contentType : "application/json", // NOT dataType!
				url : "checkimmiprofilemaster?profilename=" + profileid + "",
				success : function(response) {
					///alert(response)
					if (response !="") {
						$('#catN').text(profilename+' template already exist');
						$('#btnSubmit').attr("disabled", true);
					} else {
						$('#catN').text('');
						//$('#catN').text('Lable name already exist');
						$('#btnSubmit').attr("disabled", false);
					}
				}
			});
		}); */

		 var textInput = document.getElementById('profilename');
		var timeout = null;
		textInput.onkeyup = function(e) {
			clearTimeout(timeout);
			timeout = setTimeout(function() {
				var profilename=$('#profilename').val();
				getsesVal().done(function(data){
			if(data!=""){
				if (profilename == "") {
					$('#catN').text('');
				} else {
					$.ajax({
						type : "GET",
						asyn : false,
						contentType : "application/json", // NOT dataType!
						url : "checkimmiprofilemaster?profilename=" + profilename + "",
						success : function(response) {
							if (response !="") {
								$('#catN').text(profilename+' template already exist');
								$('#btnSubmit').attr("disabled", true);
							} else {
								$('#catN').text('');
								//$('#catN').text('Lable name already exist');
								$('#btnSubmit').attr("disabled", false);
							}
							
						}
					});
				}
			}else{
				 window.location.href="loginpage";
			}
		});
			}, 5);
		};
		 
	</script>
	<script type="text/javascript">
	
	
	function profileStatus(profileid,status){
		getsesVal().done(function(data){
			if(data!=""){
			var pstatus="";
			if(status=="Active" || status==""){
				pstatus="InActive";
			}else{
				pstatus="Active";
			}
			var result = confirm("Are you sure to "+pstatus+" the Profile?");
			
			if(result==true){
			$.ajax({
		        type: "GET",
		        url: "profileStatus?profileid="+profileid+"&status="+pstatus+"",
		        cache: false,
		        async: false, 
		        success: function(response){
			        
			        	 alert(response);
			        	 window.location.href="profilemaster";
				         
		        },
		        error: function(){                                                                                 
		        }                                                       
		    }); 
			}else{}
			}else{
				 window.location.href="loginpage";
			}
		});
		}
	var tablefh = $('#lcadatatable').DataTable({
		"order" : [ [ 0, "asc" ] ],
		lengthMenu : [ [ 5, 10, 15, -1 ], [ 5, 10, 15, "All" ] ],
		bLengthChange : true,
		paging : true
	});
	function viewtemplatedocuments(profileid,pname){
		getsesVal().done(function(data){
			if(data!=""){
		 $('#tname').text(pname);
			$.ajax({
				type : "GET",
			    asyn : false,
			    contentType: "application/json",
				url : "gettemplatedocsbyprofileid",
				data : {
					profileid : profileid,
				},
				success : function(response) {
					$('#lcadatatable').dataTable().fnClearTable();
					if(response!=""){
					if (tablefh)tablefh.clear();
					for(var i=0;i<response.length;i++){
						var isdependent;
						if(response[i].issubmitby==1){
							isdependent="Candidate";
						}else{
							isdependent="Immigration Team";
						}
				tablefh.row.add([
					'' + response[i].category	+ '',
					'' + response[i].subcategory+ '',
					'' + isdependent+ '',]).draw();
					}
					
				    }
				  $('#lcahistorymodal').modal('show');
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
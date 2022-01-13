<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/css/datepicker3.min.css" />
<link rel="stylesheet" href="resources/css/css/select2.min.css"/>
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
<!-- <style>
 li {
  display:inline;
}


ul#closeChapter li {
		display: inline;
	}
</style> -->
<body>
<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">Update Assigned Candidate</h5>
							<div class="card-body">
								<div class="row">
								<input type="hidden" name="empno" id="empno"value="${empno}">
									<div class="col-md-10 col-sm-12">
										 <form action="/" enctype="multipart/form-data"	id="saveCategoryForm">
										<!-- <form action="profilemaster" method="post" enctype="multipart/form-data"> -->
											
											<div>
												<fieldset>

													<div>
														
														<div class="form-group row">
															<label class="col-sm-5 col-form-label"><span
																style="color: red">*</span>Select Profile </label>
															<div class="col-sm-5">
													<select class="form-control" id="profile" name="profile" required>
													<option value="" >--Select Profile--</option>
													<c:forEach var="plist" items="${profileList}">
													<option value="${plist.profile_id}" ${plist.profile_id == bgcDetailsObj.profile_id ? 'selected="selected"' : ''}>${plist.profile_name}</option>
													</c:forEach>
												</select>
															</div>
														</div>
														
														<div class="form-group row">
															<label class="col-sm-5 col-form-label"><span
																style="color: red">*</span>Select Candidate </label>
															<div class="col-sm-5">
																<select
													class="form-control" id="candidate" name="candidate" required>
													<option value="" >--Select Candidate--</option>
													<c:forEach var="clist" items="${tempCandidateList}">
													<option value="${clist.candidate_id}" ${clist.candidate_id == bgcDetailsObj.candidate_id ? 'selected="selected"' : ''}>${clist.full_name}</option>
													</c:forEach>
												</select>
															</div>
														</div>
														
														<div class="form-group row">
															<label class="col-sm-5 col-form-label"><span
																style="color: red">*</span>Select Status</label>
															<div class="col-sm-5">
																<select
													class="form-control" id="status" name="status" required>
													<option value="" >--Select Status--</option>
													
											<option value="Pre Onboarding" ${'Pre Onboarding' eq bgcDetailsObj.task_status ? 'selected="selected"' : ''}>Pre Onboarding</option>
											 <option value="Post Onboarding" ${'Post Onboarding' eq bgcDetailsObj.task_status ? 'selected="selected"' : ''}>Post Onboarding</option>
														
												</select>
															</div>
														</div>
														
														<c:set var="theString" value="${bgcDetailsObj.predefined_forms}" />
													  <div class="form-group row">
											             <label for="inputPassword" class="col-sm-5 control-label"><span
																style="color: red">*</span>Forms you want to send to Candidate</label>
											            <div class="col-sm-7">
											            <c:choose>
										              <c:when test="${fn:contains(theString, 'Personal')}">
										              <label>Personal Details</label>&nbsp;<input type="checkbox" name="baicforms" value="Personal" style=" width: 20px;height: 20px;" checked/>
										              </c:when>
										              <c:otherwise>
										              <label>Personal Details</label>&nbsp;<input type="checkbox" name="baicforms" value="Personal" style=" width: 20px;height: 20px;"/>
										              </c:otherwise>
										              </c:choose>
										              <c:choose>
										              <c:when test="${fn:contains(theString, 'Education')}">
										              &nbsp;<label>Education Details</label>&nbsp;<input type="checkbox" name="baicforms" value="Education" style=" width: 20px;height: 20px;" checked/>
										              </c:when>
										              <c:otherwise>
										              &nbsp;<label>Education Details</label>&nbsp;<input type="checkbox" name="baicforms" value="Education" style=" width: 20px;height: 20px;" />
										              </c:otherwise>
										              </c:choose>
										                <c:choose>
										              <c:when test="${fn:contains(theString, 'Employment')}">
										               &nbsp;<label>Employment Details</label>&nbsp;<input type="checkbox" name="baicforms" value="Employment" style=" width: 20px;height: 20px;" checked/>
										              </c:when>
										              <c:otherwise>
										               &nbsp;<label>Employment Details</label>&nbsp;<input type="checkbox" name="baicforms" value="Employment" style=" width: 20px;height: 20px;" />
										              </c:otherwise>
										              </c:choose>
													      <br>
												        </div>
										              </div>
										              
														
														<input type="hidden"
																	id="bgcCheckListSize" name="bgcCheckListSize"
																	value="${bgcCheckListSize}"> <input
																	type="hidden" id="subcatArray" name="subcatArray">
														<input type="hidden" id="catArray" name="catArray">
														<input type="hidden" id="uncheckArray" name="uncheckArray">
														<input type="hidden" id="uncheckArrayVal"
																	name="uncheckArrayVal">
														
														<input type="hidden" id="subcatvalues" name="subcatvalues"
																	value="${subcatvalues}">
														<input type="hidden" id="bgc_id" name="bgc_id"
																	value="${bgcDetailsObj.bgc_id}">
														<input type="hidden" id="profile_id" name="profile_id"
																	value="${bgcDetailsObj.profile_id}">
														
														
														
													
															</div>
													<center><span id="profileview" style="color:blue;text-align: center;"></span></center>
													<div class="form-group row" style="display: none;" id="colors">
															<label class="col-sm-5 col-form-label"><span
																style="color: red"></span></label>
															<div class="col-sm-7"><br>
																<span style="color: blue;" id="subcolor"><i class='fa fa-circle'></i> Candidates Submits documents/forms under this Sub-Category </span>
																<br><span  id="subcolorblack"><i class='fa fa-circle'></i> Admin Uploads documents for this Category</span>
															</div>
														</div>
													<div class="form-group row">
															<label class="col-sm-5 col-form-label"><h4></h4><b>Candidate Specific</b></h4></label>
														</div>
													
												<div class="act1-body" id="actiddiv">
												</div>
													
												</fieldset>
											</div>
											<div></div>
											<div class="text-center ml-5">
											<c:if test="${bgcDetailsObj.status eq 'Active'}">
													<button  class="btn btn-info btn-sm"
													id="btnSubmit">Update</button> 
													</c:if>
													<c:if test="${bgcDetailsObj.status ne 'Active'}">
													<button  class="btn btn-info btn-sm"
													id="btnSubmit" disabled title='Candidate profile status is InActive'>Update</button> 
													</c:if>
												<button type="reset" class="btn btn-info btn-sm"
													id="btn-colorb" onClick="window.close()">Cancel</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
							<div class="card" id="responseCard">
							<h5 class="card-header">Assigned Candidate List</h5>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-striped" id="vendorTable">
										<thead>
											<tr>
											<th scope="col">BGC Id</th>
											<th scope="col">Profile Name</th>
											<th scope="col">Candidate Name</th>
											<th scope="col">On-boarding Status</th>
											<th scope="col">Profile Status</th>
											<th scope="col">Action</th>
											</tr>
										</thead>
										<tbody>
										<!-- profile_id,candidate_id,bgc_id -->
											<c:forEach var="clist" items="${assignedcandidateList}">
												<tr>
												    <td>${clist.bgc_id}</td>
												    <td>${clist.profile_name}</td>
													<td>${clist.full_name}</td>
													<td>${clist.task_status}</td>
													<td>${clist.status}</td>
													<td>
													<a class='btn btn-info btn-sm' data-toggle='modal' style="letter-spacing: 1px; background-color: #15aabf; color: white;"
													onclick="editAssignedCandidate(${clist.bgc_id});"><i class="fa fa-eye" aria-hidden="true"></i>
													</a></td>
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
			
			
			
			
	
			<!-- .animated -->
		</div>
	</div>
		<div>
	<c:forEach var="actlist" items="${categoryList}">
		<input type="hidden" name="catid" id="catid" value="${actlist.category_id}" />
		<input type="hidden" name="catname" id="catname" value="${actlist.category_name}" />
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
 <script type="text/javascript" src="resources/js/js/select2.min.js"></script>
 <script src="resources/preDefined/goback.js"></script>
<script>
 $('#profile').select2({
	     placeholder: "Select Profile",
	});
 $('#candidate').select2({
     placeholder: "Select Candidate",
  });
 $('#status').select2({
     placeholder: "Select Status",
  });
</script>
<script>
//$("#actiddiv").show();
function editAssignedCandidate(bgcid) {
	getsesVal().done(function(data){
		if(data!=""){
	var result = confirm("In order to edit this Grouping Profile, you will be redirected to a new tab.");
	if(result==true){
	window.open("updatecandidateprofile?bgcid="+bgcid);
	}
		}else{ window.location.href="loginpage";}});
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
	  	//});
	});
	$("#subcolor,#subcolorblack").hide();
function viewSubCategories(categoryid){
	getsesVal().done(function(data){
		if(data!=""){
	var ul=document.createElement('ul');
	ul.setAttribute("id","sucat_id"+categoryid);
	$("#viewchapid"+categoryid).attr("disabled",true);
	$("#angleright"+categoryid).hide();	$("#angledown"+categoryid).show();
	var profileid=$('#profile').val();var bgc_Id=$('#bgc_id').val();
	$("#subcolor,#subcolorblack,#colors").show();
	//var subcatArray=getCandidateBGCCheckListBybgcId(bgc_Id);
	$.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/json", // NOT dataType!
		url : "getCandidateSpecifics?Categoryid=" + categoryid + "&profileid="+profileid+"",
		success : function(response) {
			if(response.length==0){
				var li = document.createElement("li");
		        li.innerHTML='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:blue">No more Sub-Categories left under this Category</span>'
		        ul.appendChild(li);
			}else{
			var subvalues=$("#subcatvalues").val();
			 var arraysubvalue = subvalues.split(',').map(function(item) {
				    return parseInt(item, 10);
				});
			var sval;
			 for(var i=0;i<response.length;i++){
				 var subcategory_id=response[i].subcategoryid;
				   var subcatname=response[i].subcategory; var subcattype=response[i].subcategory_type;
				 var li = document.createElement("li");
					li.setAttribute("id", "subcategoryview"+subcategory_id)
					$('li').css('display', 'inline');
			        //li.innerHTML='<input type="hidden" id="category" name="category" value="'+acid+'"><input type="checkbox" id="subcategory'+acid+'" name="subcategory'+acid+'" value="'+chapter_pk+'" style="width: 20px;height: 20px;" >'+subcatname+''
					 var splitstring;
					
						 for(var j=0;j<arraysubvalue.length;j++){
							sval=arraysubvalue[j]
							 splitstring=sval.toString().split(",");
							
					if(arraysubvalue.includes(subcategory_id)) {
							if(subcattype==1){
								li.innerHTML='<input type="hidden" id="category" name="category" value="'+categoryid+'">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" onclick="UnChecked('+categoryid+','+subcategory_id+')" id="subcategory'+categoryid+'" name="subcategory'+categoryid+'" value="'+subcategory_id+'" checked style="width: 16px;height: 16px;" ><span style="font-size"30px;"><span style="color:blue;"><b>'+subcatname+'</b></span>'
							}else{
							li.innerHTML='<input type="hidden" id="category" name="category" value="'+categoryid+'">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" onclick="UnChecked('+categoryid+','+subcategory_id+')" id="subcategory'+categoryid+'" name="subcategory'+categoryid+'" value="'+subcategory_id+'" checked style="width: 16px;height: 16px;" ><span style="font-size"30px;">'+subcatname+'</span>'	
						} 
						}
					else{
							if(subcattype==1){
								li.innerHTML='<input type="hidden" id="category" name="category" value="'+categoryid+'">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox"  id="subcategory'+categoryid+'" name="subcategory'+categoryid+'" value="'+subcategory_id+'" style="width: 20px;height: 16px;" ><span style="font-size"30px;"><span style="color:blue;"><b>'+subcatname+'</b></span>'
						}else{
							li.innerHTML='<input type="hidden" id="category" name="category" value="'+categoryid+'">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox"  id="subcategory'+categoryid+'" name="subcategory'+categoryid+'" value="'+subcategory_id+'" style="width: 20px;height: 16px;" ><span style="font-size"30px;">'+subcatname+'</span>'
						}
						} 
					} 
			        ul.appendChild(li);
			 }
		}
		}
	});
		   $("#chapterview"+categoryid).append(ul); 
		}else{ window.location.href="loginpage";}});
		}
var uncheckarray=[];
function UnChecked(ucsubid,sucatid){
	var checkboxes = document.getElementById('subcategory'+ucsubid);
	 var subvalues=$("#subcatvalues").val();
			 var arraysubvalue = subvalues.split(',').map(function(item) {
				    return parseInt(item, 10);
				});
	if (checkboxes.checked==false){
	if(arraysubvalue.includes(sucatid)) {
		uncheckarray.push(sucatid);
	$("#uncheckArray").val(uncheckarray); 
		}
	}
}
/* function UnChecked(ucsubid,sucatid){
	var checkboxes = document.getElementById('subcategory'+ucsubid);
	if (checkboxes.checked==false){
	uncheckarray.push(sucatid);
	$("#uncheckArray").val(uncheckarray); 
	}
} */

function getCandidateBGCCheckListBybgcId(bgcid){
	getsesVal().done(function(data){
		if(data!=""){
	$.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/json", // NOT dataType!
		url : "getCandidateBGCCheckListBybgcId?bgc_id=" + bgcid + "",
		success : function(response) {
			var subcatArray=[];
			 for(var i=0;i<response.length;i++){
				 var subcategory_id=response[i];
				 subcatArray.push(subcategory_id);
			 }
			 $("#subcatvalues").val(response);
			 return subcatArray;
		}
	});
		}else{ window.location.href="loginpage";}});
}
</script>
<script type="text/javascript">
$("#profileview").text('Note: Any Categories and Sub-Categories selected as a part of Select Profile will not be displayed in Candidate Specific list. In order to know all Categories and Sub-Categories assigned to the selected Profile, please check from Grouping Profile');
$('#profile').on('change', function() {
	var profile=$('#profile').val();
	
	var profiletext=$("#profile option:selected").text();
	if(profile==''){
		$("#profileview").text('');
	}else{
	$("#profileview").text('Note: Any Categories and Sub-Categories selected as a part of Select Profile will not be displayed in Candidate Specific list. In order to know all Categories and Sub-Categories assigned to the selected Profile, please check from Grouping Profile');
	}
	$("#actiddiv,#profileview").show();
	 });
  
$('#saveCategoryForm').formValidation({
	framework : 'bootstrap',
	row : {
		valid : 'field-success',
		invalid : 'field-error'
	},
	fields : {
		profile : {
			validators : {
				notEmpty : {
					message : 'Please select Profile'
				}
			}
		},
		candidate : {
			validators : {
				notEmpty : {
					message : 'Please select Candidate'
				}
			}
		},
		status : {
			validators : {
				notEmpty : {
					message : 'Please select Status'
				}
			}
		},
		 baicforms : {
				validators : {
					notEmpty : {
						message : 'Please select forms'
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
				var bgcid=$("#bgc_id").val();
				var uncheckarray=$("#uncheckArray").val(); 
				$("#uncheckArrayVal").val(uncheckarray); 
				 var map3;
				var array = [];var catId =[];var catArray =[];var uncheckarray=[];
				var categoryIds =document.getElementsByName("category");
				for(var i = 0; i <categoryIds.length; i++){
					var catIdVal = document.getElementsByName("category")[i].value;
					  if(catId.includes(catIdVal)) {
						 continue;
					 } 
					 catId[i] = catIdVal;
					 var checkboxes = document.getElementsByName('subcategory'+catIdVal);
					  for (var checkbox of checkboxes) {
						  
					    if (checkbox.checked){
					    	array.push( checkbox.value );
					    	 $("#subcatArray").val(array); 
					    	 $("#catArray").val(catId); 
					    } else{
					    	uncheckarray.push( checkbox.value );
					    	 $("#uncheckArray").val(array);
					    }  
					  }  
				}
				var bgcCheckListSize=$('#bgcCheckListSize').val();
				//if(bgcCheckListSize > 0){
				$("#btnSubmit").attr("disabled", true);
				var form = $('#saveCategoryForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "updateassignprofile", //this is the submit URL
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
		                     window.location.href="updatecandidateprofile?bgcid=" + bgcid;
			   	   	         }
			   	   	      else{
			   	   	          window.location.href="loginpage";
			   	   	   	      }
					}
				});
				/* }else{
			alert("Please select atleast one Sub Category to update Profile");
				} */
			}
				}else{ window.location.href="loginpage";}});
		});
		$('input').attr("autocomplete", 'off');
	</script>
</body>
</html>
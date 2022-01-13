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
<link rel="stylesheet" href="resources/css/css/select2.min.css"/>
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
 /* ul, li { ist-style-type: none; } */
 /* li {
  display:inline;
} */
/* #sucat_id li {
		display: inline;
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
							<h5 class="card-header">Assigning Profile To Candidate</h5>
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
																<select	class="form-control" id="profile" name="profile" required>
													<option value="" >--Select Profile--</option>
													<c:forEach var="plist" items="${profileList}">
														<option value="${plist.profile_id}">${plist.profile_name}</option>
													</c:forEach>
												</select>
															</div>
														</div>
														
														<div class="form-group row">
															<label class="col-sm-5 col-form-label"><span
																style="color: red">*</span>Select Candidate </label>
															<div class="col-sm-5">
																<select	class="form-control" id="candidate" name="candidate" required>
													<option value="" >--Select Candidate--</option>
													<c:forEach var="clist" items="${tempCandidateList}">
														<option value="${clist.candidate_id}">${clist.full_name}</option>
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
														<option value="Pre Onboarding">Pre Onboarding</option>
														<option value="Post Onboarding">Post Onboarding</option>
														</select>
															</div>
														</div>
														
											<div class="form-group row">
											<label for="inputPassword" class="col-sm-5 control-label"><span
																style="color: red">*</span>Forms you want to send to Candidate</label>
											   <div class="col-sm-7">
													<label>Personal Details</label>&nbsp;&nbsp;<input type="checkbox" name="baicforms" value="Personal" style=" width: 20px;height: 20px;" required/>&nbsp;&nbsp;&nbsp;<label>Education Details</label>&nbsp;<input type="checkbox" name="baicforms" value="Education" style=" width: 20px;height: 20px;" />&nbsp;&nbsp;<label>Employment Details</label>&nbsp;<input type="checkbox" name="baicforms" value="Employment" style=" width: 20px;height: 20px;" />
													 <br>
												</div>
										    </div>
														
														<input type="hidden" id="subcatArray" name="subcatArray">
														<input type="hidden" id="catArray" name="catArray">
													</div>
													
													<center><span id="profileview" style="display: none;color:blue;text-align: center;"></span></center>
													<div class="form-group row" style="display: none;" id="colors">
															<label class="col-sm-5 col-form-label"><span
																style="color: red"></span></label>
															<div class="col-sm-7"><br>
																<span style="color: blue;" id="subcolor"><i class='fa fa-circle'></i> Candidates Submits documents/forms under this Sub-Category </span>
																<br><span  id="subcolorblack"><i class='fa fa-circle'></i> Admin Uploads documents for this Category</span>
															</div>
														</div>
													
													<div class="form-group row">
															<label class="col-sm-5 col-form-label"><h4><b>Candidate Specific</b></h4></label>
														</div>
														
													
												<div class="act1-body" id="actiddiv">
												</div>
													
												</fieldset>
											</div>
											<!-- <div></div> -->
											<div class="text-center ml-5">
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
							<h5 class="card-header">Assigned Candidate List</h5>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-striped" id="vendorTable">
										<thead>
											<tr>
											<th scope="col">Profile Name</th>
											<th scope="col">Candidate Name</th>
											<th scope="col">Status</th>
											<th scope="col">Action</th>
											</tr>
										</thead>
										<tbody>
										<!-- profile_id,candidate_id,bgc_id -->
											<c:forEach var="clist" items="${assignedcandidateList}">
												<tr>
												    <td>${clist.profile_name}</td>
													<td>${clist.full_name}</td>
													<td>${clist.task_status}</td>
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
	<div>
	<c:forEach var="actlist" items="${categoryList}">
		<input type="hidden" name="catid" id="catid" value="${actlist.category_id}" />
		<input type="hidden" name="catname" id="catname" value="${actlist.category_name}" />
	</c:forEach>
	</div> 
	</div>
 <script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
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
function editAssignedCandidate(bgcid) {
	getsesVal().done(function(data){
		if(data!=""){
	var result = confirm("In order to edit this Grouping Profile, you will be redirected to a new tab.");
	if(result==true){
	window.open("updatecandidateprofile?bgcid=" + bgcid );
	}
		}else{
			 window.location.href="loginpage";
		}
	});
}
$("#actiddiv").hide();
$( "#actiddiv" ).load("ajax/test.html", function() {
	var actIdPK =document.getElementsByName("catid");
	  var actIdPK1 =[];	
	  var catname=[];
	  var ul=document.createElement('ul');
	     ul.setAttribute("class", "category");
		$('ul.category').css('list-style-type', 'none');
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
	ul.setAttribute("class", "subcategorylist");
	$('ul.subcategorylist').css('list-style-type', 'none'); 
	//$('li').css('display', 'inline');
	$("#viewchapid"+acid).attr("disabled",true);
	$("#angleright"+acid).hide();	$("#angledown"+acid).show();
	$("#subcolor,#subcolorblack,#colors").show();
	var profileid=$('#profile').val();
	$.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/json", // NOT dataType!
		url : "getCandidateSpecifics?Categoryid=" + acid + "&profileid="+profileid+"",
		success : function(response) {
			if(response.length==0){
				var li = document.createElement("li");
		        li.innerHTML='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:blue">No more Sub-Categories left under this Category</span>'
		        ul.appendChild(li);
			}else{
			 for(var i=0;i<response.length;i++){
				 var chapter_pk=response[i].subcategoryid;
				   var subcatname=response[i].subcategory;
				   var subcattype=response[i].subcategory_type;
				 var li = document.createElement("li");
					li.setAttribute("id", "subcategoryview"+chapter_pk);
					$('li').css('display', 'inline');
					//$('li').css('list-style-type', 'none'); 
					if(subcattype==1){
			        li.innerHTML='<p id="actToggle'+chapter_pk+'" style="display:inline;"><input type="hidden" id="category" name="category" value="'+acid+'">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="subcategory'+acid+'" name="subcategory'+acid+'" value="'+chapter_pk+'" style="width: 20px;height: 16px;"><span style="color:blue;"><b>'+subcatname+'</b></span></p>'
					}else{
						li.innerHTML='<input type="hidden" id="category" name="category" value="'+acid+'">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="subcategory'+acid+'" name="subcategory'+acid+'" value="'+chapter_pk+'" style="width: 20px;height: 16px;"><span style="color:black;">'+subcatname+'</span>'
					}
					
			        ul.appendChild(li);
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

$('#profile').on('change', function() {

	var profile=$('#profile').val();
	var profiletext=$("#profile option:selected").text();
	if(profile==''){
		$("#profileview").text('');
	}else{
	$("#profileview").text('Note: Any Categories and Sub-Categories selected as a part of Select Profile will not be displayed in Candidate Specific list. In order to know all Categories and Sub-Categories assigned to the selected Profile, please check from Grouping Profile');
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
		  	});$("#actiddiv,#profileview").show();
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
					    
				}
				//if(array.length>0){
		    	
				$("#btnSubmit").attr("disabled", true);
				var form = $('#saveCategoryForm')[0];
				var data = new FormData(form);
				//data.append("bgclist",map3);
				$.ajax({
					url : "assignprofile", //this is the submit URL
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
		                     window.location.href="assignprofile";
			   	   	         }
			   	   	      else{
			   	   	          window.location.href="loginpage";
			   	   	   	      }
					}
				});
				/* }else{
			alert("Please select atleast once Sub Category to generate Grouing Profile");
				
				} */
			}
				}else{
					 window.location.href="loginpage";
				}
			});
		});

		
	</script>
</body>
</html>
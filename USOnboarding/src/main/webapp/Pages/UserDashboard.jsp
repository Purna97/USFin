
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.net.URLDecoder"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/css/select2.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="resources/css/css/datepicker3.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>


<body>

	<div id="right-panel" class="right-panel">
		<div class="content">
			<div class="animated fadeIn">
				<div class="row" id="immi">
					<div class="col">
						<div class="card">
							<%-- <center>
								<h5 class="card-header" style="font-size: 20px;">List of
									Pending Items</h5>
							</center> --%>
							<div class="card-body">
								<br>
								<center>
									<div class="payment-pillTab">
										<ul class="nav nav-pills mb-6" id="pills-tab" role="tablist">

											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li class="nav-item"
												style="width: 25%; align-content: center;"><a
												class="nav-link active" id="doctab" data-toggle="pill"
												href="#pills-payTenant" role="tab" style="font-size:120%;" 
												aria-controls="pills-home" aria-selected="true">Documents &nbsp;<span id="docspan" style="font-size:120%;" class="badge badge-light"></span> </a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<li class="nav-item"
												style="width: 25%; align-content: center;"><a
												class="nav-link" id="qtab" data-toggle="pill"
												href="#pills-Owner" role="tab" aria-controls="pills-profile"  style="font-size:120%;"
												aria-selected="false" disabled>Questionnaries &nbsp;<span id="qspan" style="font-size:120%;" class="badge badge-light"></span></a></li>
										</ul>

									</div>
								</center>
								
								
								<br><div id="docdiv"><div class="card">
								<center>
								<h5 class="card-header" style="font-size: 20px;">Pending Documents </h5>
							</center>
								<div class="card-body">
							<table id="candTable"
														class="table table-hover table-bordered"
														style="text-align: center;">
														<thead>
															<tr>
																<th style="text-align: center">Candidate Name</th>
																<th style="text-align: center">Template Name</th>
																<th style="text-align: center">Profile Type</th>
																<th style="text-align: center">Pending SubDocument</th>
																<th style="text-align: center">Action</th>
															</tr>
															</thead>
															<tbody>
															
															
															<c:forEach var="plist" items="${userpendingdocs}">
															
														 <tr>
															<td>${plist.beneficiary_Name}</td>
															<td>${plist.profile_name}</td>
															<td>${plist.profile_type}</td>
															<td>${plist.subdoctypename}</td>
															<td><button type='button' onclick="window.location='mydocuments'" class='btn btn-info btn-sm'><i class="fas fa-external-link-alt" aria-hidden="true"></i></button></td>
															</tr> 
															</c:forEach>
															
															
															</tbody>
															</table>
															
							</div>
	
								
								</div>
							
								</div>
								
								<c:if test="${docandimmiformDto1.candidatedocTypeList.size() gt 0}">
								<div id="qdiv"><div class="card">
								<center>
								<h5 class="card-header" style="font-size: 20px;">Pending Questionnaries</h5>
							</center>
								<div class="card-body">
								<table id="formsTable"
														class="table table-hover table-bordered"
														style="text-align: center;">
														<thead>
														<tr>
																  <th style="text-align: center">Candidate Name</th>  
																<th style="text-align: center">Questionnaire Name</th>
																<th style="text-align: center">Action</th> 
															</tr>
																	</thead>
															
															
															
														<tbody>
														<c:if test="${empty docandimmiformDto1.h1bObj }">
														<tr>
														 <td>${lgfullname}</td>
														<td>H1B Questionnaire</td>
														<td><button type='button' onclick="window.location='mydocuments'" class='btn btn-info btn-sm'><i class="fas fa-external-link-alt" aria-hidden="true"></i></button></td>
															
														</tr>
														</c:if>
														
														<c:if test="${empty docandimmiformDto1.clientObj }">
														<tr>
														 <td>${lgfullname}</td>
														<td>Client and Vendor Letter Questionnaire</td>
														<td><button type='button' onclick="window.location='mydocuments'" class='btn btn-info btn-sm'><i class="fas fa-external-link-alt" aria-hidden="true"></i></button></td>
															
														</tr>
														</c:if>
														
														<c:if test="${empty docandimmiformDto1.pbcObj }">
														<tr>
														 <td>${lgfullname}</td> 
														<td>Public Benefits Checklist</td>
														<td><button type='button' onclick="window.location='mydocuments'" class='btn btn-info btn-sm'><i class="fas fa-external-link-alt" aria-hidden="true"></i></button></td>
															
														</tr>
														</c:if>
															</tbody>
															</table>
								</div>
								</div>
								</div>
								</c:if>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>

	var rowCount  = $('#candTable tr').length;
	var rowCount1 = $('#formsTable tr').length;
	var userrowCount=(rowCount-1)+(rowCount1-1)
	sessionStorage.setItem("userrowCount", userrowCount); 
	if(rowCount>0){
		$("#docspan").text(rowCount-1);
	}else{
		$("#docspan").text(0);
	}
	if(rowCount1>0){
		$("#qspan").text(rowCount1-1);	
	}else{
		$("#qspan").text(0);	
	}
	
	
	$('#qdiv').hide(); 
	
		 $("#doctab").click(function() {
			 $('#docdiv').show();
			 $('#qdiv').hide(); 
			 
		 });
			$("#qtab").click(function(){
			  $('#qdiv').show();
			 $('#docdiv').hide(); 
		 });
	  
	</script>

</body>
</html>
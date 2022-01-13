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

	<div id="right-panel" class="right-panel"  style="margin-top: 0px;">
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

											<li class="nav-item"
												style="width: 25%; align-content: center;"><a
												class="nav-link active" id="admintab" data-toggle="pill"
												href="#pills-payTenant" role="tab" style="font-size:100%;" 
												aria-controls="pills-home" aria-selected="true">Admin &nbsp;<span id="adminspan" style="font-size:120%;" class="badge badge-light"></span> </a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<li class="nav-item"
												style="width: 25%; align-content: center;"><a
												class="nav-link" id="candtab" data-toggle="pill"
												href="#pills-Owner" role="tab" aria-controls="pills-profile"  style="font-size:100%;"
												aria-selected="false" disabled>Candidate &nbsp;<span id="candspan" style="font-size:120%;" class="badge badge-light"></span></a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<li class="nav-item"
												style="width: 25%; align-content: center;"><a
												class="nav-link" id="lcatab" data-toggle="pill"
												href="#pills-Owner" role="tab" aria-controls="pills-profile"  style="font-size:100%;"
												aria-selected="false" disabled>LCA &nbsp;<span id="lcaspan" style="font-size:120%;" class="badge badge-light"></span></a></li>
										
										</ul>

									</div>
								</center>
								
								
								<br><div id="canddiv"><div class="card">
								<center>
								<h5 class="card-header" style="font-size: 20px;">Candidate Pending Documents &nbsp; <span id="candspan" class="badge badge-light"></span></h5>
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
															
															
															<c:forEach var="plist" items="${pendingdocs}">
															
														 <tr>
															<td>${plist.beneficiary_Name}</td>
															<td>${plist.profile_name}</td>
															<td>${plist.profile_type}</td>
															<td>${plist.subdoctypename}</td>
															<td><button type='button' onclick="redirectdest('${plist.beneficiary_Name}','${plist.candidate_id}');" class='btn btn-info btn-sm'><i class="fas fa-external-link-alt" aria-hidden="true"></i></button></td>
															</tr> 
															</c:forEach>
															
															
															</tbody>
															</table>
															
							</div>
	
								
								</div>
							
								</div>
								
								
								<div id="admindiv"><div class="card">
								<center>
								<h5 class="card-header" style="font-size: 20px;">Admin Pending Documents &nbsp; <span id="adminspan1" class="badge badge-light"></span></h5>
							</center>
								<div class="card-body">
								<table id="adminTable"
														class="table table-hover table-bordered"
														style="text-align: center;">
														<thead>
															<tr>
																<th style="text-align: center">Candidate Name</th>
																<th style="text-align: center">Template Name</th>
																<!-- <th style="text-align: center">Profile Type</th> -->
																<th style="text-align: center">Pending SubDocument</th>
																<th style="text-align: center">Action</th>
															</tr>
															</thead>
															<tbody>
															
															<c:forEach var="palist" items="${adminpendingdocs}">
															
														 <tr>
															<td>${palist.beneficiary_Name}</td>
															<td>${palist.profile_name}</td>
															<%-- <td>${palist.profile_type}</td> --%>
															<td>${palist.subdoctypename}</td>
															<td><button type='button' onclick="redirectdest('${palist.beneficiary_Name}','${palist.candidate_id}');" class='btn btn-info btn-sm'><i class="fas fa-external-link-alt" aria-hidden="true"></i></button></td>
															</tr> 
															</c:forEach>
															
															</tbody>
															</table>
															
								
								</div>
								</div>
								</div>
								
								<div id="adminaprdiv"><div class="card">
								<center>
								<h5 class="card-header" style="font-size: 20px;">Candidate Submitted Documents &nbsp; <span id="adminaprspan" class="badge badge-light"></span></h5>
							</center>
								<div class="card-body">
								<table id="adminaprTable"
														class="table table-hover table-bordered"
														style="text-align: center;">
														<thead>
															<tr>
																<th style="text-align: center">Candidate Name</th>
																<th style="text-align: center">Template Name</th>
																<th style="text-align: center">Document Name</th>
																<th style="text-align: center">Action</th>
															</tr>
															</thead>
															
															
															
															<tbody>
															
															<c:forEach var="plist" items="${adminaprpendingdocs}">
															
														 <tr>
															<td>${plist.beneficiary_Name}</td>
															<td>${plist.profile_name}</td>
															<%-- <td>${palist.profile_type}</td> --%>
															<td>${plist.doctypename}</td>
															<td><button type='button' onclick="redirectdest('${plist.beneficiary_Name}','${plist.candidate_id}');" class='btn btn-info btn-sm'><i class="fas fa-external-link-alt" aria-hidden="true"></i></button></td>
															</tr> 
															</c:forEach>
															</tbody>
															</table>
								</div>
								</div>
								</div>
								
									<div id="lcadiv"><div class="card">
									<center>
								<h5 class="card-header" style="font-size: 20px;">LCA Pending Documents &nbsp; <span id="lcaspan" class="badge badge-light"></span></h5>
							</center>
								<div class="card-body">
								<table id="lcaTable"
														class="table table-hover table-bordered"
														style="text-align: center;">
														<thead>
														<th style="text-align: center">Candidate Name</th>
														<th style="text-align: center">LCA Number</th>
														<th style="text-align: center">Document Name</th>
														<th style="text-align: center">Status</th>
														<th style="text-align: center">Action</th>
														
																	</thead>
															
															
															
															<tbody>
															<c:forEach var="plist" items="${pendinglca}">
															
														 <tr>
															<td>${plist.candidatename}</td>
															<c:choose>
															<c:when test="${not empty plist.lca_number}"> 
															<td>${plist.lca_number}/RN ${plist.lca_reference}</td>
															</c:when>
															<c:otherwise>
															<td>NA/RN ${plist.lca_reference}</td>
															</c:otherwise>
															</c:choose>
															
															<c:choose>
															<c:when test="${plist.lcadoc_count eq 1}">
															<td>Approved LCA</td>
															</c:when>
															<c:when test="${plist.lcadoc_count eq 2}">
															<td>Executed LCA</td>
															</c:when>
															<c:otherwise>
															<td>LCA Questionnaire</td>
															</c:otherwise>
															</c:choose>
															<td>Pending</td>														
															<td><button type='button' onclick="redirectdestlca('${plist.lca_reference}','${plist.candidate_id}');" class='btn btn-info btn-sm'><i class="fas fa-external-link-alt" aria-hidden="true"></i></button></td>
															</tr> 
															</c:forEach>
															
															</tbody>
															</table>
								</div>
								</div>
								</div>
								
								<div id="formsdiv"><div class="card">
								<center>
								<h5 class="card-header" style="font-size: 20px;">Candidate Submitted Questionnaries &nbsp; <span id="formsspan" class="badge badge-light"></span></h5>
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
															<c:forEach var="plist" items="${questionaries}">
															
														 <tr>
															<td>${plist.beneficiary_Name}</td>
															<td>${plist.form_type}</td>
															<td><button type='button' onclick="redirectdest('${plist.form_type}','${plist.candidate_id}');" class='btn btn-info btn-sm'><i class="fas fa-external-link-alt" aria-hidden="true"></i></button></td>
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
				</div>
			</div>
		</div>
	</div>
	<script>
	function redirectdest(name,candid){
		//alert(name+"-"+type+"-"+subtype+"-"+subdocid+"-"+candid+"1")
	    sessionStorage.setItem("candId", candid);
		sessionStorage.setItem("candName", name);
		
		window.location.href="immigration";
	}
	
	function redirectdestlca(ref,candid){
		//alert(name+"-"+type+"-"+subtype+"-"+subdocid+"-"+candid+"1")
	    sessionStorage.setItem("Ref", ref);
	    sessionStorage.setItem("candId", candid);
		
		window.location.href="immigration";
	}
	
	
	var rowCount  = $('#candTable tr').length;
	var rowCount1 = $('#adminTable tr').length;
	var rowCount2 = $('#adminaprTable tr').length;
	var rowCount3 = $('#lcaTable tr').length;
	var rowCount4 = $('#formsTable tr').length;

	var allrowCount=(rowCount-1)+(rowCount1-1)+(rowCount2-1)+(rowCount4-1)
	sessionStorage.setItem("allrowCount", allrowCount);
	$("#candspan").text(rowCount-1);
	$("#adminspan").text(rowCount1-1+rowCount2-1+rowCount4-1);
	$("#adminspan1").text(rowCount1-1)
	$("#adminaprspan").text(rowCount2-1);
	$("#lcaspan").text(rowCount3-1);
	$("#formsspan").text(rowCount4-1);
	$('#canddiv,#lcadiv,').hide();
	
		 $("#admintab").click(function() {
			 $('#admindiv,#adminaprdiv,#formsdiv').show();
			 $('#canddiv,#lcadiv').hide(); 
		 });
			$("#candtab").click(function(){
			  $('#canddiv').show();
			 $('#admindiv,#adminaprdiv,#formsdiv,#lcadiv').hide(); 
		 });
	    $("#lcatab").click(function() {
			  $('#lcadiv').show();
			 $('#admindiv,#canddiv,#adminaprdiv,#formsdiv').hide(); 
		 }); 
	</script>

</body>
</html>
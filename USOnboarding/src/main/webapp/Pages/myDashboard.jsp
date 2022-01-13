<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Portal</title>
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

.col-sm-2 {
	flex: 0 0 14.666667%;
    max-width: 23.666667%;
}
</style>
<body class="sidebar-mini fixed">
<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
			<div class="row">
		<div class="col-md-12">
			<div class="card" id="dataTBL">
					<div class="card">
						 <center><h5 class="card-header"style="font-size:20px;">Document Expiry Details(<c:if test="${not empty myDashboard.count}">
																	     ${myDashboard.count}
																	    </c:if>)</h5></center>
				 <div class="card-body">
					<div style="text-align: center;">
					</div>
					<!-- 	<form action="" method="post"> style="max-width:1150px;" -->
					<div>
					<%-- <center><span><strong style="font-size:20px;color:red;"></strong></span></center> --%>
					<table id="customerTable" class="table table-hover table-bordered"
						style="text-align: center;">
						<thead>
							<tr>
							 <th style="text-align: center">Document Related To</th>
								 <th style="text-align: center">Candidate Name</th>
								 <th style="text-align: center">Customer Name</th>
								 <th style="text-align: center">Vendor Name</th>
								 <th style="text-align: center">File Name</th>
							     <th style="text-align: center">File Type</th>
							     <th style="text-align: center">File Input</th>
							     <th style="text-align: center">End Date </th>
								 <th style="text-align: center">Action</th>  
							</tr>
						</thead>
						<tbody>
							<c:forEach var="mdbc" items="${myDashboard.custlist}">
						 	 <tr>   
						 	    <td>Customer Documents</td>
						 	    <td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
							    <td>${mdbc.custName}</td>
							    <td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
							   <td><a href="downloadocs?filetype=${mdbc.fileType}&filename=${mdbc.fileName}&customerName=${mdbc.custName}" style="color:blue">${mdbc.fileName}</a></td>
							    <td>
							    <c:if test="${mdbc.fileType=='Customer_MSA'}">
							    Customer MSA
							    </c:if>
							    </td>
							    <td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
							    <td>${mdbc.expirydate}</td>
							    <td>
							   <button style="letter-spacing:1px;background-color:#15aabf;color:white;"
											onclick="editCustomer(${mdbc.customer_id});">
											<i class="fa fa-edit" aria-hidden="true"></i>
									</button>
							    <%-- <a target="_blank" style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											href="editCustomer?id=${mdbc.customer_id}">
											<i class="fa fa-edit" aria-hidden="true"></i>
									</a> --%></td> 
							</tr>
						  </c:forEach>
						  	<c:forEach var="mdbv" items="${myDashboard.venlist}">
						 	 <tr>   
						 	    <td>Vendor Documents</td>
						 	    <td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
						 	    <td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
							    <td>${mdbv.venName}</td>
							   	<td><a href="downloadocs?filetype=${mdbv.fileType}&filename=${mdbv.fileName}&vendorName=${mdbv.venName}" style="color:blue">${mdbv.fileName}</a>
							    </td>
							    <td>
							    <c:choose>
							    <c:when test="${mdbv.fileType=='Vendor_MSA'}">
							    			Vendor MSA				    
							    </c:when>
							    <c:otherwise>
							    Business Compliance
							    </c:otherwise>
							    </c:choose></td>
							    <td>
							    <c:choose>
							    <c:when  test="${not empty mdbv.fileInput}">
							     <c:choose>
							    <c:when test="${mdbv.fileInput=='Executed_irs_w9_form'}">
							    			Executed IRS W-9 Form			    
							    </c:when>
							     <c:when test="${mdbv.fileInput=='insurance_certificate'}">
							     Insurance Certificate						    
							    </c:when>
							     <c:when test="${mdbv.fileInput=='standing_certificate'}">	
							     Good Standing Certificate					    
							    </c:when>
							    </c:choose>
							    </c:when>
							    <c:otherwise>
							    <span class="label label-success" style="background-color:grey;color:white;">NA</span></c:otherwise>
							    </c:choose>
							    </td>
							    <td>${mdbv.expirydate}</td>
							    <td>
							   <%--  <a target="_blank" style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											href="editVendor?id=${mdbv.vendor_id}"><i class="fa fa-edit" aria-hidden="true"></i>
									</a> --%>
								<button style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											onclick="editVendor(${mdbv.vendor_id});">
											<i class="fa fa-edit" aria-hidden="true"></i>
								</button>
								</td> 
							</tr>
						  </c:forEach>
						
						  <c:forEach var="mdbce" items="${myDashboard.candElist}">
						 	 <tr>   
						 	    <td>Employee Documents</td>
							    <td>${mdbce.candName}</td>
							    <td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
							    <td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
							    <td><a href="downloadocs?filetype=${mdbce.fileType}&filename=${mdbce.fileName}&candidate_id=${mdbce.candidate_id}" style="color:blue">${mdbce.fileName}</a>
							    </td>
							    <td>${mdbce.fileType}</td>
							    <td><c:choose>
							    <c:when test="${not empty mdbce.fileInput}">
							      ${mdbce.fileInput}
							    </c:when>
							    <c:otherwise>
							    <span class="label label-success" style="background-color:grey;color:white;">NA</span>
							    </c:otherwise>
							    </c:choose></td>
							    <td>${mdbce.expirydate}</td>
							    <td>
							    <button style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											onclick="addEmpDocuments('${mdbce.candidate_id}','${mdbce.empType}');">
											<i class="fa fa-edit" aria-hidden="true"></i>
								</button>
							    <%-- <a target="_blank" style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											href="addEmpDocuments?candidate_id=${mdbce.candidate_id}&empType=${mdbce.empType}">
											<i class="fa fa-edit" aria-hidden="true"></i>
								   </a> --%></td>
							</tr>
						  </c:forEach>
						  
						   <c:forEach var="mdbcc" items="${myDashboard.candClist}">
						 	 <tr>   
						 	    <td>Contractor Documents</td>
							    <td>${mdbcc.candName}</td>
							    <td> <c:choose>
							    <c:when test="${not empty mdbcc.custName}">
							       ${mdbcc.custName}
							    </c:when>
							    <c:otherwise>
							    <span class="label label-success" style="background-color:grey;color:white;">NA</span>
							    </c:otherwise>
							    </c:choose></td>
							    <td>
							    <c:choose>
							    <c:when test="${not empty mdbcc.venName}">
							       ${mdbcc.venName}
							    </c:when>
							    <c:otherwise>
							    <span class="label label-success" style="background-color:grey;color:white;">NA</span>
							    </c:otherwise>
							    </c:choose>
							    </td>
							    <td><a href="downloadocs?filetype=${mdbcc.fileType}&filename=${mdbcc.fileName}&candidate_id=${mdbcc.candidate_id}" style="color:blue">${mdbcc.fileName}</a>
							    </td>
							    <td>
							    <c:choose>
							    <c:when test="${mdbcc.fileType=='cust_work_order'}">
							    			Customer WO				    
							    </c:when>
							     <c:when test="${mdbcc.fileType=='ven_work_order'}">
							     Vendor WO						    
							    </c:when>
							     <c:when test="${mdbcc.fileType=='Consultant_Compliance'}">	
							     Consultant Compliance						    
							    </c:when>
							    <c:when test="${mdbcc.fileType=='Work_Authorization_Copy'}">
							    Work Authorization Copy							    
							    </c:when>
							    </c:choose>
							    </td>
							    <td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
							    <td>${mdbcc.expirydate}</td>
 								<c:choose>
							    <c:when test="${mdbcc.fileType=='Work_Authorization_Copy'}">							    
							    <c:choose>
							    <c:when test="${mdbcc.docStatus==0}">
							     <td>
							      <button style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											onclick="viewConsultantDocs('${mdbcc.candidate_id}','${mdbcc.empType}');">
											<i class="fa fa-edit" aria-hidden="true"></i>
								</button>
							     <%-- <a target="_blank" style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											href="viewConsultantDocs?candidate_id=${mdbcc.candidate_id}&empType=${mdbcc.empType}">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</a> --%>
										</td>
							    </c:when>
							    <c:otherwise>
							     <td>
							      <button style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											onclick="addConsultantDocs('${mdbcc.candidate_id}','${mdbcc.empType}');">
											<i class="fa fa-edit" aria-hidden="true"></i>
								</button>
							     <%-- <a target="_blank" style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											href="addConsultantDocs?candidate_id=${mdbcc.candidate_id}&empType=${mdbcc.empType}">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</a> --%>
										</td>
							    </c:otherwise>
							    </c:choose>
							    </c:when>
							    <c:otherwise>
							     <td>
							      <button style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											onclick="viewClientVendor('${mdbcc.candidate_id}','${mdbcc.empType}');">
											<i class="fa fa-edit" aria-hidden="true"></i>
								</button>
							     <%-- <a target="_blank" style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											href="viewClientVendor?candidate_id=${mdbcc.candidate_id}&empType=${mdbcc.empType}">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</a> --%>
								   </td>
							    </c:otherwise>
							    </c:choose>
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
	
		<%-- <div class="row">
		<div class="col-md-12">
			<div class="card" id="dataTBL">
					<div class="card">
						 <center><h5 class="card-header"style="font-size:20px;">Document Expiry Details Overdue</h5></center>
				 <div class="card-body">
					<div style="text-align: center;">
					</div>
					<!-- 	<form action="" method="post"> style="max-width:1150px;" -->
					<div>
					<center><span><strong style="font-size:20px;color:red;"></strong></span></center>
					<table id="vendorTable" class="table table-hover table-bordered"
						style="text-align: center;">
						<thead>
							<tr>
							 <th style="text-align: center">Document Related To</th>
								 <th style="text-align: center">Candidate Name</th>
								 <th style="text-align: center">Customer Name</th>
								 <th style="text-align: center">Vendor Name</th>
								 <th style="text-align: center">File Name</th>
							     <th style="text-align: center">File Type</th>
							     <th style="text-align: center">File Input</th>
							     <th style="text-align: center">End Date </th>
								 <th style="text-align: center">Action</th>  
							</tr>
						</thead>
						<tbody>
							<c:forEach var="mdbc" items="${myDashboard.prevcustlist}">
						 	 <tr>   
						 	    <td>Customer Documents</td>
						 	    <td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
							    <td>${mdbc.custName}</td>
							    <td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
							   <td><a href="downloadocs?filetype=${mdbc.fileType}&filename=${mdbc.fileName}&customerName=${mdbc.custName}" style="color:blue">${mdbc.fileName}</a></td>
							    <td>
							    <c:if test="${mdbc.fileType=='Customer_MSA'}">
							    Customer MSA
							    </c:if>
							    </td>
							    <td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
							    <td>${mdbc.expirydate}</td>
							    <td>
							   <button style="letter-spacing:1px;background-color:#15aabf;color:white;"
											onclick="editCustomer(${mdbc.customer_id});">
											<i class="fa fa-edit" aria-hidden="true"></i>
									</button>
							    <a target="_blank" style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											href="editCustomer?id=${mdbc.customer_id}">
											<i class="fa fa-edit" aria-hidden="true"></i>
									</a></td> 
							</tr>
						  </c:forEach>
						  	<c:forEach var="mdbv" items="${myDashboard.prevvenlist}">
						 	 <tr>   
						 	    <td>Vendor Documents</td>
						 	    <td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
						 	    <td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
							    <td>${mdbv.venName}</td>
							   	<td><a href="downloadocs?filetype=${mdbv.fileType}&filename=${mdbv.fileName}&vendorName=${mdbv.venName}" style="color:blue">${mdbv.fileName}</a>
							    </td>
							    <td>
							    <c:choose>
							    <c:when test="${mdbv.fileType=='Vendor_MSA'}">
							    			Vendor MSA				    
							    </c:when>
							    <c:otherwise>
							    Business Compliance
							    </c:otherwise>
							    </c:choose></td>
							    <td><c:choose>
							    <c:when  test="${not empty mdbv.fileInput}">
							     <c:choose>
							    <c:when test="${mdbv.fileInput=='Executed_irs_w9_form'}">
							    			Executed IRS W-9 Form			    
							    </c:when>
							     <c:when test="${mdbv.fileInput=='insurance_certificate'}">
							     Insurance Certificate						    
							    </c:when>
							     <c:when test="${mdbv.fileInput=='standing_certificate'}">	
							     Good Standing Certificate					    
							    </c:when>
							    </c:choose>
							    </c:when>
							    <c:otherwise>
							    <span class="label label-success" style="background-color:grey;color:white;">NA</span></c:otherwise>
							    </c:choose></td>
							    <td>${mdbv.expirydate}</td>
							    <td>
							    <a target="_blank" style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											href="editVendor?id=${mdbv.vendor_id}"><i class="fa fa-edit" aria-hidden="true"></i>
									</a>
								<button style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											onclick="editVendor(${mdbv.vendor_id});">
											<i class="fa fa-edit" aria-hidden="true"></i>
								</button>
								</td> 
							</tr>
						  </c:forEach>
						
						  <c:forEach var="mdbce" items="${myDashboard.prevcandElist}">
						 	 <tr>   
						 	    <td>Employee Documents</td>
							    <td>${mdbce.candName}</td>
							    <td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
							    <td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
							    <td><a href="downloadocs?filetype=${mdbce.fileType}&filename=${mdbce.fileName}&candidate_id=${mdbce.candidate_id}" style="color:blue">${mdbce.fileName}</a>
							    </td>
							    <td>${mdbce.fileType}</td>
							    <td>
							    <c:choose>
							    <c:when test="${not empty mdbce.fileInput}">
							      ${mdbce.fileInput}
							    </c:when>
							    <c:otherwise>
							    <span class="label label-success" style="background-color:grey;color:white;">NA</span>
							    </c:otherwise>
							    </c:choose>
							    </td>
							    <td>${mdbce.expirydate}</td>
							    <td>
							    <button style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											onclick="addEmpDocuments('${mdbce.candidate_id}','${mdbce.empType}');">
											<i class="fa fa-edit" aria-hidden="true"></i>
								</button>
							    <a target="_blank" style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											href="addEmpDocuments?candidate_id=${mdbce.candidate_id}&empType=${mdbce.empType}">
											<i class="fa fa-edit" aria-hidden="true"></i>
								   </a></td>
							</tr>
						  </c:forEach>
						  
						   <c:forEach var="mdbcc" items="${myDashboard.prevcandClist}">
						 	 <tr>   
						 	    <td>Contractor Documents</td>
							    <td>${mdbcc.candName}
							    </td>
							     <td> <c:choose>
							    <c:when test="${not empty mdbcc.custName}">
							       ${mdbcc.custName}
							    </c:when>
							    <c:otherwise>
							    <span class="label label-success" style="background-color:grey;color:white;">NA</span>
							    </c:otherwise>
							    </c:choose></td>
							    <td>
							    <c:choose>
							    <c:when test="${not empty mdbcc.venName}">
							       ${mdbcc.venName}
							    </c:when>
							    <c:otherwise>
							    <span class="label label-success" style="background-color:grey;color:white;">NA</span>
							    </c:otherwise>
							    </c:choose>
							    </td>
							    <td><a href="downloadocs?filetype=${mdbcc.fileType}&filename=${mdbcc.fileName}&candidate_id=${mdbcc.candidate_id}" style="color:blue">${mdbcc.fileName}</a>
							    </td>
							    <td>
							    <c:choose>
							    <c:when test="${mdbcc.fileType=='cust_work_order'}">
							    			Customer WO				    
							    </c:when>
							     <c:when test="${mdbcc.fileType=='ven_work_order'}">
							     Vendor WO						    
							    </c:when>
							     <c:when test="${mdbcc.fileType=='Consultant_Compliance'}">	
							     Consultant Compliance						    
							    </c:when>
							    <c:when test="${mdbcc.fileType=='Work_Authorization_Copy'}">
							    Work Authorization Copy							    
							    </c:when>
							    </c:choose>
							    </td>
							    <td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
							    <td>${mdbcc.expirydate}</td>
 								<c:choose>
							    <c:when test="${mdbcc.fileType=='Work_Authorization_Copy'}">							    
							    <c:choose>
							    <c:when test="${mdbcc.docStatus==0}">
							     <td>
							      <button style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											onclick="viewConsultantDocs('${mdbcc.candidate_id}','${mdbcc.empType}');">
											<i class="fa fa-edit" aria-hidden="true"></i>
								</button>
							     <a target="_blank" style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											href="viewConsultantDocs?candidate_id=${mdbcc.candidate_id}&empType=${mdbcc.empType}">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</a>
										</td>
							    </c:when>
							    <c:otherwise>
							     <td>
							      <button style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											onclick="addConsultantDocs('${mdbcc.candidate_id}','${mdbcc.empType}');">
											<i class="fa fa-edit" aria-hidden="true"></i>
								</button>
							     <a target="_blank" style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											href="addConsultantDocs?candidate_id=${mdbcc.candidate_id}&empType=${mdbcc.empType}">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</a>
										</td>
							    </c:otherwise>
							    </c:choose>
							    </c:when>
							    <c:otherwise>
							     <td>
							      <button style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											onclick="viewClientVendor('${mdbcc.candidate_id}','${mdbcc.empType}');">
											<i class="fa fa-edit" aria-hidden="true"></i>
								</button>
							     <a target="_blank" style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											href="viewClientVendor?candidate_id=${mdbcc.candidate_id}&empType=${mdbcc.empType}">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</a>
								   </td>
							    </c:otherwise>
							    </c:choose>
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
	 --%>
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
	</div>
</div>
</div>
<script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script type="text/javascript">

/* $('input[type=file]').change(function(e){
	  $in=$(this);
	  $in.next().html($in.val());
	}); */
	
function msaValidateSize(file) {
  	if($(file).val()!=""){
  		 var FileSize = file.files[0].size/1024/1024;
		 var filename = file.files[0].name;
		 var type = $(file).val().split(".").pop().toLowerCase();
	        if (FileSize > 50) {
	            alert('File size exceeds 50 MB');
	            $(file).val('');
	        } else {
	        	if(type=="pdf" || type=="png" || type=="docx" || type=="doc"|| type=="jpg"|| type=="jpeg" || type=="xlsx" || type=="xls" || type=="pptx" || type=="txt" || type=="tiff"){
	        	$.ajax({
	        		type : "GET",
	 		        asyn : false,
	 		        contentType: "application/json",
					url : "checkSelectedFileName?filename="+filename,
					cache : false,
					async : false,
					success : function(response) {
					  if(response=='Uploaded'){
							alert("This file is already "+response + ". Please check");
							$(file).val('');
						}else{
							    /* $('#msafileId').show();
							    $('#msafileName').text(filename); */
							    $('#btnSubmit').attr('disabled',false);
						}
					},
					error : function() {
					}
				});
	        	}else{
	    	    	 $(file).val('');
	    	    	 alert("Please upload file with docx, doc, png, jpg, jpeg, xls, xlsx, pptx, txt, tiff or pdf file format");
	    		    }
	        }
  	}else{
  		/* $('#msafileName').text('');
  		$('#msafileId').hide(); */
  		$('#btnSubmit').attr('disabled',false);
  	}
} 

function mgrValidateMsgFile(file) {
	if($(file).val()!=""){
	var FileSize = file.files[0].size/1024/1024;
	 var filename = file.files[0].name;
	 var type = $(file).val().split(".").pop().toLowerCase();
        if (FileSize > 50) {
            alert('File size exceeds 50 MB');
            $(file).val('');
        } else {
        	if(type=="msg" || type=="eml"){
        	$.ajax({
        		type : "GET",
 		        asyn : false,
 		        contentType: "application/json",
 		        url : "checkSelectedFileName?filename="+filename,
				cache : false,
				async : false,
				success : function(response) {
				  if(response=='Uploaded'){
						alert("This file is already "+response + ". Please check");
						$(file).val('');
					}else{
						 	$('#mgrfileId').show();
						    $('#mgrfileName').text(filename);
					}
				},
				error : function() {
				}
			});
        	}else{
    	    	 $(file).val('');
    	    	 alert("Please upload file with .msg or .eml file format");
    		    }
        }
	}else{
  		$('#mgrfileName').text('');
  		$('#mgrfileId').hide();
  		$('#btnSubmit').attr('disabled',false);
  	} 
}
 
var date = new Date();
date.setDate(date.getDate()); 
$("#fromdate").datepicker({
}).on('changeDate', function(selected) {
	 var minDate = new Date(selected.date.valueOf());
     $('#expirydate').datepicker('setStartDate', minDate);
    $('#saveCustomerForm').formValidation('revalidateField', 'fromdate');
});	
$("#expirydate").datepicker({
}).on('changeDate', function(selected) {
        var minDate = new Date(selected.date.valueOf());
        $('#fromdate').datepicker('setEndDate', minDate);
    $('#saveCustomerForm').formValidation('revalidateField', 'expirydate');
});	
function editCustomer(id){
	window.location.href="editCustomer?id="+id+"";
}
function btnClick(){
	$('#saveCustomerForm').formValidation('validate');
	if( !$('#saveCustomerForm').data('formValidation').isValid())
		 {
		 }
	else{
		  //document.getElementById("saveCustomerForm").submit();
		  $("#btnSubmit").attr("disabled", true);
				var form = $('#saveCustomerForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "saveCustomerMaster", //this is the submit URL
					type : "POST",
					enctype : 'multipart/form-data',
					data : data,
					processData : false,
					contentType : false,
					cache : false,
					success : function(data) {
						 if(data!=null || data!=""){
			   	            	$('#addsummaryfields').html(data);
			   	         	    $('#myModal').modal('show');
			   	   	         }
			   	   	      else{
			   	   	          window.location.href="loginpage";
			   	   	   	      }
					}
				});
		}
	}
$("#closePopupSave").click(function(event) {
	$('#myModal').modal('hide');
	window.location.href="addCustomer";
});
</script>
<script type="text/javascript">
$('#saveCustomerForm')
.on('init.field.bv', function(e, data) {
            var field  = data.field,        // Get the field name
                $field = data.element,      // Get the field element
                bv     = data.bv;           // BootstrapValidator instance

            // Create a span element to show valid message
            // and place it right before the field
            var $span = $('<small/>')
                            .addClass('help-block validMessage')
                            .attr('data-field', field)
                            .insertAfter($field)
                            .hide();

            // Retrieve the valid message via getOptions()
            var message = bv.getOptions(field).validMessage;
            if (message) {
                $span.html(message);
            }
})
.formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {	       
    	cust_name: {
            validators: {
            	notEmpty: {
                    message: 'Customer Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Customer Name must be more than 2 and less than 100 characters long. '
                },
                regexp: {
                	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                     message: 'Customer Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                }
            }
        },  
        fed_id: {
            validators: {
            	 isEmpty: {
                    message: 'Federal ID is mandatory'
                },
                callback:{
                    message: 'Federal ID is not valid',
                    callback: function(value, fed_id, $field){
                        if(value===''){
                            return true;
                         }
                        if(value.length < 10 || value.length > 10){
                            return {
                                valid: false,
                                message: 'Federal ID should be 9 digits.'
                            };
                        }
                        var re= /^([07][1-7]|1[0-6]|2[0-7]|[35][0-9]|[468][0-8]|9[0-589])-\d{7}$/;
                        if(!value.match(re)) {
                            return {
                                valid: false,
                                message: 'Please enter valid Federal ID.'
                            };
                        }
                        return true;
                    }               
                }
            }          
        },
        line1 : {
            validators: {
            	 notEmpty: {
                    message: 'Line1 is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 25,
                    message: 'Line2 should have more than 2 and less than 80 characters '
                },
                regexp: {
                  regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 accepts alpha numerics '
                }
            }
        },
        line2 : {
            validators: {
            	/*  notEmpty: {
                    message: 'Line1 is mandatory'
                }, */
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line2 should have more than 2 and less than 80 characters '
                },
                regexp: {
                  regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 accepts alpha numerics '
                }
            }
        },
        city : {
            validators: {
            	notEmpty: {
                    message: 'City is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'City should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'City accepts characters'
                }
            }
        },
        state : {
            validators: {
            	notEmpty: {
                    message: 'State is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'State should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'State accepts character'
                }
            }
        },
        zipcode : {
            validators: {
            	notEmpty: {
                    message: 'Zipcode is mandatory'
                },
                stringLength: {
                    min: 5,
                    max: 5,
                    message: 'Zipcode must be 5 digits'
                },
                regexp: {
                	regexp: /[0-9]/,
                    message: 'Zipcode accepts digits'
                }
            }
        },    
   cust_mgr_emailid:{
            validators: {
            	notEmpty: {
                    message: 'Customer Manager e-mail ID is mandatory'
            	 },
                 stringLength: {
                 min: 8,
                 max: 80,
                 message: 'Customer Manager e-mail must be more than 8 and less than 80 characters long'
                },
                  regexp: {
             	  regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
             	 message: 'Please enter valid e-mail ID'
             }
           }
      },
   cust_phne_no:{
            validators: {
            	notEmpty: {
                    message: 'Customer Contact Number is mandatory'
            	 },
                 stringLength: {
                 min: 12,
                 max: 12,
                 message: 'Customer Contact Number must be more 10 or Not less than 10 Numbers long'
                }
            }
        },
        Cust_MSA: {
            validators: {
            	notEmpty: {
                    message: 'Customer MSA is mandatory'
                		}/* ,
                	file: {
   					        extension: 'doc,docx,pdf,zip',
                            type: 'application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/zip',
                            maxSize: 50*1024*1024,
         					message: 'The selected file type is not valid or file size greater than 50MB'
                       } */
  			    }
   			},
   		 fromdate: {
	            validators: {
	                regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please enter Start Date in MM/DD/YYYY format'
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'Start Date is not a valid, please enter in MM/DD/YYYY format'
	                }
	            }
	        },
	     expirydate: {
	            validators: {
	                regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please enter End Date in MM/DD/YYYY format'
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'End Date is not a valid, please enter in MM/DD/YYYY format'
	                }
	            }
	        },		
   			mgr_mail_proof_Cmsa: {
            validators: {
            	notEmpty: {
                    message: 'Manager Approved Eamil proof is mandatory'
                		}
  			    }
   			}
        }
})
.on('error.validator.bv', function(e, data) {
            // $(e.target)    --> The field element
            // data.bv        --> The BootstrapValidator instance
            // data.field     --> The field name
            // data.element   --> The field element
            // data.validator --> The current validator name

            data.element
                .data('bv.messages')
                // Hide all the messages
                .find('.help-block[data-bv-for="' + data.field + '"]').hide()
                // Show only message associated with current validator
                .filter('[data-bv-validator="' + data.validator + '"]').show();
 })
 .on('click', '[name="myCheck"]', function(e) {
    var checkBox = document.getElementById("myCheck");
		   if (checkBox.checked == true){
			// alert("**if***"+checkBox.checked);
		   $("#map").show();
		   $("#clab").hide();
		   $("#Cust_MSA").val('');
		   $('#saveCustomerForm').formValidation('enableFieldValidators','Cust_MSA',false);
		   $('#saveCustomerForm').formValidation('enableFieldValidators', 'mgr_mail_proof_Cmsa',true);
		   //document.getElementById('Cust_MSA').disabled=true;
		   $("#Cust_MSA").prop("disabled", true);
       } else if(checkBox.checked == false){
      		// alert("**else**"+checkBox.checked);
           $("#map").hide();
	       $("#clab").show();
	       $("#mgr_approved_mail").val('');
    	   $('#saveCustomerForm').formValidation('enableFieldValidators', 'Cust_MSA',true); 
    	   $('#saveCustomerForm').formValidation('enableFieldValidators','mgr_mail_proof_Cmsa',false);
    	   $("#Cust_MSA").prop("disabled", false);
    	  // document.getElementById('Cust_MSA').disabled=false;
       } 
     });
</script>
<script type="text/javascript">
function editCustomer(id){
	//window.location.href="editCustomer?id="+id+"";
	$('<a href="editCustomer?id='+id+'" target="blank"></a>')[0].click();  
}

function editVendor(id){
	$('<a href="editVendor?id='+id+'" target="blank"></a>')[0].click();  
}

function addEmpDocuments(candid,empType){
	$('<a href="addEmpDocuments?candidate_id='+candid+'&empType='+empType+'" target="blank"></a>')[0].click();  
}

function viewConsultantDocs(candid,empType){
	$('<a href="viewConsultantDocs?candidate_id='+candid+'&empType='+empType+'" target="blank"></a>')[0].click();  
}

function addConsultantDocs(candid,empType){
	$('<a href="addConsultantDocs?candidate_id='+candid+'&empType='+empType+'" target="blank"></a>')[0].click();  
}
function viewClientVendor(candid,empType){
	$('<a href="viewClientVendor?candidate_id='+candid+'&empType='+empType+'" target="blank"></a>')[0].click();  
}
</script> 
</body>
</html>
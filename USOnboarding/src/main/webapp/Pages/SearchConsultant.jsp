<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.net.URLDecoder"%>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" /> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/css/select2.min.css"	rel="stylesheet" />
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<link rel="stylesheet" href="resources/css/css/datepicker3.min.css" />
</head>
<style type="text/css">
#pendingdocs{
width: 105%!important;
}  
.col-lg-2 {
    padding-right: 5px;
}
#iconImgId{
     max-width:30%;
}
.form-control {
font-size: 12px;
height: calc(1.75rem + 2px);
}

table.dataTable thead>tr>th.sorting_asc, table.dataTable thead>tr>th.sorting_desc, table.dataTable thead>tr>th.sorting, table.dataTable thead>tr>td.sorting_asc, table.dataTable thead>tr>td.sorting_desc, table.dataTable thead>tr>td.sorting {
    padding-right: 5px;
    }
</style>
<body class="sidebar-mini fixed">
<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">Search Consultant</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-md-12">
									<input type="hidden" name="emptype" id="emptype" value="${emptype}">
									<input type="hidden" name="role" id="role" value="${role}">
									<input type="hidden" name="dept" id="dept" value="${dept}">
									
									<input type="hidden" id="semp_type1" value="${semp_type}">
									<input type="hidden" id="semp_status" value="${sempstatus}">
					    	        		
											<fieldset>
										<form action="searchlist" method="post" class="form-horizontal">
											
					    	        		
												<div class="form-group row"  style="width:85%;">
												 <div class="col-lg-2">
												<!--  <select id="sEmp_type" autocomplete="off" name="semp_type" class="form-control" style="height: calc(1.8rem + 2px);"
													onchange="loadEmpTypes()" title="Please Select" required> -->
													<select id="sEmp_type" autocomplete="off" name="semp_type" class="form-control"
													onchange="loadEmpTypes()" title="Please Select" required>
														<option value="">Employee Type</option>
														<c:if test="${(dept==9) || ((emptype=='Admin' || emptype=='W2 Admin') && role==4)}">
														<option value="Employees">Employees</option>
														<option value="Contractors">Contractors</option>
														</c:if>
														<c:if test="${emptype=='W2 Admin' && dept==2 && role==2}">
														<option value="Employees">Employees</option>
														</c:if>
														<c:if test="${emptype=='W2 Admin' && dept==5}">
														<option value="Contractors">Contractors</option>
														</c:if>
													</select>
												</div>   
												<div class="col-lg-2">
                                               <select id="usernameId" autocomplete="off" name="susername"
													class="form-control">
													    <option value="">Username</option>
													</select>
												</div>
													    
												<div class="col-lg-2" >
													<select id="fullname" autocomplete="off" name="sfullname"
													class="form-control" >
														<option value="">Fullname</option>
													</select>
												</div>
												<div class="col-lg-2">
													<select id="emp_type" autocomplete="off" name="s_subtype"
													class="form-control" style="height:39px;border: 2px solid #ccc;">
														<option value="">Select Sub Type</option>
													</select>
												</div>
											    <div class="col-lg-2">
													<select id="pendingdocs" autocomplete="off" name="spendingdocs"
													class="form-control" style="height:39px;border: 2px solid #ccc;">
													<option value="">Pending Pages</option>
														<option value="Documents">Pending Documents</option>
														<option value="ClientVendor">Pending Client & Vendor</option>
														<option value="Deposit">Pending Deposit Details</option>
														 <!-- <option value="Exit">Pending Exit Employees</option> 
														<option value="Active">Active Employees</option>
														<option value="InActive">InActive Employees</option> -->
													</select>
												</div> 
												  <div class="col-lg-2">
													<select id="empstatus" autocomplete="off" name="empstatus"
													class="form-control">
														<option value="Active" selected>Active</option>
														<option value="InActive" >InActive</option>
														<option value="All" >All Status</option>
														
													</select>
												</div> 
												
                                            <!--  style="height:39px;border: 2px solid #ccc;"
                                            <div class="col-sm-2"> 
											</div> -->
										</div><br>
										<center><button type="submit" class="btn btn-info btn-sm" >Search</button></center>
									</form>		
								</fieldset>
								</div>
							</div>
							</div>
						</div>
						</div>
						</div>
						<c:if test="${fn:length(searchemployee)> 0}">

						<div class="row">
							<div class="col-md-12">
								<div class="card">
								<h5 class="card-header">Consultants Details</h5>
									<div class="card-body">
										<div
											style="max-width:auto;white-space: nowrap;">
											<table id="employeeTableId"	class="table table-hover table-bordered"
												style="text-align: center;">
											<thead><!-- overflow-x: auto; -->
							<tr>
							    <th style="text-align: center">FullName</th>
							     <th style="text-align: center">UserName</th>
							     <c:if test="${sEmp_type=='Employees'}">
							      <th style="text-align: center">EmpNo</th>
								</c:if>
								<th style="text-align: center">Candidate Type</th>
								<th style="text-align: center">Work Permit</th>
								<th style="text-align: center">SSN</th>
						    	<th style="text-align: center">Status</th> 
								<th style="text-align: center">BasicInfo</th>
								<th style="text-align: center">Documents</th>
								 <th style="text-align: center">Client&Vendor</th> 
								<th style="text-align: center">BankDetails</th>
								<th style="text-align: center">ExitDetails</th>
								<th style="text-align: center">Rejoin</th>
								<th style="text-align: center">EmpHistory</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="searchlist" items="${searchemployee}">
						 	<tr>
								<input type="hidden" name="userid" id="userid" value="${searchlist.candidate_id}"/>
								<td>${searchlist.fullname}</td>
								<td>${searchlist.username}</td>
								 <c:if test="${sEmp_type=='Employees'}">
								 <td>${searchlist.emp_number}</td>
								</c:if>
								<td>${searchlist.emp_type}</td>
								<td>${searchlist.work_auth}</td>
								<td>XXX-XX-${fn:substring(searchlist.ssn_no,7,11)}</td>
							   <c:choose>
								<%-- <c:when test="${searchlist.exit_status==0}"> --%>
								<c:when test="${searchlist.status=='1'}">
								
								<td><font class="label label-success" style="color:white;">
								<img src="resources/ICONS/statusActive.png" id="iconImgId" style="max-width: 43%;" title="Active"></font></td>
								</c:when>
								<c:otherwise>
								<td><font class="label label-success" style="color:white;">
								<img src="resources/ICONS/statusInActive.png" id="iconImgId" style="max-width: 43%;" title="InActive"></font></td>
								</c:otherwise>
								</c:choose> 
								
								<%-- <c:if test="${(emptype=='Admin' || emptype=='W2 Admin') && role==4}"> --%>
								<c:if test="${(dept==9) || ((emptype=='Admin' || emptype=='W2 Admin') && role==4)}">
								<c:choose>
								<c:when test="${searchlist.basicinfo_status==1 && (searchlist.emp_type=='W2 Admin' || searchlist.emp_type=='W2')}">
								<td><a href="#"  onclick="ViewEmployeeInfo('${searchlist.candidate_id}')" 
								 class="label label-success" style="color:white;" title="View Employee Info">
								  <img src="resources/ICONS/userInfo.png" id="iconImgId"></a></td>
								</c:when>
				        	    <c:when test="${searchlist.basicinfo_status==1 && (searchlist.emp_type=='C2C' || searchlist.emp_type=='1099')}">
								<td><a href="#" onclick="viewConsultantInfo('${searchlist.candidate_id}','${searchlist.emp_type}')"
								 class="label label-success" style="color:white;" title="View Consultant Info">
								<img src="resources/ICONS/userInfo.png" id="iconImgId"></a></td>
								</c:when>
								</c:choose>
								
								<c:choose>
								<c:when test="${searchlist.document_status==1 && (searchlist.emp_type=='W2 Admin' || searchlist.emp_type=='W2')}">    
								<td><a href="#"	onclick="addEmpDocuments('${searchlist.candidate_id}','${searchlist.emp_type}')"  
								class="label label-success" style="color:white;" title="View Documents">
								<img src="resources/ICONS/DocumentView.png" style="max-width: 28%;"></a></td>
								</c:when>
								<c:when test="${searchlist.document_status==1 && (searchlist.emp_type=='C2C' || searchlist.emp_type=='1099')}">    
								<td><a href="#" onclick="viewConsultantDoc('${searchlist.candidate_id}','${searchlist.emp_type}')" 
								class="label label-success" style="color:white;" title="View Documents">
								<img src="resources/ICONS/DocumentView.png" style="max-width: 28%;"></a></td>
								</c:when>
								<c:when test="${searchlist.document_status==0 && (searchlist.emp_type=='W2 Admin' || searchlist.emp_type=='W2')}">                                   
								<td><a href="#"	onclick="addEmpDocuments('${searchlist.candidate_id}','${searchlist.emp_type}')" 
								class="label label-success" style="color:white;" title="Add Documents">
								<img src="resources/ICONS/DocumentAdd.png" style="max-width: 28%;"></a></td> 
								</c:when>
								<c:when test="${searchlist.document_status==0 && (searchlist.emp_type=='C2C' || searchlist.emp_type=='1099')}">                                   
								<td><a href="#" onclick="addConsultantDoc('${searchlist.candidate_id}','${searchlist.emp_type}')" 
								class="label label-success" style="color:white;" title="Add Documents">
								<img src="resources/ICONS/DocumentAdd.png" style="max-width: 28%;"></a></td>
								</c:when>
								</c:choose>
								
								<c:choose>
								<c:when test="${searchlist.client_status==1 && searchlist.emp_type=='W2 Admin'}">  
								<td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
								</c:when> 
								<c:when test="${searchlist.client_status==1 && (searchlist.emp_type=='W2' || searchlist.emp_type=='C2C' || searchlist.emp_type=='1099')}">  
								<td><a href="#"  onclick="viewClientVendor('${searchlist.candidate_id}','${searchlist.emp_type}')"  
								class="label label-success" style="color:white;" title="View Client&Vendor Details">
								<img src="resources/ICONS/client&vendorView.png" style="max-width: 28%;"></a></td>
								</c:when> 
								<c:when test="${searchlist.client_status==0 && searchlist.emp_type=='W2 Admin'}"> 
								<td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
								</c:when> 
								<c:when test="${searchlist.client_status==0 && (searchlist.emp_type=='W2' || searchlist.emp_type=='C2C' || searchlist.emp_type=='1099')}">
								<td><a href="#"  onclick="addClientVendor('${searchlist.candidate_id}','${searchlist.emp_type}')"  
								class="label label-success" style="color:white;" title="Add Client&Vendor Details">
								<img src="resources/ICONS/client&vendorAdd.png" style="max-width: 28%;"></a></td>
								</c:when>
								</c:choose> 
								
								<c:choose>
								<c:when test="${searchlist.bank_status==1 && (searchlist.emp_type=='W2 Admin' || searchlist.emp_type=='W2' || searchlist.emp_type=='1099')}">    
								<td><a href="#" onclick="viewEmpBankDetails('${searchlist.candidate_id}')" 
								 class="label label-success" style="color:white;" title="View Bank Details">
								 <img src="resources/ICONS/BankView.png" id="iconImgId"></a></td>
								</c:when>
								<c:when test="${searchlist.bank_status==1 && searchlist.emp_type=='C2C'}">     
								<td><a href="#" onclick="viewConsultantBankDetails('${searchlist.candidate_id}','${searchlist.emp_type}')" 
								class="label label-success" style="color:white;" title="View Bank Details">
								<img src="resources/ICONS/BankView.png" id="iconImgId"></a></td>
								</c:when>
								<c:when test="${searchlist.bank_status==0 && (searchlist.emp_type=='W2 Admin' || searchlist.emp_type=='W2' || searchlist.emp_type=='1099')}">                                      
								<td><a href="#" onclick="addEmpBankDetails('${searchlist.candidate_id}')" 
								class="label label-success" style="color:white;" title="Add Bank Details">
								<img src="resources/ICONS/BankAdd.png" id="iconImgId"></a></td>
								</c:when>
								<c:when test="${searchlist.bank_status==0 && searchlist.emp_type=='C2C'}">
								<td><a href="#" onclick="addConsultantBankDetails('${searchlist.candidate_id}','${searchlist.emp_type}')" 
								class="label label-success" style="color:white;" title="Add Bank Details">
								<img src="resources/ICONS/BankAdd.png" id="iconImgId"></a></td>
								</c:when>
								</c:choose>
								 
								<c:choose>
								<c:when test="${searchlist.exit_status==1 && (searchlist.emp_type=='W2 Admin' || searchlist.emp_type=='W2' || searchlist.emp_type=='C2C' || searchlist.emp_type=='1099')}">                   
								<td><a href="#" onclick="ViewExitDetails(${searchlist.candidate_id})" 
								 class="label label-success" style="color:white;" title="View Exit Details">
								 <img src="resources/ICONS/exitView.png" id="iconImgId"></a></td>
								</c:when>
								<c:when test="${searchlist.exit_status==0 && (searchlist.emp_type=='W2 Admin' || searchlist.emp_type=='W2' || searchlist.emp_type=='C2C' || searchlist.emp_type=='1099')}">                                                    
								<td><a href="#"	onclick="addExitDetails('${searchlist.candidate_id}')" 
								class="label label-success" style="color:white;" title="Add Exit Details">
								<img src="resources/ICONS/exitAdd.png" id="iconImgId"></a></td>
								</c:when>
								</c:choose> 
								<c:choose>
								<c:when test="${searchlist.status=='1'}">
								
								<td><a href="#" class="label label-success" style="color:white;"  title="Can't Rejoin,employee is active" >
								 <img src="resources/ICONS/RejoinYes.png" id="iconImgId" style="max-width: 43%;"></a>
								</td> 
								
								</c:when>
								<c:otherwise>
								<td><a href="#" class="label label-success" style="color:white;"  title="Can Rejoin, employee is Inactive"
								 data-toggle="modal" data-target="#modalRejoining" onclick="Rejoin('${searchlist.candidate_id}');">
								  <img src="resources/ICONS/RejoinNo.png" id="iconImgId" style="max-width: 43%;"></a>
								</td>
								</c:otherwise>
								</c:choose>
								
								<td><a href="#" onclick="viewHistory('${searchlist.candidate_id}')"
								class="label label-success" style="color:white;" title="View Employee History">
								<img src="resources/ICONS/empHistory.png" style="max-width: 28%;"></a></td>
								</c:if>
							   
							    <c:if test="${emptype=='W2 Admin' && dept==2 && role==2}">
								<c:choose>
								<c:when test="${searchlist.basicinfo_status==1 && (searchlist.emp_type=='W2 Admin' || searchlist.emp_type=='W2')}">
								<td><a href="#"  onclick="ViewEmployeeInfo('${searchlist.candidate_id}')" 
								 class="label label-success" style="color:white;" title="View Employee Info">
								  <img src="resources/ICONS/userInfo.png" id="iconImgId"></a></td>
								</c:when>
								</c:choose>
								<c:choose>
								<c:when test="${searchlist.document_status==1 && (searchlist.emp_type=='W2 Admin' || searchlist.emp_type=='W2')}">    
								<td><a href="#"	onclick="addEmpDocuments('${searchlist.candidate_id}','${searchlist.emp_type}')"  
								class="label label-success" style="color:white;" title="View Documents">
								<img src="resources/ICONS/DocumentView.png" style="max-width: 28%;"></a></td>
								</c:when>
								<c:when test="${searchlist.document_status==0 && (searchlist.emp_type=='W2 Admin' || searchlist.emp_type=='W2')}">                                   
								<td><a href="#"	onclick="addEmpDocuments('${searchlist.candidate_id}','${searchlist.emp_type}')" 
								class="label label-success" style="color:white;" title="Add Documents">
								<img src="resources/ICONS/DocumentAdd.png" style="max-width: 28%;"></a></td> 
							</c:when>
							
								</c:choose>
								
								<c:choose>
								<c:when test="${searchlist.client_status==1 && searchlist.emp_type=='W2 Admin'}">  
								<td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
								</c:when> 
								<c:when test="${searchlist.client_status==1 && (searchlist.emp_type=='W2')}">  
								<td><a href="#"  onclick="viewClientVendor('${searchlist.candidate_id}','${searchlist.emp_type}')"  
								class="label label-success" style="color:white;" title="View Client&Vendor Details">
								<img src="resources/ICONS/client&vendorView.png" style="max-width: 28%;"></a></td>
								</c:when> 
								<c:when test="${searchlist.client_status==0 && searchlist.emp_type=='W2 Admin'}"> 
								<td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
								</c:when> 
								<c:when test="${searchlist.client_status==0 && searchlist.emp_type=='W2'}">
								<td><span class="label label-success" style="background-color:grey;color:white;">NA</span></td>
								</c:when>
								</c:choose> 
								
								<c:choose>
								<c:when test="${searchlist.bank_status==1 && (searchlist.emp_type=='W2 Admin' || searchlist.emp_type=='W2')}">    
								<td><a href="#" onclick="viewEmpBankDetails('${searchlist.candidate_id}')" 
								 class="label label-success" style="color:white;" title="View Bank Details">
								 <img src="resources/ICONS/BankView.png" id="iconImgId"></a></td>
								</c:when>								
								<c:when test="${searchlist.bank_status==0 && (searchlist.emp_type=='W2 Admin' || searchlist.emp_type=='W2')}">                                      
								<td><a href="#" onclick="addEmpBankDetails('${searchlist.candidate_id}')" 
								class="label label-success" style="color:white;" title="Add Bank Details">
								<img src="resources/ICONS/BankAdd.png" id="iconImgId"></a></td>
								</c:when>
								</c:choose>
								 
								<c:choose>
								<c:when test="${searchlist.exit_status==1 && (searchlist.emp_type=='W2 Admin' || searchlist.emp_type=='W2')}">                   
								<td><a href="#" onclick="ViewExitDetails(${searchlist.candidate_id})" 
								 class="label label-success" style="color:white;" title="View Exit Details">
								 <img src="resources/ICONS/exitView.png" id="iconImgId"></a></td>
								</c:when>
								<c:when test="${searchlist.exit_status==0 && (searchlist.emp_type=='W2 Admin' || searchlist.emp_type=='W2')}">                                                    
								<td><a href="#"	onclick="addExitDetails('${searchlist.candidate_id}')" 
								class="label label-success" style="color:white;" title="Add Exit Details">
								<img src="resources/ICONS/exitAdd.png" id="iconImgId"></a></td>
								</c:when>
								</c:choose> 
								<c:choose>
								<c:when test="${searchlist.status=='1'}">
								
								<td><a href="#" class="label label-success" style="color:white;"  title="Can't Rejoin,employee is active" >
								 <img src="resources/ICONS/RejoinYes.png" id="iconImgId" style="max-width: 43%;"></a>
								</td> 
								
								</c:when>
								<c:otherwise>
								<td><a href="#" class="label label-success" style="color:white;"  title="Can Rejoin, employee is Inactive"
								 data-toggle="modal" data-target="#modalRejoining" onclick="Rejoin('${searchlist.candidate_id}');">
								  <img src="resources/ICONS/RejoinNo.png" id="iconImgId" style="max-width: 43%;"></a>
								</td>
								</c:otherwise>
								</c:choose>
								
								<td><a href="#" onclick="viewHistory('${searchlist.candidate_id}')"
								class="label label-success" style="color:white;" title="View Employee History">
								<img src="resources/ICONS/empHistory.png" style="max-width: 28%;"></a></td>
							
							</c:if>
							
							<c:if test="${emptype=='W2 Admin' && dept==5}">
							  	<c:choose>								
				        	    <c:when test="${searchlist.basicinfo_status==1 && (searchlist.emp_type=='C2C' || searchlist.emp_type=='1099')}">
								<td><a href="#" onclick="viewConsultantInfo('${searchlist.candidate_id}','${searchlist.emp_type}')"
								 class="label label-success" style="color:white;" title="View Consultant Info">
								<img src="resources/ICONS/userInfo.png" id="iconImgId"></a></td>
								</c:when>
								</c:choose>
								
								<c:choose>								
								<c:when test="${searchlist.document_status==1 && (searchlist.emp_type=='C2C' || searchlist.emp_type=='1099')}">    
								<td><a href="#" onclick="viewConsultantDoc('${searchlist.candidate_id}','${searchlist.emp_type}')" 
								class="label label-success" style="color:white;" title="View Documents">
								<img src="resources/ICONS/DocumentView.png" style="max-width: 28%;"></a></td>
								</c:when>
								
								<c:when test="${searchlist.document_status==0 && (searchlist.emp_type=='C2C' || searchlist.emp_type=='1099')}">                                   
								<td><a href="#" onclick="addConsultantDoc('${searchlist.candidate_id}','${searchlist.emp_type}')" 
								class="label label-success" style="color:white;" title="Add Documents">
								<img src="resources/ICONS/DocumentAdd.png" style="max-width: 28%;"></a></td>
								</c:when>
								</c:choose>
								
								<c:choose>								
								<c:when test="${searchlist.client_status==1 && (searchlist.emp_type=='W2' || searchlist.emp_type=='C2C' || searchlist.emp_type=='1099')}">  
								<td><a href="#"  onclick="viewClientVendor('${searchlist.candidate_id}','${searchlist.emp_type}')"  
								class="label label-success" style="color:white;" title="View Client&Vendor Details">
								<img src="resources/ICONS/client&vendorView.png" style="max-width: 28%;"></a></td>
								</c:when>								
								<c:when test="${searchlist.client_status==0 && (searchlist.emp_type=='W2' || searchlist.emp_type=='C2C' || searchlist.emp_type=='1099')}">
								<td><a href="#"  onclick="addClientVendor('${searchlist.candidate_id}','${searchlist.emp_type}')"  
								class="label label-success" style="color:white;" title="Add Client&Vendor Details">
								<img src="resources/ICONS/client&vendorAdd.png" style="max-width: 28%;"></a></td>
								</c:when>
								</c:choose> 
								
								<c:choose>
								<c:when test="${searchlist.bank_status==1 && searchlist.emp_type=='1099'}">    
								<td><a href="#" onclick="viewEmpBankDetails('${searchlist.candidate_id}')" 
								 class="label label-success" style="color:white;" title="View Bank Details">
								 <img src="resources/ICONS/BankView.png" id="iconImgId"></a></td>
								</c:when>
								<c:when test="${searchlist.bank_status==1 && searchlist.emp_type=='C2C'}">     
								<td><a href="#" onclick="viewConsultantBankDetails('${searchlist.candidate_id}','${searchlist.emp_type}')" 
								class="label label-success" style="color:white;" title="View Bank Details">
								<img src="resources/ICONS/BankView.png" id="iconImgId"></a></td>
								</c:when>
								<c:when test="${searchlist.bank_status==0 && searchlist.emp_type=='1099'}">                                      
								<td><a href="#" onclick="addEmpBankDetails('${searchlist.candidate_id}')" 
								class="label label-success" style="color:white;" title="Add Bank Details">
								<img src="resources/ICONS/BankAdd.png" id="iconImgId"></a></td>
								</c:when>
								<c:when test="${searchlist.bank_status==0 && searchlist.emp_type=='C2C'}">
								<td><a href="#" onclick="addConsultantBankDetails('${searchlist.candidate_id}','${searchlist.emp_type}')" 
								class="label label-success" style="color:white;" title="Add Bank Details">
								<img src="resources/ICONS/BankAdd.png" id="iconImgId"></a></td>
								</c:when>
								</c:choose>
								 
								<c:choose>
								<c:when test="${searchlist.exit_status==1 && (searchlist.emp_type=='C2C' || searchlist.emp_type=='1099')}">                   
								<td><a href="#" onclick="ViewExitDetails(${searchlist.candidate_id})" 
								 class="label label-success" style="color:white;" title="View Exit Details">
								 <img src="resources/ICONS/exitView.png" id="iconImgId"></a></td>
								</c:when>
								<c:when test="${searchlist.exit_status==0 && (searchlist.emp_type=='C2C' || searchlist.emp_type=='1099')}">                                                    
								<td><a href="#"	onclick="addExitDetails('${searchlist.candidate_id}')" 
								class="label label-success" style="color:white;" title="Add Exit Details">
								<img src="resources/ICONS/exitAdd.png" id="iconImgId"></a></td>
								</c:when>
								</c:choose> 
								<c:choose>
								<c:when test="${searchlist.status=='1'}">
								
								<td><a href="#" class="label label-success" style="color:white;"  title="Can't Rejoin,employee is active" >
								 <img src="resources/ICONS/RejoinYes.png" id="iconImgId" style="max-width: 43%;"></a>
								</td> 
								
								</c:when>
								<c:otherwise>
								<td><a href="#" class="label label-success" style="color:white;"  title="Can Rejoin, employee is Inactive"
								 data-toggle="modal" data-target="#modalRejoining" onclick="Rejoin('${searchlist.candidate_id}');">
								  <img src="resources/ICONS/RejoinNo.png" id="iconImgId" style="max-width: 43%;"></a>
								</td>
								</c:otherwise>
								</c:choose>
								<td><a href="#" onclick="viewHistory('${searchlist.candidate_id}')"
								class="label label-success" style="color:white;" title="View Employee History">
								<img src="resources/ICONS/empHistory.png" style="max-width: 28%;"></a></td>
							</c:if>
								</tr>
								</c:forEach> 
						</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					</div>
					<div class="modal fade" id="modalRejoining" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true" style="height: 500px; width: 400px; align-items: center; top: 15%; left: 40%;">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header" style="padding:.3rem;">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span> 
										</button>
										<center>
											<h5 class="modal-title" id="exampleModalLabel"
												style="font-size: 15px">
												<b>Rejoin Details</b>
											</h5>
										</center>
									</div>
									<form action="/" method="post" id="rejoinformid">
										<input type="hidden" id="candidateId" name="candidate_id">
										<div class="modal-body">
											<div class="form-group">
												<label for="recipient-name" class="col-form-label">Date
													Of ReJoining:</label> <input type="text" id="rejoining_Date"
													class="form-control text-left" autocomplete="off"
													title="Enter date in MM/DD/YYYY format only"
													name="rejoining_Date" placeholder="Date Of Joining"
													class="form-control" required>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary btn-sm"
												data-dismiss="modal" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;">Close</button>
											<button type="button" class="btn btn-primary btn-sm" id="submitid" onclick="submitRejoin()" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;">Save
												changes</button>
										</div>
									</form>
								</div>
							</div>
						</div>
				</div>
	      </div>
		</div>
	</div>
		<form action="searchlist" method="post" id="bformid" style="display:none">
				<input type="hidden"  name="semp_type"    id="semp_type" value="${semp_type}">
				<input type="hidden"  name="susername"  value="${susername}">
  	        	<input type="hidden"  name="sfullname"  value="${sfullname}">
			    <input type="hidden"  name="spendingdocs"  value="${spendingdocs}">
			    <input type="hidden"  name="s_subtype"  value="${s_subtype}">
				</form> 
<script src="resources/js/js/jquery-2.1.4.min.js"></script> 
 <script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
 <script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="resources/js/js/select2.min.js"></script>
<script src="resources/preDefined/goback.js"></script>
	 <script>
  $('#usernameId,#fullname').select2();
  $('#emp_type,#pendingdocs').select2({
	    minimumResultsForSearch: -1
	});
  var sEmptype=$("#semp_type1").val();
  
 // $('#sEmp_type').val([sEmptype]).trigger('change');
  
  
  
  $(document).ready(function(){
	  $("#rejoining_Date").datepicker({
			changeMonth:true,
			changeYear:true,
			 minDate:0
		})
})
  </script>
  
<script type="text/javascript">
function ViewEmployeeInfo(candidate_id){
	getsesVal().done(function(data){
		if(data!=""){
	window.location.href="ViewEmployeeInfo?candidate_id="+candidate_id+"";
		}else{
			 window.location.href="loginpage";
		}
	});
}
function addExitDetails(candidate_id){
	getsesVal().done(function(data){
		if(data!=""){
	window.location.href="exitDetails?candidate_id="+candidate_id+"";
		}else{
			 window.location.href="loginpage";
		}
	});
}
function ViewExitDetails(candidate_id){
	getsesVal().done(function(data){
		if(data!=""){
	window.location.href="ViewExitDetails?candidate_id="+candidate_id+"";
		}else{
			 window.location.href="loginpage";
		}
	});
}
function addEmpBankDetails(candidate_id){
	getsesVal().done(function(data){
		if(data!=""){
	window.location.href="addEmpBankDetails?candidate_id="+candidate_id+"";
		}else{
			 window.location.href="loginpage";
		}
	});
}
function viewEmpBankDetails(candidate_id){
	getsesVal().done(function(data){
		if(data!=""){
	window.location.href="viewEmpBankDetails?candidate_id="+candidate_id+"";
		}else{
			 window.location.href="loginpage";
		}
	});
}
function viewEmpDocuments(candidate_id){
	getsesVal().done(function(data){
		if(data!=""){
	window.location.href="viewEmpDocuments?candidate_id="+candidate_id+"";
		}else{
			 window.location.href="loginpage";
		}
	});
}
function addEmpDocuments(candidate_id,empType){
	getsesVal().done(function(data){
		if(data!=""){
	window.location.href="addEmpDocuments?candidate_id="+candidate_id+"&empType="+empType+"";
		}else{
			 window.location.href="loginpage";
		}
	});
}
function addClientVendor(candidate_id,empType){
	getsesVal().done(function(data){
		if(data!=""){
	window.location.href="addClientVendor?candidate_id="+candidate_id+"&empType="+empType+"";
		}else{
			 window.location.href="loginpage";
		}
	});
}
function viewClientVendor(candidate_id,empType){
	getsesVal().done(function(data){
		if(data!=""){
	window.location.href="viewClientVendor?candidate_id="+candidate_id+"&empType="+empType+"";
		}else{
			 window.location.href="loginpage";
		}
	});
}
function viewConsultantInfo(candidate_id,empType){
	getsesVal().done(function(data){
		if(data!=""){
	window.location.href="viewConsultantInfo?candidate_id="+candidate_id+"&empType="+empType+"";
		}else{window.location.href="loginpage";}});
}
function addConsultantDoc(candidate_id,empType){
	getsesVal().done(function(data){
		if(data!=""){
	window.location.href="addConsultantDocs?candidate_id="+candidate_id+"&empType="+empType+"";
		}else{
			 window.location.href="loginpage";
		}
	});
}
function viewConsultantDoc(candidate_id,empType){
	getsesVal().done(function(data){
		if(data!=""){
	window.location.href="viewConsultantDocs?candidate_id="+candidate_id+"&empType="+empType+"";
		}else{
			 window.location.href="loginpage";
		}
	});
}
function viewHistory(candidate_id){
	getsesVal().done(function(data){
		if(data!=""){
	window.location.href="getHistoryByCandidateId?candidate_id="+candidate_id+"";
		}else{
			 window.location.href="loginpage";
		}
	});
}
function addConsultantBankDetails(candidate_id,empType){
	getsesVal().done(function(data){
		if(data!=""){
	window.location.href="addConsultantBankDetails?candidate_id="+candidate_id+"&empType="+empType+"";
		}else{
			 window.location.href="loginpage";
		}
	});
}
function viewConsultantBankDetails(candidate_id,empType){
	getsesVal().done(function(data){
		if(data!=""){
	window.location.href="viewConsultantBankDetails?candidate_id="+candidate_id+"&empType="+empType+"";
		}else{
			 window.location.href="loginpage";
		}
	});
}

var sEmptype=$('#semp_type').val();
if(sEmptype!=''){	
 var $dropdown1 = $("select[name='semp_type']");
 $dropdown1.find('option[value="' + sEmptype + '"]').attr('selected', true);
fnsearchList(sEmptype);
}
var semp_status=$('#semp_status').val();
if(semp_status!=''){
	var $dropdown2 = $("select[name='empstatus']");
	 $dropdown2.find('option[value="' + semp_status + '"]').attr('selected', true);
}

function loadEmpTypes(){
	var sEmp_type=$('#sEmp_type').val();
 	 if(sEmp_type!=""){
 		fnsearchList(sEmp_type)
 		  }else{
 			    $('#usernameId').empty();
	        	$('#fullname').empty();
	        	$('#emp_type').empty(); 
 	 		  }
  }	
  
function fnsearchList(emptype){
	/* getsesVal().done(function(data){
		if(data!=""){ */
	$.ajax({
	    	type : "GET",
	        asyn : false,
	        url  : "getEmpInfoByEmpType?sEmp_type="+emptype,
	        success  : function(response){
	        	$('#usernameId').empty();
	        	$('#fullname').empty();
	        	$('#emp_type').empty(); 
	        	$('#usernameId').val('');
	        	$('#fullname').val('');
	        	$('#emp_type').val('');

	        	$('#usernameId').append($('<option/>').attr("value", '').text("Username"));
	        	$('#fullname').append($('<option/>').attr("value", '').text("Fullname"));
	        	$('#emp_type').append($('<option/>').attr("value", '').text("Subtype"));
		     for(var i=0;i<response.length;i++)
	     	   {
     	   // var fullName=response[i].fullName+" "+response[i].family_name;
	        	$('#usernameId').append($('<option/>').attr("value",response[i].userName).text(response[i].userName));
	        	$('#fullname').append($('<option/>').attr("value", response[i].fullName).text(response[i].fullName));
	           } 
	       	 if(emptype=='Employees'){
	       	    $('#emp_type').append($('<option/>').attr("value", 'W2 Admin').text("W2 Admin"));
	       		$('#emp_type').append($('<option/>').attr("value", 'W2').text("W2"));
	       	    }
	       	 else{
		       	$('#emp_type').append($('<option/>').attr("value", 'C2C').text("C2C"));
		       	$('#emp_type').append($('<option/>').attr("value", '1099').text("1099"));
	       	    }
	        }
		    });
		/* }else{
			 window.location.href="loginpage";
		}
	}); */
}
 
</script>
 <script>
    function Rejoin(candidate_id){
    	getsesVal().done(function(data){
    		if(data!=""){
    	document.getElementById("rejoinformid").reset();
   	    $('#candidateId').val(candidate_id); 
   	    $('#modalRejoining').show();
    		}else{
    			 window.location.href="loginpage";
    		}
    	});
   	} 
    function submitRejoin(){
    	getsesVal().done(function(data){
    		if(data!=""){
    	var rejoining_Date=$('#rejoining_Date').val();
    	if(rejoining_Date==""){
    		alert("Rejoining date is required");
    		//$("#rejoining_Date").attr("required",true);
    	}else{
    	$("#submitid").attr("disabled",true);
    		 var form = $('#rejoinformid')[0];
    	     var data = new FormData(form);
    		$.ajax({
    	            url: "rejoinDetails", //this is the submit URL
    	            type: "POST",
    	            enctype: 'multipart/form-data',
    	            data: data,
    	            processData: false,
    	            contentType: false,
    	            cache: false,
    	            success: function(response){
    	            	document.getElementById("bformid").submit();
    	            }
    	        });
    	}
    		}else{
    			 window.location.href="loginpage";
    		}
    	});
    	}
	
</script>
</body>
</html>

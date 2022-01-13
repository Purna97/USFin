<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/css/datepicker3.min.css"/>
<link rel="stylesheet" href="resources/css/css/select2.min.css"	rel="stylesheet" />
<title>Employee Portal</title>
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
<body class="sidebar-mini fixed">
<div id="right-panel" class="right-panel">
	<div class="content">
			<!-- Animated -->
		<div class="animated fadeIn">
		<input type="hidden" name="canempType" id="canempType"  value="${empType}">
		<input type="hidden" name="joiningdate" id="joiningdate" value="${basicObj.joiningdate}">
		<input type="hidden" name="payratesize" id="payratesize" value="${payratesize}">
		<input type="hidden" name="activestatus" id="activestatus" value="${activestatus}">
                                                 
		<div class="row">
				<div class="col-md-12">
				 <c:choose>
	             <c:when test="${empType=='C2C'}">
						<h5 class="card-header">US Onboarding- View Client & Vendor Details</h5>
						<br>
						
						<c:if test="${payratesize eq 0 && activestatus eq 0}"> 
				    <h6 style="text-align-last:end;color:red"><a href="#"  onclick="addClientVendor('${candidate_id}','${empType}')"  
								class="label label-success" style="color:red;" title="Add Client&Vendor Details">
								Add New Client and Vendor Details<img src="resources/ICONS/client&vendorAdd.png"  style="padding: 0px 0px;max-width: 30px;"></a></h6><br>
								</c:if>
								
						<c:if test="${payratesize eq 0 && activestatus eq 1}"> 
				    <h6 style="text-align-last:end;color:red"><a href="#"  onclick="addClientVendor('${candidate_id}','${empType}')"  
								class="label label-success" style="color:red;" title="Add Client&Vendor Details">
								Add New Client and Vendor Details<img src="resources/ICONS/client&vendorAdd.png"  style="padding: 0px 0px;max-width: 30px;"></a></h6><br>
								</c:if>
				</c:when>
				<c:when test="${empType=='1099'}">
				 <h5 class="card-header">US Onboarding- View Client & Customer Details</h5>
				 <br>
				<%-- <c:if test="${payratesize eq 0}"> --%>
				<c:if test="${payratesize eq 0 && activestatus eq 0}"> 
				    <h6 style="text-align-last:end;color:red"><a href="#"  onclick="addClientVendor('${candidate_id}','${empType}')"  
								class="label label-success" style="color:red;" title="Add Client&Vendor Details">
								Add Another Client and Customer<img src="resources/ICONS/client&vendorAdd.png" style="padding: 0px 0px;max-width: 30px;"></a></h6><br>
								</c:if>
								
								<c:if test="${payratesize eq 0 && activestatus eq 1}"> 
				    <h6 style="text-align-last:end;color:red"><a href="#"  onclick="addClientVendor('${candidate_id}','${empType}')"  
								class="label label-success" style="color:red;" title="Add Client&Vendor Details">
								Add Another Client and Customer<img src="resources/ICONS/client&vendorAdd.png" style="padding: 0px 0px;max-width: 30px;"></a></h6><br>
								</c:if>
				</c:when>
				<c:otherwise>
				    <h5 class="card-header">US Onboarding- View Client & Customer Details</h5>
				    <c:if test="${empType eq 'W2'}">
				    <br>
				  
					<c:choose>
					<c:when test="${countObj.clientcount gt 0 && (countObj.inhousecount lt 1 || empty countObj.inhousecount)}"> 
				    <h6 style="text-align-last:end;color:green"><a href="#"  onclick="addClientVendor('${candidate_id}','${empType}')"  
					class="label label-success" style="color:green;" title="Add Client&Vendor Details">
					Add Another Client and Customer<img src="resources/ICONS/client&vendorAdd.png" 
					style="padding: 0px 0px;max-width: 30px;"></a></h6><br>
				    <!-- <h6 style="text-align-last:end;color:red"><a href="#"  onclick="alert('Client projects are active, you can not add In-house project');"  
					class="label label-success" style="color:red;" title="Client projects are active, you can not add In-house project">
					Add In-house Project <i class="fas fa-home"></i></a></h6><br> -->
					<h6 style="text-align-last:end;color:green"><a href="#"  onclick="addInhouseproject('${candidate_id}','${empType}')"  
					class="label label-success" style="color:green;" title="Add In-house project">
					Add In-house Project <i class="fas fa-home"></i></a></h6><br>
					</c:when>
					<c:when test="${countObj.clientcount lt 1 && (countObj.inhousecount lt 1 || empty countObj.inhousecount)}"> 
				    <h6 style="text-align-last:end;color:green"><a href="#"  onclick="addClientVendor('${candidate_id}','${empType}')"  
					class="label label-success" style="color:green;" title="Add Client&Vendor Details">
					Add Another Client and Customer<img src="resources/ICONS/client&vendorAdd.png" 
					style="padding: 0px 0px;max-width: 30px;"></a></h6><br>
				   <h6 style="text-align-last:end;color:green"><a href="#"  onclick="addInhouseproject('${candidate_id}','${empType}')"  
					class="label label-success" style="color:green;" title="Add In-house project">
					Add In-house Project <i class="fas fa-home"></i></a></h6><br>
					</c:when>
					<c:when test="${countObj.clientcount eq 0 && countObj.inhousecount eq 0}"> 
				    <h6 style="text-align-last:end;color:green"><a href="#"  onclick="addClientVendor('${candidate_id}','${empType}')"  
					class="label label-success" style="color:green;" title="Add Client&Vendor Details">
					Add Another Client and Customer<img src="resources/ICONS/client&vendorAdd.png" 
					style="padding: 0px 0px;max-width: 30px;"></a></h6><br>
				   <h6 style="text-align-last:end;color:green"><a href="#"  onclick="addInhouseproject('${candidate_id}','${empType}')"  
					class="label label-success" style="color:green;" title="Add In-house project">
					Add In-house Project <i class="fas fa-home"></i></a></h6><br>
					</c:when>
					<c:when test="${countObj.clientcount gt 0 && countObj.inhousecount gt 0}"> 
				    <h6 style="text-align-last:end;color:green"><a href="#"  onclick="addClientVendor('${candidate_id}','${empType}')"  
					class="label label-success" style="color:green;" title="Add Client&Vendor Details">
					Add Another Client and Customer<img src="resources/ICONS/client&vendorAdd.png" 
					style="padding: 0px 0px;max-width: 30px;"></a></h6><br>
				   <h6 style="text-align-last:end;color:red"><a href="#"  onclick="alert('In-house project is active, you can not add another In-house project');"  
					class="label label-success" style="color:red;" title="Add In-house project">
					Add In-house Project <i class="fas fa-home"></i></a></h6><br>
					</c:when>
					<c:when test="${countObj.clientcount eq 0 && countObj.inhousecount lt 1}"> 
					<!-- <h6 style="text-align-last:end;color:green"><a href="#"  onclick="alert('In-house project is active, you can not add client project');"  
					class="label label-success" style="color:red;" title="Add Client&Vendor Details">
					Add Another Client and Customer<img src="resources/ICONS/client&vendorAdd.png" 
					style="padding: 0px 0px;max-width: 30px;"></a></h6><br> -->
					<h6 style="text-align-last:end;color:green"><a href="#"  onclick="addClientVendor('${candidate_id}','${empType}')"  
					class="label label-success" style="color:green;" title="Add Client&Vendor Details">
					Add Another Client and Customer<img src="resources/ICONS/client&vendorAdd.png" 
					style="padding: 0px 0px;max-width: 30px;"></a></h6><br>
					<h6 style="text-align-last:end;color:green"><a href="#"  onclick="addInhouseproject('${candidate_id}','${empType}')"  
					class="label label-success" style="color:green;" title="Add In-house project">
					Add In-house Project <i class="fas fa-home"></i></a></h6><br>
					</c:when>
					 <c:when test="${countObj.clientcount eq 0 && countObj.inhousecount eq 1}"> 
					<!-- <h6 style="text-align-last:end;color:green"><a href="#"  onclick="alert('In-house project is active, you can not add client project');"  
					class="label label-success" style="color:red;" title="Add Client&Vendor Details">
					Add Another Client and Customer<img src="resources/ICONS/client&vendorAdd.png" 
					style="padding: 0px 0px;max-width: 30px;"></a></h6><br> -->
					<h6 style="text-align-last:end;color:green"><a href="#"  onclick="addClientVendor('${candidate_id}','${empType}')"  
					class="label label-success" style="color:green;" title="Add Client&Vendor Details">
					Add Another Client and Customer<img src="resources/ICONS/client&vendorAdd.png" 
					style="padding: 0px 0px;max-width: 30px;"></a></h6><br>
					<h6 style="text-align-last:end;color:green"><a href="#"  onclick="alert('In-house project is active, you can not add another In-house project');"  
					class="label label-success" style="color:green;" title="Add In-house project">
					Add In-house Project <i class="fas fa-home"></i></a></h6><br>
					</c:when>
					</c:choose>  
				</c:if>
				
				</c:otherwise>
				</c:choose>
				
					<div class="form-group row">
										 <label for="inputPassword" class="col-sm-3 control-label"></label>
										<center><font color=red><strong>Employee Name :</strong></font><b>&nbsp;&nbsp;${basicObj.full_name}</b>&nbsp;&nbsp;<font color=red><strong>Employee Type :</strong></font><b>&nbsp;&nbsp;${basicObj.emp_type}</b></center>&nbsp;&nbsp;<font color=red><strong>Work Authorization :</strong></font><b>&nbsp;&nbsp;${basicObj.work_authorization}</b></center>
					</div>
						<%--  <c:if test="${empty basicObj.billing}">
					<center><font color=blue><strong>Employee billing type missed, to add either client or In-house project ,please update from employee basic info</strong></font></center>
					</c:if>	 --%>
				
					<div class="card" id="loadpage">
						<div class="row">
							<div class="col-lg-12">
								<div class="well bs-component">
								<%-- <c:if test="${empType eq 'W2'}"> --%>
								<%-- <c:if test="${ccvlistsize gt 1}"> --%>
				<div class="col-lg-12">
                                           <%-- <input type="hidden" name="emptype" id="emptype"
                                                 value="${emptype}"> <input type="hidden" name="role"
                                                 id="role" value="${role}"> 
                                                 <input type="hidden" name="dept" id="dept" value="${dept}">
                                                 <input type="hidden" name="lgworkAuth" id="lgworkAuth" value="${lgworkAuth}">
                                                 <input type="hidden" name="lgfullname" id="lgfullname" value="${lgfullname}"> --%>
                                                 <%-- <input type="hidden" name="payrollType" id="payrollType" value="${payrollType}"> --%>
                                                 
                                                 <table id="employeeTableId"
                                                 class="table table-hover table-bordered"
                                                 style="text-align: center;">
                                                 <thead>
                                                        <tr>
                                                        	   <th style="text-align: center">Customer Name</th>
                                                               <th style="text-align: center">EndClient Name</th>
                                                               <th style="text-align: center">Project Name</th>
                                                               <th style="text-align: center;" >Project Start Date</th>
                                                               <th style="text-align: center">Project End Date</th>
                                                               <th style="text-align: center">Status</th>
                                                               <th style="text-align: center">View Details</th>
                                                               <c:if test="${basicObj.work_authorization eq 'H-1B'}">
                                                               </c:if>
                                                               <th style="text-align: center">Action</th>
                                                               <c:if test="${empType ne 'W2'}">
                                                               <th style="text-align: center">Exit</th>
                                                               </c:if>
                                                        </tr>
                                                 </thead>
                                                 <tbody>
																<c:forEach var="cclist" items="${ccvlist}">
																	<tr>
																	<c:choose>
																	<c:when test="${not empty cclist.custname}">
																		<td>${cclist.custname}</td>
																	</c:when>
																	<c:otherwise><td>NA</td></c:otherwise>
																	</c:choose>
																	<c:choose>
																	<c:when test="${not empty cclist.clientName}">
																		<td>${cclist.clientName}</td>
																	</c:when>
																	<c:otherwise><td>NA</td></c:otherwise>
																	</c:choose>
																		
																		<td>${cclist.projectName}</td>
																		<td>${cclist.proj_startDate}</td>
																		<td>${cclist.proj_endDate}</td>
																		<c:if test="${cclist.pstaus eq 'Active'}">
                                                             			 <td><font color="green"> <strong>${cclist.pstaus} </strong></font></td>
                                                               				</c:if>
                                                               				<c:if test="${cclist.pstaus ne 'Active'}">
                                                             			 <td><font color="red"> <strong>${cclist.pstaus} </strong></font></td>
                                                               				</c:if>
																		<c:choose>
																	<c:when test="${not empty cclist.clientName}">
																		<td><button class="btn btn-secondary btn-sm"  onclick="viewW2ClientVendor('${candidate_id}','${empType}',${cclist.payrate_id})" title="view client and customer details" data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;">
																		<i class="fa fa-eye" aria-hidden="true"></i></button>
                                                             			  </td>
																	</c:when>
																	<c:otherwise><td><button class="btn btn-secondary btn-sm"  onclick="viewInhouseproject('${candidate_id}','${empType}',${cclist.payrate_id},'${cclist.clientName}',${countObj.clientcount},${countObj.inhousecount})" title="view in-house project details" data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;">
																		<i class="fa fa-eye" aria-hidden="true"></i></button>
                                                             			  </td></c:otherwise>
																	</c:choose>
																		
                                                             			  
                                                             			  <c:choose>
                                                             			  <c:when test="${empType eq 'W2'}">
                                                             			  <c:if test="${cclist.project_status eq 'Active' || empty cclist.project_status }"><!--project status column need to be added  -->
                                                             			  <td><button class="btn btn-danger btn-sm"  onclick="inactiveProject('${cclist.payrate_id}','${cclist.candidate_id}','${cclist.project_status}','${empType}','${cclist.activeCount}')" 
                                                             			 data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"  title="Inactive the project">
                                                             			 InActive</button></td> 
                                                             			 
                                                               				</c:if>
                                                             			  <c:if test="${cclist.project_status eq 'InActive'}">
                                                             			   <td>
                                                             			   <c:if test="${emptype eq 'Admin' && role eq 4}">
                                                             			   <%-- ${countObj.clientcount eq 0 && countObj.inhousecount eq 0 && (not empty cclist.clientName || empty cclist.clientName)} --%>
                                                             			   <c:choose>
																		<c:when test="${empty cclist.clientName}">
																		<c:if test="${countObj.clientcount eq 0 && countObj.inhousecount eq 0}">
																		<button class="btn btn-success btn-sm"  onclick="inactiveProject('${cclist.payrate_id}','${cclist.candidate_id}','${cclist.project_status}','${empType}','${cclist.activeCount}')" 
                                                             			 data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"  title="Activate the project">
                                                             			 Activate</button>
																		</c:if>
																		<c:if test="${countObj.clientcount eq 0 && countObj.inhousecount eq 1}">
																		<button class="btn btn-danger btn-sm"  disabled onclick="#" 
                                                             			 data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"  title="Can't Activate the project">
                                                             			 Activate</button>
																		</c:if>
																		<c:if test="${countObj.clientcount gt 0 && countObj.inhousecount eq 0}">
																			<button class="btn btn-success btn-sm"  onclick="inactiveProject('${cclist.payrate_id}','${cclist.candidate_id}','${cclist.project_status}','${empType}','${cclist.activeCount}')" 
                                                             			 data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"  title="Activate the project">
                                                             			 Activate</button>
																		</c:if>
																		<c:if test="${countObj.clientcount gt 0 && countObj.inhousecount eq 1}">
																			<button class="btn btn-danger btn-sm"  disabled onclick="#" 
                                                             			 data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"  title="Can't Activate the project">
                                                             			 Activate</button>
																		</c:if>
																		</c:when>
																		<c:otherwise>
																			<button class="btn btn-success btn-sm"  onclick="inactiveProject('${cclist.payrate_id}','${cclist.candidate_id}','${cclist.project_status}','${empType}','${cclist.activeCount}')" 
                                                             			 data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"  title="Activate the project">
                                                             			 Activate</button>
																		
																		<%-- <c:if test="${countObj.clientcount eq 0 && countObj.inhousecount eq 0}">
																		<button class="btn btn-success btn-sm"  onclick="inactiveProject('${cclist.payrate_id}','${cclist.candidate_id}','${cclist.project_status}','${empType}','${cclist.activeCount}')" 
                                                             			 data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"  title="Activate the project">
                                                             			 Activate</button>
																		</c:if>
																		<c:if test="${countObj.clientcount gt 0 && countObj.inhousecount eq 0}">
																		<button class="btn btn-success btn-sm"  onclick="inactiveProject('${cclist.payrate_id}','${cclist.candidate_id}','${cclist.project_status}','${empType}','${cclist.activeCount}')" 
                                                             			 data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"  title="Activate the project">
                                                             			 Activate</button>
																		</c:if>
																			<c:if test="${countObj.clientcount eq 0 && countObj.inhousecount eq 1}">
																		<button class="btn btn-danger btn-sm"  disabled 
                                                             			 data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"  title="Can't Activate the project">
                                                             			 Activate</button>
																		</c:if> --%>
																		<!-- <button class="btn btn-danger btn-sm"  onclick="#" disabled
                                                             			 data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"  title="Inactive the project">
                                                             			 Activate</button> -->
																		</c:otherwise>
																		</c:choose>  
                                                             			   <%-- <button class="btn btn-success btn-sm"  onclick="inactiveProject('${cclist.payrate_id}','${cclist.candidate_id}','${cclist.project_status}','${empType}','${cclist.activeCount}')" 
                                                             			 data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"  title="Inactive the project">
                                                             			 Activate</button> --%> 
                                                             			   </c:if>
                                                             			   <c:if test="${emptype ne 'Admin' && role ne 4}">
                                                             			   <button class="btn btn-warning btn-sm"  title="Project inactivated"  style="padding: 0px 0px; font-size: 12px;">
                                                             			  <strong>InActivated</strong></button>
                                                             			   </c:if>
                                                             			  </td>
                                                             			   </c:if>
                                                             			  </c:when>
                                                             			  <c:otherwise>
                                                             			  <c:if test="${cclist.project_status eq 'Active' || empty cclist.project_status }"><!--project status column need to be added  -->
                                                             			 <td><button class="btn btn-danger btn-sm"  onclick="inactiveProject('${cclist.payrate_id}','${cclist.candidate_id}','${cclist.project_status}','${empType}','${cclist.activeCount}')" 
                                                             			 data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"  title="Inactive the project">
                                                             			 InActive</button></td>
                                                               			  </c:if>
                                                             			  <c:if test="${cclist.project_status eq 'InActive'}">
                                                             			   <td>
                                                             			   <c:if test="${emptype eq 'Admin' && role eq 4}">
                                                             			   <c:if test="${cclist.activeCount eq 0}">
                                                             			    <button class="btn btn-success btn-sm"  onclick="inactiveProject('${cclist.payrate_id}','${cclist.candidate_id}','${cclist.project_status}','${empType}','${cclist.activeCount}')" 
                                                             			    data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"  title="Active the project">
                                                             			    Activate</button>
                                                             			    </c:if>
                                                                    <%-- onclick="inactiveProject('${cclist.payrate_id}','${cclist.candidate_id}','${cclist.project_status}','${empType}','${cclist.activeCount}')"  --%>
                                                             			   <c:if test="${cclist.activeCount eq 1}">
                                                             			    <button class="btn btn-success btn-sm" onclick="alert('Active porject is going on, so you cannot Active another porject for ${empType} Candidates');" 
                                                             			    style="padding: 0px 0px; font-size: 12px;"  title="Active the project">
                                                             			    Activate</button>
                                                             			    </c:if>
                                                             			   </c:if>
                                                             			   <c:if test="${emptype ne 'Admin' && role ne 4}">
                                                             			   <button class="btn btn-warning btn-sm"  title="Project inactivated"  style="padding: 0px 0px; font-size: 12px;">
                                                             			  <strong>InActivated</strong></button>
                                                             			   </c:if>
                                                             			  </td>
                                                             			   </c:if>
                                                             			  <td><a href="#"	onclick="addExitDetails('${cclist.candidate_id}')" 
																		class="label label-success" style="color:white;" title="Add Exit Details">
																		<img src="resources/ICONS/exitAdd.png" id="iconImgId" style="padding: 0px 0px;max-width: 30px;"></a></td>
                                                             			  </c:otherwise>
                                                             			  </c:choose>
																	</tr>
																</c:forEach>

                                                 </tbody>
                                           </table>
                                    </div>
									<%-- </c:if> --%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		
                                    
			  <div class="row" id="showdetails">
				<div class="col-md-12">
				 <%-- <c:choose>
	             <c:when test="${emptype=='C2C'}">
						<h5 class="card-header">US Onboarding- View Client & Vendor Details</h5>
				</c:when>
				<c:otherwise>
				    <h5 class="card-header">US Onboarding- View Client & Customer Details</h5>
				</c:otherwise>
				</c:choose>  --%>
					<div class="card" id="loadpage">
						<div class="row">
							<div class="col-lg-12">
								<div class="well bs-component">

									<fieldset>
									<%-- <center><font color=red>Employee Name :</font>&nbsp;&nbsp;<b>${empobj.fullname}</b>&nbsp;&nbsp;<c:if test="${s_type=='Employees'}"><font color=red>Employee Number :</font>&nbsp;&nbsp;<b>${empobj.emp_number}</b></c:if>&nbsp;&nbsp;<font color=red>Employee Username :</font>&nbsp;&nbsp;<b>${empobj.username}</b></center> --%>
										<br>
										<form action="/" id="updateClientVendorForm" method="post" class="form-horizontal" enctype="multipart/form-data">
										<input type="hidden" id="emp_type" name="emp_type" value="${empType}">
										<input type="hidden" id="candidate_id" name="candidate_id" value="${candidate_id}">
                                         <br>
                                         <br>
                             			<c:forEach var="custlist" items="${custlist}">
                             			<input type="hidden" id="payRateid" name="payRateid" value="${custlist.payrate_id}">
                             			<input type="hidden" id="cust_id"name="cust_id" value="${custlist.custid}">
                             			<input type="hidden" id="bill_rate1" value="${custlist.billrate}">
                             			<input type="hidden" id="invoice_terms1" value="${custlist.invoiceterms}">
                             			<input type="hidden" id="invoiceperiod" value="${custlist.invoice_period}">
                             			<input type="hidden" id="pro_startdate1" value="${custlist.proj_startDate}">
                             			<input type="hidden" id="pro_enddate1" value="${custlist.proj_endDate}">
                             			<input type="hidden" id="payrolltype1" value="${custlist.payroll_type}">
                             			<input type="hidden" id="cid" value="${parateObj.customer_id}">
                             			<input type="hidden" id="curproject_status"name="curproject_status" value="${parateObj.project_status}">
                             			<input type="hidden" name="work_authorization" id="work_authorization" value="${basicObj.work_authorization}">
                                    
                                                     
                             			<h4><b>Customer Details</b></h4>
									    <div class="form-group row" >  
									    	   <label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;"></Span>Select Customer</label>
											   <div class="col-lg-4">
											     <select name="customertype" autoComplete="off" class="form-control text-left" id="customertype" onchange="loadcustomer()" required>
										             <%-- <option value="${custlist.custid}">${custlist.custname}</option> --%>
										             <option value="" disabled>--Select Customer--</option>
										               <c:forEach var="custl" items="${cutomerList}">
															<option value="${custl.companyId}" ${custl.companyId == parateObj.customer_id ? 'selected="selected"' : ''}>${custl.companyName}</option>
														</c:forEach>
												<!-- <option value="AddCustomerDetails">Add Customer Details</option> -->
										         </select>
										    </div> 
										    </div>
									    
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;">*</Span>Customer Address</label>
												<div class="col-lg-4">
													<input id="customer_add" type="text" 
														title="only alphabets are allowed"
														autocomplete="off" placeholder="Customer Address"
														name="customer_add" value="${custlist.custAddress}" class="form-control"
														readonly >
												</div>
											</div>

											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;">*</Span>Customer Person Contact No</label>
												<div class="col-lg-4">
													<input id="customer_phne_no" type="text" 
														minlength="10" maxlength="13" title="Enter Only Digits"
														autocomplete="off" placeholder="Customer Person Contact No"
														name="customer_phne_no" value="${custlist.cust_contactperson}" class="form-control"
														readonly >
												</div>
											</div>



											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;">*</Span>Customer Manager e-mail ID</label>
												<div class="col-lg-4">
													<input id="customer_mgr_emailid" type="text"
														title="Enter Valid Email format ex:xyz@gmail.com"
														autocomplete="off" placeholder="Customer Manager e-Mail ID"
														name="customer_mgr_emailid" value="${custlist.cust_mgr_email}"
														class="form-control"  readonly>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;">*</Span>Invoice terms</label>
												<div class="col-lg-2">
												<select name="invoice_terms" class="form-control text-left"
															id="invoice_terms" required>
												</select>
												<%-- <input class="form-control" id="invoice_terms"  autocomplete="off"  name="invoice_terms" 
															title="Enter Invoice Terms as eg NET 30" value="${custlist.invoiceterms}"
														placeholder="Enter Payment Terms as eg NET 30" type="text" required> --%>
											   </div>
											   <div class="col-lg-2">
											   <select id="invoice_period" class="form-control" name="invoice_period">
								       <option value="">Select Type</option>
								       <option value="Weekly">Weekly</option>
								       <option value="Bi-Weekly">Bi-Weekly</option>
								       <option value="Semi-Monthly">Semi-Monthly</option>
								       <option value="Monthly">Monthly</option>
								       <option value="Calendar">Calendar</option>
								     </select>
													<%-- <input id="invoice_period" type="text"  minlength="1"  maxlength="2"
														  title="Enter Only digits"	autocomplete="off" placeholder="Invoicing Period" name="invoice_period" 
														class="form-control" value="${custlist.invoice_period}" required> --%>
												</div>
											</div>
											  <input type="hidden" name="bcurrency" id="bcurrency" value="$">
											  <div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;">*</Span>Bill Rate</label>
												<div class="col-lg-2 col-md-2">
													<input id="bill_rate" type="text"  minlength="2" maxlength="7"
														 title="Enter Only digits" value="${custlist.billrate}"
														autocomplete="off" placeholder="Bill Rate" name="bill_rate"
														class="form-control"  required>
												</div>
												<div class="col-md-0" style="line-height: 2.8;">$</div>
											</div>
										
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;">*</Span>Project start date</label>
												<div class="col-lg-4">
													<input type="text" id="pro_startdate"
														class="form-control text-left"
														pattern="(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}"
														title="Enter date in MM/DD/YYYY format only" onkeydown="return false"
														name="pro_startdate" placeholder="Project start date" value="${custlist.proj_startDate}" 
														class="form-control" required autocomplete="off">
												</div>
											</div>

											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;">*</Span>Project end date</label>
												<div class="col-lg-4">
												<c:choose><c:when test="${parateObj.project_status eq 'InActive'}">
												<input type="text" 
														class="form-control text-left"
														name="pro_enddate" placeholder="Project end date" value="${custlist.proj_endDate}"
														class="form-control" readonly><span style="color:orangered"><b>Project is in inactive state, so can't change the project end date</b></span></c:when>
												<c:otherwise><input type="text" id="pro_enddate"
														class="form-control text-left"
														pattern="(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}"
														title="Enter date in MM/DD/YYYY format only" onkeydown="return false"
														name="pro_enddate" placeholder="Project end date" value="${custlist.proj_endDate}"
														class="form-control" required autocomplete="off"></c:otherwise>
												</c:choose>
												</div>
												<c:if test="${projectHistoryList.size() gt 0}">
													<div class="col-sm-2">
													&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewProjectDetailsHistory('${custlist.payrate_id}');"><i class="fa fa-history"></i></a>
													</div>
													</c:if>
											</div>
											
											<div class="form-group row">
											<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Timesheet Type</label>
											   <div class="col-lg-4">
											   
											   <select name="payrolltype" class="form-control text-left" id="payrolltype">
										             <option value="">--Select Timesheet Type--</option>
										             <option value="Weekly" ${'Weekly' eq custlist.payroll_type ? 'selected="selected"' : ''}>Weekly</option>
										             <option value="Bi-Weekly1" ${'Bi-Weekly1' eq custlist.payroll_type ? 'selected="selected"' : ''}>Bi-Weekly1</option>
										             <option value="Bi-Weekly2" ${'Bi-Weekly2' eq custlist.payroll_type ? 'selected="selected"' : ''}>Bi-Weekly2</option>
										             <option value="Semi-Monthly" ${'Semi-Monthly' eq custlist.payroll_type ? 'selected="selected"' : ''}>Semi-Monthly</option>
										             <option value="Monthly" ${'Monthly' eq custlist.payroll_type ? 'selected="selected"' : ''}>Monthly</option>
										         </select>
										         
											   		<!-- <label>Weekly</label>&nbsp;<input type="radio" name="payrolltype" value="weekly" id="weekly"  required/>&nbsp;<label>Semi-monthly</label>&nbsp;<input type="radio" name="payrolltype" value="semimonthly" id="semimonthly" />
													 <br> -->
												</div>
										    </div>
							 	</c:forEach>
								   <div class="form-group row">
										 <label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Uploded MSA</label>
										<div class="col-lg-4" id="uploadMsa">
										<c:choose>
	                                    <c:when test="${empty viewcvbean.cust_msa}">
									    <a>NA</a>
							    	    </c:when>
							    	   <c:otherwise>
										<%-- <c:if test="${empty viewcvbean.cust_msa}">
									    <a>NA</a>
							    	    </c:if> --%>
							            <span onclick="downloadDocCust('${viewcvbean.cust_msa}','Customer_MSA','${viewcvbean.custname}')" style="color: blue">
					    				 ${viewcvbean.cust_msa}</span>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewCustomerDocHistory('${viewcvbean.cmsafileid}','Customer_MSA');"><i class="fa fa-history"></i></a>
									   <br>
									   <c:if test="${not empty viewcvbean.cmsastartdate}">
													<label>Start Date : <span style="color: none">${viewcvbean.cmsastartdate}</span></label>
										</c:if>
													&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:if test="${not empty viewcvbean.cmsaexpirydate}"><label>
													 End Date : <span style="color: none">${viewcvbean.cmsaexpirydate}</span></label>
										</c:if>
									    </c:otherwise>
									    </c:choose>
									    </div> 
								</div>
								 <div class="form-group row" id="MsaDates" style="display:none;">
									      <label for="inputPassword" class="col-sm-3 control-label"></label>
									      <label id="MsaSd">Start Date : <span id="csdate"></span></label>&nbsp&nbsp&nbsp&nbsp<label id="MsaEd">End Date : <span id="cedate"></span></label>
								</div>
								<div  class="form-group row" id="mgrcust">
								<c:if test="${not empty viewcvbean.cmsamgr_apr_mail}">
								<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Manager Approved e-mail(Customer)</label>
									<div class="col-lg-4">
									    <span onclick="downloadDocCust('${viewcvbean.cmsamgr_apr_mail}','Manager_Approved_Email_CMSA','${viewcvbean.custname}')" style="color: blue">
					    			  ${viewcvbean.cmsamgr_apr_mail}</span>
									</div>
								</c:if>	
								</div>
								<div class="form-group row" id="upmam"  style="display:none">
									  <label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Management Approved Mail(Customer)</label>
										<div class="col-lg-4"  id="uploadmam">
								    	</div>
								</div>
										<%-- customerName=${custlist.custname} --%>
								<div class="form-group row" id="cwo"> 
								<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Customer WO</label>
									<div class="col-lg-3">
									<c:choose>
	                               <c:when test="${empty viewcvbean.cust_w_order}">
									<a>NA</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									      <button class="btn btn-default btn-sm" onclick="addCDocument('cust_work_order');">Add</button>
							    	</c:when>
							    	<c:otherwise>
							    	<input type="hidden" value="${viewcvbean.c_edid}" name="c_edid" />
									<span onclick="downloadDocument('${viewcvbean.cust_w_order}','cust_work_order')" style="color: blue">
					    			${viewcvbean.cust_w_order}</span>
					    			<br>
									<c:if test="${not empty viewcvbean.cwostartdate}">
									   <label>From Date : <span style="color: none">${viewcvbean.cwostartdate}</span></label>
									</c:if>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:if test="${not empty viewcvbean.cwoexpirydate}">
										<label>End Date : <span style="color: none">${viewcvbean.cwoexpirydate}</span></label>
										</c:if>
							    	</c:otherwise>
							    	</c:choose>
								    </div> 
								    <div class="col-sm-4" >
														<c:if test="${not empty viewcvbean.cust_w_order}">
															<input type="button" class="btn btn-default btn-sm" 
																onclick="editCustDocument('${viewcvbean.cust_w_order}',${viewcvbean.c_edid},'${viewcvbean.cwostartdate}','${viewcvbean.cwoexpirydate}','cust_work_order');"
																value="Edit" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
														<a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
																onclick="viewDocHistory1('${viewcvbean.c_edid}','cust_work_order');"
																title="View Document History"><i class="fa fa-history"></i></a>
														</c:if>
									</div>
								    <!-- <div class="form-group row" id="f1" style="display:none">
													<div class="col-lg-2">
													<input type="hidden" value="cust_work_order" name="cust_work_order"/>
								                	<input type="file" id="cw_order" name="cw_order" onchange="ValidateSize(this)">
													</div>
									</div> -->
									</div>
									<div class="form-group row" id="f1" style="display:none">
									  <label for="inputPassword" id="cust_work_order" class="col-sm-3 control-label">
									  <Span id="vlab" style="color:red;">*</Span>Upload WO/PO</label>
										<input type="hidden" value="cust_work_order" name="cust_work_order" />
										<div class="col-sm-3">
										<input type="file" id="cw_order" name="cw_order" onchange="cwoValidateSize(this)"><br>
									</div>
									<div class="col-sm-2" >
										<input type="text" id="cwofromdate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="cwofromdate" placeholder="Start Date" class="form-control"> 
									</div>
									<div class="col-sm-2">
										<input type="text" id="cwoexpirydate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="cwoexpirydate" placeholder="End Date" class="form-control">
									</div>
									<div class="col-sm-2">
												Exception: <input type="checkbox" id="myCheck" name="myCheck">
									</div>
									</div>
									<br>
									<div class="form-group row" id="map"  style="display:none;">
												<label for="inputPassword"	class="col-sm-3 control-label">
												<Span style="color: red;">*</Span>Management Approval e-mail(Consultant) </label>
												<div class="col-sm-5">
													<input type="hidden" value="Manager_Approved_Email_CWO" name="Manager_Approved_Email_CWO" /> 
													<input type="file" id="mgr_approved_mail_CWO" name="mgr_approved_mail_CWO"  accept=".msg,.eml" onchange="ValidateMsgFile(this)"><br>
												</div>
							     </div>
						         <c:choose>
	                             <c:when test="${empType=='1099' || empType=='W2'|| empType=='C2C'}">
								<div class="form-group row" id="mgrcwo">		
								<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Manager Approved e-mail(Consultant)</label>
									<div class="col-lg-3">
									<c:choose>
	                               <c:when test="${empty viewcvbean.mgr_apr_mail_cwo}">
									<a>NA</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									<button class="btn btn-default btn-sm" onclick="addMailCProofDocument('Manager_Approved_Email_CWO');">Add</button>
							    	</c:when>
							    	<c:otherwise>
							    	<%-- 	<input type="hidden" value="${viewcvbean.cc_edid}" name="cc_edid"/> --%>
							             <span onclick="downloadDocument('${viewcvbean.mgr_apr_mail_cwo}','Manager_Approved_Email_CWO')" style="color: blue">
					  				       ${viewcvbean.mgr_apr_mail_cwo}</span>
							    	</c:otherwise>
							    	</c:choose>
									</div>
									  <div class="col-sm-4">
														<c:if test="${not empty viewcvbean.mgr_apr_mail_cwo}">
															<input type="button" class="btn btn-default btn-sm" 
																onclick="editMailProofDocument('${viewcvbean.mgr_apr_mail_cwo}',${viewcvbean.cmgr_edid},'Manager_Approved_Email_CWO');"
																value="Edit" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
														<a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
																onclick="viewDocHistory1('${viewcvbean.cmgr_edid}','Manager_Approved_Email_CWO');"
																title="View Document History"><i class="fa fa-history"></i></a>
														</c:if>
									</div>
									</div>
								</c:when>
								</c:choose>     
								    
						
						<c:choose>
	                    <c:when test="${empType=='C2C'}">
	                     <c:forEach var="vendorlist" items="${vendorlist}">
	                     <input type="hidden" id="ven_id"name="ven_id" value="${vendorlist.vendid}">
	                     <input type="hidden" id="pay_rate1" value="${vendorlist.payrate}">
	                     <input type="hidden" id="payment_terms1" value="${vendorlist.payterms}">
	                     
	                     				<h4><b>Vendor Details</b></h4>
	                     				 <div class="form-group row" id="ven">  
									    	   <label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;"></Span>Select Vendor</label>
											   <div class="col-lg-4">
											     <select name="vendortype" autoComplete="off" class="form-control text-left" id="vendortype" onchange="loadvendor()" required>
										               <%-- <option value="${vendorlist.vendid}">${vendorlist.vendorname}</option> --%>
										               <option value=""disabled>--Select Vendor--</option>
										                 <c:forEach var="venl" items="${vendorList}">
															<option value="${venl.companyId}" ${venl.companyId == vendorlist.vendid ? 'selected="selected"' : ''}>${venl.companyName}</option>
														 </c:forEach>
													<!-- 	<option value="AddVendorDetails">Add Vendor Details</option> -->
										         </select>
										    </div> 
										    </div>
	                     					
							            <%--    <div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Vendor Name</label>
												<div class="col-lg-4">
													<input id="vendor_name" type="text" value="${vendorlist.vendorname}"
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="vendor Name" name="vendor_name" class="form-control" readonly >
												</div>
											</div>
											 --%>
											 <div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Vendor Address</label>
												<div class="col-lg-4">
													<input id="vendor_add" type="text" 
													title="only alphabets are allowed" value=""
													autocomplete="off" placeholder="Vendor Address" name="vendor_add"  class="form-control" readonly  >
												</div>
											</div>
											
											 <div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Vendor Person Contact No</label>
												<div class="col-lg-4">
													<input id="vendor_phne_no" type="text"  minlength="10" maxlength="13" title="Enter Only Digits" value="${vendorlist.v_contactperson}"
													autocomplete="off" placeholder="Vendor Person Contact No" name="vendor_phne_no" class="form-control" readonly >
												</div>
											</div>
											
											
											
											 <div class="form-group row" >
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Vendor Manager e-mail ID</label>
												<div class="col-lg-4">
													<input id="vendor_mgr_emailid" type="text"
													title="Enter Valid Email format ex:xyz@gmail.com"  value="${vendorlist.v_mgr_email}"
													autocomplete="off" placeholder="Vendor Manager e-Mail ID" name="vendor_mgr_emailid" class="form-control" readonly>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;">*</Span>Payment terms</label>
												<div class="col-lg-4">
												     <input class="form-control" id='payment_terms'  autocomplete="off" 
															title="Enter Payment Terms as eg NET 30" value="${vendorlist.payterms}"
														name="payment_terms" placeholder='Enter Payment Terms as eg NET 30' type='text' required>
										         </div>
										         </div>
										          <input type="hidden" name="pcurrency" id="pcurrency" value="$">
										      <div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;">*</Span>Pay Rate</label>
												<div class="col-lg-2 col-md-2"">
													<input id="pay_rate" type="text" minlength="2"  maxlength="7"
														data-minlength="2" title="Enter Only digits"
														autocomplete="off" placeholder="Pay Rate" name="pay_rate" value="${vendorlist.payrate}"
														class="form-control"  required>
												</div>
												<div class="col-md-0" style="line-height: 2.8;">$</div>
											</div>
										   
								</c:forEach>
								
								<div class="form-group row">
										 <label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Uploded MSA</label>
										<div class="col-lg-4" id="vMSA">
									<c:choose>
	                               <c:when test="${empty viewcvbean.ven_msa}">
									<a>NA</a>
							    	</c:when>
							    	<c:otherwise>
							              <span onclick="downloadDocVen('${viewcvbean.ven_msa}','Vendor_MSA','${viewcvbean.vendorname}')" style="color: blue">
					    			    ${viewcvbean.ven_msa}</span>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory('${viewcvbean.vmsafileid}','Vendor_MSA','');"><i class="fa fa-history"></i></a>
									    <br>
									    <c:if test="${not empty viewcvbean.vmsastartdate}">
													<label>Start Date : <span style="color: none">${viewcvbean.vmsastartdate}</span></label>
										</c:if>
													&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:if test="${not empty viewcvbean.vmsaexpirydate}"><label>
													 End Date : <span style="color: none">${viewcvbean.vmsaexpirydate}</span></label>
										</c:if>
									   </c:otherwise>
									   </c:choose>
									    </div> 
								</div>
								<div class="form-group row" id="vMSADates" style="display:none;">
									  <label for="inputPassword" class="col-sm-3 control-label"></label>
									<label id="vMSA1Sd">Start Date : <span id="vMSAsdate"></span></label>&nbsp&nbsp&nbsp&nbsp<label id="vMSAEd">End Date : <span id="vMSAedate"></span></label>
									</div>
								<div id="mgrven">
								<c:if test="${not empty viewcvbean.vmsamgr_apr_mail}">
								<div class="form-group row" >		
								<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Manager Approved e-mail(Vendor)</label>
									<div class="col-lg-4">
							              <span onclick="downloadDocVen('${viewcvbean.vmsamgr_apr_mail}','Manager_Approved_Email_VMSA','${viewcvbean.vendorname}')" style="color: blue">
					    			       ${viewcvbean.vmsamgr_apr_mail}</span>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory('${viewcvbean.vmgrfileid}','Manager_Approved_Email_VMSA','');"><i class="fa fa-history"></i></a>
									</div>
									</div>
								</c:if>
								</div>
									
									<h4>Upload Business Compliance</h4>
									<div class="form-group row" id="BCdocs1Id" style="display:none;">
									  <label for="inputPassword" class="col-sm-3 control-label" ></label>
									 <div class="col-lg-8" id="BCdocs1">
									 </div>
									</div>
									<div class="form-group row" id="BCdocs1Dates" style="display:none;">
									  <label for="inputPassword" class="col-sm-3 control-label"></label>
									<label id="BCdocs1Sd">Start Date : <span id="bcd1sdate"></span></label>&nbsp&nbsp&nbsp&nbsp<label id="BCdocs1Ed">End Date : <span id="bcd1edate"></span></label>
									</div>
									<div class="form-group row" id="BCdocs2Id" style="display:none;">
									  <label for="inputPassword" class="col-sm-3 control-label" ></label>
									 <div class="col-lg-8" id="BCdocs2">
									</div>
									</div>
									<div class="form-group row" id="BCdocs2Dates" style="display:none;">
									  <label for="inputPassword" class="col-sm-3 control-label"></label>
									<label id="BCdocs2Sd">Start Date : <span id="bcd2sdate"></span></label>&nbsp&nbsp&nbsp&nbsp<label id="BCdocs2Ed">End Date : <span id="bcd2edate"></span></label>
									</div>
									<div class="form-group row" id="BCdocs3Id" style="display:none;">
									  <label for="inputPassword" class="col-sm-3 control-label" ></label>
									 <div class="col-lg-8" id="BCdocs3">
									</div>
									</div>
									<div class="form-group row" id="BCdocs3Dates" style="display:none;">
									  <label for="inputPassword" class="col-sm-3 control-label"></label>
									<label id="BCdocs3Sd">Start Date : <span id="bcd3sdate"></span></label>&nbsp&nbsp&nbsp&nbsp<label id="BCdocs3Ed">End Date : <span id="bcd3edate"></span></label>
									</div>
									<div class="form-group row" id="BCdocs4Id" style="display:none;">
									  <label for="inputPassword" class="col-sm-3 control-label" ></label>
									 <div class="col-lg-8" id="BCdocs4">
									</div>
									</div>
								 <div class="form-group row" id="upamv"  style="display:none">
									  <label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Management Approved Mail(Vendor)</label>
										<div class="col-lg-4"  id="uplodmamv">
								    	</div>
								</div>
						<center id="tid">			
						<table class="table" style="border-collapse: collapse;max-width:60%; border: none;" cellspacing="0" cellpadding="0" 
						style="text-align: center;">
						
						<tbody>
						<c:forEach var="bsc" items="${viewcvbean.vendordocs}">
							 <thead>
								<tr style="border: none;">
								<td style="border: none;">${bsc.inputval}</td>
								<td style="border: none;">
								 <span  onclick="downloadDocVen('${bsc.fileName}','Business Compliance','${viewcvbean.vendorname}')" style="color: blue">
					    			${bsc.fileName}</span>
					    		  <br>
					    		   <c:if test="${not empty bsc.startdate}">
													<label>Start Date : <span style="font:bold;">${bsc.startdate}</span></label>
								</c:if>
								<c:if test="${not empty bsc.expirydate}"><label>
													 End Date : <span style="font:bold;">${bsc.expirydate}</span></label>
								</c:if>
								</td>
								<td style="border: none;">&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory('${bsc.fileId}','Business Compliance','${bsc.inputval}');"><i class="fa fa-history"></i></a>
							     </td>
							    <%--  <c:if test="${bsc.inputval eq 'insurance_certificate'}">
							     <td style="border: none;"><a href="#" onclick="certificateHistory()" 
								class="label label-success" style="color:white;" title="certificate History">
								<img src="resources/ICONS/empHistory.png" style="max-width: 8%;"></a></td>
								</c:if>
								<c:if test="${bsc.inputval ne 'insurance_certificate'}">
								<td style="border: none;"></td>
								</c:if> --%>
								</tr>
								</thead>
							</c:forEach>
						</tbody>
					</table>
						</center>			
										
								<div class="form-group row" id="vwo">
								<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Vendor WO</label>
								<div class="col-lg-3">
									<c:choose>
	                               <c:when test="${empty viewcvbean.ven_w_order}">
									<a>NA</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									<button class="btn btn-default btn-sm" onclick="addVDocument('ven_work_order');">Add</button>
							    	</c:when>
							    	<c:otherwise>
							    	<input type="hidden" value="${viewcvbean.v_edid}" name="v_edid" />
							          <span onclick="downloadDocument('${viewcvbean.ven_w_order}','ven_work_order')" style="color: blue">
					  				  ${viewcvbean.ven_w_order}</span>
					  				  <br>
									<c:if test="${not empty viewcvbean.vwostartdate}">
									   <label>From Date : <span style="color: none">${viewcvbean.vwostartdate}</span></label>
									</c:if>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:if test="${not empty viewcvbean.vwoexpirydate}">
										<label>End Date : <span style="color: none">${viewcvbean.vwoexpirydate}</span></label>
										</c:if>
							    	</c:otherwise>
							    	</c:choose>
								</div>
								 <div class="col-sm-4">
														<c:if test="${not empty viewcvbean.ven_w_order}">
															<input type="button" class="btn btn-default btn-sm" 
																onclick="editDocument('${viewcvbean.ven_w_order}',${viewcvbean.v_edid},'${viewcvbean.vwostartdate}','${viewcvbean.vwoexpirydate}','ven_work_order');"
																value="Edit" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
														<a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
																onclick="viewDocHistory('${viewcvbean.v_edid}','ven_work_order');"
																title="View Document History"><i class="fa fa-history"></i></a>
														</c:if>
								</div>
								<!-- <div class="form-group row" id="f2" style="display:none">
													<div class="col-lg-2">
													<input type="hidden" value="ven_work_order" name="ven_work_order" />
								                    <input type="file" id="w_order" name="w_order" onchange="ValidateSize(this)">
													</div>
								</div>  -->
								</div>
								<div class="form-group row" id="cca">
								<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Consultant Consent Agreement</label>
								<div class="col-lg-3">
								<c:choose>
	                               <c:when test="${empty viewcvbean.cagreement}">
									<a>NA</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									<button class="btn btn-default btn-sm" onclick="addCCADocument('Consultant_Consent_Agreement');">Add</button>
							    	</c:when>
							    	<c:otherwise>
							    		<input type="hidden" value="${viewcvbean.cca_edid}" name="cca_edid" />
							              <span onclick="downloadDocument('${viewcvbean.cagreement}','Consultant_Consent_Agreement')" style="color: blue">
					  				       ${viewcvbean.cagreement}</span>
							    	</c:otherwise>
							    	</c:choose>
								</div>
								<!-- <div class="form-group row" id="f3" style="display:none">
													<div class="col-lg-2">
													<input type="hidden" value="Consultant_Consent_Agreement" name="Consultant_Consent_Agreement" />
								                	<input type="file" id="cagreement" name="cagreement" onchange="ValidateSize(this)">
													</div>
								</div>  -->
								 <div class="col-sm-4"> 
														<c:if test="${not empty viewcvbean.cagreement}">
															<input type="button" class="btn btn-default btn-sm" 
																onclick="editCCADocument('${viewcvbean.cagreement}',${viewcvbean.cca_edid},'Consultant_Consent_Agreement');"
																value="Edit" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
														<a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
																onclick="viewDocHistory('${viewcvbean.cca_edid}','Consultant_Consent_Agreement');"
																title="View Document History"><i class="fa fa-history"></i></a>
														</c:if>
								</div>
								</div>
								<div class="form-group row" id="cc">		
								<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Consultant Compliance</label>
									<div class="col-lg-3">
									<c:choose>
	                               <c:when test="${empty viewcvbean.cCompliance}">
									<a>NA</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									<button class="btn btn-default btn-sm" onclick="addVDocument('Consultant_Compliance');">Add</button>
							    	</c:when>
							    	<c:otherwise>
							    		<input type="hidden" value="${viewcvbean.cc_edid}" name="cc_edid" />
							             <span onclick="downloadDocument('${viewcvbean.cCompliance}','Consultant_Compliance')" style="color: blue">
					  				       ${viewcvbean.cCompliance}</span>
					  				       	<br>
									<c:if test="${not empty viewcvbean.ccstartdate}">
									   <label>From Date : <span style="color: none">${viewcvbean.ccstartdate}</span></label>
									</c:if>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:if test="${not empty viewcvbean.ccexpirydate}">
										<label>End Date : <span style="color: none">${viewcvbean.ccexpirydate}</span></label>
										</c:if>
							    	</c:otherwise>
							    	</c:choose>
									</div>
									  <div class="col-sm-4"> 
														<c:if test="${not empty viewcvbean.cCompliance}">
															<input type="button" class="btn btn-default btn-sm" 
																onclick="editDocument('${viewcvbean.cCompliance}',${viewcvbean.cc_edid},'${viewcvbean.ccstartdate}','${viewcvbean.ccexpirydate}','Consultant_Compliance');"
																value="Edit" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
														<a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
																onclick="viewDocHistory('${viewcvbean.cc_edid}','Consultant_Compliance');"
																title="View Document History"><i class="fa fa-history"></i></a>
														</c:if>
									</div>
									<!-- <div class="form-group row" id="f4" style="display:none">
													<div class="col-lg-2">
													<input type="hidden" value="Consultant_Compliance" name="Consultant_Compliance" />
								                	<input type="file" id="cCompliance" name="cCompliance" onchange="ValidateSize(this)"><br>
													</div>
									</div>  -->
									</div>
									
									<div class="form-group row" id="mgrvwo">		
								<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Manager Approved e-mail(Consultant)</label>
									<div class="col-lg-3">
									<c:choose>
	                               <c:when test="${empty viewcvbean.mgr_apr_mail_vwo}">
									<a>NA</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									<button class="btn btn-default btn-sm" onclick="addMailVProofDocument('Manager_Approved_Email_VWO');">Add</button>
							    	</c:when>
							    	<c:otherwise>
							    	<%-- 	<input type="hidden" value="${viewcvbean.cc_edid}" name="cc_edid"/> --%>
							             <span onclick="downloadDocument('${viewcvbean.mgr_apr_mail_vwo}','Manager_Approved_Email_VWO')" style="color: blue">
					  				       ${viewcvbean.mgr_apr_mail_vwo}</span>
							    	</c:otherwise>
							    	</c:choose>
									</div>
									  <div class="col-sm-4">
														<c:if test="${not empty viewcvbean.mgr_apr_mail_vwo}">
															<input type="button" class="btn btn-default btn-sm" 
																onclick="editVMailProofDocument('${viewcvbean.mgr_apr_mail_vwo}',${viewcvbean.vmgr_edid},'Manager_Approved_Email_VWO');"
																value="Edit" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
														<a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
																onclick="viewDocHistory('${viewcvbean.vmgr_edid}','Manager_Approved_Email_VWO');"
																title="View Document History"><i class="fa fa-history"></i></a>
														</c:if>
									</div>
									</div>
									
									<div class="form-group row" id="f2" style="display:none">
									  <label for="inputPassword" id="ven_work_order" class="col-sm-3 control-label">
									  <Span id="vlab1" style="color:red;">*</Span>Upload WO</label>
										<input type="hidden" value="ven_work_order" name="ven_work_order" />
										<div class="col-sm-3">
										<input type="file" id="w_order" name="w_order" onchange="vwoValidateSize(this)"><br>
									</div>
									<div class="col-sm-2" >
										<input type="text" id="vwofromdate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="vwofromdate" placeholder="Start Date" class="form-control"> 
									</div>
									<div class="col-sm-2">
										<input type="text" id="vwoexpirydate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="vwoexpirydate" placeholder="End Date" class="form-control">
									</div>
									 <div class="col-lg-2">
												Exception: <input type="checkbox" id="myCheck1" name="myCheck1">
									 </div>
									</div>
									
								<div class="form-group row" id="f3" style="display:none">
									  <label for="inputPassword" id="Consultant_Consent_Agreement" class="col-sm-3 control-label">
									  <Span id="vlab2" style="color:red;">*</Span>Consultant Consent Agreement</label>
										<input type="hidden" value="Consultant_Consent_Agreement" name="Consultant_Consent_Agreement" />
										<div class="col-sm-5">
										<input type="file" id="cagreement" name="cagreement" onchange="ccaValidateSize(this)"><br>
										</div>
									</div>	
	                              
								<div class="form-group row" id="f4" style="display:none">
									  <label for="inputPassword" id="Consultant_Compliance" class="col-sm-3 control-label">
									  <Span id="vlab3" style="color:red;">*</Span>Consultant Compliance</label>
										<input type="hidden" value="Consultant_Compliance" name="Consultant_Compliance" />
										<div class="col-sm-3">
										<input type="file" id="cCompliance" name="cCompliance" 	onchange="ccValidateSize(this)"><br>
										</div>
									<div class="col-sm-2" >
										<input type="text" id="ccfromdate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="ccfromdate" placeholder="Start Date" class="form-control"> 
									</div>
									<div class="col-sm-2">
										<input type="text" id="ccexpirydate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="ccexpirydate" placeholder="End Date" class="form-control">
									</div> 
								</div>
							<div class="form-group row" id="map2"  style="display:none;">
												<label for="inputPassword"	class="col-sm-3 control-label">
												<Span style="color: red;">*</Span>Management Approval e-mail(Consultant) </label>
												<div class="col-sm-5">
													<input type="hidden" value="Manager_Approved_Email_VWO" name="Manager_Approved_Email_VWO" /> 
													<input type="file" id="mgr_approved_mail_VWO" name="mgr_approved_mail_VWO"  accept=".msg,.eml" onchange="ValidateMsgFile(this)"><br>
												</div>
							</div>
								
								</c:when>
								</c:choose>	
								
								
								      <input type="hidden" name="endclientid" id="endclientid" value="${endClient.clientid}">
								       <input type="hidden" id="projectName1" value="${endClient.projectName}">
								      <input type="hidden" id="endclient_name1" value="${endClient.clientName}">
                                      <input type="hidden" id="endclient_mgr_name1" value="${endClient.client_mgr}">
                                      <input type="hidden" id="endclient_mgr_emailid1" value="${endClient.client_mgr_email}">
                                      <input type="hidden" id="endmgrdeskNumber1" value="${endClient.client_mgr_extn}">
                                      <input type="hidden" id="endemp_emailid1" value="${endClient.emp_email_clent}">
                                      <input type="hidden" id="endempdeskNumber1" value="${endClient.emp_extn_clent}">
                                      <input type="hidden" id="endfed_id1" value="${endClient.fed_id}">
                                      <input type="hidden" id="endline11" value="${endClient.line1}">
                                      <input type="hidden" id="endline21" value="${endClient.line2}">
                                      <input type="hidden" id="endcity21" value="${endClient.city}">
                                      <input type="hidden" id="endstate21" value="${endClient.state}">
                                      <input type="hidden" id="endzipcode21" value="${endClient.zipcode}">
                                       <input type="hidden" id="lcadocCount" value="${endClient.lcadocCount}">
                                      
								   <h4><b>End Client Details</b></h4>
								         <div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;"></Span>Project Name</label>
												<div class="col-lg-4">
													<input id="projectName" type="text"  minlength="2" maxlength="100"
													title="only alphabets are allowed"  value="${endClient.projectName}"
													autocomplete="off" placeholder="Project Name" name="project_name" class="form-control">
												</div>
											</div> 
                                        <div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;">*</Span>End Client Name</label>
												
												<div class="col-lg-4">
													<input id='endclient_name' type="text"
														title="only alphabets are allowed" minlength="2" maxlength="100"
														autocomplete="off" placeholder="End Client Name"
														name="endclient_name" class="form-control" value="${endClient.clientName}"
														required>
												</div>
											<div class="form-group row" id="editcl">
											    <!--  <div class="form-group" id="bid" > 
														<button id="button" class="btn btn-warning btn-xs" role="button"><i class="icon-check"></i>Inactive</button>
												 </div> -->
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;"></Span>Federal ID</label>
												<div class="col-lg-4">
												<input  type="text" name="endfed_id" id="endfed_id" 
													 placeholder="Federal ID"  class="form-control"  value="${endClient.fed_id}" ></input>
												</div>
											  </div> 

											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;">*</Span>End Client Manager Name</label>
												<div class="col-lg-4">
													<input id='endclient_mgr_name' type="text" pattern="^[a-zA-Z\s]+$"
														title="only alphabets are allowed"  minlength="2" 
														autocomplete="off" placeholder="End Client Manager Name"
														name="endclient_mgr_name" class="form-control" value="${endClient.client_mgr}"
														>
												</div>
											</div>


											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;">*</Span>End Client Manager e-mail ID</label>
												<div class="col-lg-4">
													<input id='endclient_mgr_emailid' type="text"
														title="Enter Valid e-mail format ex:xyz@gmail.com" minlength="10" maxlength="80"
														autocomplete="off" placeholder="End Client Manager e-mail ID"
														name="endclient_mgr_emailid" class="form-control"
														value="${endClient.client_mgr_email}" >
												</div>
											</div>

											<div class="form-group row">
												<label class="col-lg-3 control-label"><Span
													style="color: red;"></Span>End Client Manager Desk Extension Number</label>
												<div class="col-lg-4">
													<input class="form-control" id='endmgrdeskNumber'
														autocomplete="off"	title="Enter Desk number"
														value="${endClient.client_mgr_extn}" name="endmgrdeskNumber"   minlength="10" maxlength="12"
														placeholder='Manager Desk Extension Number' type='text'>
												</div>
											</div>



											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;"></Span>Employee e-mail ID At End Client
													Location</label>
												<div class="col-lg-4">
													<input id='endemp_emailid' type="text"
														title="Enter Valid Email format ex:xyz@gmail.com"
														autocomplete="off" minlength="10" maxlength="80"
														placeholder="Employee e-Mail ID at Client Location"
														name="endemp_emailid" class="form-control"
														value="${endClient.emp_email_clent}">
												</div>
											</div>

											<div class="form-group row">
												<label class="col-lg-3 control-label"><Span
													style="color: red;"></Span>Employee Desk Extension
													Number at Client</label>
												<div class="col-lg-4">
													<input class="form-control" id='endempdeskNumber'
														autocomplete="off"														
														title="Enter Desk number ex:TIPL-K1-Desk-A00"
														value="${endClient.emp_extn_clent}" name="endempdeskNumber"
														  minlength="10" maxlength="12"
														placeholder='Enter Employee Client Desk Number'	type='text'>
												</div>
											</div>
											
											 <div class="form-group row">
											<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Line1</label>
											<div class="col-lg-4">
												<input id="endline1" type="text" minlength="2" maxlength="80" required
											    title="Enter address" 
												placeholder="Employee Address" name="endline1" class="form-control"  value="${endClient.line1}">
											</div>
										</div>
										
										<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-lg-4">
													<input id="endline2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" 
													placeholder="line2" name="endline2" class="form-control"  value="${endClient.line2}" >
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-lg-4">
													<input id="endcity" type="text"  minlength="2" maxlength="40" required
													title="only Characters are allowed"  
													placeholder="City" name="endcity" class="form-control"  value="${endClient.city}">
												</div><!--pattern="^[a-zA-Z\s]+$" " -->
											</div>
										
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-lg-4">
													<input id="endstate" type="text"  minlength="2" maxlength="25" value="${endClient.state}"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="endstate" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-lg-4">
													<input id="endzipcode" type="text"   required
													title="only alphabets are allowed" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													placeholder="Zip Code" name="endzipcode" class="form-control"  value="${endClient.zipcode}">
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
									</div>
									
									 
									 <c:if test="${not empty basicObj.work_authorization}">
									   <input type="hidden" id="job_title1" value="${endClient.job_title}">
                                      <input type="hidden" id="organization_name1" value="${endClient.organization_name}">
                                      <input type="hidden" id="education1" value="${endClient.education}">
                                      <input type="hidden" id="workinglocation1" value="${endClient.workinglocation}">
                                       <input type="hidden" id="reason_lca1" value="${endClient.reason_lca}">
									 
										<c:if test="${basicObj.work_authorization eq 'H-1B' && empType eq 'W2'}">
										<h4><b>LCA Questionnaire</b></h4>
									  	    <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Organization Name</label>
												<div class="col-sm-5">
												    <select id="organization_name" placeholder="Organization Name"
													 name="organization_name" class="form-control">
													 <option value=""disabled>Select Organization Name</option>
													<option value="Tekskills Inc">Tekskills Inc</option>
													</select>
													<%-- <input id="organization_name" type="text"  minlength="2" maxlength="100"
													title="only alphabets are allowed" placeholder="Organization Name" 
													name="organization_name" class="form-control" value="${endClient.organization_name}"> --%>
												</div>
											 </div>
											 
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Reason for filing LCA</label>
												<div class="col-sm-5">
												<input id="reason_lca" type="text" name="reason_lca" class="form-control" value="${endClient.reason_lca}" >
												<!-- 	<select id="reason_lca" name="reason_lca" class="form-control">
													 <option value="">Select Reason</option>
													 <option value="H1B Extension">H1B Extension</option>
													  <option value="H1B Transfer">H1B Transfer</option>
													   <option value="H1B CAP">H1B CAP</option>
												  <option value="H1B Amendment">H1B Amendment</option>
													</select> -->
												</div>
											 </div>
											 
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Candidate Job Title</label>
												<div class="col-sm-5">
													<input id="cand_job_title" type="text"  minlength="2" maxlength="100"
													title="only alphabets are allowed"  placeholder="Candidate Job Title" 
													 name="cand_job_title" class="form-control" value="${endClient.job_title}" >
												</div>
											 </div>
											 
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Education</label>
												<div class="col-sm-5">
													<input id="education" type="text"  minlength="2" maxlength="100"
													title="only alphabets are allowed" placeholder="Education" 
													name="education" class="form-control" value="${endClient.education}" >
												</div>
											 </div>
											
											<%--  <center>
											<span> <br><a href="https://www.flcdatacenter.com/" target="_blank"style="color:blue;">You can find all the states from search wizard</a></span>
										   <span> <br><br><a href="https://www.flcdatacenter.com/" target="_blank"style="color:blue;">You can find the county from this website by entering zip code</a></span><br><br>
										   </center> --%>
											 
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Are you working/supporting client project from Remote/Home or end client location :</label>
												<div class="col-sm-5">
												 <c:choose>
											       <c:when test="${endClient.workinglocation=='Remote/Home'}">
							   					    <label class="control-label">Remote/Home</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="workinglocation" value="Remote/Home" style=" width: 20px;height: 20px;" checked/>&nbsp;&nbsp;&nbsp;&nbsp;<label>End client location</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="workinglocation" value="EndClient" style=" width: 20px;height: 20px;"/>
													</c:when>
											       <c:when test="${endClient.workinglocation=='EndClient'}">
												     <label class="control-label">Remote/Home</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="workinglocation" value="Remote/Home" style=" width: 20px;height: 20px;" />&nbsp;&nbsp;&nbsp;&nbsp;<label>End client location</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="workinglocation" value="EndClient" style=" width: 20px;height: 20px;" checked/>
													</c:when>
													<c:otherwise>
													<label class="control-label">Remote/Home</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="workinglocation" value="Remote/Home" style=" width: 20px;height: 20px;" />&nbsp;&nbsp;&nbsp;&nbsp;<label>End client location</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="workinglocation" value="EndClient" style=" width: 20px;height: 20px;"/>
													</c:otherwise>
											    </c:choose>
												</div>
											 </div>
										  
										  <!--   <div id="remoteAddress" class="form-group" style="display:none;">
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-5">
													<input id="nremote_line1" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="nremote_line1" class="form-control"  required>
												</div>pattern="^[a-zA-Z\s]+$"
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-5">
													<input id="nremote_line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" placeholder="Enter Line2"
													 autocomplete="off" name="nremote_line2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-5">
													<input id="nremote_city" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="City" name="nremote_city" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-5">
													<input id="nremote_state" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="nremote_state" class="form-control"  required>
												</div>
											</div>
											 
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-5">
													<input id="nremote_zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" 
													 autocomplete="off" placeholder="Zip Code" name="nremote_zipcode" class="form-control"  required>
												</div>
											</div>
											 </div> -->
										</c:if>
										</c:if>
									
									<c:if test="${not empty basicObj.work_authorization}">
										<c:if test="${basicObj.work_authorization eq 'H-1B'}">
									  <input type="hidden" id="remote_line11" value="${endClient.remoteAddress.line1}">
                                      <input type="hidden" id="remote_line21" value="${endClient.remoteAddress.line2}">
                                      <input type="hidden" id="remote_city21" value="${endClient.remoteAddress.city}">
                                      <input type="hidden" id="remote_state21" value="${endClient.remoteAddress.state}">
                                      <input type="hidden" id="remote_zipcode21" value="${endClient.remoteAddress.zipcode}">
                                      <input type="hidden" id="remote_county1" value="${endClient.county}">
                                      <input type="hidden" id="remote_soc_code1" value="${endClient.soc_code}">
                                      
										  <div id="remoteAddress" class="form-group" style="display:none;">
										  <div class="form-group row">
											<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Line1</label>
											<div class="col-lg-4">
												<input id="remote_line1" type="text" minlength="2" maxlength="80" required
											    title="Enter address" 
												placeholder="Employee Address" name="remote_line1" class="form-control"  value="${endClient.remoteAddress.line1}">
											</div>
										</div>
										
										<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-lg-4">
													<input id="remote_line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" 
													placeholder="line2" name="remote_line2" class="form-control"  value="${endClient.remoteAddress.line2}" >
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-lg-4">
													<input id="remote_city" type="text"  minlength="2" maxlength="40" required
													title="only Characters are allowed"  
													placeholder="City" name="remote_city" class="form-control"  value="${endClient.remoteAddress.city}">
												</div><!--pattern="^[a-zA-Z\s]+$" " -->
											</div>
										
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-lg-4">
													<input id="remote_state" type="text"  minlength="2" maxlength="25" value="${endClient.remoteAddress.state}"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="remote_state" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-lg-4">
													<input id="remote_zipcode" type="text"   required
													title="only alphabets are allowed" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													placeholder="Zip Code" name="remote_zipcode" class="form-control"  value="${endClient.remoteAddress.zipcode}">
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
									        </div>
									        </div>
									        
									      <c:if test="${not empty endClient.workinglocation}">
										   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>County</label>
												<div class="col-sm-5">
													<input id="remote_county" type="text"  minlength="4" maxlength="20"
													title="only alphabets are allowed" placeholder="County" 
													name="remote_county" class="form-control" value="${endClient.county}">
												</div>
											 </div>
											 
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>SOC code</label>
												<div class="col-sm-5">
													<%-- <input id="remote_soc_code" type="text" minlength="7" maxlength="7"
													title="only alphabets are allowed" 
													placeholder="SOC code" name="remote_soc_code" class="form-control" value="${endClient.soc_code}"> --%>
												  <select name="remote_soc_code" autoComplete="off" class="form-control text-left" id="remote_soc_code" required>
										             <c:forEach var="socl" items="${soccodeList}">
															<option value="${socl.soc_code}">${socl.soc_code}</option>
														</c:forEach>
										         </select>
												</div>
											 </div>
											 
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Metro Politan Area</label>
												<div class="col-sm-5">
													<input id="metro_politan_area" type="text"  minlength="2" maxlength="25"
													title="only alphabets are allowed" 
													autocomplete="off" placeholder="Metro Politan Area" name="metro_politan_area" class="form-control"  value="${endClient.metro_politan_area}">
												</div>
											 </div>
											 
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label">To get Counties</label>
												<div class="col-sm-3">
													<span><a href="https://www.getzips.com/zip.htm" target="_blank"style="color:blue;">https://www.getzips.com/zip.htm</a></span>
												</div>
												<label for="inputPassword" class="col-sm-0 control-label">To get SOC</label>
												<div class="col-sm-3">
												 <span><a href="https://www.flcdatacenter.com/" target="_blank"style="color:blue;">https://www.flcdatacenter.com/</a></span><br><br>
												</div>
											  </div>
										   </c:if>
									<c:if test="${otherloclist.size() gt 0}">
									 
									<c:forEach var="otherloc" items="${otherloclist}">
                                     <input type="hidden" id="lcaother_addr_id" name="lcaother_addr_id" value="${otherloc.address_id}">
                                     <input type="hidden" id="lcaother_line1${otherloc.address_id}" value="${otherloc.line1}">
                                      <input type="hidden" id="lcaother_line2${otherloc.address_id}" value="${otherloc.line2}">
                                      <input type="hidden" id="lcaother_city${otherloc.address_id}" value="${otherloc.city}">
                                      <input type="hidden" id="lcaother_state${otherloc.address_id}" value="${otherloc.state}">
                                      <input type="hidden" id="lcaother_zipcode${otherloc.address_id}" value="${otherloc.zipcode}">
                                      <input type="hidden" id="lcaother_metro${otherloc.address_id}" value="${otherloc.zipcode}">
                                              
                                       <h4><b>LCA Location Details</b></h4>
											 <div class="form-group row">
											<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Line1</label>
											<div class="col-lg-4">
												<input id="lcaotherline1${otherloc.address_id}" type="text" minlength="2" maxlength="80" required
											    title="Enter address" 
												placeholder="Employee Address" name="lcaotherline1" class="form-control"  value="${otherloc.line1}">
											</div>
										</div>
										
										<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-lg-4">
													<input id="lcaotherline2${otherloc.address_id}" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  
													minlength="2" maxlength="80"
													title="only alpha numerics are allowed" 
													placeholder="line2" name="lcaotherline2" class="form-control"  value="${otherloc.line2}" >
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-lg-4">
													<input id="lcaothercity${otherloc.address_id}" type="text"  minlength="2" maxlength="40" required
													title="only Characters are allowed"  
													placeholder="City" name="lcaothercity" class="form-control"  value="${otherloc.city}">
												</div><!--pattern="^[a-zA-Z\s]+$" " -->
											</div>
										
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-lg-4">
													<input id="lcaotherstate${otherloc.address_id}" type="text"  minlength="2" maxlength="25" value="${otherloc.state}"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="lcaotherstate" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-lg-4">
													<input id="lcaotherzipcode${otherloc.address_id}" type="text"   required
													title="only alphabets are allowed" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													placeholder="Zip Code" name="lcaotherzipcode" class="form-control"  value="${otherloc.zipcode}">
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Metro Politan Area</label>
												<div class="col-lg-4">
													<input id="lcaothermetro${otherloc.address_id}" type="text"   required
													title="only alphabets are allowed" minlength="2" maxlength="25" 
													placeholder="Zip Code" name="lcaothermetro" class="form-control"  value="${otherloc.metrop_area}">
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
								</c:forEach>
								</c:if>	  
								
										 <c:if test="${not empty basicObj.work_authorization}">
										<c:if test="${basicObj.work_authorization=='H-1B'  && empType eq 'W2'}">	  
									    <div class='form-group row' id="add">
                                       <label for="inputPassword" class="col-sm-3 control-label">Add More Locations(LCA)</label>
												<div class="col-xs-4">
													<button type="button" class="btn btn-success addButton addButtonloc">
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                        </div>
                                        </c:if>
                                        </c:if>
									<div id="addOtherLocation" class="form-group" style="display: none;">
													<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												    <div class="col-sm-5">
													    <input id="lca_othr_line1" type="text"  minlength="2" maxlength="80" 
													      autocomplete="off" placeholder="Enter Line1" name="lca_othr_line1[]" class="form-control"  required>
												      </div>
												      <div class="col-xs-4">
													<button type="button" class="btn btn-danger removeButton removeButtonloc">
														<i class="fa fa-minus"></i>
													</button>
												    </div>
											      </div> 
											      	<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;"></Span>Line2</label>
													<div class="col-sm-5">
														<input type="text"
															pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*" minlength="2"
															maxlength="80" title="only alpha numerics are allowed"
															placeholder="Enter Line2" autocomplete="off"
															name="lca_othr_line2[]" id="lca_othr_line2" class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>City</label>
													<div class="col-sm-5">
														<input id="lca_othr_city" type="text" minlength="2"
															maxlength="25" title="only Characters are allowed"
															autocomplete="off" placeholder="City" name="lca_othr_city[]"
															class="form-control" required>
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>State</label>
													<div class="col-sm-5">
														<input id="lca_othr_state" type="text" minlength="2"
															maxlength="25" title="only Characters are allowed"
															autocomplete="off" placeholder="State"
															name="lca_othr_state[]" class="form-control" required>
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Zip Code</label>
													<div class="col-sm-5">
														<input id="lca_othr_zipcode" type="text" pattern="[0-9]{5}"
															minlength="5" maxlength="5"
															title="only digits are allowed" autocomplete="off"
															placeholder="Zip Code" name="lca_othr_zipcode[]"
															class="form-control" required>
													</div>
												</div>
												<div class="form-group row">
														<label for="inputPassword" class="col-lg-3 control-label"><Span
															style="color: red;">*</Span>Metro Politan Area</label>
														<div class="col-sm-5">
															<input id="lca_othr_remote_metro" type="text" minlength="2" maxlength="25" 
															title="only Characters are allowed"
																autocomplete="off" placeholder="Metro Politan Area"
																name="lca_othr_remote_metro[]" class="form-control" required>
														</div>
												</div>
											</div>
									         
										</c:if>
									</c:if>
									
									
									
								
									
									
									<c:forEach var="otherclientlist" items="${otherclientlist}">
                                      <input type="hidden" name="otherclientid" id="otherclientid" value="${otherclientlist.clientid}">
                                      <input type="hidden" id="otherclient_type${otherclientlist.clientid}" value="${otherclientlist.clientType}">
                                      <input type="hidden" id="otherclient_name1${otherclientlist.clientid}" value="${otherclientlist.clientName}">
                                      <input type="hidden" id="otherclient_mgr_name1${otherclientlist.clientid}" value="${otherclientlist.client_mgr}">
                                      <input type="hidden" id="otherclient_mgr_emailid1${otherclientlist.clientid}" value="${otherclientlist.client_mgr_email}">
                                      <input type="hidden" id="othermgrdeskNumber1${otherclientlist.clientid}" value="${otherclientlist.client_mgr_extn}">
                                      <input type="hidden" id="otheremp_emailid1${otherclientlist.clientid}" value="${otherclientlist.emp_email_clent}">
                                      <input type="hidden" id="otherempdeskNumber1${otherclientlist.clientid}" value="${otherclientlist.emp_extn_clent}">
                                     <input type="hidden" id="otherfed_id1${otherclientlist.clientid}" value="${otherclientlist.fed_id}">
                                     <input type="hidden" id="otherline11${otherclientlist.clientid}" value="${otherclientlist.line1}">
                                      <input type="hidden" id="otherline21${otherclientlist.clientid}" value="${otherclientlist.line2}">
                                      <input type="hidden" id="othercity21${otherclientlist.clientid}" value="${otherclientlist.city}">
                                      <input type="hidden" id="otherstate21${otherclientlist.clientid}" value="${otherclientlist.state}">
                                      <input type="hidden" id="otherzipcode21${otherclientlist.clientid}" value="${otherclientlist.zipcode}">
                                              
                                       <h4><b>Layer Details</b></h4>
                                           <div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Select Type of Client</label>
													 <div class="col-lg-4">
														<select class="form-control" id="othrclienttype${otherclientlist.clientid}" 
															name="othrclienttype" placeholder="Select Type of Client" required>
															<option value="">Select Type of Client</option>
															<c:forEach var="clietnType" items="${clietnTypelist}">
															<option value="${clietnType}" ${clietnType == otherclientlist.clientType ? 'selected="selected"' : ''}>${clietnType}</option>
															</c:forEach>
															<!-- <option value="Primary Vendor">Primary Vendor</option>
															<option value="MSP">MSP</option>
															<option value="Implementation Partner">Implementation Partner</option> -->
														</select>
													</div>
										   </div>
                                           <div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;">*</Span>Client Name</label>
												
												<div class="col-lg-4">
													<input id='otherclient_name${otherclientlist.clientid}' type="text" pattern="^[a-zA-Z\s]+$"
														title="only alphabets are allowed" minlength="2" maxlength="100"
														autocomplete="off" placeholder="End Client Name"
														name="otherclient_name" class="form-control" value="${otherclientlist.clientName}"
														required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;"></Span>Federal ID</label>
												<div class="col-lg-4">
												<input  type="text" name="otherfed_id" id="otherfed_id${otherclientlist.clientid}" 
													 placeholder="Federal ID"  class="form-control"  value="${otherclientlist.fed_id}" ></input>
												</div>
											  </div> 

											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;"></Span>Client Manager Name</label>
												<div class="col-lg-4">
													<input id='otherclient_mgr_name${otherclientlist.clientid}' type="text" pattern="^[a-zA-Z\s]+$"
														title="only alphabets are allowed"  minlength="2" maxlength="100"
														autocomplete="off" placeholder="End Client Manager Name"
														name="otherclient_mgr_name" class="form-control" value="${otherclientlist.client_mgr}"
														>
												</div>
											</div>


											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;"></Span>Client Manager e-mail ID</label>
												<div class="col-lg-4">
													<input id='otherclient_mgr_emailid${otherclientlist.clientid}' type="text"
														title="Enter Valid e-mail format ex:xyz@gmail.com" minlength="10" maxlength="80"
														autocomplete="off" placeholder="End Client Manager e-mail ID"
														name="otherclient_mgr_emailid" class="form-control"
														value="${otherclientlist.client_mgr_email}" >
												</div>
											</div>

											<div class="form-group row">
												<label class="col-lg-3 control-label"><Span
													style="color: red;"></Span>Client Manager Desk Extension Number</label>
												<div class="col-lg-4">
													<input class="form-control" id='othermgrdeskNumber${otherclientlist.clientid}'
														autocomplete="off"	title="Enter Desk number"
														value="${otherclientlist.client_mgr_extn}" name="othermgrdeskNumber"   minlength="10" maxlength="12"
														placeholder='Manager Desk Extension Number' type='text'>
												</div>
											</div>



											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;"></Span>Employee e-mail ID At Client
													Location</label>
												<div class="col-lg-4">
													<input id='otheremp_emailid${otherclientlist.clientid}' type="text"
														title="Enter Valid Email format ex:xyz@gmail.com"
														autocomplete="off" minlength="10" maxlength="80"
														placeholder="Employee e-Mail ID at Client Location"
														name="otheremp_emailid" class="form-control"
														value="${otherclientlist.emp_email_clent}">
												</div>
											</div>

											<div class="form-group row">
												<label class="col-lg-3 control-label"><Span
													style="color: red;"></Span>Employee Desk Extension
													Number at Client</label>
												<div class="col-lg-4">
													<input class="form-control" id='otherempdeskNumber${otherclientlist.clientid}'
														autocomplete="off"														
														title="Enter Desk number ex:TIPL-K1-Desk-A00"
														value="${otherclientlist.emp_extn_clent}" name="otherempdeskNumber"
														  minlength="10" maxlength="12"
														placeholder='Enter Employee Client Desk Number'	type='text'>
												</div>
											</div>
											
											 <div class="form-group row">
											<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Line1</label>
											<div class="col-lg-4">
												<input id="otherline1${otherclientlist.clientid}" type="text" minlength="2" maxlength="80" required
											    title="Enter address" 
												placeholder="Employee Address" name="otherline1" class="form-control"  value="${otherclientlist.line1}">
											</div>
										</div>
										
										<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-lg-4">
													<input id="otherline2${otherclientlist.clientid}" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  
													minlength="2" maxlength="80"
													title="only alpha numerics are allowed" 
													placeholder="line2" name="otherline2" class="form-control"  value="${otherclientlist.line2}" >
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-lg-4">
													<input id="othercity${otherclientlist.clientid}" type="text"  minlength="2" maxlength="40" required
													title="only Characters are allowed"  
													placeholder="City" name="othercity" class="form-control"  value="${otherclientlist.city}">
												</div><!--pattern="^[a-zA-Z\s]+$" " -->
											</div>
										
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-lg-4">
													<input id="otherstate${otherclientlist.clientid}" type="text"  minlength="2" maxlength="25" value="${otherclientlist.state}"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="otherstate" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-lg-4">
													<input id="otherzipcode${otherclientlist.clientid}" type="text"   required
													title="only alphabets are allowed" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													placeholder="Zip Code" name="otherzipcode" class="form-control"  value="${otherclientlist.zipcode}">
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
								</c:forEach>
								<div class='form-group row' id="addbtn" style="display:none">
                                       <label for="inputPassword" class="col-lg-3 control-label">Add Layer Details</label>
												<div class="col-xs-4">
													<button type="button"  class="btn btn-success addButton addButtonclient">
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                        </div>
											<div class="form-group" id="addotherclient" style="display:none;">
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Select Type of Client</label>
													 <div class="col-sm-5">
														<select class="form-control" id="othr_client_type" 
															name="othr_client_type[]" placeholder="Select Type of Client" required>
															<option value="">Select Type of Client</option>
															<option value="Primary Vendor">Primary Vendor</option>
															<option value="MSP">MSP</option>
															<option value="Implementation Partner">Implementation Partner</option>
														</select>
													</div>
													<div class="col-xs-4">
													<button type="button" class="btn btn-danger removeButtonclient">
														<i class="fa fa-minus"></i>
													</button>
												    </div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>Client Name</label>
													<div class="col-lg-4">
														<input class="form-control" id="othr_client_name" minlength="2" maxlength="100"
															name="othr_client_name[]" placeholder="Client Name"
															pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
															title="Enter Only alphabets" type="text" required>
													</div>
													<!-- <div class="col-xs-4">
													<button type="button" class="btn btn-danger removeButton">
														<i class="fa fa-minus"></i>
													</button>
												</div> -->
												</div>
												<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;"></Span>Federal ID</label>
												<div class="col-lg-4">
												<input  type="text" name="othr_fed_id[]" id="othr_fed_id" minlength="10" maxlength="10"
													 placeholder="Federal ID"  class="form-control"></input>
												</div>
											     </div> 
												<!-- <div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>Client Address</label>
													<div class="col-lg-4">
														<input class="form-control" id="othr_client_addr"
															name="othr_client_addr[]" placeholder="Client Address"
															title="Enter Only alphabets" type="text" required>
													</div>
												</div> -->
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;"></Span>Client Manager Name</label>
													<div class="col-lg-4">
														<input class="form-control" id="othr_client_mgr" minlength="2" maxlength="100"
															name="othr_client_mgr[]" placeholder="Client Manager Name"
															title="Enter Only alphabets"
															pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
															type="text" >
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;"></Span>Client Manager e-mail ID</label>
													<div class="col-lg-4">
														<input class="form-control" id="othr_client_mgr_email"
															name="othr_client_mgr_email[]" minlength="10" maxlength="80"
															placeholder="Client Manager e-mail ID"
															title="Enter e-mail" type="text" >
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;"></Span>Manager Desk Extension Number</label>
													<div class="col-lg-4">
														<input class="form-control" id="othr_client_mgr_extn"
															name="othr_client_mgr_extn[]"
															placeholder="Manager Desk Extension Number"
															data-masked-input="999-999-9999" minlength="12"
															maxlength="12" title="Enter Only digits" type="text">
													</div>
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;"></Span>Employee e-mail ID At Client
														Location</label>
													<div class="col-lg-4">
														<input class="form-control" id="othr_emp_email_client"
															name="othr_emp_email_client[]" minlength="10" maxlength="80"
															placeholder="Employee e-mail ID AT Client Location"
															title="Enter Only e-mail" type="text">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 control-label"><Span
														style="color: red;"></Span>Employee Client Desk Extension
														Number</label>
													<div class="col-lg-4">
														<input class="form-control" title="Enter Desk number"
															placeholder="Enter Employee Client Desk Number"
															id="othr_emp_client_extn" name="othr_emp_client_extn[]"
															data-masked-input="999-999-9999" minlength="10"
															maxlength="12" name="othr_emp_client_extn">
													</div>
												</div>
												<h4><b>Other Client Address</b></h4>
                                                     <div class="form-group row">
                                                          <label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Line1</label>
                                                          <div class="col-lg-4">
                                                              <input id="othr_line1" type="text"  minlength="2" maxlength="80" 
                                                               autocomplete="off" placeholder="Enter Line1" name="othr_line1[]" class="form-control"  required>
                                                          </div><!-- pattern="^[a-zA-Z\s]+$" -->
                                                     </div>
                                                     
                                                     <div class="form-group row">
                                                          <label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;"></Span>Line2</label>
                                                          <div class="col-lg-4">
                                                              <input id="col-sm-5" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
                                                               title="only alpha numerics are allowed" placeholder="Enter Line2"
                                                              autocomplete="off" name="othr_line2[]" id="othr_line2" class="form-control"  >
                                                          </div>
                                                     </div>
                                                     
                                                     <div class="form-group row">
                                                          <label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>City</label>
                                                          <div class="col-lg-4">
                                                              <input id="othr_city" type="text"  minlength="2" maxlength="25"
                                                               title="only Characters are allowed"  
                                                               autocomplete="off" placeholder="City" name="othr_city[]" class="form-control"  required>
                                                          </div>
                                                     </div>
                                                     <div class="form-group row">
                                                          <label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>State</label>
                                                          <div class="col-lg-4">
                                                              <input id="othr_state" type="text"  minlength="2" maxlength="25"
                                                               title="only Characters are allowed"  
                                                               autocomplete="off" placeholder="State" name="othr_state[]" class="form-control"  required>
                                                          </div>
                                                     </div>
                                                     
                                                     <div class="form-group row">
                                                          <label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
                                                          <div class="col-lg-4">
                                                              <input id="othr_zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
                                                               title="only digits are allowed" 
                                                               autocomplete="off" placeholder="Zip Code" name="othr_zipcode[]" class="form-control"  required>
                                                          </div>
                                                     </div>
											</div>
						
								<%-- <c:if test="${not empty viewcvbean.mgr_apr_mail}">
								<div class="form-group">		
								<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Manager Approved Mail</label>
									<div class="col-lg-2">
									<a href="USOBT_C2C_View_Controller?action=downloadocs&empno=${empobj.emp_number}&filename=${viewcvbean.mgr_apr_mail}&filetype=Manager_Approved_Email" style="color:blue">${viewcvbean.mgr_apr_mail}</a>
									</div>
									</div>
								</c:if> --%>

 
	
										<div class="text-center ml-6" id="sub" style="display:none">										
												<div class="col-lg-4 col-lg-offset-2">	
											<!--	<input type="button" class="btn btn-default" id="submitid" style="padding:7px;" value="Update"  onclick="btnClick()">  -->
												<c:if test="${(emptype eq 'W2 Admin' || emptype eq 'Admin') && (dept==5 || dept == 1) && (role==2 || role==4)}">
												 <%-- <c:if test="${countObj.clientcount eq 0 && countObj.inhousecount eq 0}">
																		<button type="button"  class="btn btn-default" title="Can't update the project,in-house project is active" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" >Update</button>
																		</c:if>
																		<c:if test="${countObj.clientcount gt 0 && countObj.inhousecount eq 0}">
																		<button type="button" id="btnUpdate" class="btn btn-default"  style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" onclick="btnClick()" disabled>Update</button>
																		</c:if>
																			<c:if test="${countObj.clientcount eq 0 && countObj.inhousecount eq 1}">
																		<button type="button"  class="btn btn-default" title="Can't update the client project,in-house project is active" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" disabled>Update</button>
																		</c:if> --%>
																		<button type="button" id="btnUpdate" class="btn btn-default"  style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" onclick="btnClick()">Update</button>
										 		 </c:if>
										 		 <button type="button" id="btngoBack" onclick="goBack()" class="btn btn-default btn-sm" style="padding:7px;background-color:grey;color:white;line-height:0.728571;">Back</button>									
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
			<div class="modal fade" id="addinhouseporejectmodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-sm" style="max-width: 40%;"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b>Add In-house project</b>
								</h5>
							</div>

							<div class="modal-body">
								<form action="/" enctype="multipart/form-data"
									id="addInhouseForm" autocomplete="off">
									<input type="hidden" name="candidateid" id="in_candidateid">
									<input type="hidden" name="emp_type" id="in_emptype">
									<input type="hidden" name="dbdate" id="dbdate">
									<input type="hidden" name="payrateid" id="in_payrateid">
									
									<div class="row">
										<div class="col-md-12 col-sm-12">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red">*</span>Project Name</label>
												<div class="col-sm-6">
													<input type="text" id="in_projectname" name="projectname"
														class="form-control" placeholder="Project Name" />

												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red">*</span> Start Date</label>
												<div class="col-sm-6">
													<input type="text" id="in_startdate" name="in_startdate"
														class="form-control" onkeydown="return true"
														placeholder="Start Date" />
												</div>
											</div>

											<div class="form-group row">
												<label class="col-sm-3 col-form-label"><span
													style="color: red"></span> End Date</label>
												<div class="col-sm-6">
													<input type="text" id="in_enddate"
														name="in_enddate" class="form-control" autocomplete="off"
														onkeydown="return true" placeholder="End Date" />
												</div>
											</div>
											<div class="form-group row">
											<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Timesheet Type</label>
											   <div class="col-sm-6">
											   
											   <select name="payrolltype" class="form-control text-left" id="payrolltype">
										             <option value="">--Select Timesheet Type--</option>
										             <option value="Weekly">Weekly</option>
										             <option value="Bi-Weekly1">Bi-Weekly1</option>
										             <option value="Bi-Weekly2">Bi-Weekly2</option>
										             <option value="Semi-Monthly">Semi-Monthly</option>
										             <option value="Monthly">Monthly</option>
										         </select>
												</div>
										    </div>
											
											<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>Line1</label>
													<div class="col-sm-6">
														<input id="in_line1" type="text" minlength="2"
															maxlength="80" required title="only alpha numerics are allowed"
															placeholder="Line1" name="in_line1"
															class="form-control">
													</div>
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;"></Span>Line2</label>
													<div class="col-sm-6">
														<input id="in_line2" type="text"
															pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*" minlength="2"
															maxlength="80" title="only alpha numerics are allowed"
															placeholder="line2" name="in_line2" class="form-control">
													</div>
													<!-- pattern="^[a-zA-Z\s]+$" -->
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>City</label>
													<div class="col-sm-6">
														<input id="in_city" type="text" minlength="2"
															maxlength="40" required
															title="only Characters are allowed" placeholder="City"
															name="in_city" class="form-control">
													</div>
													<!--pattern="^[a-zA-Z\s]+$" " -->
												</div>
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>State</label>
													<div class="col-sm-6">
														<input id="in_state" type="text" minlength="2"
															maxlength="25" title="only Characters are allowed"
															autocomplete="off" placeholder="State" name="in_state"
															class="form-control" required>
													</div>
													<!-- pattern="^[a-zA-Z\s]+$" -->
												</div>

												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>Zip Code</label>
													<div class="col-sm-6">
														<input id="in_zipcode" type="text" required
															title="only alphabets are allowed" pattern="[0-9]{5}"
															minlength="5" maxlength="5" placeholder="Zip Code"
															name="in_zipcode" class="form-control">
													</div>
													<!-- pattern="^[a-zA-Z\s]+$" -->
												</div>
										</div>
									</div>
									<div class="text-center ml-5">
										<button type="button" class="btn btn-info btn-sm" id="inhousesubmitid">Save</button>
										<button type="button" data-dismiss="modal" class="btn btn-info btn-sm" id="btn-colorb">Close</button>
									</div>
								</form>
								<br />
								<br />
							</div>
						</div>
					</div>
				</div>
			<center><div class="modal fade" id="myModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true" style="top:150px;">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<center>
							 <div class="modal-body">
								<table>
									<tr>
										<th>Bill Rate : </th>
										<td style="padding: 6px;"><strong><span
												style="color:red" id="brate"></span></strong></td>
									</tr>
									<tr>
										<th>Pay Rate : </th>
										<td style="padding: 6px;"><strong><span
												style="color:red" id="prate"></span></strong></td>
									</tr>
								</table> 
							</div>
							<b><span style="color: red">Pay rate is greater than Bill rate. Please confirm again.</span></b>
							</center>
							
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary" onclick="submitForm()">Ok</button>
							</div>
						</div>
					</div>
				</div>
				</center>
				
				
				<center>
		<div class="modal fade" id="DocumentCustomerHistoryModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="top:90px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content" style="width:175%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b></b>
							</h5>
						</center>
					</div>
						<div class="modal-body">							
					   		<table id="customerDocHistoryTable" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>FileName</th>
								<th>FileType</th>								
								<th>Start Date</th>
								<th>End Date</th>
								<th>Submitted On</th>
								<th>Submitted By</th>
								<!-- <th>Status</th>	 -->		
								</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>			   
						</div>
				</div>
			</div>
		</div>
	</center>
	
	<center>
		<div class="modal fade" id="DocumentClientVendorHistoryModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="top:90px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content" style="width:175%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
						<div class="modal-body">							
					   		<table id="ClientVendorDocHistoryTable" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>FileName</th>
								<th>FileType</th>								
								<th>Start Date</th>
								<th>End Date</th>
								<th>Submitted On</th>
								<th>Submitted By</th>
								<!-- <th>Status</th>	 -->		
								</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>			   
						</div>
				</div>
			</div>
		</div>
	</center>
	
	<center>
		<div class="modal fade" id="DocumentClientCustomerHistoryModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="top:90px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content" style="width:175%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b></b>
							</h5>
						</center>
					</div>
						<div class="modal-body">							
					   		<table id="ClientCustomerDocHistoryTable" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>FileName</th>
								<th>FileType</th>								
								<th>Start Date</th>
								<th>End Date</th>
								<th>Submitted On</th>
								<th>Submitted By</th>
								<!-- <th>Status</th>	 -->		
								</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>			   
						</div>
				</div>
			</div>
		</div>
	</center>
	<center>
		<div class="modal fade" id="ProjectDetailsHistoryModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="top:90px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content" style="width:175%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b></b>
							</h5>
						</center>
					</div>
						<div class="modal-body">							
					   		<table id="ProjectDetailsHistoryTable" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>Customer</th>
								<th>Vendor</th>								
								<th>Start Date</th>
								<th>End Date</th>
								<th>Submitted On</th>
								<th>Submitted By</th>
								</tr>
								</thead>
								<tbody>
								</tbody>
							</table>			   
						</div>
				</div>
			</div>
		</div>
	</center>

	<center>
		<div class="modal fade" id="DocumentVendorHistoryModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="top:90px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content" style="width:175%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title"
								style="font-size: 15px">
								<b></b>
							</h5>
						</center>
					</div>
						<div class="modal-body">							
					   		<table id="vendorDocHistoryTable" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>FileName</th>
								<th>FileType</th>
								<th>InputValue</th>									
								<th>Start Date</th>
								<th>End Date</th>
								<th>Submitted On</th>
								<th>Submitted By</th>
								<!-- <th>Status</th>	 -->		
								</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>			   
						</div>
				</div>
			</div>
		</div>
	</center>
	  
	  	<center>
		<div class="modal fade" id="EditDocumentModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 150px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="editClientVendorDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="efileId" name="fileId"> 
						<input type="hidden" id="fromdate1" name="fromdate1"> 
						<input type="hidden" id="expirydate1" name="expirydate1"> 
						<input type="hidden" id="efileType" name="efileType"> 
					    <input type="hidden" id="evenId"name="venId">
					    <input type="hidden" id="vemptype" name="vemptype" value="${empType}"> 
						<input type="hidden" id="eCandidateId" name="eCandidateId" value="${candidate_id}"> 
						 <input type="hidden" id="ecvpayrateid"name="ecvpayrateid">					
						<div class="modal-body">							
					   <div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;"></Span>Upload File :</label>
								<div class="col-lg-6">
									<input type="file" id="editFile" name="editFile"
										class="form-control text-left" onchange="EditValidateSize1(this)"/>
									<span id="efileName" style="color:blue;"></span>
								</div>
					    </div>
					    <div class="form-group row">
					    <label class="col-lg-3 control-label"></label>
							<div class="col-sm-4">
										<input type="text" id="fromdate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="fromdate" placeholder="Start Date" class="form-control"> 
							</div>
						    <div class="col-sm-4">
										<input type="text" id="expirydate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="expirydate" placeholder="End Date" class="form-control"  >
							</div>
						</div>					   
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal">Close</button>
							<button type="submit" id="evsubmitid" class="btn btn-primary btn-sm">Save
								changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</center>
	
	<center>
		<div class="modal fade" id="EditCCADocumentModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 150px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="editClientVendorCCADocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="caefileId" name="cafileId"> 
						<input type="hidden" id="caefileType" name="caefileType"> 
					    <input type="hidden" id="caevenId"name="cavenId">
					    <input type="hidden" id="cavemptype" name="cavemptype" value="${empType}"> 
						<input type="hidden" id="caeCandidateId" name="caeCandidateId" value="${candidate_id}">
						<input type="hidden" id="ccaepayrateid"name="ccaepayrateid"> 	
											
						<div class="modal-body">							
					   <div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;"></Span>Upload File :</label>
								<div class="col-lg-6">
									<input type="file" id="caeditFile" name="caeditFile"
										class="form-control text-left" onchange="ValidateSize(this)"required/>
									<span id="caefileName" style="color:blue;"></span>
								</div>
					    </div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary btn-sm">Save
								changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</center>
	
		<center>
		<div class="modal fade" id="EditCustDocumentModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 150px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="editClientCustomerDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="cefileId" name="cfileId"> 
						<input type="hidden" id="cfromdate1" name="cfromdate1"> 
						<input type="hidden" id="cexpirydate1" name="cexpirydate1"> 
						<input type="hidden" id="cefileType" name="cefileType"> 
						<input type="hidden" id="cemptype" name="cemptype" value="${empType}"> 
						<input type="hidden" id="ceCandidateId" name="ceCandidateId" value="${candidate_id}"> 
	                     <input type="hidden" id="custmid"name="custmid">
	                      <input type="hidden" id="cepayrateid"name="cepayrateid">
	                     
						
						<div class="modal-body">							
					   <div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;"></Span>Upload File :</label>
								<div class="col-lg-6">
									<input type="file" id="ceditFile" name="ceditFile"
										class="form-control text-left" onchange="EditAValidateSize(this)"/>
									<span id="cefileName" style="color:blue;"></span>
								</div>
					    </div>
					    <div class="form-group row">
					    <label class="col-lg-3 control-label"></label>
							<div class="col-sm-4">
										<input type="text" id="cfromdate" class="form-control text-left"     autocomplete="off"
												title="Enter date in MM/DD/YYYY format only" name="cfromdate" placeholder="Start Date" class="form-control" required> 
							</div>
						    <div class="col-sm-4">
										<input type="text" id="cexpirydate" class="form-control text-left"     autocomplete="off"
												title="Enter date in MM/DD/YYYY format only" name="cexpirydate" placeholder="End Date" class="form-control" required>
							</div>
						</div>					   
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal">Close</button>
							<button type="submit" id="ccesubmitid" class="btn btn-primary btn-sm">Save
								changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</center>
	
	<center>
		<div class="modal fade" id="EditCMSGDocumentModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 150px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
					
					<form class='form form-horizontal validate-form'
						action="editMgrMailproofClientCustomerDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="msgefileId" name="msgefileId"> 
						<input type="hidden" id="msgefileType" name="msgefileType"> 
						<input type="hidden" id="msgemptype" name="msgemptype" value="${empType}"> 
						<input type="hidden" id="msgeCandidateId" name="msgeCandidateId" value="${candidate_id}"> 
	                     <input type="hidden" id="msgcustmid"name="msgcustmid">
	                      <input type="hidden" id="msgepayrateid"name="msgepayrateid">
	                     
						<div class="modal-body">							
					   <div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;"></Span>Upload File :</label>
								<div class="col-lg-6" >
									<input type="file" id="msgeditFile" name="msgeditFile"
										class="form-control text-left" accept=".msg,.eml" onchange="ValidateMsgFile(this)" required/>
									<span id="msgefileName" style="color:blue;"></span>
								</div>
					    </div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary btn-sm">Save
								changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</center>
	
	<center>
		<div class="modal fade" id="EditVMSGDocumentModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 150px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
					
					<form class='form form-horizontal validate-form'
						action="editMgrMailproofClientVendorDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="vmsgefileId" name="vmsgefileId"> 
						<input type="hidden" id="vmsgefileType" name="vmsgefileType"> 
						<input type="hidden" id="vmsgemptype" name="vmsgemptype" value="${empType}"> 
						<input type="hidden" id="vmsgeCandidateId" name="vmsgeCandidateId" value="${candidate_id}"> 
	                     <input type="hidden" id="vmsgvenid" name="vmsgvenid">
	                     <input type="hidden" id="vmsgepayrateid" name="vmsgepayrateid">
	                     
						<div class="modal-body">							
					   <div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;"></Span>Upload File :</label>
								<div class="col-lg-6" >
									<input type="file" id="vmsgeditFile" name="vmsgeditFile"
										class="form-control text-left" accept=".msg,.eml" onchange="ValidateMsgFile(this)" required/>
									<span id="vmsgefileName" style="color:blue;"></span>
								</div>
					    </div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary btn-sm">Save
								changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</center>
	  
	  <center>
		<div class="modal fade" id="addVDocumentModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 150px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="addClientVendorDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="afileType" name="afileType"> 
						<input type="hidden" id="aemptype" name="aemptype" value="${empType}"> 
						<input type="hidden" id="aCandidateId" name="aCandidateId" value="${candidate_id}"> 
	                     <input type="hidden" id="avenid" name="avenid">
	                     <input type="hidden" id="apayrateid" name="apayrateid">
						<div class="modal-body">							
					   <div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;"></Span>Upload File :</label>
								<div class="col-lg-6">
									<input type="file" id="aFile" name="aFile"
										class="form-control text-left" onchange="ValidateSize(this)" required/>
								</div>
					    </div>
					    <div class="form-group row">
					    <label class="col-lg-3 control-label"></label>
							<div class="col-sm-4">
										<input type="text" id="afromdate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="afromdate" placeholder="Start Date" class="form-control"> 
							</div>
						    <div class="col-sm-4">
										<input type="text" id="aexpirydate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="aexpirydate" placeholder="End Date" class="form-control"  >
							</div>
						</div>					   
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary btn-sm">Save
								changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</center>
	
	 <center>
		<div class="modal fade" id="addCDocumentModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 150px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="addClientCustomerDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="cafileType" name="cafileType"> 
						<input type="hidden" id="caemptype" name="caemptype" value="${empType}"> 
						<input type="hidden" id="caCandidateId" name="caCandidateId" value="${candidate_id}"> 
	                     <input type="hidden" id="cacustmid" name="cacustmid">
	                     <input type="hidden" id="capayrateid" name="capayrateid">
						<div class="modal-body">							
					   <div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;"></Span>Upload File :</label>
								<div class="col-lg-6">
									<input type="file" id="caFile" name="caFile"
										class="form-control text-left" onchange="ValidateSize(this)" required/>
								</div>
					    </div>
					    <div class="form-group row">
					    <label class="col-lg-3 control-label"></label>
							<div class="col-sm-4">
										<input type="text" id="cafromdate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="cafromdate" placeholder="Start Date" class="form-control" required> 
							</div>
						    <div class="col-sm-4">
										<input type="text" id="caexpirydate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="caexpirydate" placeholder="End Date" class="form-control" required>
							</div>
						</div>					   
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary btn-sm">Save
								changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</center>
	
	<center>
		<div class="modal fade" id="addCCADocumentModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 150px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="addClientVendorCCADocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="ccafileType" name="ccafileType"> 
						<input type="hidden" id="ccaemptype" name="ccaemptype" value="${empType}"> 
						<input type="hidden" id="ccaCandidateId" name="ccaCandidateId" value="${candidate_id}"> 
	                     <input type="hidden" id="ccavenid" name="ccavenid">
	                     <input type="hidden" id="ccapayrateid" name="ccapayrateid">
	                     
						<%-- <input type="hidden" id="avenId" name="avenId" value="${vendetobj.vendObj.vendorid}">  --%>
						<div class="modal-body">				
					   <div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;"></Span>Upload File :</label>
								<div class="col-lg-6">
									<input type="file" id="ccaFile" name="ccaFile"
										class="form-control text-left" onchange="ValidateSize(this)" required/>
								</div>
					    </div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary btn-sm">Save
								changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</center>
	
	<center>
		<div class="modal fade" id="addMailProofDocumentModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 150px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="addMailProofClientVendorDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="msgafileType" name="msgafileType"> 
						<input type="hidden" id="msgaemptype" name="msgaemptype" value="${empType}"> 
						<input type="hidden" id="msgaCandidateId" name="msgaCandidateId" value="${candidate_id}"> 
	                     <input type="hidden" id="msgavenId" name="msgavenid">
	                     <input type="hidden" id="vmsgapayrateid" name="vmsgapayrateid">
	                     
						<div class="modal-body">							
					   <div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;"></Span>Upload File :</label>
								<div class="col-lg-6">
									<input type="file" id="msgaFile" name="msgaFile"
										class="form-control text-left" accept=".msg,.eml" onchange="ValidateMsgFile(this)" required/>
								</div>
					    </div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary btn-sm">Save
								changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</center>
	
	<center>
		<div class="modal fade" id="addMailProofCDocumentModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 150px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="addMailProofClientCustomerDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="cmsgafileType" name="cmsgafileType"> 
						<input type="hidden" id="cmsgaemptype" name="cmsgaemptype" value="${empType}"> 
						<input type="hidden" id="cmsgaCandidateId" name="cmsgaCandidateId" value="${candidate_id}"> 
	                     <input type="hidden" id="cmsgacustmid" name="cmsgacustmid">
	                     <input type="hidden" id="cmsgapayrateid" name="cmsgapayrateid">
	                     
						<div class="modal-body">							
					   <div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;"></Span>Upload File :</label>
								<div class="col-lg-6">
									<input type="file" id="cmsgaFile" name="cmsgaFile"
										class="form-control text-left" accept=".msg,.eml" onchange="ValidateMsgFile(this)" required/>
								</div>
					    </div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary btn-sm">Save
								changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</center>
	
	<div class="modal fade" id="lcadetailsmodal" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog modal-lg" style="max-width: 50%"
									role="document">
									<div class="modal-content">
										<div class="modal-header" style="padding: .5rem;">
											<button class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h5 class="modal-title" id="exampleModalLabel"
												style="font-size: 15px">
												<b>LCA Questionnaire Details</b>
											</h5>
										</div>

										<div class="modal-body">
											<div class="row">
												<div class="col-md-12 col-sm-12">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red"></span>Organization Name</label>
														<div class="col-sm-6">
															<input id="organization" name="organization"
																class="form-control" />
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Candidate
															Name</label>
														<div class="col-sm-6">
															<input id="candiname" name="candiname"
																class="form-control" />

														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red"></span>Education</label>
														<div class="col-sm-6">
															<input id="education" name="education"
																class="form-control" />
														</div>
													</div>

													<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red"></span>Candidate Job Title</label>
														<div class="col-sm-6">
															<input id="jobtitle" name="jobtitle" class="form-control" />
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red"></span>End client Address</label>
														<div class="col-sm-6">
															<input id="endclientaddress" name="endclientaddress"
																class="form-control" />
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red"></span>Working from (Remote/home or
															End Client Location)</label>
														<div class="col-sm-6">
															<input id="remoteaddress" name="remoteaddress"
																class="form-control" />
														</div>
													</div>

													<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red"></span>County</label>
														<div class="col-sm-6">
															<input id="county" name="county" class="form-control" />
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label"><span
															style="color: red"></span>SOC Code</label>
														<div class="col-sm-6">
															<input id="soc" name="soc" class="form-control" />
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
				
				
				<div class="modal fade" id="historymodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width:79%" role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding:.5rem;">
							<button class="close" data-dismiss="modal"
									aria-label="Close"><span aria-hidden="true">&times;</span>
								</button>
									<h5 class="modal-title" id="exampleModalLabel"
										style="font-size: 15px">
										<b>Certificate Details</b>
									</h5>
							</div>
							<div class="modal-body">
									<div class="row">
										<div class="col-md-10 col-sm-12">
										
										<table id="i9fromTable"
											class="table table-hover table-bordered"
											style="text-align: center;">
											<thead>
												<tr>
													<th style="text-align: center">File Name</th>
													<th style="text-align: center">From Date</th>
													<th style="text-align: center">Expiry Date</th>
													
												</tr>
											</thead>
											<tbody>
											<tr>
											<td></td>
											</tr>
												
											</tbody>
										</table>
												</div>
									</div>
									</div>
							</div>
						</div>
					</div>
			</div>
			
				<form action="searchlist" method="post" id="bformid" style="display:none;">
				<input type="text"  name="semp_type"  value="${semp_type}">
				<input type="text" name="susername"  value="${susername}">
  	        	<input type="text"  name="sfullname"  value="${sfullname}">
			    <input type="text"  name="spendingdocs"  value="${spendingdocs}">
			    <input type="text" name="s_subtype"  value="${s_subtype}">
			    <input type="hidden" name="empstatus" value="${sempstatus}">
				</form>
				<!-- <form action="updateProjectStatus" method="post" id="statusformid" style="display:none;">
				<input type="text"  name="payrate_id"  id="spayrateid">
				<input type="text" name="candidate_id" id="scandidate_id">
  				<input type="text"  name="project_status"  id="sprojectstatus">
    			<input type="text"  name="empType"  id="sempType">
				</form> -->
				
		</div>
	</div>	
		<!-- Javascripts-->
<script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="resources/js/js/select2.min.js"></script>
<script src="resources/preDefined/goback.js"></script>
<script>
$('#remote_soc_code').select2({	
    placeholder: "Select Soc Code",
});
/* $('input[type="file"]').change(function(e){
    var fileName = e.target.files[0].name;
    $('#btnUpdate').removeAttr("disabled");
}); */

$('#bill_rate').on('keyup', function() {
	 if($('#bill_rate').val()==$('#bill_rate1').val())
	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
 });
 
 $('#invoice_terms').on('change', function() {
	 if($('#invoice_terms').val()==$('#invoice_terms1').val())
	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
 });
 
 $('#pro_startdate').on('change', function() {
	 if($('#pro_startdate').val()==$('#pro_startdate1').val())
	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
 });
 
 $('#pro_enddate').on('change', function() {
	 if($('#pro_enddate').val()==$('#pro_enddate1').val())
	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
 });
 $('#payrolltype').on('change', function() {
	 if($('#payrolltype').val()==$('#payrolltype1').val())
	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
 });
 
 
 $('#pay_rate').on('keyup', function() {
	 if($('#pay_rate').val()==$('#pay_rate1').val())
	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
 });
 
 $('#payment_terms').on('keyup', function() {
	 if($('#payment_terms').val()==$('#payment_terms1').val())
	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
 });
 
 $('#bill_rate').on('keyup', function() {
	 if($('#bill_rate').val()==$('#bill_rate1').val())
	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
 });
 
 $('#projectName').on('keyup', function() {
 	 if($('#projectName').val()==$('#projectName1').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 $('#endclient_name').on('keyup', function() {
 	 if($('#endclient_name').val()==$('#endclient_name1').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 
 $('#endclient_mgr_name').on('keyup', function() {
 	 if($('#endclient_mgr_name').val()==$('#endclient_mgr_name1').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 
 $('#endclient_mgr_emailid').on('keyup', function() {
 	 if($('#endclient_mgr_emailid').val()==$('#endclient_mgr_emailid1').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 
 $('#endmgrdeskNumber').on('keyup', function() {
 	 if($('#endmgrdeskNumber').val()==$('#endmgrdeskNumber1').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 
 $('#endemp_emailid').on('keyup', function() {
 	 if($('#endemp_emailid').val()==$('#endemp_emailid1').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 
 $('#endempdeskNumber').on('keyup', function() {
 	 if($('#empdeskNumber').val()==$('#empdeskNumber1').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 
 $('#endfed_id').on('keyup', function() {
 	 if($('#endfed_id').val()==$('#endfed_id1').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 $('#endline1').on('keyup', function() {
 	 if($('#endline1').val()==$('#endline11').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 $('#endline2').on('keyup', function() {
 	 if($('#endline2').val()==$('#endline21').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 
 $('#endcity').on('keyup', function() {
 	 if($('#endcity').val()==$('#endcity21').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 $('#endstate').on('keyup', function() {
 	 if($('#endstate').val()==$('#endstate21').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 $('#endzipcode').on('keyup', function() {
 	 if($('#endzipcode').val()==$('#endzipcode21').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 
 $('#remote_line1').on('keyup', function() {
 	 if($('#remote_line1').val()==$('#remote_line11').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 $('#remote_line2').on('keyup', function() {
 	 if($('#remote_line2').val()==$('#remote_line21').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 
 $('#remote_city').on('keyup', function() {
 	 if($('#remote_city').val()==$('#remote_city21').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 $('#remote_state').on('keyup', function() {
 	 if($('#remote_state').val()==$('#remote_state21').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 $('#remote_zipcode').on('keyup', function() {
 	 if($('#remote_zipcode').val()==$('#remote_zipcode21').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 $('#remote_county').on('keyup', function() {
 	 if($('#remote_county').val()==$('#remote_county1').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 $('#remote_soc_code').on('change', function() {
 	 if($('#remote_soc_code').val()==$('#remote_soc_code1').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
     
 
 $('#reason_lca').on('change', function() {
 	 if($('#reason_lca').val()==$('#reason_lca1').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 $('#cand_job_title').on('keyup', function() {
 	 if($('#cand_job_title').val()==$('#cand_job_title1').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
 
 $('#education').on('keyup', function() {
 	 if($('#education').val()==$('#education1').val())
 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
   });
/*  $("input[name='workinglocation']").on('click', function() {
	    if($("input[name='workinglocation']:checked").val()==$('#workinglocation1').val())
		{
	    	document.getElementById('submitid').disabled=true;
		}else if($("input[name='workinglocation']:checked").val()!=$('#workinglocation1').val()){
			document.getElementById('submitid').disabled=false;
			}
   }); */
   
   $("[id='lcaother_addr_id']").each(function(){
		    var lid=$(this).val();
		 $('#lcaotherline1'+lid).on('keyup', function() {
			// alert($('#lcaotherline1'+lid).val()+"*****"+$('#lcaother_line1'+lid).val())
		 	 if($('#lcaotherline1'+lid).val()==$('#lcaother_line1'+lid).val())
		 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
		   });
		 $('#lcaotherline2'+lid).on('keyup', function() {
		 	 if($('#lcaotherline2'+lid).val()==$('#lcaother_line2'+lid).val())
		 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
		   });
		 
		 $('#lcaothercity'+lid).on('keyup', function() {
		 	 if($('#lcaothercity'+lid).val()==$('#lcaother_city'+lid).val())
		 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
		   });
		 $('#lcaotherstate'+lid).on('keyup', function() {
		 	 if($('#lcaotherstate'+lid).val()==$('#lcaother_state'+lid).val())
		 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
		   });
		 $('#lcaotherzipcode'+lid).on('keyup', function() {
		 	 if($('#lcaotherzipcode'+lid).val()==$('#lcaother_zipcode'+lid).val())
		 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
		   });
		 $('#lcaothermetro'+lid).on('change', function() {
		 	 if($('#lcaothermetro'+lid).val()==$('#lcaother_metro'+lid).val())
		 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
		   });
		 
   }); 	 
 $("[id='otherclientid']").each(function(){
	 var id=$(this).val();
	 $('#otherclient_name'+id).on('keyup', function() {
	 	 if($('#otherclient_name'+id).val()==$('#otherclient_name1'+id).val())
	 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
	   });
	 
	 $('#otherclient_mgr_name'+id).on('keyup', function() {
	 	 if($('#otherclient_mgr_name'+id).val()==$('#otherclient_mgr_name1'+id).val())
	 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
	   });
	 
	 $('#otherclient_mgr_emailid'+id).on('keyup', function() {
	 	 if($('#otherclient_mgr_emailid'+id).val()==$('#otherclient_mgr_emailid1'+id).val())
	 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
	   });
	 
	 $('#othermgrdeskNumber'+id).on('keyup', function() {
	 	 if($('#othermgrdeskNumber'+id).val()==$('#othermgrdeskNumber1'+id).val())
	 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
	   });
	 
	 $('#otheremp_emailid'+id).on('keyup', function() {
	 	 if($('#otheremp_emailid'+id).val()==$('#otheremp_emailid1'+id).val())
	 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
	   });
	 
	 $('#otherempdeskNumber'+id).on('keyup', function() {
	 	 if($('#otherempdeskNumber'+id).val()==$('#otherempdeskNumber1'+id).val())
	 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
	   });
	 
	 $('#otherfed_id'+id).on('keyup', function() {
	 	 if($('#otherfed_id'+id).val()==$('#otherfed_id1'+id).val())
	 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
	   });
	 $('#otherline1'+id).on('keyup', function() {
	 	 if($('#otherline1'+id).val()==$('#otherline11'+id).val())
	 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
	   });
	 $('#otherline2'+id).on('keyup', function() {
	 	 if($('#otherline2'+id).val()==$('#otherline21'+id).val())
	 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
	   });
	 
	 $('#othercity'+id).on('keyup', function() {
	 	 if($('#othercity'+id).val()==$('#othercity21'+id).val())
	 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
	   });
	 $('#otherstate'+id).on('keyup', function() {
	 	 if($('#otherstate'+id).val()==$('#otherstate21'+id).val())
	 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
	   });
	 $('#otherzipcode'+id).on('keyup', function() {
	 	 if($('#otherzipcode'+id).val()==$('#otherzipcode21'+id).val())
	 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
	   });
	 $('#othrclienttype'+id).on('change', function() {
	 	 if($('#othrclienttype'+id).val()==$('#otherclient_type'+id).val())
	 	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
	   });
	/*  var otherclient_type=$("#otherclient_type"+id).val();
	 if(otherclient_type!=""){
	 	//$('#othrclienttype'+id).eq(otherclient_type).prop('selected', true);
	  		var $dropdown2 = $("select[name='othrclienttype']");
			 $dropdown2.find('option[value="' + otherclient_type + '"]').attr('selected', true);
	 	//$dropdown1.find('option[value="' + otherclient_type + '"]').attr('selected', true); 
	 } */
 });
 
</script>
<script>

//$("#bid").hide();
//$('#editcl').hide(); 
//function editclient_info() {
	var emp_type= $('#emp_type').val();
  /*   document.getElementById('invoice_terms').removeAttribute('readonly');
    document.getElementById('bill_rate').removeAttribute('readonly');
    document.getElementById('pro_startdate').removeAttribute('readonly');
    document.getElementById('pro_enddate').removeAttribute('readonly');
 */ //$("#f1").show();
    $("#clnt").show();
    $("#addbtn").show();
   	$("#sub").show();
    $("#cust").hide();
    var joiningdate=$( "#joiningdate" ).val();
	    var dates = new Date(joiningdate);
	   dates.setDate(dates.getDate());
	     $("#pro_startdate").datepicker({
	    	  format: "mm/dd/yyyy",
	    	  startDate: dates,
	    	  minDate: dates
		})
    /* $("#pro_startdate").datepicker({
			changeMonth:true,
			changeYear:true,
		}) */
      .on('changeDate', function(e) {
          $('#updateClientVendorForm').formValidation('revalidateField', 'pro_startdate');
          $('#pro_enddate').datepicker('setStartDate', new Date($(this).val()));
      });
      
      /* $("#pro_enddate").datepicker({
			changeMonth:true,
			changeYear:true,
			
		}) */
		var startdate=$("#pro_startdate").val();
	    var sdates = new Date(startdate);
	    sdates.setDate(sdates.getDate());
     
  $("#pro_enddate").datepicker({
		/* changeMonth:true,
		changeYear:true, */
		  format: "mm/dd/yyyy",
    	  startDate: sdates,
    	  minDate:sdates
		
	})
      .on('changeDate', function(e) {
          $('#updateClientVendorForm').formValidation('revalidateField', 'pro_enddate');
          $('#pro_startdate').datepicker('setEndDate', new Date($(this).val()));
      });      
    if(emp_type=='C2C'){
   // document.getElementById('pay_rate').removeAttribute('readonly');
   // document.getElementById('payment_terms').removeAttribute('readonly');
    //$("#f2").show();
   // $("#f3").show();
   // $("#f4").show();
    $("#ven").show();
    }
    $("#clnt").show();
 	$("#sub").show();
    $("#cust").hide();
    $('#edit').hide();
    $("#bid").show();
//}
 </script>
 <script type="text/javascript">
  function editclient(id) {
 	 var emp_type= $('#emp_type').val();
  	 document.getElementById('client_name'+id).removeAttribute('readonly'); 
    // document.getElementById('client_address'+id).removeAttribute('readonly');
     document.getElementById('client_mgr_name'+id).removeAttribute('readonly');
     document.getElementById('client_mgr_emailid'+id).removeAttribute('readonly');
     document.getElementById('mgrdeskNumber'+id).removeAttribute('readonly');
     document.getElementById('emp_emailid'+id).removeAttribute('readonly');
     document.getElementById('empdeskNumber'+id).removeAttribute('readonly');
     $("#sub").show();
     $("#cust").hide();
    $('#editclient'+id).hide(); 
 }
 </script>
<script type="text/javascript">
var othercl = 0;
var MAX_OPTIONS = 2;
var otherloc=0;
var MAXOPTIONS = 3;
$('#updateClientVendorForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {	 
    	project_name: {
            validators: {
            	isEmpty: {
                    message: 'Project Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 50,
                    message: 'Project Name must be more than 2 and less than 20 characters long.'
                },
                regexp: {
                   regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                    message: ' Project Name accepts alphabets and spaces. Spaces are not allowed at the beginning or end of the Name'
                }
            }
        }, 
    	endclient_name: {
            validators: {
            	notEmpty: {
                    message: 'End Client Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 20,
                    message: 'End Client Name must be more than 2 and less than 20 characters long'
                },
                regexp: {
                	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                     message: 'End Client Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                }
            }
        },
       /*  client_address: {
            validators: {
            	notEmpty: {
                    message: 'End Client Address is mandatory'
                }
            }
        }, */
        endline1 : {
            validators: {
            	 notEmpty: {
                    message: 'Line1 is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line1 should have minimum 2 and maximum 80 characters '
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 accepts alpha numerics '
                },
            }
        },
        endcity : {
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
                   message: 'City accepts alphanumerics'
                },
            }
        },
        endstate : {
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
                },
            }
        },
        endzipcode : {
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
                },
            }
        },
        endfed_id : {
            validators: {
            	 /* notEmpty: {
                    message: 'Federal ID is mandatory'
                }, */
                stringLength: {
                    min: 10,
                    max: 10,
                    message: 'Federal ID should be 9 digits'
                },
                regexp: {
             	   regexp: /^([07][1-7]|1[0-6]|2[0-7]|[35][0-9]|[468][0-8]|9[0-589])-\d{7}$/,
                    message: 'Please enter valid Federal ID'
                }
            }
        },
        endclient_mgr_name: {
            validators: {
            	/* notEmpty: {
                    message: 'End Client Manager Name is mandatory'
                }, */
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'End Client Manager Name must be more than 2 and less than 100 characters long'
                },
                regexp: {
                	 regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                    message: 'End Client Manager Name accepts alphabets and Space allowed but is not at beginning or end of the word'
                }
            }
        },
        endclient_mgr_emailid:{
            validators: {
            	/* notEmpty: {
                    message: 'End Client Manager Email is mandatory'
            	 }, */
                 stringLength: {
                 min: 10,
                 max: 80,
                 message: 'End Client Manager Email must be more than 10 and less than 80 characters long'
                },
                  regexp: {
             	regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
                 message: 'Please enter valid e-mail ID'
             }
           }
      }, 
      endmgrdeskNumber:{
          validators: {
        	  isEmpty: {
                  message: 'End Client Manager Desk Number is Not mandatory'
          	 },
               stringLength: {
               min: 12,
               max: 12,
               message: 'End Client Manager Desk Number must be more 10 or Not less than 10 Numbers long'
              }
          }
      },
      endemp_emailid:{
          validators: {
          	 isEmpty: {
                  message: 'Employee e-mail ID at Client Location is mandatory'
          	 },
               stringLength: {
               min: 10,
               max: 80,
               message: 'Employee e-mail ID at Client Location must be more than 10 and less than 80 characters long'
              },
                regexp: {
           	regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
               message: 'Please enter valid e-mail ID'
           }
         }
    }, 
    endempdeskNumber:{
        validators: {
        	isEmpty: {
                message: 'Employee Desk Number at Client Location is Not mandatory'
        	 },
             stringLength: {
             min: 12,
             max: 12,
             message: 'Employee Desk Number at Client Location must be more 10 or Not less than 10 Numbers long'
            }
        }
     },
   othrclienttype:{
         validators: {
	           	notEmpty: {
	                   message: 'Please select Type of client '
	               }
	           }
	},
 	otherclient_name: {
        validators: {
        	notEmpty: {
                message: 'Other Client Name is mandatory'
            },
            stringLength: {
                min: 2,
                max: 20,
                message: 'Other Client Name must be more than 2 and less than 20 characters long'
            },
            regexp: {
            	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                 message: 'Other Client Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
            }
        }
    },
   /*  client_address: {
        validators: {
        	notEmpty: {
                message: 'End Client Address is mandatory'
            }
        }
    }, */
    otherline1 : {
        validators: {
        	 notEmpty: {
                message: 'Line1 is mandatory'
            },
            stringLength: {
                min: 2,
                max: 80,
                message: 'Line1 should have minimum 2 and maximum 80 characters '
            },
            regexp: {
            regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
              message: 'Line1 accepts alpha numerics '
            },
        }
    },
    othercity : {
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
               message: 'City accepts alphanumerics'
            },
        }
    },
    otherstate : {
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
            },
        }
    },
    otherzipcode : {
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
            },
        }
    },
    otherfed_id : {
        validators: {
        	 /* notEmpty: {
                message: 'Federal ID is mandatory'
            }, */
            stringLength: {
                min: 10,
                max: 10,
                message: 'Federal ID should be 9 digits'
            },
            regexp: {
         	   regexp: /^([07][1-7]|1[0-6]|2[0-7]|[35][0-9]|[468][0-8]|9[0-589])-\d{7}$/,
                message: 'Please enter valid Federal ID'
            }
        }
    },
    otherclient_mgr_name: {
        validators: {
        	/* notEmpty: {
                message: 'Other Client Manager Name is mandatory'
            }, */
            stringLength: {
                min: 2,
                max: 100,
                message: 'Other Client Manager Name must be more than 2 and less than 100 characters long'
            },
            regexp: {
            	 regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                message: 'Other Client Manager Name accepts alphabets and and Space allowed but is not at beginning or end of the word'
            }
            
        }
    
    },
    otherclient_mgr_emailid:{
        validators: {
        	/* notEmpty: {
                message: 'Other Client Manager Email is mandatory'
        	 }, */
             stringLength: {
             min: 10,
             max: 80,
             message: 'Other Client Manager Email must be more than 10 and less than 80 characters long'
            },
              regexp: {
         	regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
             message: 'Please enter valid e-mail ID'
         }
       }
  }, 
  othermgrdeskNumber:{
      validators: {
    	  isEmpty: {
              message: 'Other Client Manager Desk Number is Not mandatory'
      	 },
           stringLength: {
           min: 12,
           max: 12,
           message: 'Other Client Manager Desk Number must be more 10 or Not less than 10 Numbers long'
          }
      }
  },
  otheremp_emailid:{
      validators: {
      	 /* isEmpty: {
              message: 'Employee e-mail ID at Client Location is mandatory'
      	 }, */
           stringLength: {
           min: 10,
           max: 80,
           message: 'Employee e-mail ID at Client Location must be more than 10 and less than 80 characters long'
          },
            regexp: {
       	regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
           message: 'Please enter valid e-mail ID'
       }
     }
}, 
otherempdeskNumber:{
    validators: {
    	isEmpty: {
            message: 'Employee Desk Number at Client Location is Not mandatory'
    	 },
         stringLength: {
         min: 12,
         max: 12,
         message: 'Employee Desk Number at Client Location must be more 10 or Not less than 10 Numbers long'
        }
    }
 },
     customertype:{
         validators: {
         	notEmpty: {
                 message: 'Please select Customer'
             }
         }
     },
     vendortype:{
         validators: {
         	notEmpty: {
                 message: 'Please select Vendor'
             }
         }
     },
  invoice_terms:{
            validators: {
            	notEmpty: {
                    message: 'Invoice Terms is required.'
            	 },
                 regexp: {
                	 regexp: /^[a-zA-Z0-9]+( [a-zA-Z0-9]+)*$/,
                 message: 'Payment Terms accepts alphanumerical and Space allowed but is not at beginning or end of the word'
                  }
               }
           },
   invoice_period:{
               validators: {
               	notEmpty: {
                       message: 'Invoice Period mandatory'
                   }
               }
           },
        bill_rate:{
            validators: {
               notEmpty: {
                    message: 'Bill Rate is mandatory'
                },
            stringLength: {
                min: 2,
                max: 7,
                message: 'Pay Rate must be 2 digits and less than 7 digits long'
               },
            regexp: {
            	//regexp: /^(?:(?:0|[1-9][0-9]+\.[0-9]{2}))$/,
            	regexp: /^[1-9][0-9]*([.][0-9]{1,2}|)$/,
                message: 'Bill Rate accepts digits and max two decimals'
             }
          }
       },
       pro_startdate:{ 
           validators: {
           	notEmpty: {
                   message: 'Project Start Date is mandatory'
               },
               date: {
                   format: 'MM/DD/YYYY',
                   message: 'invalid Date'
               }
           }
       },
       
       pro_enddate:{
           validators: {
           	notEmpty: {
                   message: 'Project End Date is mandatory'
               },
               date: {
                   format: 'MM/DD/YYYY',
                   message: 'invalid Date'
               }
           }
       },
       payrolltype:{
           validators: {
           	notEmpty: {
                   message: 'Please Choose timesheet type'
               }
           }
       },
       payment_terms:{
           validators: {
           	notEmpty: {
                   message: 'Payment Terms is mandatory'
           	 },
                regexp: {
                	 regexp: /^[a-zA-Z0-9]+( [a-zA-Z0-9]+)*$/,
                message: 'Payment Terms accepts alphabets and Space allowed but is not at beginning or end of the word'
                 }
              }
          },
        pay_rate:{
              validators: {
                 notEmpty: {
                      message: 'Pay Rate is mandatory'
              },
           stringLength: {
                  min: 2,
                  max: 7,
                  message: 'Pay Rate must be 2 digits and less than 7 digits long'
                 },
                regexp: {
              	//regexp: /^(?:(?:0|[1-9][0-9]+\.[0-9]{2}))$/,
              	regexp: /^[1-9][0-9]*([.][0-9]{1,2}|)$/,
                message: 'Pay Rate accepts digits and max two decimals'
              }
            }
         },
      cw_order:{
    	  enabled: false,
             validators: {
          	   notEmpty: {
                     message: 'Customer Work Order is mandatory'
                 }
              }
          },
          mgr_approved_mail_CWO:{  
        	  enabled: false,
              validators: {
            	  notEmpty: {
                      message: 'Manager Approved e-mail proof is mandatory'
                  }/* ,
                file: {
					        extension: 'msg',
                            type: 'application/msg',
   					        maxSize: 50*1024*1024,
  					        message: 'The selected file is not valid or file size greater than 50MB'
                     }  */
                }
          },
          w_order:{
        	  enabled: false,
              validators: {
              	notEmpty: {
                      message: 'Vendor Work Order is mandatory'
                  }
               }
           },
           cagreement:{
        	   enabled: false,
               validators: {
              	 notEmpty: {
                       message: 'Consultant Compliance is mandatory'
                   }
                }
            },
            cCompliance:{
            	enabled: false,
                validators: {
              	  notEmpty: {
                        message: ' Consultant Consent Agreement is mandatory'
                    }
                 }
            },
            mgr_approved_mail_VWO:{
            	enabled: false,
                validators: {
              	  notEmpty: {
                        message: 'Manager Approved e-mail proof is mandatory'
                    }/* ,
                  file: {
  					        extension: 'msg',
                              type: 'application/msg',
     					        maxSize: 50*1024*1024,
    					        message: 'The selected file is not valid or file size greater than 50MB'
                       }  */
                  }
            },
            cwofromdate: {
            	enabled: false,
	            validators: {
	            	 notEmpty: {
	   	                    message: 'Start Date is mandatory'
	   	                },
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
	        cwoexpirydate: {
	        	enabled: false,
	            validators: {
	            	 notEmpty: {
	   	                    message: 'End Date is mandatory'
	   	                },
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
	        vwofromdate: {
	        	enabled: false,
	            validators: {
	            	 notEmpty: {
	   	                    message: 'Start Date is mandatory'
	   	                },
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
	        vwoexpirydate: {
	        	enabled: false,
	            validators: {
	            	 notEmpty: {
	   	                    message: 'End Date is mandatory'
	   	                },
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
	        ccfromdate: {
    	   		enabled: false,
	   	            validators: {
	   	                notEmpty: {
	   	                    message: 'Start Date is mandatory'
	   	                },
	   	                regexp: {
	   	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	   	                    message: 'please enter Start Date in MM/DD/YYYY format. '
	   	                },
	   	                date: {
	   	                    format: 'MM/DD/YYYY', 
	   	                    message: 'Start Date is not a valid, please enter in MM/DD/YYYY format'
	   	                }
	   	            }
	   	        },
	   	     ccexpirydate: {
	   	    	enabled: false,
	   	            validators: {
	   	                 notEmpty: {
	   	                    message: 'End Date is mandatory'
	   	                },
	   	                regexp: {
	   	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	   	                    message: 'please enter End Date in MM/DD/YYYY format. '
	   	                },
	   	                date: {
	   	                    format: 'MM/DD/YYYY', 
	   	                    message: 'End Date is not a valid, please enter in MM/DD/YYYY format'
	   	                }
	   	            }
	   	        }, 
	   'othr_client_type[]':{
		          validators: {
		           	notEmpty: {
		                   message: 'Please select Type of client '
		               }
		           }
		       },        
        'othr_client_name[]': {
        	  validators: {
	              	notEmpty: {
	                      message: 'End Client Name is mandatory'
	                  },
	                  stringLength: {
	                      min: 2,
	                      max: 100,
	                      message: 'End Client Name must be more than 2 and less than 100 characters long'
	                  },
	                  regexp: {
	                	  regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
	                      message: 'End Client Name accepts alphabets and Space allowed but is not at beginning or end of the word'
	                  }
	              }
	          },
	          'othr_fed_id[]': {
	               validators: {
	               	/* notEmpty: {
	                       message: 'Federal ID is mandatory'
	                   }, */
	                 stringLength: {
	                       min: 10,
	                       max: 10,
	                       message: 'Federal ID should be 9 digits'
	                   },
	                   regexp: {
	                	   regexp: /^([07][1-7]|1[0-6]|2[0-7]|[35][0-9]|[468][0-8]|9[0-589])-\d{7}$/,
	                       message: 'Please enter valid Federal ID'
	                   }  
	               }
	           },
	           'othr_client_mgr[]': {
	               validators: {
	            	   isEmpty: {
	                       message: 'End Client Manager Name is mandatory'
	                   },
	                   stringLength: {
	                       min: 2,
	                       max: 100,
	                       message: 'End Client Manager Name must be more than 2 and less than 100 characters long'
	                   },
	                   regexp: {
	                	   regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
	                       message: 'End Client Manager Name accepts alphabets and Space allowed but is not at beginning or end of the word'
	                   }
	                   
	               }
	           
	           },
	          'othr_client_mgr_email[]':{
	               validators: {
	            	   isEmpty: {
	                       message: 'End Client Manager e-mail ID is mandatory'
	               	 },
	                    stringLength: {
	                    min: 10,
	                    max: 80,
	                    message: 'End Client Manager e-mail must be more than 10 and less than 80 characters long'
	                   },
	                     regexp: {
	                	regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
	                    message: 'Please enter valid Email ID'
	                }
	              }
	         }, 
	         'othr_client_mgr_extn[]':{
	             validators: {
	           	  isEmpty: {
	                     message: 'End Client Manager Desk Number is Not mandatory'
	             	 },
	                  stringLength: {
	                  min: 12,
	                  max: 12,
	                  message: 'End Client Manager Desk Number must be more 10 or Not less than 10 Numbers long'
	                 }
	             }
	         },
	         'othr_emp_email_client[]':{
	             validators: {
	             	isEmpty: {
	                     message: 'Employee Email ID at Client Location is mandatory'
	             	 }, 
	                  stringLength: {
	                  min: 10,
	                  max: 80,
	                  message: 'Employee e-mail ID at Client Location must be more than 10 and less than 80 characters long'
	                 },
	                   regexp: {
	              	regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
	                  message: 'Please enter valid e-mail ID'
	              }
	            }
	       }, 
	       'othr_emp_client_extn[]':{
	           validators: {
	           	isEmpty: {
	                   message: 'Employee Desk Number at Client Location is Not mandatory'
	           	 },
	                stringLength: {
	                min: 12,
	                max: 12,
	                message: 'Employee Desk Number at Client Location must be more 10 or Not less than 10 Numbers long'
	               }
	           }
	        },
	        'othr_line1[]' : {
                validators: {
                   notEmpty: {
                        message: 'Line1 is mandatory'
                    },
                    stringLength: {
                        min: 2,
                        max: 80,
                        message: 'Line1 should have minimum 2 and maximum 80 characters '
                    },
                    regexp: {
                    regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                      message: 'Line1 accepts alpha numerics '
                    },
                }
            },
            'othr_city[]' : {
                validators: {
                  notEmpty: {
                        message: 'City is mandatory'
                    },
                    stringLength: {
                       min: 2,
                        max: 25,
                        message: 'City should have minimum 2 and maximum 25 characters'
                    },
                    regexp: {
                       regexp: /^[a-zA-Z\s]+$/,
                       message: 'City accepts alphanumerics'
                    },
                }
            },
            'othr_state[]' : {
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
                    },
                }
            },
            'othr_zipcode[]' : {
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
                    },
                }
            },
            organization_name : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Organization Name is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Organization Name should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Organization Name accepts alpha numerics '
	                },
	            }
	        }, 
	        education : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Education is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Education should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Education accepts alpha numerics '
	                },
	            }
	        },
	        cand_job_title : {
	            validators: {
	            	notEmpty: {
	                    message: 'Job Title is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 100,
	                    message: 'Job Title min length 4 and max length 20 '
	                },
	                regexp: {
	                	regexp: /^(?!\d\s+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &():\/\\-]*)?$/,
	                    message: 'Job Title accepts alphanumeric, specical characters like &-()/: allowed and Space allowed but is not at beginning or end of the word'
	                },
	            }
	        },
	        remote_county : {
	            validators: {
	            	notEmpty: {
	                    message: 'County is mandatory'
	                },
	                stringLength: {
	                    min: 4,
	                    max: 20,
	                    message: 'County min length 4 and max length 20 '
	                },
	                regexp: {
	                	regexp: /[a-zA-Z]/,
	                    message: 'County accepts character'
	                },
	            }
	        },
	        remote_soc_code : {
	            validators: {
	            	notEmpty: {
	                    message: 'Soc Code is mandatory'
	                }/* ,
	                stringLength: {
	                    min: 7,
	                    max: 7,
	                    message: 'Soc Code must be 6 digits'
	                },
	                regexp: {
	                	regexp: /[0-9]{2}-[0-9]{4}/,
	                    message: 'Soc Code accepts digits'
	                }, */
	            }
	        },
	        metro_politan_area : {
	            validators: {
	            	notEmpty: {
	                    message: 'MetroPolitan Area is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'MetroPolitan Area should have 2 characters'
	                },
	                regexp: {
	                   regexp: /^[a-zA-Z]+(-[a-zA-Z]+)*$/,
	                   message: 'MetroPolitan Area accepts characters'
	                },
	            }
	        },
	        remote_line1 : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Line1 is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Line1 should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Line1 accepts alpha numerics '
	                },
	            }
	        },
	        remote_city : {
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
	                   message: 'City accepts alphanumerics'
	                },
	            }
	        },
	        remote_state : {
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
	                },
	            }
	        },
	        remote_zipcode : {
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
	                },
	            }
	        },  
            nremote_line1 : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Line1 is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Line1 should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Line1 accepts alpha numerics '
	                },
	            }
	        },
	        nremote_city : {
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
	                   message: 'City accepts alphanumerics'
	                },
	            }
	        },
	        nremote_state : {
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
	                },
	            }
	        },
	        nremote_zipcode : {
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
	                },
	            }
	        },
	        lcaotherline1 : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Line1 is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Line1 should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Line1 accepts alpha numerics '
	                },
	            }
	        },
	        lcaotherline2 : {
	            validators: {
	            	 isEmpty: {
	                    message: 'Line2 is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Line2 should have minimum 2 and maximum 80 characters '
	                }
	            }
	        },
	        lcaothercity : {
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
	                   message: 'City accepts alphanumerics'
	                },
	            }
	        },
	        lcaotherstate : {
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
	                },
	            }
	        },
	        lcaotherzipcode : {
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
	                },
	            }
	        },
	        lcaothermetro : {
	            validators: {
	            	notEmpty: {
	                    message: 'MetroPolitan Area is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'MetroPolitan Area should have 2 characters'
	                },
	                regexp: {
	                	//regexp: /^[a-zA-Z\s]+$/,
	                   regexp: /^[a-zA-Z]+(-[a-zA-Z]+)*$/,
	                   message: 'MetroPolitan Area accepts characters'
	                },
	            }
	        },
	        'lca_othr_line1[]' : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Line1 is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Line1 should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Line1 accepts alpha numerics '
	                },
	            }
	        },
	        'lca_othr_line2[]' : {
	            validators: {
	            	 isEmpty: {
	                    message: 'Line2 is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Line2 should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Line2 accepts alpha numerics '
	                },
	            }
	        },
	        'lca_othr_city[]' : {
	            validators: {
	            	notEmpty: {
	                    message: 'City is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'City should have minimum 2 and maximum 25 characters'
	                },
	                regexp: {
	                	regexp: /^[a-zA-Z\s]+$/,
	                   message: 'City accepts alphanumerics'
	                },
	            }
	        },
	        'lca_othr_state[]' : {
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
	                },
	            }
	        },
	        'lca_othr_zipcode[]' : {
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
	                },
	            }
	        },
	    'lca_othr_remote_metro[]' : {
	            validators: {
	            	notEmpty: {
	                    message: 'MetroPolitan Area is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'MetroPolitan Area should have 2 characters'
	                },
	                regexp: {
	                	//regexp: /^[a-zA-Z\s]+$/,
	                   regexp: /^[a-zA-Z]+(-[a-zA-Z]+)*$/,
	                   message: 'MetroPolitan Area accepts characters'
	                },
	            }
	        }
       }
}).on('click', '.addButtonloc', function() {
	$("#btnUpdate").attr("disabled", false);
	otherloc++;
	/* $('#element').removeAttr('style'); */
     var $template = $('#addOtherLocation'),
         $clone    = $template
                         .clone()
                         .removeAttr('style')
                         .removeAttr('id')
                         .attr('data-book-index', otherloc)
                         .insertAfter($template);

     // Add new field
     $('#updateClientVendorForm')
     .formValidation('addField', $clone.find('[name="lca_othr_line1[]"]'))
     .formValidation('addField', $clone.find('[name="lca_othr_line2[]"]'))
     .formValidation('addField', $clone.find('[name="lca_othr_city[]"]'))
     .formValidation('addField', $clone.find('[name="lca_othr_state[]"]'))
     .formValidation('addField', $clone.find('[name="lca_othr_zipcode[]"]'))
     .formValidation('addField', $clone.find('[name="lca_othr_remote_metro[]"]'));
 })
 .on('click', '.removeButtonloc', function() {
        var $row  = $(this).parents('.form-group'),
        index = $row.attr('data-book-index');
        $lca_othr_line1 = $row.find('[name="lca_othr_line1[]"]');

     // Remove fields
     $('#updateClientVendorForm')
          .formValidation('removeField', $row.find('[name="lca_othr_line1[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="lca_othr_line2[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="lca_othr_city[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="lca_othr_state[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="lca_othr_remote_metro[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="lca_othr_zipcode[' + index + ']"]'))
          .formValidation('removeField', $lca_othr_line1);

     // Remove element containing the fields
     $row.remove();
       })
       .on('added.field.fv', function(e, data) {
           if (data.field === 'lca_othr_line1[]') {
               if ($('#updateClientVendorForm').find(':visible[name="lca_othr_line1[]"]').length >= MAXOPTIONS) {
                   $('#updateClientVendorForm').find('.addButtonloc').attr('disabled', 'disabled');
               }
             }
        })
        .on('removed.field.fv', function(e, data) {
            if (data.field === 'lca_othr_line1[]') {
                 if ($('#updateClientVendorForm').find(':visible[name="lca_othr_line1[]"]').length <= MAXOPTIONS) {
                     $('#updateClientVendorForm').find('.addButtonloc').removeAttr('disabled');
                 }
             }
}) 
.on('click', '.addButtonclient', function() {
	$("#btnUpdate").attr("disabled", false);
	othercl++;
     var $template = $('#addotherclient'),
         $clone    = $template
                         .clone()
                         .removeAttr('style')
                         .removeAttr('id')
                         .attr('data-book-index', othercl)
                         .insertAfter($template);

     // Add new field
     $('#updateClientVendorForm')
     .formValidation('addField', $clone.find('[name="othr_client_type[]"]'))
     .formValidation('addField', $clone.find('[name="othr_client_name[]"]'))
     .formValidation('addField', $clone.find('[name="othr_client_mgr[]"]'))
     .formValidation('addField', $clone.find('[name="othr_client_mgr_email[]"]'))
     .formValidation('addField', $clone.find('[name="othr_client_mgr_extn[]"]'))
     .formValidation('addField', $clone.find('[name="othr_emp_email_client[]"]'))
     .formValidation('addField', $clone.find('[name="othr_line1[]"]'))
     .formValidation('addField', $clone.find('[name="othr_line2[]"]'))
     .formValidation('addField', $clone.find('[name="othr_city[]"]'))
     .formValidation('addField', $clone.find('[name="othr_state[]"]'))
     .formValidation('addField', $clone.find('[name="othr_zipcode[]"]'))
     .formValidation('addField', $clone.find('[name="othr_fed_id[]"]'))
     .formValidation('addField', $clone.find('[name="othr_emp_client_extn[]"]'))
 })

 .on('click', '.removeButtonclient', function() {
     var $row  = $(this).parents('.form-group'),
         index = $row.attr('data-book-index');
        $othr_client_name = $row.find('[name="othr_client_name[]"]');

     // Remove fields
     $('#updateClientVendorForm')
    	   .formValidation('removeField', $row.find('[name="othr_client_type[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_client_name[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_client_mgr[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_client_mgr_email[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_client_mgr_extn[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_emp_email_client[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_emp_client_extn[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_line1[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_line2[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_city[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_state[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_fed_id[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_zipcode[' + index + ']"]'))
           .formValidation('removeField', $othr_client_name);

     // Remove element containing the fields
     $row.remove();
       })
       .on('added.field.fv', function(e, data) {
           if (data.field === 'othr_client_name[]') {
               if ($('#updateClientVendorForm').find(':visible[name="othr_client_name[]"]').length >= MAX_OPTIONS) {
                   $('#updateClientVendorForm').find('.addButtonclient').attr('disabled', 'disabled');
               }
           }
        })
        .on('removed.field.fv', function(e, data) {
            if (data.field === 'othr_client_name[]') {
                 if ($('#updateClientVendorForm').find(':visible[name="othr_client_name[]"]').length <= MAX_OPTIONS) {
                     $('#updateClientVendorForm').find('.addButtonclient').removeAttr('disabled');
                 }
             }
         })
         .on('click', '[name="myCheck"]', function() {
        	 var emptype= $('#emp_type').val();
             var checkBox = document.getElementById("myCheck");
        	  if(emptype=='1099' || emptype=='W2' || emptype=='C2C' ){
        		  if (checkBox.checked == true){
        		//	alert("1099***w2employee***if**"+emptype+"// if ///"+checkBox.checked);
        			    $("#map").show();
        			    $("#vlab").hide();
        			    $("#cw_order").val('');
        			    $('#updateClientVendorForm').formValidation('enableFieldValidators','cw_order',false);
        			    $('#updateClientVendorForm').formValidation('enableFieldValidators', 'mgr_approved_mail_CWO',true);
        			    document.getElementById('cw_order').disabled=true;
        		  }else{
        			  //alert("1099***w2employee***else**"+emptype+"\\else\\"+checkBox.checked);
        			  $("#map").hide();
        			  $("#vlab").show();
        			  $("#mgr_approved_mail_CWO").val('');
        			  $('#updateClientVendorForm').formValidation('enableFieldValidators','cw_order',true);
        			  $('#updateClientVendorForm').formValidation('enableFieldValidators', 'mgr_approved_mail_CWO',false);
        			  document.getElementById('cw_order').disabled=false;
        		  }
        	  }
          })
        .on('click', '[name="myCheck1"]', function() {
        	 var emptype= $('#emp_type').val();
            var checkBox = document.getElementById("myCheck1");
            if (checkBox.checked == true){
            	 //alert("***C2C***if**"+emptype+"// if ///"+checkBox.checked);
        			    $("#map2").show();
        			    $("#vlab1,#vlab2,#vlab3").hide();
        			    $("#w_order,#cagreement,#cCompliance").val('');
        			    $('#updateClientVendorForm').formValidation('enableFieldValidators','w_order',false); 
        			    $('#updateClientVendorForm').formValidation('enableFieldValidators','cagreement',false);
        			    $('#updateClientVendorForm').formValidation('enableFieldValidators','cCompliance',false);
        			    $('#updateClientVendorForm').formValidation('enableFieldValidators', 'mgr_approved_mail_VWO',true);
        			      
        		  } else {
        			//  alert("***C2C***if**"+emptype+"// else ///"+checkBox.checked);
        			  $("#map2").hide();
        			  $("#vlab1,#vlab2,#vlab3").show();
        			  $("#mgr_approved_mail_VWO").val('');
        			  $('#updateClientVendorForm').formValidation('enableFieldValidators','w_order',true);
        			  $('#updateClientVendorForm').formValidation('enableFieldValidators','cagreement',true);
        			  $('#updateClientVendorForm').formValidation('enableFieldValidators','cCompliance',true);
        			  $('#updateClientVendorForm').formValidation('enableFieldValidators', 'mgr_approved_mail_VWO',false);
        		  }
        }).on('click', '[name="workinglocation"]', function(e) {
           // var checkBox = document.getElementById("worklocation1");
           // var workloc=$("#workinglocation1").val();
            var checkBox1=$("input[name='workinglocation']:checked").val();
            if($("input[name='workinglocation']:checked").val()==$('#workinglocation1').val())
    		{
    	    	document.getElementById('btnUpdate').disabled=true;
    		}else if($("input[name='workinglocation']:checked").val()!=$('#workinglocation1').val()){
    			document.getElementById('btnUpdate').disabled=false;
    		  }
          //  alert("checkBox1"+checkBox1);
       	 if(checkBox1=='Remote/Home'){
       		//alert("**if***"+checkBox.checked);
       	    $("#remoteAddress").show();
       	    $('#updateClientVendorForm').formValidation('enableFieldValidators','remote_line1',true);
       	    $('#updateClientVendorForm').formValidation('enableFieldValidators','remote_line2',true);
       	    $('#updateClientVendorForm').formValidation('enableFieldValidators','remote_city',true);
       	    $('#updateClientVendorForm').formValidation('enableFieldValidators','remote_state',true);
       	    $('#updateClientVendorForm').formValidation('enableFieldValidators','remote_zipcode',true);
       	    $('#updateClientVendorForm').formValidation('enableFieldValidators','remote_county',true);
   	        $('#updateClientVendorForm').formValidation('enableFieldValidators','remote_soc_code',true);
          }else if(checkBox1=='EndClient'){
        	//	alert("**else**"+checkBox);
                $("#remoteAddress").hide();
                $('#updateClientVendorForm').formValidation('enableFieldValidators','remote_line1',false);
        	    $('#updateClientVendorForm').formValidation('enableFieldValidators','remote_line2',false);
        	    $('#updateClientVendorForm').formValidation('enableFieldValidators','remote_city',false);
        	    $('#updateClientVendorForm').formValidation('enableFieldValidators','remote_state',false);
        	    $('#updateClientVendorForm').formValidation('enableFieldValidators','remote_zipcode',false);
        	    $('#updateClientVendorForm').formValidation('enableFieldValidators','remote_county',true);
        	    $('#updateClientVendorForm').formValidation('enableFieldValidators','remote_soc_code',true);
             } 
       });

</script>
 
 
 
 
 
<script type="text/javascript">

  function loadcustomer(){
	  getsesVal().done(function(data){
		  if(data!=""){
	  var cust_id=$('#cust_id').val();
	 // alert(cust_id);
 	 var custid=document.getElementById('customertype').value;
 	 //alert(custid);
 	 if(custid=="AddCustomerDetails")
 		 {
 	    	//window.location.href="USOBT_AddCustomer_C2C.jsp?candidate_id=${candidate_id}&emp_type=${emptype}";
 		 }else if(cust_id==custid){
 			  window.location.reload();
 		 }else{
 			 $("#pro_enddate").attr("disabled", true);
 			 $('#pro_startdate,#pro_enddate').val('').datepicker('update');
 			 $.ajax({
 		    	type : "GET",
 		        asyn : false,
 		        contentType: "application/json", // NOT dataType!
 		        url  : "CustomerDetailsById",
 		        data:{custid:custid},
 		        success  : function(response){
 		        	var cust = response.custObj;
		          	var cust_address = response.custAddressObj;
		          	var caddress=cust_address.line1+","+cust_address.line2+","+cust_address.city+","+cust_address.state+","+cust_address.zipcode;
		          	$("#customer_name").val(cust.customer_name);
		          	$("#customer_add").val(caddress);
		          	$("#customer_phne_no").val(cust.customer_contact_no);
		          	$("#customer_mgr_emailid").val(cust.mgr_email);
 		   	      var fname=response.fileName;
	          	var encoded = encodeURIComponent(fname);
	          	var customerName=cust.customer_name;
 		        if(response.fileType=="Manager_Approved_Email_CMSA"){
 		    	  $( "#uploadmam" ).empty();
 		    	  $( "#uploadMsa" ).empty();
 		    	  $( "#uploadMsa" ).append('<a>NA</a>');
 		    	  $("#upmam").show();
 		    	 $("#mgrcust").hide(); 
 		    	 $("#MsaDates").hide();
		    	  $( "#uploadmam" ).append('<a href="downloadocs?filetype='+response.fileType+'&filename='+encoded+'&customerName='+cust.customer_name+'" style="color:blue">'+response.fileName+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewCustomerDocHistory(\''+response.fileId+'\',\''+response.fileType+'\');"><i class="fa fa-history"></i></a>');
 		    	 //  $( "#uploadmam" ).append('<a href="USOBT_C2C_View_Controller?action=downloadocs&empno=${empno}&fileId='+response  .fileId+'&filetype='+response.fileType+'&filename='+encoded+'&customerName='+response.custname+'" style="color:blue">'+response.fileName+'</a>');
 		       }else {
 		    	  $( "#uploadMsa" ).empty();
 		    	 $( "#uploadmam" ).empty();
 		    	  $("#upmam").hide();
 		    	 $("#mgrcust").hide(); 
 		    	$("#MsaDates").show();
		    		var sdate="";var edate="";
	          	if(response.startdate!=null){
	          		sdate=response.startdate;
	          		$("#MsaSd").show();
	          		$("#csdate").text(sdate);
	          	}else{
	          		$("#MsaSd").hide();
	          		$("#csdate").text('');
	          	}
			if(response.expirydate!=null){
				edate=response.expirydate;
				$("#MsaEd").show();
          		$("#cedate").text(edate);
	          	}else{
	          		$("#MsaEd").hide();
	          		$("#cedate").text('');
	          	}
	          $("#uploadMsa").append('<a href="downloadocs?filetype='+response.fileType+'&filename='+encoded+'&customerName='+cust.customer_name+'" style="color:blue">'+response.fileName+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewCustomerDocHistory(\''+response.fileId+'\',\''+response.fileType+'\');"><i class="fa fa-history"></i></a>');  
 		       //$( "#uploadMsa" ).append('<a href="USOBT_C2C_View_Controller?action=downloadocs&empno=${empno}&fileId='+response  .fileId+'&filetype=Customer_MSA&filename='+encoded+'&customerName='+response.custname+'" style="color:blue">'+response.fileName+'</a>');
 		      } 
 		       document.getElementById('cw_order').required=true;
 		       $('#updateClientVendorForm').formValidation('enableFieldValidators','cw_order',true);
 		        $('#invoice_terms').val('');
 		         $('#bill_rate').val('');
 		         $('#pro_startdate').val('');
 		         $('#pro_enddate').val('');
 		        $("#cwo,#mgrcwo").hide();
		        $("#f1").show();
 		         $("#btn").hide();
 		        $("#btn1").hide();
 		        }
 	    });

 	  }
		  }else{window.location.href="loginpage";}});		 
  }	 
 			 
</script>

<script type="text/javascript">

  function loadvendor(){
	  getsesVal().done(function(data){
		  if(data!=""){ 
 	 var venid=document.getElementById('vendortype').value;
 	var ven_id=$('#ven_id').val();
 	if(venid=="AddVendorDetails"){
     	//window.location.href="USOBT_AddVendor_C2C.jsp?candidate_id=${candidate_id}&emp_type=${emptype}"; 
	 } 
 	else if(ven_id==venid){
 		$("#vwo,#cca,#cc,#mgrvwo").show();
		window.location.reload();
	 }
 	else{
		 $.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "application/json", // NOT dataType!
		        url  : "VendorDetailsById",
		        data:{venid:venid},
		        success  : function(response){
				        	var ven = response.vendObj;
				        	var ven_address = response.vendorAddressObj;
				          	var vaddress=ven_address.line1+","+ven_address.line2+","+ven_address.city+","+ven_address.state+","+ven_address.zipcode;
				          	
				        	 $("#vendor_name").val(ven.vendorname);
					         $("#vendor_add").val(vaddress);
					         $("#vendor_phne_no").val(ven.vendor_contact_no);
					         $("#vendor_mgr_emailid").val(ven.vendor_mgr_email);
		        	
				 var vdocObj=response.venDocsObj;
		            $("#tid").hide();
		            $("#BCdocs1,#BCdocs2,#BCdocs3,#BCdocs4,#vMSA,#uplodmamv").empty();
		            $("#vMSAsdate,#vMSAedate,#bcd1sdate,#bcd1edate,#bcd2sdate,#bcd2edate,#bcd3sdate,#bcd3edate").text('');
		            if(vdocObj.ven_msa!=null){
		            	    var fname=vdocObj.ven_msa;
		 		          	var encoded = encodeURIComponent(fname);
		 		          	var inputval="";
		 		          	var sdate="";var edate="";
		 		          	if(vdocObj.vmsastartdate!=null){
		 		          		sdate=vdocObj.vmsastartdate;
		 		          		$("#vMSADates").show();
		 		          		$("#vMSASd").show();
				          		$("#vMSAsdate").text(sdate);
		 		          	}else{
		 		          		$("#vMSADates").hide();
		 		          		$("#vMSASd").hide();
				          		$("#vMSAsdate").text('');
		 		          	}
							if(vdocObj.vmsaexpirydate!=null){
								edate=vdocObj.vmsaexpirydate;
								$("#vMSADates").show();
								$("#vMSAEd").show();
				          		$("#vMSAedate").text(edate);
		 		          	}else{
		 		          		$("#vMSADates").hide();
		 		          		$("#vMSAEd").hide();
				          		$("#vMSAedate").text('');
		 		          	}
				        	 $("#vMSA").append('<a href="downloadocs?filetype='+vdocObj.msafiletype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vdocObj.ven_msa+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory(\''+vdocObj.vmsafileid+'\',\''+vdocObj.msafiletype+'\',\'\');"><i class="fa fa-history"></i></a>');
			         }else{
			        	 $("#vMSA").append('<a>NA</a>');
			        	 $("#vMSADates").hide();
			         }
			         if(vdocObj.irsfilename!=null){
			        	 $("#BCdocs1Id").show();
			        	 var sdate="";var edate="";
			        	 var fname=vdocObj.irsfilename;
		 		         var encoded = encodeURIComponent(fname);
		 		        if(vdocObj.irsstartdate!=null){
	 		          		sdate=vdocObj.irsstartdate;
	 		          		$("#BCdocs1Dates").show();
	 		          		$("#BCdocs1Sd").show();
			          		$("#bcd1sdate").text(sdate);
	 		          	}else{
	 		          		$("#BCdocs1Dates").hide();
	 		          		$("#BCdocs1Sd").hide();
			          		$("#bcd1sdate").text('');
	 		          	}
						if(vdocObj.irsexpirydate!=null){
							edate=vdocObj.irsexpirydate;
							$("#BCdocs1Dates").show();
							$("#BCdocs1Ed").show();
			          		$("#bcd1edate").text(edate);
	 		          	}else{
	 		          		$("#BCdocs1Dates").hide();
	 		          		$("#BCdocs1Ed").hide();
			          		$("#bcd1edate").text('');
	 		          	}
					//	<br><label>Start Date : <span>'+sdate+'</span></label>&nbsp&nbsp&nbsp&nbsp<label>End Date : <span>'+edate+'</span></label>
						 //BCdocs1Id
			        	 $("#BCdocs1").append('<label>Executed IRS W-9 Form :</label>&nbsp&nbsp&nbsp&nbsp<a href="downloadocs?filetype='+vdocObj.bcfiletype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vdocObj.irsfilename+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory(\''+vdocObj.irsfileid+'\',\''+vdocObj.bcfiletype+'\',\''+vdocObj.irsinputval+'\');"><i class="fa fa-history"></i></a>');
			         }else{ $("#BCdocs1Dates,#BCdocs1Id").hide();       }
			         if(vdocObj.icfilename!=null){
			        	 $("#BCdocs2Id").show();
			        	 var sdate="";var edate="";
			        	 var fname=vdocObj.icfilename;
		 		         var encoded = encodeURIComponent(fname);
		 		         
		 		        if(vdocObj.icstartdate!=null){
	 		          		sdate=vdocObj.icstartdate;
	 		          		$("#BCdocs2Dates").show();
	 		          		$("#BCdocs2Sd").show();
			          		$("#bcd2sdate").text(sdate);
	 		          	}else{
	 		          		$("#BCdocs2Dates").hide();
	 		          		$("#BCdocs2Sd").hide();
			          		$("#bcd2sdate").text('');
	 		          	}
						if(vdocObj.icexpirydate!=null){
							edate=vdocObj.icexpirydate;
							$("#BCdocs2Dates").show();
							$("#BCdocs2Ed").show();
			          		$("#bcd2edate").text(edate);
	 		          	}else{
	 		          		$("#BCdocs2Dates").hide();
	 		          		$("#BCdocs2Ed").hide();
			          		$("#bcd2edate").text('');
	 		          	}
			        	 $("#BCdocs2").append('<label>Insurance Certificate :</label>&nbsp&nbsp&nbsp&nbsp<a href="downloadocs?filetype='+vdocObj.bcfiletype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vdocObj.icfilename+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory(\''+vdocObj.icfileid+'\',\''+vdocObj.bcfiletype+'\',\''+vdocObj.icinputval+'\');"><i class="fa fa-history"></i></a>');
			         }else{ $("#BCdocs2Dates,#BCdocs2Id").hide(); }
			         if(vdocObj.gscfilename!=null){
			        	 $("#BCdocs3Id").show();
			        	 var sdate="";var edate="";
			        	 var fname=vdocObj.gscfilename;
		 		         var encoded = encodeURIComponent(fname);
		 		        if(vdocObj.gscstartdate!=null){
	 		          		sdate=vdocObj.gscstartdate;
	 		          		$("#BCdocs3Dates").show();
	 		          		$("#BCdocs3Sd").show();
			          		$("#bcd3sdate").text(sdate);
	 		          	}else{
	 		          		$("#BCdocs3Dates").hide();
	 		          		$("#BCdocs3Sd").hide();
			          		$("#bcd3sdate").text('');
	 		          	}
						if(vdocObj.gscexpirydate!=null){
							edate=vdocObj.gscexpirydate;
							$("#BCdocs3Dates").show();
							$("#BCdocs3Ed").show();
			          		$("#bcd3edate").text(edate);
	 		          	}else{
	 		          		$("#BCdocs3Dates").hide();
	 		          		$("#BCdocs3Ed").hide();
			          		$("#bcd3edate").text('');
	 		          	}
			        	 $("#BCdocs3").append('<label>Good Standing Certificate :</label>&nbsp&nbsp&nbsp&nbsp<a href="downloadocs?filetype='+vdocObj.bcfiletype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vdocObj.gscfilename+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory(\''+vdocObj.gscfileid+'\',\''+vdocObj.bcfiletype+'\',\''+vdocObj.gscinputval+'\');"><i class="fa fa-history"></i></a>');
			         }else{ $("#BCdocs3Dates,#BCdocs3Id").hide(); }
			         if(vdocObj.cifilename!=null){
			        	 $("#BCdocs4Id").show();
			        	 var fname=vdocObj.cifilename;
		 		         var encoded = encodeURIComponent(fname);
			        	 $("#BCdocs4").append('<label>Certificate Incorporation :</label>&nbsp&nbsp&nbsp&nbsp<a href="downloadocs?filetype='+vdocObj.bcfiletype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vdocObj.cifilename+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory(\''+vdocObj.cifileid+'\',\''+vdocObj.bcfiletype+'\',\''+vdocObj.ciinputval+'\');"><i class="fa fa-history"></i></a>');
			         }else{ $("#BCdocs4Id").hide(); }
			         
			         if(vdocObj.ven_mgr_apr_mail_proof!=null){
			        	 $("#uplodmamv").append('<a href="downloadocs?filetype='+vdocObj.mgrfiletype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vdocObj.ven_mgr_apr_mail_proof+'</a>&nbsp&nbsp&nbsp&nbsp<a data-toggle="modal" href="#myModalView" class="btn btn-success btn-sm" onclick="viewVendorDocHistory(\''+vdocObj.vmgrfileid+'\',\''+vdocObj.mgrfiletype+'\',\'\');"><i class="fa fa-history"></i></a>');
		 		    	  $("#upamv").show();
			          }
			          else{
			        	  $("#upamv").hide();
			             }      
		            
		    /*   for(var i=0;i<vDocsList.length;i++){
		            	var fname=vDocsList[i].file_name;
	 		          	var encoded = encodeURIComponent(fname);
		        if(vDocsList[i].filetype=="Vendor_MSA"){
		       $("#vMSA").empty();
		        $("#mgrven").hide(); 
		       $("#vMSA").append('<a href="USOBT_C2C_View_Controller?action=downloadocs&empno=${empno}&fileId='+vDocsList[i].ed_Id+'&filetype='+vDocsList[i].filetype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vDocsList[i].file_name+'</a>');
		            } 
		          else if(vDocsList[i].filetype=="Business Compliance"){
		        	  $("#mgrven").hide(); 
		        	  $( "#BCdocs" ).append('<Span style="color:black;">'+vDocsList[i].inputval+ '</Span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="USOBT_C2C_View_Controller?action=downloadocs&empno=${empno}&fileId='+vDocsList[i].ed_Id+'&filetype='+vDocsList[i].filetype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vDocsList[i].file_name+'</a><br><br>');
		          }
		          else{
		        	  $( "#uplodmamv" ).empty();
		        	  $("#mgrven").hide(); 
		        	  $("#uplodmamv").append('<a href="USOBT_C2C_View_Controller?action=downloadocs&empno=${empno}&fileId='+vDocsList[i].ed_Id+'&filetype='+vDocsList[i].filetype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vDocsList[i].file_name+'</a>');
	 		    	  $("#upamv").show();
		          }
		        }  */
		            document.getElementById('w_order').required=true;
			        document.getElementById('cagreement').required=true;
			        document.getElementById('cCompliance').required=true; 
			        $('#updateClientVendorForm').formValidation('enableFieldValidators','w_order',true);
					$('#updateClientVendorForm').formValidation('enableFieldValidators','cagreement',true);
					$('#updateClientVendorForm').formValidation('enableFieldValidators','cCompliance',true);
					    $('#payment_terms').val('');
		 		         $('#pay_rate').val(''); 
		 		        $("#vwo,#cca,#cc,#mgrvwo").hide();
			 		 	$("#f2,#f3,#f4").show();
		 		        $('#btn2').hide(); 
		 		       $('#btn3').hide(); 
		 		      $('#btn4').hide(); 
		 		     $('#btn5').hide(); 
		        /*    for(var i=0;i<vDocsList.length;i++){
		            	
		          if(vDocsList[i].filetype=="Vendor_MSA"){
		       $("#vMSA").empty(); 
		       $("#vMSA").append('<a href="USOBT_C2C_View_Controller?action=downloadocs&empno=${empno}&fileId='+vDocsList[i].ed_Id+'&filetype='+vDocsList[i].filetype+'&filename='+vDocsList[i].file_name+'&vendorName='+response.vendorname+'" style="color:blue">'+vDocsList[i].file_name+'</a>');
		            } 
		          else{
		        	  
		        	  $( "#BCdocs" ).append('<a href="USOBT_C2C_View_Controller?action=downloadocs&empno=${empno}&fileId='+vDocsList[i].ed_Id+'&filetype='+vDocsList[i].filetype+'&filename='+vDocsList[i].file_name+'&vendorName='+response.vendorname+'" style="color:blue">'+vDocsList[i].file_name+'</a><br><br>');
		          } 
		            } 
		        document.getElementById('payment_terms').required=true;
		        document.getElementById('pay_rate').required=true;
		        document.getElementById('w_order').required=true;
		        document.getElementById('cagreement').required=true;
		        document.getElementById('cCompliance').required=true;     
		       $("#vendor").show(); */
		        }
			    });
	 }
		  }else{window.location.href="loginpage";}});
  }
</script>
<script type="text/javascript">
function btnClick(){
	getsesVal().done(function(data){
		  if(data!=""){
	var payrateid=$('#payRateid').val();
	var emptype= $('#emp_type').val();
	//alert("Brate"+brt+"Prate"+prt);
	 $('#updateClientVendorForm').formValidation('validate');
	if(!$('#updateClientVendorForm').data('formValidation').isValid())
		 {
		   // alert("Not Valid");
		 }
	else{
		if(emptype=='C2C'){
			var brt=document.getElementById("bill_rate").value;
			var prt=document.getElementById("pay_rate").value;
			if(parseInt(prt)>=parseInt(brt)){
			$('#brate').text(brt);
			$('#prate').text(prt);
			$('#myModal').modal('show');
	 	}else{
	 	//	alert("Yes Valid");
	 		//document.getElementById("updateClientVendorForm").submit();
	 	$("#btnUpdate").attr("disabled", true);
	    	var form = $('#updateClientVendorForm')[0];
		    var data = new FormData(form);
		   $.ajax({
			url : "updateClientVendorDetails",
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(response) {
				 if(response!=null || response!=""){
					     var mesg=response.message;
			   	         var candidate_id=response.candidateId;
			   	         var empType=response.empType;
			   	         alert(mesg);
			   	      window.location.href="viewW2ClientVendor?candidate_id="+candidate_id+"&empType="+empType+"&payrate_id="+payrateid+"";
	   	   	         }
	   	   	      else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			}
		  });
	 	 } 
		}else{
		  //alert("Yes Valid");
		  	$("#btnUpdate").attr("disabled", true);
	    	var form = $('#updateClientVendorForm')[0];
		    var data = new FormData(form);
		   $.ajax({
			url : "updateClientVendorDetails",
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(response) {
				 if(response!=null || response!=""){
					     var mesg=response.message;
			   	         var candidate_id=response.candidateId;
			   	         var empType=response.empType;
			   	     // var productId=response.productId;
			   	   //   	const obj = JSON.parse(response.jsonString);
  					// var qbproduct_id= obj.IntuitResponse.Item.Id;
  					// var mail = $('#custmail').val();
  				  alert(mesg);
  					 /* $.ajax({
  			 				type : "POST",
  			 				asyn : false,
  			 				url : "updateQBProductId",
  			 				data : {
  			 					"productId" : productId,
  			 					"qbproduct_id" : qbproduct_id
  			 				},
  			 				success : function(response) {
  			 					
  			 				}
  			 		  }); */
			   	      window.location.href="viewW2ClientVendor?candidate_id="+candidate_id+"&empType="+empType+"&payrate_id="+payrateid+"";
	   	   	         }
	   	   	      else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			}
		  });
		//document.getElementById("updateClientVendorForm").submit();
		}
	  }
		  }else{window.location.href="loginpage";}});
	}
	
function submitForm(){
	getsesVal().done(function(data){
		  if(data!=""){
	var payrateid=$('#payRateid').val();
	$('#myModal').modal('hide');
	$("#btnUpdate").attr("disabled", true);
	var form = $('#updateClientVendorForm')[0];
    var data = new FormData(form);
   $.ajax({
	url : "updateClientVendorDetails",
	type : "POST",
	enctype : 'multipart/form-data',
	data : data,
	processData : false,
	contentType : false,
	cache : false,
	success : function(response) {
		 if(response!=null || response!=""){
			     var mesg=response.message;
	   	         var candidate_id=response.candidateId;
	   	         var empType=response.empType;
	   	         alert(mesg);
	   	      window.location.href="viewW2ClientVendor?candidate_id="+candidate_id+"&empType="+empType+"&payrate_id="+payrateid+"";
	   	         }
	   	      else{
	   	          window.location.href="loginpage";
	   	   	      }
	}
  });
		  }else{window.location.href="loginpage";}});
}
</script>
<script type="text/javascript">
function downloadDocVen(fname,ftype,vname){	
	getsesVal().done(function(data){
		  if(data!=""){
	var encoded = encodeURIComponent(fname);	
	window.location.href="downloadocs?filename="+encoded+"&filetype="+ftype+"&vendorName="+vname;
		  }else{window.location.href="loginpage";}});
}	
function downloadDocCust(fname,ftype,cname){	
	getsesVal().done(function(data){
		  if(data!=""){
	var encoded = encodeURIComponent(fname);	
	window.location.href="downloadocs?filename="+encoded+"&filetype="+ftype+"&customerName="+cname;
		  }else{window.location.href="loginpage";}});
}
function goBack() {
	getsesVal().done(function(data){
		  if(data!=""){
	document.getElementById("bformid").submit();
		  }else{window.location.href="loginpage";}});
	}
</script>
<script type="text/javascript">
$('input[name="endmgrdeskNumber"]').mask('999-999-9999');
$('input[name="endempdeskNumber"]').mask('999-999-9999');
$('input[name="endfed_id"]').mask('99-9999999');
//$('input[name="remote_soc_code"]').mask('99-9999');
$('input[name="othermgrdeskNumber"]').mask('999-999-9999');
$('input[name="otherempdeskNumber"]').mask('999-999-9999');	
$('input[name="otherfed_id"]').mask('99-9999999');
$('input[name="othr_fed_id[]"]').mask('99-9999999');
$('input[name="othr_client_mgr_extn[]"]').mask('999-999-9999');
$('input[name="othr_emp_client_extn[]"]').mask('999-999-9999');

function certificateHistory(){
	$("#historymodal").show();
	
}
/* function getClientDetails(){
	$('#showdetails').show()
} */
function addClientVendor(candidate_id,empType){
	getsesVal().done(function(data){
		  if(data!=""){
	if(empType=="W2"){
		window.location.href="addClientCustomer?candidate_id="+candidate_id+"&empType="+empType+"";
		}else{
			var activestatus=$("#activestatus").val();
			if(activestatus==0){
				alert("Candidate is in Inactive status,Please rejoin the candidate from Candidate info tab > Click on Rejoin(Red Icon)");
			}
			else{
				window.location.href="addClientCustomer?candidate_id="+candidate_id+"&empType="+empType+"";
			}
		}
		  }else{window.location.href="loginpage";}});
}
function viewW2ClientVendor(candidate_id,empType,payrateid){
	getsesVal().done(function(data){
		  if(data!=""){
	window.location.href="viewW2ClientVendor?candidate_id="+candidate_id+"&empType="+empType+"&payrate_id="+payrateid+"";
		  }else{window.location.href="loginpage";}});
	 }

function viewLcaDetails(){	
	$("#lcadetailsmodal").show();
}
		
function inactiveProject(payrateid,canid,projectstatus,emptype,activeCount){
	getsesVal().done(function(data){
		  if(data!=""){
	var pstatus="";
	var tablelength = $('#employeeTableId tr').length;
	/* if(activeCount==1 && (tablelength-1)>1 && emptype!="W2"){
		alert("Active porject is going on, so you can't Active another porject for C2C/1099 Candidates");
	}else{ */
	if(projectstatus=="Active" || projectstatus==""){
		pstatus="InActive";
	}else{
		pstatus="Active";
	}
	var result = confirm("Are you sure to "+pstatus+" the project?");
	
	if(result==true){
	$.ajax({
        type: "GET",
        url: "updateProjectStatus?payrate_id="+payrateid+"&candidate_id="+canid+"&empType="+emptype+"&project_status="+projectstatus+"",
        cache: false,
        async: false, 
        success: function(response){
	         if(response=="updated"){
	        	 alert("Project "+pstatus+" Successfully");
	        	 window.location.href="viewClientVendor?candidate_id="+canid+"&empType="+emptype+"";
		         }
        },
        error: function(){                                                                                 
        }                                                       
    }); 
	}
	//}
		  }else{window.location.href="loginpage";}});
}
/* function inactiveProject(payrateid,canid,projectstatus,emptype){
	var pstatus="";
	if(projectstatus=="Active" || projectstatus==""){
		pstatus="InActive";
	}else{
		pstatus="Active";
	}
	var result = confirm("Are you sure to "+pstatus+" the project?");

	if(result==true){
	$.ajax({
        type: "GET",
        url: "updateProjectStatus?payrate_id="+payrateid+"&candidate_id="+canid+"&empType="+emptype+"&project_status="+projectstatus+"",
        cache: false,
        async: false, 
        success: function(response){
	         if(response=="updated"){
	        	 alert("Project "+pstatus+" Successfully");
	        	 window.location.href="viewClientVendor?candidate_id="+canid+"&empType="+emptype+"";
		         }
        },
        error: function(){                                                                                 
        }                                                       
    }); 
	}else{
		
	}
} */
/* var canempType=$('#canempType').val();
 if(canempType=="W2"){
	$('#showdetails').hide();
}else{
	$('#showdetails').hide();
} */
function addExitDetails(candidate_id){
	getsesVal().done(function(data){
		  if(data!=""){
	window.location.href="exitDetails?candidate_id="+candidate_id+"";
		  }else{window.location.href="loginpage";}});
}
</script> 
<script>
var payrateid=$('#payRateid').val();
function addVDocument(ftype){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#asubmitid').attr('disabled',true);
    $('#afileType,#afromdate,#aexpirydate,#aFile,#avenid').val('');
    $('#afileType').val(ftype);
    if(ftype=='Consultant_Compliance' || ftype=='ven_work_order'){
   	 $("#afromdate,#aexpirydate").prop('required',true);
     }else{
   	 $("#afromdate,#aexpirydate").prop('required',false);
    }
    var ven_id=$('#ven_id').val();
    $('#avenid').val(ven_id);
    $('#apayrateid').val(payrateid);
    var title="";
	 if(ftype=='Consultant_Compliance'){
		title="Consultant Compliance ";	
	 }else if(ftype=='ven_work_order'){
		title="Vendor WO ";
	 }
   $('h5').text(title+"Document Details");
    $('#addVDocumentModal').modal('show');
		  }else{window.location.href="loginpage";}});
};

function addCDocument(ftype){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#asubmitid').attr('disabled',true);
    $('#cafileType,#cafromdate,#caexpirydate,#caFile,#cacustmid').val('');
    $('#cafileType').val(ftype);
    var cust_id=$('#cust_id').val();
    $('#cacustmid').val(cust_id);
    $('#capayrateid').val(payrateid);
    $('h5').text("Customer WO Document Details");
    $("#caexpirydate").attr("disabled", true);
    $('#addCDocumentModal').modal('show');
		  }else{window.location.href="loginpage";}});
};

//addClientCustomerDocument


function addCCADocument(ftype){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#ccafileType,#ccaFile,#ccavenid').val('');
    $('#ccafileType').val(ftype);
    var ven_id=$('#ven_id').val();
    $('#ccavenid').val(ven_id);
    $('#ccapayrateid').val(payrateid);
    $('h5').text("Consultant Consent Agreement Document Details");
    $('#addCCADocumentModal').modal('show');
		  }else{window.location.href="loginpage";}});
};


function addMailCProofDocument(ftype){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#cmsgafileType,#cmsgaFile,#cmsgacustmid').val('');
    $('#cmsgafileType').val(ftype);
    var cust_id=$('#cust_id').val();
    $('#cmsgacustmid').val(cust_id);
    $('#cmsgapayrateid').val(payrateid);
    $('h5').text("Management Approval e-mail(Consultant) Document Details");
    $('#addMailProofCDocumentModal').modal('show');
		  }else{window.location.href="loginpage";}});
};

function addMailVProofDocument(ftype){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#msgafileType,#msgaFile,#msgavenId').val('');
    $('#msgafileType').val(ftype);
    var ven_id=$('#ven_id').val();
    $('#msgavenId').val(ven_id);
    $('#vmsgapayrateid').val(payrateid);
    $('#addMailProofDocumentModal').modal('show');
		  }else{window.location.href="loginpage";}});
};

$("#afromdate").datepicker({
}).on('changeDate', function(selected) {
	 var minDate = new Date(selected.date.valueOf());
     $('#aexpirydate').datepicker('setStartDate', minDate); 
});	
$("#aexpirydate").datepicker({
}).on('changeDate', function(selected) {
        var minDate = new Date(selected.date.valueOf());
        $('#afromdate').datepicker('setEndDate', minDate);
});
$("#afromdate").on('change', function(){
	   var fromdate1=$('#afromdate').val();
	   if(fromdate1!=""){
	     var minDate=new Date(fromdate1);
	     $('#aexpirydate').datepicker('setStartDate', minDate);
	     $("#aexpirydate").attr("disabled", false);
	   }else{
		    $("#aexpirydate").attr("disabled", true);
		    $('#aexpirydate').val('').datepicker('update');
	   }
});
$("#aexpirydate").on('change', function(){
	   var expirydate1=$('#aexpirydate').val();
	   if(expirydate1!=""){
	     var minDate=new Date(expirydate1);
	     $('#afromdate').datepicker('setEndDate', minDate);
	   }
});

$("#cafromdate").datepicker({
}).on('changeDate', function(selected) {
	/*  var minDate = new Date(selected.date.valueOf());
     $('#caexpirydate').datepicker('setStartDate', minDate); */ 
});	
$("#caexpirydate").datepicker({
}).on('changeDate', function(selected) {
       /*  var minDate = new Date(selected.date.valueOf());
        $('#cafromdate').datepicker('setEndDate', minDate); */
});
$("#cafromdate").on('change', function(){
	   var fromdate1=$('#cafromdate').val();
	   if(fromdate1!=""){
	     var minDate=new Date(fromdate1);
	     $('#caexpirydate').datepicker('setStartDate', minDate);
	     $("#caexpirydate").attr("disabled", false);
	   }else{
		    $("#caexpirydate").attr("disabled", true);
		    $('#caexpirydate').val('').datepicker('update');
	   }
});
$("#caexpirydate").on('change', function(){
	   var expirydate1=$('#caexpirydate').val();
	   if(expirydate1!=""){
	     var minDate=new Date(expirydate1);
	     $('#cafromdate').datepicker('setEndDate', minDate);
	   }
});

//addVendorDocument	addvenId addefileInputVal addefileType addeditFile addvenId addfromdate addexpirydate
function editDocument(fname,id,stdate,expdate,ftype){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#evsubmitid').attr('disabled',true);
    $('#efileId,#editFile,#efileType,#evenId').val('');
    $('#efileName').text('');
    $('#efileId').val(id);
    var ven_id=$('#ven_id').val();
    $('#evenId').val(ven_id);
    $('#efileName').text(fname);
    $('#efileType').val(ftype);
    $('#fromdate1').val(stdate);
    $('#expirydate1').val(expdate);
    $('#fromdate').val(stdate);
    $('#expirydate').val(expdate);
    $('#ecvpayrateid').val(payrateid);
    if(ftype=='Consultant_Compliance' || ftype=='ven_work_order'){
    	 $("#fromdate,#expirydate").prop('required',true);
    }else{
    	 $("#fromdate,#expirydate").prop('required',false);
    }
    
    var dates = new Date(stdate);
 	dates.setDate(dates.getDate());
 	var edates = new Date(expdate);
 	edates.setDate(edates.getDate());
 	
 	$("#fromdate").datepicker({
 		endDate: edates,
	    maxDate: edates
 	}).on('changeDate', function(selected) {
 		 var minDate = new Date(selected.date.valueOf());
 	     $('#expirydate').datepicker('setStartDate', minDate);
 	     if($('#fromdate').val()==$('#fromdate1').val())
 	     {$('#evsubmitid').attr('disabled',true);}else{$('#evsubmitid').attr('disabled',false);}
 	});	
 	$("#expirydate").datepicker({
 		startDate: dates,
		minDate: dates
 	}).on('changeDate', function(selected) {
 	        var minDate = new Date(selected.date.valueOf());
 	        $('#fromdate').datepicker('setEndDate', minDate);
 	        if($('#expirydate').val()==$('#expirydate1').val())
 	        {$('#evsubmitid').attr('disabled',true);}else{$('#evsubmitid').attr('disabled',false);}
 	}); 
 	
 	
    var title="";
	 if(ftype=='Consultant_Compliance'){
		title="Consultant Compliance ";	
	 }else if(ftype=='ven_work_order'){
		title="Vendor WO ";
	 }
    $('h5').text(title+"Document Details");
    $('#EditDocumentModal').modal('show');
		  }else{window.location.href="loginpage";}});
};

function editCCADocument(fname,id,ftype){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#caefileId,#caeditFile,#efileType,#evenId').val('');
    $('#caefileName').text('');
    $('#caefileId').val(id);
    var ven_id=$('#ven_id').val();
    $('#caevenId').val(ven_id);
    $('#caefileName').text(fname);
    $('#caefileType').val(ftype);
    $('#ccaepayrateid').val(payrateid);
    $('h5').text("Consultant Consent Agreement Document Details");
    $('#EditCCADocumentModal').modal('show');
		  }else{window.location.href="loginpage";}});
};

function editCustDocument(fname,id,stdate,expdate,ftype){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#ccesubmitid').attr('disabled',true);
    $('#cefileId,#ceditFile,#cefileType,#custmid').val('');
    $('#cefileName').text('');
    $('#cefileId').val(id);
    var cust_id=$('#cust_id').val();
    $('#custmid').val(cust_id);
    $('#cefileName').text(fname);
    $('#cefileType').val(ftype);
    $('#cfromdate1').val(stdate);
    $('#cexpirydate1').val(expdate);
    $('#cfromdate').val(stdate);
    $('#cexpirydate').val(expdate);
    $('#cepayrateid').val(payrateid);
    var dates = new Date(stdate);
 	dates.setDate(dates.getDate());
 	var edates = new Date(expdate);
 	edates.setDate(edates.getDate());
    
 	$("#cfromdate").datepicker({
 		endDate: edates,
	    maxDate: edates
 	}).on('changeDate', function(selected) {
 		 var minDate = new Date(selected.date.valueOf());
 	     $('#cexpirydate').datepicker('setStartDate', minDate);
 	     if($('#cfromdate').val()==$('#cfromdate1').val())
 	     {$('#ccesubmitid').attr('disabled',true);}else{$('#ccesubmitid').attr('disabled',false);}
 	});	
 	$("#cexpirydate").datepicker({
 		startDate: dates,
		minDate: dates
 	}).on('changeDate', function(selected) {
 	        var minDate = new Date(selected.date.valueOf());
 	        $('#cfromdate').datepicker('setEndDate', minDate);
 	        if($('#cexpirydate').val()==$('#cexpirydate1').val())
 	        {$('#ccesubmitid').attr('disabled',true);}else{$('#ccesubmitid').attr('disabled',false);}
 	}); 
 	
    $('h5').text("Customer WO/PO Document Details");
    $('#EditCustDocumentModal').modal('show');
		  }else{window.location.href="loginpage";}});
};


function editMailProofDocument(fname,id,ftype){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#msgefileId,#msgeditFile,#msgefileType,#msgcustmid').val('');
    $('#msgefileName').text('');
    $('#msgefileId').val(id);
    var cust_id=$('#cust_id').val();
    $('#msgcustmid').val(cust_id);
    $('#msgefileName').text(fname);
    $('#msgefileType').val(ftype);
    $('#msgepayrateid').val(payrateid);
    $('h5').text("Management Approval e-mail(Consultant) Document Details");	
    $('#EditCMSGDocumentModal').modal('show');
		  }else{window.location.href="loginpage";}});
};

function editVMailProofDocument(fname,id,ftype){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#vmsgefileId,#vmsgefileType,#vmsgvenid,#vmsgeditFile').val('');
    $('#vmsgefileName').text('');
    $('#vmsgefileId').val(id);
    var ven_id=$('#ven_id').val();
    $('#vmsgvenid').val(ven_id);
    $('#vmsgefileName').text(fname);
    $('#vmsgefileType').val(ftype);
    $('#vmsgepayrateid').val(payrateid);
    $('h5').text("Management Approval e-mail(Consultant) Document Details");
    $('#EditVMSGDocumentModal').modal('show');
		  }else{window.location.href="loginpage";}});
};
$("#cwoexpirydate,#vwoexpirydate,#ccexpirydate").attr("disabled", true);
$("#cwofromdate").datepicker({
}).on('changeDate', function(selected) {
	/*  var minDate = new Date(selected.date.valueOf());
     $('#cwoexpirydate').datepicker('setStartDate', minDate); */
    $('#addClientVendorForm').formValidation('revalidateField', 'cwofromdate');
});	
$("#cwoexpirydate").datepicker({
}).on('changeDate', function(selected) {
      /*   var minDate = new Date(selected.date.valueOf());
        $('#cwofromdate').datepicker('setEndDate', minDate); */
    $('#addClientVendorForm').formValidation('revalidateField', 'cwoexpirydate');
});
$("#cwofromdate").on('change', function(){
	   var fromdate1=$('#cwofromdate').val();
	   if(fromdate1!=""){
	     var minDate=new Date(fromdate1);
	     $('#cwoexpirydate').datepicker('setStartDate', minDate);
	     $("#cwoexpirydate").attr("disabled", false);
	   }else{
		    $("#cwoexpirydate").attr("disabled", true);
		    $('#cwoexpirydate').val('').datepicker('update');
	   }
});
$("#cwoexpirydate").on('change', function(){
	   var expirydate1=$('#cwoexpirydate').val();
	   if(expirydate1!=""){
	     var minDate=new Date(expirydate1);
	     $('#cwofromdate').datepicker('setEndDate', minDate);
	   }
});  
 
$("#vwofromdate").datepicker({
}).on('changeDate', function(selected) {
	/*  var minDate = new Date(selected.date.valueOf());
     $('#vwoexpirydate').datepicker('setStartDate', minDate); */
    $('#addClientVendorForm').formValidation('revalidateField', 'vwofromdate');
});	
$("#vwoexpirydate").datepicker({
}).on('changeDate', function(selected) {
	/* var minDate = new Date(selected.date.valueOf());
    $('#vwofromdate').datepicker('setEndDate', minDate); */
    $('#addClientVendorForm').formValidation('revalidateField', 'vwoexpirydate');
});
$("#vwofromdate").on('change', function(){
	   var fromdate1=$('#vwofromdate').val();
	   if(fromdate1!=""){
	     var minDate=new Date(fromdate1);
	     $('#vwoexpirydate').datepicker('setStartDate', minDate);
	     $("#vwoexpirydate").attr("disabled", false);
	   }else{
		    $("#vwoexpirydate").attr("disabled", true);
		    $('#vwoexpirydate').val('').datepicker('update');
	   }
});
$("#vwoexpirydate").on('change', function(){
	   var expirydate1=$('#vwoexpirydate').val();
	   if(expirydate1!=""){
	     var minDate=new Date(expirydate1);
	     $('#vwofromdate').datepicker('setEndDate', minDate);
	   }
});
$("#ccfromdate").datepicker({
}).on('changeDate', function(selected) {
	/*  var minDate = new Date(selected.date.valueOf());
     $('#ccexpirydate').datepicker('setStartDate', minDate); */
    $('#addClientVendorForm').formValidation('revalidateField', 'ccfromdate');
});	
$("#ccexpirydate").datepicker({
}).on('changeDate', function(selected) {
       /*  var minDate = new Date(selected.date.valueOf());
        $('#ccfromdate').datepicker('setEndDate', minDate); */
    $('#addClientVendorForm').formValidation('revalidateField', 'ccexpirydate');
});
$("#ccfromdate").on('change', function(){
	   var fromdate1=$('#ccfromdate').val();
	   if(fromdate1!=""){
	     var minDate=new Date(fromdate1);
	     $('#ccexpirydate').datepicker('setStartDate', minDate);
	     $("#ccexpirydate").attr("disabled", false);
	   }else{
		    $("#ccexpirydate").attr("disabled", true);
		    $('#ccexpirydate').val('').datepicker('update');
	   }
});
$("#ccexpirydate").on('change', function(){
	   var expirydate1=$('#ccexpirydate').val();
	   if(expirydate1!=""){
	     var minDate=new Date(expirydate1);
	     $('#ccfromdate').datepicker('setEndDate', minDate);
	   }
});

//cw_order w_order cagreement cCompliance
function ccValidateSize(file) {
	getsesVal().done(function(data){
		  if(data!=""){
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
							// if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#certi_corp').val() != '' && $('#certi_corp').val() == $('#std_cert').val() != '' && $('#std_cert').val())
					//	if ($('#cw_order').val() != '' && $('#cw_order').val() == $('#w_order').val() != '' && $('#w_order').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val())		
					if($('#cw_order').val() != '' && $('#cw_order').val() == $('#w_order').val() != '' && $('#w_order').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val() || $('#w_order').val() != '' && $('#w_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#w_order').val() != '' && $('#w_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val() || $('#cagreement').val() != '' && $('#cagreement').val() == $('#cCompliance').val() != '' && $('#cCompliance').val())	
					{
							         alert("You can not send two or more same files.");
							         $('#cCompliance').val('');
							       //  $('#btnUpdate').attr('disabled',true);
							     }else{
							     	//alert("else**********");
							     	 $('#updateClientVendorForm').formValidation('enableFieldValidators', 'ccfromdate',true);
									 $('#updateClientVendorForm').formValidation('enableFieldValidators', 'ccexpirydate',true);
							     	$('#btnUpdate').attr('disabled',false);
							     }
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
		  	// alert("file empty");	
	  		$('#btnUpdate').attr('disabled',false);
	  		 $('#updateClientVendorForm').formValidation('enableFieldValidators', 'ccfromdate',false);
			 $('#updateClientVendorForm').formValidation('enableFieldValidators', 'ccexpirydate',false);
	  	}
		  }else{window.location.href="loginpage";}});
} 

function vwoValidateSize(file) {
	getsesVal().done(function(data){
		  if(data!=""){
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
							// if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#certi_corp').val() != '' && $('#certi_corp').val() == $('#std_cert').val() != '' && $('#std_cert').val())
							//if ($('#cw_order').val() != '' && $('#cw_order').val() == $('#w_order').val() != '' && $('#w_order').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val())	
							if($('#cw_order').val() != '' && $('#cw_order').val() == $('#w_order').val() != '' && $('#w_order').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val() || $('#w_order').val() != '' && $('#w_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#w_order').val() != '' && $('#w_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val() || $('#cagreement').val() != '' && $('#cagreement').val() == $('#cCompliance').val() != '' && $('#cCompliance').val())
							{
							         alert("You can not send two or more same files.");
							         $('#w_order').val('');
							         //$('#btnSubmit').attr('disabled',true);
							     }else{
							     //	alert("else**********");
							     //	$('#btnSubmit').attr('disabled',false);
							      $('#updateClientVendorForm').formValidation('enableFieldValidators', 'vwofromdate',true);
							   	  $('#updateClientVendorForm').formValidation('enableFieldValidators', 'vwoexpirydate',true);
							     }
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
  	 // alert("file empty");	
  	  $('#updateClientVendorForm').formValidation('enableFieldValidators', 'vwofromdate',false);
	  $('#updateClientVendorForm').formValidation('enableFieldValidators', 'vwoexpirydate',false);
  		$('#btnUpdate').attr('disabled',false);
  	}
		  }else{window.location.href="loginpage";}});
} 

   



function ccaValidateSize(file) {
	getsesVal().done(function(data){
		  if(data!=""){
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
							// if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#certi_corp').val() != '' && $('#certi_corp').val() == $('#std_cert').val() != '' && $('#std_cert').val())
						//	if ($('#cw_order').val() != '' && $('#cw_order').val() == $('#w_order').val() != '' && $('#w_order').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val())	
						if($('#cw_order').val() != '' && $('#cw_order').val() == $('#w_order').val() != '' && $('#w_order').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val() || $('#w_order').val() != '' && $('#w_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#w_order').val() != '' && $('#w_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val() || $('#cagreement').val() != '' && $('#cagreement').val() == $('#cCompliance').val() != '' && $('#cCompliance').val())	
						{
							         alert("You can not send two or more same files.");
							         $('#cagreement').val('');
							        // $('#btnUpdate').attr('disabled',true);
							     }else{
							     //	alert("else**********");
							     	$('#btnUpdate').attr('disabled',false);
							     }
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
  	 // alert("file empty");	
  		$('#btnUpdate').attr('disabled',false);
  	}
		  }else{window.location.href="loginpage";}});
} 

function cwoValidateSize(file) {
	getsesVal().done(function(data){
		  if(data!=""){
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
							// if ($('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#Ven_MSA').val() != '' && $('#Ven_MSA').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#insu_certi').val() != '' && $('#insu_certi').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#exe_irs_w9_form').val() != '' && $('#exe_irs_w9_form').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#certi_corp').val() != '' && $('#certi_corp').val() || $('#insu_certi').val() != '' && $('#insu_certi').val() == $('#std_cert').val() != '' && $('#std_cert').val() || $('#certi_corp').val() != '' && $('#certi_corp').val() == $('#std_cert').val() != '' && $('#std_cert').val())
						//	if ($('#cw_order').val() != '' && $('#cw_order').val() == $('#w_order').val() != '' && $('#w_order').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val())	
						if($('#cw_order').val() != '' && $('#cw_order').val() == $('#w_order').val() != '' && $('#w_order').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#cw_order').val() != '' && $('#cw_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val() || $('#w_order').val() != '' && $('#w_order').val() == $('#cagreement').val() != '' && $('#cagreement').val() || $('#w_order').val() != '' && $('#w_order').val() == $('#cCompliance').val() != '' && $('#cCompliance').val() || $('#cagreement').val() != '' && $('#cagreement').val() == $('#cCompliance').val() != '' && $('#cCompliance').val())
						{
							         alert("You can not send two or more same files.");
							         $('#cw_order').val('');
							         //$('#btnUpdate').attr('disabled',true);
							     }else{
							     //	alert("else**********");
							     	 $('#updateClientVendorForm').formValidation('enableFieldValidators', 'cwofromdate',true);
									 $('#updateClientVendorForm').formValidation('enableFieldValidators', 'cwoexpirydate',true);
							     	$('#btnUpdate').attr('disabled',false);
							     }
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
  	 // alert("file empty");	
  	 $('#updateClientVendorForm').formValidation('enableFieldValidators', 'cwofromdate',true);
	 $('#updateClientVendorForm').formValidation('enableFieldValidators', 'cwoexpirydate',true);
  	 $('#btnUpdate').attr('disabled',false);
  	}
		  }else{window.location.href="loginpage";}});
} 


function EditAValidateSize(file) {
	getsesVal().done(function(data){
		  if(data!=""){
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
						$('#cfromdate,#cexpirydate').val('');
						$('#ccesubmitid').attr('disabled',false);
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
		  }else{window.location.href="loginpage";}});
}

function EditValidateSize1(file) {
	getsesVal().done(function(data){
		  if(data!=""){
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
						$('#fromdate,#expirydate').val('');
						$('#evsubmitid').attr('disabled',false);
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
		  }else{window.location.href="loginpage";}});
}
    
function EditValidateSize(file) {
	getsesVal().done(function(data){
		  if(data!=""){
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
						$('#fromdate,#expirydate').val('');
						$('#esubmitid').attr('disabled',false);
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
		  }else{window.location.href="loginpage";}});
}
</script>
<script type="text/javascript">

var ctable = $('#customerDocHistoryTable').DataTable({
	 "order": [[0, "desc"]],
  bLengthChange: true,
  paging: true
});

function viewCustomerDocHistory(docId,fileType){
	getsesVal().done(function(data){
		  if(data!=""){
	/* var	cust_Id;
	if(custId!=""){
	cust_Id=custId;
	}
	else{
		cust_Id=$('#cust_id').val();
	} */
	$.ajax({
   	type : "get",
       url  : "getCustomerDocumentHistiryById",
       contentType:"application/json",
       cache : false,
       async : false,
       data:{"docId":docId},
       success  : function(response){
       	 if (ctable) ctable.clear();
       	 $('#customerDocHistoryTable').dataTable().fnClearTable();
       	  	if(response!=""){
           	  for(var i=0;i<response.length;i++){
           		//  alert(response[i].startdate);
           			var fname=response[i].file_name;
	 		          	var encoded = encodeURIComponent(fname);
	 		          	ctable.row.add([
                   	''+response[i].document_id+'',
                   	  '<a href="downloadocs?filetype='+response[i].filetype+'&filename='+encoded+'&customerName='+response[i].custName+'" style="color:blue">'+response[i].file_name+'</a>',
                   	//'<span onclick="downloadDocCust('+response[i].file_name+','+response[i].filetype+','+custName+')" style="color: blue">'+response[i].file_name+'</span>',
                   	''+response[i].filetype+'',
                   	''+response[i].startdate+'',
                   	''+response[i].expirydate+'',
                   	''+response[i].submit_date+'',
						''+response[i].posted_by+''
                    ]).draw();                  
                  }
         	}else{
         	  // alert("No data found");
            } 
       	 
       	 var title="";
      	 if(fileType=='Customer_MSA'){
      		title="Customer MSA ";	
      	 }else if(fileType=='Manager_Approved_Email_CMSA'){
      		title="Manager Approved e-mail(CMSA) ";
      	 }	
      	$('h5').text(title+"Document History");
       $('#DocumentCustomerHistoryModal').modal('show');
     },
 //	''+response[i].docStatus+''
    error: function(){  
    alert('Error while request..');
   }
 });
		  }else{window.location.href="loginpage";}});
}

 var tablec = $('#ClientCustomerDocHistoryTable').DataTable({
	 "order": [[0, "desc"]],
 bLengthChange: true,
 paging: true
});

function viewDocHistory1(docId,fileType){	
	getsesVal().done(function(data){
		  if(data!=""){
	var	cust_Id=$('#cust_id').val();
	$.ajax({
  	type : "get",
     // url  : "getClientCustomerDocumentHistiryById",
     url  : "getCustomerDocumentHistiryById",
      contentType:"application/json",
      cache : false,
      async : false,
    //  data:{"docId":docId,"candidateId":candidateId},
      data:{"docId":docId},
      success  : function(response){
      	 if (tablec) tablec.clear();
      	 $('#ClientCustomerDocHistoryTable').dataTable().fnClearTable();
      	  	if(response!=""){
          	  for(var i=0;i<response.length;i++){
          		//  alert(response[i].startdate);
          			var fname=response[i].file_name;
	 		          	var encoded = encodeURIComponent(fname);
                     tablec.row.add([
                  	''+response[i].document_id+'',
                  	  '<span onclick="downloadDocument(\''+response[i].file_name+'\',\''+response[i].filetype+'\')" style="color:blue">'+response[i].file_name+'</a>',
                  	//'<span onclick="downloadDocCust('+response[i].file_name+','+response[i].filetype+','+custName+')" style="color: blue">'+response[i].file_name+'</span>',
                  	''+response[i].filetype+'',
                  	''+response[i].startdate+'',
                  	''+response[i].expirydate+'',
                  	''+response[i].submit_date+'',
						''+response[i].posted_by+''
                   ]).draw();                  
                 }
        	}else{
        	  // alert("No data found");
           } 
      	  var title="";
      	 if(fileType=='cust_work_order'){
      		title="Customer WO ";	
      	 }else if(fileType=='Manager_Approved_Email_CWO'){
      		title="Manager Approved e-mail(Consultant) ";
      	 }	
      	$('h5').text(title+"Document History"); 	
      $('#DocumentClientCustomerHistoryModal').modal('show');
    },
//	''+response[i].docStatus+''
   error: function(){  
   alert('Error while request..');
  }
});
		  }else{window.location.href="loginpage";}});
}

var tablev = $('#ClientVendorDocHistoryTable').DataTable({
	 "order": [[0, "desc"]],
bLengthChange: true,
paging: true
});

function viewDocHistory(docId,fileType){	
	getsesVal().done(function(data){
		  if(data!=""){
	var	vendId=$('#ven_id').val();
	$.ajax({
 	type : "get",
   //  url  : "getClientVendorDocumentHistiryById",
     url  : "getCustomerDocumentHistiryById",
     contentType:"application/json",
     cache : false,
     async : false,
     data:{"docId":docId},
    // data:{"vendId":vendId,"candidateId":candidateId,"fileType":fileType},
     success  : function(response){
     	 if (tablev) tablev.clear();
     	 $('#ClientVendorDocHistoryTable').dataTable().fnClearTable();
     	  	if(response!=""){
         	  for(var i=0;i<response.length;i++){
         		//  alert(response[i].startdate);
         			var fname=response[i].file_name;
	 		          	var encoded = encodeURIComponent(fname);
                    tablev.row.add([
                 	''+response[i].document_id+'',
                 	  '<span onclick="downloadDocument(\''+response[i].file_name+'\',\''+response[i].filetype+'\')" style="color:blue">'+response[i].file_name+'</span>',
                 	//'<span onclick="downloadDocCust('+response[i].file_name+','+response[i].filetype+','+custName+')" style="color: blue">'+response[i].file_name+'</span>',
                 	''+response[i].filetype+'',
                 	''+response[i].startdate+'',
                 	''+response[i].expirydate+'',
                 	''+response[i].submit_date+'',
						''+response[i].posted_by+''
                  ]).draw();                  
                }
       	}else{
       	  // alert("No data found");
          } 
     	 var title="";
     	 if(fileType=='ven_work_order'){
     		title="Vendor WO ";	
     	 }else if(fileType=='Consultant_Consent_Agreement'){
     		title="Consultant Consent Agreement ";
     	 }else if(fileType=='Consultant_Compliance'){
     		title="Consultant Compliance ";
     	 }else if(fileType=='Manager_Approved_Email_VWO'){
     		title="Manager Approved e-mail(Consultant) ";
     	 }
     	$('h5').text(title+"Document History");
     $('#DocumentClientVendorHistoryModal').modal('show');
   },
//	''+response[i].docStatus+''
  error: function(){  
  alert('Error while request..');
 }
});
		  }else{window.location.href="loginpage";}});
}

var vtable = $('#vendorDocHistoryTable').DataTable({
	 "order": [[0, "desc"]],
  bLengthChange: true,
  paging: true
});

function viewVendorDocHistory(docId,fileType,inputVal){	
	getsesVal().done(function(data){
		  if(data!=""){
	/* var	vendId;
	if(venId!=""){
		vendId=venId;
	}
	else{
		vendId=$('#ven_id').val();
    } */
	$.ajax({
  	type : "get",
      url  : "getVendorDocumentHistiryById",
      contentType:"application/json",
      cache : false,
      async : false,
      data:{"docId":docId,"fileType":fileType,"inputVal":inputVal},
      success  : function(response){
      	 if (vtable) vtable.clear();
      	 $('#vendorDocHistoryTable').dataTable().fnClearTable();
      	  	if(response!=""){
          	  for(var i=0;i<response.length;i++){
          		//  alert(response[i].startdate);
          			var fname=response[i].file_name;
	 		          	var encoded = encodeURIComponent(fname);
	 		          	vtable.row.add([
                  	    ''+response[i].document_id+'',
                  	  '<a href="downloadocs?filetype='+response[i].filetype+'&filename='+encoded+'&vendorName='+response[i].venName+'" style="color:blue">'+response[i].file_name+'</a>',
                  	//'<span onclick="downloadDocCust('+response[i].file_name+','+response[i].filetype+','+custName+')" style="color: blue">'+response[i].file_name+'</span>',
                  	''+response[i].filetype+'',
                  	''+response[i].inputval+'',
                  	''+response[i].startdate+'',
                  	''+response[i].expirydate+'',
                  	''+response[i].submit_date+'',
                  	''+response[i].posted_by+''
                   ]).draw();                  
                 }
          	//  '<input type="hidden" value='+response[i].document_id+'>',
        	}else{
        	  // alert("No data found");
           } 
      	     
      	var title="";
      	 if(fileType=='Vendor_MSA'){
      		title="Vendor MSA ";	
      	 }else if(fileType=='Business Compliance'){
      		 var title2;
      		var title1="Business Compliance - ";
      		 if(inputVal=='Executed_irs_w9_form'){
      			title2="Executed IRS W-9 Form ";
      		 }else if(inputVal=='insurance_certificate'){
      			title2="Insurance Certificate ";
      		 }else if(inputVal=='certificate_incorporation'){
      			title2="Certificate Incorporation ";
      		 }else if(inputVal=='standing_certificate'){
      			title2="Good Standing Certificate ";
      		 }
      		title=title1+title2;
      	 }else if(fileType=='Manager_Approved_Email_VMSA'){
      		title="Management Approved e-mail(Vendor) ";
      	 }
      	$('h5').text(title+"Document History");
      $('#DocumentVendorHistoryModal').modal('show');
    },
//	''+response[i].docStatus+''
   error: function(){  
   alert('Error while request..');
  }
});
		  }else{window.location.href="loginpage";}});
} 

var tablep = $('#ProjectDetailsHistoryTable').DataTable({
	 "order": [[0, "desc"]],
bLengthChange: true,
paging: true
});

function viewProjectDetailsHistory(payRateId){	
	getsesVal().done(function(data){
		  if(data!=""){
	$.ajax({
 	type : "get",
     url  : "getProjectDetailsHistoryById",
     contentType:"application/json",
     cache : false,
     async : false,
     data:{"payRateId":payRateId},
     success  : function(response){
     	 if (tablep) tablep.clear();
     	 $('#ProjectDetailsHistoryTable').dataTable().fnClearTable();
     	  	if(response!=""){
         	  for(var i=0;i<response.length;i++){
         			var fname=response[i].file_name;
	 		          	var encoded = encodeURIComponent(fname);
	 		          	tablep.row.add([
                 	''+response[i].phistory_id+'',
                 	''+response[i].custname+'',
                 	''+response[i].vendorname+'',
                 	''+response[i].proj_startDate+'',
                 	''+response[i].proj_endDate+'',
                 	''+response[i].submittedOn+'',
					''+response[i].submittedBy+''
                  ]).draw();                  
                }
       	}else{
       	  // alert("No data found");
          } 
     	$('h5').text("Project Details History"); 	
     $('#ProjectDetailsHistoryModal').modal('show');
   },
//	''+response[i].docStatus+''
  error: function(){  
  alert('Error while request..');
 }
});
		  }else{window.location.href="loginpage";}});
}

var curproject_status=$("#curproject_status").val();
if(curproject_status=='InActive'){
   $("#updateClientVendorForm :input").attr("disabled", true);
   document.getElementById('btngoBack').disabled=false;
}else{
	document.getElementById('btnUpdate').disabled=true;
}
var workauth=$("#work_authorization").val();
var org_name=$("#organization_name1").val();
var reason_lca=$("#reason_lca1").val();
if(workauth=='H-1B' ){
	//alert("reason_lca"+reason_lca);
	if(reason_lca==""){
	     document.getElementById('btnUpdate').disabled=false;
	}else{
		document.getElementById('btnUpdate').disabled=true;
	}
	 var val="Tekskills Inc";
	 var $dropdown2 = $("select[name='organization_name']");
     $dropdown2.find('option[value="' + val + '"]').attr('selected', true);	
     $("#remote_soc_code").val($("#remote_soc_code1").val()).trigger('change');
	/* var $dropdown3 = $("select[name='reason_lca']");
	 $dropdown3.find('option[value="' + reason_lca + '"]').attr('selected', true);	 */
	// $("#organization_name,#reason_lca,#cand_job_title,#education,#remote_line1,#remote_line2,#remote_city,#remote_state,#remote_zipcode,#remote_county,#remote_soc_code").attr('readonly', 'readonly');
	// $("input[name='workinglocation']").attr('disabled', 'disabled');
}

//$("#endline1,#endline2,#endcity,#endstate,#endzipcode").attr('readonly', 'readonly');

var workloc=$("#workinglocation1").val();
if(workloc=='Remote/Home'){
$("#remoteAddress").show();
$("#worklocation1"). prop("checked", true);
}else{	
$("#worklocation2"). prop("checked", true);
}

var emp_type= $('#emp_type').val();
if(emp_type=='W2'){
	var cust_id= $('#cust_id').val();
	var customertype=$("select[name='customertype']");
	customertype.find('option[value="'+cust_id+'"]').attr('selected', true);
	$('#customertype option[value="' + cust_id + '"]').show();
	$('#customertype').children('option').hide(); 
	 $.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "application/json", // NOT dataType!
	        url  : "CustomerDetailsById",
	        data:{custid:cust_id},
	        success  : function(response){
	        	var cust = response.custObj;
	          	var cust_address = response.custAddressObj;
	          	var caddress=cust_address.line1+","+cust_address.line2+","+cust_address.city+","+cust_address.state+","+cust_address.country+","+cust_address.zipcode;
	          	$("#customer_add").val(caddress);
	        }
	 });
}else if(emp_type=='C2C'){
	var venid= $('#vendortype').val();
	 $.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "application/json", // NOT dataType!
	        url  : "VendorDetailsById",
	        data:{venid:venid},
	        success  : function(response){
			        	var ven = response.vendObj;
			        	var ven_address = response.vendorAddressObj;
			          	var vaddress=ven_address.line1+","+ven_address.line2+","+ven_address.city+","+ven_address.state+","+ven_address.zipcode;
				         $("#vendor_add").val(vaddress);
	        }
	 });
}
var invoiceperiod=$("#invoiceperiod").val();
var $dropdown3 = $("select[name='invoice_period']");
$dropdown3.find('option[value="' + invoiceperiod + '"]').attr('selected', true);

var lcadocCount=$("#lcadocCount").val();
//alert(lcadocCount);
if(lcadocCount>0){
	$("#endline1,#endline2,#endcity,#endstate,#endzipcode").attr('readonly', 'readonly');
	 $("#organization_name,#reason_lca,#cand_job_title,#education,#remote_line1,#remote_line2,#remote_city,#remote_state,#remote_zipcode,#remote_county,#remote_soc_code,#metro_politan_area").attr('readonly', 'readonly');
	 $("input[name='workinglocation']").attr('disabled', 'disabled');
}else{
	$("#endline1,#endline2,#endcity,#endstate,#endzipcode").removeAttr('readonly', 'readonly');
	 $("#organization_name,#reason_lca,#cand_job_title,#education,#remote_line1,#remote_line2,#remote_city,#remote_state,#remote_zipcode,#remote_county,#remote_soc_code,#metro_politan_area").removeAttr('readonly', 'readonly');
	 $("input[name='workinglocation']").removeAttr('disabled', 'disabled');
}

function addInhouseproject(candidate_id,emptype){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#in_candidateid').val(candidate_id);
	$('#in_emptype').val(emptype);
	$('#in_projectname').val("Tekskills In-house");
	$('#in_line1').val("5 Independence Way, Suite 135");
	$('#in_city').val("Princeton");
	$('#in_state').val("New Jersey");
	$('#in_zipcode').val("08540");
	$('#in_payrateid').val(0);
	$("#in_enddate").attr("disabled", true);
	$("#in_startdate").datepicker({
	}).on('changeDate', function(selected) {
	    $('#addInhouseForm').formValidation('revalidateField', 'in_startdate');
	});	
	$("#in_enddate").datepicker({
	}).on('changeDate', function(selected) {
	    $('#addInhouseForm').formValidation('revalidateField', 'in_enddate');
	});
	$('#addinhouseporejectmodal').modal('show');
}else{window.location.href="loginpage";}});
}


$("#in_startdate").on('change', function(){
	   var fromdate1=$('#in_startdate').val();
	   if(fromdate1!=""){
	     var minDate=new Date(fromdate1);
	     $('#in_enddate').datepicker('setStartDate', minDate);
	     $("#in_enddate").attr("disabled", false);
	   }else{
		   $("#in_enddate").attr("disabled", true);
		    $('#in_enddate').val('').datepicker('update');
	   }
});
$("#in_enddate").on('change', function(){
	   var expirydate1=$('#in_enddate').val();
	   if(expirydate1!=""){
	     var minDate=new Date(expirydate1);
	     $('#in_startdate').datepicker('setEndDate', minDate);
	   }
});

$('#addInhouseForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {	
    	project_name: {
            validators: {
            	isEmpty: {
                    message: 'Project Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Project Name must be more than 2 and less than 100 characters long.'
                },
                regexp: {
                   regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
                    message: ' Project Name accepts alphabets and spaces. Spaces are not allowed at the beginning or end of the Name'
                }
            }
        },
        in_startdate:{
            validators: {
            	notEmpty: {
                    message: 'Project Start Date is mandatory'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'invalid Date'
                }
            }
        },
        
        in_enddate:{
            validators: {
            	isEmpty: {
                    message: 'Project End Date is mandatory'
                }, 
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'invalid Date'
                }
            }
        },
        payrolltype:{
            validators: {
            	notEmpty: {
                    message: 'Please select timesheet type'
                }
            }
        }
    }
    });
$("#inhousesubmitid").click(function(event) {
	getsesVal().done(function(data){
		  if(data!=""){
	event.preventDefault();
	$('#addInhouseForm').formValidation('validate');
	if (!$('#addInhouseForm').data('formValidation').isValid()) {
		//alert("not Valid");
	} else {
		$("#inhousesubmitid").attr("disabled", true);
		var candidate_id=$("#in_candidateid").val();
		var empType=$("#in_emptype").val();
		var form = $('#addInhouseForm')[0];
		var data = new FormData(form);
		var in_payrateid=$("#in_payrateid").val();
		
		$.ajax({
			url : "saveupdateinhouseproject", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(response) {
				 if(response!=null || response!=""){
	   	            	alert(response)
	   	            	window.location.href="viewClientVendor?candidate_id="+candidate_id+"&empType="+empType+"";
	   	   	         }
	   	   	      else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			}
		});
	}
		  }else{
				 window.location.href="loginpage";
			}
		});
});
function viewInhouseproject(candidate_id,emptype,payrateid,clientcount,inhousecount){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#in_candidateid').val(candidate_id);
	$('#in_emptype').val(emptype);
	if(clientcount==0 && inhousecount==0){
		$("#inhousesubmitid").attr("disabled",false);
	}else if(clientcount==0 && inhousecount==1){
		$("#inhousesubmitid").attr("disabled",true).prop("title","Client project is active,can't update the in-house project");
	}
	else if(clientcount>0 && inhousecount==0){
		$("#inhousesubmitid").attr("disabled",true).prop("title","Client project is active,can't update the in-house project");
	}
	$.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/json", // NOT dataType!
		url : "viewInhouseproject",
		data : {
			candidate_id : candidate_id,
			empType : emptype,
			payrate_id : payrateid
		},
		success : function(response) {
			
		if(response!=null || response!=""){
			$('#payrolltype').val(response.payroll_type);
			$('#in_enddate').val(response.proj_endDate);
			$('#in_startdate').val(response.proj_startDate);
			$('#in_projectname').val(response.projectName);
			$('#in_line1').val(response.line1);
			$('#in_line2').val(response.line2);
			$('#in_city').val(response.city);
			$('#in_state').val(response.state);
			$('#in_zipcode').val(response.zipcode);
			$('#dbdate').val(response.proj_startDate);
			$('#in_payrateid').val(payrateid);
			
			$("#in_startdate").datepicker({
			}).on('changeDate', function(selected) {
			    $('#addInhouseForm').formValidation('revalidateField', 'in_startdate');
			});	
			$("#in_enddate").datepicker({
			}).on('changeDate', function(selected) {
			    $('#addInhouseForm').formValidation('revalidateField', 'in_enddate');
			});
		    }
		     $('#addinhouseporejectmodal').modal('show');
		  }
	}); 
	
		  }else{
				 window.location.href="loginpage";
			}
		});
}
$('#addinhouseporejectmodal').on('hidden.bs.modal', function (){
	getsesVal().done(function(data){
		  if(data!=""){
	var candidate_id=$("#in_candidateid").val();
	var empType=$("#in_emptype").val();
   	window.location.href="viewClientVendor?candidate_id="+candidate_id+"&empType="+empType+"";
		  }else{
				 window.location.href="loginpage";
			}
		});
});

window.onload=function(){
	$.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/text",
		url : "getallpaymentterms",
		success : function(response) {
		      $('#invoice_terms').empty(); 
			  const obj = JSON.parse(response);
				$('#invoice_terms').append($('<option/>').attr("value", '').text("Select Payment Terms"));
			    $.each(obj.IntuitResponse.QueryResponse.Term, function (index, value) {  
				$('#invoice_terms').append($('<option/>').attr("value",value.Id).text(value.Name));
			 });
		}
	}).done(function(){ 
		var invoice_terms=$("#invoice_terms1").val();
		var $dropdown4 = $("select[name='invoice_terms']");
		$dropdown4.find('option[value="' + invoice_terms + '"]').attr('selected', true);
	});
};
</script>
</body>
</html>
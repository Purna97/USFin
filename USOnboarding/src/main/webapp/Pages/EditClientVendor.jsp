<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/css/datepicker3.min.css"/>
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
		
		<input type="hidden" name="candfullName" id="candfullName"  value="${basicObj.full_name}">
		<input type="hidden" name="canempType" id="canempType"  value="${empType}">
		<input type="hidden" name="joiningdate" id="joiningdate" value="${basicObj.joiningdate}">
		<input type="hidden" name="activestatus" id="activestatus" value="${activestatus}">
		<input type="hidden" name="payratesize" id="payratesize" value="${payratesize}">
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
						 <%-- <c:if test="${empty basicObj.billing}">
					<center><font color=blue><strong>Employee billing type missed, to add either client or In-house project ,please update from employee basic info</strong></font></center>
					</c:if>	 --%>
										 
					<div class="card" id="loadpage">
						<div class="row">
							<div class="col-lg-12">
								<div class="well bs-component">
								<%-- <c:if test="${empType eq 'W2'}"> --%>
								 <c:if test="${ccvlistsize gt 0}"> 
							<div class="col-lg-12">
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
                                                               <th style="text-align: center;width:130.8px;">Action</th>
                                                               <c:if test="${empType ne 'W2'}">
                                                               <th style="text-align: center">Exit</th>
                                                               </c:if>
                                                                <%-- <c:if test="${empType eq 'W2' && cclist.project_status eq 'Active' && not empty cclist.clientName}">
                                                               <th style="text-align: center">Create Product</th>
                                                               </c:if> --%>
                                                        </tr>
                                                 </thead>
                                                 <tbody>
													<c:forEach var="cclist" items="${ccvlist}">
																	<tr>
																	<c:choose>
																	<c:when test="${not empty cclist.custname}">
																	<td id="custnametd${cclist.payrate_id}">${cclist.custname}</td>
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
																		<td id="proj_startdatetd${cclist.payrate_id}">${cclist.proj_startDate}</td>
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
                                                             			 InActive</button>
                                                             			   <c:if test="${not empty cclist.clientName}">
                                                             			  <a class="btn btn-primary btn-sm" style="padding: 0px 0px; font-size: 12px;color:white;" data-toggle="modal" data-target="#productmodal" onclick="createprod('${cclist.payrate_id}','${cclist.billrate}')">View Product</a>
                                                             			  </c:if>
                                                             			 </td> 
                                                             			 
                                                               			  </c:if>
                                                             			  <c:if test="${cclist.project_status eq 'InActive'}">
                                                             			   <td>
                                                             			   <c:if test="${(emptype eq 'Admin' || emptype eq 'W2 Admin') && role eq 4}">
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
																		<button class="btn btn-success btn-sm"  onclick="inactiveProject('${cclist.payrate_id}','${cclist.candidate_id}','${cclist.project_status}','${empType}','${cclist.activeCount}')" 
                                                             			 data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"  title="Activate the project">
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
                                                             			   
                                                             			  <%--  <c:if test="${cclist.project_status eq 'Active' && not empty cclist.clientName}">
                                                             			  <td>
                                                             			  <a class="btn btn-primary btn-sm" style="padding: 0px 0px; font-size: 12px;color:white;" data-toggle="modal" data-target="#productmodal" onclick="createprod('${cclist.payrate_id}','${cclist.billrate}')">Create Product</a>
                                                             			  </td>
                                                             			  </c:if> --%>
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
                                    </div><%-- </c:if> --%>
									 </c:if> 
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		
                                    
			  <div class="row" id="showdetails" style="display: none;">
				<div class="col-md-12">
				 <%-- <c:choose>
	             <c:when test="${emptype=='C2C'}">
						<h5 class="card-header">US Onboarding- View Client & Vendor Details</h5>
				</c:when>
				<c:otherwise>
				    <h5 class="card-header">US Onboarding- View Client & Customer Details</h5>
				</c:otherwise>
				</c:choose>  --%><c:forEach var="cclist" items="${ccvlist}">
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
																		<button class="btn btn-danger btn-sm"  disabled onclick="#" 
                                                             			 data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"  title="Can't Activate the project">
                                                             			 Activate</button>
																		</c:if>
																		</c:when>
																		<c:otherwise>
																		
																		<c:if test="${countObj.clientcount eq 0 && countObj.inhousecount eq 0}">
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
																		</c:if>
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
                                                             			   <button class="btn btn-success btn-sm"  onclick="inactiveProject('${cclist.payrate_id}','${cclist.candidate_id}','${cclist.project_status}','${empType}','${cclist.activeCount}')" 
                                                             			 data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"  title="Inactive the project">
                                                             			 Activate</button>
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
                             			<input type="hidden" id="pro_startdate1" value="${custlist.proj_startDate}">
                             			<input type="hidden" id="pro_enddate1" value="${custlist.proj_endDate}">
                             			<input type="hidden" id="payrolltype1" value="${custlist.payroll_type}">
                             			
                                    
                                                     
                             			<h4><b>Customer Details</b></h4>
									    <div class="form-group row" >  
									    	   <label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;"></Span>Select Customer</label>
											   <div class="col-lg-4">
											     <select name="customertype" autoComplete="off" class="form-control text-left" id="customertype" onchange="loadcustomer()" required>
										             <%-- <option value="${custlist.custid}">${custlist.custname}</option> --%>
										             <option value="" disabled>--Select Customer--</option>
										               <c:forEach var="custl" items="${cutomerList}">
															<option value="${custl.companyId}" ${custl.companyId == custlist.custid ? 'selected="selected"' : ''}>${custl.companyName}</option>
														</c:forEach>
												<!-- <option value="AddCustomerDetails">Add Customer Details</option> -->
										         </select>
										    </div> 
										    </div>
									    
									<%--          <div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;">*</Span>Customer Name</label>
												<div class="col-lg-4">
													<input id="customer_name" type="text" 
													   title="only alphabets are allowed"
														autocomplete="off" placeholder="Customer Name"
														name="customer_name" value="${custlist.custname}" class="form-control"
														readonly >
												</div>
								<%if(employeeType.equalsIgnoreCase("W2AdministrationEmployees")&&dept_id==5&&role==2||dept_id==12&&employeeType.equalsIgnoreCase("Internal")&&emprole==4){ %>
											<div class="form-group row">
											<!-- 	<div class="col-lg-2" id="edit">
												<a 	class="btn btn-success btn-sm" id="editempinfo"
															onClick="editclient_info()" role="button">
													<i class="icon-check"></i>Edit Details</a>
											     </div> -->
											    <!--  <div class="form-group" id="bid" > 
														<button id="button" class="btn btn-warning btn-xs" role="button"><i class="icon-check"></i>Inactive</button>
												 </div> -->
											</div>
							     	<%} %>
											</div> --%>

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
												<div class="col-lg-4">
												<input class="form-control" id="invoice_terms"  autocomplete="off"  name="invoice_terms" 
															title="Enter Invoice Terms as eg NET 30" value="${custlist.invoiceterms}"
														placeholder="Enter Payment Terms as eg NET 30" type="text" required>
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
														title="Enter date in MM/DD/YYYY format only"
														name="pro_startdate" placeholder="Project start date" value="${custlist.proj_startDate}" 
														class="form-control" required autocomplete="off">
												</div>
											</div>
									


											<div class="form-group row">
												<label for="inputPassword" class="col-lg-3 control-label"><Span
													style="color: red;">*</Span>Project end date</label>
												<div class="col-lg-4">
													<input type="text" id="pro_enddate"
														class="form-control text-left"
														pattern="(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}"
														title="Enter date in MM/DD/YYYY format only"
														name="pro_enddate" placeholder="Project end date" value="${custlist.proj_endDate}"
														class="form-control" required autocomplete="off">
												</div>
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
					    				 ${viewcvbean.cust_msa}</span>
									    </c:otherwise>
									    </c:choose>
									    </div> 
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
								<div class="form-group row" >
								<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Customer WO</label>
									<div class="col-lg-3">
									<c:choose>
	                               <c:when test="${empty viewcvbean.cust_w_order}">
									<a>NA</a>
							    	</c:when>
							    	<c:otherwise>
							    	<input type="hidden" value="${viewcvbean.c_edid}" name="c_edid" />
									<span onclick="downloadDocument('${viewcvbean.cust_w_order}','cust_work_order')" style="color: blue">
					    			${viewcvbean.cust_w_order}</span>
							    	</c:otherwise>
							    	</c:choose>
								    </div> 
								    <div class="form-group row" id="f1" style="display:none">
													<div class="col-lg-2">
													<input type="hidden" value="cust_work_order" name="cust_work_order" />
								                	<input type="file" id="cw_order" name="cw_order" onchange="ValidateSize(this)">
													</div>
									</div>
									</div>
									<br>
						         <c:choose>
	                             <c:when test="${empType=='1099' || empType=='W2'|| empType=='C2C' }">
								<c:if test="${not empty viewcvbean.mgr_apr_mail_cwo}">
								    <div id="btn1" class="form-group row" >		
								     <label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Manager Approved e-mail(Consultant)</label>
									<div class="col-lg-2">
							        <span onclick="downloadDocument('${viewcvbean.mgr_apr_mail_cwo}','Manager_Approved_Email_CWO')" style="color: blue">
					    			${viewcvbean.mgr_apr_mail_cwo}</span>
									</div>
									</div>
							     </c:if>
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
					    			    ${viewcvbean.ven_msa}</span>
									   </c:otherwise>
									   </c:choose>
									    </div> 
								</div>
								<div id="mgrven">
								<c:if test="${not empty viewcvbean.vmsamgr_apr_mail}">
								<div class="form-group row" >		
								<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Manager Approved e-mail(Vendor)</label>
									<div class="col-lg-4">
							              <span onclick="downloadDocVen('${viewcvbean.vmsamgr_apr_mail}','Manager_Approved_Email_VMSA','${viewcvbean.vendorname}')" style="color: blue">
					    			       ${viewcvbean.vmsamgr_apr_mail}</span>
									</div>
									</div>
								</c:if>
								</div>
								<h4>Uploaded Business Compliance</h4>
								 <div class="form-group row">
								 <label for="inputPassword" class="col-lg-3 control-label"></label>
								  <div class="col-lg-4" id="BCdocs">
									</div>
								 </div>
								 <div class="form-group row" id="upamv"  style="display:none">
									  <label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Management Approved Mail(Vendor)</label>
										<div class="col-lg-4"  id="uplodmamv">
								    	</div>
								</div>
						<center id="tid">			
						<table id="sampleTable" class="table" style="border-collapse: collapse;max-width:60%; border: none;" cellspacing="0" cellpadding="0" 
						style="text-align: center;">
						
						<tbody>
						<c:forEach var="bsc"	items="${viewcvbean.vendordocs}">
								<tr style="border: none;">
								<td style="border: none;">${bsc.inputval}</td>
								<td style="border: none;">
								 <span  onclick="downloadDocVen('${bsc.fileName}','Business Compliance','${viewcvbean.vendorname}')" style="color: blue">
					    			${bsc.fileName}</span>
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
							</c:forEach>
						</tbody>
					</table>
						</center>			
										
								<div class="form-group row">
								<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Vendor WO</label>
								<div class="col-lg-3">
									<c:choose>
	                               <c:when test="${empty viewcvbean.ven_w_order}">
									<a>NA</a>
							    	</c:when>
							    	<c:otherwise>
							    	<input type="hidden" value="${viewcvbean.v_edid}" name="v_edid" />
							          <span onclick="downloadDocument('${viewcvbean.ven_w_order}','cust_work_order')" style="color: blue">
					  				  ${viewcvbean.ven_w_order}</span>
							    	</c:otherwise>
							    	</c:choose>
								</div>
								<div class="form-group row" id="f2" style="display:none">
													<div class="col-lg-2">
													<input type="hidden" value="ven_work_order" name="ven_work_order" />
								                    <input type="file" id="w_order" name="w_order" onchange="ValidateSize(this)">
													</div>
								</div> 
								</div>
								<div class="form-group row">
								<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Consultant Consent Agreement</label>
								<div class="col-lg-3">
								<c:choose>
	                               <c:when test="${empty viewcvbean.cagreement}">
									<a>NA</a>
							    	</c:when>
							    	<c:otherwise>
							    		<input type="hidden" value="${viewcvbean.cca_edid}" name="cca_edid" />
							              <span onclick="downloadDocument('${viewcvbean.cagreement}','Consultant_Consent_Agreement')" style="color: blue">
					  				       ${viewcvbean.cagreement}</span>
							    	</c:otherwise>
							    	</c:choose>
								</div>
								<div class="form-group row" id="f3" style="display:none">
													<div class="col-lg-2">
													<input type="hidden" value="Consultant_Consent_Agreement" name="Consultant_Consent_Agreement" />
								                	<input type="file" id="cagreement" name="cagreement" onchange="ValidateSize(this)">
													</div>
								</div> 
								</div>
								<div class="form-group row">		
								<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Consultant Compliance</label>
									<div class="col-lg-3">
									<c:choose>
	                               <c:when test="${empty viewcvbean.cCompliance}">
									<a>NA</a>
							    	</c:when>
							    	<c:otherwise>
							    		<input type="hidden" value="${viewcvbean.cc_edid}" name="cc_edid" />
							             <span onclick="downloadDocument('${viewcvbean.cCompliance}','Consultant_Compliance')" style="color: blue">
					  				       ${viewcvbean.cagreement}</span>
							    	</c:otherwise>
							    	</c:choose>
									</div>
									<div class="form-group row" id="f4" style="display:none">
													<div class="col-lg-2">
													<input type="hidden" value="Consultant_Compliance" name="Consultant_Compliance" />
								                	<input type="file" id="cCompliance" name="cCompliance" onchange="ValidateSize(this)"><br>
													</div>
									</div> 
									</div>
									
						           
									<c:if test="${not empty viewcvbean.mgr_apr_mail_vwo}">
								    <div id="btn5" class="form-group row">		
								    <label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Manager Approved e-mail(Consultant)</label>
									<div class="col-lg-2">
							             <span  onclick="downloadDocument('${viewcvbean.mgr_apr_mail_vwo}','Manager_Approved_Email_VWO')" style="color: blue">
					  				       ${viewcvbean.mgr_apr_mail_vwo}</span>
									</div>
									</div>
							     	</c:if>
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
                                      <input type="hidden" id="endline11}" value="${endClient.line1}">
                                      <input type="hidden" id="endline21" value="${endClient.line2}">
                                      <input type="hidden" id="endcity21" value="${endClient.city}">
                                      <input type="hidden" id="endstate21}" value="${endClient.state}">
                                      <input type="hidden" id="endzipcode21" value="${endClient.zipcode}">
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
								
						
									<c:forEach var="otherclientlist" items="${otherclientlist}">
                                      <input type="hidden" name="otherclientid" id="otherclientid" value="${otherclientlist.clientid}">
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
                                              
                                       <h4><b>Other Client Details</b></h4>
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
											<div class="form-group row" id="editcl">
											    <!--  <div class="form-group" id="bid" > 
														<button id="button" class="btn btn-warning btn-xs" role="button"><i class="icon-check"></i>Inactive</button>
												 </div> -->
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
                                       <label for="inputPassword" class="col-lg-3 control-label">Add Other Client Details</label>
												<div class="col-xs-4">
													<button type="button"  class="btn btn-success addButton">
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                        </div>
											<div class="form-group" id="addotherclient" style="display:none;">
												<div class="form-group row">
													<label for="inputPassword" class="col-lg-3 control-label"><Span
														style="color: red;">*</Span>Client Name</label>
													<div class="col-lg-4">
														<input class="form-control" id="othr_client_name" minlength="2" maxlength="100"
															name="othr_client_name[]" placeholder="Client Name"
															pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
															title="Enter Only alphabets" type="text" required>
													</div>
													<div class="col-xs-4">
													<button type="button" class="btn btn-danger removeButton">
														<i class="fa fa-minus"></i>
													</button>
												</div>
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
												 <button type="button" id="btnUpdate" class="btn btn-default" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" onclick="btnClick()" disabled>Update</button>
										 		 </c:if>
										 		 <button type="button" onclick="goBack()" class="btn btn-default btn-sm" style="padding:7px;background-color:grey;color:white;line-height:0.728571;">Back</button>									
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
				
				<div class="modal fade" id="productmodal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		style="top: 60px;">
		<div class="modal-dialog modal-lg" style="max-width: 60%;"
			role="document">
			<div class="modal-content" style="height: 100%;">
				<div class="modal-header" style="padding: .5rem;">
					<button class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>

					<center>
						<h5 class="modal-title" id="exampleModalLabel"
							style="font-size: 15px">
							<b>View Products and Services</b>
						</h5>
					</center>
				</div>
				<div class="modal-body">
					<div>
						<div class="content">
							<div class="row">
								<div class="col">
									<div class="card">
										<div class="col-md-12 col-sm-6">
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"
													style="margin-top: .5%;"><Span style="color: red;"></Span>Product
													Name</label>
												<div class="col-sm-6">
													<input id="productName" type="text"
														title="only alphabets are allowed" minlength="2"
														maxlength="100" autocomplete="off"
														placeholder="Enter Product Name" name="productName"
														class="form-control" readonly>
														<!-- <span style="color:blue;">Product Name Format: ProductName_CustomerName </span> -->
												</div>
											</div>
											
											<!-- <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"
													style="margin-top: .5%;"><Span style="color: red;"></Span>Project Start
													Date</label>
												<div class="col-sm-4">
												<input type="text" id="hiredate" class="form-control text-left"  autocomplete="off" onkeydown="return false"
												title="Enter date in MM/DD/YYYY format only" name="hiredate" placeholder="Project Start Date" class="form-control" readonly >
												</div>
											</div> -->
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"
													style="margin-top: .5%;"><Span style="color: red;"></Span>Unit
													Price($)</label>
												<div class="col-sm-4">
													<input id="unitprice" type="text"
														title="only alphabets are allowed" minlength="2"
														pattern="[0-9]{5}" maxlength="5" autocomplete="off"
														placeholder="Enter unitprice " name="unitprice"
														class="form-control" readonly>
												</div>
											</div>

											<!-- <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"
													style="margin-top: .5%;"><Span style="color: red;">*</Span>Description</label>
												<div class="col-sm-4">
													<input id="description" type="text"
														title="only alphabets are allowed" minlength="2"
														maxlength="50" autocomplete="off"
														placeholder="Enter Description" name="description"
														class="form-control" required>
												</div>
											</div>

											<div class="form-group row">
												<div class="col-sm-3">
													<button type="button" style="margin-left: 395px;"
														id="createproduct" class="btn btn-info btn-sm" disabled>SUBMIT</button>
												</div>
											</div> -->
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
<script src="resources/preDefined/goback.js"></script>
<script>
$('input[type="file"]').change(function(e){
    var fileName = e.target.files[0].name;
    $('#btnUpdate').removeAttr("disabled");
});

$('#bill_rate').on('keyup', function() {
	 if($('#bill_rate').val()==$('#bill_rate1').val())
	{document.getElementById('btnUpdate').disabled=true;}else{document.getElementById('btnUpdate').disabled=false;} 
 });
 
 $('#invoice_terms').on('keyup', function() {
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
 */ $("#f1").show();
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
   /*  $("#pro_startdate").datepicker({
			changeMonth:true,
			changeYear:true,
		}) */
      .on('changeDate', function(e) {
          $('#updateClientVendorForm').formValidation('revalidateField', 'pro_startdate');
          $('#pro_enddate').datepicker('setStartDate', new Date($(this).val()));
      });
	     var startdate=$( "#pro_startdate" ).val();
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
    $("#f2").show();
    $("#f3").show();
    $("#f4").show();
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
	               	notEmpty: {
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
	               	notEmpty: {
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
            }

	     
    }
}) 
.on('click', '.addButton', function() {
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

 .on('click', '.removeButton', function() {
     var $row  = $(this).parents('.form-group'),
         index = $row.attr('data-book-index');
        $othr_client_name = $row.find('[name="othr_client_name[]"]');

     // Remove fields
     $('#updateClientVendorForm')
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
                   $('#updateClientVendorForm').find('.addButton').attr('disabled', 'disabled');
               }
           }
        })
        .on('removed.field.fv', function(e, data) {
            if (data.field === 'othr_client_name[]') {
                 if ($('#updateClientVendorForm').find(':visible[name="othr_client_name[]"]').length <= MAX_OPTIONS) {
                     $('#updateClientVendorForm').find('.addButton').removeAttr('disabled');
                 }
             }
         });

</script>
 
 
 
 
 
<script type="text/javascript">

  function loadcustomer(){
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
 		    	 $( "#uploadmam" ).append('<a href="downloadocs?filetype='+response.fileType+'&filename='+encoded+'&customerName='+cust.customer_name+'" style="color:blue">'+response.fileName+'</a>');
 		    	 // $( "#uploadmam" ).append('<a href="USOBT_C2C_View_Controller?action=downloadocs&empno=${empno}&fileId='+response  .fileId+'&filetype='+response.fileType+'&filename='+encoded+'&customerName='+response.custname+'" style="color:blue">'+response.fileName+'</a>');
 		       }else {
 		    	  $( "#uploadMsa" ).empty();
 		    	 $( "#uploadmam" ).empty();
 		    	  $("#upmam").hide();
 		    	 $("#mgrcust").hide(); 
 		    	$( "#uploadMsa" ).append('<a href="downloadocs?filetype='+response.fileType+'&filename='+encoded+'&customerName='+cust.customer_name+'" style="color:blue">'+response.fileName+'</a>');
 		    	 //$( "#uploadMsa" ).append('<a href="USOBT_C2C_View_Controller?action=downloadocs&empno=${empno}&fileId='+response  .fileId+'&filetype=Customer_MSA&filename='+encoded+'&customerName='+response.custname+'" style="color:blue">'+response.fileName+'</a>');
 		      } 
 		       document.getElementById('cw_order').required=true;
 		       $('#updateClientVendorForm').formValidation('enableFieldValidators','cw_order',true);
 		        $('#invoice_terms').val('');
 		         $('#bill_rate').val('');
 		         $('#pro_startdate').val('');
 		         $('#pro_enddate').val('');
 		         $("#btn").hide();
 		        $("#btn1").hide();
 		        }
 	    });

 	  }
 			 
  }	 
 			 
</script>

<script type="text/javascript">

  function loadvendor(){
	  
 	 var venid=document.getElementById('vendortype').value;
 	var ven_id=$('#ven_id').val();
 	if(venid=="AddVendorDetails"){
     	//window.location.href="USOBT_AddVendor_C2C.jsp?candidate_id=${candidate_id}&emp_type=${emptype}"; 
	 } 
 	else if(ven_id==venid){
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
		        	
		            var vDocsList=response.vendorDocs;
		            $("#tid").hide();
		            $("#BCdocs").empty();
		            $( "#uplodmamv" ).empty();
		            $("#vMSA").empty();
		      for(var i=0;i<vDocsList.length;i++){
		            	var fname=vDocsList[i].file_name;
	 		          	var encoded = encodeURIComponent(fname);
		        if(vDocsList[i].filetype=="Vendor_MSA"){
		       $("#vMSA").empty();
		        $("#mgrven").hide(); 
		          $("#vMSA").append('<a href="downloadocs?filetype='+vDocsList[i].filetype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vDocsList[i].file_name+'</a>');
		      // $("#vMSA").append('<a href="USOBT_C2C_View_Controller?action=downloadocs&empno=${empno}&fileId='+vDocsList[i].ed_Id+'&filetype='+vDocsList[i].filetype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vDocsList[i].file_name+'</a>');
		            }else if(vDocsList[i].filetype=="Business Compliance"){
			        	  $( "#BCdocs" ).append('<Span style="color:black;">'+vDocsList[i].inputval+ '</Span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="downloadocs&filetype='+vDocsList[i].filetype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vDocsList[i].file_name+'</a><br><br>');
		             }
		          else if(vDocsList[i].filetype=="Manager_Approved_Email_VMSA"){ 
		        	  $( "#uplodmamv" ).empty();
		        	  $("#mgrven").hide(); 
		        	  $("#uplodmamv").append('<a href="downloadocs?filetype='+vDocsList[i].filetype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vDocsList[i].file_name+'</a>');
		        	//  $("#uplodmamv").append('<a href="USOBT_C2C_View_Controller?action=downloadocs&empno=${empno}&fileId='+vDocsList[i].ed_Id+'&filetype='+vDocsList[i].filetype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vDocsList[i].file_name+'</a>');
	 		    	  $("#upamv").show();
		          }
		        } 
		      /*  else if(vDocsList[i].filetype=="Business Compliance"){
        	  $("#mgrven").hide(); 
        	  $( "#BCdocs" ).append('<Span style="color:black;">'+vDocsList[i].inputval+ '</Span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="downloadocs&filetype='+vDocsList[i].filetype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vDocsList[i].file_name+'</a><br><br>');
        	 // $( "#BCdocs" ).append('<Span style="color:black;">'+vDocsList[i].inputval+ '</Span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="USOBT_C2C_View_Controller?action=downloadocs&empno=${empno}&fileId='+vDocsList[i].ed_Id+'&filetype='+vDocsList[i].filetype+'&filename='+encoded+'&vendorName='+ven.vendorname+'" style="color:blue">'+vDocsList[i].file_name+'</a><br><br>');
          }
          else{ */
		            document.getElementById('w_order').required=true;
			        document.getElementById('cagreement').required=true;
			        document.getElementById('cCompliance').required=true; 
			        $('#updateClientVendorForm').formValidation('enableFieldValidators','w_order',true);
					$('#updateClientVendorForm').formValidation('enableFieldValidators','cagreement',true);
					$('#updateClientVendorForm').formValidation('enableFieldValidators','cCompliance',true);
					    $('#payment_terms').val('');
		 		         $('#pay_rate').val('');  
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
  }
</script>
<script type="text/javascript">
function btnClick(){
	var emp_type= $('#emp_type').val();
	//alert("Brate"+brt+"Prate"+prt);
	 $('#updateClientVendorForm').formValidation('validate');
	if( !$('#updateClientVendorForm').data('formValidation').isValid())
		 {
		   // alert("Not Valid");
		 }
	else{
		if(emp_type=='C2C'){
			var brt=document.getElementById("bill_rate").value;
			var prt=document.getElementById("pay_rate").value;
		if(parseInt(prt)>=parseInt(brt)){
			
			$('#brate').text(brt);
			$('#prate').text(prt);
			$('#myModal').modal('show');
	 	}else{
	 		//alert("Yes Valid");
	 		//document.getElementById("updateClientVendorForm").submit();
	 	$("#btnUpdate").attr("disabled", true);
		var form = $('#updateClientVendorForm')[0];
		var data = new FormData(form);
		$.ajax({
			url : "updateClientVendor",
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
					     window.location.href="viewClientVendor?candidate_id="+candidate_id+"&empType="+empType+"";
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
			url : "updateClientVendor",
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
					     window.location.href="viewClientVendor?candidate_id="+candidate_id+"&empType="+empType+"";
	   	   	         }
	   	   	      else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			}
		  });
		//document.getElementById("updateClientVendorForm").submit();
		}
	  }
	}
	
function submitForm(){
	$('#myModal').modal('hide');
	$("#btnUpdate").attr("disabled", true);
	var form = $('#updateClientVendorForm')[0];
	var data = new FormData(form);
	$.ajax({
		url : "updateClientVendor",
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
				     window.location.href="viewClientVendor?candidate_id="+candidate_id+"&empType="+empType+"";
  	   	         }
   	   	      else{
   	   	          window.location.href="loginpage";
   	   	   	      }
		}
	});
}
</script>
<script type="text/javascript">
function downloadDocVen(fname,ftype,vname){	
	var encoded = encodeURIComponent(fname);	
	window.location.href="downloadocs?filename="+encoded+"&filetype="+ftype+"&vendorName="+vname;
}	
function downloadDocCust(fname,ftype,cname){	
	var encoded = encodeURIComponent(fname);	
	window.location.href="downloadocs?filename="+encoded+"&filetype="+ftype+"&customerName="+cname;
}
function goBack() {
	document.getElementById("bformid").submit();
	}
</script>
<script type="text/javascript">
$('input[name="endmgrdeskNumber"]').mask('999-999-9999');
$('input[name="endempdeskNumber"]').mask('999-999-9999');
$('input[name="endfed_id"]').mask('99-9999999');
$('input[name="othermgrdeskNumber"]').mask('999-999-9999');
$('input[name="otherempdeskNumber"]').mask('999-999-9999');	
$('input[name="otherfed_id"]').mask('99-9999999');
$('input[name="othr_fed_id[]"]').mask('99-9999999');
$('input[name="othr_client_mgr_extn[]"]').mask('999-999-9999');
$('input[name="othr_emp_client_extn[]"]').mask('999-999-9999');

function certificateHistory(){
	$("#historymodal").show();
	
}
function getClientDetails(){
	$('#showdetails').show()
}
function addClientVendor(candidate_id,empType){
	getsesVal().done(function(data){
		  if(data!=""){
	if(empType=="W2"){
	window.location.href="addClientCustomer?candidate_id="+candidate_id+"&empType="+empType+"";
	}else{
		var activestatus=$("#activestatus").val();
		var payratesize=$("#payratesize").val();
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
	window.location.href="viewW2ClientVendor?candidate_id="+candidate_id+"&empType="+empType+"&payrate_id="+payrateid+"";
}

function inactiveProject(payrateid,canid,projectstatus,emptype,activeCount){
	getsesVal().done(function(data){
		  if(data!=""){
   // alert(projectstatus);
	var pstatus="";
	var tablelength = $('#employeeTableId tr').length;
	/* if(activeCount==1 && (tablelength-1)>1 && emptype!="W2"){
		//alert("Active porject is going on, so you can't Active another porject for C2C/1099 Candidates");
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
	}else{}
} */
 /* var canempType=$('#canempType').val();
if(canempType=="W2"){
	$('#showdetails').hide();
}else{
	$('#showdetails').hide();
}  */
$('#showdetails').hide();

function addExitDetails(candidate_id){
	getsesVal().done(function(data){
		  if(data!=""){
	window.location.href="exitDetails?candidate_id="+candidate_id+"";
		  }else{window.location.href="loginpage";}});
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
		  }else{window.location.href="loginpage";}});
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

		  }else{window.location.href="loginpage";}});
}
$('#addinhouseporejectmodal').on('hidden.bs.modal', function (){
	getsesVal().done(function(data){
		  if(data!=""){
	var candidate_id=$("#in_candidateid").val();
	var empType=$("#in_emptype").val();
   	window.location.href="viewClientVendor?candidate_id="+candidate_id+"&empType="+empType+"";
		  }else{window.location.href="loginpage";}});
});
function createprod(payrate_id,billrate){
	$.ajax({
    	type : "GET",
        asyn : false,
        contentType: "application/json", // NOT dataType!
        url  : "getProductServicesByPayRateId",
        data: {
        	"payrate_id":payrate_id
    	  },
        success  : function(response){
        	  if(response!=""){
        		  $('#productName,#unitprice').val('');
        		  $('#productName').val(response.product_name);
        		  $('#unitprice').val(response.unitprice);
        	  }
           }
	    });
/* 	 var custname = $('#custnametd'+id).html();
	 var proj_startdate = $('#proj_startdatetd'+id).html();
	 var candfullName=$("#candfullName").val();
	 var name=candfullName+"_"+custname;
	  $('#productName,#hiredate,#unitprice').val('');
	  $('#productName').val(name);
	  $('#unitprice').val(billrate);
	  $('#hiredate').val(proj_startdate); */
  }
  
$("#createproduct").click(function(event) {
	  if($('#description').val()!=""){
	 var productName = $('#productName').val();
	 var hiredate = $('#hiredate').val();
	 var unitprice = $('#unitprice').val();
	 var description = $('#description').val();
	$.ajax({
		type : "POST",
		asyn : false,
		url : "createproduct",
		data : {
			productName : productName,
			hiredate : hiredate,
			unitprice : unitprice,
			description : description,
		},
		success : function(response) {
	 		if(response!=""){
				 Swal.fire({
					  position: 'top',
					  icon: 'success',
					  width:'500px',
					  height:'900px', 
					  title: 'Product Created Succesfully',
					  showConfirmButton: false,
					  timer: 1250
					}).then((result) => {
						location.reload();
					});

			}else{
				 Swal.fire({
					  position: 'top',
					  icon: 'error',
					  width:'500px',
					  height:'900px', 
					  title: 'Product Already Exists',
					  showConfirmButton: false,
					  timer: 1600
					}).then((result) => {
						location.reload();
					});
			}
		}
	}); 
	}else{
		if($('#description').val()!=""){
			 
		 }else{
			 $('#description').focus(); 
		 }
	  }
 });
</script> 
</body>
</html>
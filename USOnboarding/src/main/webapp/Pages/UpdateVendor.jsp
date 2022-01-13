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
					<div class="col">
						<div class="card">
							<h5 class="card-header">Update Vendor</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-md-8 col-sm-12">
									<fieldset>
										<form action="/" method="post" class="form-horizontal" id="updateVendorForm" enctype="multipart/form-data">
										  		
										     <input type="hidden" id="vendorid" name="vendorid" value="${vendetobj.vendObj.vendorid}">
	                                        <input type="hidden" id="addressid" name="addressid" value="${vendetobj.vendorAddressObj.address_id}">
	                                         <input type="hidden" id="vendor_name1" value="${vendetobj.vendObj.vendorname}">
	                                         <input type="hidden" id="fed_id1" value="${vendetobj.vendObj.fed_id}">
	                                         <input type="hidden" id="ven_phne_no1" value="${vendetobj.vendObj.vendor_contact_no}">
	                                         <input type="hidden" id="ven_mgr_emailid1" value="${vendetobj.vendObj.vendor_mgr_email}">
	                                        <input type="hidden" id="line11" value="${vendetobj.vendorAddressObj.line1}">
					    	        		<input type="hidden" id="line21"  value="${vendetobj.vendorAddressObj.line2}">
					    	        		<input type="hidden" id="zipcode1"   value="${vendetobj.vendorAddressObj.zipcode}">
					    	        		<input type="hidden" id="city1"   value="${vendetobj.vendorAddressObj.city}">
					    	        		<input type="hidden" id="state1"  value="${vendetobj.vendorAddressObj.state}">
					    	        		
					    	        		<input type="hidden" id="fileId" name="fileId" value="">
					    	        		
										<h4><b>Vendor Details</b></h4>
										
										<!-- <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Vendor Type</label>
												<div class="col-sm-4">
												<select name="vendor_type" class="form-control text-left" id="vendor_type" required>
										             <option value="">--Select Vendor Type--</option>
										             <option value="Primary Vendor">Primary Vendor</option>
										             <option value="Secondary Vendor">Secondary Vendor</option>
										             <option value="Implementation Partner">Implementation Partner</option>
										         </select>
												</div>
											  </div>  -->
											
											   
	                                           <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Vendor Name</label>
												<div class="col-sm-4">
													<input id="vendor_name" type="text" 
													title="only alphabets are allowed" minlength="2" value="${vendetobj.vendObj.vendorname}"
													autocomplete="off" placeholder="Vendor Name" name="vendor_name" class="form-control"  required>
												</div>
											</div>
														 					
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Federal ID</label>
												<div class="col-sm-4">
												<input  type="text" name="fed_id" id="fed_id" maxlength="10" value="${vendetobj.vendObj.fed_id}"
													 placeholder="Federal ID"  class="form-control">
												</div>
											  </div> 
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Vendor Person Contact No</label>
												<div class="col-sm-4">
													<input id="ven_phne_no" type="text" minlength="12" maxlength="12" title="Enter Only 123-456-7890 format" 
													autocomplete="off" placeholder="Vendor Person Contact No" name="ven_phne_no" value="${vendetobj.vendObj.vendor_contact_no}" 
													class="form-control"  required>
												</div>
											</div>
											
											  <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Vendor Manager e-mail ID</label>
												<div class="col-sm-4">
													<input id="ven_mgr_emailid" type="text"	title="Enter Valid e-mail" minlength="8" maxlength="80"
													autocomplete="off" placeholder="Vendor Manager e-mail ID" name="ven_mgr_emailid" value="${vendetobj.vendObj.vendor_mgr_email}" class="form-control">
												</div>
											</div> 
											
											<h4><b>Vendor Address</b></h4>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-4">
													<input id="line1" type="text"  minlength="2" maxlength="80" value="${vendetobj.vendorAddressObj.line1}"
													 autocomplete="off" placeholder="Enter Line1" name="line1" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-4">
													<input id="line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" placeholder="Enter Line2" value="${vendetobj.vendorAddressObj.line2}"
													 autocomplete="off" name="line2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-4">
													<input id="city" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  value="${vendetobj.vendorAddressObj.city}"
													 autocomplete="off" placeholder="City" name="city" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-4">
													<input id="state" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  value="${vendetobj.vendorAddressObj.state}"
													 autocomplete="off" placeholder="State" name="state" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-4">
													<input id="zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" value="${vendetobj.vendorAddressObj.zipcode}"
													 autocomplete="off" placeholder="Zip Code" name="zipcode" class="form-control"  required>
												</div>
											</div>
										<%-- <input type="hidden" id="fileId" name="fileId" value="${vendetobj.vendorDocs.fileId}"> --%>	
											<!-- pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$" -->

												<div class="form-group row">
													<label class="col-sm-4 control-label"><Span 
														style="color: red;"></Span>Vendor MSA</label>
													<div class="col-sm-4">
													<c:choose>
														<c:when test="${empty vendetobj.venDocsObj.ven_msa}">
															<a>NA</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
																<button class="btn btn-default btn-sm" 
																onclick="addDocument('Vendor_MSA','');">Add</button>
														</c:when>
														<c:otherwise>
															<span style="color: blue"
																onclick="downloadDocVen('${vendetobj.venDocsObj.ven_msa}','${vendetobj.venDocsObj.msafiletype}','${vendetobj.vendObj.vendorname}')">
																${vendetobj.venDocsObj.ven_msa}</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					    											<br>
															<c:if test="${not empty vendetobj.venDocsObj.vmsastartdate}">
																<label>From Date : <span style="color: none">${vendetobj.venDocsObj.vmsastartdate}</span></label>
															</c:if>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:if test="${not empty vendetobj.venDocsObj.vmsaexpirydate}">
																<label> End Date : <span style="color: none">${vendetobj.venDocsObj.vmsaexpirydate}</span></label>
															</c:if>
														</c:otherwise>
														</c:choose>
													</div>
													<div class="col-sm-4">
														<c:if test="${not empty vendetobj.venDocsObj.ven_msa}">
															<input type="button" class="btn btn-default btn-sm" 
																onclick="editDocument('${vendetobj.venDocsObj.ven_msa}',${vendetobj.venDocsObj.vmsafileid},'${vendetobj.venDocsObj.vmsastartdate}','${vendetobj.venDocsObj.vmsaexpirydate}','${vendetobj.venDocsObj.msafiletype}','');"
																value="Edit" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
														<a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
																onclick="viewDocHistory('${vendetobj.venDocsObj.vmsafileid}','${vendetobj.vendObj.vendorname}','${vendetobj.venDocsObj.msafiletype}','');"
																title="View Document History"><i class="fa fa-history"></i></a>
														</c:if>
													</div>
												</div>
												<h4><b>Documents For Business Compliance</b></h4><br>
												<div class="form-group row">
													<label class="col-sm-4 control-label"> <Span 
														style="color: red;"></Span>Executed IRS W-9 Form</label>
													<div class="col-sm-4">
													<c:choose>
														<c:when test="${empty vendetobj.venDocsObj.irsfilename}">
															<a>NA</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
																<button class="btn btn-default btn-sm" 
																onclick="addDocument('Business Compliance','Executed_irs_w9_form');">Add</button>
														</c:when>
														<c:otherwise>
															<span style="color: blue"
																onclick="downloadDocVen('${vendetobj.venDocsObj.irsfilename}','${vendetobj.venDocsObj.bcfiletype}','${vendetobj.vendObj.vendorname}')">
																${vendetobj.venDocsObj.irsfilename}</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					    											<br>
															<c:if test="${not empty vendetobj.venDocsObj.irsstartdate}">
																<label>Start Date : <span style="color: none">${vendetobj.venDocsObj.irsstartdate}</span></label>
															</c:if>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:if test="${not empty vendetobj.venDocsObj.irsexpirydate}">
																<label> End Date : <span style="color: none">${vendetobj.venDocsObj.irsexpirydate}</span></label>
															</c:if>
														</c:otherwise>
														</c:choose>
													</div>
													<div class="col-sm-4">
														<c:if test="${not empty vendetobj.venDocsObj.irsfilename}">
															<input type="button" class="btn btn-default btn-sm" 
																onclick="editDocument('${vendetobj.venDocsObj.irsfilename}',${vendetobj.venDocsObj.irsfileid},'${vendetobj.venDocsObj.irsstartdate}','${vendetobj.venDocsObj.irsexpirydate}','${vendetobj.venDocsObj.bcfiletype}','${vendetobj.venDocsObj.irsinputval}');"
																value="Edit" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
														<a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
																onclick="viewDocHistory('${vendetobj.venDocsObj.irsfileid}','${vendetobj.vendObj.vendorname}','${vendetobj.venDocsObj.bcfiletype}','${vendetobj.venDocsObj.irsinputval}');"
																title="View Document History"><i class="fa fa-history"></i></a>
														</c:if>
													</div>
												</div>	
												<c:choose>
												<c:when test="${not empty vendetobj.venDocsObj.icfilename}">
												<div class="form-group row">
													<label class="col-sm-4 control-label"> <Span 
														style="color: red;"></Span>Insurance Certificate</label>
													<div class="col-sm-4">
															<span style="color: blue"
																onclick="downloadDocVen('${vendetobj.venDocsObj.icfilename}','${vendetobj.venDocsObj.bcfiletype}','${vendetobj.vendObj.vendorname}')">
																${vendetobj.venDocsObj.icfilename}</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					    											<br>
															<c:if test="${not empty vendetobj.venDocsObj.icstartdate}">
																<label>Start Date : <span style="color: none">${vendetobj.venDocsObj.icstartdate}</span></label>
															</c:if>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:if test="${not empty vendetobj.venDocsObj.icexpirydate}">
																<label> End Date : <span style="color: none">${vendetobj.venDocsObj.icexpirydate}</span></label>
															</c:if>
														 
													</div>
													<div class="col-sm-4">
															<input type="button" class="btn btn-default btn-sm" 
																onclick="editDocument('${vendetobj.venDocsObj.icfilename}',${vendetobj.venDocsObj.icfileid},'${vendetobj.venDocsObj.icstartdate}','${vendetobj.venDocsObj.icexpirydate}','${vendetobj.venDocsObj.bcfiletype}','${vendetobj.venDocsObj.icinputval}');"
																value="Edit" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
														<a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
																onclick="viewDocHistory('${vendetobj.venDocsObj.icfileid}','${vendetobj.vendObj.vendorname}','${vendetobj.venDocsObj.bcfiletype}','${vendetobj.venDocsObj.icinputval}');"
																title="View Document History"><i class="fa fa-history"></i></a>
													</div>
												</div>
												</c:when>
												<c:otherwise>
												<div class="form-group row">
													<label class="col-sm-4 control-label"> <Span 
														style="color: red;"></Span>Insurance Certificate</label>
													<div class="col-sm-4">
															<a>NA</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
																<button class="btn btn-default btn-sm" 
																onclick="addDocument('Business Compliance','insurance_certificate');">Add</button>
														
												</div>
												</div>
												</c:otherwise>
												</c:choose>
													
												
								<div class="form-group row">
													<label class="col-sm-4 control-label"> <Span 
														style="color: red;"></Span>Certificate Incorporation</label>
													<div class="col-sm-4">
													<c:choose>
														<c:when test="${empty vendetobj.venDocsObj.cifilename}">
															<a>NA</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
																<button class="btn btn-default btn-sm" 
																onclick="addCIDocument('Business Compliance','certificate_incorporation');">Add</button>
														</c:when>
														<c:otherwise>
															<span style="color: blue"
																onclick="downloadDocVen('${vendetobj.venDocsObj.cifilename}','${vendetobj.venDocsObj.bcfiletype}','${vendetobj.vendObj.vendorname}')">
																${vendetobj.venDocsObj.cifilename}</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					    											<br>
															<c:if test="${not empty vendetobj.venDocsObj.cistartdate}">
																<label>Start Date : <span style="color: none">${vendetobj.venDocsObj.cistartdate}</span></label>
															</c:if>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:if test="${not empty vendetobj.venDocsObj.ciexpirydate}">
																<label> End Date : <span style="color: none">${vendetobj.venDocsObj.ciexpirydate}</span></label>
															</c:if>
														</c:otherwise>
														</c:choose>
													</div>
													<div class="col-sm-4">
														<c:if test="${not empty vendetobj.venDocsObj.cifilename}">
															<input type="button" class="btn btn-default btn-sm" 
																onclick="editCIDocument('${vendetobj.venDocsObj.cifilename}',${vendetobj.venDocsObj.cifileid},'${vendetobj.venDocsObj.cistartdate}','${vendetobj.venDocsObj.ciexpirydate}','${vendetobj.venDocsObj.bcfiletype}','${vendetobj.venDocsObj.ciinputval}');"
																value="Edit" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
														<a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
																onclick="viewDocHistory('${vendetobj.venDocsObj.cifileid}','${vendetobj.vendObj.vendorname}','${vendetobj.venDocsObj.bcfiletype}','${vendetobj.venDocsObj.ciinputval}');"
																title="View Document History"><i class="fa fa-history"></i></a>
														</c:if>
													</div>
												</div>	
												
												<div class="form-group row">
													<label class="col-sm-4 control-label"> <Span 
														style="color: red;"></Span>Good Standing Certificate</label>
													<div class="col-sm-4">
													<c:choose>
														<c:when test="${empty vendetobj.venDocsObj.gscfilename}">
															<a>NA</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
																<button class="btn btn-default btn-sm" 
																onclick="addDocument('Business Compliance','standing_certificate');">Add</button>
														</c:when>
														<c:otherwise>
															<span style="color: blue"
																onclick="downloadDocVen('${vendetobj.venDocsObj.gscfilename}','${vendetobj.venDocsObj.bcfiletype}','${vendetobj.vendObj.vendorname}')">
																${vendetobj.venDocsObj.gscfilename}</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					    											<br>
															<c:if test="${not empty vendetobj.venDocsObj.gscstartdate}">
																<label>Start Date : <span style="color: none">${vendetobj.venDocsObj.gscstartdate}</span></label>
															</c:if>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:if test="${not empty vendetobj.venDocsObj.gscexpirydate}">
																<label> End Date : <span style="color: none">${vendetobj.venDocsObj.gscexpirydate}</span></label>
															</c:if>
														</c:otherwise>
														</c:choose>
													</div>
													<div class="col-sm-4">
														<c:if test="${not empty vendetobj.venDocsObj.gscfilename}">
															<input type="button" class="btn btn-default btn-sm" 
																onclick="editDocument('${vendetobj.venDocsObj.gscfilename}',${vendetobj.venDocsObj.gscfileid},'${vendetobj.venDocsObj.gscstartdate}','${vendetobj.venDocsObj.gscexpirydate}','${vendetobj.venDocsObj.bcfiletype}','${vendetobj.venDocsObj.gscinputval}');"
																value="Edit" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
														<a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
																onclick="viewDocHistory('${vendetobj.venDocsObj.gscfileid}','${vendetobj.vendObj.vendorname}','${vendetobj.venDocsObj.bcfiletype}','${vendetobj.venDocsObj.gscinputval}');"
																title="View Document History"><i class="fa fa-history"></i></a>
														</c:if>
													</div>
												</div>	
								
									<div class="form-group row">
													<label class="col-sm-4 control-label"> <Span 
														style="color: red;"></Span>Management Approval e-mail</label>
													<div class="col-sm-4">
													<c:choose>
														<c:when test="${empty vendetobj.venDocsObj.ven_mgr_apr_mail_proof}">
															<a>NA</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
																<button class="btn btn-default btn-sm" 
																onclick="addMailProofDocument('Manager_Approved_Email_VMSA','');">Add</button>
														</c:when>
														<c:otherwise>
															<span style="color: blue"
																onclick="downloadDocVen('${vendetobj.venDocsObj.ven_mgr_apr_mail_proof}','${vendetobj.venDocsObj.mgrfiletype}','${vendetobj.vendObj.vendorname}')">
																${vendetobj.venDocsObj.ven_mgr_apr_mail_proof}</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					    								</c:otherwise>
					    								</c:choose>			
													</div>
													<div class="col-sm-2">
													<c:if test="${not empty vendetobj.venDocsObj.ven_mgr_apr_mail_proof}">
															<input type="button" class="btn btn-default btn-sm" 
																onclick="editMailProofDocument('${vendetobj.venDocsObj.ven_mgr_apr_mail_proof}',${vendetobj.venDocsObj.vmgrfileid},'${vendetobj.venDocsObj.mgrfiletype}');"
																value="Edit" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
														<a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
																onclick="viewDocHistory('${vendetobj.venDocsObj.vmgrfileid}','${vendetobj.vendObj.vendorname}','${vendetobj.venDocsObj.mgrfiletype}','');"
																title="View Document History"><i class="fa fa-history"></i></a>
													</c:if>
													</div>
											</div>


										<%-- 		<center><div class="form-group row">
									  <label for="Vendor_MSA" class="col-sm-4 control-label" id="Vendor_MSA">
									  <Span id="vlab" style="color:red;"></Span>Upload Vendor MSA</label>
							<div class="col-sm-4">
						<c:choose>
	                    <c:when test="${empty vendetobj.venDocsObj.ven_msa}">
						<a>NA</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<button class="btn btn-default btn-sm"  id="" onclick="addDoc('Work Authorization Copy','Work_Authorization_Copy');">Add</button>
					    </c:when>
					    <c:otherwise>
					    <span  onclick="downloadDocVen'${vendetobj.venDocsObj.ven_msa}','${vendetobj.venDocsObj.filetype}','${vendetobj.vendObj.vendorname}')" style="color: blue">
					    ${vendetobj.venDocsObj.ven_msa}</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<c:if test="${not empty vendetobj.venDocsObj.ven_msa}">
						  <input type="button" class="btn btn-default btn-sm"  id="" 
						  onclick="editDocument('${vendetobj.venDocsObj.ven_msa}',${vendetobj.venDocsObj.fileid},'${vendetobj.venDocsObj.startdate}','${vendetobj.venDocsObj.expirydate}','${vendetobj.venDocsObj.filetype}','${vendetobj.venDocsObj.inputval}');" value="Edit"/>
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<a class="btn btn-success btn-sm"  data-toggle='modal' href='#myModalView' 
							onclick="viewDocHistory('${vendetobj.vendObj.vendorid}','${vendetobj.vendObj.vendorname}','${vendetobj.venDocsObj.filetype}','${vendetobj.venDocsObj.inputval}');"  title="View Document History"><i class="fa fa-history"></i></a>
					    			<br>
					    	<c:if test="${not empty vendetobj.venDocsObj.startdate}">
													<label>Start Date : <span style="color: red">${vendetobj.venDocsObj.startdate}</span></label>
							</c:if>
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							<c:if test="${not empty vendetobj.venDocsObj.startdate}"><label>
													 End Date : <span style="color: red">${vendetobj.venDocsObj.expirydate}</span></label>
						    </c:if>
						</c:if>
						</c:otherwise>
						</c:choose>
						</div>
						</div></center>
					
					<center><div class="form-group row">
									  <label for="Vendor_MSA" class="col-sm-4 control-label" id="Vendor_MSA">
									  <Span id="vlab" style="color:red;"></Span>Executed IRS W-9 Form</label>
							<div class="col-sm-4">
						<c:choose>
	                    <c:when test="${empty vendetobj.venDocsObj.irsfilename}">
						<a>NA</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<button class="btn btn-default btn-sm"  id="" onclick="addDoc('Work Authorization Copy','Work_Authorization_Copy');">Add</button>
					    </c:when>
					    <c:otherwise>
					    <span  onclick="downloadDocVen'${vendetobj.venDocsObj.irsfilename}','${vendetobj.venDocsObj.filetype}','${vendetobj.vendObj.vendorname}')" style="color: blue">
					    ${vendetobj.venDocsObj.irsfilename}</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<c:if test="${not empty vendetobj.venDocsObj.irsfilename}">
						  <input type="button" class="btn btn-default btn-sm"  id="" 
						  onclick="editDocument('${vendetobj.venDocsObj.irsfilename}',${vendetobj.venDocsObj.fileid},'${vendetobj.venDocsObj.startdate}','${vendetobj.venDocsObj.expirydate}','${vendetobj.venDocsObj.filetype}','${vendetobj.venDocsObj.inputval}');" value="Edit"/>
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<a class="btn btn-success btn-sm"  data-toggle='modal' href='#myModalView' 
							onclick="viewDocHistory('${vendetobj.vendObj.vendorid}','${vendetobj.vendObj.vendorname}','${vendetobj.venDocsObj.filetype}','${vendetobj.venDocsObj.inputval}');"  title="View Document History"><i class="fa fa-history"></i></a>
					    			<br>
					    	<c:if test="${not empty vendetobj.venDocsObj.startdate}">
													<label>From Date : <span style="color: red">${vendetobj.venDocsObj.startdate}</span></label>
							</c:if>
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							<c:if test="${not empty vendetobj.venDocsObj.startdate}"><label>
													 End Date : <span style="color: red">${vendetobj.venDocsObj.expirydate}</span></label>
						    </c:if>
						</c:if>
						</c:otherwise>
						</c:choose>
						</div>
						</div></center>  --%>
					
					
					<%-- 	 <center id="tid">			
						<table id="sampleTable" class="table" style="border-collapse: collapse;max-width:60%; border: none;" cellspacing="0" cellpadding="0" 
						style="text-align: center;">
						
						<tbody>
						<c:forEach var="bsc" items="${vendetobj.vendorDocs}">
						<c:choose>
						<c:when test="${bsc.filetype=='Vendor_MSA'}">
						<tr style="border: none;">
								<td style="border: none;">${bsc.filetype}</td>
								<td style="border: none;">
								 <span  onclick="downloadDocVen('${bsc.file_name}','${bsc.filetype}','${vendetobj.vendObj.vendorname}')" style="color: blue">
					    			${bsc.file_name}</span>
					    			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" value="Edit" class="btn btn-default btn-sm" id="edtoff" 
									data-toggle="modal" onclick="editDocument('${bsc.file_name}',${bsc.document_id},'${bsc.startdate}','${bsc.expirydate}','${bsc.filetype}','${bsc.inputval}');"/>
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a class="btn btn-success btn-sm"  data-toggle='modal' href='#myModalView' 
														onclick="viewDocHistory('${vendetobj.vendObj.vendorid}','${vendetobj.vendObj.vendorname}','${bsc.filetype}','${bsc.inputval}');"  title="View Document History"><i class="fa fa-history"></i></a>
					    			<br>
					    			<c:if test="${not empty bsc.startdate}">
													<label>From Date : <span style="color: red">${bsc.startdate}</span></label>
									</c:if>
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <c:if test="${not empty bsc.startdate}"><label>
													 End Date : <span style="color: red">${bsc.expirydate}</span></label>
									</c:if>
							     </td>
						</tr>
						</c:when>
						<c:when test="${bsc.filetype=='Manager_Approved_Email_VMSA'}">
						<tr style="border: none;">
								<td style="border: none;">${bsc.filetype}</td>
								<td style="border: none;">
								 <span onclick="downloadDocVen('${bsc.file_name}','${bsc.filetype}','${vendetobj.vendObj.vendorname}')" style="color: blue">
					    			${bsc.file_name}</span>
							     </td>
						</tr>
						</c:when>
						<c:otherwise>
						<c:choose>
						<c:when test="${bsc.inputval=='insurance_certificate'}">
						<tr style="border: none;">
								<td style="border: none;">${bsc.inputval}</td>
								<td style="border: none;">
								 <span  onclick="downloadDocVen('${bsc.file_name}','Business Compliance','${vendetobj.vendObj.vendorname}')" style="color: red">
					    			${bsc.file_name}</span>
					    			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" value="Edit" class="btn btn-default btn-sm" id="edtoff" 
									data-toggle="modal" onclick="editDocument('${bsc.file_name}',${bsc.document_id},'${bsc.startdate}','${bsc.expirydate}','${bsc.filetype}','${bsc.inputval}');"/>
								  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a class="btn btn-success btn-sm"  data-toggle='modal' href='#myModalView' 
														onclick="viewDocHistory('${vendetobj.vendObj.vendorid}','${vendetobj.vendObj.vendorname}','${bsc.filetype}','${bsc.inputval}');"  title="View Document History"><i class="fa fa-history"></i></a>
					    			<br>
					    			<c:if test="${not empty bsc.startdate}">
													<label>From Date : <span style="color: red">${bsc.startdate}</span></label>
									</c:if>
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:if test="${not empty bsc.startdate}"><label>
													 End Date : <span style="color: red">${bsc.expirydate}</span></label>
									</c:if>
							     </td>
						</tr>
						</c:when>
						<c:otherwise>
						<tr style="border: none;">
								<td style="border: none;">${bsc.inputval}</td>
								<td style="border: none;">
								 <span  onclick="downloadDocVen('${bsc.file_name}','Business Compliance','${vendetobj.vendObj.vendorname}')" style="color: blue">
					    			${bsc.file_name}</span>
					    			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" value="Edit" class="btn btn-default btn-sm" id="edtoff" 
									data-toggle="modal" onclick="editDocument('${bsc.file_name}',${bsc.document_id},'${bsc.startdate}','${bsc.expirydate}','${bsc.filetype}','${bsc.inputval}');"/>
								  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a class="btn btn-success btn-sm"  data-toggle='modal' href='#myModalView' 
														onclick="viewDocHistory('${vendetobj.vendObj.vendorid}','${vendetobj.vendObj.vendorname}','${bsc.filetype}','${bsc.inputval}');"  title="View Document History"><i class="fa fa-history"></i></a>
					    			<br>
					    			<c:if test="${not empty bsc.startdate}">
													<label>From Date : <span style="color: red">${bsc.startdate}</span></label>
									</c:if>
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:if test="${not empty bsc.startdate}"><label>
													 End Date : <span style="color: red">${bsc.expirydate}</span></label>
									</c:if>
							     </td>
						</tr>
						</c:otherwise>
						</c:choose>
						</c:otherwise>
						</c:choose>											
							</c:forEach>
						</tbody>
					</table>
				</center> --%>
						
								<!-- 	<div class="form-group row">
									  <label for="Vendor_MSA" class="col-sm-4 control-label" id="Vendor_MSA">
									  <Span id="vlab" style="color:red;">*</Span>Upload Vendor MSA</label>
									  <input type="hidden" value="Vendor_MSA" name="Vendor_MSA" />
									<div class="col-sm-4">
										<input type="file" id="Ven_MSA" name="Ven_MSA" onchange="ValidateSize(this)" required><br>
									</div>
									<div class="col-sm-4">
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Exception: <input type="checkbox" id="myCheck" name="myCheck">
									</div>
									</div>
								
	                                <h4><b>Documents For Business Compliance</b></h4><br>
						    		 <div class="form-group row">
									  <label for="Executed_irs_w9_form" class="col-sm-4 control-label" id="Executed_irs_w9_form">
									  <Span id="vlab1" style="color:red;">*</Span>Executed IRS W-9 Form</label>
										<div class="col-sm-4">
										<input type="hidden" value="Executed_irs_w9_form" name="Executed_irs_w9_form" />
										<input type="file" id="exe_irs_w9_form" name="exe_irs_w9_form" onchange="ValidateSize(this)" required><br>
									</div>
									</div>
									
									 <div class="form-group row">
									  <label for="insurance_certificate" class="col-sm-4 control-label" id="insurance_certificate">
									  <Span id="vlab2" style="color:red;">*</Span>Insurance Certificate</label>
										<div class="col-sm-4">
										<input type="hidden" value="insurance_certificate" name="insurance_certificate" />
										<input type="file" id="insu_certi" name="insu_certi" onchange="ValidateSize(this)" required><br>
									</div>
									</div>
									
									 <div class="form-group row">
									  <label for="certificate_incorporation"  class="col-sm-4 control-label" id="certificate_incorporation">
									  <Span id="vlab3" style="color:red;">*</Span>Certificate Incorporation</label>
										<div class="col-sm-4">
										<input type="hidden" value="certificate_incorporation" name="certificate_incorporation" />
										<input type="file" id="certi_corp" name="certi_corp" onchange="ValidateSize(this)" required><br>
									</div>
									</div>
									
									 <div class="form-group row">
									  <label for="standing_certificate" class="col-sm-4 control-label" id="standing_certificate">
									  <Span id="vlab4" style="color:red;">*</Span>Good Standing Certificate</label>
										<div class="col-sm-4">
										<input type="hidden" value="standing_certificate" name="standing_certificate" />
										<input type="file" id="std_cert" name="std_cert" onchange="ValidateSize(this)" required><br>
									</div>
									</div>
									<div class="form-group row" id="map"  style="display:none;">
												<label for="inputPassword"	class="col-sm-4 control-label">
												<Span style="color: red;">*</Span>Management Approval e-mail </label>
												<div class="col-sm-4">
													<input type="hidden" value="Manager_Approved_Email_VMSA" name="Manager_Approved_Email_VMSA" /> 
													<input type="file" id="mgr_approved_mail" name="mgr_mail_proof" accept=".msg,.eml" onchange="ValidateMsgFile(this)"><br>
												</div>
									</div> -->
											<div class="text-center ml-3">
												<input type="button" class="btn btn-default" id="btnSubmit" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Update"  onclick="btnClick()">
												<a href="addVendor" class="btn btn-default btn-sm" style="padding: 7px; background-color: grey; color: white; line-height: 0.728571;">Back</a>
											</div>
										</form>
									</fieldset>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
<%-- 	<div class="row">
		<div class="col-md-12">
			<div class="card" id="dataTBL">
				<div class="card-body">
					<div style="text-align: center;">
					</div>
					<!-- 	<form action="" method="post"> -->
					<div style="max-width:1150px; overflow-x: auto; white-space: nowrap;" >
					<center><span><strong style="font-size:20px;color:red;">Vendor Details</strong></span></center>
					<table id="vendorTable" class="table table-hover table-bordered"
						style="text-align: center;">
						<thead>
							<tr>
							<th style="text-align: center">Vendor Type</th>
								<th style="text-align: center">Name</th>
								<th style="text-align: center">Federal ID</th>
							     <th style="text-align: center">Address</th>
							     <th style="text-align: center">Person Contact No</th>
								<th style="text-align: center">Manager e-Mail ID</th>
							</tr>
						</thead>
						<tbody>
					<c:forEach var="venl" items="${vendorList}">
						 	<tr>   
						 		<td>${venl.vendor_type}</td>
							    <td>${venl.companyName}</td>
							    <td>${venl.companyfedId}</td>
							    <td>${venl.line1}, ${venl.line2}, ${venl.city}, ${venl.state}, ${venl.zipcode}</td>
							    <td>${venl.company_contactperson}</td>
							    <td>${venl.company_mgr_email}</td>
							    <td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											onclick="editVendor(${venl.vendorid});">
											<i class="fa fa-edit" aria-hidden="true"></i>
										</button></td>
							</tr>
						  </c:forEach>
						</tbody>
					</table>
				</div>
			 </div>
		  </div>
		</div>
	  </div> --%>
	  
	  
	  
	  <center>
		<div class="modal fade" id="DocumentHistoryModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="top:90px;">
			<div class="modal-dialog" role="document">
				<div class="modal-content" style="width:180%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 14px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
						<div class="modal-body">							
					   		<table id="sampleTable2" class="table table-hover table-bordered" style="text-align:center;">
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
								<tbody id="consulatntBody">
								
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
								style="font-size: 14px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="editVendorDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="efileId" name="fileId"> 
						<input type="hidden" id="fromdate1" name="fromdate1"> 
						<input type="hidden" id="expirydate1" name="expirydate1"> 
						<input type="hidden" id="efileType" name="efileType"> 
						<input type="hidden" id="efileInputVal" name="efileInputVal"> 
						 
						<input type="hidden" id="venId" name="venId" value="${vendetobj.vendObj.vendorid}"> 
						
						<div class="modal-body">							
					   <div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;"></Span>Upload File :</label>
								<div class="col-lg-6">
									<input type="file" id="editFile" name="editFile"
										class="form-control text-left" onchange="EditValidateSize(this)"/>
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
							<button type="submit" id="esubmitid" class="btn btn-primary btn-sm">Save
								changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</center>
	
	<center>
		<div class="modal fade" id="EditCIDocumentModal" tabindex="-1"
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
								style="font-size: 14px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="editCIVendorDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="ciefileId" name="cifileId"> 
						<input type="hidden" id="ciefileType" name="ciefileType"> 
						<input type="hidden" id="ciefileInputVal" name="ciefileInputVal"> 
						 
						<input type="hidden" id="civenId" name="civenId" value="${vendetobj.vendObj.vendorid}"> 
						
						<div class="modal-body">							
					   <div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;"></Span>Upload File :</label>
								<div class="col-lg-6">
									<input type="file" id="cieditFile" name="cieditFile"
										class="form-control text-left" onchange="EditValidateSize(this)"/required>
									<span id="ciefileName" style="color:blue;"></span>
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
		<div class="modal fade" id="EditMSGDocumentModal" tabindex="-1"
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
								style="font-size: 14px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
					
					<form class='form form-horizontal validate-form'
						action="editMgrMailproofVendorDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="msgefileId" name="msgefileId"> 
						<input type="hidden" id="msgefileType" name="msgefileType"> 
						<input type="hidden" id="msgvenId" name="msgvenId" value="${vendetobj.vendObj.vendorid}"> 
						<div class="modal-body">							
					   <div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;"></Span>Upload File :</label>
								<div class="col-lg-6" >
									<input type="file" id="msgFile" name="msgeditFile"
										class="form-control text-left" accept=".msg,.eml" onchange="ValidateMsgFile(this)" required/>
									<span id="msgefileName" style="color:blue;"></span>
								</div>
					    </div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal">Close</button>
							<button type="submit" id="esubmitid" class="btn btn-primary btn-sm">Save
								changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</center>
	  
	  <center>
		<div class="modal fade" id="addDocumentModal" tabindex="-1"
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
								style="font-size: 14px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="addVendorDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="afileType" name="afileType"> 
						<input type="hidden" id="afileInputVal" name="afileInputVal"> 
						<input type="hidden" id="avenId" name="avenId" value="${vendetobj.vendObj.vendorid}"> 
						<div class="modal-body">							
					   <div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;"></Span>Upload File :</label>
								<div class="col-lg-6">
									<input type="file" id="aFile" name="aFile"
										class="form-control text-left" onchange="EditValidateSize1(this)" required/>
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
							<button type="submit" id="asubmitid" class="btn btn-primary btn-sm">Save
								changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</center>
	
	 <center>
		<div class="modal fade" id="addCIDocumentModal" tabindex="-1"
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
								style="font-size: 14px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="addCIVendorDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="ciafileType" name="ciafileType"> 
						<input type="hidden" id="ciafileInputVal" name="ciafileInputVal"> 
						<input type="hidden" id="ciavenId" name="ciavenId" value="${vendetobj.vendObj.vendorid}"> 
						<div class="modal-body">							
					   <div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;"></Span>Upload File :</label>
								<div class="col-lg-6">
									<input type="file" id="ciaFile" name="ciaFile"
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
								style="font-size: 14px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="addMailProofVendorDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="msgafileType" name="msgafileType"> 
						<input type="hidden" id="msgafileInputVal" name="msgafileInputVal"> 
						<input type="hidden" id="msgavenId" name="msgavenId" value="${vendetobj.vendObj.vendorid}"> 
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
							<button type="submit" id="asubmitid" class="btn btn-primary btn-sm">Save
								changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</center>
	  
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
	<!-- Javascripts-->
<script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>

<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
<script src="resources/preDefined/goback.js"></script>
<script type="text/javascript">
/* $("#fromdate,#expirydate").datepicker({
	
}); */
/* $('#sampleTables').DataTable( {
    "order": [[0, "desc"]]
   });
}); */
var table = $('#sampleTable2').DataTable({
	 "order": [[0, "desc"]],
    bLengthChange: true,
    paging: true
 });
 
function viewDocHistory(docId,venName,fileType,inputVal){
	getsesVal().done(function(data){
		  if(data!=""){
	$.ajax({
    	type : "get",
        url  : "getVendorDocumentHistiryById",
        contentType:"application/json",
        cache : false,
        async : false,
        data:{"docId":docId,"fileType":fileType,"inputVal":inputVal},
        success  : function(response){
        	 if (table) table.clear();
        	 $('#sampleTable2').dataTable().fnClearTable();
        	  	if(response!=""){
            	  for(var i=0;i<response.length;i++){
            		  var inputval="";
            		  if(response[i].inputval!=null){
            			  inputval=response[i].inputval;
            		   }
            			var fname=response[i].file_name;
	 		          	var encoded = encodeURIComponent(fname);
                       table.row.add([
                    	    ''+response[i].document_id+'',
                    	  '<a href="downloadocs?filetype='+response[i].filetype+'&filename='+encoded+'&vendorName='+venName+'" style="color:blue">'+response[i].file_name+'</a>',
                    	//'<span onclick="downloadDocCust('+response[i].file_name+','+response[i].filetype+','+custName+')" style="color: blue">'+response[i].file_name+'</span>',
                    	''+response[i].filetype+'',
                    	''+inputval+'',
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
        $('#DocumentHistoryModal').modal('show');
      },
  //	''+response[i].docStatus+''
     error: function(){  
     alert('Error while request..');
    }
  });
		  }else{
				 window.location.href="loginpage";
			}
		});
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
		  }else{
				 window.location.href="loginpage";
			}
		});
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
						$('#asubmitid').attr('disabled',false);
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
				 window.location.href="loginpage";
			}
		});
    }

function downloadDocVen(fname,ftype,vname){	
	getsesVal().done(function(data){
		  if(data!=""){
	var encoded = encodeURIComponent(fname);	
	window.location.href="downloadocs?filename="+encoded+"&filetype="+ftype+"&vendorName="+vname;
		  }else{
				 window.location.href="loginpage";
			}
		});
}

function addDocument(fileType,inputVal){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#asubmitid').attr('disabled',true);
    $('#afileType,#afileInputVal,#afromdate,#aexpirydate,#aFile').val('');
    $('#afileType').val(fileType);
    $('#afileInputVal').val(inputVal);
    if(inputVal=='insurance_certificate'){
    	    $("#afromdate,#aexpirydate").prop('required',true);
    }else{
    	 $("#afromdate,#aexpirydate").prop('required',false);
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
	$('h5').text(title+"Document Details");
	$("#aexpirydate").attr("disabled", true);
	$("#afromdate").datepicker({
	}).on('changeDate', function(selected) {
		 var minDate = new Date(selected.date.valueOf());
	     $('#aexpirydate').datepicker('setStartDate', minDate); 
	     $("#aexpirydate").attr("disabled", false);
	});	
	$("#aexpirydate").datepicker({
	}).on('changeDate', function(selected) {
	        var minDate = new Date(selected.date.valueOf());
	        $('#afromdate').datepicker('setEndDate', minDate);
	});
    $('#addDocumentModal').modal('show');
		  }else{
				 window.location.href="loginpage";
			}
		});
};

function addCIDocument(fileType,inputVal){
	getsesVal().done(function(data){
		  if(data!=""){
    $('#ciafileType,#ciafileInputVal,#ciaFile').val('');
    $('#ciafileType').val(fileType);
    $('#ciafileInputVal').val(inputVal);
    
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
	$('h5').text(title+"Document Details");
    
    $('#addCIDocumentModal').modal('show');
		  }else{
				 window.location.href="loginpage";
			}
		});
};

function addMailProofDocument(fileType,inputVal){
	getsesVal().done(function(data){
		  if(data!=""){
    $('#msgafileType,#afileInputVal,#msgaFile').val('');
    $('#msgafileType').val(fileType);
    $('#msgafileInputVal').val(inputVal);
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
	$('h5').text(title+"Document Details");
    $('#addMailProofDocumentModal').modal('show');
		  }else{
				 window.location.href="loginpage";
			}
		});
};
//addVendorDocument	addvenId addefileInputVal addefileType addeditFile addvenId addfromdate addexpirydate
function editDocument(fname,id,stdate,expdate,fileType,inputVal){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#esubmitid').attr('disabled',true);
	//alert("expdate"+expdate);
    $('#efileId,#efileType,#efileInputVal').val('');
    /* var $input = $('onclick="downloadDocCust('"+fname+"','"+ftype+"','"+custname+"')"');
    $input.appendTo($("#efileName")); */
    $('#efileName').text('');
    $('#efileId').val(id);
    $('#efileName').text(fname);
    $('#efileType').val(fileType);
    $('#efileInputVal').val(inputVal);
   
    $('#fromdate1').val(stdate);
    $('#expirydate1').val(expdate);
    $('#fromdate').val(stdate);
    $('#expirydate').val(expdate);
     if(stdate!=""){
    	 $("#expirydate").attr("disabled", false);
      }else{
    	  $("#expirydate").attr("disabled", true);
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
	     $("#expirydate").attr("disabled", false);
	     if($('#fromdate').val()==$('#fromdate1').val())
	     {$('#esubmitid').attr('disabled',true);}else{$('#esubmitid').attr('disabled',false);}
	});	
	$("#expirydate").datepicker({
		 	startDate: dates,
			minDate: dates
	}).on('changeDate', function(selected) {
	        var minDate = new Date(selected.date.valueOf());
	        $('#fromdate').datepicker('setEndDate', minDate);
	        if($('#expirydate').val()==$('#expirydate1').val())
	        {$('#esubmitid').attr('disabled',true);}else{$('#esubmitid').attr('disabled',false);}
	});
    
    if(inputVal=='insurance_certificate'){
    	    $("#fromdate,#expirydate").prop('required',true);
    }else{
    	 $("#fromdate,#expirydate").prop('required',false);
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
	$('h5').text(title+"Document Details");
    
    $('#EditDocumentModal').modal('show');
		  }else{
				 window.location.href="loginpage";
			}
		});
};

function editCIDocument(fname,id,stdate,expdate,fileType,inputVal){
	getsesVal().done(function(data){
	 if(data!=""){
    $('#ciefileId,#ciefileType,#ciefileInputVal').val('');
    $('#ciefileName').text('');
    $('#ciefileId').val(id);
    $('#ciefileName').text(fname);
    $('#ciefileType').val(fileType);
    $('#ciefileInputVal').val(inputVal);
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
	$('h5').text(title+"Document Details");
    
    $('#EditCIDocumentModal').modal('show');
	 }else{
		 window.location.href="loginpage";
	}
});
};


function editMailProofDocument(fname,id,fileType,inputVal){
	getsesVal().done(function(data){
		  if(data!=""){
    $('#msgefileId,#msgefileType').val('');
    $('#msgefileName').text('');
    $('#msgefileId').val(id);
    $('#msgefileName').text(fname);
    $('#msgefileType').val(fileType);
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
	$('h5').text(title+"Document Details");
    $('#EditMSGDocumentModal').modal('show');
		  }else{
				 window.location.href="loginpage";
			}
		});
};




/* $('#expirydate').on('change', function() {
    if($('#expirydate').val()==$('#expirydate1').val())
           {$('#esubmitid').attr('disabled',true);}else{$('#esubmitid').attr('disabled',false);} });
	$('#fromdate').on('change', function() {
    if($('#fromdate').val()==$('#fromdate1').val())
           {$('#esubmitid').attr('disabled',true);}else{$('#esubmitid').attr('disabled',false);} });
	 */

function btnClick(){
		 getsesVal().done(function(data){
			  if(data!=""){
	$('#updateVendorForm').formValidation('validate');
	if( !$('#updateVendorForm').data('formValidation').isValid())
		 {
		 //   alert("Not Valid");
		 }
	else{
		   //document.getElementById("formid").submit();
	    	$("#btnSubmit").attr("disabled", true);
				var form = $('#updateVendorForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "updateVendor", //this is the submit URL
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
			  }else{
					 window.location.href="loginpage";
				}
			});
	}
	
$("#closePopupSave").click(function(event) {
	getsesVal().done(function(data){
		  if(data!=""){
	$('#myModal').modal('hide');
	var venid=$('#vendorid').val();
	window.location.href="editVendor?id="+venid+"";
		  }else{
				 window.location.href="loginpage";
			}
		});
});
</script>
<script type="text/javascript">
$('#updateVendorForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {	       
    	vendor_name: {
            validators: {
            	notEmpty: {
                    message: 'Vendor Name is mandatory'
                },
                stringLength: {   
                    min: 1,
                    max: 100,
                    message: 'Vendor Name must be more than 2 and less than 100 characters long. '
                },
                regexp: {
                	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                     message: 'Vendor Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                }
                
            }
        
        }, 
        vendor_type: {
            validators: {
            	notEmpty: {
                    message: 'Vendor type is mandatory'
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
                        if(value.length < 10 || value.length > 10) {
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
                    max: 80,
                    message: 'Line1 should have more than 2 and less than 80 characters '
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 accepts alpha numerics '
                },
            }
        },
        
        line2 : {
            validators: {
            	
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line2 should have more than 2 and less than 80 characters '
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line2 accepts alpha numerics '
                },
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
                },
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
                },
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
                },
            }
        },   
       ven_mgr_emailid:{
            validators: {
            	notEmpty: {
                    message: 'Vendor Manager e-mail ID is mandatory'
            	 },
                 stringLength: {
                 min: 8,
                 max: 80,
                 message: 'Vendor Manager e-mail must be more than 8 and less than 80 characters long'
                },
                  regexp: {
             	regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
                 message: 'Please enter valid e-mail ID'
                }
           }
      },
      ven_phne_no:{
            validators: {
            	notEmpty: {
                    message: 'Vendor Contact Number is mandatory'
            	 },
                 stringLength: {
                 min: 12,
                 max: 12,
                 message: 'Vendor Contact Number must be more 10 or Not less than 10 Numbers long'
                }
            }
        },
    Ven_MSA: {
            validators: {
            	isEmpty: {
                    message: 'Vendor MSA is mandatory'
                		}
  			    }
   			},
   	insu_certi: {
             validators: {
             	isEmpty: {
                     message: 'Insurance Certificate is mandatory'
                 		}
   			    }
    		},
    std_cert: {
    	     validators: {
    	            	isEmpty: {
    	                    message: 'Standing Certificate is mandatory'
    	                		}
    	  			    }
    	   		},
    certi_corp: {
    	            validators: {
    	            	isEmpty: {
    	                    message: 'Certificate Incorporation is mandatory'
    	                		}
    	  			    }
    	   			},
    exe_irs_w9_form: {
     	            validators: {
     	            	isEmpty: {
     	                    message: 'Executed IRS W-9 Form is mandatory'
     	                		}
     	  			    }
     	   			},
   		mgr_approved_mail: {
            validators: {
            	isssEmpty: {
                    message: 'Manager Approved Eamil proof  is mandatory'
                		}/* ,
                		file: {
   					        extension: 'msg',
                            type: 'application/msg',
         					maxSize: 50*1024*1024,
        					message: 'The selected file is not valid or file size greater than 50MB'
                       } */
  			    }
   			}
    }
})
 .on('click', '[name="myCheck"]', function(e) {
	  var checkBox = document.getElementById("myCheck");
		   if (checkBox.checked == true){
		//   alert(checkBox);
		  $("#map").show();
		  $("#vlab,#vlab1,#vlab2,#vlab3,#vlab4").hide();
		   $('#updateVendorForm').formValidation('enableFieldValidators','Ven_MSA',false);
		   $('#updateVendorForm').formValidation('enableFieldValidators', 'insu_certi',false); 
    	   $('#updateVendorForm').formValidation('enableFieldValidators', 'std_cert',false); 
    	   $('#updateVendorForm').formValidation('enableFieldValidators', 'certi_corp',false); 
    	   $('#updateVendorForm').formValidation('enableFieldValidators', 'exe_irs_w9_form',false); 
		   $('#updateVendorForm').formValidation('enableFieldValidators', 'mgr_approved_mail',true);
		   }
		else if (checkBox.checked == false) {
    	   //alert("in else"+$(this).val());
    	   $("#map").hide();
		   $("#vlab,#vlab1,#vlab2,#vlab3,#vlab4").show();
    	   $('#updateVendorForm').formValidation('enableFieldValidators', 'Ven_MSA',true); 
    	   $('#updateVendorForm').formValidation('enableFieldValidators', 'insu_certi',true); 
    	   $('#updateVendorForm').formValidation('enableFieldValidators', 'std_cert',true); 
    	   $('#updateVendorForm').formValidation('enableFieldValidators', 'certi_corp',true); 
    	   $('#updateVendorForm').formValidation('enableFieldValidators', 'exe_irs_w9_form',true); 
    	   $('#updateVendorForm').formValidation('enableFieldValidators','mgr_approved_mail',false);
       } 
     });
</script>
<script type="text/javascript">
document.getElementById('btnSubmit').disabled=true;
$('#vendor_name').on('keyup', function() {
	if($('#vendor_name').val()==$('#vendor_name1').val())
		{document.getElementById('btnSubmit').disabled=true;}else{document.getElementById('btnSubmit').disabled=false;}  });
$('#fed_id').on('keyup', function() {
	if($('#fed_id').val()==$('#fed_id1').val())
		{document.getElementById('btnSubmit').disabled=true;}else{document.getElementById('btnSubmit').disabled=false;}  });
$('#ven_phne_no').on('keyup', function() {
	if($('#ven_phne_no').val()==$('#ven_phne_no1').val())
		{document.getElementById('btnSubmit').disabled=true;}else{document.getElementById('btnSubmit').disabled=false;}  });
$('#ven_mgr_emailid').on('keyup', function() {
	if($('#ven_mgr_emailid').val()==$('#ven_mgr_emailid1').val())
		{document.getElementById('btnSubmit').disabled=true;}else{document.getElementById('btnSubmit').disabled=false;}  });

$('#line1').on('keyup', function() {
	if($('#line1').val()==$('#line11').val())
		{document.getElementById('btnSubmit').disabled=true;}else{document.getElementById('btnSubmit').disabled=false;}  });
$('#line2').on('keyup', function() {
	if($('#line2').val()==$('#line21').val())
		{document.getElementById('btnSubmit').disabled=true;}else{document.getElementById('btnSubmit').disabled=false;}  });
$('#zipcode').on('keyup', function() {
	if($('#zipcode').val()==$('#zipcode1').val())
		{document.getElementById('btnSubmit').disabled=true;}else{document.getElementById('btnSubmit').disabled=false;}  });
$('#city').on('keyup', function() {
	if($('#city').val()==$('#city1').val())
		{document.getElementById('btnSubmit').disabled=true;}else{document.getElementById('btnSubmit').disabled=false;}  });
$('#state').on('keyup', function() {
	if($('#state').val()==$('#state1').val())
		{document.getElementById('btnSubmit').disabled=true;}else{document.getElementById('btnSubmit').disabled=false;}   });		

$('form').on('reset', function() {
	$('#updateVendorForm').data('formValidation').resetForm();
	});
$('input[name="ven_phne_no"]').mask('999-999-9999');
$('input[name="fed_id"]').mask('99-9999999');
$("#ven_mgr_emailid").blur(function () {
    $('#saveVendorForm').bootstrapValidator('revalidateField', 'ven_mgr_emailid');
});
$("#ven_phne_no").blur(function () {
    $('#saveVendorForm').bootstrapValidator('revalidateField', 'ven_phne_no');
});
$("#fed_id").blur(function () {
    $('#saveVendorForm').bootstrapValidator('revalidateField', 'fed_id');
});
</script> 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />  -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/css/datepicker3.min.css" />
<link rel="stylesheet" href="resources/css/css/select2.min.css"	rel="stylesheet" />
<!-- <link href="https://cdn.bootcss.com/select2/3.4.5/select2.min.css" rel="stylesheet"> -->
<style type="text/css">
</style>
</head>
<body>
	<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">Add/View Documents</h5>
							<div class="card-body">
								<div class="row">
									<div class="col-md-11 col-sm-12">
									   <input type="hidden" name="emptype" id="emptype" value="${emptype}"> 
										<input type="hidden" name="empType" id="empType" value="${empType}"> 
											<input type="hidden" name="role" id="role" value="${role}">
											 <input type="hidden" name="dept" id="dept" value="${dept}">
										<center><font color=red>Employee Name :</font><b>&nbsp;&nbsp;${basicObj.full_name}</b>&nbsp;&nbsp;<font color=red>Employee Type :</font><b>&nbsp;&nbsp;${basicObj.emp_type}</b></center>
										<br>
										<!-- onsubmit="return checkForm(this);" -->
										<fieldset>
											<form action="saveEmpDocuments" class="form-horizontal" id="formidFiles"
												enctype="multipart/form-data" method="post">
												<br> <input type="hidden" name="candidate_id" id="candidate_id"
													value="${candidate_id}">

												<div class="form-group row">
													<label for="offerletter" class="col-sm-3 control-label"
														id="offerletter"><Span style="color: red;">*</Span>Upload
														Offer letter</label>
													<!-- <input type="hidden" id="offerletter" name="offerletter" value="offerletter"> -->
													<div class="col-sm-3">
														<input type="file" id="offer_letter" name="offer_letter">
														<span id="offer"
															onclick="downloadDocument('${attachmentBean.offerletter}','offerletter')"
															style="color: blue">${attachmentBean.offerletter}</span>
													</div>
													   <c:if test="${not empty attachmentBean.offerletter}">
														<div class="col-sm-2">
													   <input type="button" value="Edit" class="btn btn-default btn-sm" id="edtoff" 
														data-toggle="modal" 
														onclick="editDocument('${attachmentBean.offerletter}',${attachmentBean.fileId},'offerletter','');"/>
														&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
														<a	class="btn btn-success btn-sm" data-toggle='modal'
														href='#myModalView'	onclick="viewDocHistory1('${attachmentBean.fileId}','offerletter','');"
														title="View Document History"><i class="fa fa-history"></i></a>
														</div>
														</c:if>
												</div>

												<div class="form-group row">
													<label for="empagreement" class="col-sm-3 control-label"
														id="empagreementlid"><Span style="color: red;">*</Span>Upload
														Employment agreement</label>
													<!-- <input type="hidden" id="empagreement" name="empagreement" value="empagreement"> -->
													<div class="col-sm-3">
														<input type="file" id="agreement" name="agreement">
														<span id="empagrement"
															onclick="downloadDocument('${attachmentBean.agreement}','empagreement')"
															style="color: blue">${attachmentBean.agreement}</span>
													</div>
													<c:if test="${not empty attachmentBean.agreement}">
														<div class="col-sm-2">
													<input type="button" value="Edit" class="btn btn-default btn-sm" id="edtagg"
														data-toggle="modal"
														onclick="editDocument('${attachmentBean.agreement}',${attachmentBean.afile},'empagreement','');">
														&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
														<a	class="btn btn-success btn-sm" data-toggle='modal'
														href='#myModalView'	onclick="viewDocHistory1('${attachmentBean.afile}','empagreement','');"
														title="View Document History"><i class="fa fa-history"></i></a>
														</div>
														</c:if>
												</div>

												<div class="form-group row">
													<label for="i9_form" class="col-sm-3 control-label"
														id="i9_form"><Span style="color: red;">*</Span>I9
														Form Upload</label>
													<!-- 	<input type="hidden" id="i9_form" name="i9_form"  value="i9_form" > -->
													<div class="col-sm-3">
														<input type="file" id="i9" name="i9"> <span
															id="i9file"
															onclick="downloadDocument('${attachmentBean.i9}','i9_form')"
															style="color: blue">${attachmentBean.i9} </span>
													</div>
													<c:if test="${not empty attachmentBean.i9}">
													    <div class="col-sm-2">
													<input type="button" value="Edit" class="btn btn-default btn-sm" id="edti9"
														data-toggle="modal"
														onclick="editDocument('${attachmentBean.i9}',${attachmentBean.ifile},'i9_form','');">
														&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
														<a	class="btn btn-success btn-sm" data-toggle='modal'
														href='#myModalView'	onclick="viewDocHistory1('${attachmentBean.ifile}','i9_form','');"
														title="View Document History"><i class="fa fa-history"></i></a>
														</div>
														</c:if>
												</div>
												<!-- <div class="col-lg-3 control-label"> 
									    <button class="btn btn-success btn-sm" type="button" onclick="i9Formadd();">
										<span class="glyphicon glyphicon-plus" aria-hidden="true">+</span>
									  </button></div>
									</div> -->

												<div class="form-group row">
													<label for="w4_form" class="col-sm-3 control-label"
														id="w4_form"><Span style="color: red;">*</Span>W4
														Form Upload</label>
													<!-- <input type="hidden" id="w4_form" name="w4_form" value="w4_form" > -->
													<div class="col-sm-3">
														<input type="file" id="w4" name="w4"> <span
															id="w4file"
															onclick="downloadDocument('${attachmentBean.w4}','w4_form')"
															style="color: blue">${attachmentBean.w4} </span>

													</div>
													<c:if test="${not empty attachmentBean.w4}">
													  <div class="col-sm-2">
													<input type="button" value="Edit" class="btn btn-default btn-sm" id="edtw4"
														data-toggle="modal"
														onclick="editDocument('${attachmentBean.w4}',${attachmentBean.wfile},'w4_form','');">
														&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
														<a class="btn btn-success btn-sm" data-toggle='modal'
														href='#myModalView'	onclick="viewDocHistory1('${attachmentBean.wfile}','w4_form','');"
														title="View Document History"><i class="fa fa-history"></i></a> 
														</div>
														</c:if>
												</div>


												<div class="form-group row">
													<label class="col-sm-3 control-label"><b>I9
															Form Additional Documents</b></label>
													<div class="col-lg-3 control-label">
														<button class="btn btn-success btn-sm" type="button"
															onclick="i9Formadd();">
															<span class="glyphicon glyphicon-plus" aria-hidden="true">+</span>
														</button>
													</div>
												</div>

												<div id="i9FormBtnDiv"></div>
												<div class="form-group row">
													<label class="col-sm-3 control-label"><b>I9
															Supporting Documents</b></label>
													<div class="col-lg-3 control-label">
														<button class="btn btn-success btn-sm" type="button"
															onclick="i9SupportingAdd();">
															<span class="glyphicon glyphicon-plus" aria-hidden="true">+</span>
														</button>
													</div>
													<span id="moredoc"></span>
												</div>
												<div id="i9SupporBtnDiv"></div>
												<div class="form-group row">
													<label class="col-sm-3 control-label"><b>Other
															Additional Documents</b></label>
													<div class="col-lg-3 control-label">
														<button class="btn btn-success btn-sm" type="button"
															onclick="OtherAdditional();">
															<span class="glyphicon glyphicon-plus" aria-hidden="true">+</span>
														</button>
													</div>
													<span id="w2moredoc"></span>
												</div>
												<div id="OtherBtnDiv"></div>
												
												 <div class="form-group row">
													<label class="col-sm-3 control-label"><b>I9
															Support Documents</b></label>
													<div class="col-lg-7 control-label">
											         <label class="control-label">List A</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="i9SuppDocType" value="ListA"/>&nbsp;&nbsp;&nbsp;&nbsp;<label>List B & C</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="i9SuppDocType" value="ListBC"/>
													<br><span style="text-align:left;color:grey;font-size:small;vertical-align:top;">Employees may present one selection from List A or a combination of one selection from List B and one selection from List C.</span>
													<br>
													<a href="https://www.uscis.gov/sites/default/files/document/forms/i-9-paper-version.pdf" target="_blank"style="color:blue;">For further queries</a>
													</div>
												</div>
												
										  <div class="form-group row"  id="listAId" style="display:none;">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>List A Documents</label>
											   <div class="col-sm-4">
											     <select name="listA" autoComplete="off" class="form-control" style="width:100%;" multiple="multiple" id="listAselection">
											         <!-- <option value="001">U.S. Passport</option>
										             <option value="Permanent Resident Card">Permanent Resident Card</option>
										             <option value="Foreign passport">Foreign passport</option>
										             <option value="Employment Authorization Document">Employment Authorization Document </option>
										             <option value="Foreign passport and Form I-94 or Form I-94A">Foreign passport and Form I-94 or Form I-94A</option> -->
										         </select>
										      </div>
										    </div>
										  <div id="listAbtnDiv"></div>
										    
										     <div class="form-group row"  id="listBId" style="display:none;">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>List B Documents</label>
											   <div class="col-sm-4">
											     <select name="listB" autoComplete="off" class="form-control text-left" style="width:100%;"  id="listBselection"  multiple="multiple" >
											        <!--   <option value="Driver's license or ID">Driver's license or ID</option>
										             <option value="ID card issued by federal,state or local govt agencies or entities">ID card issued by federal,state or local govt agencies or entities</option>
										             <option value="School ID card with a photograph">School ID card with a photograph</option>
										             <option value="Employment Authorization Document">Employment Authorization Document </option>
										             <option value="U.S. Military card or draft record">U.S. Military card or draft record</option>
										             <option value="Military dependent's ID card">Military dependent's ID card</option>
										             <option value="U.S. Coast Guard Merchant Mariner Card">U.S. Coast Guard Merchant Mariner Card</option>
										              <option value="Native American tribal document">Native American tribal document</option>
										             <option value=" Driver's license issued by a Canadian government authority">Driver's license issued by a Canadian government authority</option>
										             <option value=" School record or report card"> School record or report card</option>
										              <option value="Clinic, doctor, or hospital record">Clinic, doctor, or hospital record</option>
										             <option value="Day-care or nursery school record">Day-care or nursery school record</option> -->
										         </select>
										      </div> 
										    </div>
										      <div id="listBbtnDiv"></div>
										     <div class="form-group row"  id="listCId" style="display:none;">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>List C Documents</label>
											   <div class="col-sm-4">
											     <select name="listC" autoComplete="off" class="form-control text-left" style="width:100%;" id="listCselection"  multiple="multiple" >
										         </select>
										      </div>
										    </div>
										     <div id="listCbtnDiv"></div>
												<center>
													<div class="text-center ml-5">
														<input type="submit" class="btn btn-success"
															style="padding: 7px; background-color: green; color: white; text-transform: INITIAL; line-height: 0.728571;"
															value="Upload Documents" id="allDocs">
															<input type="reset" class="btn btn-default btn-sm" onclick="document.location.reload()" 
															style="padding: 7px; background-color: red; color: white; text-transform: INITIAL; line-height: 0.728571;"
															value="Reset">
														<input type="button" value="Go to Search" onclick="goBack()" class="btn btn-default btn-sm"
															style="padding: 7px; background-color: grey; color: white; line-height: 0.728571;">
													</div>
												</center>
										</form>
									   </fieldset>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			<c:if test="${not empty attachmentBean.i9suplist2}">
			<div class="row">
					<div class="col">
						<div class="card">
							<div class="card-body">
								<div class="row">
										<div class="col-md-12">
											<div class="card" id="dataTBL">
												<div class="card-body">
													<div
														style="max-width:auto;white-space: nowrap;">
														<center>
															<span><strong
																style="font-size: 18px; color: 00cc00;">I9 Support Documents</strong></span>
														</center>
														<br>
														<table id="i9fromTable"
															class="table table-hover table-bordered"
															style="text-align: center;">
															<thead>
																<tr>
																    <th style="text-align: center">File type</th>
																	<th style="text-align: center">File Input</th>
																	<th style="text-align: center">File Name</th>
																	<th style="display:none">Input Value</th>
																	<!-- <th style="text-align: center">Delete</th> -->
																	<th style="text-align: center">Edit</th>
																	<th style="text-align: center">History</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach var="entryi9"
																	items="${attachmentBean.i9suplist2}">
																	<tr>
																		<td>${entryi9.fileType}</td>
																		<td>${entryi9.inputval}</td>
																		<td><span id="ofilename"
																			onclick="downloadDocument('${entryi9.fileName}','additionaldocs')"
																			style="color: blue"> ${entryi9.fileName}</span></td>
																			<td id="linputValI9${entryi9.fileId}" style="display:none">${entryi9.inputval}</td> 
																		<%-- <td><button
																				style="letter-spacing: 1px; background-color: red; color: white;"
																				id="delDocC2C"
																				onclick="deleteDocument(${entryi9.fileId},'${entryi9.fileName}')">
																				<i class="fa fa-trash" aria-hidden="true"></i>
																			</button></td> --%>
																		<%-- <c:choose>
																		<c:when test="${entryi9.fileType=='ListA'}"> --%>
																		<td><button
																				style="letter-spacing: 1px; background-color: #15aabf; color: white;"
																				data-toggle="modal"
																				onclick="editListADocument('${entryi9.fileName}','${entryi9.fileId}','${entryi9.startdate}','${entryi9.expirydate}','${entryi9.fileType}');">
																				<i class="fa fa-edit" aria-hidden="true"></i>
																			</button></td>
																			<td><a class="btn btn-success btn-sm"
																					data-toggle='modal' href='#myModalView'
																					onclick="viewListADocHistory('${candidate_id}','${entryi9.fileType}',${entryi9.fileId});"
																					title="View Document History"><i
																					class="fa fa-history"></i></a></td>	
																		<%-- </c:when>
																		<c:otherwise>
																		<td><button
																				style="letter-spacing: 1px; background-color: #15aabf; color: white;"
																				data-toggle="modal"
																				onclick="editDocument('${entryi9.fileName}','${entryi9.fileId}','${entryi9.fileType}','${entryi9.inputval}');">
																				<i class="fa fa-edit" aria-hidden="true"></i>
																			</button></td>
																			<td><a class="btn btn-success btn-sm"
																					data-toggle='modal' href='#myModalView'
																					onclick="viewListBCDocHistory('${candidate_id}','${entryi9.fileType}',${entryi9.fileId});"
																					title="View Document History"><i
																					class="fa fa-history"></i></a></td>	
																		</c:otherwise>
																		</c:choose> --%>
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
				</c:if>
				<c:if test="${not empty attachmentBean.i9addlist}">
			<div class="row">
					<div class="col">
						<div class="card">
							<div class="card-body">
								<div class="row">
										<div class="col-md-12">
											<div class="card" id="dataTBL">
												<div class="card-body">
													<div
														style="max-width: auto;white-space: nowrap;">
														<center>
															<span><strong
																style="font-size: 18px; color: 00cc00;">I9 Form
																	Additional Documents</strong></span>
														</center>
														<br>
														<table id="i9fromTable"
															class="table table-hover table-bordered"
															style="text-align: center;">
															<thead>
																<tr>
																	<th style="text-align: center">File Input</th>
																	<th style="text-align: center">File Name</th>
																	<!-- <th style="text-align: center">Delete</th> -->
																	<th style="text-align: center">Edit</th>
																	<th style="text-align: center">History</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach var="entryi9"
																	items="${attachmentBean.i9addlist}">
																	<tr>
																		<td>${entryi9.inputval}</td>
																		<td><span
																			onclick="downloadDocument('${entryi9.fileName}','i9supported')"
																			style="color: blue">${entryi9.fileName}</span></td>
																		<%-- <td><button
																				style="letter-spacing: 1px; background-color: red; color: white;"
																				id="delDocC2C"
																				onclick="deleteDocument(${entryi9.fileId},'${entryi9.fileName}')">
																				<i class="fa fa-trash" aria-hidden="true"></i>
																			</button></td> --%>
																		<td><button
																				style="letter-spacing: 1px; background-color: #15aabf; color: white;"
																				data-toggle="modal"
																				onclick="editDocument('${entryi9.fileName}','${entryi9.fileId}','${entryi9.fileType}','${entryi9.inputval}');">
																				<i class="fa fa-edit" aria-hidden="true"></i>
																			</button></td>
																			<td><a class="btn btn-success btn-sm"
																					data-toggle='modal' href='#myModalView'
																					onclick="viewDocHistory1('${entryi9.fileId}','${entryi9.fileType}','${entryi9.inputval}');"
																					title="View Document History"><i
																					class="fa fa-history"></i></a></td>
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
				</c:if>	
					<c:if test="${not empty attachmentBean.i9suplist}">				
			<div class="row">
					<div class="col">
						<div class="card">
							<div class="card-body">
								<div class="row">
										<div class="col-md-12">
											<div class="card" id="dataTBL">
												<div class="card-body">
													<div
														style="max-width: auto;white-space: nowrap;">
														<center>
															<span><strong
																style="font-size: 18px; color: 00cc00;">I9
																	Supporting Documents</strong></span>
														</center>
														<br>
														<table id="supportTable"
															class="table table-hover table-bordered"
															style="text-align: center;">
															<thead>
																<tr>
																	<th style="text-align: center">File Input</th>
																	<th style="text-align: center">File Name</th>
																	<!-- <th style="text-align: center">Delete</th> -->
																	<th style="text-align: center">Edit</th>
																	<th style="text-align: center">History</th>

																</tr>
															</thead>
															<tbody>
																<c:forEach var="entryi9"
																	items="${attachmentBean.i9suplist}">
																	<tr>
																		<td>${entryi9.inputval}</td>
																		<td><span
																			onclick="downloadDocument('${entryi9.fileName}','i9supported')"
																			style="color: blue">${entryi9.fileName}</span></td>
																		<%-- <td><button
																				style="letter-spacing: 1px; background-color: red; color: white;"
																				id="delDocC2C"
																				onclick="deleteDocument(${entryi9.fileId},'${entryi9.fileName}')">
																				<i class="fa fa-trash" aria-hidden="true"></i>
																			</button></td> --%>
																		<td><button
																				style="letter-spacing: 1px; background-color: #15aabf; color: white;"
																				data-toggle="modal"
																				onclick="editDocument('${entryi9.fileName}','${entryi9.fileId}','${entryi9.fileType}','${entryi9.inputval}');">
																				<i class="fa fa-edit" aria-hidden="true"></i>
																			</button></td>
																			<td><a class="btn btn-success btn-sm"
																					data-toggle='modal' href='#myModalView'
																					onclick="viewDocHistory1('${entryi9.fileId}','${entryi9.fileType}','${entryi9.inputval}');"
																					title="View Document History"><i
																					class="fa fa-history"></i></a></td>
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
				</c:if>
				
		    <c:if test="${not empty attachmentBean.othersuplist}">				
			<div class="row">
					<div class="col">
						<div class="card">
							<div class="card-body">
								<div class="row">
										<div class="col-md-12">
											<div class="card" id="dataTBL">
												<div class="card-body">
													<div
														style="max-width: auto;white-space: nowrap;">
														<center>
															<span><strong
																style="font-size: 18px; color: 00cc00;">Other
																	Additional Documents</strong></span>
														</center>
														<br>
														<table id="i9fromTable2"
															class="table table-hover table-bordered"
															style="text-align: center;">
															<thead>
																<tr>
																	<th style="text-align: center">File Input</th>
																	<th style="text-align: center">File Name</th>
																	<!-- <th style="text-align: center">Delete</th> -->
																	<th style="text-align: center">Edit</th>
																	<th style="text-align: center">History</th>

																</tr>
															</thead>
															<tbody>
																<c:forEach var="entryi9"
																	items="${attachmentBean.othersuplist}">
																	<tr>
																		<td>${entryi9.inputval}</td>
																		<td><span
																			onclick="downloadDocument('${entryi9.fileName}','i9supported')"
																			style="color: blue">${entryi9.fileName}</span></td>
																		<%-- <td><button
																				style="letter-spacing: 1px; background-color: red; color: white;"
																				id="delDocC2C"
																				onclick="deleteDocument(${entryi9.fileId},'${entryi9.fileName}')">
																				<i class="fa fa-trash" aria-hidden="true"></i>
																			</button></td> --%>
																		<td><button
																				style="letter-spacing: 1px; background-color: #15aabf; color: white;"
																				data-toggle="modal"
																				onclick="editDocument('${entryi9.fileName}','${entryi9.fileId}','${entryi9.fileType}','${entryi9.inputval}');">
																				<i class="fa fa-edit" aria-hidden="true"></i>
																			</button></td>
																			<td><a class="btn btn-success btn-sm"
																					data-toggle='modal' href='#myModalView'
																					onclick="viewDocHistory1('${entryi9.fileId}','${entryi9.fileType}','${entryi9.inputval}');"
																					title="View Document History"><i
																					class="fa fa-history"></i></a></td>
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
				</c:if>
				
				<%-- <c:if test="${not empty attachmentBean.othersuplist}">
					<div class="row">
					<div class="col">
						<div class="card">
							<div class="card-body">
								<div class="row">
										<div class="col-md-12">
											<div class="card" id="dataTBL">
												<div class="card-body">
													<div
														style="max-width: auto;white-space: nowrap;">
														<center>
															<span><strong
																style="font-size: 18px; color: 00cc00;">Other
																	Additional Documents</strong></span>
														</center>
														<br>
														<table id="i9fromTable"
															class="table table-hover table-bordered"
															style="text-align: center;">
															<thead>
																<tr>
																	<th style="text-align: center">File Input</th>
																	<th style="text-align: center">File Name</th>
																	<!-- <th style="text-align: center">Delete</th> -->
																	<th style="text-align: center">Edit</th>
																	<th style="text-align: center">History</th>

																</tr>
															</thead>
															<tbody>
																<c:forEach var="entry"
																	items="${attachmentBean.othersuplist}">
																	<tr>

																		<td>${entry.inputval}</td>
																		<td><span id="ofilename"
																			onclick="downloadDocument('${entry.fileName}','additionaldocs')"
																			style="color: blue"> ${entry.fileName}</span></td>
																		<td><button
																				style="letter-spacing: 1px; background-color: red; color: white;"
																				id="delDocC2C"
																				onclick="deleteDocument(${entry.fileId},'${entry.fileName}')">
																				<i class="fa fa-trash" aria-hidden="true"></i>
																			</button></td>
																		<td><button
																				style="letter-spacing: 1px; background-color: #15aabf; color: white;"
																				data-toggle="modal"
																				onclick="editDocument('${entry.fileName}','${entry.fileId}','${entry.fileType}','${entry.inputval}');">
																				<i class="fa fa-edit" aria-hidden="true"></i>
																			</button></td>
																		<td><a class="btn btn-success btn-sm"
																					data-toggle='modal' href='#myModalView'
																					onclick="viewDocHistory1('${candidate_id}','${entry.fileType}','${entry.inputval}');"
																					title="View Document History"><i
																					class="fa fa-history"></i></a></td>	
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
				</c:if> --%>
			</div>
		</div>
	</div>


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
						action="editEmployeeDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="efileId" name="fileId"> 
						<input type="hidden" id="efileType" name="efileType"> 
						<input type="hidden" id="eInputVal" name="eInputVal"> 
						<input type="hidden" name="candidate_id" value="${candidate_id}">
						<input type="hidden" name="empType" id="empType" value="${empType}"> 

						<div class="modal-body">
							<div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;">*</Span>File Name :</label>
								<div class="col-lg-6">
									<span id="efileName"></span>
								</div>
							</div>

							<div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;">*</Span>Upload File :</label>
								<div class="col-lg-6">
									<input type="file" id="editFile" name="editFile"
										class="form-control text-left" onchange="ValidateSize(this)"
										required />
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
	
		<%-- <center>
		<div class="modal fade" id="EditListBCDocumentModal" tabindex="-1"
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
						action="editEmployeeListBCDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="lefileId" name="lfileId"> 
						<input type="hidden" id="lefileType" name="lefileType"> 
						<input type="hidden" id="leInputVal" name="leInputVal"> 
						<input type="hidden" name="candidate_id" value="${candidate_id}">
						<input type="hidden" name="empType" value="${empType}"> 

						<div class="modal-body">
							<div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;">*</Span>File Name :</label>
								<div class="col-lg-6">
									<span id="lefileName"></span>
								</div>
							</div>

							<div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;">*</Span>Upload File :</label>
								<div class="col-lg-6">
									<input type="file" id="leditFile" name="leditFile"
										class="form-control text-left" onchange="ValidateSize(this)"
										required />
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
	</center> --%>
	
	<center>
		<div class="modal fade" id="EditWADocumentModal" tabindex="-1"
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
						action="editListADocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="waefileId" name="waefileId">
					    <input type="hidden" id="waefileType" name="waefileType"> 
					    <input type="hidden" id="waeInputVal" name="waeInputVal"> 
						<input type="hidden" id="waCandidateId" name="waCandidateId" value="${candidate_id}">
						<input type="hidden" id="waempType" name="waempType" value="${empType}">  
						<input type="hidden" id="wafromdate1" name="wafromdate1"> 
						<input type="hidden" id="waexpirydate1" name="waexpirydate1"> 
					
						
						<div class="modal-body">							
					   <div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;"></Span>Upload File :</label>
								<div class="col-lg-6">
									<input type="file" id="waeditFile" name="waeditFile"
										class="form-control text-left" onchange="EditValidateSize(this)"/>
									<span id="waefileName" style="color:blue;"></span>
								</div>
					    </div>
					    <div class="form-group row">
					    <label class="col-lg-3 control-label"></label>
							<div class="col-sm-4">
										<input type="text" id="wafromdate" class="form-control text-left"     autocomplete="off"
												title="Enter date in MM/DD/YYYY format only" name="wafromdate" placeholder="Start Date" class="form-control" required> 
							</div>
						    <div class="col-sm-4">
										<input type="text" id="waexpirydate" class="form-control text-left"     autocomplete="off"
												title="Enter date in MM/DD/YYYY format only" name="waexpirydate" placeholder="End Date" class="form-control" required>
							</div>
						</div>					   
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal">Close</button>
							<button type="submit" id="wasubmitid" class="btn btn-primary btn-sm">Save
								changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</center>
	
	<center>
		<div class="modal fade" id="ConsultantDocHistoryModal" tabindex="-1"
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
					   		<table id="ConsultantDocHistoryTable" class="table table-hover table-bordered" style="text-align:center;">
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
		<div class="modal fade" id="ConsultantDocHistoryModal1" tabindex="-1"
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
					   		<table id="ConsultantDocHistoryTable1" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>FileName</th>
								<th>FileType</th>								
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
		<div class="modal fade" id="ConsultantDocHistoryModal2" tabindex="-1"
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
					   		<table id="ConsultantDocHistoryTable2" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>FileName</th>
								<th>FileType</th>
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
		<div class="modal fade" id="DeleteDocumentModal" tabindex="-1"
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
						action="deleteDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="dfileId" name="fileId"> <input
							type="hidden" name="candidate_id" value="${candidate_id}">

						<div class="modal-body">
							<div class="form-group row">
								<label class="col-lg-3 control-label">File Name :</label>
								<div class="col-lg-6">
									<span id="dfileName" style="color:red;"></span>
								</div>
							</div>
								<div class="form-group row">
								<div class="col-lg-12">
								<strong><span style="color: red;">Are you sure you want to delete this document?</span></strong>
								</div>
							</div> 
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal">NO</button>
							<button type="submit" class="btn btn-primary btn-sm">Yes
								</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</center>


	<form action="searchlist" method="post" id="bformid">
		<input type="hidden" name="semp_type" value="${semp_type}"> 
		<input type="hidden" name="susername" value="${susername}"> 
		<input type="hidden" name="sfullname" value="${sfullname}">
		<input type="hidden" name="spendingdocs" value="${spendingdocs}"> 
		<input type="hidden" name="s_subtype" value="${s_subtype}">
		<input type="hidden" name="empstatus" value="${sempstatus}">
	</form>
	</div>
	<!-- Javascripts-->
	<script src="resources/js/js/jquery-2.1.4.min.js"></script>
	<script src="resources/js/newjs/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/js/select2.min.js"></script> 
	<!--  <script src="https://cdn.bootcss.com/select2/3.4.5/select2.min.js"></script> -->
	<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
	<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
<script src="resources/preDefined/goback.js"></script>
	 <script>
  $('#listAselection').select2({
	    placeholder: "Select a Type",
	});
  $('#listCselection').select2({
	    placeholder: "Select a Type",
	});
  $('#listBselection').select2({
	    placeholder: "Select a Type",
	});
  $('#emp_type,#pendingdocs').select2({
	    minimumResultsForSearch: -1
	});
  </script>
	<script>
	function w4upload(){
		$("#w4uploaddetails").show();	
};
       function editDocument(fname,id,fileType,inputVal){
    	   getsesVal().done(function(data){
    			if(data!=""){
              $('#efileId,#efileType,#eInputVal').val('');
              $('#efileName').text('');
              $('#efileId').val(id);
              $('#efileName').text(fname);
              $('#efileType').val(fileType);
              $('#eInputVal').val(inputVal);
              var title="";
          	 if(fileType=='offerletter'){
          		title="Offer letter ";	
          	 }else if(fileType=='empagreement'){
          		title="Employment agreement ";
          	 }else if(fileType=='i9_form'){
          		title="I9 Form ";
          	 }else if(fileType=='w4_form'){
          		title="W4 Form ";
          	 }else if(fileType=='i9Formdocs'){
          		title="I9 Form Additional ";
          	 }else if(fileType=='i9Supportdocs'){
          		title="I9 Supporting ";
          	 }else if(fileType=='OtherAdditionaldocs'){
          		title="Other Additional ";
          	 }
          	$('h5').text(title+"Document Details");
              
           $('#EditDocumentModal').modal('show');
    			}else{
    				 window.location.href="loginpage";
    			}
    			});
       };

      /*  function editListBCDocument(fname,id,ftype,inputVal){
           $('#lefileId,#lefileType,#leInputVal').val('');
           $('#lefileName').text('');
           $('#lefileId').val(id);
           $('#lefileName').text(fname);
           $('#lefileType').val(ftype);
           $('#leInputVal').val(inputVal);
          $('#EditListBCDocumentModal').modal('show');
       }; */
       
       function deleteDocument(id,fname){
    	   getsesVal().done(function(data){
    			if(data!=""){
           /* $('#dfileId').val('');
           $('#dfileName').text(''); */
           $('#dfileId').val(id);
           $('#dfileName').text(fname);
        $('#DeleteDocumentModal').modal('show');
    			}else{
    				 window.location.href="loginpage";
    			}
    			});
    };
</script>
	<script>
$( document ).ready(function() {
	 var ofletter=document.getElementById("offer").innerText;
    if(ofletter!=""){
    	var msg="Offer Letter";
        $("#edtoff").show();
        $("#delDocC2C1").show();
        $("#offer_letter").hide();
        $("#offerletter").text(msg);
        }
        else{
        	 $("#edtoff").hide();
        	 $("#delDocC2C1").hide();
        	  $("#offer_letter").show();
        }
    
	 var aggrement=document.getElementById("empagrement").innerText;
	 if(aggrement!=""){
		 var msg="Employment Agreement";
	        $("#edtagg").show();
	        $("#delDocC2C2").show();
	        $("#agreement").hide();
	        $("#empagreementlid").text(msg);
	        }
	        else{
	         $("#edtagg").hide();
	         $("#delDocC2C2").hide();
	         $("#agreement").show();
	        }
	 var file9=document.getElementById("i9file").innerText;
	 if(file9!=""){
		 var msg="I9Form";
	    	$("#delDocC2C3").show();
	        $("#edti9").show();
	        $("#i9").hide();
	        $("#i9_form").text(msg);
	        }
	        else{
	        	$("#edti9").hide();
	            $("#delDocC2C3").hide();
	            $("#i9").show();
	        }
	
	var filew=document.getElementById("w4file").innerText;
	 if(filew!=""){
		 var msg="W4Form";
	        $("#edtw4").show();
	        $("#delDocC2C4").show();
	        $("#w4").hide();
	        $("#w4_form").text(msg);
	        }
	        else{
	         $("#edtw4").hide();
	         $("#delDocC2C4").hide();
	         $("#w4").show();
	        }
});
</script>
	<script type="text/javascript">
var icval = 0;
var max_field=15;
function i9Formadd() {
	icval++;      
	$('#allDocs').removeAttr("disabled");
	$('#i9FormAddBtnCount').val(icval);
    var objTo = document.getElementById('i9FormBtnDiv');
    var divtest = document.createElement("div");
	divtest.setAttribute("class", "form-group row removeclass"+icval);
	var rdiv = 'removeclass'+icval;
    divtest.innerHTML = '<div class="col-lg-4"><div class="form-group row"> <input type="text" class="form-control" name="i9forminput'+icval+'" placeholder="Enter Document name" required><input type="hidden" value="'+icval+'" name="i9FormAddBtnCount"></div></div><div class="col-lg-4"><div class="form-group row"> <input type="file" class="form-control" name="i9formFile'+icval+'" placeholder="I9 add doc" onchange="ValidateSize(this)" required></div></div><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="removefieldsaddi9('+icval+');"> <span class="glyphicon glyphicon-minus" aria-hidden="true">-</span> </button></div></div></div></div><div class="clear"></div>';
    if(icval<=max_field){
   	 objTo.appendChild(divtest);
   }else if(icval>max_field){
   	 alert("Cannot upload more than 15 documents!!");
   }
}
function removefieldsaddi9(rid) {
	   $('.removeclass'+rid).remove();
	   icval--;
	}

var sp_icval = 0;
function i9SupportingAdd() {
	sp_icval++;      
		$('#allDocs').removeAttr("disabled");
		$('#i9supportbtncount').val(sp_icval);
	    var objTo = document.getElementById('i9SupporBtnDiv');
	    var divtest = document.createElement("div");
		divtest.setAttribute("class", "form-group row removeclass"+sp_icval);
		var rdiv = 'removeclass'+sp_icval;
	    divtest.innerHTML = '<div class="col-lg-4"><div class="form-group row"> <input type="text" class="form-control" name="i9supportinput'+sp_icval+'"  placeholder="Enter Document name" required><input type="hidden" value="'+sp_icval+'" name="i9supportbtncount"></div></div><div class="col-lg-4"><div class="form-group row"> <input type="file" class="form-control" name="i9supportFile'+sp_icval+'" placeholder="I9 add doc" onchange="ValidateSize(this)" required></div></div><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="removefieldsupporti9('+sp_icval+');"> <span class="glyphicon glyphicon-minus" aria-hidden="true">-</span> </button></div></div></div></div><div class="clear"></div>';
	    if(sp_icval<=max_field){
	   	 objTo.appendChild(divtest);
	   }else if(sp_icval>max_field){
	   	 alert("Cannot upload more than 15 documents!!");
	   }
	}
	function removefieldsupporti9(rid) {
		   $('.removeclass'+rid).remove();
		   sp_icval--;
	}

	var io_cval = 0; 
function OtherAdditional() { 
	io_cval++;      
		$('#allDocs').removeAttr("disabled");
		$('#OtherBtnCount').val(io_cval);
	    var objTo = document.getElementById('OtherBtnDiv');
	    var divtest = document.createElement("div");
		divtest.setAttribute("class", "form-group row removeclass"+io_cval);
		var rdiv = 'removeclass'+io_cval;
	    divtest.innerHTML = '<div class="col-lg-4"><div class="form-group row"> <input type="text" class="form-control" name="otherAddtnlinput'+io_cval+'"  placeholder="Enter Document name" required><input type="hidden" value="'+io_cval+'" name="OtherBtnCount"></div></div><div class="col-lg-4"><div class="form-group row"> <input type="file" class="form-control" name="otherAddtnlFile'+io_cval+'" placeholder="I9 add doc" onchange="ValidateSize(this)" required></div></div><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="removefieldsupporti9('+io_cval+');"> <span class="glyphicon glyphicon-minus" aria-hidden="true">-</span> </button></div></div></div></div><div class="clear"></div>';
	    if(io_cval<=max_field){
	   	 objTo.appendChild(divtest);
	   }else if(io_cval>max_field){
	   	 alert("Cannot upload more than 15 documents!!");
	   }
	}
	function removefieldsupporti9(rid) {
		   $('.removeclass'+rid).remove();
		   io_cval--;		  
	}
	
    </script>
	<script type="text/javascript">
    $('#allDocs').attr("disabled", "disabled");
    </script>
	<script>
    $('input[type="file"]').change(function(e){
        var fileName = e.target.files[0].name;
        $('#allDocs').removeAttr("disabled");
    });
    	
    </script>

	<script>
	$('#span1').text('');
	
</script>

	<script>
	function addfieldsI9(empno,candidate_id){
		getsesVal().done(function(data){
			if(data!=""){
		 var modal="#I9AddModal";
		 $.ajax({
				type : "get",
				url : "USOBT_BasicDetails?action=viewI9AdditionalDocs&empno="+empno+"&candidate_id="+candidate_id,
				cache : false,
				async : false,
				success : function(response) {
					var list1 = response.length;
					//alert(list1);
					 $( modal ).show();
				},
				error : function() {
				}
			});
			}else{
				 window.location.href="loginpage";
			}
			});
		} ; 
</script>

	<script type="text/javascript">

function checkForm(form)
{
	getsesVal().done(function(data){
		if(data!=""){
	 var offer_letter = $('#offer_letter').val(); 
     var agreement = $('#agreement').val(); 
     var i9 = $('#i9').val(); 
     var pd = $('#pendingDocs').val(); 
     var i9_doc=$("input[name='i9_doc[]']").length;
     var w2_doc=$("input[name='w2_doc[]']").length;
     var i9add_doc=$("input[name='i9add_doc[]']").length;
     var listAFile=$("input[name='listAFile[]']").length;
     var listBFile=$("input[name='listBFile[]']").length;
     var listCFile=$("input[name='listCFile[]']").length;
     var i9add_doc=$("#i9add_doc").val();
     var filenames = ';';
      if(offer_letter!='' || agreement!='' || i9!='' || i9_doc>0 || w2_doc>0 || i9add_doc!='' || listAFile>0 || listBFile>0 || listCFile>0 ) 
     { 
 	    return true;
     }else{
    	  alert( 'Please select file' );
    	  return false;
      } 
		}else{
			 window.location.href="loginpage";
		}
		});      
}


function editListADocument(fname,id,stdate,expdate,fileType){
	getsesVal().done(function(data){
		if(data!=""){
	var inputVal=$("#linputValI9"+id).html();
	$('#wasubmitid').attr('disabled',true);
    $('#waefileId,#waeditFile,#waefileType,#waeInputVal').val('');
    if(fileType=='ListA'){
	    $("#wafromdate,#waexpirydate").prop('required',true);
   }else{
	 $("#wafromdate,#waexpirydate").prop('required',false);
    }
    $('#waefileName').text('');
    $('#waefileId').val(id);
    $('#waefileName').text(fname);
    $('#waefileType').val(fileType);
    $('#waeInputVal').val(inputVal);
    $('#wafromdate1').val(stdate);
    $('#waexpirydate1').val(expdate);
    $('#wafromdate').val(stdate);
    $('#waexpirydate').val(expdate);
    var title="";
    if(fileType=='ListB'){
		title="ListB ";
	 }else if(fileType=='ListC'){
		title="ListC ";
	 }else if(fileType=='ListA'){
		title="ListA ";
	 }
	$('h5').text(title+"Document Details");
    var dates = new Date(stdate);
	dates.setDate(dates.getDate());
	var edates = new Date(expdate);
	edates.setDate(edates.getDate());
		
$("#wafromdate").datepicker({
	endDate: edates,
	maxDate: edates
}).on('changeDate', function(selected) {
	 var minDate = new Date(selected.date.valueOf());
     $('#waexpirydate').datepicker('setStartDate', minDate);
     if($('#wafromdate').val()==$('#wafromdate1').val())
     {$('#wasubmitid').attr('disabled',true);}else{$('#wasubmitid').attr('disabled',false);}
});	
$("#waexpirydate").datepicker({
	startDate: dates,
	minDate: dates
}).on('changeDate', function(selected) {
        var minDate = new Date(selected.date.valueOf());
        $('#wafromdate').datepicker('setEndDate', minDate);
        if($('#waexpirydate').val()==$('#waexpirydate1').val())
        {$('#wasubmitid').attr('disabled',true);}else{$('#wasubmitid').attr('disabled',false);}
});
  	
    $('#EditWADocumentModal').modal('show');
		}else{
			 window.location.href="loginpage";
		}
		});
};

function saveDocuments(){
	getsesVal().done(function(data){
		if(data!=""){
    	 $("#allDocs").attr("disabled",true);
 		 var form = $('#formidFiles')[0];
 	     var data = new FormData(form);
 	    var empType = $('#empType').val(); 
 		$.ajax({
 	            url: "saveEmpDocuments", //this is the submit URL
 	            type: "POST",
 	            enctype: 'multipart/form-data',
 	            data: data,
 	            processData: false,
 	            contentType: false,
 	            cache: false,
 	            success: function(response){
 	   	        if(response!=null || response!=""){
 	 	   	        var message=response.message;
 	 	   	   		var candidateId=response.candidateId;
	   	            var docstatus=response.docstatus;
	   	         	var clientstatus=response.clientstatus;
	   	        	var bankstatus=response.bankstatus;
	   	      	    alert(message);
	   	          if(docstatus==0){
	   	        		 window.location.href="addEmpDocuments?candidate_id="+candidateId+"&empType="+empType+"";
 	               }else{
 	            	 if(empType=='W2 Admin'){
 	            		 if(bankstatus==0){
 	            			 window.location.href="addEmpBankDetails?candidate_id="+candidateId+"";
 	            		 }else{
 	            			 window.location.href="viewEmpBankDetails?candidate_id="+candidateId+"";
 	            		 }
	   	        	  }else{
	   	        		 if(clientstatus==0){
	   	        			 window.location.href="addClientVendor?candidate_id="+candidateId+"&empType="+empType+"";
	   	        		 }else{
	   	        			 window.location.href="viewClientVendor?candidate_id="+candidateId+"&empType="+empType+"";
	   	        		   }
	   	        	    }
 	                 }
 	   	             // window.location.href="addEmpDocuments?candidate_id="+candidate_id+"";
 	   	   	        }
 	            }
 	        });
		}else{
			 window.location.href="loginpage";
		}
		});
}

function goBack() {
	getsesVal().done(function(data){
		if(data!=""){
document.getElementById("bformid").submit();
		}else{
			 window.location.href="loginpage";
		}
		});
}

//$('#i9SuppDocType').on('click', function() {
$('input:radio').change(function(){
	getsesVal().done(function(data){
		if(data!=""){
	var i9sdType=$("input[name='i9SuppDocType']:checked").val();
	var candidate_id=$('#candidate_id').val();
if(i9sdType=='ListA'){
//	alert("if*****"+i9sdType);
	var candidate_id=$('#candidate_id').val();
	$('#listAId').show();
	$('#listBId,#listCId').hide();
	$("#listBfileId,#listCfileId").hide();
	$("#listBbtnDiv,#listCbtnDiv,#listBselection,#listCselection").empty();
	$('#listCselection,#listBselection').val('').trigger('change');
	$('#listCselection,#listBselection').removeAttr('required');
	$('#listAselection').attr('required',true);
	 $.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "application/json", // NOT dataType!
	        url  : "geti9SupportDocumentsListByType",
	        data:{"candidate_id":candidate_id,"i9sdType":i9sdType},
	        success  : function(response){
	        	var lista=response.lista;
	        	 /* $('#listAselection').empty();
		    	  $('#listAselection').append($('<option/>').attr("value", '').text("--Select Type--"));
	        	for(var i=0;i<response.length;i++)
	     	       {
	        		$('#listAselection').append($('<option/>').attr("value", response[i].emp_number).text(response[i].empName));
	               } */
	               $('#listAselection').empty();  
	         	     $('#listAselection').append($('<option/>').attr("value", "").text("--Select System--"));
	         	        for(var i=0;i<lista.length;i++)
	         	     	  {
	         	        		$('#listAselection').append($('<option/>').attr("value", lista[i]).text(lista[i]));
	         	  	       }   
	        	$('#listAId').show();	
	          }
	    });
}else if(i9sdType=='ListBC'){
	//$('#listBId,#listCId').show();
	$('#listCselection,#listBselection').attr('required',true);
	$("#listAbtnDiv,#listAselection").empty();
	$('#listAselection').val('').trigger('change');
	$('#listAselection').removeAttr('required');
	$('#listAId').hide();
	$.ajax({
    	type : "GET",
        asyn : false,
        contentType: "application/json", // NOT dataType!
        url  : "geti9SupportDocumentsListByType",
        data:{"candidate_id":candidate_id,"i9sdType":i9sdType},
        success  : function(response){
        	var listb=response.listb;
        	var listc=response.listc;
               $('#listBselection').empty();  
         	     $('#listBselection').append($('<option/>').attr("value", "").text("--Select System--"));
         	        for(var i=0;i<listb.length;i++)
         	     	  {
         	        		$('#listBselection').append($('<option/>').attr("value", listb[i]).text(listb[i]));
         	  	       }   
        	$('#listCselection').empty();  
    	     $('#listCselection').append($('<option/>').attr("value", "").text("--Select System--"));
    	        for(var i=0;i<listc.length;i++)
    	     	  {
    	        		$('#listCselection').append($('<option/>').attr("value", listc[i]).text(listc[i]));
    	  	       } 
    	        $('#listBId,#listCId').show();
          }
    });
  }
}else{
	 window.location.href="loginpage";
}
});
});

var prevClicked = [];
var curClicked = [];
var difference = [];
var la_cval = 0; 
$('#listAselection').change(function(){
	$('#allDocs').removeAttr("disabled");
    curClicked = $(this).val();
    if(curClicked == null){
        curClicked=[];
    }
    clickType = getClickType();
    var clickedValue = diffArray(curClicked, prevClicked);
    prevClicked = curClicked;
    if(clickType=='select' && clickedValue!=""){
    	la_cval++;
    	var objTo = document.getElementById('listAbtnDiv');
	    var divtest = document.createElement("div");
		divtest.setAttribute("class", "form-group row removelass"+la_cval);
		divtest.setAttribute("name", clickedValue);
		//divtest.innerHTML = '<label class="col-sm-4 control-label">'+clickedValue+'</label><input type="hidden" value="'+clickedValue+'" name="listASelectionId'+la_cval+'"><input type="hidden" value="'+la_cval+'" name="listABtnCount"><div class="col-sm-3"><div class="form-group row"> <input type="file" class="form-control" name="listAFile'+la_cval+'" placeholder="'+clickedValue+'" onchange="ValidateSize(this)" required></div></div><div class="col-sm-2" ><input type="text" id="fromdate'+la_cval+'" class="form-control text-left" title="Enter date in MM/DD/YYYY format only" name="fromdate'+la_cval+'" placeholder="Start Date" class="form-control"required></div><div class="col-sm-2"><input type="text" id="expirydate'+la_cval+'" class="form-control text-left" title="Enter date in MM/DD/YYYY format only" name="expirydate'+la_cval+'" placeholder="End Date" class="form-control"required></div><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="removefieldi9(\''+la_cval+'\',\''+clickedValue+'\');"> <span class="glyphicon glyphicon-minus" aria-hidden="true">-</span> </button></div></div></div></div><div class="clear"></div>';
		divtest.innerHTML = '<label class="col-sm-4 control-label">'+clickedValue+'</label><input type="hidden" value="'+clickedValue+'" name="listASelectionId'+la_cval+'"><input type="hidden" value="'+la_cval+'" name="listABtnCount"><div class="col-sm-4"><div class="form-group row"> <input type="file" class="form-control" name="listAFile'+la_cval+'" placeholder="'+clickedValue+'" onchange="ValidateSize1(this)" required></div></div><div class="col-sm-2" ><input type="text" id="fromdate'+la_cval+'" class="form-control text-left" title="Enter date in MM/DD/YYYY format only" name="fromdate'+la_cval+'" placeholder="Start Date" class="form-control"required></div><div class="col-sm-2"><input type="text" id="expirydate'+la_cval+'" class="form-control text-left" title="Enter date in MM/DD/YYYY format only" name="expirydate'+la_cval+'" placeholder="End Date" class="form-control"required></div></div></div></div><div class="clear"></div>';
		objTo.appendChild(divtest);
	    $("#fromdate"+la_cval).datepicker({
	    }).on('changeDate', function(selected) {
	    	 var minDate = new Date(selected.date.valueOf());
	         $('#expirydate'+la_cval).datepicker('setStartDate', minDate);
	    });	
	    $("#expirydate"+la_cval).datepicker({
	    }).on('changeDate', function(selected) {
	            var minDate = new Date(selected.date.valueOf());
	            $('#fromdate'+la_cval).datepicker('setEndDate', minDate);
	    });
    }else{ 
    	    // alert("else "+clickType);
    	     var objTo = document.getElementById('listAbtnDiv');
    	     var selectedNode = document.getElementsByName(clickedValue);
    	     if(selectedNode.length > 0 ){
    	     selectedNode[0].remove();
    	       la_cval--;
    	     }
       }
   
}); 

var bprevClicked = [];
var bcurClicked = [];
var bdifference = [];
var bla_cval = 0; 
$('#listBselection').change(function(){
	$('#allDocs').removeAttr("disabled");
	bcurClicked = $(this).val();
    if(bcurClicked == null){
    	bcurClicked=[];
    }
    bclickType = getClickTypeb();
    var bclickedValue = diffArrayb(bcurClicked, bprevClicked);
    bprevClicked = bcurClicked;
    if(bclickType=='select' && bclickedValue!=""){
    	bla_cval++;
    	var objTob = document.getElementById('listBbtnDiv');
	    var divtestb = document.createElement("div");
	    divtestb.setAttribute("class", "form-group row removelass"+bla_cval);
	    divtestb.setAttribute("name", bclickedValue);
		//divtest.innerHTML = '<label class="col-sm-4 control-label">'+clickedValue+'</label><input type="hidden" value="'+clickedValue+'" name="listASelectionId'+la_cval+'"><input type="hidden" value="'+la_cval+'" name="listABtnCount"><div class="col-sm-3"><div class="form-group row"> <input type="file" class="form-control" name="listAFile'+la_cval+'" placeholder="'+clickedValue+'" onchange="ValidateSize(this)" required></div></div><div class="col-sm-2" ><input type="text" id="fromdate'+la_cval+'" class="form-control text-left" title="Enter date in MM/DD/YYYY format only" name="fromdate'+la_cval+'" placeholder="Start Date" class="form-control"required></div><div class="col-sm-2"><input type="text" id="expirydate'+la_cval+'" class="form-control text-left" title="Enter date in MM/DD/YYYY format only" name="expirydate'+la_cval+'" placeholder="End Date" class="form-control"required></div><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="removefieldi9(\''+la_cval+'\',\''+clickedValue+'\');"> <span class="glyphicon glyphicon-minus" aria-hidden="true">-</span> </button></div></div></div></div><div class="clear"></div>';
		divtestb.innerHTML = '<label class="col-sm-4 control-label">'+bclickedValue+'</label><input type="hidden" value="'+bclickedValue+'" name="listBSelectionId'+bla_cval+'"><input type="hidden" value="'+bla_cval+'" name="listBBtnCount"><div class="col-sm-3"><div class="form-group row"><input type="file" class="form-control" name="listBFile'+bla_cval+'" placeholder="'+bclickedValue+'" onchange="ValidateSize1(this)" required></div></div><div class="col-sm-2" ><input type="text" id="lbfromdate'+bla_cval+'" class="form-control text-left" title="Enter date in MM/DD/YYYY format only" name="lbfromdate'+bla_cval+'" placeholder="Start Date" class="form-control"></div><div class="col-sm-2"><input type="text" id="lbexpirydate'+bla_cval+'" class="form-control text-left" title="Enter date in MM/DD/YYYY format only" name="lbexpirydate'+bla_cval+'" placeholder="End Date" class="form-control"></div></div></div></div><div class="clear"></div>';
		objTob.appendChild(divtestb);
		  $("#lbfromdate"+bla_cval).datepicker({
		    }).on('changeDate', function(selected) {
		    	 var minDate = new Date(selected.date.valueOf());
		         $('#lbexpirydate'+bla_cval).datepicker('setStartDate', minDate);
		    });	
		    $("#lbexpirydate"+bla_cval).datepicker({
		    }).on('changeDate', function(selected) {
		            var minDate = new Date(selected.date.valueOf());
		            $('#lbfromdate'+bla_cval).datepicker('setEndDate', minDate);
		    });
    }else{ 
    	    // alert("else "+clickType);
    	     var objTob = document.getElementById('listBbtnDiv');
    	     var selectedNode = document.getElementsByName(bclickedValue);
    	     if(selectedNode.length > 0 ){
    	     selectedNode[0].remove();
    	       bla_cval--;
    	     }
       }
});



var cprevClicked = [];
var ccurClicked = [];
var cdifference = [];
var cla_cval = 0; 
$('#listCselection').change(function(){
	ccurClicked = $(this).val();
    if(ccurClicked == null){
    	ccurClicked=[];
    }
    cclickType = getClickTypec();
    var cclickedValue = diffArrayc(ccurClicked, cprevClicked);
    cprevClicked = ccurClicked;
    if(cclickType=='select' && cclickedValue!=""){
    	cla_cval++;
    	var objToc = document.getElementById('listCbtnDiv');
	    var divtestc = document.createElement("div");
	    divtestc.setAttribute("class", "form-group row removelass"+cla_cval);
	    divtestc.setAttribute("name", cclickedValue);
		divtestc.innerHTML = '<label class="col-sm-4 control-label">'+cclickedValue+'</label><input type="hidden" value="'+cclickedValue+'" name="listCSelectionId'+cla_cval+'"><input type="hidden" value="'+cla_cval+'" name="listCBtnCount"><div class="col-sm-3"><div class="form-group row"> <input type="file" class="form-control" name="listCFile'+cla_cval+'" placeholder="'+cclickedValue+'" onchange="ValidateSize1(this)" required></div></div><div class="col-sm-2" ><input type="text" id="lcfromdate'+cla_cval+'" class="form-control text-left" title="Enter date in MM/DD/YYYY format only" name="lcfromdate'+cla_cval+'" placeholder="Start Date" class="form-control"></div><div class="col-sm-2"><input type="text" id="lcexpirydate'+cla_cval+'" class="form-control text-left" title="Enter date in MM/DD/YYYY format only" name="lcexpirydate'+cla_cval+'" placeholder="End Date" class="form-control"></div></div></div></div><div class="clear"></div>';
		objToc.appendChild(divtestc);
		 $("#lcfromdate"+cla_cval).datepicker({
		    }).on('changeDate', function(selected) {
		    	 var minDate = new Date(selected.date.valueOf());
		         $('#lcexpirydate'+cla_cval).datepicker('setStartDate', minDate);
		    });	
		    $("#lcexpirydate"+cla_cval).datepicker({
		    }).on('changeDate', function(selected) {
		            var minDate = new Date(selected.date.valueOf());
		            $('#lcfromdate'+cla_cval).datepicker('setEndDate', minDate);
		    });
    }else{ 
    	    // alert("else "+clickType);
    	     var objToc = document.getElementById('listAbtnDiv');
    	     var selectedNode = document.getElementsByName(cclickedValue);
    	     if(selectedNode.length > 0 ){
    	     selectedNode[0].remove();
    	       cla_cval--;
    	     }
       }
   
});

function getClickType(){
    var prevLen = prevClicked.length;
    var CurLen = curClicked.length;
    if(prevLen < CurLen){
        return 'select';
    }
    else{
        return 'unselect';
    }
}

function diffArray(a1, a2) {
    var a = [], diff = [];
    for (var i = 0; i < a1.length; i++) {
        a[a1[i]] = true;
    }
    for (var i = 0; i < a2.length; i++) {
        if (a[a2[i]]) {
            delete a[a2[i]];
        } else {
            a[a2[i]] = true;
        }
    }
    for (var k in a) {
        diff.push(k);
    }
    return diff;
}  

function getClickTypec(){
    var prevLen = cprevClicked.length;
    var CurLen = ccurClicked.length;
    if(prevLen < CurLen){
        return 'select';
    }
    else{
        return 'unselect';
    }
}

function diffArrayc(a1, a2) {
    var a = [], diff = [];
    for (var i = 0; i < a1.length; i++) {
        a[a1[i]] = true;
    }
    for (var i = 0; i < a2.length; i++) {
        if (a[a2[i]]) {
            delete a[a2[i]];
        } else {
            a[a2[i]] = true;
        }
    }
    for (var k in a) {
        diff.push(k);
    }
    return diff;
}
function getClickTypeb(){
    var prevLen = bprevClicked.length;
    var CurLen = bcurClicked.length;
    if(prevLen < CurLen){
        return 'select';
    }
    else{
        return 'unselect';
    }
}

function diffArrayb(a1, a2) {
    var a = [], diff = [];
    for (var i = 0; i < a1.length; i++) {
        a[a1[i]] = true;
    }
    for (var i = 0; i < a2.length; i++) {
        if (a[a2[i]]) {
            delete a[a2[i]];
        } else {
            a[a2[i]] = true;
        }
    }
    for (var k in a) {
        diff.push(k);
    }
    return diff;
}

function EditValidateSize(file) {
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
        	if(type=="pdf" || type=="png" || type=="docx" || type=="doc"|| type=="jpg"|| type=="jpeg" || type=="xlsx" || type=="xls" || type=="pptx" || type=="txt" || type=="tiff" || type=="msg" || type=="eml"){
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
						$('#wafromdate,#waexpirydate').val('');
						$('#wasubmitid').attr('disabled',false);
					}
				},
				error : function() {
				}
			});
        	}else{
    	    	 $(file).val('');
    	    	 alert("Please upload file with docx, doc, png, jpg, jpeg, xls, xlsx, pptx, txt, tiff, msg , eml or pdf file format");
    		    }
        }
	}else{
		
	}
		}else{
			 window.location.href="loginpage";
		}
	});
 }


function ValidateSize1(file) {
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
        	if(type=="pdf" || type=="png" || type=="docx" || type=="doc"|| type=="jpg"|| type=="jpeg" || type=="xlsx" || type=="xls" || type=="pptx" || type=="txt" || type=="tiff" || type=="msg" || type=="eml"){
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
						
					 }
				},
				error : function() {
				}
			});
        	}else{
    	    	 $(file).val('');
    	    	 alert("Please upload file with docx, doc, png, jpg, jpeg, xls, xlsx, pptx, txt, tiff, msg , eml or pdf file format");
    		    }
        }
	}else{
		
	}
		}else{
			 window.location.href="loginpage";
		}
	});
 }
  
var tablec = $('#ConsultantDocHistoryTable').DataTable({
	 "order": [[0, "desc"]],
bLengthChange: true,
paging: true
});
//getConsultantDocumentHistiryById candidateId fileType
function viewListADocHistory(candidateId,fileType,docId){
	getsesVal().done(function(data){
		if(data!=""){
	var InputVal=$("#linputValI9"+docId).html();
	//var encodedinput = encodeURIComponent(InputVal);
	$.ajax({
	type : "get",
   url  : "getConsultantDocumentHistiryById",
   contentType:"application/json",
   cache : false,
   async : false,
   data:{"docId":docId,"fileType":fileType,"InputVal":InputVal},
   success  : function(response){
   	 if (tablec) tablec.clear();
   	 $('#ConsultantDocHistoryTable').dataTable().fnClearTable();
   	  	if(response!=""){
       	  for(var i=0;i<response.length;i++){
       		  alert(response[i].inputval);
       			var fname=response[i].file_name;
	 		          	var encoded = encodeURIComponent(fname);
                  tablec.row.add([
               	''+response[i].document_id+'',
               	  '<span onclick="downloadDocument(\''+response[i].file_name+'\',\''+response[i].filetype+'\')" style="color:blue">'+response[i].file_name+'</a>',
               	//'<span onclick="downloadDocCust('+response[i].file_name+','+response[i].filetype+','+custName+')" style="color: blue">'+response[i].file_name+'</span>',
               	''+response[i].filetype+'',
               	''+response[i].inputval+'',
               	''+response[i].startdate+'',
               	''+response[i].expirydate+'',
               	''+response[i].submit_date+'',
						''+response[i].posted_by+''
                ]).draw();                  
              }
     	}else{
     	  // alert("No data found");
        } 
      	$('h5').text("ListA Document History");
   $('#ConsultantDocHistoryModal').modal('show');
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

var tablec1 = $('#ConsultantDocHistoryTable1').DataTable({
	 "order": [[0, "desc"]],
bLengthChange: true,
paging: true
});
//getConsultantDocumentHistiryById candidateId fileType
function viewDocHistory1(docId,fileType,InputVal){
	getsesVal().done(function(data){
		if(data!=""){
	$.ajax({
	type : "get",
  url  : "getConsultantDocumentHistiryById",
  contentType:"application/json",
  cache : false,
  async : false,
  data:{"docId":docId,"fileType":fileType,"InputVal":InputVal},
  success  : function(response){
  	 if (tablec1) tablec1.clear();
  	 $('#ConsultantDocHistoryTable1').dataTable().fnClearTable();
  	  	if(response!=""){
      	  for(var i=0;i<response.length;i++){
      		var filetype;
      		 if(response[i].filetype=='empagreement'){
      			filetype="emp_agreement";
      		 }else{
      			filetype=response[i].filetype;
      		 }
      		//  alert(response[i].startdate);
      			var fname=response[i].file_name;
	 		          	var encoded = encodeURIComponent(fname);
	 		          	tablec1.row.add([
              	''+response[i].document_id+'',
              	  '<span onclick="downloadDocument(\''+response[i].file_name+'\',\''+response[i].filetype+'\')" style="color:blue">'+response[i].file_name+'</a>',
              	//'<span onclick="downloadDocCust('+response[i].file_name+','+response[i].filetype+','+custName+')" style="color: blue">'+response[i].file_name+'</span>',
              	''+filetype+'',
              	''+response[i].submit_date+'',
				''+response[i].posted_by+''
               ]).draw();                  
             }
    	}else{
    	  // alert("No data found");
       } 
  	 var title="";
     	 if(fileType=='offerletter'){
     		title="Offer letter ";	
     	 }else if(fileType=='empagreement'){
     		title="Employment agreement ";
     	 }else if(fileType=='i9_form'){
     		title="I9 Form ";
     	 }else if(fileType=='w4_form'){
     		title="W4 Form ";
     	 }else if(fileType=='i9Formdocs'){
     		title="I9 Form Additional ";
     	 }else if(fileType=='i9Supportdocs'){
     		title="I9 Supporting ";
     	 }else if(fileType=='OtherAdditionaldocs'){
     		title="Other Additional ";
     	 }
     	$('h5').text(title+"Document History");
  $('#ConsultantDocHistoryModal1').modal('show');
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


var tablec2 = $('#ConsultantDocHistoryTable2').DataTable({
	 "order": [[0, "desc"]],
bLengthChange: true,
paging: true
});
//getConsultantDocumentHistiryById candidateId fileType
function viewListBCDocHistory(candidateId,fileType,id){
	getsesVal().done(function(data){
		if(data!=""){
	var InputVal=$("#linputValI9"+id).html();
	//var encodedinput = encodeURIComponent(InputVal);
	//alert(encodedinput);
	$.ajax({
	type : "get",
 url  : "getConsultantDocumentHistiryById",
 contentType:"application/json",
 cache : false,
 async : false,
 data:{"candidateId":candidateId,"fileType":fileType,"InputVal":InputVal},
 success  : function(response){
 	 if (tablec2) tablec2.clear();
 	 $('#ConsultantDocHistoryTable2').dataTable().fnClearTable();
 	  	if(response!=""){
     	  for(var i=0;i<response.length;i++){
     			var fname=response[i].file_name;
	 		          	var encoded = encodeURIComponent(fname);
	 		          	tablec2.row.add([
             	''+response[i].document_id+'',
             	  '<span onclick="downloadDocument(\''+response[i].file_name+'\',\''+response[i].filetype+'\')" style="color:blue">'+response[i].file_name+'</a>',
             	//'<span onclick="downloadDocCust('+response[i].file_name+','+response[i].filetype+','+custName+')" style="color: blue">'+response[i].file_name+'</span>',
             	''+response[i].filetype+'',
             	''+response[i].submit_date+'',
				''+response[i].posted_by+''
              ]).draw();                  
            }
   	}else{
   	  // alert("No data found");
      } 
 	   var title="";
         if(fileType=='ListB'){
    		title="ListB ";
    	 }else if(fileType=='ListC'){
    		title="ListC ";
    	 }
    	$('h5').text(title+"Document History");
 $('#ConsultantDocHistoryModal2').modal('show');
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
/* $("#listB").change(function () {
	$("#listBfileId").show();
	$('#listBfile').prop('required',true);
 }); 
$("#listC").change(function () {
	$("#listCfileId").show();
	$('#listCfile').prop('required',true);
});   
 */
</script>

</body>
</html>
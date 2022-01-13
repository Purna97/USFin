<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/css/datepicker3.min.css" />
</head>
<body>
<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">Update Documents</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-md-11 col-sm-12">
					 			<input type="hidden" id="candidate_id" name="candidate_id" value="${candidate_id}">
								<input type="hidden" name="empType" value="${empType}"> 
								<%-- <font color=red>Employee Number :</font>&nbsp;&nbsp;<b>${empobj.emp_number}</b>&nbsp;&nbsp; --%>
					<%-- <center><font color=red>Employee Name :</font>&nbsp;&nbsp;<b>${empobj.fullname}</b>&nbsp;&nbsp;<font color=red>Employee Username :</font>&nbsp;&nbsp;<b>${empobj.username}</b></center> --%>
					     <%-- <center><font color=red>Employee Name :</font><b>&nbsp;&nbsp;${basicObj.full_name}</b>&nbsp;&nbsp;<font color=red>Employee Type :</font><b>&nbsp;&nbsp;${basicObj.emp_type}</b></center> --%>
						 <br>
						<fieldset>
						<c:choose>
						<c:when test="${empType=='C2C'}">
						 </c:when>
						 <c:otherwise>
						 <h3 align="left">Documents of 1099</h3>
						<center><div class="form-group row">
						<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Work Authorization Copy</label>
						<c:choose>
	                    <c:when test="${empty viewbean.wafilename}">
	                    <div class="col-sm-4">
						<a>NA</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<button class="btn btn-default btn-sm"  id="" onclick="addDoc('Work Authorization Copy','Work_Authorization_Copy');">Add</button>
					     </div>
					    </c:when>
					    <c:otherwise>
					     <div class="col-sm-4">
					    <span id="ofilename" onclick="downloadDocument('${viewbean.wafilename}','Work_Authorization_Copy')" style="color: blue">
					    ${viewbean.wafilename}</span>
					    <br>
						<c:if test="${not empty viewbean.wastartdate}">
								<label>From Date : <span style="color: none">${viewbean.wastartdate}</span></label>
						</c:if>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:if test="${not empty viewbean.waenddate}">
								<label> End Date : <span style="color: none">${viewbean.waenddate}</span></label>
						</c:if>
					    </div>
						<c:if test="${not empty viewbean.wafilename}">
						<div class="col-sm-2">
						  <button class="btn btn-default btn-sm"  id="" onclick="editWADocument('${viewbean.wafilename}','${viewbean.wafileid}','${viewbean.wastartdate}','${viewbean.waenddate}','Work_Authorization_Copy');">Edit</button>
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
							onclick="viewDocHistory('${viewbean.wafileid}','Work_Authorization_Copy','');"
								title="View Document History"><i class="fa fa-history"></i></a>
						<%-- <input type='button' class="btn btn-default btn-xs" id="delDocC2C"	onclick="deleteDocFn1099('${viewbean.wafileid}','${empno}','${userid}','${emptype}')" value="Delete" /> --%> 
						</div>
						</c:if>
						</c:otherwise>
						</c:choose>
						</div></center>
						
						<!-- <br><br><br><br> -->
						<center> <div class="form-group row">
						  <label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>W-9 copy</label>
						<c:choose>
	                    <c:when test="${empty viewbean.w9filename}">
	                     <div class="col-sm-4">
						<a>NA</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<button class="btn btn-default btn-sm"  id="" onclick="addDoc('W-9 copy','W_9_Copy');">Add</button>
					    </div>
					    </c:when>
					    <c:otherwise>
					     <div class="col-sm-4">
						 <span id="ofilename" onclick="downloadDocument('${viewbean.w9filename}','W_9_Copy')" style="color: blue">
					    ${viewbean.w9filename}</span>
					    </div>
						<c:if test="${not empty viewbean.w9filename}">
						 <div class="col-sm-2">
						<button class="btn btn-default btn-sm"  id="" onclick="editDocument('${viewbean.w9filename}','${viewbean.w9fileid}','W_9_Copy');">Edit</button>
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
							onclick="viewDocHistory1('${viewbean.w9fileid}','W_9_Copy','');"
								title="View Document History"><i class="fa fa-history"></i></a>
						<%-- <input type='button' class="btn btn-default btn-xs" id="delDocC2C"	onclick="deleteDocFn1099('${viewbean.w9fileid}','${empno}','${userid}','${emptype}')" value="Delete" /> --%> 
						</div>
						</c:if>
						</c:otherwise>
						</c:choose>
						</div></center>
						<!-- 	<br><br>	<br><br> -->
						  <center><div class="form-group row">
						  <label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>SSN Copy</label>
							<c:choose>
	                    <c:when test="${empty viewbean.ssnfilename}">
	                     <div class="col-sm-4">
						<a>NA</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<button class="btn btn-default btn-sm"  id="" onclick="addDoc('SSN Copy','SSN_Copy');">Add</button>
					  </div>
					    </c:when>
					    <c:otherwise>
					     <div class="col-sm-4">
						<span id="ofilename" onclick="downloadDocument('${viewbean.ssnfilename}','SSN_Copy')" style="color: blue">
					    ${viewbean.ssnfilename}</span>
					    </div>
								<c:if test="${not empty viewbean.ssnfilename}">
								 <div class="col-sm-2">
								<button class="btn btn-default btn-sm"  id="" onclick="editDocument('${viewbean.ssnfilename}','${viewbean.ssnfileid}','SSN_Copy');">Edit</button>
					          &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
							onclick="viewDocHistory1('${viewbean.ssnfileid}','SSN_Copy','');"
								title="View Document History"><i class="fa fa-history"></i></a>
					          <%-- 	<input type='button' class="btn btn-default btn-xs" id="delDocC2C"	onclick="deleteDocFn1099('${viewbean.ssnfileid}','${empno}','${userid}','${emptype}')" value="Delete" /> --%>
					          	</div>
					          	</c:if>
					    </c:otherwise>
						</c:choose> 
						</div></center>
						<!-- <br><br><br>	<br><br> -->
						<c:if test="${not empty viewbean.mgr_apr_mail}">
								 <center><div class="form-group row">		
								<label for="inputPassword" class="col-lg-3 control-label"><Span style="color:red;">*</Span>Manager Approved Mail</label>
									<div class="col-sm-4">
								   <span id="mgrfilename" onclick="downloadDocument('${viewbean.mgr_apr_mail}','Manager_Approved_Email_Doc')" style="color:blue">
					    			${viewbean.mgr_apr_mail}</span>
									</div>
									 <div class="col-sm-2">
									 <button class="btn btn-default btn-sm"  id="" onclick="editMsgDocument('${viewbean.mgr_apr_mail}','${viewbean.mgrfileid}','Manager_Approved_Email_Doc');">Edit</button>
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
							onclick="viewDocHistory('${viewbean.mgrfileid}','Manager_Approved_Email_Doc');"
								title="View Document History"><i class="fa fa-history"></i></a>
								</div>
								</div></center>
						</c:if>
								
					<!-- 	<br><br><br></div> -->
						 </c:otherwise>
						</c:choose>
						     <form  class='form form-horizontal validate-form' action="saveConsultantAddDocs" method="post" style='margin-bottom: 0;' enctype="multipart/form-data">
       							<input type="hidden" name="candidate_id" value="${candidate_id}">
       							<input type="hidden" name="empType" value="${empType}"> 
							<c:choose>
							<c:when test="${empType=='C2C'}">
						             <h4><b>Other Additional Documents</b></h4>
						     	           <div class="text-center ml-3">
						     	              <label for="inputPassword" class="col-sm-4 control-label"></label>
						     	              <div class="input-group-btn">
                                              	<c:choose>
						     	     	    <c:when test="${fn:length(viewbean.adddocsC2C) ne 15}">
						     	     	        <button class="btn btn-success" type="button" onclick="addfieldsC2C(${fn:length(viewbean.adddocsC2C)});"> <i class="fa fa-plus" aria-hidden="true"></i></button>
						     	     	    </c:when>
						     	     	    <c:otherwise>
						     	     	      <button class="btn btn-success"title="Can't upload more than 15 documents" disabled> <i class="fa fa-plus" aria-hidden="true"></i></button>
						     	     	    </c:otherwise>
						     	     	     </c:choose>
                                            </div>
                                            </div><br>
                                       <div id="addfieldsC2C"></div>
                                     <center><input type="submit" id="submitid" name="submitid" value="Submit" class="btn btn-default" style="padding:7px;background-color:green;color:white;line-height:0.728571;"/>
                                     <button  type="button" onclick="goBack()" class="btn btn-default btn-sm" style="padding:7px;background-color:grey;color:white;line-height:0.728571;">Back</button></center>
                               </c:when>
                               </c:choose>
                            <c:choose>
							<c:when test="${empType=='1099'}">
						    <h4><b>Other Additional Documents</b></h4>
						     	 <div class="text-center ml-3">
						     	     <label for="inputPassword" class="col-sm-4 control-label"></label>
						     	     <div class="input-group-btn">
						     	     	<c:choose>
						     	     	<c:when test="${fn:length(viewbean.adddocs1099) ne 15}">
						     	     	<button class="btn btn-success" type="button" onclick="add_fields99(${fn:length(viewbean.adddocs1099)});"> <i class="fa fa-plus" aria-hidden="true"></i></button>
						     	     	</c:when>
						     	     	<c:otherwise>
						     	     	<button class="btn btn-success"title="Can't upload more than 15 documents" disabled> <i class="fa fa-plus" aria-hidden="true"></i></button>
						     	     	</c:otherwise>
						     	     	</c:choose>
                                 	</div>
                                 </div><br>
                             <div id="add_fields99"></div>
						         <center><input type="submit" id="submitid1" name="submit" value="Submit"  class="btn btn-default" style="padding:7px;background-color:green;color:white;line-height:0.728571;" />
						                 <button  type="button" onclick="goBack()" class="btn btn-default btn-sm" style="padding:7px;background-color:grey;color:white;line-height:0.728571;">Back</button></center>  
                              </c:when>
							</c:choose>
						    	</form>
						    	<br>
						</div>
						</div>
						<br>
     	
<!-- <div class='row-fluid' id='content-wrapper'> -->
<c:choose>
<c:when test="${empType=='C2C'}">
<div class="col-md-12">
<div class="card" id="dataTBL" >
	<div class="card-body">
		<div style="max-width:1000px; overflow-x: auto; white-space: nowrap;" >
		<center><span><strong style="font-size:18px;color:00cc00;">Additional Documents of C2C</strong></span></center><br>
		<table id="customerTable" class="table table-hover table-bordered"
			style="text-align: center;">
			<thead>
				<tr>
				    <th style="text-align: center">File Name</th>
					<th style="text-align: center">File Link</th>
					<!-- <th style="text-align: center">Delete</th> -->
					<th style="text-align: center">Edit</th>
					<th style="text-align: center">History</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="entryC2C" items="${viewbean.adddocsC2C}">
			 <tr>
	        <td>${entryC2C.inputval} </td>
	        <td>
	          <span id="ofilename" onclick="downloadDocument('${entryC2C.fileName}','additionaldocs_C2C')" style="color: blue">
					    ${entryC2C.fileName}</span>
	     <%--    <button type="button" onclick="downloadDocument(${empobj.emp_number},'${entryC2C.fileName}','additionaldocs_C2C')" style="color:blue">
		       <!--   <p style="white-space: pre-wrap; word-wrap: break-word; width: 216px;overflow-y: scroll;height: 35px;"> --> 
		        ${entryC2C.fileName}</button> --%>
		    </td> 
<%-- 	        <td><button style="letter-spacing:1px;background-color:red;color:white;" id="delDocC2C"	onclick="deleteDocument('${entryC2C.fileId}','${entryC2C.fileName}')" ><i class="fa fa-trash"  aria-hidden="true"></i></button></td> --%>
			<td><button style="letter-spacing:1px;background-color:#15aabf;color:white;"onclick="editDocument('${entryC2C.fileName}','${entryC2C.fileId}','additionaldocs_C2C');"><i class="fa fa-edit"  aria-hidden="true"></i></button></td>
			<td><a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
				onclick="viewDocHistory1('${entryC2C.fileId}','${entryC2C.fileType}','${entryC2C.inputval}');"
				title="View Document History"><i class="fa fa-history"></i></a></td>	
 			</tr>
			</c:forEach> 
			</tbody>
		</table>
		</div>
	</div>
</div>
</div>
</c:when>
</c:choose>
<c:choose>
<c:when test="${empType=='1099'}">
<div class="col-md-12">
	<div class="card" id="dataTBL">
		<div class="card-body">
		<div style="max-width:1000px; overflow-x: auto; white-space: nowrap;" >
		<center><span><strong style="font-size:18px;color:00cc00;">Other Additional Documents of 1099</strong></span></center><br>
		<table id="customerTable" class="table table-hover table-bordered"
			style="text-align: center;">
			<thead>
				<tr>
				    <th style="text-align: center">File Name</th>
					<th style="text-align: center">File Link</th>
					<!-- <th style="text-align: center">Delete</th> -->
					<th style="text-align: center">Edit</th>
					<th style="text-align: center">History</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="entry1099"	items="${viewbean.adddocs1099}">
			 <tr>
			
	         <td>${entry1099.inputval} </td>
	        <td>
	         <span id="ofilename" onclick="downloadDocument('${entry1099.fileName}','additionaldocs_1099')" style="color: blue">
					    ${entry1099.fileName}</span>
			</td>
	       <%--  <td><button style="letter-spacing:1px;background-color:red;color:white;" id="delDocC2C"	onclick="deleteDocument('${entry1099.fileId}','${entry1099.fileName}')"><i class="fa fa-trash"  aria-hidden="true"></i></button></td> --%>
			<td><button style="letter-spacing:1px;background-color:#15aabf;color:white;"onclick="editDocument('${entry1099.fileName}','${entry1099.fileId}','additionaldocs_1099');"><i class="fa fa-edit"  aria-hidden="true"></i></button></td>
 			<td><a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
				onclick="viewDocHistory1('${entry1099.fileId}','${entry1099.fileType}','${entry1099.inputval}');"
				title="View Document History"><i class="fa fa-history"></i></a></td>	
 						</tr>
					</c:forEach> 
					</tbody>
					</table>
			</div>
		</div>
	</div>
</div>
</c:when>
</c:choose>
						
					<center><div class="modal fade" id="addDocumentModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true" style="top:150px;">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding:.5rem;">
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
					      <form  class='form form-horizontal validate-form' action="saveConsultantAddDocs" method="post" style='margin-bottom: 0;' enctype="multipart/form-data">
                               <input type="hidden" id="afileType" name="afileType" > 
                               <input type="hidden" name="candidate_id" value="${candidate_id}">
                               <input type="hidden" name="empType" value="${empType}">
							 <div class="modal-body">
								 <div class="form-group row">
									  <label class="col-lg-5 control-label" for="Upload_File">Upload File :</label>
										<div class="col-lg-6">
										<input type="file" id="addFile" name="addFile"  class="form-control text-left" onchange="ValidateSize(this)"
											required/>
									</div>
								</div>
							</div>
					 <div class="form-group row" id="dateId" style="display:none;">
					    <label class="col-lg-3 control-label"></label>
							<div class="col-sm-4">
										<input type="text" id="afromdate" class="form-control text-left"     autocomplete="off"
												title="Enter date in MM/DD/YYYY format only" name="afromdate" placeholder="Start Date" class="form-control" required> 
							</div>
						    <div class="col-sm-4">
										<input type="text" id="aexpirydate" class="form-control text-left"     autocomplete="off"
												title="Enter date in MM/DD/YYYY format only" name="aexpirydate" placeholder="End Date" class="form-control" required>
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
				</div></center>

    				<center><div class="modal fade" id="EditDocumentModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true" style="top:150px;">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding:.5rem;">
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
					      <form  class='form form-horizontal validate-form' action="EditDocument" method="post" style='margin-bottom: 0;' enctype="multipart/form-data">
                               <input type="hidden" id="efileId" name="fileId" > 
                               <input type="hidden" id="efileType" name="fileType" > 
                               <input type="hidden" name="candidate_id" value="${candidate_id}">
                               <input type="hidden" name="empType" value="${empType}">
                               
							 <div class="modal-body">
					    	     <div class="form-group row">
									  <label class="col-lg-3 control-label" ><Span style="color:red;">*</Span>File Name :</label>
										<div class="col-lg-6">
										<span id="efileName"></span>
									     </div>
								  </div>
								 
									 <div class="form-group row">
									  <label class="col-lg-3 control-label" ><Span style="color:red;">*</Span>Upload File :</label>
										<div class="col-lg-6">
										<input type="file" id="editFile" name="editFile"  class="form-control text-left" onchange="ValidateSize(this)"
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
				</div></center>
				
				<center>
		<div class="modal fade" id="EditMailProofDocumentModal" tabindex="-1"
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
					<form  class='form form-horizontal validate-form' action="EditDocument" method="post" style='margin-bottom: 0;' enctype="multipart/form-data">
                               <input type="hidden" id="msgefileId" name="fileId" > 
                               <input type="hidden" id="msgefileType" name="fileType" > 
                               <input type="hidden" name="candidate_id" value="${candidate_id}">
                               <input type="hidden" name="empType" value="${empType}">
                               
							 <div class="modal-body">
					    	     <div class="form-group row">
									  <label class="col-lg-3 control-label" ><Span style="color:red;">*</Span>File Name :</label>
										<div class="col-lg-6">
										<span id="msgefileName"></span>
									     </div>
								  </div>
								 
									 <div class="form-group row">
									  <label class="col-lg-3 control-label" ><Span style="color:red;">*</Span>Upload File :</label>
										<div class="col-lg-6">
										<input type="file" id="msgeditFile" name="editFile"  class="form-control text-left" accept=".msg,.eml" onchange="ValidateMsgFile(this)"
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
						action="deleteConsultantDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="dfileId" name="fileId">
						 <input	type="hidden" name="candidate_id" value="${candidate_id}">
						 <input	type="hidden" name="empType" value="${empType}">
						 
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
						action="editConsultantWADocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="waefileId" name="waefileId">
					    <input type="hidden" id="waefileType" name="waefileType"> 
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

									<div class="form-group">										
									<div class="col-lg-4 col-lg-offset-5">													
										<!-- <input type="submit" id="submitid" class="btn btn-default" disabled/> -->
							    <%--   <%if(emp_type.equalsIgnoreCase("W2AdministrationEmployees")&&dept_id==5&&emprole==2){ %>
												<a href="USOBT_BasicDetails?action=empsearch&username=${s_username}&fullname=${s_fullname}&emp_type=${s_emptype}&ssnno=${s_ssnno}&pendingdocs=${s_pendingdocs}&sEmp_type=${s_type}" class="btn btn-default" style="padding:7px;align:center; font-weight:bold; background-color:#a8a4a4">Back</a>	
												 <%} else if(emp_type.equalsIgnoreCase("Internal")&&dept_id==12&&emprole==4){ %>
												<a href="USOBT_BasicDetails?action=empsearch&username=${s_username}&fullname=${s_fullname}&emp_type=${s_emptype}&ssnno=${s_ssnno}&pendingdocs=${s_pendingdocs}&sEmp_type=${s_type}" class="btn btn-default" style="padding:7px;align:center; font-weight:bold; background-color:#a8a4a4">Back</a>													
									<%} %> --%>	
									</div>										
								</div>
							<!-- </form>		 -->
							</fieldset>
					<!-- </div> -->
				</div>
			</div>
		   </div>
		  </div>
		</div>
		
				<form action="searchlist" method="post" id="bformid" style="display: none;">
				<input type="text"  name="semp_type"  value="${semp_type}">
				<input type="text" name="susername"  value="${susername}">
  	        	<input type="text"  name="sfullname"  value="${sfullname}">
			    <input type="text"  name="spendingdocs"  value="${spendingdocs}">
			    <input type="text" name="s_subtype"  value="${s_subtype}">
			    <input type="hidden" name="empstatus" value="${sempstatus}">
				</form>
	 </div>
</div>
 <!-- Javascripts-->
<script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
<script src="resources/preDefined/goback.js"></script>
<script>
/* function deleteDocFnC2C(fileid,empno,candidate_id,emptype){
	 $.ajax({
	    	type : "POST",
	        asyn : false,
	        contentType: "application/json",
	        url  : "DeleteFile?fileId="+fileid+"&candidate_id="+candidate_id+"&empno="+empno+"&emp_type="+emptype,
	        success  : function(response){
	        	 alert(response); 
	        	 window.location.href="USOBT_C2C_View_Controller?action=ViewUploadDocs&empno="+empno+"&candidate_id="+candidate_id+"&emp_type="+emptype+"";
	        }
	});
} */
function deleteDocument(id,fname){
	getsesVal().done(function(data){
		  if(data!=""){
    $('#dfileId').val('');
    $('#dfileName').text(''); 
    $('#dfileId').val(id);
    $('#dfileName').text(fname);
 $('#DeleteDocumentModal').modal('show');
		  }else{
				 window.location.href="loginpage";
			}
		});
};

function goBack() {
	getsesVal().done(function(data){
		  if(data!=""){
	document.getElementById("bformid").submit();
		  }else{
				 window.location.href="loginpage";
			}
		});
	}
</script>
<script>
    $('#submitid').hide();
    $('#submitid1').hide();
	function editDocument(fname,id,ftype){
		getsesVal().done(function(data){
			  if(data!=""){
		 $('#efileId,#efileType,#editFile').val('');
		 $('#efileName').text('');
		 $('#efileId').val(id);
		 $('#efileType').val(ftype);
		 $('#efileName').text(fname);
		 var title="";
       	 if(ftype=='Work_Authorization_Copy'){
       		title="Work Authorization Copy ";	
       	 }else if(ftype=='W_9_Copy'){
       		title="W9 Copy ";
       	 }else if(ftype=='SSN_Copy'){
       		title="SSN Copy ";
       	 }else if(ftype=='additionaldocs_1099'){
       		title="Additionaldocs 1099 ";
       	 }else if(ftype=='additionaldocs_C2C'){
       		title="Additionaldocs C2C ";
       	 }	  
       	$('h5').text(title+"Document Details");
	    $('#EditDocumentModal').modal('show');
			  }else{
					 window.location.href="loginpage";
				}
			});
	}; 
	
	function editMsgDocument(fname,id,ftype){
		getsesVal().done(function(data){
			  if(data!=""){
		 $('#msgefileId,#msgefileType,#msgeditFile').val('');
		 $('#msgefileName').text('');
		 $('#msgefileId').val(id);
		 $('#msgefileType').val(ftype);
		 $('#msgefileName').text(fname);
		 var title="";
      	 if(ftype=='Work_Authorization_Copy'){
      		title="Work Authorization Copy ";	
      	 }else if(ftype=='W_9_Copy'){
      		title="W9 Copy ";
      	 }else if(ftype=='SSN_Copy'){
      		title="SSN Copy ";
      	 }else if(ftype=='Manager_Approved_Email_Doc'){
      		title="Manager Approved Email ";
      	 }else if(ftype=='additionaldocs_1099'){
      		title="Additionaldocs 1099 ";
      	 }else if(ftype=='additionaldocs_C2C'){
      		title="Additionaldocs C2C ";
      	 }	  
      	$('h5').text(title+"Document Details");
	    $('#EditMailProofDocumentModal').modal('show');
			  }else{
					 window.location.href="loginpage";
				}
			});
	}; 
   function addDoc(lname,ftype){
	   getsesVal().done(function(data){
		   if(data!=""){
	 $('#afileType,#addFile').val('');
	 $('#afileType').val(ftype);
	 if(ftype=='Work_Authorization_Copy'){
		 $('#dateId').show();
	 }else{
		 $('#dateId').hide();
		 $('#afromdate,#aexpirydate').removeAttr('required');
	 }
	 $('label[for="Upload_File"]').text(lname);
	 $('label[for="Upload_File"]').append("<span style='color:red;'>*</span>");
	 var title="";
  	 if(ftype=='Work_Authorization_Copy'){
  		title="Work Authorization Copy ";
  	 }else if(ftype=='W_9_Copy'){
  		title="W9 Copy ";
  	 }else if(ftype=='SSN_Copy'){
  		title="SSN Copy ";
  	 }else if(ftype=='Manager_Approved_Email_Doc'){
  		title="Manager Approved Email ";
  	 }else if(ftype=='additionaldocs_1099'){
  		title="Additionaldocs 1099 ";
  	 }else if(ftype=='additionaldocs_C2C'){
  		title="Additionaldocs C2C ";
  	 }	  
  	$('h5').text(title+"Document Details");
	 $('#addDocumentModal').modal('show');
		   }else{
				 window.location.href="loginpage";
			}
		});
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
/* function downloadDocument(fname,ftype){	
	var userid=$('#userId').val();
	var encoded = encodeURIComponent(fname);	
	window.location.href="downloadocs?filename="+encoded+"&filetype="+ftype+"&userid="+userid;
} */
</script>
<script type="text/javascript">
//var cbval = 0;
var cbval=$("input[name='othr_c2c_file[]']").length
var max_limit=15;
var ncbval;
function addfieldsC2C(val) {
	ncbval=max_limit-val;
	 $('#submitid').show();
	 cbval++;
    var objTo = document.getElementById('addfieldsC2C');
    var divtest = document.createElement("div");
	divtest.setAttribute("class", "form-group row removeclass"+cbval);
	var rdiv = 'removeclass'+cbval;
    divtest.innerHTML = '<div class="col-sm-4 nopadding"><div class="form-group"> <input type="text" class="form-control" name="other_c2c_doc[]" placeholder="Enter Document name" required><input type="hidden" value="'+cbval+'" name="c2cbtncount"></div></div><div class="col-sm-4 nopadding"><div class="form-group"> <input type="file" class="form-control" name="othr_c2c_file[]"  accept=".jpeg,.xls,.xlsx,.jpg,.png,.pdf,.doc,.docx" placeholder="othr_1099_doc" onchange="ValidateSize(this)" required></div></div><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="remove_add_fieldsC2C('+cbval+');"><i class="fa fa-minus"></i></button></div></div></div></div><div class="clear"></div>';
    if(cbval>=ncbval){
	      objTo.appendChild(divtest);
	      alert("Can't upload more than 15 documents!!");
	      $('#btnid').attr('disabled', 'disabled');
    }else{
	     objTo.appendChild(divtest);
     }
}
   function remove_add_fieldsC2C(rid) {
	   $('.removeclass'+rid).remove();
	   cbval--;
	   if ($("input[name='othr_c2c_file[]']").length<=ncbval) {
           $('#addEmpBtnId').removeAttr('disabled');
       }
	  if(cbval==0){
    	   $('#submitid').hide();
       }
 }
</script>
<script type="text/javascript">
//var bval = 0;
var bval=$("input[name='othr_1099_file[]']").length
var max_limit1= 15;
var ncbval2;
function add_fields99(val1) {
	ncbval2=max_limit1-val1;
	 $('#submitid1').show();
	bval++;
    var objTo = document.getElementById('add_fields99');
    var divtest = document.createElement("div");
	divtest.setAttribute("class", "form-group row removeclass"+bval);
	var rdiv = 'removeclass'+bval;
    divtest.innerHTML = '<div class="col-sm-4 nopadding"><div class="form-group"> <input type="text" class="form-control" name="other_1099_doc[]" placeholder="Enter Document name" required><input type="hidden" value="'+bval+'" name="1099btncount"></div></div><div class="col-sm-4 nopadding"><div class="form-group"> <input type="file" class="form-control" name="othr_1099_file[]" placeholder="othr_1099_doc" accept=".jpeg,.xls,.xlsx,.jpg,.png,.pdf,.doc,.docx" onchange="ValidateSize(this)" required></div></div><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="remove_add_fields99('+bval+');"> <i class="fa fa-minus" aria-hidden="true"></i> </button></div></div></div></div><div class="clear"></div>';
    if (bval>=ncbval2) {
	      objTo.appendChild(divtest);
	      alert("Can't upload more than 15 documents!!");
	      $('#btnid').attr('disabled', 'disabled');
   }else{
  	     objTo.appendChild(divtest);
   }
}

function remove_add_fields99(rid) {
	   $('.removeclass'+rid).remove();
	 if($("input[name='othr_1099_file[]']").length<=ncbval2) {
           $('#btnid').removeAttr('disabled');
      }
	 bval--;
	 if(bval==0){
  	   $('#submitid1').hide();
     }
}

function editWADocument(fname,id,stdate,expdate,ftype){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#wasubmitid').attr('disabled',true);
    $('#waefileId,#waeditFile,#waefileType').val('');
    $('#waefileName').text('');
    $('#waefileId').val(id);
    $('#waefileName').text(fname);
    $('#waefileType').val(ftype);
    $('#wafromdate1').val(stdate);
    $('#waexpirydate1').val(expdate);
    $('#wafromdate').val(stdate);
    $('#waexpirydate').val(expdate);
    var title="";
  	 if(ftype=='Work_Authorization_Copy'){
  		title="Work Authorization Copy ";	
  	 }else if(ftype=='W_9_Copy'){
  		title="W9 Copy ";
  	 }else if(ftype=='SSN_Copy'){
  		title="SSN Copy ";
  	 }	 
  	$('h5').text(title+"Document History");
  	
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



var tablec = $('#ConsultantDocHistoryTable').DataTable({
	 "order": [[0, "desc"]],
bLengthChange: true,
paging: true
});
//getConsultantDocumentHistiryById candidateId fileType
function viewDocHistory(docId,fileType,InputVal){	
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
    	 if (tablec) tablec.clear();
    	 $('#ConsultantDocHistoryTable').dataTable().fnClearTable();
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
       	 if(fileType=='Work_Authorization_Copy'){
       		title="Work Authorization Copy ";	
       	 }else if(fileType=='W_9_Copy'){
       		title="W9 Copy ";
       	 }else if(fileType=='SSN_Copy'){
       		title="SSN Copy ";
       	 }	 
       	$('h5').text(title+"Document History");
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
       		//  alert(response[i].startdate);
       			var fname=response[i].file_name;
	 		          	var encoded = encodeURIComponent(fname);
	 		          	tablec1.row.add([
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
      	 if(fileType=='Work_Authorization_Copy'){
      		title="Work Authorization Copy ";	
      	 }else if(fileType=='W_9_Copy'){
      		title="W9 Copy ";
      	 }else if(fileType=='SSN_Copy'){
      		title="SSN Copy ";
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
						$('#wafromdate,#waexpirydate').val('');
						$('#wasubmitid').attr('disabled',false);
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
		
	}
		  }else{
				 window.location.href="loginpage";
			}
		});
 }
</script>
</body>
</html>
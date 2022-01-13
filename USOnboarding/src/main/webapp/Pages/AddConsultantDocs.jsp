<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/css/datepicker3.min.css" />
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
<body>
<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">Add Documents</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-md-8 col-sm-12">
										<fieldset>
										<%-- <font color=red>Employee Number :</font>&nbsp;&nbsp;<b>${empobj.emp_number}</b>&nbsp;&nbsp; --%>
										<%-- <center><font color=red>Employee Name :</font>&nbsp;&nbsp;<b>${empobj.fullname}</b>&nbsp;&nbsp;<font color=red>Employee Username :</font>&nbsp;&nbsp;<b>${empobj.username}</b></center> --%>
										<!-- onsubmit="return checkForm(this);" -->
										<%-- <center><font color=red>Employee Name :</font><b>&nbsp;&nbsp;${basicObj.full_name}</b>&nbsp;&nbsp;<font color=red>Employee Type :</font><b>&nbsp;&nbsp;${basicObj.emp_type}</b></center> --%>
								      <br>
									<c:choose>
						   			<c:when test="${empType=='C2C'}">
						   			<form action="saveConsultantDocs"  method="post" id="addfilesC2CForm" class="form-horizontal" enctype="multipart/form-data" onsubmit="return checkForm1(this);">
										<input type="hidden" name="candidate_id"  id="candidate_id" value="${candidate_id}">
								    	<input type="hidden" name="empType" id="empType" value="${empType}">
						             <h4><b>Other Additional Documents(C2C)</b></h4>
						     	      <div class="text-center ml-3">
						     	              <label for="inputPassword" class="col-sm-4 control-label"></label>
                                              <div class="input-group-btn">
                                                <button class="btn btn-success" type="button" id="addEmpBtnId" onclick="addfieldsC2C();"><i class="fa fa-plus"></i></button>
                                     		</div><br>
                                      </div><br>
                                      <div id="addfieldsC2C">
                                      </div>
                                     <!--  <div id="addfieldsC2C" class="form-group" style="display:none;">
                                      <div class="form-group row">
                                        <div class="col-sm-4">
                                         <input type="text" class="form-control" id="other_c2c_doc" name="other_c2c_doc[]" placeholder="Enter Document name" required>
                                         </div>
                                      <div class="col-sm-4">
                                      <input type="file" class="form-control" id="othr_c2c_file" name="othr_c2c_file[]"  accept=".jpeg,.xls,.xlsx,.jpg,.png,.pdf,.doc,.docx" placeholder="othr_1099_doc" onchange="ValidateSize(this)" required>
                                      </div>
                                      <div class="input-group-btn">
										<button type="button" class="btn btn-danger removeButton">
												<i class="fa fa-minus"></i>
										</button>
									   </div>
                                       </div>
                                       </div> -->
                                       
                                       <div class="text-center ml-3">										
												<input type="submit" id="btnSubmit" value="Submit" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" class="btn btn-success"/>
												<button type="reset" class="btn btn-default" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;">Reset</button> 
												<button type="button" onclick="goBack()" class="btn btn-default btn-sm" style="padding:7px;background-color:grey;color:white;line-height:0.728571;">Back</button>	
									   </div>
									   </form>
                                     </c:when>
                                     </c:choose>
                                     
                                     <c:choose>
						   			<c:when test="${empType=='1099'}">
						   			<form action="saveConsultantDocs1099"  method="post" id="addfiles1099Form" class="form-horizontal" enctype="multipart/form-data" onsubmit="return checkForm(this);">
										<input type="hidden" name="candidate_id"  id="candidate_id" value="${candidate_id}">
								    	<input type="hidden" name="empType" id="empType" value="${empType}">
                                   <%--  <div class="form-group row">
									  <label for="inputPassword" id="Work_Authorization_Copy" class="col-sm-4 control-label">
									  <Span id="vlab" style="color:red;">*</Span>Work Authorization Copy</label>
										  <input type="hidden" value="Work_Authorization_Copy" name="Work_Authorization_Copy" />
										<div class="col-sm-3">
										<input type="file" id="WA_copy" name="WA_copy" onchange="waValidateSize(this)">
										<br>
									     <span id="WAfile" onclick="downloadDocument('${attachmentBean.workauthcopy}','Work_Authorization_Copy')" style="color: blue">${attachmentBean.workauthcopy}</span>
										<span id="i9file">${attachmentBean.workauthcopy}</span> 
									   </div>
									  <div class="col-sm-2" >
										<input type="text" id="wafromdate" class="form-control text-left"     autocomplete="off"
												title="Enter date in MM/DD/YYYY format only" name="wafromdate" placeholder="Start Date" class="form-control"> 
									</div>
									<div class="col-sm-2">
										<input type="text" id="waexpirydate" class="form-control text-left"     autocomplete="off"
												title="Enter date in MM/DD/YYYY format only" name="waexpirydate" placeholder="End Date" class="form-control">
									</div>
									</div> --%>
									
									<div class="form-group row">
													<label class="col-sm-4 control-label">
													<Span id="vlab" style="color:red;">*</Span>Work Authorization Copy</label>
													<c:choose>
														<c:when test="${empty attachmentBean.workauthcopy}">
															<div class="col-sm-3">
															 <input type="hidden" value="Work_Authorization_Copy" name="Work_Authorization_Copy" />
										<input type="file" id="WA_copy" name="WA_copy" onchange="waValidateSize(this)">
										<br>
									     <span id="WAfile" onclick="downloadDocument('${attachmentBean.workauthcopy}','Work_Authorization_Copy')" style="color: blue">${attachmentBean.workauthcopy}</span>
									   </div>
									 <div class="col-sm-2" >
										<input type="text" id="wafromdate" class="form-control text-left"     autocomplete="off"
												title="Enter date in MM/DD/YYYY format only" name="wafromdate" placeholder="Start Date" class="form-control"> 
									</div>
									<div class="col-sm-2">
										<input type="text" id="waexpirydate" class="form-control text-left"     autocomplete="off"
												title="Enter date in MM/DD/YYYY format only" name="waexpirydate" placeholder="End Date" class="form-control">
									</div>
														</c:when>
														<c:otherwise>
														<div class="col-sm-4">
															<span style="color: blue"
																onclick="downloadDocument('${attachmentBean.workauthcopy}','Work_Authorization_Copy')">
																${attachmentBean.workauthcopy}</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					    									<br>
															<c:if test="${not empty attachmentBean.wastartdate}">
																<label>From Date : <span style="color: none">${attachmentBean.wastartdate}</span></label>
															</c:if>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:if test="${not empty attachmentBean.waenddate}">
																<label> End Date : <span style="color: none">${attachmentBean.waenddate}</span></label>
															</c:if>
															</div>
														</c:otherwise>
														</c:choose>
													<%-- 	<c:if test="${not empty attachmentBean.workauthcopy}">
													<div class="col-sm-4">
															<input type="button" class="btn btn-default btn-sm" 
																onclick="editDocument('${attachmentBean.workauthcopy}',${attachmentBean.workauthcopy},'${attachmentBean.workauthcopy}','${attachmentBean.workauthcopy}','${attachmentBean.workauthcopy}','');"
																value="Edit" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
														<a class="btn btn-success btn-sm" data-toggle='modal' href='#myModalView'
																onclick="viewDocHistory('${attachmentBean.workauthcopy}','${attachmentBean.workauthcopy}','${attachmentBean.workauthcopy}','');"
																title="View Document History"><i class="fa fa-history"></i></a>
													</div>
													</c:if> --%>
												</div>
									
									 <div class="form-group row">
									  <label for="inputPassword" id="W-9_copy" class="col-sm-4 control-label">
									  <Span id="vlab1" style="color:red;">*</Span>W-9 copy</label>
										  <input type="hidden" value="W-9_copy" name="W-9_copy" />
										<div class="col-sm-4">
										<input type="file" id="W9_copy" name="W9_copy" onchange="w9ValidateSize(this)">
										<br>
										<span id="WAfile" onclick="downloadDocument('${attachmentBean.w9copy}','W_9_Copy')" style="color: blue">${attachmentBean.w9copy}</span><br>
									</div>
									</div>
									
									 <div class="form-group row"> 
									  <label for="inputPassword" id="SSN_Copy" class="col-sm-4 control-label">
									  <Span id="vlab2" style="color:red;">*</Span>SSN Copy</label>
										  <input type="hidden" value="SSN_Copy" name="SSN_Copy" />
										<div class="col-sm-4">
										<input type="file" id="SSNCopy" name="SSNCopy" onchange="ssnValidateSize(this)">
										<br>
										<span id="WAfile" onclick="downloadDocument('${attachmentBean.ssncopy}','SSN_Copy')" style="color: blue">${attachmentBean.ssncopy}</span><br>
									</div>
									  <div class="col-lg-2">
												Exception: <input type="checkbox" id="myCheck" name="myCheck" onclick="myFunction()">
									 </div>
									</div>
                                     
                                     <div class="form-group row" id="map"  style="display:none;">
												<label for="inputPassword"	class="col-sm-4 control-label">
												<Span style="color: red;">*</Span>Management Approval e-mail </label>
												<div class="col-sm-4">
													<input type="hidden" value="Manager_Approved_Email_Doc" name="Manager_Approved_Email_Doc" /> 
													<input type="file" id="mgr_approved_mail" name="mgr_approved_mail" accept=".msg,.eml" onchange="ValidateMsgFile(this)"><br>
												</div>
									</div>
									 <h4><b>Other Additional Documents(1099)</b></h4>
						               <div class="text-center ml-3">
						                <label for="inputPassword" class="col-sm-4 control-label"></label>
                                       <button class="btn btn-success" type="button" id="btnid" onclick="add_fields99();"><i class="fa fa-plus" aria-hidden="true"></i></button>
                                      </div><br>
                                       <div id="add_fields99"></div>
                                       
                                        <div class="text-center ml-3">										
												<input type="submit" class="btn btn-success" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Upload Documents" id="allDocs">
												<input type="Reset" class="btn btn-default" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;" value="Reset">
												<button  type="button" onclick="goBack()" class="btn btn-default btn-sm" style="padding:7px;background-color:grey;color:white;line-height:0.728571;">Back</button>	
										</div>
										</form>
                                     </c:when>
                                     </c:choose>
								     </fieldset>
								</div>
							</div>
						</div>
						</div>
					</div>
				</div>
				
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
					<th style="text-align: center">Delete</th>
					<th style="text-align: center">Edit</th>
					
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
	        <td><button style="letter-spacing:1px;background-color:red;color:white;" id="delDocC2C"	onclick="deleteDocument('${entryC2C.fileId}','${entryC2C.fileName}')" ><i class="fa fa-trash"  aria-hidden="true"></i></button></td>
			<td><button style="letter-spacing:1px;background-color:#15aabf;color:white;"onclick="editDocument('${entryC2C.fileName}','${entryC2C.fileId}');"><i class="fa fa-edit"  aria-hidden="true"></i></button>
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
<c:if test="${not empty attachmentBean.adddocs1099}">
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
					<th style="text-align: center">Delete</th>
					<th style="text-align: center">Edit</th>
					
				</tr>
			</thead>
			<tbody>
			<c:forEach var="entry1099"	items="${attachmentBean.adddocs1099}">
			 <tr>
			
	         <td>${entry1099.inputval} </td>
	        <td>
	         <span id="ofilename" onclick="downloadDocument('${entry1099.fileName}','additionaldocs_1099')" style="color: blue">
					    ${entry1099.fileName}</span>
			</td>
	        <td><button style="letter-spacing:1px;background-color:red;color:white;" id="delDocC2C"	onclick="deleteDocument('${entry1099.fileId}','${entry1099.fileName}')"><i class="fa fa-trash"  aria-hidden="true"></i></button></td>
			<td><button style="letter-spacing:1px;background-color:#15aabf;color:white;"onclick="editDocument('${entry1099.fileName}','${entry1099.fileId}');"><i class="fa fa-edit"  aria-hidden="true"></i></button>
 						</tr>
					</c:forEach> 
					</tbody>
					</table>
			</div>
		</div>
	</div>
</div>
</c:if>
</c:when>
</c:choose>
				
				
				
				
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
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="resources/preDefined/goback.js"></script>
<!-- <script  type="text/javascript">
$('#btnSubmit').hide();	
var othercl=0;
var MAX_OPTIONS=15;
$('#addfilesC2CForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {	       
     /*     w_order:{
            validators: {
            	notEmpty: {
                    message: 'Vendor Work Order is mandatory'
                }
             }
         },
         cagreement:{
             validators: {
            	 notEmpty: {
                     message: 'Consultant Compliance is mandatory'
                 }
              }
          },
          cCompliance:{  
              validators: {
            	  notEmpty: {
                      message: ' Consultant Consent Agreement is mandatory'
                  }
               }
          },
          mgr_approved_mail_VWO:{  
              validators: {
            	  notEmpty: {
                      message: 'Manager Approved e-mail proof is mandatory'
                  }
                }
          }, */
          'other_c2c_doc[]': {
        	  validators: {
	              	notEmpty: {
	                      message: 'Other C2C Doc Name is mandatory'
	                  },
	                  stringLength: {
	                      min: 2,
	                      max: 20,
	                      message: 'Other C2C Doc Name must be more than 2 and less than 20 characters long'
	                  },
	                  regexp: {
	                	  regexp: /^[a-zA-Z0-9]+( [a-zA-Z0-9]+)*$/,
	                      message: 'Other C2C Doc Name accepts alphabets and empty spaces are not allowed'
	                  }
	              }
	          },
	          'othr_c2c_file[]': {
	               validators: {
	               	notEmpty: {
	                       message: 'Other C2C Doc is mandatory'
	                   }
	               }
	           }     
    }
})     
.on('click', '.addButton', function() {
$('#btnSubmit').show();	
othercl++;
	/* $('#element').removeAttr('style'); */
     var $template = $('#addfieldsC2C'),
         $clone    = $template
                         .clone()
                         .removeAttr('style')
                         .removeAttr('id')
                         .attr('data-book-index', othercl)
                         .insertAfter($template);

     // Add new field
     $('#addfilesC2CForm')
     .formValidation('addField', $clone.find('[name="other_c2c_doc[]"]'))
     .formValidation('addField', $clone.find('[name="othr_c2c_file[]"]'));
 })
.on('click', '.removeButton', function() {
     var $row  = $(this).parents('.form-group'),
         index = $row.attr('data-book-index');
        $other_c2c_doc_name = $row.find('[name="other_c2c_doc[]"]');

     // Remove fields
     $('#addfilesC2CForm')
          .formValidation('removeField', $row.find('[name="other_c2c_doc[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="othr_c2c_file[' + index + ']"]'))
          .formValidation('removeField', $other_c2c_doc_name);

     // Remove element containing the fields
     $row.remove();
       })
       .on('added.field.fv', function(e, data) {
           if (data.field === 'other_c2c_doc[]') {
               if ($('#addfilesC2CForm').find(':visible[name="other_c2c_doc[]"]').length >= MAX_OPTIONS) {
                   $('#addfilesC2CForm').find('.addButton').attr('disabled', 'disabled');
               }
           }
        })
        .on('removed.field.fv', function(e, data) {
            if (data.field === 'other_c2c_doc[]') {
                 if ($('#addfilesC2CForm').find(':visible[name="other_c2c_doc[]"]').length <= MAX_OPTIONS) {
                     $('#addfilesC2CForm').find('.addButton').removeAttr('disabled');
                 }
             }
        });
</script>  -->
<script type="text/javascript">
//var cbval = 0;
var cbval=$("input[name='othr_c2c_file[]']").length;
$('#btnSubmit').hide();
var max_fields_limit = 15;
function addfieldsC2C() {
	//$('#c2cbtncount').val(cbval);
	 cbval++;
    var objTo = document.getElementById('addfieldsC2C');
    var divtest = document.createElement("div");
	divtest.setAttribute("class", "form-group row removeclass"+cbval);
	var rdiv = 'removeclass'+cbval;
    divtest.innerHTML = '<div class="col-sm-4 nopadding"><div class="form-group"> <input type="text" class="form-control" name="other_c2c_doc[]" placeholder="Enter Document name" required><input type="hidden" value="'+cbval+'" name="c2cbtncount"></div></div><div class="col-sm-4 nopadding"><div class="form-group"> <input type="file" class="form-control" name="othr_c2c_file[]"  accept=".jpeg,.xls,.xlsx,.jpg,.png,.pdf,.doc,.docx" placeholder="othr_1099_doc" onchange="ValidateSize(this)" required></div></div><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="remove_add_fieldsC2C('+cbval+');"><i class="fa fa-minus"></i></button></div></div></div></div><div class="clear"></div>';
  /*   if(cbval<=max_fields_limit){
    	 objTo.appendChild(divtest);
    	 $('#addEmpBtnId').attr('disabled', 'disabled');
    }
    else if(cbval>max_fields_limit){
    	 alert("Can't upload more than 15 documents!!");
    } */
    if (cbval>=max_fields_limit){
	      objTo.appendChild(divtest);
	      alert("Can't upload more than 15 documents!!");
	      $('#btnid').attr('disabled', 'disabled');
    }else{
	     objTo.appendChild(divtest);
     }
    $('#btnSubmit').show();
}
   function remove_add_fieldsC2C(rid) {
	   $('.removeclass'+rid).remove();
	   cbval--;
	   if ($("input[name='othr_c2c_file[]']").length<=max_fields_limit) {
           $('#addEmpBtnId').removeAttr('disabled');
       }
	   if(cbval==0){
    	   $('#btnSubmit').hide();
       }
	  
	 //
 }
</script>
<script type="text/javascript">
//var bval = 0;
var max_fields_limit = 15;
function add_fields99() {
	$('#allDocs').removeAttr("disabled");
	//$('#1099btncount').val(bval);
	var bval=$("input[name='othr_1099_file[]']").length
	bval++;
    var objTo = document.getElementById('add_fields99');
    var divtest = document.createElement("div");
	divtest.setAttribute("class", "form-group row removeclass"+bval);
	var rdiv = 'removeclass'+bval;
    divtest.innerHTML = '<div class="col-sm-4 nopadding"><div class="form-group"> <input type="text" class="form-control" name="other_1099_doc[]" placeholder="Enter Document name" required><input type="hidden" value="'+bval+'" name="1099btncount"></div></div><div class="col-sm-4 nopadding"><div class="form-group"> <input type="file" class="form-control" name="othr_1099_file[]" placeholder="othr_1099_doc" accept=".jpeg,.xls,.xlsx,.jpg,.png,.pdf,.doc,.docx" onchange="ValidateSize(this)" required></div></div><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="remove_add_fields99('+bval+');"> <i class="fa fa-minus" aria-hidden="true"></i> </button></div></div></div></div><div class="clear"></div>';
    if (bval>=max_fields_limit) {
	      objTo.appendChild(divtest);
	      alert("Can't upload more than 15 documents!!");
	      $('#btnid').attr('disabled', 'disabled');
   }else{
  	     objTo.appendChild(divtest);
   }
    /*   if(bval<=max_fields_limit){
   	 objTo.appendChild(divtest);
   }
   else if(bval>max_fields_limit){
   	 alert("Can't upload more than 15 documents!!");
   } */
}

function remove_add_fields99(rid) {
	   $('.removeclass'+rid).remove();
	 if($("input[name='othr_1099_file[]']").length<=max_fields_limit) {
           $('#btnid').removeAttr('disabled');
      }
	  // bval--;
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
<script type="text/javascript">
function myFunction() {
	  var checkBox = document.getElementById("myCheck");
	  if (checkBox.checked == true){
		  $("#map").show();
		  $("#vlab,#vlab1,#vlab2").hide();
		  document.getElementById('mgr_approved_mail').required=true; 
	  } else {
		  $("#map").hide();
		  $("#vlab,#vlab1,#vlab2").show();
		  document.getElementById('mgr_approved_mail').required=false;
	  }
	}
/* function saveDocument()
{     
	 var WA_copy = $('#WA_copy').val(); 
     var W9_copy = $('#W9_copy').val(); 
     var SSNCopy = $('#SSNCopy').val(); 
     var mgr_approved_mail = $('#mgr_approved_mail').val(); 
     var othr_c2c_doc=$("input[name='othr_c2c_doc[]']").length;
     var othr_1099_doc=$("input[name='othr_1099_doc[]']").length;
     if(WA_copy!='' || W9_copy!='' || SSNCopy!='' || othr_c2c_doc!=''|| othr_c2c_doc>0 || othr_1099_doc>0) 
     { 
    	    $("#allDocs").attr("disabled", true);
			var form = $('#addfiles1099Form')[0];
			var data = new FormData(form);
			$.ajax({
				url : "saveConsultantDocs", //this is the submit URL
				type : "POST",
				enctype : 'multipart/form-data',
				data : data,
				processData : false,
				contentType : false,
				cache : false,
				success : function(data) {
					 if(data!=null || data!=""){
						     var mesg=response.message;
				   	         var userid=response.userid;
				   	         var empType=response.empType;
				   	         alert(mesg)
				   	      window.location.href="addConsultantDocs?userid="+userid+"&empType="+empType+"";
		   	   	         }
		   	   	      else{
		   	   	          window.location.href="loginpage";
		   	   	   	      }
				}
			});
     }else{
    	  alert( 'Please select file' );
      }
} */
</script>

<script type="text/javascript">
function checkForm1()
{ 
	getsesVal().done(function(data){
		if(data!=""){
   	 var othr_c2c_file=$("input[name='othr_c2c_file[]']").length;
     if(othr_c2c_file>0)
     { 
   	    return true;
   	/*     var form = $('#addfilesC2CForm')[0];
		var data = new FormData(form);
		$.ajax({
			url : "saveConsultantDocs", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(data) {
				 if(data!=null || data!=""){
			   	         alert(data)
			   	         window.location.href="addConsultantDocs?userid="+userid+"&empType="+empType+"";
	   	   	         }
	   	   	      else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			}
		}); */
     }else{
    	  alert( 'Please select file' );
    	  return false;
      }
		}else{
			 window.location.href="loginpage";
		}
	});
}
function downloadDocument(fname,ftype){
	getsesVal().done(function(data){
		if(data!=""){
	var candidateId=$('#candidateId').val();
	var encoded = encodeURIComponent(fname);	
	window.location.href="downloadocs?filename="+encoded+"&filetype="+ftype+"&candidate_id="+candidateId;
		}else{
			 window.location.href="loginpage";
		}
	});
}

function checkForm(form)
{
	getsesVal().done(function(data){
		if(data!=""){
	 var WA_copy = $('#WA_copy').val(); 
     var W9_copy = $('#W9_copy').val(); 
     var SSNCopy = $('#SSNCopy').val(); 
     var mgr_approved_mail = $('#mgr_approved_mail').val(); 
     var othr_1099_file=$("input[name='othr_1099_file[]']").length;
     if(WA_copy!='' || W9_copy!='' || SSNCopy!='' || mgr_approved_mail!='' || othr_1099_file>0) 
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
<script type="text/javascript">
function waValidateSize(file) {
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
							if ($('#WA_copy').val() != '' && $('#WA_copy').val() == $('#W9_copy').val() != '' && $('#W9_copy').val() || $('#WA_copy').val() != '' && $('#WA_copy').val() == $('#SSNCopy').val() != '' && $('#SSNCopy').val() || $('#W9_copy').val() != '' && $('#W9_copy').val() == $('#SSNCopy').val() != '' && $('#SSNCopy').val())
			                {
								alert("You can not send two or more same files.");
							         $('#WA_copy').val('');
							         //$('#btnSubmit').attr('disabled',true);
							     }else{
							    	 $('#wafromdate,#waexpirydate').prop('required',true);
							     	$('#allDocs').attr('disabled',false);
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
  		 $('#wafromdate,#waexpirydate').removeAttr('required');
  		$('#wafromdate,#waexpirydate').val('');
  		$('#allDocs').attr('disabled',false);
  	}
}else{
	 window.location.href="loginpage";
}
});
}

function w9ValidateSize(file) {
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
							if ($('#WA_copy').val() != '' && $('#WA_copy').val() == $('#W9_copy').val() != '' && $('#W9_copy').val() || $('#WA_copy').val() != '' && $('#WA_copy').val() == $('#SSNCopy').val() != '' && $('#SSNCopy').val() || $('#W9_copy').val() != '' && $('#W9_copy').val() == $('#SSNCopy').val() != '' && $('#SSNCopy').val())
			                {
							         alert("You can not send two or more same files.");
							         $('#W9_copy').val('');
							         //$('#btnSubmit').attr('disabled',true);
							     }else{
							     	$('#allDocs').attr('disabled',false);
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
  		$('#allDocs').attr('disabled',false);
  	}
}else{
	 window.location.href="loginpage";
}
});
}
function ssnValidateSize(file) {
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
							if ($('#WA_copy').val() != '' && $('#WA_copy').val() == $('#W9_copy').val() != '' && $('#W9_copy').val() || $('#WA_copy').val() != '' && $('#WA_copy').val() == $('#SSNCopy').val() != '' && $('#SSNCopy').val() || $('#W9_copy').val() != '' && $('#W9_copy').val() == $('#SSNCopy').val() != '' && $('#SSNCopy').val())
			                {
							         alert("You can not send two or more same files.");
							         $('#SSNCopy').val('');
							         //$('#btnSubmit').attr('disabled',true);
							     }else{
							     	$('#allDocs').attr('disabled',false);
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
  		$('#allDocs').attr('disabled',false);
  	}
}else{
	 window.location.href="loginpage";
}
});
}

$("#wafromdate").datepicker({
}).on('changeDate', function(selected) {
	 var minDate = new Date(selected.date.valueOf());
     $('#waexpirydate').datepicker('setStartDate', minDate);
});	
$("#waexpirydate").datepicker({
}).on('changeDate', function(selected) {
        var minDate = new Date(selected.date.valueOf());
        $('#wafromdate').datepicker('setEndDate', minDate);
});

//WA_copy W9_copy SSNCopy
</script>
</body>
</html>
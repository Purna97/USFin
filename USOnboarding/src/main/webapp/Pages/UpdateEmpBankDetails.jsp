<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/css/datepicker3.min.css" />
<!-- <link rel="stylesheet" type="text/css" href="resources/css/css/formValidation.css">
<link rel="stylesheet" type="text/css" href="resources/css/css/formValidation.min.css"> -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" />
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
							<h5 class="card-header">Direct Deposit Details</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-lg-12">
									<input type="hidden" name="emptype" id="emptype" value="${emptype}">
									<input type="hidden" name="role" id="role" value="${role}">
									<input type="hidden" name="dept" id="dept" value="${dept}">
										<fieldset>
										<center><font color=red>Employee Name :</font><b>&nbsp;&nbsp;${basicObj.full_name}</b>&nbsp;&nbsp;<font color=red>Employee Type :</font><b>&nbsp;&nbsp;${basicObj.emp_type}</b></center>
										<br>
											<form action="updateEmpBankDetails" method="post" class="form-horizontal"
												enctype="multipart/form-data" id="formid">
								
												<input type="hidden" id="candidate_id" name="candidate_id" value="${candidate_id}">

												<c:forEach var="bank" items="${empEanklist}">
													<input type="hidden" id="txtAccount1${bank.bank_id}"	value="${bank.accountNo}">
													<input type="hidden" id="txtBank1${bank.bank_id}" value="${bank.bank_name}">
													<input type="hidden" id="txtswift1${bank.bank_id}" value="${bank.swift_Code}">
													<input type="hidden" id="txtiban1${bank.bank_id}" value="${bank.iban_Code}">
													<%-- <input type="hidden" id="bank_amount1${bank.bank_id}" value="${bank.amount}"> --%>
													<input type="hidden" id="txtrouting1${bank.bank_id}" value="${bank.bankRoutingNo}">
													<input type="hidden" id="file1${bank.bank_id}" value="${bank.bankfilename}">
													<input type="hidden" id="id1" name="tblpk" value="${bank.bank_id}">

													<div class="form-group row">
														<label for="inputPassword" class="col-lg-4 control-label"><Span
															style="color: red;">*</Span>Account Number</label>
														<div class="col-lg-4">
															<input class="form-control" id="txtAccount${bank.bank_id}"
																autocomplete="off" name="txtAccount"
																placeholder='Enter Account Number' required
																pattern="\d*" minlength="10" maxlength="20" 
																title="Enter Only digits" type='text'
																value="${bank.accountNo}">
														</div>
														
													</div>

													<div class="form-group row">
														<label for="inputPassword" class="col-lg-4 control-label"><Span
															style="color: red;">*</Span>Bank Name</label>
														<div class="col-lg-4">
															<input class="form-control" id="txtBank${bank.bank_id}"
																required autocomplete="off" name="txtBank"
																placeholder='Enter Bank Name'
																pattern="[a-zA-Z][a-zA-Z\s]*" minlength="2" maxlength="100"
																title="Enter only Characters" type='text'
																value="${bank.bank_name}" required>
														</div>
													</div>

													<div class="form-group row">
														<label for="inputPassword" class="col-lg-4 control-label"><Span
															style="color: red;"></Span>Bank Swift Code</label>
														<div class="col-lg-4">
															<input class="form-control" id="txtswift"
																autocomplete="off"
																title="Enter only Characters and numbers"
																value="${bank.swift_Code}" name="txtswift"
																placeholder='Bank Swift Code' type='text'>
														</div>
														<!-- pattern="[A-Za-z]{4}[0-9]{7}"  -->
													</div>

													<div class="form-group row">
														<label for="inputPassword" class="col-lg-4 control-label"><Span
															style="color: red;"></Span>IBAN code</label>
														<div class="col-lg-4">
															<input class="form-control" id="txtiban"
																autocomplete="off"
																title="Enter only Characters and numbers"
																value="${bank.iban_Code}" name="txtiban"
																placeholder='IBAN code' type='text'>
														</div>
														<!-- pattern="[A-Za-z]{4}[0-9]{7}"  -->
													</div>

													<div class="form-group row">
														<label for="inputPassword" class="col-lg-4 control-label"><Span
															style="color: red;">*</Span>Bank Routing Number</label>
														<div class="col-lg-4">
															<input class="form-control" id="txtrouting${bank.bank_id}"
																autocomplete="off" name="txtrouting"
																placeholder='Bank Routing Number'
																value="${bank.bankRoutingNo}" required pattern="\d*"
																minlength="9" maxlength="9" title="Enter Only digits"
																type='text'>
														</div>
													</div>
													<%-- <div class="form-group row">
														<label for="inputPassword" class="col-lg-4 control-label"><Span
															style="color: red;"></Span>Amount</label>
														<div class="col-lg-4">
															<input class="form-control" id="bank_amount${bank.bank_id}"
																autocomplete="off" name="bank_amount"
																placeholder='Amount' value="${bank.amount}" required
																pattern="\d*" maxlength="9" title="Enter Only digits"
																type='text'>
														</div>
													</div> --%>

													<div class="form-group row">
														<label for="inputPassword" class="col-lg-4 control-label"><Span
															style="color: red;"></Span>Bank Form</label>
														<div class="col-lg-4">
															<input type="file" id="file${bank.bank_id}"
																name="file">
															<span id="bankDoc"></span>
															<c:choose>
																<c:when test="${empty bank.bankfilename}">
																	<a>NA</a>
																</c:when>
																<c:otherwise>
																	<br>
																	<input type="hidden" value="${bank.bankfilename}"
																		onclick="downloadDocument('${bank.bankfilename}','bank_file_name')" />
																	<span style="color: blue" onclick="downloadDocument('${bank.bankfilename}','bank_file_name')"> ${bank.bankfilename}</span>
																	<%--  <button type="button" onclick="downloadDocument(${bankfilename.userid},'${bank.bankfilename}','bank_file_name')" style="color:blue">
							                 ${bank.bankfilename}</button> --%>
																</c:otherwise>
															</c:choose>
															<%--  <a href="USOBT_BasicDetails?action=downloadocs&empno=${bank.emp_number}&filename=${bank.bank_file_name}&filetype=bank_file_name" style="color:blue">${bank.bank_file_name}</a></span> --%>
															<br>
															<br>
														</div>
													</div>

												</c:forEach>
												<div class='form-group row' id="addbank">
													<label for="inputPassword" class="col-lg-4 control-label">Add
														Other Bank Details</label>
													<div class="input-group-btn addButton">
														<button class="btn btn-success btn-sm" type="button"
															onclick="addfieldsBank();">
															<span class="glyphicon glyphicon-plus" aria-hidden="true">+</span>
														</button>
													</div>
												</div>
												<div id="addfieldsBank"></div>
												<!-- onclick="updateEmpBankDetails()" -->
												<div class="text-center ml-12">
													<input type="submit" id="submitid"		class="btn btn-default btn-sm"
														style="padding: 7px; background-color: green; color: white; text-transform: INITIAL; line-height: 0.728571;"
														value="Update" />
													<input type="button"  value="Back" onclick="goBack()" class="btn btn-default btn-sm"
														style="padding: 7px; background-color: grey; color: white; line-height: 0.728571;">
												</div>



											</form>
										</fieldset>
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
						</div>
					</div>
				</div>
	      </div>
		</div>
	</div>
	
		
<script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<!-- <script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/formValidation.js"></script>
<script src="resources/js/newjs/framework-bootstrap.min.js"></script> -->
<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script src="resources/preDefined/goback.js"></script>
<script language="JavaScript" type="text/javascript">
function updateEmpBankDetails(){
	getsesVal().done(function(data){
		  if(data!=""){
	$("#submitid").attr("disabled",true);
	 var form = $('#formid')[0];
	     var data = new FormData(form);
		$.ajax({
	            url: "updateEmpBankDetails", //this is the submit URL
	            type: "POST",
	            enctype: 'multipart/form-data',
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            success: function(response){
	   	        if(response!=null || response!=""){
		   	     var mesg=response.message;
		   	     var userid=response.userid;
		   	  	 window.location.href="viewEmpBankDetails?candidate_id="+candidate_id+"";
	   	   	         }
	   	          else{
	   	          window.location.href="loginpage";
	   	   	            }
	            	
	            }
	        });
		  }else{
				 window.location.href="loginpage";
			}
		});
}



//document.getElementById('submitid').disabled=true;
	var  id=$("#id1").val();
	/* 	$('#txtAccount,#txtBank,#txtswift,#txtiban,#bank_amount,#txtrouting,#file'+id)*/
			
		 	$('#txtAccount'+id).on('keyup', function() {
		 		 if($('#txtAccount'+id).val()==$('#txtAccount1'+id).val())
		 		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
		 	  });
		  $('#txtBank'+id).on('keyup', function() {
		 		 if($('#txtBank'+id).val()==$('#txtBank1'+id).val())
		 		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
		 	  });
		  $('#txtswift'+id).on('keyup', function() {
		 		 if($('#txtswift'+id).val()==$('#txtswift1'+id).val()){
			 		 document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
		 	  });
		  $('#txtiban'+id).on('keyup', function() {
		 		 if($('#txtiban'+id).val()==$('#txtiban1'+id).val())
			 		 {document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
		 	  });
	/* 	  $('#bank_amount'+id).on('keyup', function() {
		 		 if($('#bank_amount'+id).val()==$('#bank_amount1'+id).val())
			 		 {document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
		 	  }); */
		  $('#txtrouting'+id).on('keyup', function() {
		 		 if($('#txtrouting'+id).val()==$('#txtrouting1'+id).val())
			 		 {document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
		 	  });
		  $('#file'+id).on('change', function() {
		 		 if($('#file'+id).val()==$('#file1'+id).val())
			 		 {document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
		 	  });
	
		$(document).ready(function(){
			$("#dob").datepicker({
				//dateFormat:"dd/mm/yy" ,
				changeMonth:true,
				changeYear:true,
				onSelect: function(selected) {
				  $("#ToDate").datepicker("option","minDate", selected)
				  }
			});
			$("#ToDate").datepicker({
				//dateFormat:"dd/mm/yy" ,
				changeMonth:true,
				changeYear:true,
				onSelect: function(selected) {
				   $("#FromDate").datepicker("option","maxDate", selected)
		
				}
			});
			$("#mysubmit").click(function(){
				//$("#myRowSubmit").show();
				$("#myRowSubmit").delay(2000).fadeIn();
			});
		});
	</script>
	<script language="JavaScript" type="text/javascript">
		$(document).ready(function(){
			$("#joining_Date").datepicker({
				//dateFormat:"dd/mm/yy" ,
				changeMonth:true,
				changeYear:true,
			});
		});
	</script>
	
    <script type="text/javascript">
var value = 0;
var max_limit = 3;
function addfieldsBank() {
	value++;
	$('#btncount').val(value);
	//alert(vbval);
    var objTo = document.getElementById('addfieldsBank');
    var divtest = document.createElement("div");
	divtest.setAttribute("class", "form-group removeclass"+value);
	var rdiv ='removeclass'+value;
	divtest.innerHTML = '<div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;">*</Span>Account Number</label><div class="col-lg-4"><input class="form-control"  id="acc_name" autocomplete="off" name="acc_name'+value+'" placeholder="Enter Account Number" pattern="[0-9]+" minlength="9" maxlength="20" title="Enter Only digits" type="text" required><input type="hidden" value="'+value+'" name="btncount"></div><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="remove_add_fieldsV('+value+');"><span class="glyphicon glyphicon-minus" aria-hidden="true">-</span></button></div></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;">*</Span>Bank Name</label><div class="col-lg-4"><input class="form-control"  id="bank_name" autocomplete="off" name="bank_name'+value+'" placeholder="Bank Name"  pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" minlength="2" maxlength="100" title="Enter only Characters"  type="text" required></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:black;"></Span>Bank Swift Code</label><div class="col-lg-4"><input class="form-control"  id="swift_code" autocomplete="off" name="swift_code'+value+'" placeholder="Bank Swift Code"   title="Enter Only digits" type="text"></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:black;"></Span>IBAN code</label><div class="col-lg-4"><input class="form-control"  id="ibank_code" autocomplete="off" name="ibank_code'+value+'" placeholder="IBAN code" title="Enter Only digits" type="text"></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;">*</Span>Bank Routing Number</label><div class="col-lg-4"><input class="form-control"  id="bank_routing" autocomplete="off" name="bank_routing'+value+'" pattern="[0-9]+" minlength="9"  maxlength="9" placeholder="Bank Routing Number" title="Enter Only digits" type="text" required></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;"></Span>Bank Form</label><div class="col-lg-4"><input type="file" id="ofile" name="ofile'+value+'" onchange="ValidateSize(this)"></div></div></div><div class="clear"></div>';
    if(value<=max_limit){
      	 objTo.appendChild(divtest);
      }
      else if(value>max_limit){
      	 alert("Can't add more than 3 Banks!!");
      }
}
   function remove_add_fieldsV(rid) {
	   $('.removeclass'+rid).remove();
	   value--;
 }
</script>    
<script type="text/javascript">
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
</body>
</html>

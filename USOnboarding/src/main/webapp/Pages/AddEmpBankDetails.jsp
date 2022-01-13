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
<!-- <link rel="stylesheet" href="resources/css/css/datepicker3.min.css" />
<link rel="stylesheet" type="text/css" href="resources/css/css/formValidation.css">
<link rel="stylesheet" type="text/css" href="resources/css/css/formValidation.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" /> -->
</head>
<!-- <style type="text/css">
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
</style> -->
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
										<!-- <form action="USOBT_BasicDetails?action=bankdetails"
											method="post" id="formid" class="form-horizontal"
											enctype="multipart/form-data"> -->
											<center><font color=red>Employee Name :</font><b>&nbsp;&nbsp;${basicObj.full_name}</b>&nbsp;&nbsp;<font color=red>Employee Type :</font><b>&nbsp;&nbsp;${basicObj.emp_type}</b></center>
											
											<br>
											<form action="saveEmpbankDetails" method="post" class="form-horizontal" id="formid" enctype="multipart/form-data">
											<input type="hidden" id="candidate_id" name="candidate_id" value="${candidate_id}">
											<input type="hidden"  name="semp_type"  value="${semp_type}">
											<input type="hidden" name="susername"  value="${susername}">
							  	        	<input type="hidden"  name="sfullname"  value="${sfullname}">
										    <input type="hidden"  name="spendingdocs"  value="${spendingdocs}">
										    <input type="hidden" name="s_subtype"  value="${s_subtype}">

											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span>Account Number</label>
												<div class="col-lg-4">
													<input class="form-control" id='txtAccount' pattern="\d*"
														name="acc_name" placeholder='Enter Account Number'
														autocomplete="off"  maxlength="20"
														title="Enter Only digits" type='text' required>
													<!--  pattern="\d*"-->
												</div>
											</div>

											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span>Bank Name</label>
												<div class="col-lg-4">
													<input class="form-control" id='txtBank' autocomplete="off"
														name="bank_name" placeholder='Enter Bank Name'
														pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
														minlength="2" maxlength="100" title="Enter only Characters"
														type='text' required>
												</div>
											</div>

											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span>Bank Swift Code</label>
												<div class="col-lg-4">
													<input class="form-control" id='txtswift'
														autocomplete="off" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"
														title="Enter only Characters and numbers"
														name="swift_code" placeholder='Bank Swift Code'
														type='text'>
												</div>
											</div>

										<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span>IBAN code</label>
												<div class="col-lg-4">
													<input class="form-control" id='txtiban' autocomplete="off"
														pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"
														title="Enter only Characters and numbers"
														name="ibank_code" placeholder='IBAN code' type='text'>
												</div>
											</div>

										<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span>Bank Routing Number</label>
												<div class="col-lg-4">
													<input class="form-control" id='txtrouting'
														autocomplete="off" name="bank_routing"
														placeholder='Bank Routing Number'
														title="Enter Only digits" type='text' minlength="9"
														maxlength="9" pattern="\d*" required>
													<!--  pattern="\d*"-->
												</div>
											</div>
											<!-- <div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span>Amount</label>
												<div class="col-lg-4">
													<input class="form-control" id='txtAmount' pattern="\d*"
														name="bank_amount" placeholder='Enter Amount'
														maxlength="12" title="Enter Only digits" type='text'>
												</div>
											</div> -->

											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span>Bank Form</label>
												<div class="col-lg-4">
													<input type="file" id="bfile" name="bfile"
														onchange="ValidateSize(this)"><br>
												</div>
											</div>
											<div class="form-group row">
											<label for="inputPassword" class="col-lg-4 ">
											<b>Add Other Bank Details</b>
											</label>
											<div class="input-group-btn addButton">
												<button class="btn btn-success btn-sm" type="button"
													onclick="addfieldsBank();">
													<span>+</span>
												</button>
											</div></div>
											<br>
											<div id="addfieldsBank"></div>

											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span></label>
												<div class="col-lg-4">
													<input type="submit" class="btn btn-default btn-sm" value="Submit"	style="padding: 7px; background-color: green; color: white; text-transform: INITIAL; line-height: 0.728571;" > 
														<input type="Reset"	class="btn btn-danger btn-sm"	style="padding: 7px; background-color: red; color: white; text-transform: INITIAL; line-height: 0.728571;"value="Reset">
														
													<%-- onclick="saveBankDetails()" 
													<a href="USOBT_BasicDetails?action=empsearch&username=${s_username}&fullname=${s_fullname}&emp_type=${s_emptype}
													&ssnno=${s_ssnno}&pendingdocs=${s_pendingdocs}" class="btn btn-default" style="padding:7px;text-transform:INITIAL;line-height:0.728571;">Back</a> --%>
													<button onclick="goBack()" class="btn btn-default btn-sm" style="padding:7px;background-color:grey;color:white;line-height:0.728571;">Back</button>	

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
		
<script src="resources/js/js/jquery-2.1.4.min.js"></script> 
<script src="resources/preDefined/goback.js"></script>
<!-- <script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/formValidation.js"></script>
<script src="resources/js/newjs/framework-bootstrap.min.js"></script> -->


		<script type="text/javascript">
			var value = 0;
			var max_limit = 3;
			function addfieldsBank() {
				value++;
				$('#btncount').val(value);
				//alert(vbval);
				var objTo = document.getElementById('addfieldsBank');
				var divtest = document.createElement("div");
				divtest.setAttribute("class", "form-group removeclass" + value);
				var rdiv = 'removeclass' + value;
				divtest.innerHTML = '<div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;">*</Span>Account Number</label><div class="col-lg-4"><input class="form-control"  id="acc_name" autocomplete="off" name="acc_name'+value+'" placeholder="Enter Account Number" pattern="[0-9]+" minlength="9" maxlength="20" title="Enter Only digits" type="text" required><input type="hidden" value="'+value+'" name="btncount"></div><div class="input-group-btn"> <button class="btn btn-danger btn-sm" type="button" onclick="remove_add_fieldsV('+value+ ');"><span class="glyphicon glyphicon-minus" aria-hidden="true">-</span></button></div></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;">*</Span>Bank Name</label><div class="col-lg-4"><input class="form-control"  id="bank_name" autocomplete="off" name="bank_name'+ value+ '" placeholder="Bank Name"  pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" minlength="2" maxlength="100" title="Enter only Characters"  type="text" required></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:black;"></Span>Bank Swift Code</label><div class="col-lg-4"><input class="form-control"  id="swift_code" autocomplete="off" name="swift_code'+value+'" placeholder="Bank Swift Code"   title="Enter Only digits" type="text"></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:black;"></Span>IBAN code</label><div class="col-lg-4"><input class="form-control"  id="ibank_code" autocomplete="off" name="ibank_code'+value+'" placeholder="IBAN code" title="Enter Only digits" type="text"></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;">*</Span>Bank Routing Number</label><div class="col-lg-4"><input class="form-control"  id="bank_routing" autocomplete="off" name="bank_routing'+value+'" pattern="[0-9]+" minlength="9"  maxlength="9" placeholder="Bank Routing Number" title="Enter Only digits" type="text" required></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;"></Span>Bank Form</label><div class="col-lg-4"><input type="file" id="othrfile" name="ofile'+value+'" accept=".jpeg,.xls,.xlsx,.jpg,.png,.pdf,.doc,.docx" onchange="ValidateSize(this)"></div></div></div><div class="clear"></div>';
					if (value <= max_limit) {
					objTo.appendChild(divtest);
				} else if (value > max_limit) {
					alert("Can't add more than 3 Banks!!");
				}
			}
			function remove_add_fieldsV(rid) {
				$('.removeclass' + rid).remove();
				value--;
			}
		</script>
		
		<script>
		function saveBankDetails(){
			var candidate_id=$("#candidate_id").val();
		          var form = $('#formid')[0];
				  var formData = new FormData(form);
                 
				   $.ajax({
                       type : "post",
                       url : "saveEmpbankDetails",
                       enctype: 'multipart/form-data',
                       cache : false,
                       async : false,
                       contentType : false,
                       data : formData,
                       success : function(response) {
                    	   alert(response);
                    	   window.location.href="viewEmpBankDetails?candidate_id="+candidate_id+"";
                       },
                       error : function() {
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
</body>
</html>
;

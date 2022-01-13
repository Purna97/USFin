<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Portal</title>
</head>
<body>
 <div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">Update Direct Deposit Details</h5>
							<div class="card-body">
								<div class="row">
									<div class="col-md-8 col-sm-12">
									
										<fieldset>
										<%-- <font color=red>Employee Number :</font>&nbsp;&nbsp;<b>${empobj.emp_number}</b>&nbsp;&nbsp; --%>
										<%-- <center><font color=red>Employee Name :</font>&nbsp;&nbsp;<b>${empobj.fullname}</b>&nbsp;&nbsp;<font color=red>Employee Username :</font>&nbsp;&nbsp;<b>${empobj.username}</b></center> --%>
										<center><font color=red>Employee Name :</font><b>&nbsp;&nbsp;${basicObj.full_name}</b>&nbsp;&nbsp;<font color=red>Employee Type :</font><b>&nbsp;&nbsp;${basicObj.emp_type}</b></center>
										<br>
										<form action="updateConsultantBankDetails" method="post" class="form-horizontal" enctype="multipart/form-data">
											<input type="hidden" name="candidate_id" id="candidate_id" value="${candidate_id}">						
											<input type="hidden" name="empType" id="empType" value="${empType}">																			
											
									  <c:choose>
						   			   <c:when test="${empType=='C2C'}">
						   			    <%--  <input type="hidden" value="${BankDetails.tblpk}" name="ctblpk">  --%>
						   			     <c:forEach var="bank" items="${conBanklist}">
						   			     <input type="hidden" id="id1" name="cpayment_id" value="${bank.payment_id}">
									      	<div class="form-group row">
													<label  for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Select Vendor</label>
													<div class="col-sm-4">
													<select name="vendorid" class="form-control text-left" id="vendorid"required>
										           <%--  <option value="${BankDetails.vendorid}">${BankDetails.ven_name}</option> --%>
										           		 <option value="">--Select Vendor--</option>
										                 <c:forEach var="venl" items="${vendorList}">
														 <option value="${venl.vendid}" ${venl.vendid == bank.vendorid ? 'selected="selected"' : ''}>${venl.vendorname}</option>
														  </c:forEach>
										              </select>
													</div>
										</div>
										<div class="form-group row">
													<input type="hidden" id="pmode" name="pmode" value="${bank.payment_mode}">
													<label  for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Select Payment Mode</label>
													<div class="col-sm-4">
														<select name="paymentMode" autoComplete="off" class="form-control text-left" id='paymentMode' required>
										                    <option value="${bank.payment_mode}">${bank.payment_mode}</option>
										                    <option value="" >--Select Payment Mode--</option>
										                     <option value="Cheque">Cheque</option>
										                     <option value="DirectDeposit">Direct Deposit</option>
										                     <option value="Other">Others</option>									                
										              </select>
													</div>
									   </div>
									   <c:choose>
									   <c:when test="${not empty bank.accountNo}">
													<input type="hidden" id="txtAccount1"	value="${bank.accountNo}">
													<input type="hidden" id="txtBank1" value="${bank.bank_name}">
													<input type="hidden" id="txtswift1" value="${bank.swift_Code}">
													<input type="hidden" id="txtiban1" value="${bank.iban_Code}">
													<input type="hidden" id="txtrouting1" value="${bank.bankRoutingNo}">
													<input type="hidden" id="file1" value="${bank.bankfilename}">
													 <div id="bnkchq" class="form-group">
													<div class="form-group row">
														<label for="inputPassword" class="col-sm-4 control-label"><Span
															style="color: red;">*</Span>Account Number</label>
														<div class="col-sm-4">
															<input class="form-control" id="txtAccount"
																autocomplete="off" name="acc_no"
																placeholder='Enter Account Number' required
																pattern="\d*" minlength="9" maxlength="20"
																title="Enter Only digits" type='text'
																value="${bank.accountNo}">
														</div>
													</div>

													<div class="form-group row">
														<label for="inputPassword" class="col-sm-4 control-label"><Span
															style="color: red;">*</Span>Bank Name</label>
														<div class="col-sm-4">
															<input class="form-control" id="txtBank"
																required autocomplete="off" name="bank_name"
																placeholder='Enter Bank Name'
																pattern="[a-zA-Z][a-zA-Z\s]*" minlength="2" maxlength="100"
																title="Enter only Characters" type='text'
																value="${bank.bank_name}" required>
														</div>
													</div>

													<div class="form-group row">
														<label for="inputPassword" class="col-sm-4 control-label"><Span
															style="color: red;"></Span>Bank Swift Code</label>
														<div class="col-sm-4">
															<input class="form-control" id="txtswift"
																autocomplete="off"
																title="Enter only Characters and numbers"
																value="${bank.swift_Code}" name="swift_code"
																placeholder='Bank Swift Code' type='text'>
														</div>
														<!-- pattern="[A-Za-z]{4}[0-9]{7}"  -->
													</div>

													<div class="form-group row">
														<label for="inputPassword" class="col-sm-4 control-label"><Span
															style="color: red;"></Span>IBAN code</label>
														<div class="col-sm-4">
															<input class="form-control" id="txtiban"
																autocomplete="off"
																title="Enter only Characters and numbers"
																value="${bank.iban_Code}" name="ibank_code"
																placeholder='IBAN code' type='text'>
														</div>
														<!-- pattern="[A-Za-z]{4}[0-9]{7}"  -->
													</div>

													<div class="form-group row">
														<label for="inputPassword" class="col-sm-4 control-label"><Span
															style="color: red;">*</Span>Bank Routing Number</label>
														<div class="col-sm-4">
															<input class="form-control" id="txtrouting"
																autocomplete="off" name="bank_routing"
																placeholder='Bank Routing Number'
																value="${bank.bankRoutingNo}" required pattern="\d*"
																minlength="9" maxlength="9" title="Enter Only digits"
																type='text'>
														</div>
													</div>
													<div class="form-group row">
														<label for="inputPassword" class="col-sm-4 control-label"><Span
															style="color: red;"></Span>Bank Form</label>
														<div class="col-sm-4">
															<input type="file" id="bfile1" value="${bank.bankfilename}"
																name="bfile1" onchange="ValidateSize(this)">
															<span id="bankDoc"></span>
															<c:choose>
																<c:when test="${empty bank.bankfilename}">
																	<a>NA</a>
																</c:when>
																<c:otherwise>
																	<br>
																	<span style="color: blue" onclick="downloadDocument('${bank.bankfilename}','bank_file_name')"> ${bank.bankfilename}</span>
															</c:otherwise>
															</c:choose>
															<br>
															<br>
														</div>
													</div>
													</div>
							</c:when>
							<c:otherwise>
							 <div id="Bank" class="form-group" style="display:none">
										     <div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span>Account Number</label>
												<div class="col-lg-4">
													<input class="form-control" id='txtAccount' pattern="\d*"
														name="acc_no" placeholder='Enter Account Number'
														autocomplete="off"  maxlength="20" pattern="^[0-9]*$"
														title="Enter Only digits" type='text' required>
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
														maxlength="9" pattern="^[0-9]*$" required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span>Bank Form</label>
												<div class="col-lg-4">
													<input type="file" name="bfile1"
														onchange="ValidateSize(this)"><br>
												</div>
											</div>
								</div>
							</c:otherwise>
							</c:choose>	
							</c:forEach>
							 </c:when>
							</c:choose>	
							 			<c:choose>
									    <c:when test="${empType=='1099'}">
										     <c:forEach var="bank" items="${conBanklist}">
										     		<input type="hidden" id="txtAccount2${bank.payment_id}"	value="${bank.accountNo}">
													<input type="hidden" id="txtBank2${bank.payment_id}" value="${bank.bank_name}">
													<input type="hidden" id="txtswift2${bank.payment_id}" value="${bank.swift_Code}">
													<input type="hidden" id="txtiban2${bank.payment_id}" value="${bank.iban_Code}">
													<input type="hidden" id="txtrouting2${bank.payment_id}" value="${bank.bankRoutingNo}">
													<input type="hidden" id="file2${bank.payment_id}" value="${bank.bankfilename}">
													<input type="hidden"  id="id2" name="payment_idb" value="${bank.payment_id}">
										  
										      <div class="form-group row">
													<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Account Number</label>
													<div class="col-sm-4">
														<input class="form-control"  id='txtAccount${bank.payment_id}'  apayment_idmplete="off"
														name="txtAccount" placeholder='Enter Account Number' value="${bank.accountNo}"
														pattern="\d*" minlength="9" maxlength="20" title="Enter Only digits" type='text'
														required>	
													</div>
											 </div>
											<div class="form-group row">
													<label  for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Bank Name</label>
													<div class="col-sm-4">
														<input  class="form-control" id='txtBank${bank.payment_id}'  name="txtBank" placeholder='Enter Bank Name'
														pattern="[a-zA-Z][a-zA-Z\s]*" title="Enter only Characters" type='text' value="${bank.bank_name}" required>
													</div>
											</div>
										
									         	<div class="form-group row">
													<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Bank Swift Code</label>
														<div class="col-sm-4">
														<input class="form-control" id='txtswift${bank.payment_id}'  autocomplete="off" pattern="[A-Za-z]{4}[0-9]{7}" 
															title="Enter only Characters and numbers" value="${bank.swift_Code}"
														name="txtswift" placeholder='Bank Swift Code' type='text' >
													</div>
												</div>
												
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>IBAN code</label>
														<div class="col-sm-4">
														<input class="form-control" id='txtiban${bank.payment_id}'  autocomplete="off" pattern="[A-Za-z]{4}[0-9]{7}" 
															title="Enter only Characters and numbers" value="${bank.iban_Code}"
														name="txtiban" placeholder='IBAN code' type='text'>
													</div>
												</div>
										
									           	 <div class="form-group row">
													<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Bank Routing Number</label>
													<div class="col-sm-4">
														<input class="form-control"  id='txtrouting${bank.payment_id}'  autocomplete="off"
														name="txtrouting" placeholder='Bank Routing Number' value="${bank.bankRoutingNo}"
														pattern="\d*" minlength="9" maxlength="9" title="Enter Only digits" type='text'
														required>
													</div>
												</div>
									 <div class="form-group row">
									     <label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Bank Form</label>
									 	<div class="col-sm-4">
									 	  <input type="file" id='bfile${bank.payment_id}' name="bfile2" value="${bank.bankfilename}" onchange="ValidateSize(this)"><span id="bankDoc">
									 	<c:choose>
	                                    <c:when test="${empty bank.bankfilename}">
									    <a>NA</a>
							    	    </c:when>
							    	   <c:otherwise>
							                <span style="color: blue" onclick="downloadDocument('${bank.bankfilename}','bank_file_name')">${bank.bankfilename}</span>
							            </c:otherwise>
									    </c:choose>
									       </div>
								       </div>
							</c:forEach>	
							
											<div class="form-group row" id="addbank">
                                   			 <label for="inputPassword" class="col-sm-4 control-label">Add Other Bank Details</label>
                                  			 <div class="text-center ml-3">
                                  			 <div class="input-group-btn addButton">
                                                <button class="btn btn-success" type="button" onclick="addfieldsBank();"> <i class="fa fa-plus" aria-hidden="true"></i></button>
                                            </div>
                                            </div>
                                            </div>
                                        <div id="addfieldsBank"></div>
							 </c:when>
							</c:choose>
								
											<div class="text-center ml-3" id="deposit">										
												<button type="submit" id="submitid" class="btn btn-default" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" disabled>Update</button>
												<input type="button" value="Back" onclick="goBack()" class="btn btn-default btn-sm"
													style="padding: 7px; background-color: grey; color: white; line-height: 0.728571;"> 
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
			
			<form action="searchlist" method="post" id="bformid">
		    <input type="hidden" name="semp_type" value="${semp_type}"> <input
			type="hidden" name="susername" value="${susername}"> <input
			type="hidden" name="sfullname" value="${sfullname}"> <input
			type="hidden" name="spendingdocs" value="${spendingdocs}"> <input
			type="hidden" name="s_subtype" value="${s_subtype}">
			</form>
		</div>	
    <!-- Javascripts-->

<script src="resources/js/js/jquery-2.1.4.min.js"></script>
<script src="resources/preDefined/goback.js"></script>
	<script>
/* function editbank_info(id) {
	//alert("yes"+id);
	var pmode=$('#paymentMode').val();
		    if(pmode=='Cheque')
		    {
		    //	 $("#bnkchq").hide();
			}
		    else if(pmode=='DirectDeposit')
		    {
		 	document.getElementById('txtAccount'+id).removeAttribute('readonly'); 
		    document.getElementById('txtBank'+id).removeAttribute('readonly');
		    document.getElementById('txtswift'+id).removeAttribute('readonly');
		    document.getElementById('txtiban'+id).removeAttribute('readonly');
		    document.getElementById('txtrouting'+id).removeAttribute('readonly');
		    $('#file'+id).show();
		    $("#deposit").show();
		    $("#back").hide();
			}
		    $("#deposit").show();
		    $("#back").hide();    
		    $('#editbank_hide'+id).hide();
		    
} */
</script>
<script>
/* function editbank_info99(id) {
	//alert("yes"+id);
	var emp_type= $('#emp_type').val();
	if(emp_type=='1099'){
		
		    //$('#tblpkb'+id).val(tblpkb);
		    document.getElementById('txtAccount'+id).removeAttribute('readonly'); 
		    document.getElementById('txtBank'+id).removeAttribute('readonly');
		    document.getElementById('txtswift'+id).removeAttribute('readonly');
		    document.getElementById('txtiban'+id).removeAttribute('readonly');
		    document.getElementById('txtrouting'+id).removeAttribute('readonly');
		    $('#file'+id).show();
		    $("#addbank").show();
		    $("#deposit").show();
		    $("#editbank99"+id).hide();
		    $("#back").hide();
	 }
} */
/* function editven_info(id) {
//document.getElementById('vendorid').removeAttribute('readonly');	 
// document.getElementById('vendorid').disabled=false;
document.getElementById('paymentMode').removeAttribute('readonly');
document.getElementById('paymentMode').disabled=false;
 $("#deposit").show();
   $("#back").hide();
   $("#editven_hide").hide();
} */
</script>
<script type="text/javascript">
		var pmode=$('#pmode').val();
		//alert(pmode);
        $("#paymentMode").change(function () {
        	 if ($(this).val() == pmode) {
                window.location.reload();
             //   $("#addbank").hide();
                document.getElementById('submitid').disabled=true;
             }
        	 else if (($(this).val() != pmode)&&($(this).val()=="DirectDeposit")) {
                $("#Bank").show();
                document.getElementById('txtAccount').required=true;
                document.getElementById('txtBank').required=true;
                document.getElementById('txtrouting').required=true;
              //  $("#addbank").hide();
            } else {
                $("#Bank").hide();
                document.getElementById('submitid').disabled=false;
                document.getElementById('txtAccount').required=false;
                document.getElementById('txtBank').required=false;
                document.getElementById('txtrouting').required=false;
               // $("#addbank").hide();
            }
        });
        
        $("#paymentMode").change(function () {
            if ($(this).val() == "Cheque") {
                $("#bnkchq").hide();
            } else if($(this).val() == "Other") {
                $("#bnkchq").hide();
            } else{
            	 //$("#Bank").show();
            }
        });
</script>
<script>
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
var value = 0;
var max_limit = 3;
function addfieldsBank() {
	value++;
//	$('#bankbtncount').val(value);
	//alert(vbval);
    var objTo = document.getElementById('addfieldsBank');
    var divtest = document.createElement("div");
	divtest.setAttribute("class", "form-group removeclass"+value);
	var rdiv ='removeclass'+value;
    divtest.innerHTML = '<div><div class="form-group row"><label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Account Number</label><div class="col-sm-4"><input class="form-control"  id="acc_name"  name="acc_name'+value+'"  pattern="[0-9]+" minlength="9"  maxlength="15" placeholder="Enter Account Number"  minlength="9" title="Enter Only digits" type="text" required><input type="hidden" value="'+value+'" name="bankbtncount"></div><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="remove_add_fieldsV('+value+');"><i class="fa fa-minus" aria-hidden="true"></i></button></div></div><div class="form-group row"><label for="inputPassword" class="col-sm-4 control-label"><span style="color:red;">*</span>Bank Name</label><div class="col-sm-4"><input class="form-control"  id="bank_name" name="bank_name'+value+'" placeholder="Bank Name" pattern="[a-zA-Z]+[ ][a-zA-Z]+" minlength=2 title="Enter Only Characters" type="text" required></div></div><div class="form-group row"><label for="inputPassword" class="col-sm-4 control-label"><Span style="color:black;"></Span>Bank Swift Code</label><div class="col-sm-4"><input class="form-control"  id="swift_code"  name="swift_code'+value+'" placeholder="Bank Swift Code"   title="Enter only Characters and numbers" type="text"></div></div><div class="form-group row"><label for="inputPassword" class="col-sm-4 control-label"><Span style="color:black;"></Span>IBAN code</label><div class="col-sm-4"><input class="form-control"  id="ibank_code"  name="ibank_code'+value+'" placeholder="IBAN code" title="Enter Only digits" type="text"></div></div><div class="form-group row"><label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Bank Routing Number</label><div class="col-sm-4"><input class="form-control"  id="bank_routing"  name="bank_routing'+value+'" placeholder="Bank Routing Number" pattern="[0-9]+" minlength="9"  maxlength="9" title="Enter Only digits" required></div></div><div class="form-group row"><label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Bank Form</label><div class="col-sm-4"><input type="file" id="othr_bfile" name="othr_bfile'+value+'" onchange="ValidateSize(this)"></div></div></div><div class="clear"></div>';
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
$('#txtAccount').on('keyup', function() {
	 if($('#txtAccount').val()==$('#txtAccount1').val())
	{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
  });
$('#txtBank').on('keyup', function() {
	 if($('#txtBank').val()==$('#txtBank1').val())
	{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
  });
$('#txtswift').on('keyup', function() {
	 if($('#txtswift').val()==$('#txtswift1').val()){
		 document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
  });
$('#txtiban').on('keyup', function() {
	 if($('#txtiban').val()==$('#txtiban1').val())
		 {document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
  });
$('#bank_amount').on('keyup', function() {
	 if($('#bank_amount').val()==$('#bank_amount1').val())
		 {document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
  });
$('#txtrouting').on('keyup', function() {
	 if($('#txtrouting').val()==$('#txtrouting1').val())
		 {document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
  });

/* $('input[type="file"]').change(function(e){
	var fileName = e.target.files[0].name;
	alert(fileName);
}); */
$('#bfile1').on('change', function() {
	 if($('#bfile1').val()==$('#file1').val())
		 {document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
  });
</script>
<script type="text/javascript">
$("[id='id2']").each(function(){
	var id=$(this).val();
$('#txtAccount'+id).on('keyup', function() {
	 if($('#txtAccount'+id).val()==$('#txtAccount2'+id).val())
	{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
  });
$('#txtBank'+id).on('keyup', function() {
	 if($('#txtBank'+id).val()==$('#txtBank2'+id).val())
	{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
  });
$('#txtswift'+id).on('keyup', function() {
	 if($('#txtswift'+id).val()==$('#txtswift2'+id).val()){
		 document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
  });
$('#txtiban'+id).on('keyup', function() {
	 if($('#txtiban'+id).val()==$('#txtiban2'+id).val())
		 {document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
  });
$('#bank_amount'+id).on('keyup', function() {
	 if($('#bank_amount'+id).val()==$('#bank_amount2'+id).val())
		 {document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
  });
$('#txtrouting'+id).on('keyup', function() {
	 if($('#txtrouting'+id).val()==$('#txtrouting2'+id).val())
		 {document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
  });
$('#bfile'+id).on('change', function() {
	 if($('#bfile'+id).val()==$('#file2'+id).val())
		 {document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;} 
  });
});
</script>
</body>
</html>
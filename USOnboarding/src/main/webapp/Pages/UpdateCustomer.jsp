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

/* .col-sm-2 {
	flex: 0 0 14.666667%;
    max-width: 23.666667%;
} */
</style>
<body class="sidebar-mini fixed">
<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">Update Customer</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-md-11 col-sm-12">
									<fieldset>
										<form action="/" method="post" id="updateCustomerForm" class="form-horizontal" enctype="multipart/form-data">
											<!--  <legend><i class="fa fa-line-chart"></i>Raise NC</legend>  -->
	                                        <input type="hidden" id="customerid" name="customerid" value="${customerObj.custObj.customer_id}">
	                                        
	                                         <input type="hidden" id="cust_name1" value="${customerObj.custObj.customer_name}">
	                                         <input type="hidden" id="fed_id1" value="${customerObj.custObj.fed_id}">
	                                         <input type="hidden" id="cust_phne_no1" value="${customerObj.custObj.customer_contact_no}">
	                                         <input type="hidden" id="cust_mgr_emailid1" value="${customerObj.custObj.mgr_email}">
	                                        <input type="hidden" id="line11" value="${customerObj.custAddressObj.line1}">
					    	        		<input type="hidden" id="line21"  value="${customerObj.custAddressObj.line2}">
					    	        		<input type="hidden" id="zipcode1"   value="${customerObj.custAddressObj.zipcode}">
					    	        		<input type="hidden" id="city1"   value="${customerObj.custAddressObj.city}">
					    	        		<input type="hidden" id="state1"  value="${customerObj.custAddressObj.state}">
					    	        		
	                                        <h4><b>Customer Details</b></h4> 
	                                          <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Customer Name</label>
												<div class="col-sm-4">
													<input id="cust_name" type="text" title="only alphabets are allowed" minlength="2" maxlength="100"
													autocomplete="off" placeholder="Customer Name" name="cust_name" class="form-control"  value="${customerObj.custObj.customer_name}" required>
												</div>
												<span id="custnamespan" style="color:red;"></span>
											</div>
											
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Federal ID</label>
												<div class="col-sm-4">
												<input  type="text" name="fed_id" id="fed_id" maxlength="10"
													 placeholder="Federal ID"  class="form-control" value="${customerObj.custObj.fed_id}"></input>
												</div>
											  </div> 
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Customer Person Contact No</label>
												<div class="col-sm-4">
													<input id="cust_phne_no" type="text" minlength="12" maxlength="12" title="Enter Only 123-456-7890 format"
													autocomplete="off" placeholder="Customer Person Contact No" name="cust_phne_no" class="form-control"  
													value="${customerObj.custObj.customer_contact_no}" required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Customer Manager e-mail ID</label>
												<div class="col-sm-4">
													<input id="cust_mgr_emailid" type="text" title="Enter Valid e-mail format ex:xyz@gmail.com" minlength="8" maxlength="100"
													autocomplete="off" placeholder="Customer Manager e-mail ID" name="cust_mgr_emailid" class="form-control"  
													value="${customerObj.custObj.mgr_email}"	required>
												</div>
											</div> 
											
											<h4><b>Customer Address</b></h4>
											<input type="hidden" id="addressid" name="addressid" value="${customerObj.custAddressObj.address_id}">
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-4">
													<input id="line1" type="text"  minlength="2" maxlength="80"  value="${customerObj.custAddressObj.line1}"
													 autocomplete="off" placeholder="Enter Line1" name="line1" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-4">
													<input id="line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" placeholder="Enter Line2"
													 autocomplete="off" name="line2" class="form-control"  value="${customerObj.custAddressObj.line2}">
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-4">
													<input id="city" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="City" name="city" class="form-control" value="${customerObj.custAddressObj.city}" required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-4">
													<input id="state" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="state" class="form-control"  value="${customerObj.custAddressObj.state}" required>
												</div>
											</div>
											<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"><Span
														style="color: red;">*</Span>Country</label>
													<div class="col-sm-4">
														<input id="country" type="text" minlength="2" maxlength="25"
															title="only Characters are allowed" autocomplete="off"
															placeholder="Country" name="country" class="form-control"
															required value="${customerObj.custAddressObj.country}">
													</div>
												</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-4">
													<input id="zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" 
													 autocomplete="off" placeholder="Zip Code" name="zipcode" class="form-control"  value="${customerObj.custAddressObj.zipcode}" required>
												</div>
											</div>
											
											 <input type="hidden" name="payment_terms" id="payment_terms" value="${customerObj.custObj.payment_terms}" > 
												<div class="form-group row">
													<label for="inputPassword" class="col-sm-3 control-label"
														style="margin-top: .5%;"><Span style="color: red;">*</Span>Payment Terms</label>
													<div class="col-sm-4">
														<select name="payment_term_id" class="form-control text-left"
															id="payment_term_id" required>
														</select>
													</div>
												</div>
												
											
											<input type="hidden" id="fileId" name="fileId" value="${customerObj.fileId}">
											<c:choose>
											<c:when test="${customerObj.fileType=='Customer_MSA'}">
											<div class="form-group row">
												<label for="Customer_MSA" id="Customer_MSA"	class="col-sm-3 control-label">
												<Span id="clab" style="color: red;">*</Span>Upload Customer MSA</label>
												<div class="col-sm-4">
													<span onclick="downloadDocCust('${customerObj.fileName}','Customer_MSA','${customerObj.custObj.customer_name}')" style="color: blue">${customerObj.fileName}</span><br>
													<c:if test="${not empty customerObj.startdate}">
													<label>Start Date : <span style="color: none">${customerObj.startdate}</span></label>
													</c:if>
													&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:if test="${not empty customerObj.expirydate}"><label>
													 End Date : <span style="color: none">${customerObj.expirydate}</span></label>
													</c:if>
											</div>
											<div class="col-sm-2">
												<input type="button" value="Edit" class="btn btn-default btn-sm" id="edtoff" data-toggle="modal" 
														onclick="editDocument('${customerObj.fileName}',${customerObj.fileId},'${customerObj.startdate}','${customerObj.expirydate}','Customer_MSA','${customerObj.custObj.customer_name}');"/>
												&nbsp&nbsp&nbsp&nbsp<a class="btn btn-success btn-sm"  data-toggle='modal' href='#myModalView' 
														onclick="viewDocHistory('${customerObj.fileId}','${customerObj.custObj.customer_name}','Customer_MSA');"  title="View Document History"><i class="fa fa-history"></i></a>
												</div>
												<div class="col-sm-2">
												  <!--  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp --> Exception  : <input type="checkbox" id="myCheck" name="myCheck">
												</div>
											</div>
											</c:when>
											<c:otherwise>
											<div class="form-group row">
												<label for="inputPassword"	class="col-sm-3 control-label">
												<Span style="color: red;">*</Span>Management Approval e-mail </label>
												<div class="col-sm-2">
													<span onclick="downloadDocCust('${customerObj.fileName}','Customer_MSA','${customerObj.custObj.customer_name}')" style="color: blue">${customerObj.fileName}</span>
												</div>
												<div class="col-sm-2">
														<input type="button" value="Edit" class="btn btn-default btn-sm" id="edtoff" data-toggle="modal" 
														onclick="editMailProofDocument('${customerObj.fileName}',${customerObj.fileId},'Manager_Approved_Email_CMSA','${customerObj.custObj.customer_name}');"/>
												  &nbsp&nbsp&nbsp&nbsp<a class="btn btn-success btn-sm"  data-toggle='modal' href='#myModalView' 
														onclick="viewDocHistory('${customerObj.fileId}','${customerObj.custObj.customer_name}','Manager_Approved_Email_CMSA');"  title="View Document History"><i class="fa fa-history"></i></a>
												</div>
												<div class="col-sm-2">
												   Exception  : <input type="checkbox" id="myCheck1" name="myCheck1" checked>
												</div>
											</div>
											</c:otherwise>
											</c:choose>
											
											<div class="form-group row" id="map"  style="display:none;">
												<label for="inputPassword"	class="col-sm-3 control-label">
												<Span style="color: red;">*</Span>Management Approval e-mail </label>
												<div class="col-sm-4">
													<input type="hidden" value="Manager_Approved_Email_CMSA" name="Manager_Approved_Email_CMSA" /> 
													<input type="file" id="mgr_approved_mail1" name="mgr_mail_proof_Cmsa" accept=".msg,.eml" onchange="ValidateMsgFile(this)"><br>
													<span style="color: red"></span>
												</div>
											</div>
											<div class="form-group row" id="map1"  style="display:none;">
												<label for="Customer_MSA" id="Customer_MSA"	class="col-sm-3 control-label">
												<Span id="clab1" style="color: red;">*</Span>Upload Customer MSA</label>
													 <input	type="hidden" value="Customer_MSA" name="Customer_MSA" />
												<div class="col-sm-3">
													<input type="file" id="Cust_MSA" name="Cust_MSA" onchange="ValidateSize(this)">
													<br>
												</div>
												<div class="col-sm-2" >
													<input type="text" id="from_date" class="form-control text-left"     autocomplete="off"
														title="Enter date in MM/DD/YYYY format only" name="fromdate" placeholder="Start Date" class="form-control" onkeydown="return false"> 
												</div>
												<div class="col-sm-2">
													<input type="text" id="expiry_date" class="form-control text-left"     autocomplete="off"
													title="Enter date in MM/DD/YYYY format only" name="expirydate" placeholder="End Date" class="form-control"  onkeydown="return false">
													</div>
											</div>
											
											<div class="text-center ml-3">
												<input type="button" class="btn btn-default" id="submitid" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Update"  onclick="btnClick()">
											    <a href="addCustomer" class="btn btn-default btn-sm" style="padding: 7px; background-color: grey; color: white; line-height: 0.728571;">Back</a>
											</div>
										</form>
									</fieldset>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		
	
	<!-- <div class="content-wrapper" id="listdiv"> -->
	<%-- <div class="row">
		<div class="col-md-12">
			<div class="card" id="dataTBL">
				<div class="card-body">
					<div style="text-align: center;">
					</div>
					<!-- 	<form action="" method="post"> -->
					<div style="max-width:1150px; overflow-x: auto; white-space: nowrap;" >
					<center><span><strong style="font-size:20px;color:red;">Customer Details</strong></span></center>
					<table id="customerTable" class="table table-hover table-bordered"
						style="text-align: center;">
						<thead>
							<tr>
								<th style="text-align: center">Name</th>
								<th style="text-align: center">Federal ID</th>
							     <th style="text-align: center">Address</th>
							     <th style="text-align: center">Person Contact No</th>
								<th style="text-align: center">Manager e-Mail ID</th>
								 <th style="text-align: center">Action</th>  
							
							</tr>
						</thead>
						<tbody>
					<c:forEach var="custl" items="${cutomerList}">
						 	 <tr>   
							    <td>${custl.companyName}</td>
							    <td>${custl.companyfedId}</td>
							    <td>${custl.line1}, ${custl.line2}, ${custl.city}, ${custl.state}, ${custl.zipcode}</td>
							    <td>${custl.company_contactperson}</td>
							    <td>${custl.company_mgr_email}</td>
							    <td><button	style="letter-spacing: 1px; background-color: #15aabf; color: white;"
											data-toggle="modal"
											onclick="editCustomer(${custl.companyId});">
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
					   		<table id="sampleTable2" class="table table-hover table-bordered" style="text-align:center;">
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
								style="font-size: 15px">
								<b>Document Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="editCustomerDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="efileId" name="fileId"> 
						<input type="hidden" id="fromdate1" name="fromdate1"> 
						<input type="hidden" id="expirydate1" name="expirydate1"> 
						<input type="hidden" id="custid" name="custmid" value="${customerObj.custObj.customer_id}"> 
						
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
					<form class='form form-horizontal validate-form'
						action="editMailProofCustomerDocument" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
						<input type="hidden" id="msgefileId" name="msgefileId"> 
						<input type="hidden" id="msgefileType" name="msgefileType">
						<input type="hidden" id="msgcustid" name="msgecustmid" value="${customerObj.custObj.customer_id}"> 
						
						<div class="modal-body">							
					   <div class="form-group row">
								<label class="col-lg-3 control-label"><Span
									style="color: red;"></Span>Upload File :</label>
								<div class="col-lg-6">
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
	
	  <div id="myModal" class="modal"
				style="height: 80px; width: 400px; align-items: center; top: 40%; left: 40%;">
				<div class="modal-content" id="popup-modal"
					style="background: #205081; color: #fff !important;">
						<input type="hidden" id="customerid1">
					<p id="addsummaryfields" style="color: #fff" class="text-center"></p>
					<button class="close" id="closePopupSave" style="color: #fff">
						<i class="far fa-times-circle"></i>
					</button>
				</div>
		</div>
	</div>
</div>
</div>
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
$("#from_date").datepicker({
}).on('changeDate', function(selected) {
	 /* var minDate = new Date(selected.date.valueOf());
     $('#expiry_date').datepicker('setStartDate', minDate); */
     $("#expiry_date").attr("disabled", false);
     $('#saveCustomerForm').formValidation('revalidateField', 'from_date');
});	
$("#expiry_date").datepicker({
}).on('changeDate', function(selected) {
       /*  var minDate = new Date(selected.date.valueOf());
        $('#from_date').datepicker('setEndDate', minDate); */
        $('#saveCustomerForm').formValidation('revalidateField', 'expiry_date');
});

$("#from_date").on('change', function(){
	   var fromdate1=$('#from_date').val();
	   if(fromdate1!=""){
	     var minDate=new Date(fromdate1);
	     $('#expiry_date').datepicker('setStartDate', minDate);
	   }else{
		    $("#expiry_date").attr("disabled", true);
		    $('#expiry_date').val('').datepicker('update');
	   }
});
$("#expiry_date").on('change', function(){
	   var expirydate1=$('#expiry_date').val();
	   if(expirydate1!=""){
	     var minDate=new Date(expirydate1);
	     $('#from_date').datepicker('setEndDate', minDate);
	   }
});
/* $("#fromdate,#expirydate").datepicker({
	
}); */
var table = $('#sampleTable2').DataTable({
	 "order": [[0, "desc"]],
    bLengthChange: true,
    paging: true
 });
 
function viewDocHistory(docId,custName,fileType){	
	getsesVal().done(function(data){
		  if(data!=""){
	$.ajax({
    	type : "get",
        url  : "getCustomerDocumentHistiryById",
        contentType:"application/json",
        cache : false,
        async : false,
        data:{"docId":docId},
        success  : function(response){
        	 if (table) table.clear();
        	 $('#sampleTable2').dataTable().fnClearTable();
        	  	if(response!=""){
            	  for(var i=0;i<response.length;i++){
            		//  alert(response[i].startdate);
            			var fname=response[i].file_name;
	 		          	var encoded = encodeURIComponent(fname);
                       table.row.add([
                    	''+response[i].document_id+'',
                    	'<a href="downloadocs?filetype='+response[i].filetype+'&filename='+encoded+'&customerName='+custName+'" style="color:blue">'+response[i].file_name+'</a>',
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

function downloadDocCust(fname,ftype,cname){
	getsesVal().done(function(data){
		  if(data!=""){
	var encoded = encodeURIComponent(fname);	
	window.location.href="downloadocs?filename="+encoded+"&filetype="+ftype+"&customerName="+cname;
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
		
	}
		  }else{
				 window.location.href="loginpage";
			}
		});
 }
$('#EditDocumentModal').on('hidden.bs.modal', function(){    
	$('#fromdate,#expirydate').val('').datepicker('update');
	$('#fromdate,#expirydate').datepicker('setStartDate', null);
	$('#fromdate,#expirydate').datepicker('setEndDate', null);
});
function editDocument(fname,id,stdate,expdate,ftype,custname){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#esubmitid').attr('disabled',true);
	//alert("expdate"+expdate);
    $('#efileId,#editFile').val('');
    
    /* var $input = $('onclick="downloadDocCust('"+fname+"','"+ftype+"','"+custname+"')"');
    $input.appendTo($("#efileName")); */
    $('#efileName').text('');
    $('#efileId').val(id);
   // $('#efileName').text(fname);
    $('#fromdate1').val(stdate);
    $('#expirydate1').val(expdate);
    $('#fromdate').val(stdate);
    $('#expirydate').val(expdate);
    var encoded = encodeURIComponent(fname);
	//  $('#efileName').append('<span onclick="downloadDocCust('+fname+','+ftype+','+custname+')" style="color:blue">'+fname+'</span>');
	//  node.innerHTML = '<span >'+fname+'</span>';
	 // node.innerHTML = '<a href="downloadocs?filetype='+ftype+'&filename='+encoded+'&customerName='+custname+'" style="color:blue">'+fname+'</a>';
	  $('#efileName').append('<a href="downloadocs?filetype='+ftype+'&filename='+encoded+'&customerName='+custname+'" style="color:blue">'+fname+'</a>');
	 // document.getElementById('efileName').appendChild(node);
   /*  $("#fromdate,#expirydate").datepicker({
    	}); */ 
	  var title="";
 	 if(ftype=='Customer_MSA'){
 		title="Customer MSA ";	
 	 }else if(ftype=='Manager_Approved_Email_CMSA'){
 		title="Manager Approved e-mail(CMSA) ";
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
 	
 	$('h5').text(title+"Document Details");	 	  	
    $('#EditDocumentModal').modal('show');
		  }else{
				 window.location.href="loginpage";
			}
		});
};

function editMailProofDocument(fname,id,ftype,custname){
	getsesVal().done(function(data){
		  if(data!=""){
    $('#msgefileId,#msgeditFile,#msgefileType').val('');
    $('#msgefileName').text('');
    $('#msgefileId').val(id);
    $('#msgefileType').val(ftype);
    var encoded = encodeURIComponent(fname);
	$('#msgefileName').append('<a href="downloadocs?filetype='+ftype+'&filename='+encoded+'&customerName='+custname+'" style="color:blue">'+fname+'</a>');
	 var title="";
 	 if(ftype=='Customer_MSA'){
 		title="Customer MSA ";	
 	 }else if(ftype=='Manager_Approved_Email_CMSA'){
 		title="Manager Approved e-mail(CMSA) ";
 	 }	
 	$('h5').text(title+"Document Details");	 	
	$('#EditMailProofDocumentModal').modal('show');
		  }else{
				 window.location.href="loginpage";
			}
		});
};



/* $("#fromdate").datepicker({
	onSelect: function(selected) {
		alert("********"+$('#fromdate').val()+"**********"+selected)
		 if($('#fromdate').val()==selected)
		    {$('#esubmitid').attr('disabled',true);}else{$('#esubmitid').attr('disabled',false);}
	 }
  });

$("#expirydate" ).datepicker({
	onSelect: function(selected) {
		 if($('#expirydate').val()==selected)
		    {$('#esubmitid').attr('disabled',true);}else{$('#esubmitid').attr('disabled',false);}
	 }
 }); */
 /* $('#expirydate').on('change', function() {
    if($('#expirydate').val()==$('#expirydate1').val())
           {$('#esubmitid').attr('disabled',true);}else{$('#esubmitid').attr('disabled',false);} });
	$('#fromdate').on('change', function() {
    if($('#fromdate').val()==$('#fromdate1').val())
           {$('#esubmitid').attr('disabled',true);}else{$('#esubmitid').attr('disabled',false);} }); */
function btnClick(){
     getsesVal().done(function(data){
        		   if(data!=""){
	$('#updateCustomerForm').formValidation('validate');
	if( !$('#updateCustomerForm').data('formValidation').isValid())
		 {
		 }
	else{
		  //document.getElementById("updateCustomerForm").submit();
		        $("#submitid").attr("disabled", true);
				var form = $('#updateCustomerForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "updateCustomer", //this is the submit URL
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
	var customerid=$('#customerid').val();
	window.location.href="editCustomer?id="+customerid+"";
		  }else{
				 window.location.href="loginpage";
			}
		});
});
</script>
<script type="text/javascript">
$('#updateCustomerForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {	       
    	cust_name: {
            validators: {
            	notEmpty: {
                    message: 'Customer Name is mandatory'
                }, 
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Customer Name must be more than 2 and less than 100 characters long. '
                },
                regexp: {
                	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                     message: 'Customer Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
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
                        if (value.length < 10 || value.length > 10) {
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
                            }
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
                    max: 25,
                    message: 'Line2 should have more than 2 and less than 80 characters '
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 accepts alpha numerics '
                },
            }
        },
        line2 : {
            validators: {
            	/*  notEmpty: {
                    message: 'Line1 is mandatory'
                }, */
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line2 should have more than 2 and less than 80 characters '
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 accepts alpha numerics '
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
   cust_mgr_emailid:{
            validators: {
            	notEmpty: {
                    message: 'Customer Manager e-mail ID is mandatory'
            	 },
                 stringLength: {
                 min: 8,
                 max: 100,
                 message: 'Customer Manager e-mail must be more than 8 and less than 100 characters long'
                },
                  regexp: {
                  regexp: /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9\-]+\.)+([a-zA-Z0-9\-\.]+)+([,]([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9\-]+\.)+([a-zA-Z0-9\-\.]+))*$/,
             	//  regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
             	 message: 'Please enter valid e-mail ID'
             }
           }
      },
   cust_phne_no:{
            validators: {
            	notEmpty: {
                    message: 'Customer Contact Number is mandatory'
            	 },
                 stringLength: {
                 min: 12,
                 max: 12,
                 message: 'Customer Contact Number must be more 10 or Not less than 10 Numbers long'
                }
            }
        },
        Cust_MSA: {
        	  enabled: false,
            validators: {
            	notEmpty: {
                    message: 'Customer MSA is mandatory'
                		}/* ,
                	file: {
   					        extension: 'doc,docx,pdf,zip',
                            type: 'application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/zip',
                            maxSize: 50*1024*1024,
         					message: 'The selected file type is not valid or file size greater than 50MB'
                       } */
  			    }
   			},
   		 fromdate: {
	            validators: {
	                regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please enter Start Date in MM/DD/YYYY format. '
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'Start Date is not a valid, please enter in MM/DD/YYYY format. '
	                }
	            }
	        },
	     expirydate: {
	            validators: {
	                regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please enter End Date in MM/DD/YYYY format. '
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'End Date is not a valid, please enter in MM/DD/YYYY format. '
	                }
	            }
	        },
	        payment_term_id : {
	            validators: {
	            	notEmpty: {
	                    message: 'Payment terms is mandatory'
	                }
	            }
	        },
   	mgr_mail_proof_Cmsa: {
   		    enabled: false,
            validators: {
            	notEmpty: {
                    message: 'Manager Approved Eamil proof is mandatory'
                		}/* ,
                		file: {
   					        extension: 'msg,eml',
                            type: 'application/msg,application/eml',
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
			//   alert("**if*1**"+checkBox.checked);
		   $("#map").show();
		   $("#clab").hide();
		   $("#Cust_MSA").val('');
		   $('#updateCustomerForm').bootstrapValidator('enableFieldValidators', 'mgr_mail_proof_Cmsa',true);
		   $("#submitid").attr("disabled", false);
		   $('#updateCustomerForm').bootstrapValidator('enableFieldValidators','Cust_MSA',false);
		   $("#Cust_MSA,#edtoff").prop("disabled", true);
       } else if(checkBox.checked == false){
      // alert("**else**1"+checkBox.checked);
           $("#map").hide();
	       $("#clab").show();
		   $("#submitid").attr("disabled", true);
	       $("#mgr_approved_mail").val('');
    	   $('#updateCustomerForm').bootstrapValidator('enableFieldValidators', 'Cust_MSA',true); 
    	   $('#updateCustomerForm').bootstrapValidator('enableFieldValidators','mgr_mail_proof_Cmsa',false);
    	   $("#Cust_MSA,#edtoff").prop("disabled", false);
       } 
     })
 .on('click', '[name="myCheck1"]', function(e) {
    var checkBox = document.getElementById("myCheck1");
		   if (checkBox.checked == true){
		//	alert("**if**2*"+checkBox.checked);
		   $("#map1").hide();
		   $("#clab1").hide();
		   $("#Cust_MSA").val('');
		   $("#submitid").attr("disabled", true);
		   $('#updateCustomerForm').bootstrapValidator('enableFieldValidators','Cust_MSA',false);
		   $('#updateCustomerForm').bootstrapValidator('enableFieldValidators', 'mgr_mail_proof_Cmsa',true);
		   $("#mgr_approved_mail1").prop("disabled", false);
       } else if(checkBox.checked == false){
     //  alert("**else**2*"+checkBox.checked);
           $("#map1").show();
	       $("#clab1").show();
	       $("#mgr_approved_mail1").val('');
	       $("#submitid").attr("disabled", false);
    	   $('#updateCustomerForm').bootstrapValidator('enableFieldValidators', 'Cust_MSA',true); 
    	   $('#updateCustomerForm').bootstrapValidator('enableFieldValidators','mgr_mail_proof_Cmsa',false);
    	   $("#mgr_approved_mail1").prop("disabled", true);
       } 
     });
</script>
<script type="text/javascript">
document.getElementById('submitid').disabled=true;
   
$('#cust_name').on('keyup', function() {
	if($('#cust_name').val()==$('#cust_name1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#fed_id').on('keyup', function() {
	if($('#fed_id').val()==$('#fed_id1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#cust_phne_no').on('keyup', function() {
	if($('#cust_phne_no').val()==$('#cust_phne_no1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#cust_mgr_emailid').on('keyup', function() {
	if($('#cust_mgr_emailid').val()==$('#cust_mgr_emailid1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });

$('#line1').on('keyup', function() {
	if($('#line1').val()==$('#line11').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#line2').on('keyup', function() {
	if($('#line2').val()==$('#line21').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#zipcode').on('keyup', function() {
	if($('#zipcode').val()==$('#zipcode1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#city').on('keyup', function() {
	if($('#city').val()==$('#city1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}  });
$('#state').on('keyup', function() {
	if($('#state').val()==$('#state1').val())
		{document.getElementById('submitid').disabled=true;}else{document.getElementById('submitid').disabled=false;}   });		

$('form').on('reset', function() {
	$('#updateCustomerForm').data('formValidation').resetForm();
	});
$('input[name="cust_phne_no"]').mask('999-999-9999');
$('input[name="fed_id"]').mask('99-9999999');
$("#cust_mgr_emailid").blur(function () {
    $('#updateCustomerForm').bootstrapValidator('revalidateField', 'cust_mgr_emailid');
});
$("#cust_phne_no").blur(function () {
    $('#updateCustomerForm').bootstrapValidator('revalidateField', 'cust_phne_no');
});
$("#fed_id").blur(function () {
    $('#updateCustomerForm').bootstrapValidator('revalidateField', 'fed_id');
});

window.onload=function(){
	$.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/text",
		url : "getallpaymentterms",
		success : function(response) {
		      $('#payment_term_id').empty(); 
			  const obj = JSON.parse(response);
				$('#payment_term_id').append($('<option/>').attr("value", '').text("Select Payment Terms"));
			    $.each(obj.IntuitResponse.QueryResponse.Term, function (index, value) {  
				$('#payment_term_id').append($('<option/>').attr("value",value.Id).text(value.Name));
			 });
		}
	}).done(function() {
		var payment_terms=$("#payment_terms").val();
		var $dropdown3 = $("select[name='payment_term_id']");
		$dropdown3.find('option[value="' + payment_terms + '"]').attr('selected', true);
	});
};
var custnameInput = document.getElementById('cust_name');
var  custnametimeout= null;
custnameInput.onkeyup = function (e) {
clearTimeout(custnametimeout);
custnametimeout = setTimeout(function () {
	 var cust_name=$('#cust_name').val();
	 getsesVal().done(function(data){
 		if(data!=""){
	    if(cust_name==""){
	    	 $('#custnamespan').text('');
	    	 $("#submitid").attr("disabled", false);
	    }else{
	    var regex = new RegExp("^(?!\s\/&.,_-+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &.,_\/-]*)?$");
	    if(!regex.test(cust_name)){
	    	  // $('#emailspan').text("Please enter valid number");
	    	   $("#submitid").attr("disabled", true);
	    }else{
	    	 $.ajax({
	    		   	type : "GET",
	    		       asyn : false,
	    		       contentType: "text/plain", // NOT dataType!
	    		       url  : "checkCustomerName?cust_name="+cust_name+"",
	    		       success  : function(response){
	    		    	   if(response=='Exist'){
	    		    		   $('#custnamespan').text("Customer Name already exists");
	    		    		   $("#submitid").attr("disabled", true);
	    		    	   }else{
	    		    		   //$('#emailspan').text("Email id not available");
	    		    		   $('#custnamespan').text('');
	    		    		   $("#submitid").attr("disabled", false);  
	    		    	   }
	    		         }
	    			 });
	         }
	    }
 	 }else{
			 window.location.href="loginpage";
		 }
    });
}, 500);
};
</script> 
</body>
</html>
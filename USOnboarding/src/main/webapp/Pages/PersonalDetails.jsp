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
						<center><h5 class="card-header">Add Personal Details</h5></center>
							<div class="card-body">
								<div class="row">
								<div class="col-md-11 col-sm-12">
									<fieldset>
										<form action="/" method="post" id="savePersonalDetailsForm" class="form-horizontal" enctype="multipart/form-data" autocomplete="off">
											<!--  <legend><i class="fa fa-line-chart"></i>Raise NC</legend>  -->
	                                        <h4><b>Personal Details</b></h4>
	                                        <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>	Title:</label>
												 <div class="col-sm-2">
													 <select name="titleName" id="titleName" class="form-control" required>
													 <option value="">Select Title</option>
													<option value="Mr.">Mr.</option>
													<option value="Mrs.">Mrs.</option>
													<option value="Miss">Miss</option>
													<option value="Ms.">Ms.</option>
													<option value="Dr.">Dr.</option>
												  </select>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>First Name</label>
												<div class="col-sm-4">
													<input id="firstName" type="text"  autocomplete="off"  autocomplete="off" minlength="2" maxlength="40"
													 placeholder="First Name" name="firstName" class="form-control"  required>
												</div><!--  -->
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Middle Name</label>
												<div class="col-sm-4">
													<input id="middleName" type="text"  minlength="1" maxlength="40"
													title="only alphabets are allowed" 
													 placeholder="Middle Name" name="middleName" class="form-control">
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Last Name</label>
												<div class="col-sm-4">
													<input id="familyName" type="text" minlength="1" maxlength="40"
													title="only alphabets are allowed" 
													 placeholder="Last Name" name="familyName" class="form-control"  required>
												</div>
											</div> 
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Father's Name</label>
												<div class="col-sm-4">
													<input id="fatherName" type="text"  minlength="2" maxlength="40"
													 placeholder="Father's Name" name="fatherName" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Nationality</label>
												<div class="col-sm-4">
													<input id="nationality" type="text"  minlength="2" maxlength="40"
													 placeholder="Nationality" name="nationality" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Date Of Birth</label>
											<div class="col-sm-4">
												<input type="text" id="dob" class="form-control text-left"     autocomplete="off"
												title="Enter date in MM/DD/YYYY format only" name="dob" 
												placeholder="Date Of Birth" class="form-control" required onkeydown="return false" >
												
											</div>
											</div>
											
											 <div class="form-group row">
											<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Gender</label>
											   <div class="col-sm-4">
											   		<label>Male</label>&nbsp;<input type="radio" name="genderType" value="Male" required/>&nbsp;<label>Female</label>&nbsp;<input type="radio" name="genderType" value="Female" />
													 <br>
												</div>
										    </div>
											
											<div class="form-group row" >
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>SSN Number</label>
												<div class="col-sm-4">
													<input id="ssn_emp"  type="text"  autocomplete="off"
													 placeholder="SSN Number" name="ssn_emp" class="form-control" required>
													<span id="ssnshow" style="color: red;"></span>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Contact Telephone No.(Specify Location Codes)</label>
												<div class="col-sm-4">
													<input id="contactTeleNo" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Contact Telephone No" name="contactTeleNo" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Mobile</label>
												<div class="col-sm-3">
													<input id="mobile" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Mobile" name="mobile" class="form-control"  required>
												</div>
												<label for="inputPassword" class="col-sm-2 control-label"><Span style="color:red;">*</Span>Email Address</label>
												<div class="col-sm-3">
													<input id="email" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Email Address" name="email" class="form-control"  required>
												</div>
											</div>
											
											<h4><b>Contact Details</b></h4><br>
											<h5><b>Current Residential Address</b></h5>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-5">
													<input id="line1" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="line1" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-5">
													<input id="line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" placeholder="Enter Line2"
													 autocomplete="off" name="line2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-5">
													<input id="city" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="City" name="city" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-5">
													<input id="state" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="state" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-5">
													<input id="zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" 
													 autocomplete="off" placeholder="Zip Code" name="zipcode" class="form-control"  required>
												</div>
											</div> 
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Period of Stay</label>
												<div class="col-sm-3">
													<input id="fromDate" type="text" placeholder="From Date" name="fromDate" class="form-control" onkeydown="return false" required>
												</div>
												<div class="col-sm-3">
													<input id="toDate" type="text"  placeholder="To Date" name="toDate" class="form-control" disabled onkeydown="return false" required>
												</div>
											</div>
											<!--  <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Previous/Permanent Residential Address</label>
												 <div class="col-sm-4">
												  <input type="checkbox" id="myCheck" name="myCheck">
												  <span style="text-align:left;color:grey;font-size:small;vertical-align:top;">click to copy current residential address</span>
											</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Address</label>
												<div class="col-sm-4">
													<textarea id="prevAddress" type="text"  minlength="2" maxlength="256" 
													 autocomplete="off" placeholder="Complete Address with ZIP code" name="prevAddress" class="form-control"  required></textarea>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Period of Stay</label>
												<div class="col-sm-3">
													<input id="prevfromDate" type="text" placeholder="From Date" name="prevfromDate" class="form-control"  required>
												</div>
												<div class="col-sm-3">
													<input id="prevtoDate" type="text"  placeholder="To Date" name="prevtoDate" class="form-control"  required>
												</div>
											</div> -->
										<div class='form-group row' id="add">
                                       			<label for="inputPassword" class="col-sm-3 control-label">Add Other Address Details</label>
												<div class="col-xs-4">
													<button type="button" class="btn btn-success addButton">
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                        </div>
									 	<div id="addotherOther" class="form-group" style="display:none;">
												<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-5">
													<input id="othr_line1" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="othr_line1[]" class="form-control"  required>
												</div>
												<div class="col-xs-4">
													<button type="button" class="btn btn-danger removeButton">
														<i class="fa fa-minus"></i>
													</button>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-5">
													<input id="col-sm-5" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" placeholder="Enter Line2"
													 autocomplete="off" name="othr_line2[]" id="othr_line2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-5">
													<input id="othr_city" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="City" name="othr_city[]" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-5">
													<input id="othr_state" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="othr_state[]" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-5">
													<input id="othr_zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" 
													 autocomplete="off" placeholder="Zip Code" name="othr_zipcode[]" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Period of Stay</label>
												<div class="col-sm-3">
													<input id="othr_fromDate" type="text" placeholder="From Date" name="othr_fromDate[]"
													 class="form-control datepicker"  onkeydown="return false" required>
												</div>
												<div class="col-sm-3">
													<input id="othr_toDate" type="text"  placeholder="To Date" name="othr_toDate[]"
													 class="form-control datepicker"  onkeydown="return false" required>
												</div>
											</div>
											</div> 
											
											<!-- <div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-4">
													<input id="line1" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="line1" class="form-control"  required>
												</div>pattern="^[a-zA-Z\s]+$"
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-4">
													<input id="line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" placeholder="Enter Line2"
													 autocomplete="off" name="line2" class="form-control"  >
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-4">
													<input id="city" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="City" name="city" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-4">
													<input id="state" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="state" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-4">
													<input id="zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" 
													 autocomplete="off" placeholder="Zip Code" name="zipcode" class="form-control"  required>
												</div>
											</div> -->
											
											
											<%-- <center><h5><b>Previous/Permanent  Residential Address</b></h5></center>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-4">
													<input id="line1" type="text"  minlength="2" maxlength="80" 
													 autocomplete="off" placeholder="Enter Line1" name="line1" class="form-control"  required>
												</div><!-- pattern="^[a-zA-Z\s]+$" -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-4">
													<input id="line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													title="only alpha numerics are allowed" placeholder="Enter Line2"
													 autocomplete="off" name="line2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-4">
													<input id="city" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="City" name="city" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-4">
													<input id="state" type="text"  minlength="2" maxlength="25"
													title="only Characters are allowed"  
													 autocomplete="off" placeholder="State" name="state" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-4">
													<input id="zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													title="only digits are allowed" 
													 autocomplete="off" placeholder="Zip Code" name="zipcode" class="form-control"  required>
												</div>
											</div> --%>
											<div class="text-center ml-3">
												<input type="button" class="btn btn-default" id="submitid" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Submit"  onclick="btnClick()">
												<a onclick="javascript:window.location.reload();" type="reset" class="btn btn-default" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;">Reset</a>
												<a class="btn btn-default" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;" href="bgvFormsUser">Back</a> 
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
					<div style="max-width:1150px;" >
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
	</div>
	 --%>
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
<script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script src="resources/preDefined/goback.js"></script>
<script type="text/javascript">

/* $('input[type=file]').change(function(e){
	  $in=$(this);
	  $in.next().html($in.val());
	}); */
function btnClick(){
	getsesVal().done(function(data){
		if(data!=""){
	//event.preventDefault();
	$('#savePersonalDetailsForm').formValidation('validate');
	if(!$('#savePersonalDetailsForm').data('formValidation').isValid())
		 {
		 }
	else{
			  $("#btnSubmit").attr("disabled", true);
				var form = $('#savePersonalDetailsForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "savePersonalDetails", //this is the submit URL
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
		}else{ window.location.href="loginpage";}});
	}
$("#closePopupSave").click(function(event) {
	getsesVal().done(function(data){
		if(data!=""){
	$('#myModal').modal('hide');
    window.location.href="bgvFormsUser";
		}else{ window.location.href="loginpage";}});
});
</script>
<script type="text/javascript">
var othercl=0;
var MAX_OPTIONS = 3;
$('#savePersonalDetailsForm')
.on('init.field.bv', function(e, data) {
            var field  = data.field,        // Get the field name
                $field = data.element,      // Get the field element
                bv     = data.bv;           // BootstrapValidator instance

            // Create a span element to show valid message
            // and place it right before the field
            var $span = $('<small/>')
                            .addClass('help-block validMessage')
                            .attr('data-field', field)
                            .insertAfter($field)
                            .hide();

            // Retrieve the valid message via getOptions()
            var message = bv.getOptions(field).validMessage;
            if (message) {
                $span.html(message);
            }
})
.formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {	
    	  ssn_emp: {
              validators: {
              	notEmpty: {
                      message: 'SSN is mandatory'
                  }
              }
          },
          firstName: {
              validators: {
              	notEmpty: {
                      message: 'First Name is mandatory'
                  },
                  stringLength: {
                      min: 2,
                      max: 40,
                      message: 'First Name must be more than 2 and less than 40 characters long'
                  },
                  regexp: {
                    regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                     message: 'First Name accepts alphabets and Space allowed but is not at beginning or end of the word'
                  }
              }
          },
          middleName: {
              validators: {
              	/* notEmpty: {
                      message: 'First Name is mandatory'
                  }, */
                  stringLength: {
                      min: 2,
                      max: 40,
                      message: 'Middle Name must be more than 2 and less than 40 characters long'
                  },
                  regexp: {
                    regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                     message: 'Middle Name accepts alphabets and Space allowed but is not at beginning or end of the word'
                  }
              }
          },
          familyName: {
              validators: {
              	notEmpty: {
                      message: 'Last Name is mandatory'
                  },
                  stringLength: {
                      min: 1,
                      max: 40,
                      message: 'Last Name must be more than 1 and less than 40 characters long'
                  },
                  regexp: {
                  	regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                      message: 'Last Name accepts alphabets and Space allowed but is not at beginning or end of the word'
                  },
              }
          },
          fatherName: {
              validators: {
              	notEmpty: {
                      message: 'Father Name is mandatory'
                  },
                  stringLength: {
                      min: 1,
                      max: 40,
                      message: 'Father Name must be more than 1 and less than 40 characters long'
                  },
                  regexp: {
                  	regexp: /^[\p{L}]+[\p{L} ]*[\p{L}]+$/u,
                      message: 'Father Name accepts alphabets and Space allowed but is not at beginning or end of the word'
                  },
              }
          },
          nationality: {
              validators: {
              	notEmpty: {
                      message: 'Nationality is mandatory'
                  },
                  stringLength: {
                      min: 2,
                      max: 100,
                      message: 'Nationality must be more than 2 and less than 100 characters long. '
                  },
                  regexp: {
                  	 regexp: /^(?!\s)(?:([a-zA-Z])[a-zA-Z ]*)?$/,
                       message: 'Nationality accepts alphabetical and Space allowed but is not at beginning or end of the word'
                  }
              }
          }, 
          dob: {
              validators: {
                  notEmpty: {
                      message: 'DOB is required'
                  },
                  regexp: {
                  	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                      message: 'please enter DOB in MM/DD/YYYY format'
                  },
                  date: {
                      format: 'MM/DD/YYYY', 
                      message: 'DOB is not a valid, please enter in MM/DD/YYYY format'
                  }
              }
          },
          email: {
              validators: {
              	notEmpty: {
                      message: 'e-mail ID is mandatory'
                  },
                  stringLength: {
                      min: 8,
                      max: 80,
                      message: 'e-mail ID must be more than 8 and less than 80 characters long'
                  },
                  regexp: {
                  	regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
                      message: 'Please enter valid e-mail ID'
                  },
              }
          },
          mobile : {
              validators: {
              	notEmpty: {
                      message: 'Mobile number is mandatory'
                  },
                  stringLength: {
                      min: 12,
                      max: 12,
                      message: 'Mobile Number should be 10 numbers'
                  },
                  regexp: {
                     regexp: /^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$/,
                     message: 'Please enter valid Mobile Number'
                  },
              }
          },
          genderType:{
              validators: {
              	notEmpty: {
                      message: 'Please Choose Gender'
                  }
              }
          },
          titleName:{
              validators: {
              	notEmpty: {
                      message: 'Please Choose Title'
                  }
              }
          },
          contactTeleNo:{
              validators: {
              	notEmpty: {
                      message: 'Contact Number is mandatory'
              	 },
                   stringLength: {
                   min: 12,
                   max: 12,
                   message: 'Contact Number must be more 10 or Not less than 10 Numbers long'
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
                    message: 'Line1 should have minimum 2 and maximum 80 characters '
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
                   message: 'City accepts alphanumerics'
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
        fromDate: {
            validators: {
                notEmpty: {
                    message: 'From Date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'please enter From Date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY', 
                    message: 'From Date is not a valid, please enter in MM/DD/YYYY format'
                }
            }
        },
        toDate: {
            validators: {
                notEmpty: {
                    message: 'To Date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'please enter To Date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY', 
                    message: 'To Date is not a valid, please enter in MM/DD/YYYY format'
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
        'othr_fromDate[]': {
        //	enabled:false,
            validators: {
                notEmpty: {
                    message: 'From Date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'please enter From Date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY', 
                    message: 'From Date is not a valid, please enter in MM/DD/YYYY format'
                }
            }
        },
        'othr_toDate[]': {
        //	enabled: false,
            validators: {
                notEmpty: {
                    message: 'To Date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'please enter To Date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY', 
                    message: 'To Date is not a valid, please enter in MM/DD/YYYY format'
                }
            }
        }
    }
}).on('error.validator.bv', function(e, data) {
            // $(e.target)    --> The field element
            // data.bv        --> The BootstrapValidator instance
            // data.field     --> The field name
            // data.element   --> The field element
            // data.validator --> The current validator name

            data.element
                .data('bv.messages')
                // Hide all the messages
                .find('.help-block[data-bv-for="' + data.field + '"]').hide()
                // Show only message associated with current validator
                .filter('[data-bv-validator="' + data.validator + '"]').show();
 })
 .on('click', '.addButton', function() {
    		othercl++;
    		 $('#element').removeAttr('style'); 
    	     var $template = $('#addotherOther'),
    	         $clone    = $template
    	                         .clone()
    	                         .removeAttr('style')
    	                         .removeAttr('id')
    	                         .attr('data-book-index', othercl)
    	                         .insertAfter($template);

    	     // Add new field
    	     $('#savePersonalDetailsForm')
    	     .formValidation('addField', $clone.find('[name="othr_line1[]"]'))
    	     .formValidation('addField', $clone.find('[name="othr_line2[]"]'))
    	     .formValidation('addField', $clone.find('[name="othr_city[]"]'))
    	     .formValidation('addField', $clone.find('[name="othr_state[]"]'))
    	     .formValidation('addField', $clone.find('[name="othr_zipcode[]"]'))
    	     .formValidation('addField', $clone.find('[name="othr_fromDate[]"]'))
    	     .formValidation('addField', $clone.find('[name="othr_toDate[]"]'));
    	     $("input[name='othr_fromDate[]']").datepicker();
    	     $("input[name='othr_toDate[]']").datepicker();
    	 })

    	 .on('click', '.removeButton', function() {
    	     var $row  = $(this).parents('.form-group'),
    	         index = $row.attr('data-book-index');
    	        $othr_line1 = $row.find('[name="othr_line2[]"]');
    	     // Remove fields
    	     $('#savePersonalDetailsForm')    	    
    	          .formValidation('removeField', $row.find('[name="othr_line1[' + index + ']"]'))
    	          .formValidation('removeField', $row.find('[name="othr_line2[' + index + ']"]'))
    	          .formValidation('removeField', $row.find('[name="othr_city[' + index + ']"]'))
    	          .formValidation('removeField', $row.find('[name="othr_state[' + index + ']"]'))
    	          .formValidation('removeField', $row.find('[name="othr_fromDate[' + index + ']"]'))
    	          .formValidation('removeField', $row.find('[name="othr_toDate[' + index + ']"]'))
    	          .formValidation('removeField', $othr_line1);

    	     // Remove element containing the fields
    	     $row.remove();
    	       })
    	       .on('added.field.fv', function(e, data) {
    	           if (data.field === 'othr_line1[]') {
    	               if ($('#savePersonalDetailsForm').find(':visible[name="othr_line1[]"]').length >= MAX_OPTIONS) {
    	                   $('#savePersonalDetailsForm').find('.addButton').attr('disabled', 'disabled');
    	               }
    	           }
    	        })
    	        .on('removed.field.fv', function(e, data) {
    	            if (data.field === 'othr_line1[]') {
    	                 if ($('#savePersonalDetailsForm').find(':visible[name="othr_line1[]"]').length <= MAX_OPTIONS) {
    	                     $('#savePersonalDetailsForm').find('.addButton').removeAttr('disabled');
    	                 }
    	             }
    	});
</script>
<script type="text/javascript">
var date = new Date();
date.setDate(date.getDate()); 
$("#dob").datepicker({
	changeMonth:true,
	changeYear:true,
	minDate: "-70Y",
	endDate: date,
	yearRange: "1950:2000" 

}).on('changeDate', function(e) {
$('#savePersonalDetailsForm').formValidation('revalidateField', 'dob');
});
$("#fromDate").datepicker({
}).on('changeDate', function(selected) {
	 var minDate = new Date(selected.date.valueOf());
     $('#toDate').datepicker('setStartDate', minDate);
     $('#toDate').prop("disabled",false)
    $('#savePersonalDetailsForm').formValidation('revalidateField', 'fromDate');
});	
$("#toDate").datepicker({
}).on('changeDate', function(selected) {
	 	var minDate = new Date(selected.date.valueOf());
        $('#fromDate').datepicker('setEndDate', minDate);
    $('#savePersonalDetailsForm').formValidation('revalidateField', 'toDate');
});	


var textInput = document.getElementById('ssn_emp');
var timeout = null;
textInput.onkeyup = function (e) {
clearTimeout(timeout);
timeout = setTimeout(function () {
	getsesVal().done(function(data){
	if(data!=""){
	 var ssn_emp=$('#ssn_emp').val();
	    if(ssn_emp==""){
	    	 $('#ssnshow').text('');
	    	 $("#submitid").attr("disabled", false);
	    }else{
	    	var regex = new RegExp("^(?!\\b(\\d)\\1+-(\\d)\\1+-(\\d)\\1+\\b)(?!123-45-6789|219-09-9999|078-05-1120)(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$");
	    if(!regex.test(ssn_emp)){
	    	   $('#ssnshow').html("<font color=red>Not a valid SSN</font>");
	    }else{
	    	$('#ssnshow').html("<font color=#009900>Valid SSN number</font>");		 
	      }
	  }
	}else{ window.location.href="loginpage";}});
}, 500);
};
/* $("#othr_fromDate").datepicker({
}).on('changeDate', function(selected) {
	 var minDate = new Date(selected.date.valueOf());
     $('#othr_toDate').datepicker('setStartDate', minDate);
    $('#savePersonalDetailsForm').formValidation('revalidateField', 'fromDate');
});	
$("#othr_toDate").datepicker({
}).on('changeDate', function(selected) {
	 	var minDate = new Date(selected.date.valueOf());
        $('#othr_fromDate').datepicker('setEndDate', minDate);
    $('#savePersonalDetailsForm').formValidation('revalidateField', 'toDate');
}); */

$('form').on('reset', function() {
	$('#savePersonalDetailsForm').data('formValidation').resetForm();
	});
$('input[name="ssn_emp"]').mask('999-99-9999');	
$('input[name="contactTeleNo"]').mask('999-999-9999');
$('input[name="mobile"]').mask('999-999-9999');
$('input').attr("autocomplete", 'off');
</script> 
</body>
</html>
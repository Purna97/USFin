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
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
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
/* .tablepb table, p{
    font-size: 15px;
    font-family: sans-serif;
    font-weight: 500;
    line-height: 17px;
    color: black;
} */
.tableId table, tr{
    line-height: 17px;
}
.tableId .table td, .table th {
border-top:0px;
border-bottom:0px;
}
/* .childtableId table, tr{
    line-height: 17px;
}
.childtableId .table td, .table th {
border-top:0px;
border-bottom:0px;
} */

#h1bqueDiv .form-group{
    width:105%;
}
#rejDiv .form-group{
    width:105%;
}
</style>
<body>
<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
			
				<div class="row" id="immi">
					<div class="col">
						<div class="payment-pillTab">
							<ul class="nav nav-pills mb-6" id="pills-tab" role="tablist">
								<li class="nav-item" style="width: 25%; align-content: center;"><a
									class="nav-link active" id="h1bAppl" data-toggle="pill"
									href="#pills-payTenant" role="tab" aria-controls="pills-home"
									aria-selected="true">H-1B Applicant Details</a></li>
								<c:if test="${questionnarieDto.initiateObj.spouse_profile_id gt 0}">
								<c:if test="${questionnarieDto.initiateObj.marital_status eq 'Married'}">
								 <c:if test="${role == 4 && not empty questionnarieDto.spouseObj.h1questionnrie_id}">
								 <li class="nav-item" style="width: 25%; align-content: center;"><a
									class="nav-link" id="h1bspouse" data-toggle="pill"
									href="#pills-Owner" role="tab" aria-controls="pills-profile"
									aria-selected="false">Spouse Details</a></li>
								 </c:if>
								  <c:if test="${role == 1}">
								 <li class="nav-item" style="width: 25%; align-content: center;"><a
									class="nav-link" id="h1bspouse" data-toggle="pill"
									href="#pills-Owner" role="tab" aria-controls="pills-profile"
									aria-selected="false">Spouse Details</a></li>
								 </c:if>
								</c:if>	
								</c:if>	
								<c:if test="${questionnarieDto.initiateObj.kids_profile_id gt 0}">
								<c:if test="${questionnarieDto.initiateObj.kids_status eq 'Yes'}">
								<c:if test="${role == 4 && questionnarieDto.childList.size() gt 0}">
								<li class="nav-item" style="width: 25%; align-content: center;"><a
									class="nav-link" id="h1bchild" data-toggle="pill"
									href="#pills-Owner" role="tab" aria-controls="pills-profile"
									aria-selected="false">Child Details</a></li>
								</c:if>
								<c:if test="${role == 1}">
								<li class="nav-item" style="width: 25%; align-content: center;"><a
									class="nav-link" id="h1bchild" data-toggle="pill"
									href="#pills-Owner" role="tab" aria-controls="pills-profile"
									aria-selected="false">Child Details</a></li>
								</c:if>
								</c:if>	
								</c:if>
							</ul>
						</div> 
					</div>
				</div>
				<br>
			<%-- 	<input type="text" value="${role}"/> --%>
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">H-1B Questionnaire</h5>
							<div class="card-body">
					<%--  <c:if test="${questionnarieDto.applEntryList gt 0}">
					 </c:if> --%>	
		 <c:if test="${questionnarieDto.childList.size() gt 0}">	
	     <input type="hidden" id="childsSize" value="${questionnarieDto.childList.size()}">
		<div class="row" id="childTbl">
		<div class="col-md-12">
			<div class="card" id="dataTBL">
				<div class="card-body">
					<div style="text-align: center;">
					</div>
					<!-- 	<form action="" method="post"> -->
					<div style="max-width:1150px;" >
					<table id="vendorTable" class="table table-hover table-bordered"
						style="text-align: center;">
						<thead>
							<tr>
							    <!--  <th>Sl.no</th> -->
								<th>Child Name</th>
								 <th>Passport Number</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
						
								 <%--   <c:forEach var="childList" items="${questionnarieDto.childList}">
								 	<tr>
								 	<td>${childList.full_name}</td>
								 	<td>${childList.full_name}</td>
								 	<td>${childList.passport_number}</td>
								 	<td><a class="btn btn-secondary btn-sm addButton" onclick="edith1bChild('${childList.h1questionnrie_id}','${role}');" style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-edit"></i></a></td>
								 	</tr>
								 </c:forEach> --%>
								 
								  <c:forEach var="childList" items="${questionnarieDto.childList}">
								 	<tr class="child">
								 	<input type="hidden" class="chqnid" name="childqnid" id="childqnid" value="${childList.h1questionnrie_id}">
								 	<input type="hidden"  class="chpp" name="childpassport" id="childpassport${childList.h1questionnrie_id}" value="${childList.passport_number}">
								 	<%-- <td>${childList.full_name}</td> --%>
								 	
								 	<td>${childList.full_name}</td>
								 	<td><span id="child_qnid${childList.h1questionnrie_id}"></span></td>
								 	<td><a class="btn btn-secondary btn-sm addButton" onclick="edith1bChild('${childList.h1questionnrie_id}','${role}');" style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-edit"></i></a></td>
								 	</tr>
								 </c:forEach>
						
							<!-- <tr>
								<td>Child 1</td>
								<td>Male</td>
								<td>10</td>
								<td>Edit</td>
							</tr>
							<tr>
								<td>Child 2</td>
								<td>FeMale</td>
								<td>8</td>
								<td>Edit</td>
							</tr> -->
						</tbody>
					</table>
				</div>
			 </div>
		  </div>
		</div>
	  </div>
	  </c:if>
							<!-- <button type="button"
							style="margin-left: 0px; margin-right: auto; display: block; margin-top: 1%; margin-bottom: 1%;border-radius: 12px;background-color:#205081;"
							class="btn btn-primary btn-sm collapsibleh1bAppl">H-1B Applicant Details</button>
								<button type="button"
							style="margin-left: 0px; margin-right: auto; display: block; margin-top: 1%; margin-bottom: 1%;border-radius: 12px;background-color:#205081;"
							class="btn btn-primary btn-sm collapsibleh1bspouse">Spouse Details</button> -->
								<div class="row" >
								 <!-- 	<div class="col-md-8 col-sm-12"> -->
									<%-- <input type="hidden" name="emptype" id="emptype" value="${emptype}">
									<input type="hidden" name="role" id="role" value="${role}">
									<input type="hidden" name="dept" id="dept" value="${dept}"> --%>
							<fieldset>
							
							 <button type="button" id="btnh1bAppl"
							style="margin-left: 0px; margin-right: auto; display: block; margin-top: 1%; margin-bottom: 1%;border-radius: 12px;background-color:#205081;"
							class="btn btn-primary btn-sm collapsibleh1bAppl">H-1B Applicant Details</button>
							<%-- <c:if test="${role == 4}">
							<button type="button" id="btnh1bApplAdmin"
							style="margin-left: 0px; margin-right: auto; display: block; margin-top: 1%; margin-bottom: 1%;border-radius: 12px;background-color:#205081;"
							class="btn btn-primary btn-sm collapsibleh1bApplAdmin">H-1B Applicant Details</button>
							</c:if> --%>
							<button type="button" id="btnh1bspouse"
							style="margin-left: 0px; margin-right: auto; display: block; margin-top: 1%; margin-bottom: 1%;border-radius: 12px;background-color:#205081;"
							class="btn btn-primary btn-sm collapsibleh1bspouse">Spouse Details</button>
							
							<c:if test="${role == 1}">
							<button type="button" id="btnh1bchild"
							style="margin-left: 0px; margin-right: auto; display: block; margin-top: 1%; margin-bottom: 1%;border-radius: 12px;background-color:#205081;"
							class="btn btn-primary btn-sm collapsibleh1bchild">Add Child</button>
							</c:if>
							<input type="hidden" id="roleid" name="roleid" value="${role}">
										<c:choose>
										<c:when test="${not empty questionnarieDto.h1bApplObj}">
										<div id="h1bApplId" style="display:none;">
										<form action="/" class="form-horizontal" id="updateh1bqueDetailsForm" enctype="multipart/form-data">
										<input type="hidden" id="tapplh1que_id" name="tapplh1que_id">
										<input type="hidden" id="applh1que_id" name="applh1que_id" value="${questionnarieDto.h1bApplObj.h1questionnrie_id}">

										<input type="hidden" id="applrejfields" value="${questionnarieDto.rejformh1bApplObj.rejectedfields}">
										<input type="hidden" id="applrejform_status" value="${questionnarieDto.rejformh1bApplObj.form_status}">
										<input type="hidden" id="u_familyName" value="${questionnarieDto.h1bApplObj.family_name}">
										<input type="hidden" id="u_firstName" value="${questionnarieDto.h1bApplObj.first_name}">
										<input type="hidden" id="u_middleName" value="${questionnarieDto.h1bApplObj.middle_name}">
										<input type="hidden" id="u_countryofcitizenship" value="${questionnarieDto.h1bApplObj.country_citizenship}">
										<input type="hidden" id="u_telephoneNo" value="${questionnarieDto.h1bApplObj.us_phonenumber}">
										
										<input type="hidden" id="u_ssnNo" value="${questionnarieDto.h1bApplObj.ssn}">
										<input type="hidden" id="u_i94No" value="${questionnarieDto.h1bApplObj.i94_number}">
										<input type="hidden" id="u_dob" value="${questionnarieDto.h1bApplObj.dob}">
										<input type="hidden" id="u_countryofbirth" value="${questionnarieDto.h1bApplObj.country_birth}">
										<input type="hidden" id="u_cityofbirth" value="${questionnarieDto.h1bApplObj.city_birth}">
										
										<input type="hidden" id="u_highestEdu" value="${questionnarieDto.h1bApplObj.highest_education}">
										<input type="hidden" id="u_specialization" value="${questionnarieDto.h1bApplObj.specialization}">
										<input type="hidden" id="u_officialemailid" value="${questionnarieDto.h1bApplObj.official_email}">
										<input type="hidden" id="u_personalemailid" value="${questionnarieDto.h1bApplObj.personal_email}">
									<!-- 	u_familyName u_firstName u_middleName u_countryofcitizenship u_telephoneNo
										u_ssnNo u_i94No u_dob u_countryofbirth u_cityofbirth u_highestEdu u_specialization u_officialemailid u_personalemailid
										u_passportNo u_passportissueDate u_passportexpDate u_line1 u_line2 u_city  u_state u_zipcode u_permanentAddr
										u_immigrantstatus u_dateoffirstEntry u_stausoffirstEntry u_dateofrecentEntry u_stausofrecentEntry u_visastamping u_petitionfiled_behalf -->
										
										<input type="hidden" id="u_passportNo" value="${questionnarieDto.h1bApplObj.passport_number}">
										<input type="hidden" id="u_passportissueDate" value="${questionnarieDto.h1bApplObj.passport_issuedate}">
										<input type="hidden" id="u_passportexpDate" value="${questionnarieDto.h1bApplObj.passport_expirydate}">
										<input type="hidden" id="u_line1" value="${questionnarieDto.h1bApplObj.line1}">
										<input type="hidden" id="u_line2" value="${questionnarieDto.h1bApplObj.line2}">
										<input type="hidden" id="u_city" value="${questionnarieDto.h1bApplObj.city}">
										<input type="hidden" id="u_state" value="${questionnarieDto.h1bApplObj.state}">
										<input type="hidden" id="u_zipcode" value="${questionnarieDto.h1bApplObj.zipcode}">
										<input type="hidden" id="u_permanentAddr" value="${questionnarieDto.h1bApplObj.outside_us_address}">
										
										
										<input type="hidden" id="u_immigrantstatus" value="${questionnarieDto.h1bApplObj.current_non_immiStatus}">
										<input type="hidden" id="u_dateoffirstEntry" value="${questionnarieDto.h1bApplObj.firstentry_dateinUS}">
										<input type="hidden" id="u_stausoffirstEntry" value="${questionnarieDto.h1bApplObj.firstentry_statusinUS}">
										<input type="hidden" id="u_dateofrecentEntry" value="${questionnarieDto.h1bApplObj.recententry_dateinUS}">
										<input type="hidden" id="u_stausofrecentEntry" value="${questionnarieDto.h1bApplObj.recententry_statusinUS}">
										<input type="hidden" id="u_visastamping" value="${questionnarieDto.h1bApplObj.consulate_visastamping}">
										<input type="hidden" id="u_petitionfiled_behalf" value="${questionnarieDto.h1bApplObj.petitionfiled_behalf}">
										
										
											<h4><b>Candidate Details</b></h4>
											<div id="h1bqueDiv">
											<div class="row"> 
											   <c:if test="${role == 1 && questionnarieDto.rejformh1bApplObj.form_status=='Rejected' && not empty questionnarieDto.rejformh1bApplObj.rejectioncoments}">
											    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label" style="color:purple;font-weight:bold;">Rejection Comments</label>
												<div class="col-sm-6">
													<span style="color:green;font-weight:bold;">${questionnarieDto.rejformh1bApplObj.rejectioncoments}</span>
												</div>
											    </div>
											    </c:if>
										    <div class="col-md-6 col-sm-12">
										    	<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Last Name</label>
												<div class="col-sm-6">
													<input id="ufamilyName" type="text" minlength="1" maxlength="40"
													value="${questionnarieDto.h1bApplObj.family_name}"
													 autocomplete="off" placeholder="Last Name" name="ufamilyName" class="form-control"  required>
												</div>
											    </div>
											
										     <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>First Name</label>
												<div class="col-sm-6">
													<input id="ufirstName" type="text"  autocomplete="off"  autocomplete="off" minlength="2" maxlength="40"
													 placeholder="First Name" name="ufirstName" class="form-control" value="${questionnarieDto.h1bApplObj.first_name}" required>
												</div><!--  -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Middle Name</label>
												<div class="col-sm-6">
													<input id="umiddleName" type="text"  minlength="1" maxlength="40"
													 value="${questionnarieDto.h1bApplObj.middle_name}"
													 autocomplete="off" placeholder="Middle Name" name="umiddleName" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Country of Citizenship</label>
											<div class="col-sm-6">
												<input type="text" id="ucountryofcitizenship" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.h1bApplObj.country_citizenship}"
												 name="ucountryofcitizenship" placeholder="Country of Citizenship" class="form-control" required >
											</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Highest Education</label>
											<div class="col-sm-6">
												<input type="text" id="uhighestEdu" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.h1bApplObj.highest_education}"
												name="uhighestEdu" placeholder="Highest Education" class="form-control" required >
											</div>
											</div>
											 
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Telephone Number in US</label>
												<div class="col-sm-6">
													<input id="utelephoneNo" type="text"  minlength="12"	maxlength="12"
													value="${questionnarieDto.h1bApplObj.us_phonenumber}"
													 autocomplete="off" placeholder="Telephone Number in US" name="utelephoneNo" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Personal email id</label>
												<div class="col-sm-6">
													<input id="upersonalemailid" type="text"  minlength="1" maxlength="40"
													 value="${questionnarieDto.h1bApplObj.personal_email}"
													 autocomplete="off" placeholder="Personal email id" name="upersonalemailid" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Social Security Number</label>
												<div class="col-sm-6">
												<input id="dc_ussnNo" type="hidden"  value="${questionnarieDto.h1bApplObj.ssn}" name="dc_ussnNo" >
											
													<input id="ussnNo" type="text"  minlength="11" maxlength="11" 
													 placeholder="Enter SSN Number as AAA-GG-SSSS" 
													 autocomplete="off" name="ussnNo" class="form-control"  >
													<span  style="color:red;" id="uassnshow"></span>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>I-94 Number</label>
												<div class="col-sm-6">
													<input id="ui94No" type="text"  minlength="11" maxlength="11"
													 value="${questionnarieDto.h1bApplObj.i94_number}"
													 autocomplete="off" placeholder="I-94 Number" name="ui94No" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Current Non-Immigrant Status</label>
												<div class="col-sm-6">
													<select id="uimmigrantstatus" type="text"  minlength="1" maxlength="40"
													  value="${questionnarieDto.h1bApplObj.current_non_immiStatus}"
													 autocomplete="off" placeholder="Current Non-Immigrant Status" name="uimmigrantstatus" class="form-control" >
													 <option value="">Select Non-Immigrant Status</option>
													<c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}" ${nonimmistatus == questionnarieDto.h1bApplObj.current_non_immiStatus ? 'selected="selected"' : ''}>${nonimmistatus}</option>
												    </c:forEach>
													 </select>
												</div>
											</div>
										
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of First Entry Into US</label>
											<div class="col-sm-6">
												<input type="text" id="udateoffirstEntry" class="form-control text-left"     autocomplete="off" onkeydown="return false" value="${questionnarieDto.h1bApplObj.firstentry_dateinUS}"
												 name="udateoffirstEntry" placeholder="Date Of First Entry Into US" class="form-control" required >
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Most Recent Entry Into US</label>
											<div class="col-sm-6">
												<input type="text" id="udateofrecentEntry" class="form-control text-left"     autocomplete="off" onkeydown="return false" value="${questionnarieDto.h1bApplObj.recententry_dateinUS}"
												name="udateofrecentEntry" placeholder="Date Of Most Recent Entry Into US" class="form-control" required >
											</div>
											</div>
										    </div>
										    	
										    <div class="col-md-6 col-sm-12">
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="udob" class="form-control text-left"     autocomplete="off" onkeydown="return false" value="${questionnarieDto.h1bApplObj.dob}"
												name="udob" placeholder="Date Of Birth" class="form-control" required >
											</div>
											</div>
											
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Country Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="ucountryofbirth" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.h1bApplObj.country_birth}"
												name="ucountryofbirth" placeholder="Country Of Birth" class="form-control" required >
											</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="ucityofbirth" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.h1bApplObj.city_birth}"
												name="ucityofbirth" placeholder="City Of Birth" class="form-control" required >
											</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Years of Experience in IT Industry</label>
											<div class="col-sm-6">
												<input type="text" id="uyearsofItExp" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.h1bApplObj.it_experience}"
												 name="uyearsofItExp" placeholder="Years of Experience in IT Industry" class="form-control" required >
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Specialization</label>
											<div class="col-sm-6">
												<input type="text" id="uspecialization" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.h1bApplObj.specialization}"
													name="uspecialization" placeholder="Specialization" class="form-control" required >
											</div>
											</div>
											
											<!-- <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Mobile Number</label>
												<div class="col-sm-6">
													<input id="middleName" type="text"  minlength="1" maxlength="40"
													title="only alphabets are allowed" 
													 autocomplete="off" placeholder="Mobile Number" name="middleName" class="form-control"  >
												</div>
											</div> -->
										
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Official email id</label>
												<div class="col-sm-6">
													<input id="uofficialemailid" type="text"  minlength="1" maxlength="40"
													 value="${questionnarieDto.h1bApplObj.official_email}"
													 autocomplete="off" placeholder="Official email id" name="uofficialemailid" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Number</label>
												<div class="col-sm-6">
												<input id="dc_upassportNo" type="hidden"  value="${questionnarieDto.h1bApplObj.passport_number}">
													<input id="upassportNo" type="text"  minlength="9" maxlength="16"
													 autocomplete="off" placeholder="Passport Number" name="upassportNo" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Issue Date</label>
											<div class="col-sm-6">
												<input type="text" id="upassportissueDate" class="form-control text-left"     autocomplete="off" onkeydown="return false" value="${questionnarieDto.h1bApplObj.passport_issuedate}"
												 name="upassportissueDate" placeholder="Passport Issue Date" class="form-control" required >
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Expiry Date</label>
											<div class="col-sm-6">
												<input type="text" id="upassportexpDate" class="form-control text-left"     autocomplete="off" onkeydown="return false" value="${questionnarieDto.h1bApplObj.passport_expirydate}"
												name="upassportexpDate" placeholder="Passport Expiry Date" class="form-control" required >
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Consulate to be notified for Visa Stamping :</label>
												<div class="col-sm-6">
							   					   <input id="uvisastamping" type="text" placeholder="Visa Stamping" 
							   					   name="uvisastamping" class="form-control" value="${questionnarieDto.h1bApplObj.consulate_visastamping}">
												</div>
										      </div>
										      
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Status</label>
												<div class="col-sm-6">
													   <select id="ustausoffirstEntry" name="ustausoffirstEntry" class="form-control">
													  <option value="">Please Select Status</option>
													   <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}" ${nonimmistatus == questionnarieDto.h1bApplObj.firstentry_statusinUS ? 'selected="selected"' : ''}>${nonimmistatus}</option>
												     </c:forEach>
											       </select>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Status</label>
												<div class="col-sm-6">
												    <select id="ustausofrecentEntry" name="ustausofrecentEntry" class="form-control">
													  <option value="">Please Select Status</option>
													   <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}" ${nonimmistatus == questionnarieDto.h1bApplObj.recententry_statusinUS ? 'selected="selected"' : ''}>${nonimmistatus}</option>
												     </c:forEach>
											       </select>
												</div>
											</div>
										    </div>
										    
										    <div class="col-md-6 col-sm-12">
										    <h5><b>Address in U.S.A.</b></h5>
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-6">
													<input id="uline1" type="text"  minlength="2" maxlength="40" value="${questionnarieDto.h1bApplObj.line1}"
													 autocomplete="off" placeholder="Enter Line1" name="uline1" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-6">
													<input id="ucity" type="text"  minlength="2" maxlength="25"
													value="${questionnarieDto.h1bApplObj.city}"
													 autocomplete="off" placeholder="City" name="ucity" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-6">
													<input id="uzipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													value="${questionnarieDto.h1bApplObj.zipcode}"
													 autocomplete="off" placeholder="Zip Code" name="uzipcode" class="form-control"  required>
												</div>
											</div> 
										    
										    </div>
										    <!-- familyName firstName middleName countryofcitizenship telephoneNo ssnNo i94No immigrantstatus dateoffirstEntry dateofrecentEntry stausoffirstEntry stausofrecentEntry
										    dob countryofbirth cityofbirth yearsofItExp highestEdu specialization officialemailid passportNo passportissueDate  passportexpDate 
										    line1 line2 city state zipcode permanentAddr  -->
										    <div class="col-md-6 col-sm-12">
										    	<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-6">
													<input id="uline2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													 placeholder="Enter Line2"
													 autocomplete="off" name="uline2" class="form-control" value="${questionnarieDto.h1bApplObj.line2}" >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-6">
													<input id="ustate" type="text"  minlength="2" maxlength="25"
													 value="${questionnarieDto.h1bApplObj.state}"
													 autocomplete="off" placeholder="State" name="ustate" class="form-control"  required>
												</div>
											</div>
										    </div>
										 <div class="col-md-6 col-sm-12">	
										     <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Home/Foreign/Permanent address outside U.S.A. :</label>
												<div class="col-sm-6">
							   					   <textarea id="upermanentAddr" type="text" required
											   		 placeholder="Employee Address" row="3" column="50"  name="upermanentAddr" class="form-control">${questionnarieDto.h1bApplObj.outside_us_address}</textarea>
												</div>
										      </div>
										       
										</div>
										 <div class="col-md-6 col-sm-12">
										      <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span> Has an immigrant petition or Labor Certification been filed on your behalf, Form I-140 and/or Form I-485?</label>
												<div class="col-sm-6">
							   					   <input id="upetitionfiled_behalf" type="text" placeholder="Form I-140 or Form I-485" 
							   					         name="upetitionfiled_behalf" class="form-control" value="${questionnarieDto.h1bApplObj.petitionfiled_behalf}">
												</div>
										      </div>
										   </div>   
									  </div>
								  </div>
								  <c:if test="${questionnarieDto.applEntryList.size() gt 0}">
								  	<table class="table information_json" id="tableId" style="width: 70%;margin-left: 20%;">
												<thead>
												<tr style="line-height: 0px;border-bottom:0px;">
													<th style="border-bottom:0px;">Arrival Date</th>
													<th  style="border-bottom:0px;">Arrival Visa</th>
													<th  style="border-bottom:0px;">Departure Date</th>
													<th  style="border-bottom:0px;">Departure Visa</th>
												</tr>
												</thead>
									</table>
								    <c:forEach var="applEntryList" items="${questionnarieDto.applEntryList}">
								     <input type="hidden" id="applEntryid" name="applEntryid" value="${applEntryList.dates_id}">
								     <div class="form-group row">
										<label for="inputPassword" class="col-sm-2 control-label"><span style="color:green;">${applEntryList.dates_id}</span></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" value="${applEntryList.arrival_date}" autocomplete="off"
											name="uarrivalDate" id="uarrivalDate${applEntryList.dates_id}" placeholder="Arrival Date" onkeydown="return false">
										</div>
										<div class="col-sm-2">
										         <select id="uarrivalVisa${applEntryList.dates_id}" name="uarrivalVisa" class="form-control">
													 <option value="">Arrival Visa</option>
													   <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}" ${nonimmistatus == applEntryList.arrival_visa ? 'selected="selected"' : ''}>${nonimmistatus}</option>
												    </c:forEach>
											</select>
										</div>
										<div class="col-sm-2">
											<input type="text" class="form-control"  value="${applEntryList.departure_date}" autocomplete="off"
											name="udepartureDate" id="udepartureDate${applEntryList.dates_id}" placeholder="Departure Date" onkeydown="return false">
										</div>
										<div class="col-sm-2">
										     <select id="udepartureVisa${applEntryList.dates_id}" name="udepartureVisa" class="form-control" >
													<option value="">Departure Visa</option>
													<c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}" ${nonimmistatus == applEntryList.departure_visa ? 'selected="selected"' : ''}>${nonimmistatus}</option>
												    </c:forEach>
											</select>
										</div>
									</div>
								</c:forEach>
							    </c:if>
							    <c:if test="${role == 1}">
							     <div class='form-group row' id="add">
                                       <label for="inputPassword" class="col-sm-2 control-label">Entry and Exit Dates</label>
												<div class="col-xs-4">
													<button type="button" class="btn btn-sm btn-success addButton">
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                 </div>  
                                 </c:if>
                                 <div id="uaddEntrtyExits" style="display:none;">
                                 <input type="hidden" name="uarrId"  id="uarrId">
									<div class="form-group row">
										<label for="inputPassword" class="col-sm-2 control-label"></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" autocomplete="off"
											name="auarrivalDate[]" id="auarrivalDate" placeholder="Arrival Date" onkeydown="return false">
										</div>
										<div class="col-sm-2">
										    <select id="auarrivalVisa" name="auarrivalVisa[]" class="form-control" >
													 <option value="">Arrival Visa</option>
													 <option value="H-1B">H-1B</option>
													 <option value="H-4">H-4</option>
													 <option value="F-1">F-1</option>
													 <option value="L-1">L-1</option>
													 <option value="J-1">J-1</option>
													 <option value="B-1/B-2">B-1/B-2</option>
													 <option value="O-1">O-1</option>
													 <option value="P-1">P-1</option>
													 <option value="TN">TN</option>
													<!--   <option value="Other">Other</option> -->
											</select>
										<!-- 	<input type="text" class="form-control"
											name="" id="arrivalVisa[]" placeholder="Arrival Visa"> -->
										</div>
										<div class="col-sm-2">
											<input type="text" class="form-control" autocomplete="off"
											name="audepartureDate[]" id="audepartureDate" placeholder="Departure Date" disabled onkeydown="return false">
										</div>
										<div class="col-sm-2">
										     <select id="audepartureVisa" name="audepartureVisa[]" class="form-control" >
													 <option value="">Departure Visa</option>
													 <option value="H-1B">H-1B</option>
													 <option value="H-4">H-4</option>
													 <option value="F-1">F-1</option>
													 <option value="L-1">L-1</option>
													 <option value="J-1">J-1</option>
													 <option value="B-1/B-2">B-1/B-2</option>
													 <option value="O-1">O-1</option>
													 <option value="P-1">P-1</option>
													 <option value="TN">TN</option>
													  <!-- <option value="Other">Other</option> -->
											</select>
										</div>
										<div id="remId" style="display:block;">
											 <button type="button" class="btn btn-sm btn-danger removeButton">
														<i class="fa fa-minus"></i>
											 </button>
										</div>
									</div>
								</div>
								   <c:if test="${role == 1}">
									<div class="text-center ml-5">
												<input type="button" class="btn btn-default" id="h1bapplbtnUpdate" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Update">
												<a href="mydocuments" class="btn btn-default" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;" id="reset">Back</a>
									</div>
									</c:if>
									</form>
									<c:if test="${role == 4 && questionnarieDto.initiateObj.status=='Active'}">
							     <div class="text-center ml-5">
							     <input type="button" id="btnh1bApplAdmin"
							        style="border-radius: 12px;background-color:#2196f3;"
							        class="btn btn-primary btn-sm collapsibleh1bApplAdmin" value="Applicant Status">
							     <c:if test="${questionnarieDto.rejformsApplhistoryList.size() gt 0}">
							     <button type="button"	style='letter-spacing: 1px; background-color:#15aabf;color:white;' class="btn btn-info btn-sm addButton" 
									onclick="viewCommentHistory1(${questionnarieDto.h1bApplObj.h1questionnrie_id},'Applicant','H1B Questionnaries')"><i class="fa fa-history"></i></button>
							     </c:if>
							    <!--  <a href="immigration" class="btn btn-secondary btn-sm" >Back</a> -->
							     </div> 
							</c:if>
							  </div>
										
										</c:when>
										<c:otherwise>
										<%-- <c:choose>
										<c:when test="${not empty questionnarieDto.temph1bApplObj}"> --%>
										<div id="h1bApplId" style="display:none;">
										<form action="/" class="form-horizontal" id="h1bqueDetailsForm" enctype="multipart/form-data">
										<input type="hidden" id="applh1que_id" name="applh1que_id">
										<c:choose>
										<c:when test="${not empty questionnarieDto.temph1bApplObj.h1questionnrie_id}">
										<input type="hidden" id="tapplh1que_id" name="tapplh1que_id" value="${questionnarieDto.temph1bApplObj.h1questionnrie_id}">
										<input type="hidden" id="tu_passportNo" value="${questionnarieDto.temph1bApplObj.passport_number}">
										<input type="hidden" id="tu_ssnNo" value="${questionnarieDto.temph1bApplObj.ssn}">
										</c:when>
										<c:otherwise>
										<input type="hidden" id="tapplh1que_id" name="tapplh1que_id" >
										</c:otherwise>
										</c:choose>
										<%-- <input type="hidden" id="" name="tapplh1que_id" value="${questionnarieDto.temph1bApplObj.h1questionnrie_id}"> --%>
											<h4><b>Candidate Details</b></h4>
											<div id="h1bqueDiv">
											<div class="row"> 
										    <div class="col-md-6 col-sm-12">
										    	<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Last Name</label>
												<div class="col-sm-6">
													<input id="familyName" type="text" minlength="1" maxlength="40"
													value="${questionnarieDto.temph1bApplObj.family_name}"
													 autocomplete="off" placeholder="Last Name" name="familyName" class="form-control"  required>
												</div>
											</div>
											
										     <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>First Name</label>
												<div class="col-sm-6">
													<input id="firstName" type="text"  autocomplete="off"  autocomplete="off" minlength="2" maxlength="40"
													 placeholder="First Name" name="firstName" class="form-control" value="${questionnarieDto.temph1bApplObj.first_name}" required>
												</div><!--  -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Middle Name</label>
												<div class="col-sm-6">
													<input id="middleName" type="text"  minlength="1" maxlength="40"
													 value="${questionnarieDto.temph1bApplObj.middle_name}"
													 autocomplete="off" placeholder="Middle Name" name="middleName" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Country of Citizenship</label>
											<div class="col-sm-6">
												<input type="text" id="countryofcitizenship" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.temph1bApplObj.country_citizenship}"
												 name="countryofcitizenship" placeholder="Country of Citizenship" class="form-control" required >
											</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Highest Education</label>
											<div class="col-sm-6">
												<input type="text" id="highestEdu" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.temph1bApplObj.highest_education}"
												name="highestEdu" placeholder="Highest Education" class="form-control" required >
											</div>
											</div>
											 
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Telephone Number in US</label>
												<div class="col-sm-6">
													<input id="telephoneNo" type="text"  minlength="12"	maxlength="12"
													value="${questionnarieDto.temph1bApplObj.us_phonenumber}"
													 autocomplete="off" placeholder="Telephone Number in US" name="telephoneNo" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Personal email id</label>
												<div class="col-sm-6">
													<input id="personalemailid" type="text"  minlength="1" maxlength="40"
													 value="${questionnarieDto.temph1bApplObj.personal_email}"
													 autocomplete="off" placeholder="Personal email id" name="personalemailid" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Social Security Number</label>
												<div class="col-sm-6">
													<input id="ssnNo" type="text"  minlength="11" maxlength="11" 
													 placeholder="Enter SSN Number as AAA-GG-SSSS" 
													 autocomplete="off" name="ssnNo" class="form-control"  >
													<span  style="color:red;" id="assnshow"></span>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>I-94 Number</label>
												<div class="col-sm-6">
													<input id="i94No" type="text"  minlength="11" maxlength="11"
													 value="${questionnarieDto.temph1bApplObj.i94_number}"
													 autocomplete="off" placeholder="I-94 Number" name="i94No" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Current Non-Immigrant Status</label>
												<div class="col-sm-6">
													<select id="immigrantstatus" type="text"  minlength="1" maxlength="40"
													 autocomplete="off" placeholder="Current Non-Immigrant Status" name="immigrantstatus" class="form-control" >
													 <option value="">Select Non-Immigrant Status</option>
													<c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}" ${nonimmistatus == questionnarieDto.temph1bApplObj.current_non_immiStatus ? 'selected="selected"' : ''}>${nonimmistatus}</option>
												    </c:forEach>
													 </select>
												</div>
											</div>
										
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of First Entry Into US</label>
											<div class="col-sm-6">
												<input type="text" id="dateoffirstEntry" class="form-control text-left"     autocomplete="off" onkeydown="return false" value="${questionnarieDto.temph1bApplObj.firstentry_dateinUS}"
												 name="dateoffirstEntry" placeholder="Date Of First Entry Into US" class="form-control" required >
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Most Recent Entry Into US</label>
											<div class="col-sm-6">
												<input type="text" id="dateofrecentEntry" class="form-control text-left"     autocomplete="off" onkeydown="return false" value="${questionnarieDto.temph1bApplObj.recententry_dateinUS}"
												name="dateofrecentEntry" placeholder="Date Of Most Recent Entry Into US" class="form-control" required >
											</div>
											</div>
										    </div>
										    	
										    <div class="col-md-6 col-sm-12">
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="dob" class="form-control text-left"     autocomplete="off" onkeydown="return false" value="${questionnarieDto.temph1bApplObj.dob}"
												name="dob" placeholder="Date Of Birth" class="form-control" required >
											</div>
											</div>
											
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Country Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="countryofbirth" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.temph1bApplObj.country_birth}"
												name="countryofbirth" placeholder="Country Of Birth" class="form-control" required >
											</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="cityofbirth" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.temph1bApplObj.city_birth}"
												name="cityofbirth" placeholder="City Of Birth" class="form-control" required >
											</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Years of Experience in IT Industry</label>
											<div class="col-sm-6">
												<input type="text" id="yearsofItExp" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.temph1bApplObj.it_experience}"
												 name="yearsofItExp" placeholder="Years of Experience in IT Industry" class="form-control" required >
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Specialization</label>
											<div class="col-sm-6">
												<input type="text" id="specialization" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.temph1bApplObj.specialization}"
													name="specialization" placeholder="Specialization" class="form-control" required >
											</div>
											</div>
											
											<!-- <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Mobile Number</label>
												<div class="col-sm-6">
													<input id="middleName" type="text"  minlength="1" maxlength="40"
													title="only alphabets are allowed" 
													 autocomplete="off" placeholder="Mobile Number" name="middleName" class="form-control"  >
												</div>
											</div> -->
										
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Official email id</label>
												<div class="col-sm-6">
													<input id="officialemailid" type="text"  minlength="1" maxlength="40"
													 value="${questionnarieDto.temph1bApplObj.official_email}"
													 autocomplete="off" placeholder="Official email id" name="officialemailid" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Number</label>
												<div class="col-sm-6">
													<input id="passportNo" type="text"  minlength="9" maxlength="16"
													 autocomplete="off" placeholder="Passport Number" name="passportNo" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Issue Date</label>
											<div class="col-sm-6">
												<input type="text" id="passportissueDate" class="form-control text-left"     autocomplete="off" onkeydown="return false" value="${questionnarieDto.temph1bApplObj.passport_issuedate}"
												 name="passportissueDate" placeholder="Passport Issue Date" class="form-control" required >
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Expiry Date</label>
											<div class="col-sm-6">
												<input type="text" id="passportexpDate" class="form-control text-left"     autocomplete="off" onkeydown="return false" value="${questionnarieDto.temph1bApplObj.passport_expirydate}"
												name="passportexpDate" placeholder="Passport Expiry Date" class="form-control" required >
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Consulate to be notified for Visa Stamping :</label>
												<div class="col-sm-6">
							   					   <input id="visastamping" type="text" placeholder="Visa Stamping" 
							   					   name="visastamping" class="form-control" value="${questionnarieDto.temph1bApplObj.consulate_visastamping}">
												</div>
										      </div>
										      
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Status</label>
												<div class="col-sm-6">
													   <select id="stausoffirstEntry" name="stausoffirstEntry" class="form-control">
													  <option value="">Please Select Status</option>
													   <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}" ${nonimmistatus == questionnarieDto.temph1bApplObj.firstentry_statusinUS ? 'selected="selected"' : ''}>${nonimmistatus}</option>
												     </c:forEach>
											       </select>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Status</label>
												<div class="col-sm-6">
												    <select id="stausofrecentEntry" name="stausofrecentEntry" class="form-control">
													  <option value="">Please Select Status</option>
													   <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}" ${nonimmistatus == questionnarieDto.temph1bApplObj.recententry_statusinUS ? 'selected="selected"' : ''}>${nonimmistatus}</option>
												     </c:forEach>
											       </select>
												</div>
											</div>
										    </div>
										    
										    <div class="col-md-6 col-sm-12">
										    <h5><b>Address in U.S.A.</b></h5>
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-6">
													<input id="line1" type="text"  minlength="2" maxlength="40" value="${questionnarieDto.temph1bApplObj.line1}"
													 autocomplete="off" placeholder="Enter Line1" name="line1" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-6">
													<input id="city" type="text"  minlength="2" maxlength="25"
													value="${questionnarieDto.temph1bApplObj.city}"
													 autocomplete="off" placeholder="City" name="city" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-6">
													<input id="zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													value="${questionnarieDto.temph1bApplObj.zipcode}"
													 autocomplete="off" placeholder="Zip Code" name="zipcode" class="form-control"  required>
												</div>
											</div> 
										    
										    </div>
										    <!-- familyName firstName middleName countryofcitizenship telephoneNo ssnNo i94No immigrantstatus dateoffirstEntry dateofrecentEntry stausoffirstEntry stausofrecentEntry
										    dob countryofbirth cityofbirth yearsofItExp highestEdu specialization officialemailid passportNo passportissueDate  passportexpDate 
										    line1 line2 city state zipcode permanentAddr  -->
										    <div class="col-md-6 col-sm-12">
										    	<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-6">
													<input id="line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													 placeholder="Enter Line2"
													 autocomplete="off" name="line2" class="form-control" value="${questionnarieDto.temph1bApplObj.line2}" >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-6">
													<input id="state" type="text"  minlength="2" maxlength="25"
													 value="${questionnarieDto.temph1bApplObj.state}"
													 autocomplete="off" placeholder="State" name="state" class="form-control"  required>
												</div>
											</div>
										    </div>
										 <div class="col-md-6 col-sm-12">	
										     <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Home/Foreign/Permanent address outside U.S.A. :</label>
												<div class="col-sm-6">
							   					   <textarea id="permanentAddr" type="text" row="3" column="50" required
											   		 placeholder="Employee Address" name="permanentAddr" class="form-control">${questionnarieDto.temph1bApplObj.outside_us_address}</textarea>
												</div>
										      </div>
										       
										</div>
										 <div class="col-md-6 col-sm-12">
										      <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span> Has an immigrant petition or Labor Certification been filed on your behalf, Form I-140 and/or Form I-485?</label>
												<div class="col-sm-6">
							   					   <input id="petitionfiled_behalf" type="text" placeholder="Form I-140 or Form I-485" 
							   					         name="petitionfiled_behalf" class="form-control" value="${questionnarieDto.temph1bApplObj.petitionfiled_behalf}">
												</div>
										      </div>
										   </div>   
									  </div>
								  </div>
								  <c:if test="${questionnarieDto.tempapplEntryList.size() gt 0}">
								  	<table class="table information_json" id="tableId" style="width: 70%;margin-left: 20%;">
												<thead>
												<tr style="line-height: 0px;border-bottom:0px;">
													<th style="border-bottom:0px;">Arrival Date</th>
													<th  style="border-bottom:0px;">Arrival Visa</th>
													<th  style="border-bottom:0px;">Departure Date</th>
													<th  style="border-bottom:0px;">Departure Visa</th>
												</tr>
												</thead>
									</table>
								    <c:forEach var="tempapplEntryList" items="${questionnarieDto.tempapplEntryList}">
								     <input type="hidden" id="tmpapplEntryid" name="tmpapplEntryid" value="${tempapplEntryList.dates_id}">
								    <div class="form-group row">
										<label for="inputPassword" class="col-sm-2 control-label"></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" value="${tempapplEntryList.arrival_date}" autocomplete="off"
											name="tarrivalDate" id="tarrivalDate${tempapplEntryList.dates_id}" placeholder="Arrival Date" onkeydown="return false">
										</div>
										<div class="col-sm-2">
										         <select id="tarrivalVisa${tempapplEntryList.dates_id}" name="tarrivalVisa" class="form-control">
													 <option value="">Arrival Visa</option>
													   <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}" ${nonimmistatus == tempapplEntryList.arrival_visa ? 'selected="selected"' : ''}>${nonimmistatus}</option>
												    </c:forEach>
													<!--  <option value="H-1B">H-1B</option>
													 <option value="H-4">H-4</option>
													 <option value="F-1">F-1</option>
													 <option value="L-1">L-1</option>
													 <option value="J-1">J-1</option>
													 <option value="B-1/B-2">B-1/B-2</option>
													 <option value="O-1">O-1</option>
													 <option value="P-1">P-1</option>
													 <option value="TN">TN</option>
													 <option value="Other">Other</option> -->
											</select>
										<!-- 	<input type="text" class="form-control"
											name="" id="arrivalVisa[]" placeholder="Arrival Visa"> -->
										</div>
										<div class="col-sm-2">
											<input type="text" class="form-control"  value="${tempapplEntryList.departure_date}" autocomplete="off"
											name="tdepartureDate" id="tdepartureDate${tempapplEntryList.dates_id}" placeholder="Departure Date" onkeydown="return false">
										</div>
										<div class="col-sm-2">
										     <select id="tdepartureVisa${tempapplEntryList.dates_id}" name="tdepartureVisa" class="form-control" >
													<option value="">Departure Visa</option>
													<c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}" ${nonimmistatus == tempapplEntryList.departure_visa ? 'selected="selected"' : ''}>${nonimmistatus}</option>
												    </c:forEach>
													<!--  <option value="H-1B">H-1B</option>
													 <option value="H-4">H-4</option>
													 <option value="F-1">F-1</option>
													 <option value="L-1">L-1</option>
													 <option value="J-1">J-1</option>
													 <option value="B-1/B-2">B-1/B-2</option>
													 <option value="O-1">O-1</option>
													 <option value="P-1">P-1</option>
													 <option value="TN">TN</option>
													  <option value="Other">Other</option> -->
											</select>
										</div>
									</div>
								</c:forEach>
							    </c:if>
							    <c:if test="${role == 1}">
							     <div class='form-group row' id="add">
                                       <label for="inputPassword" class="col-sm-2 control-label">Entry and Exit Dates</label>
												<div class="col-xs-4">
													<button type="button" class="btn btn-sm btn-success addButton"  id="btnid" disabled>
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                 </div>  
                                 </c:if>
                                 <div id="addEntrtyExits" style="display:none;">
                                 <input type="hidden" name="uarrId"  id="uarrId">
									<div class="form-group row">
										<label for="inputPassword" class="col-sm-2 control-label"></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" autocomplete="off"
											name="arrivalDate[]" id="arrivalDate[]" placeholder="Arrival Date" onkeydown="return false">
										</div>
										<div class="col-sm-2">
										    <select id="arrivalVisa[]" name="arrivalVisa[]" class="form-control" >
													 <option value="">Arrival Visa</option>
													 <option value="H-1B">H-1B</option>
													 <option value="H-4">H-4</option>
													 <option value="F-1">F-1</option>
													 <option value="L-1">L-1</option>
													 <option value="J-1">J-1</option>
													 <option value="B-1/B-2">B-1/B-2</option>
													 <option value="O-1">O-1</option>
													 <option value="P-1">P-1</option>
													 <option value="TN">TN</option>
													<!--   <option value="Other">Other</option> -->
											</select>
										<!-- 	<input type="text" class="form-control"
											name="" id="arrivalVisa[]" placeholder="Arrival Visa"> -->
										</div>
										<div class="col-sm-2">
											<input type="text" class="form-control" autocomplete="off"
											name="departureDate[]" id="departureDate[]" placeholder="Departure Date" disabled onkeydown="return false">
										</div>
										<div class="col-sm-2">
										     <select id="departureVisa[]" name="departureVisa[]" class="form-control" >
													 <option value="">Departure Visa</option>
													 <option value="H-1B">H-1B</option>
													 <option value="H-4">H-4</option>
													 <option value="F-1">F-1</option>
													 <option value="L-1">L-1</option>
													 <option value="J-1">J-1</option>
													 <option value="B-1/B-2">B-1/B-2</option>
													 <option value="O-1">O-1</option>
													 <option value="P-1">P-1</option>
													 <option value="TN">TN</option>
													  <!-- <option value="Other">Other</option> -->
											</select>
										</div>
										<div id="remId" style="display:block;">
											 <button type="button" class="btn btn-sm btn-danger removeButton">
														<i class="fa fa-minus"></i>
											 </button>
										</div>
									</div>
								</div>
								<c:if test="${role == 1}">
									<div class="text-center ml-5">
												<input type="button" class="btn btn-default" id="h1bapplsaveid" style="padding:7px;background-color:#2196f3;color:white;text-transform:INITIAL;line-height:0.728571;" value="Save & Continue">
												<input type="button" class="btn btn-default" id="h1bapplsubmitid" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Submit">
												<input type="button" class="btn btn-default" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;" id="h1bapplresetid" value="Reset">
												<a href="mydocuments" class="btn btn-default" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;" id="reset">Back</a>
									</div>
									</c:if>
									</form>
								</div>
										
										
										<%--</c:when>
										<c:otherwise>
										 <div id="h1bApplId" style="display:none;">
										<form action="/" class="form-horizontal" id="h1bqueDetailsForm" enctype="multipart/form-data" autocomplete="off">
										<input type="hidden" id="applh1que_id" name="applh1que_id">
											<h4><b>Candidate Details</b></h4>
											<!-- <div class="form-group row row" >
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>SSN Number</label>
												<div class="col-sm-4">
													<input id="ssn_emp"  type="text"  autocomplete="off"
													 placeholder="SSN Number" name="ssn_emp" class="form-control" required>
													<span id="ssnshow" style="color: red;"></span>
												</div>
											</div> -->
											<div id="h1bqueDiv">
											<div class="row">
										    <div class="col-md-6 col-sm-12">
										    	<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Last Name</label>
												<div class="col-sm-6">
													<input id="familyName" type="text" minlength="1" maxlength="40" 
													 autocomplete="off" placeholder="Last Name" name="familyName" class="form-control"  required>
												</div>
											</div>
											
										     <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>First Name</label>
												<div class="col-sm-6">
													<input id="firstName" type="text"  autocomplete="off"  autocomplete="off" minlength="2" maxlength="40"
													 placeholder="First Name" name="firstName" class="form-control"  required>
												</div><!--  -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Middle Name</label>
												<div class="col-sm-6">
													<input id="middleName" type="text"  minlength="1" maxlength="40"
													 autocomplete="off" placeholder="Middle Name" name="middleName" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Country of Citizenship</label>
											<div class="col-sm-6">
												<input type="text" id="countryofcitizenship" class="form-control text-left"     autocomplete="off"
												 name="countryofcitizenship" placeholder="Country of Citizenship" class="form-control" required >
											</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Highest Education</label>
											<div class="col-sm-6">
												<input type="text" id="highestEdu" class="form-control text-left"     autocomplete="off"
												 name="highestEdu" placeholder="Highest Education" class="form-control" required >
											</div>
											</div>
											 
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Telephone Number in US</label>
												<div class="col-sm-6">
													<input id="telephoneNo" type="text"  minlength="12"	maxlength="12"
													
													 autocomplete="off" placeholder="Telephone Number in US" name="telephoneNo" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Personal email id</label>
												<div class="col-sm-6">
													<input id="personalemailid" type="text"  minlength="1" maxlength="40"
													
													 autocomplete="off" placeholder="Personal email id" name="personalemailid" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Social Security Number</label>
												<div class="col-sm-6">
													<input id="ssnNo" type="text"  minlength="11" maxlength="11"
													placeholder="Enter SSN Number as AAA-GG-SSSS" 
													 autocomplete="off" name="ssnNo" class="form-control"  >
													 <span  style="color:red;" id="assnshow"></span>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>I-94 Number</label>
												<div class="col-sm-6">
													<input id="i94No" type="text"  minlength="11" maxlength="11"
													
													 autocomplete="off" placeholder="I-94 Number" name="i94No" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Current Non-Immigrant Status</label>
												<div class="col-sm-6">
													<select id="immigrantstatus" type="text"  minlength="1" maxlength="40"
													
													 autocomplete="off" placeholder="Current Non-Immigrant Status" name="immigrantstatus" class="form-control" >
													 <option value="">Select Non-Immigrant Status</option>
													 <option value="H-1B">H-1B</option>
													 <option value="H-4">H-4</option>
													 <option value="F-1">F-1</option>
													 <option value="L-1">L-1</option>
													 <option value="J-1">J-1</option>
													 <option value="B-1/B-2">B-1/B-2</option>
													 <option value="O-1">O-1</option>
													 <option value="P-1">P-1</option>
													 <option value="TN">TN</option>
													  <!-- <option value="Other">Other</option> -->
													 </select>
												</div>
											</div>
										
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of First Entry Into US</label>
											<div class="col-sm-6">
												<input type="text" id="dateoffirstEntry" class="form-control text-left"     autocomplete="off" onkeydown="return false"
											 name="dateoffirstEntry" placeholder="Date Of First Entry Into US" class="form-control" required disabled>
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Most Recent Entry Into US</label>
											<div class="col-sm-6">
												<input type="text" id="dateofrecentEntry" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												 name="dateofrecentEntry" placeholder="Date Of Most Recent Entry Into US" class="form-control" required disabled >
											</div>
											</div>
										    </div>
										    	
										    <div class="col-md-6 col-sm-12">
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="dob" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												 name="dob" placeholder="Date Of Birth" class="form-control" required >
											</div>
											</div>
											
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Country Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="countryofbirth" class="form-control text-left"     autocomplete="off"
												name="countryofbirth" placeholder="Country Of Birth" class="form-control" required >
											</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="cityofbirth" class="form-control text-left"     autocomplete="off"
												 name="cityofbirth" placeholder="City Of Birth" class="form-control" required >
											</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Years of Experience in IT Industry</label>
											<div class="col-sm-6">
												<input type="text" id="yearsofItExp" class="form-control text-left"     autocomplete="off"
												name="yearsofItExp" placeholder="Years of Experience in IT Industry" class="form-control" required >
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Specialization</label>
											<div class="col-sm-6">
												<input type="text" id="specialization" class="form-control text-left"     autocomplete="off"
												 name="specialization" placeholder="Specialization" class="form-control" required >
											</div>
											</div>
											
											<!-- <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Mobile Number</label>
												<div class="col-sm-6">
													<input id="middleName" type="text"  minlength="1" maxlength="40"
													title="only alphabets are allowed" 
													 autocomplete="off" placeholder="Mobile Number" name="middleName" class="form-control"  >
												</div>
											</div> -->
										
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Official email id</label>
												<div class="col-sm-6">
													<input id="officialemailid" type="text"  minlength="1" maxlength="40"
													
													 autocomplete="off" placeholder="Official email id" name="officialemailid" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Number</label>
												<div class="col-sm-6">
													<input id="passportNo" type="text"  minlength="9" maxlength="16"
													
													 autocomplete="off" placeholder="Passport Number" name="passportNo" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Issue Date</label>
											<div class="col-sm-6">
												<input type="text" id="passportissueDate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												name="passportissueDate" placeholder="Passport Issue Date" class="form-control" required disabled>
											</div>
											</div>
										      
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Expiry Date</label>
											<div class="col-sm-6">
												<input type="text" id="passportexpDate" class="form-control text-left"     autocomplete="off" onkeydown="return false"
												 name="passportexpDate" placeholder="Passport Expiry Date" class="form-control" required disabled>
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Consulate to be notified for Visa Stamping :</label>
												<div class="col-sm-6">
							   					   <input id="visastamping" type="text" placeholder="Visa Stamping" 
							   					   name="visastamping" class="form-control">
												</div>
										      </div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Status</label>
												<div class="col-sm-6">
												<!-- 	<input id="stausoffirstEntry" type="text" minlength="1" maxlength="40"
													title="only alphabets are allowed" 
													 autocomplete="off" placeholder="Status" name="stausoffirstEntry" class="form-control"  required> -->
													   <select id="stausoffirstEntry" name="stausoffirstEntry" class="form-control">
													    <option value="">Please Select Status</option>
													   <c:forEach var="nonimmistatus" items="${immiStatusList}">
														<option value="${nonimmistatus}">${nonimmistatus}</option>
												     </c:forEach>
											       </select>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Status</label>
												<div class="col-sm-6">
													<!-- <input id="stausofrecentEntry" type="text" minlength="1" maxlength="40"
													title="only alphabets are allowed" 
													 autocomplete="off" placeholder="Status" name="stausofrecentEntry" class="form-control"  required> -->
													 <select id="stausofrecentEntry" name="stausofrecentEntry" class="form-control">
													    <option value="">Please Select Status</option>
													   <c:forEach var="nonimmistatus" items="${immiStatusList}">
														<option value="${nonimmistatus}">${nonimmistatus}</option>
												     </c:forEach>
											       </select>
												</div>
											</div>
										    </div>
										    
										    <div class="col-md-6 col-sm-12">
										    <h5><b>Address in U.S.A.</b></h5>
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-6">
													<input id="line1" type="text"  minlength="2" maxlength="40" 
													 autocomplete="off" placeholder="Enter Line1" name="line1" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-6">
													<input id="city" type="text"  minlength="2" maxlength="25"
													 autocomplete="off" placeholder="City" name="city" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-6">
													<input id="zipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													 autocomplete="off" placeholder="Zip Code" name="zipcode" class="form-control"  required>
												</div>
											</div> 
										    
										    </div>
										    <!-- familyName firstName middleName countryofcitizenship telephoneNo ssnNo i94No immigrantstatus dateoffirstEntry dateofrecentEntry stausoffirstEntry stausofrecentEntry
										    dob countryofbirth cityofbirth yearsofItExp highestEdu specialization officialemailid passportNo passportissueDate  passportexpDate 
										    line1 line2 city state zipcode permanentAddr  -->
										    <div class="col-md-6 col-sm-12">
										    	<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-6">
													<input id="line2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													placeholder="Enter Line2"
													 autocomplete="off" name="line2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-6">
													<input id="state" type="text"  minlength="2" maxlength="25"
													 autocomplete="off" placeholder="State" name="state" class="form-control"  required>
												</div>
											</div>
										    </div>
										 <div class="col-md-6 col-sm-12">	
										     <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Home/Foreign/Permanent address outside U.S.A. :</label>
												<div class="col-sm-6">
							   					   <textarea id="permanentAddr" type="text" row="3" column="50" required
											   		 placeholder="Employee Address" name="permanentAddr" class="form-control"></textarea>
												</div>
										      </div>
										</div>
										 <div class="col-md-6 col-sm-12">
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span> Has an immigrant petition or Labor Certification been filed on your behalf, Form I-140 and/or Form I-485?</label>
												<div class="col-sm-6">
							   					   <input id="petitionfiled_behalf" type="text" placeholder="Form I-140 or Form I-485" 
							   					         name="petitionfiled_behalf" class="form-control">
												</div>
										      </div>
										   </div>   
									  </div>
								  </div>
								  <c:if test="${role == 1}">
							     <div class='form-group row' id="add">
                                       <label for="inputPassword" class="col-sm-2 control-label">Entry and Exit Dates</label>
												<div class="col-xs-4">
													<button type="button" class="btn btn-sm btn-success addButton" id="btnid" disabled>
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                 </div> 
                                 </c:if> 
                                 <div id="addEntrtyExits" style="display:none;">
                                   <input type="hidden"  name="arrId" id="arrId">
									<div class="form-group row">
										<label for="inputPassword" class="col-sm-2 control-label"></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" autocomplete="off"
											name="arrivalDate[]" id="arrivalDate[]" placeholder="Arrival Date" onkeydown="return false">
										</div>
										<div class="col-sm-2">
										    <select id="arrivalVisa[]" name="arrivalVisa[]" class="form-control" >
													 <option value="">Please Select Status</option>
													   <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}">${nonimmistatus}</option>
												       </c:forEach>
											</select>
										<!-- 	<input type="text" class="form-control"
											name="" id="arrivalVisa[]" placeholder="Arrival Visa"> -->
										</div>
										<div class="col-sm-2">
											<input type="text" class="form-control" autocomplete="off"
											name="departureDate[]" id="departureDate[]" placeholder="Departure Date"disabled onkeydown="return false">
										</div>
										<div class="col-sm-2">
										     <select id="departureVisa[]" name="departureVisa[]" class="form-control" >
													 <option value="">Please Select Status</option>
													  <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}">${nonimmistatus}</option>
												       </c:forEach>
											</select>
										</div>
										<div id="remId" style="display:block;">
											 <button type="button" class="btn btn-sm btn-danger removeButton">
														<i class="fa fa-minus"></i>
											 </button>
										</div>
									</div>
								</div>
								   <c:if test="${role == 1}">
									<div class="text-center ml-5">
									             <input type="button" class="btn btn-default" id="h1bapplsaveid" style="padding:7px;background-color:#2196f3;color:white;text-transform:INITIAL;line-height:0.728571;" value="Save Details">
												<input type="button" class="btn btn-default" id="h1bapplsubmitid" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Submit">
												<input type="button" class="btn btn-default" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;" id="h1bapplresetid" value="Reset">
												<a href="mydocuments" class="btn btn-default" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;" id="reset">Back</a>
									</div>
									</c:if>
									</form>
								</div>  </c:otherwise> </c:choose>--%>
								
										
									
										</c:otherwise>
										</c:choose>
										
										<c:choose>
										<c:when test="${not empty questionnarieDto.spouseObj}">
										<div id="h1bSpouseId">
										<form action="/" class="form-horizontal" id="updatespouseh1bqueDetailsForm" enctype="multipart/form-data">
										<input type="hidden" id="spouseh1que_id" name="spouseh1que_id" value="${questionnarieDto.spouseObj.h1questionnrie_id}">
										<input type="hidden" id="tspouseh1que_id" name="tspouseh1que_id">
											<input type="hidden" id="spouserejfields" value="${questionnarieDto.rejformspouseObj.rejectedfields}">
											<input type="hidden" id="spouserejform_status" value="${questionnarieDto.rejformspouseObj.form_status}">
											<h4><b>Candidate Details</b></h4>
											<!-- <input id="benftype" name="benftype" type="hidden"> -->
											<!-- <div class="form-group row row" >
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>SSN Number</label>
												<div class="col-sm-4">
													<input id="ssn_emp"  type="text"  autocomplete="off"
													 placeholder="SSN Number" name="ssn_emp" class="form-control" required>
													<span id="ssnshow" style="color: red;"></span>
												</div>
											</div> -->
											<div id="h1bqueDiv">
											<div class="row">
											   <c:if test="${role == 1 && questionnarieDto.rejformspouseObj.form_status=='Rejected' && not empty questionnarieDto.rejformspouseObj.rejectioncoments}">
											    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label" style="color:purple;font-weight:bold;">Rejection Comments</label>
												<div class="col-sm-6">
													<span style="color:green;font-weight:bold;">${questionnarieDto.rejformspouseObj.rejectioncoments}</span>
												</div>
											    </div>
											    </c:if>
											
										    <div class="col-md-6 col-sm-12">
										    	<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Last Name</label>
												<div class="col-sm-6">
													<input id="uspousefamilyName" type="text" minlength="1" maxlength="40"
													  value="${questionnarieDto.spouseObj.family_name}"
													 autocomplete="off" placeholder="Last Name" name="uspousefamilyName" class="form-control"  required>
												</div>
											</div>
											
										     <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>First Name</label>
												<div class="col-sm-6">
													<input id="uspousefirstName" type="text"  autocomplete="off"  autocomplete="off" minlength="2" maxlength="40"
													 placeholder="First Name" name="uspousefirstName" class="form-control" value="${questionnarieDto.spouseObj.first_name}" required >
												</div><!--  -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Middle Name</label>
												<div class="col-sm-6">
													<input id="uspousemiddleName" type="text"  minlength="1" maxlength="40"
													value="${questionnarieDto.spouseObj.middle_name}"
													 autocomplete="off" placeholder="Middle Name" name="uspousemiddleName" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Country of Citizenship</label>
											<div class="col-sm-6">
												<input type="text" id="uspousecountryofcitizenship" class="form-control text-left"  value="${questionnarieDto.spouseObj.country_citizenship}"   autocomplete="off"
												 name="uspousecountryofcitizenship" placeholder="Country of Citizenship" class="form-control" required >
											</div>
											</div>
											<!-- <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Highest Education</label>
											<div class="col-sm-6">
												<input type="text" id="citizenship" class="form-control text-left"     autocomplete="off"
												title="Enter Country of Citizenship" name="citizenship" placeholder="Highest Education" class="form-control" required >
											</div>
											</div> -->
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Telephone Number in US</label>
												<div class="col-sm-6">
													<input id="uspousetelephoneNo" type="text" minlength="12"	maxlength="12"
													value="${questionnarieDto.spouseObj.us_phonenumber}"
													 autocomplete="off" placeholder="Telephone Number in US" name="uspousetelephoneNo" class="form-control"  >
												</div>
											</div>
											
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Social Security Number</label>
												<div class="col-sm-6">
												<input id="dc_uspousessnNo" type="hidden" name="dc_uspousessnNo" value="${questionnarieDto.spouseObj.ssn}">
												
													<input id="uspousessnNo" type="text" minlength="11" maxlength="11"
													placeholder="Enter SSN Number as AAA-GG-SSSS"  name="uspousessnNo" class="form-control"  >
												   <span  style="color:red;" id="uspssnshow"></span>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>I-94 Number</label>
												<div class="col-sm-6">
													<input id="uspousei94No" type="text"  minlength="11" maxlength="11"
													value="${questionnarieDto.spouseObj.i94_number}"
													 autocomplete="off" placeholder="I-94 Number" name="uspousei94No" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Current Non-Immigrant Status</label>
												<div class="col-sm-6">
													<select id="uspouseimmigrantstatus" type="text"  minlength="1" maxlength="40"
													 autocomplete="off" placeholder="Current Non-Immigrant Status" name="uspouseimmigrantstatus" class="form-control" >
													 <option value="">Select Non-Immigrant Status</option>
													 <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}" ${nonimmistatus == questionnarieDto.spouseObj.current_non_immiStatus ? 'selected="selected"' : ''}>${nonimmistatus}</option>
												    </c:forEach>
													 </select>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Most Recent Entry Into US</label>
											<div class="col-sm-6">
												<input type="text" id="uspousedateofrecentEntry" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.spouseObj.recententry_dateinUS}"
												 name="uspousedateofrecentEntry" placeholder="Date Of Most Recent Entry Into US" class="form-control" required onkeydown="return false">
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Personal email id</label>
												<div class="col-sm-6">
													<input id="uspousepersonalemailid" type="text"  minlength="1" maxlength="40"
													value="${questionnarieDto.spouseObj.personal_email}"
													 autocomplete="off" placeholder="Personal email id" name="uspousepersonalemailid" class="form-control"  >
												</div>
											</div>
											
											
										    </div>
										    <div class="col-md-6 col-sm-12">
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="uspousedob" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.spouseObj.dob}"
												 name="uspousedob" placeholder="Date Of Birth" class="form-control" required onkeydown="return false">
											</div>
											</div>
											
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Country Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="uspousecountryofbirth" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.spouseObj.country_birth}"
												name="uspousecountryofbirth" placeholder="Country Of Birth" class="form-control" required >
											</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="uspousecityofbirth" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.spouseObj.city_birth}"
												name="uspousecityofbirth" placeholder="City Of Birth" class="form-control" required >
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Number</label>
												<div class="col-sm-6">
												<input id="dc_uspousepassportNo" type="hidden" value="${questionnarieDto.spouseObj.passport_number}">
											
													<input id="uspousepassportNo" type="text"  minlength="9" maxlength="16"
													
													 autocomplete="off" placeholder="Passport Number" name="uspousepassportNo" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Issue Date</label>
											<div class="col-sm-6">
												<input type="text" id="uspousepassportissueDate" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.spouseObj.passport_issuedate}"
												 name="uspousepassportissueDate" placeholder="Passport Issue Date" class="form-control" required onkeydown="return false">
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Expiry Date</label>
											<div class="col-sm-6">
												<input type="text" id="uspousepassportexpDate" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.spouseObj.passport_expirydate}"
												 name="uspousepassportexpDate" placeholder="Passport Expiry Date" class="form-control" required onkeydown="return false">
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Status</label>
												<div class="col-sm-6">
													  <select id="uspousestausofrecentEntry" name="uspousestausofrecentEntry" class="form-control">
													 <option value="">Please select status</option>
													 <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}" ${nonimmistatus == questionnarieDto.spouseObj.recententry_statusinUS ? 'selected="selected"' : ''}>${nonimmistatus}</option>
												    </c:forEach>
												    </select>
												</div>
											</div>
										    </div>
										    <div class="col-md-6 col-sm-12">
										    <h5><b>Address in U.S.A.</b></h5>
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-6">
													<input id="uspouseline1" type="text"  minlength="2" maxlength="40" value="${questionnarieDto.spouseObj.line1}"
													 autocomplete="off" placeholder="Enter Line1" name="uspouseline1" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-6">
													<input id="uspousecity" type="text"  minlength="2" maxlength="25"
													 value="${questionnarieDto.spouseObj.city}"
													 autocomplete="off" placeholder="City" name="uspousecity" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-6">
													<input id="uspousezipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													value="${questionnarieDto.spouseObj.zipcode}"
													 autocomplete="off" placeholder="Zip Code" name="uspousezipcode" class="form-control"  required>
												</div>
											</div> 
										    
										    </div>
										    <div class="col-md-6 col-sm-12">
										    	<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-6">
													<input id="uspouseline2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													 placeholder="Enter Line2"
													 autocomplete="off" name="uspouseline2" class="form-control" value="${questionnarieDto.spouseObj.line2}" >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-6">
													<input id="uspousestate" type="text"  minlength="2" maxlength="25"
													value="${questionnarieDto.spouseObj.state}"
													 autocomplete="off" placeholder="State" name="uspousestate" class="form-control"  required>
												</div>
											</div>
										    
										    </div>
										 <div class="col-md-6 col-sm-12">	
										     <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Home/Foreign/Permanent address outside U.S.A. :</label>
												<div class="col-sm-6">
							   					   <textarea id="uspousepermanentAddr" type="text" row="3" column="50" required
											   		placeholder="Employee Address" name="uspousepermanentAddr" class="form-control">${questionnarieDto.spouseObj.outside_us_address}</textarea>
												</div>
										    </div>
										</div>
									  </div>
								  </div>
								  
								  	<c:if test="${questionnarieDto.spouseEntryList.size() gt 0}">
								  		<table class="table information_json" id="tableId" style="width: 70%;margin-left: 20%;">
												<thead>
												<tr style="line-height: 0px;border-bottom:0px;">
													<th style="border-bottom:0px;">Arrival Date</th>
													<th  style="border-bottom:0px;">Arrival Visa</th>
													<th  style="border-bottom:0px;">Departure Date</th>
													<th  style="border-bottom:0px;">Departure Visa</th>
												</tr>
												</thead>
									   </table>
								  	<c:forEach var="spouseEntryList" items="${questionnarieDto.spouseEntryList}">
								  	 <input type="hidden" id="spouseEntryid" name="spouseEntryid" value="${spouseEntryList.dates_id}">
								    <div class="form-group row">
										<label for="inputPassword" class="col-sm-2 control-label"></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" value="${spouseEntryList.arrival_date}" autocomplete="off"
											name="uspousearrivalDate[]" id="uspousearrivalDate${spouseEntryList.dates_id}" placeholder="Arrival Date" onkeydown="return false">
										</div>
										<div class="col-sm-2">
										    <select id="uspousearrivalVisa${spouseEntryList.dates_id}" name="uspousearrivalVisa[]" class="form-control" >
													 <option value="">Arrival Visa</option>
													 <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}" ${nonimmistatus == spouseEntryList.arrival_visa ? 'selected="selected"' : ''}>${nonimmistatus}</option>
												    </c:forEach>
											</select>
										<!-- 	<input type="text" class="form-control"
											name="" id="arrivalVisa[]" placeholder="Arrival Visa"> -->
										</div>
										<div class="col-sm-2">
											<input type="text" class="form-control"  value="${spouseEntryList.departure_date}" autocomplete="off"
											name="uspousedepartureDate[]" id="uspousedepartureDate${spouseEntryList.dates_id}" placeholder="Departure Date" onkeydown="return false">
										</div>
										<div class="col-sm-2">
										     <select id="uspousedepartureVisa${spouseEntryList.dates_id}" name="uspousedepartureVisa[]" class="form-control"  value="${spouseEntryList.departure_visa}">
													 <option value="">Departure Visa</option>
													  <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}" ${nonimmistatus == spouseEntryList.departure_visa ? 'selected="selected"' : ''}>${nonimmistatus}</option>
												    </c:forEach>
											</select>
										</div>
									</div>
								</c:forEach>
							   </c:if>
								 <c:if test="${role == 1}">
							     <div class='form-group row' id="add">
                                       <label for="inputPassword" class="col-sm-2 control-label">Entry and Exit Dates</label>
												<div class="col-xs-4">
													<button type="button" class="btn btn-sm btn-success addButton">
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                 </div>  
                                 </c:if>
                                 
                                 <div id="uspouseaddEntrtyExits" style="display:none;">
                                 <input type="hidden" id="usparrId">
									<div class="form-group row">
										<label for="inputPassword" class="col-sm-2 control-label"></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" autocomplete="off"
											name="auspousearrivalDate[]" id="auspousearrivalDate[]" placeholder="Arrival Date" onkeydown="return false">
										</div>
										<div class="col-sm-2">
										    <select id="auspousearrivalVisa[]" name="auspousearrivalVisa[]" class="form-control" >
													  <option value="">Arrival Visa</option>
													<c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}">${nonimmistatus}</option>
												       </c:forEach>
											</select>
										<!-- 	<input type="text" class="form-control"
											name="" id="arrivalVisa[]" placeholder="Arrival Visa"> -->
										</div>
										<div class="col-sm-2">
											<input type="text" class="form-control" autocomplete="off"
											name="auspousedepartureDate[]" id="auspousedepartureDate[]" placeholder="Departure Date"disabled onkeydown="return false">
										</div>
										<div class="col-sm-2">
										     <select id="auspousedepartureVisa[]" name="auspousedepartureVisa[]" class="form-control" >
													 <option value="">Departure Visa</option>
													<c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}">${nonimmistatus}</option>
												       </c:forEach>
											</select>
										</div>
										<div id="remId" style="display:block;">
											 <button type="button" class="btn btn-sm btn-danger removeButton">
														<i class="fa fa-minus"></i>
											 </button>
										</div>
									</div>
								</div>
											<c:if test="${role == 1}">
											<div class="text-center ml-5">
												<input type="button" class="btn btn-default" id="uspousesbtnUpdate" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Update">
												<a href="mydocuments" class="btn btn-default" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;" id="reset">Back</a>
											</div>
											</c:if>
										</form>
							     <c:if test="${role == 4 && questionnarieDto.initiateObj.status=='Active'}">
							     <div class="text-center ml-5">
							     <input type="button" id="btnh1bspouseAdmin"
							        style="border-radius: 12px;background-color:#2196f3;"
							        class="btn btn-primary btn-sm collapsibleh1bspouseAdmin" value="Spouse Status">
							     <c:if test="${questionnarieDto.rejformsspousehistoryList.size() gt 0}">
							     <button type="button"	style='letter-spacing: 1px; background-color:#15aabf;color:white;' class="btn btn-info btn-sm addButton" 
									onclick="viewCommentHistory1(${questionnarieDto.spouseObj.h1questionnrie_id},'Spouse','H1B Questionnaries')"><i class="fa fa-history"></i></button>
							     </c:if>
							     <!-- <a href="immigration" class="btn btn-secondary btn-sm" >Back</a> -->
							     </div> 
							    </c:if>
							    
										
										</div>
										</c:when>
										<c:otherwise>
										<div id="h1bSpouseId">
										<form action="/" class="form-horizontal" id="spouseh1bqueDetailsForm" enctype="multipart/form-data">
										<input type="hidden" id="spouseh1que_id" name="spouseh1que_id">
										<c:choose>
										<c:when test="${not empty questionnarieDto.tempspouseObj.h1questionnrie_id}">
										<input type="hidden" id="tspouseh1que_id" name="tspouseh1que_id" value="${questionnarieDto.tempspouseObj.h1questionnrie_id}">
										<input type="hidden" id="tsp_passportNo" value="${questionnarieDto.tempspouseObj.passport_number}">
										<input type="hidden" id="tsp_ssnNo" value="${questionnarieDto.tempspouseObj.ssn}">
										</c:when>
										<c:otherwise>
										<input type="hidden" id="tspouseh1que_id" name="tspouseh1que_id" >
										</c:otherwise>
										</c:choose>
										
											<h4><b>Candidate Details</b></h4>
											<!-- <input id="benftype" name="benftype" type="hidden"> -->
											<!-- <div class="form-group row row" >
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>SSN Number</label>
												<div class="col-sm-4">
													<input id="ssn_emp"  type="text"  autocomplete="off"
													 placeholder="SSN Number" name="ssn_emp" class="form-control" required>
													<span id="ssnshow" style="color: red;"></span>
												</div>
											</div> -->
											<div id="h1bqueDiv">
											<div class="row">
										    <div class="col-md-6 col-sm-12">
										    	<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Last Name</label>
												<div class="col-sm-6">
													<input id="spousefamilyName" type="text" minlength="1" maxlength="40"
													  value="${questionnarieDto.tempspouseObj.family_name}"
													 autocomplete="off" placeholder="Last Name" name="spousefamilyName" class="form-control"  required>
												</div>
											</div>
											
										     <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>First Name</label>
												<div class="col-sm-6">
													<input id="spousefirstName" type="text"  autocomplete="off"  autocomplete="off" minlength="2" maxlength="40"
													 placeholder="First Name" name="spousefirstName" class="form-control" value="${questionnarieDto.tempspouseObj.first_name}" required >
												</div><!--  -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Middle Name</label>
												<div class="col-sm-6">
													<input id="spousemiddleName" type="text"  minlength="1" maxlength="40"
													value="${questionnarieDto.tempspouseObj.middle_name}"
													 autocomplete="off" placeholder="Middle Name" name="spousemiddleName" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Country of Citizenship</label>
											<div class="col-sm-6">
												<input type="text" id="spousecountryofcitizenship" class="form-control text-left"  value="${questionnarieDto.tempspouseObj.country_citizenship}"   autocomplete="off"
												 name="spousecountryofcitizenship" placeholder="Country of Citizenship" class="form-control" required >
											</div>
											</div>
											<!-- <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Highest Education</label>
											<div class="col-sm-6">
												<input type="text" id="citizenship" class="form-control text-left"     autocomplete="off"
												title="Enter Country of Citizenship" name="citizenship" placeholder="Highest Education" class="form-control" required >
											</div>
											</div> -->
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Telephone Number in US</label>
												<div class="col-sm-6">
													<input id="spousetelephoneNo" type="text" minlength="12"	maxlength="12"
													value="${questionnarieDto.tempspouseObj.us_phonenumber}"
													 autocomplete="off" placeholder="Telephone Number in US" name="spousetelephoneNo" class="form-control"  >
												</div>
											</div>
											
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Social Security Number</label>
												<div class="col-sm-6">
													<input id="spousessnNo" type="text" minlength="11" maxlength="11" 
													placeholder="Enter SSN Number as AAA-GG-SSSS"  name="spousessnNo" class="form-control"  >
													  <span  style="color:red;" id="spssnshow"></span>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>I-94 Number</label>
												<div class="col-sm-6">
													<input id="spousei94No" type="text"  minlength="11" maxlength="11"
													value="${questionnarieDto.tempspouseObj.i94_number}"
													 autocomplete="off" placeholder="I-94 Number" name="spousei94No" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Current Non-Immigrant Status</label>
												<div class="col-sm-6">
													<select id="spouseimmigrantstatus" type="text"  minlength="1" maxlength="40"
													 autocomplete="off" placeholder="Current Non-Immigrant Status" name="spouseimmigrantstatus" class="form-control" >
													 <option value="">Select Non-Immigrant Status</option>
													 <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}" ${nonimmistatus == questionnarieDto.tempspouseObj.current_non_immiStatus ? 'selected="selected"' : ''}>${nonimmistatus}</option>
												    </c:forEach>
													 </select>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Most Recent Entry Into US</label>
											<div class="col-sm-6">
												<input type="text" id="spousedateofrecentEntry" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.tempspouseObj.recententry_dateinUS}"
												 name="spousedateofrecentEntry" placeholder="Date Of Most Recent Entry Into US" class="form-control" required onkeydown="return false">
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Personal email id</label>
												<div class="col-sm-6">
													<input id="spousepersonalemailid" type="text"  minlength="1" maxlength="40"
													value="${questionnarieDto.tempspouseObj.personal_email}"
													 autocomplete="off" placeholder="Personal email id" name="spousepersonalemailid" class="form-control"  >
												</div>
											</div>
											
											
										    </div>
										    <div class="col-md-6 col-sm-12">
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="spousedob" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.tempspouseObj.dob}"
												 name="spousedob" placeholder="Date Of Birth" class="form-control" required onkeydown="return false">
											</div>
											</div>
											
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Country Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="spousecountryofbirth" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.tempspouseObj.country_birth}"
												name="spousecountryofbirth" placeholder="Country Of Birth" class="form-control" required >
											</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="spousecityofbirth" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.tempspouseObj.city_birth}"
												name="spousecityofbirth" placeholder="City Of Birth" class="form-control" required >
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Number</label>
												<div class="col-sm-6">
													<input id="spousepassportNo" type="text"  minlength="9" maxlength="16"
													 autocomplete="off" placeholder="Passport Number" name="spousepassportNo" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Issue Date</label>
											<div class="col-sm-6">												
											<input type="text" id="spousepassportissueDate" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.tempspouseObj.passport_issuedate}"
												 name="spousepassportissueDate" placeholder="Passport Issue Date" class="form-control" required onkeydown="return false">
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Expiry Date</label>
											<div class="col-sm-6">
												<input type="text" id="spousepassportexpDate" class="form-control text-left"     autocomplete="off" value="${questionnarieDto.tempspouseObj.passport_expirydate}"
												 name="spousepassportexpDate" placeholder="Passport Expiry Date" class="form-control" required onkeydown="return false">
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Status</label>
												<div class="col-sm-6">
													  <select id="spousestausofrecentEntry" name="spousestausofrecentEntry" class="form-control">
													 <option value="">Please select status</option>
													 <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}" ${nonimmistatus == questionnarieDto.tempspouseObj.recententry_statusinUS ? 'selected="selected"' : ''}>${nonimmistatus}</option>
												    </c:forEach>
												    </select>
												</div>
											</div>
										    </div>
										    <div class="col-md-6 col-sm-12">
										    <h5><b>Address in U.S.A.</b></h5>
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-6">
													<input id="spouseline1" type="text"  minlength="2" maxlength="40" value="${questionnarieDto.tempspouseObj.line1}"
													 autocomplete="off" placeholder="Enter Line1" name="spouseline1" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-6">
													<input id="spousecity" type="text"  minlength="2" maxlength="25"
													 value="${questionnarieDto.tempspouseObj.city}"
													 autocomplete="off" placeholder="City" name="spousecity" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-6">
													<input id="spousezipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													value="${questionnarieDto.tempspouseObj.zipcode}"
													 autocomplete="off" placeholder="Zip Code" name="spousezipcode" class="form-control"  required>
												</div>
											</div> 
										    
										    </div>
										    <div class="col-md-6 col-sm-12">
										    	<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-6">
													<input id="spouseline2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													 placeholder="Enter Line2"
													 autocomplete="off" name="spouseline2" class="form-control" value="${questionnarieDto.tempspouseObj.line2}" >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-6">
													<input id="spousestate" type="text"  minlength="2" maxlength="25"
													value="${questionnarieDto.tempspouseObj.state}"
													 autocomplete="off" placeholder="State" name="spousestate" class="form-control"  required>
												</div>
											</div>
										    
										    </div>
										 <div class="col-md-6 col-sm-12">	
										     <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Home/Foreign/Permanent address outside U.S.A. :</label>
												<div class="col-sm-6">
							   					   <textarea id="spousepermanentAddr" type="text" row="3" column="50" required
											   		placeholder="Employee Address" name="spousepermanentAddr" class="form-control">${questionnarieDto.tempspouseObj.outside_us_address}</textarea>
												</div>
										    </div>
										</div>
									  </div>
								  </div>
								  
								  	<c:if test="${questionnarieDto.spouseEntryList.size() gt 0}">
								  		<table class="table information_json" id="tableId" style="width: 70%;margin-left: 20%;">
												<thead>
												<tr style="line-height: 0px;border-bottom:0px;">
													<th style="border-bottom:0px;">Arrival Date</th>
													<th  style="border-bottom:0px;">Arrival Visa</th>
													<th  style="border-bottom:0px;">Departure Date</th>
													<th  style="border-bottom:0px;">Departure Visa</th>
												</tr>
												</thead>
									   </table>
								  	<c:forEach var="tempspouseEntryList" items="${questionnarieDto.tempspouseEntryList}">
								  	 <input type="hidden" id="tspouseEntryid" name="tspouseEntryid" value="${tempspouseEntryList.dates_id}">
								    <div class="form-group row">
										<label for="inputPassword" class="col-sm-2 control-label"></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" value="${tempspouseEntryList.arrival_date}" autocomplete="off"
											name="tspousearrivalDate" id="tspousearrivalDate${tempspouseEntryList.dates_id}" placeholder="Arrival Date" onkeydown="return false">
										</div>
										<div class="col-sm-2">
										    <select id="tspousearrivalVisa${tempspouseEntryList.dates_id}" name="tspousearrivalVisa" class="form-control" >
													 <option value="">Arrival Visa</option>
													 <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}" ${nonimmistatus == tempspouseEntryList.arrival_visa ? 'selected="selected"' : ''}>${nonimmistatus}</option>
												    </c:forEach>
											</select>
										<!-- 	<input type="text" class="form-control"
											name="" id="arrivalVisa[]" placeholder="Arrival Visa"> -->
										</div>
										<div class="col-sm-2">
											<input type="text" class="form-control"  value="${tempspouseEntryList.departure_date}" autocomplete="off"
											name="tspousedepartureDate" id="tspousedepartureDate${tempspouseEntryList.dates_id}" placeholder="Departure Date" onkeydown="return false">
										</div>
										<div class="col-sm-2">
										     <select id="tspousedepartureVisa${tempspouseEntryList.dates_id}" name="tspousedepartureVisa" class="form-control"  value="${spouseEntryList.departure_visa}">
													 <option value="">Departure Visa</option>
													  <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}" ${nonimmistatus == tempspouseEntryList.departure_visa ? 'selected="selected"' : ''}>${nonimmistatus}</option>
												    </c:forEach>
											</select>
										</div>
									</div>
								</c:forEach>
							   </c:if>
								 <c:if test="${role == 1}">
							     <div class='form-group row' id="add">
                                       <label for="inputPassword" class="col-sm-2 control-label">Entry and Exit Dates</label>
												<div class="col-xs-4">
													<button type="button" class="btn btn-sm btn-success addButton" id="spousebtnid" disabled>
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                 </div>  
                                 </c:if>
                                 
                                 <div id="spouseaddEntrtyExits" style="display:none;">
                                 	<input type="hidden" id="sparrId">
									<div class="form-group row">
										<label for="inputPassword" class="col-sm-2 control-label"></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" autocomplete="off"
											name="spousearrivalDate[]" id="spousearrivalDate[]" placeholder="Arrival Date" onkeydown="return false">
										</div>
										<div class="col-sm-2">
										    <select id="spousearrivalVisa[]" name="spousearrivalVisa[]" class="form-control" >
													  <option value="">Arrival Visa</option>
													<c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}">${nonimmistatus}</option>
												       </c:forEach>
											</select>
										<!-- 	<input type="text" class="form-control"
											name="" id="arrivalVisa[]" placeholder="Arrival Visa"> -->
										</div>
										<div class="col-sm-2">
											<input type="text" class="form-control" autocomplete="off"
											name="spousedepartureDate[]" id="spousedepartureDate[]" placeholder="Departure Date" disabled onkeydown="return false">
										</div>
										<div class="col-sm-2">
										     <select id="spousedepartureVisa[]" name="spousedepartureVisa[]" class="form-control" >
													 <option value="">Departure Visa</option>
													<c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}">${nonimmistatus}</option>
												       </c:forEach>
											</select>
										</div>
										<div id="remId" style="display:block;">
											 <button type="button" class="btn btn-sm btn-danger removeButton">
														<i class="fa fa-minus"></i>
											 </button>
										</div>
									</div>
								</div>
											<c:if test="${role == 1}">
											<div class="text-center ml-5">
											    <input type="button" class="btn btn-default" id="spousesaveid" style="padding:7px;background-color:#2196f3;color:white;text-transform:INITIAL;line-height:0.728571;" value="Save & Continue">
												<input type="button" class="btn btn-default" id="spousesubmitid" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Submit">
												<input type="button" class="btn btn-default" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;" id="spouseresetid" value="Reset">
												<a href="mydocuments" class="btn btn-default" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;" id="reset">Back</a>
											</div>
											</c:if>
										</form>
										</div>
										
										<%-- <div id="h1bSpouseId">
										<form action="/" class="form-horizontal" id="spouseh1bqueDetailsForm" enctype="multipart/form-data">
										<input type="hidden" id="spouseh1que_id" name="spouseh1que_id">
											<h4><b>Candidate Details</b></h4>
									
											<div id="h1bqueDiv">
											<div class="row">
										    <div class="col-md-6 col-sm-12">
										    	<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Last Name</label>
												<div class="col-sm-6">
													<input id="spousefamilyName" type="text" minlength="1" maxlength="40"
													 autocomplete="off" placeholder="Last Name" name="spousefamilyName" class="form-control"  required>
												</div>
											</div>
											
										     <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>First Name</label>
												<div class="col-sm-6">
													<input id="spousefirstName" type="text"  autocomplete="off"  autocomplete="off" minlength="2" maxlength="40"
													 placeholder="First Name" name="spousefirstName" class="form-control"  required>
												</div><!--  -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Middle Name</label>
												<div class="col-sm-6">
													<input id="spousemiddleName" type="text"  minlength="1" maxlength="40"
													 autocomplete="off" placeholder="Middle Name" name="spousemiddleName" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Country of Citizenship</label>
											<div class="col-sm-6">
												<input type="text" id="spousecountryofcitizenship" class="form-control text-left"     autocomplete="off"
												name="spousecountryofcitizenship" placeholder="Country of Citizenship" class="form-control" required >
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Telephone Number in US</label>
												<div class="col-sm-6">
													<input id="spousetelephoneNo" type="text" minlength="12"	maxlength="12"
													 autocomplete="off" placeholder="Telephone Number in US" name="spousetelephoneNo" class="form-control"  >
												</div>
											</div>
											
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Social Security Number</label>
												<div class="col-sm-6">
													<input id="spousessnNo" type="text" minlength="11" maxlength="11"
													 placeholder="Enter SSN Number as AAA-GG-SSSS"  name="spousessnNo" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>I-94 Number</label>
												<div class="col-sm-6">
													<input id="spousei94No" type="text"  minlength="11" maxlength="11"
													 autocomplete="off" placeholder="I-94 Number" name="spousei94No" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Most Recent Entry Into US</label>
											<div class="col-sm-6">
												<input type="text" id="spousedateofrecentEntry" class="form-control text-left"     autocomplete="off"
												 name="spousedateofrecentEntry" placeholder="Date Of Most Recent Entry Into US" class="form-control" required disabled onkeydown="return false">
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Personal email id</label>
												<div class="col-sm-6">
													<input id="spousepersonalemailid" type="text"  minlength="1" maxlength="40"
													 autocomplete="off" placeholder="Personal email id" name="spousepersonalemailid" class="form-control"  >
												</div>
											</div>
											
											
										    </div>
										    <div class="col-md-6 col-sm-12">
										    
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="spousedob" class="form-control text-left"     autocomplete="off"
												 name="spousedob" placeholder="Date Of Birth" class="form-control" required onkeydown="return false">
											</div>
											</div>
											
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Country Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="spousecountryofbirth" class="form-control text-left"     autocomplete="off"
												 name="spousecountryofbirth" placeholder="Country Of Birth" class="form-control" required >
											</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="spousecityofbirth" class="form-control text-left"     autocomplete="off"
												 name="spousecityofbirth" placeholder="City Of Birth" class="form-control" required >
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Number</label>
												<div class="col-sm-6">
													<input id="spousepassportNo" type="text"  minlength="9" maxlength="16"
													 autocomplete="off" placeholder="Passport Number" name="spousepassportNo" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Issue Date</label>
											<div class="col-sm-6">
												<input type="text" id="spousepassportissueDate" class="form-control text-left"     autocomplete="off"
												 name="spousepassportissueDate" placeholder="Passport Issue Date" class="form-control" required disabled onkeydown="return false">
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Expiry Date</label>
											<div class="col-sm-6">
												<input type="text" id="spousepassportexpDate" class="form-control text-left"     autocomplete="off"
												 name="spousepassportexpDate" placeholder="Passport Expiry Date" class="form-control" required disabled onkeydown="return false">
											</div>
											</div>
											
												<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Current Non-Immigrant Status</label>
												<div class="col-sm-6">
													<select id="spouseimmigrantstatus"
													 autocomplete="off" placeholder="Current Non-Immigrant Status" name="spouseimmigrantstatus" class="form-control" >
													 <option value="">Select Non-Immigrant Status</option>
													   <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}">${nonimmistatus}</option>
												       </c:forEach>
													 </select>
												</div>
											</div>
											
											<!-- <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Status</label>
												<div class="col-sm-6">
													<input id="familyName" type="text" minlength="1" maxlength="40"
													title="only alphabets are allowed" 
													 autocomplete="off" placeholder="Status" name="familyName" class="form-control"  required>
												</div>
											</div> -->
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Status</label>
												<div class="col-sm-6">
												<!-- 	<input id="spousestausofrecentEntry" type="text" minlength="1" maxlength="40"
													title="only alphabets are allowed" 
													 autocomplete="off" placeholder="Status" name="spousestausofrecentEntry" class="form-control"  required> -->
													 <select id="spousestausofrecentEntry" name="spousestausofrecentEntry" class="form-control">
													    <option value="">Please Select Status</option>
													   <c:forEach var="nonimmistatus" items="${immiStatusList}">
														<option value="${nonimmistatus}">${nonimmistatus}</option>
												     </c:forEach>
											       </select>
												</div>
											</div>
										    </div>
										    <div class="col-md-6 col-sm-12">
										    <h5><b>Address in U.S.A.</b></h5>
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-6">
													<input id="spouseline1" type="text"  minlength="2" maxlength="40" 
													 autocomplete="off" placeholder="Enter Line1" name="spouseline1" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-6">
													<input id="spousecity" type="text"  minlength="2" maxlength="25"
													 autocomplete="off" placeholder="City" name="spousecity" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-6">
													<input id="spousezipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													 autocomplete="off" placeholder="Zip Code" name="spousezipcode" class="form-control"  required>
												</div>
											</div> 
										    
										    </div>
										    <div class="col-md-6 col-sm-12">
										    	<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-6">
													<input id="spouseline2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													  placeholder="Enter Line2"
													 autocomplete="off" name="spouseline2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-6">
													<input id="spousestate" type="text"  minlength="2" maxlength="25"
													 autocomplete="off" placeholder="State" name="spousestate" class="form-control"  required>
												</div>
											</div>
										    
										    </div>
										 <div class="col-md-6 col-sm-12">	
										     <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Home/Foreign/Permanent address outside U.S.A. :</label>
												<div class="col-sm-6">
							   					   <textarea id="spousepermanentAddr" type="text" row="3" column="50" required
											   		  placeholder="Employee Address" name="spousepermanentAddr" class="form-control"></textarea>
												</div>
										    </div>
										</div>
									  </div>
								  </div>
								  <c:if test="${role == 1}">
								   <div class='form-group row' id="add">
                                       <label for="inputPassword" class="col-sm-2 control-label">Entry and Exit Dates</label>
												<div class="col-xs-4">
													<button type="button" class="btn btn-sm btn-success addButton" id="spousebtnid" disabled>
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                 </div> 
                                 </c:if> 
                                 
                                 <div id="spouseaddEntrtyExits" style="display:none;">
                                 	<input type="hidden" id="sparrId">
									<div class="form-group row">
										<label for="inputPassword" class="col-sm-2 control-label"></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" autocomplete="off"
											name="spousearrivalDate[]" id="spousearrivalDate[]" placeholder="Arrival Date" onkeydown="return false">
										</div>
										<div class="col-sm-2">
										    <select id="spousearrivalVisa[]" name="spousearrivalVisa[]" class="form-control" >
													  <option value="">Arrival Visa</option>
													<c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}">${nonimmistatus}</option>
												       </c:forEach>
											</select>
										<!-- 	<input type="text" class="form-control"
											name="" id="arrivalVisa[]" placeholder="Arrival Visa"> -->
										</div>
										<div class="col-sm-2">
											<input type="text" class="form-control" autocomplete="off"
											name="spousedepartureDate[]" id="spousedepartureDate[]" placeholder="Departure Date" disabled onkeydown="return false">
										</div>
										<div class="col-sm-2">
										     <select id="spousedepartureVisa[]" name="spousedepartureVisa[]" class="form-control" >
													 <option value="">Departure Visa</option>
													<c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}">${nonimmistatus}</option>
												       </c:forEach>
											</select>
										</div>
										<div id="remId" style="display:block;">
											 <button type="button" class="btn btn-sm btn-danger removeButton">
														<i class="fa fa-minus"></i>
											 </button>
										</div>
									</div>
								</div>
											<c:if test="${role == 1}">
											<div class="text-center ml-5">
												<input type="button" class="btn btn-default" id="spousesubmitid" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Submit">
												<input type="button" class="btn btn-default" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;" id="spouseresetid" value="Reset">
												<a href="mydocuments" class="btn btn-default" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;" id="reset">Back</a>
											</div>
											</c:if>
										</form>
										</div> --%>
										</c:otherwise>
										</c:choose>
										
										<div id="h1bChildId" style="display:none;">
										<form action="/" class="form-horizontal" id="childh1bqueDetailsForm" enctype="multipart/form-data">
											<h4><b>Candidate Details</b></h4>
											<div id="h1bqueDiv">
											<div class="row">
										    <div class="col-md-6 col-sm-12">
										    	<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Last Name</label>
												<div class="col-sm-6">
													<input id="childfamilyName" type="text" minlength="1" maxlength="40"
													 autocomplete="off" placeholder="Last Name" name="childfamilyName" class="form-control"  required>
												</div>
											</div>
											
										     <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>First Name</label>
												<div class="col-sm-6">
													<input id="childfirstName" type="text"  autocomplete="off"  autocomplete="off" minlength="2" maxlength="40"
													 placeholder="First Name" name="childfirstName" class="form-control"  required>
												</div><!--  -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Middle Name</label>
												<div class="col-sm-6">
													<input id="childmiddleName" type="text"  minlength="1" maxlength="40"
													 autocomplete="off" placeholder="Middle Name" name="childmiddleName" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Country of Citizenship</label>
											<div class="col-sm-6">
												<input type="text" id="childcountryofcitizenship" class="form-control text-left"     autocomplete="off"
												title="Enter Country of Citizenship" name="childcountryofcitizenship" placeholder="Country of Citizenship" class="form-control" required >
											</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Telephone Number in US</label>
												<div class="col-sm-6">
													<input id="childtelephoneNo" type="text" minlength="12"	maxlength="12"
													 autocomplete="off" placeholder="Telephone Number in US" name="childtelephoneNo" class="form-control"  >
												</div>
											</div>
											
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Social Security Number</label>
												<div class="col-sm-6">
													<input id="childssnNo" type="text" minlength="11" maxlength="11"
													 placeholder="Enter SSN Number as AAA-GG-SSSS"  name="childssnNo" class="form-control"  >
													   <span  style="color:red;" id="chssnshow"></span>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>I-94 Number</label>
												<div class="col-sm-6">
													<input id="childi94No" type="text" minlength="11" maxlength="11"
													 autocomplete="off" placeholder="I-94 Number" name="childi94No" class="form-control"  >
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Most Recent Entry Into US</label>
											<div class="col-sm-6">
												<input type="text" id="childdateofrecentEntry" class="form-control text-left"     autocomplete="off"
												 name="childdateofrecentEntry" placeholder="Date Of Most Recent Entry Into US" class="form-control" required disabled onkeydown="return false">
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Personal email id</label>
												<div class="col-sm-6">
													<input id="childpersonalemailid" type="text"  minlength="1" maxlength="40"
													 autocomplete="off" placeholder="Personal email id" name="childpersonalemailid" class="form-control"  >
												</div>
											</div>
										    </div>
										    <div class="col-md-6 col-sm-12">
										    
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="childdob" class="form-control text-left"     autocomplete="off"
												 name="childdob" placeholder="Date Of Birth" class="form-control" required onkeydown="return false">
											</div>
											</div>
											
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Country Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="childcountryofbirth" class="form-control text-left"     autocomplete="off"
												 name="childcountryofbirth" placeholder="Country Of Birth" class="form-control" required >
											</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City Of Birth</label>
											<div class="col-sm-6">
												<input type="text" id="childcityofbirth" class="form-control text-left"     autocomplete="off"
												 name="childcityofbirth" placeholder="City Of Birth" class="form-control" required >
											</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Number</label>
												<div class="col-sm-6">
													<input id="childpassportNo" type="text"  minlength="9" maxlength="16"
													 autocomplete="off" placeholder="Passport Number" name="childpassportNo" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Issue Date</label>
											<div class="col-sm-6">
												<input type="text" id="childpassportissueDate" class="form-control text-left"     autocomplete="off"
												 name="childpassportissueDate" placeholder="Passport Issue Date" class="form-control" required disabled onkeydown="return false">
											</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Expiry Date</label>
											<div class="col-sm-6">
												<input type="text" id="childpassportexpDate" class="form-control text-left"     autocomplete="off"
												 name="childpassportexpDate" placeholder="Passport Expiry Date" class="form-control" required disabled onkeydown="return false">
											</div>
											</div>
											
												<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Current Non-Immigrant Status</label>
												<div class="col-sm-6">
													<select id="childimmigrantstatus"  
													 autocomplete="off" placeholder="Current Non-Immigrant Status" name="childimmigrantstatus" class="form-control" >
													 <option value="">Select Non-Immigrant Status</option>
													   <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}">${nonimmistatus}</option>
												       </c:forEach>
													 </select>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Status</label>
												<div class="col-sm-6">
													  <select id="childstausofrecentEntry" name="childstausofrecentEntry" class="form-control">
													    <option value="">Please Select Status</option>
													   <c:forEach var="nonimmistatus" items="${immiStatusList}">
														<option value="${nonimmistatus}">${nonimmistatus}</option>
												     </c:forEach>
											       </select>
												</div>
											</div>
										    </div>
										    <div class="col-md-6 col-sm-12">
										    <h5><b>Address in U.S.A.</b></h5>
										    <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Line1</label>
												<div class="col-sm-6">
													<input id="childline1" type="text"  minlength="2" maxlength="40" 
													 autocomplete="off" placeholder="Enter Line1" name="childline1" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City</label>
												<div class="col-sm-6">
													<input id="childcity" type="text"  minlength="2" maxlength="25"
													 autocomplete="off" placeholder="City" name="childcity" class="form-control"  required>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Zip Code</label>
												<div class="col-sm-6">
													<input id="childzipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
													 autocomplete="off" placeholder="Zip Code" name="childzipcode" class="form-control"  required>
												</div>
											</div> 
										    
										    </div>
										    <div class="col-md-6 col-sm-12">
										    	<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Line2</label>
												<div class="col-sm-6">
													<input id="childline2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
													 placeholder="Enter Line2"
													 autocomplete="off" name="childline2" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>State</label>
												<div class="col-sm-6">
													<input id="childstate" type="text"  minlength="2" maxlength="25"
													 autocomplete="off" placeholder="State" name="childstate" class="form-control"  required>
												</div>
											</div>
										    
										    </div>
										 <div class="col-md-6 col-sm-12">	
										     <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Home/Foreign/Permanent address outside U.S.A. :</label>
												<div class="col-sm-6">
							   					   <textarea id="childpermanentAddr" type="text" row="3" column="50" required
											   		 placeholder="Employee Address" name="childpermanentAddr" class="form-control"></textarea>
												</div>
										    </div>
										</div>
									  </div>
								  </div>
								  
								   <div class='form-group row' id="add">
                                       <label for="inputPassword" class="col-sm-2 control-label">Entry and Exit Dates</label>
												<div class="col-xs-4">
													<button type="button" id="childbtnid" class="btn btn-sm btn-success addButton">
														<i class="fa fa-plus"></i>
													</button>
												</div>
                                 </div>  
                                 
                                 <div id="childaddEntrtyExits" style="display:none;">
                                     <input type="hidden" id="charrId">
									<div class="form-group row">
										<label for="inputPassword" class="col-sm-2 control-label"></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" autocomplete="off"
											name="childarrivalDate[]" id="childarrivalDate[]" placeholder="Arrival Date" onkeydown="return false">
										</div>
										<div class="col-sm-2">
										    <select id="childarrivalVisa[]" name="childarrivalVisa[]" class="form-control" >
													  <option value="">Arrival Visa</option>
													 <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}">${nonimmistatus}</option>
												       </c:forEach>
											</select>
										</div>
										<div class="col-sm-2">
											<input type="text" class="form-control" autocomplete="off"
											name="childdepartureDate[]" id="childdepartureDate[]" placeholder="Departure Date" disabled onkeydown="return false">
										</div>
										<div class="col-sm-2">
										     <select id="childdepartureVisa[]" name="childdepartureVisa[]" class="form-control" >
													 <option value="">Departure Visa</option>
													<c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}">${nonimmistatus}</option>
												       </c:forEach>
											</select>
										</div>
										<div id="remId" style="display:block;">
											 <button type="button" class="btn btn-sm btn-danger removeButton">
														<i class="fa fa-minus"></i>
											 </button>
										</div>
									</div>
								</div>
										<c:if test="${role == 1}">
									     <div class="text-center ml-5">
												<input type="button" class="btn btn-default" id="childsubmitid" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Submit">
												<input type="button" class="btn btn-default" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;" id="childresetid" value="Reset">
												<a href="mydocuments" class="btn btn-default" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;" id="reset">Back</a>
											</div>
											</c:if>
										</form>
										</div>
								    </fieldset>
								<!-- </div> -->
							</div>
			<br><br>					
			<div class="row">
			<c:if test="${role == 4}">
			<input type="hidden"  name="candidate_id"  id="candidateId" value="${candId}">
					<%-- <center>
						<div>
						<form  action="/" id="updatecvlimmiformstausId" method="post" >
						<input type="hidden" id="form_type" name="form_type" value="H1B Questionnaries">
						<input type="hidden" id="verifierStatus" value="${questionnarieDto.formObj.verifier_status}">
						<input type="hidden"  name="candidate_id"  id="candidateId" value="${candId}">
					      <div class="form-group row"  style="width: 160%;">
								<label for="inputPassword" class="col-sm-6 control-label"><Span style="color:red;">*</Span>Select Status</label>
									<div class="col-sm-5">
												<select id="approveStatus" name="approveStatus" class="form-control">
											<option value="">-Select Status-</option>
												<option value="Approved" >Approve</option>
												<option value="Rejected" >Reject</option> 
												</select>
											</div>
								</div> 
					       <div class="form-group row" style="width: 160%;">
								<label for="inputPassword" class="col-sm-6 control-label"><Span style="color:red;">*</Span>Comments</label>
									<div class="col-sm-5">
										<textarea type="text"  id="candicomments" name="comment" rows="4" cols="50" minlength="2"
										 placeholder="Enter Comments"  class="form-control" required></textarea>
									</div>
								<div> <button type="button"	style='letter-spacing: 1px; background-color:#15aabf;color:white;' class="btn btn-info btn-sm addButton" 
									onclick="viewCommentHistory(${candId},'H1B Questionnaries')"><i class="fa fa-history"></i></button></div>
							
							</div>
							  <div class="form-group row" style="width: 160%;">
							<label for="inputPassword" class="col-sm-6 control-label"><Span style="color:red;"></Span></label>
							<div class="col-sm-5">
								<button type="button" class="btn btn-primary btn-sm" id="cvlbtnUpdateadmin">Submit</button>
								<a href="immigration" class="btn btn-secondary btn-sm" >Back</a>
								</div>
							</div> 
					</form>
			</div></center> --%>
						</c:if>
					</div>	
							
						</div>
					</div>
				</div>
			</div>
			</div>
				<div class="modal fade" id="commentshistory" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 160px;">
			<div class="modal-dialog modal-lg" role="document" style="width:120%;">
				<div class="modal-content" >
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Comments History Details</b>
							</h5>
						</center>
					</div>
				<!-- 	<form class='form form-horizontal validate-form'
						action="/" id="saveCommentsForm" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data"> -->
						<div class="modal-body">							
					       <table id="commentshistoryTable" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Status</th>
								<th>Comments</th>
								<th>Submitted By</th>
								<th>Submitted Date</th>
								</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>
						</div>
				<!-- 	</form> -->
				</div>
			</div>
		</div>
		
			<!-- <div id="myModal" class="modal"
				style="height: 80px; width: 400px; align-items: center; top: 40%; left: 40%;">
				<div class="modal-content" id="popup-modal"
					style="background: #205081; color: #fff !important;">

					<p id="addsummaryfields" style="color: #fff" class="text-center"></p>
					<button class="close" id="closePopupSave" style="color: #fff">
						<i class="far fa-times-circle"></i>
					</button>
				</div>

			</div> -->
			
			<div class="modal fade" id="h1bchilddetailsmodal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true" >
	<div class="modal-dialog modal-lg" style="max-width: 80%"
		role="document">
		<div class="modal-content">
			<div class="modal-header" style="padding: .5rem;">
				<button class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h5 class="modal-title" id="exampleModalLabel"
					style="font-size: 15px">
					<b>H4 Questionnaire Details</b>
				</h5>
			</div>

			<div class="modal-body">
			<form action="/" class="form-horizontal" id="updatechildh1bqueDetailsForm" enctype="multipart/form-data" autocomplete="off">
			<!-- <h4><b>Candidate Details</b></h4> -->
			<input type="hidden" id="childh1que_id"  name="childh1que_id">
			<div id="h1bqueDiv">
			<div class="row">
			
			<c:if test="${role == 1}">
											    <div class="form-group row" id="chrejcommentDiv">
												<label for="inputPassword" class="col-sm-4 control-label" style="color:purple;font-weight:bold;">Rejection Comments</label>
												<div class="col-sm-6">
													<span style="color:green;font-weight:bold;" id="chrejcomments"></span>
												</div>
											    </div>
			</c:if>
		    <div class="col-md-6 col-sm-12">
		    	<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Last Name</label>
				<div class="col-sm-6">
					<input id="uchildfamilyName" type="text" minlength="1" maxlength="40"
					 autocomplete="off" placeholder="Last Name" name="uchildfamilyName" class="form-control"  required>
				</div>
			   </div>
			
		     <div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>First Name</label>
				<div class="col-sm-6">
					<input id="uchildfirstName" type="text"  autocomplete="off"  autocomplete="off" minlength="2" maxlength="40"
					 placeholder="First Name" name="uchildfirstName" class="form-control"  required>
				</div><!--  -->
			</div>
			
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Middle Name</label>
				<div class="col-sm-6">
					<input id="uchildmiddleName" type="text"  minlength="1" maxlength="40"
					 autocomplete="off" placeholder="Middle Name" name="uchildmiddleName" class="form-control"  >
				</div>
			</div>
			
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Country of Citizenship</label>
			<div class="col-sm-6">
				<input type="text" id="uchildcountryofcitizenship" class="form-control text-left"     autocomplete="off"
				 name="uchildcountryofcitizenship" placeholder="Country of Citizenship" class="form-control" required >
			</div>
			</div>
			
			
			
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Telephone Number in US</label>
				<div class="col-sm-6">
					<input id="uchildtelephoneNo" type="text" minlength="12"	maxlength="12"
					 autocomplete="off" placeholder="Telephone Number in US" name="uchildtelephoneNo" class="form-control"  >
				</div>
			</div>
			
			
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Social Security Number</label>
				<div class="col-sm-6">
					<input id="uchildssnNo" type="text" minlength="11" maxlength="11"
					placeholder="Enter SSN Number as AAA-GG-SSSS"  name="uchildssnNo" class="form-control"  >
					<span  style="color:red;" id="uchssnshow"></span>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>I-94 Number</label>
				<div class="col-sm-6">
					<input id="uchildi94No" type="text" minlength="11" maxlength="11"
					 autocomplete="off" placeholder="I-94 Number" name="uchildi94No" class="form-control"  >
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Most Recent Entry Into US</label>
			<div class="col-sm-6">
				<input type="text" id="uchilddateofrecentEntry" class="form-control text-left" autocomplete="off"
				 name="uchilddateofrecentEntry" placeholder="Date Of Most Recent Entry Into US" class="form-control" required onkeydown="return false">
			</div>
			</div>
		
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Personal email id</label>
				<div class="col-sm-6">
					<input id="uchildpersonalemailid" type="text"  minlength="1" maxlength="40"
					 autocomplete="off" placeholder="Personal email id" name="uchildpersonalemailid" class="form-control"  >
				</div>
			</div>
		    </div>
		    <div class="col-md-6 col-sm-12">
		    
		    <div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Birth</label>
			<div class="col-sm-6">
				<input type="text" id="uchilddob" class="form-control text-left" autocomplete="off"
				  name="uchilddob" placeholder="Date Of Birth" class="form-control" required onkeydown="return false">
			</div>
			</div>
		
		    <div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Country Of Birth</label>
			<div class="col-sm-6">
				<input type="text" id="uchildcountryofbirth" class="form-control text-left"
				 name="uchildcountryofbirth" placeholder="Country Of Birth" class="form-control" required >
			</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City Of Birth</label>
			<div class="col-sm-6">
				<input type="text" id="uchildcityofbirth" class="form-control text-left"     autocomplete="off"
				name="uchildcityofbirth" placeholder="City Of Birth" class="form-control" required >
			</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Number</label>
				<div class="col-sm-6">
					<input id="uchildpassportNo" type="text"  minlength="9" maxlength="16"
					 autocomplete="off" placeholder="Passport Number" name="uchildpassportNo" class="form-control"  >
				</div>
			</div>
			
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Issue Date</label>
			<div class="col-sm-6">
				<input type="text" id="uchildpassportissueDate" class="form-control text-left"  autocomplete="off"
				 name="uchildpassportissueDate" placeholder="Passport Issue Date" class="form-control" required onkeydown="return false">
			</div>
			</div>
			
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Passport Expiry Date</label>
			<div class="col-sm-6">
				<input type="text" id="uchildpassportexpDate" class="form-control text-left" autocomplete="off"
				   name="uchildpassportexpDate" placeholder="Passport Expiry Date" class="form-control" required onkeydown="return false">
			</div>
			</div>
			
				<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Current Non-Immigrant Status</label>
				<div class="col-sm-6">
					<select id="uchildimmigrantstatus" 
					 autocomplete="off" placeholder="Current Non-Immigrant Status" name="uchildimmigrantstatus" class="form-control" >
					 <option value="">Select Non-Immigrant Status</option>
					 <option value="H-1B">H-1B</option>
					 <option value="H-4">H-4</option>
					 <option value="F-1">F-1</option>
					 <option value="L-1">L-1</option>
					 <option value="J-1">J-1</option>
					 <option value="B-1/B-2">B-1/B-2</option>
					 <option value="O-1">O-1</option>
					 <option value="P-1">P-1</option>
					 <option value="TN">TN</option>
					 </select>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Status</label>
				<div class="col-sm-6">
					<!-- <input id="childstausofrecentEntry" type="text" minlength="1" maxlength="40"
					title="only alphabets are allowed" 
					 autocomplete="off" placeholder="Status" name="childstausofrecentEntry" class="form-control"  required> -->
					  <select id="uchildstausofrecentEntry" name="uchildstausofrecentEntry" class="form-control">
					    <option value="">Please Select Status</option>
					   <c:forEach var="nonimmistatus" items="${immiStatusList}">
						<option value="${nonimmistatus}">${nonimmistatus}</option>
				     </c:forEach>
			       </select>
				</div>
			</div>
		    </div>
		    <div class="col-md-6 col-sm-12">
		    <h5><b>Address in U.S.A.</b></h5>
		    <div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Line1</label>
				<div class="col-sm-6">
					<input id="uchildline1" type="text"  minlength="2" maxlength="40" 
					 autocomplete="off" placeholder="Enter Line1" name="uchildline1" class="form-control"  required>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>City</label>
				<div class="col-sm-6">
					<input id="uchildcity" type="text"  minlength="2" maxlength="25"
					 autocomplete="off" placeholder="City" name="uchildcity" class="form-control"  required>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Zip Code</label>
				<div class="col-sm-6">
					<input id="uchildzipcode" type="text" pattern="[0-9]{5}"  minlength="5"  maxlength="5"
					 autocomplete="off" placeholder="Zip Code" name="uchildzipcode" class="form-control"  required>
				</div>
			</div> 
		    
		    </div>
		    <div class="col-md-6 col-sm-12">
		    	<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Line2</label>
				<div class="col-sm-6">
					<input id="uchildline2" type="text" pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"  minlength="2" maxlength="80"
					 placeholder="Enter Line2"
					 autocomplete="off" name="uchildline2" class="form-control"  >
				</div>
			</div>
			
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>State</label>
				<div class="col-sm-6">
					<input id="uchildstate" type="text"  minlength="2" maxlength="25"
					 autocomplete="off" placeholder="State" name="uchildstate" class="form-control"  required>
				</div>
			</div>
		    </div>
		 <div class="col-md-6 col-sm-12">	
		     <div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Home/Foreign/Permanent address outside U.S.A. :</label>
				<div class="col-sm-6">
					   <textarea id="uchildpermanentAddr" type="text" row="3" column="50" required
			   		    placeholder="Employee Address" name="uchildpermanentAddr" class="form-control"></textarea>
				</div>
		    </div>
		</div>
	  </div>
  </div>
   <div class='form-group row' id="uaddchild">
       <label for="inputPassword" class="col-sm-2 control-label">Entry and Exit Dates</label>
				<div class="col-xs-4">
					<button type="button" class="btn btn-sm btn-success addButton">
						<i class="fa fa-plus"></i>
					</button>
				</div>
 </div>  
 
 <div id="uchildaddEntrtyExits" style="display:none;">
    <input type="hidden" id="ucharrId">
	<div class="form-group row">
		<label for="inputPassword" class="col-sm-2 control-label"></label>
		<div class="col-sm-2">
			<input type="text" class="form-control" autocomplete="off"
			name="auchildarrivalDate[]" id="auchildarrivalDate[]" placeholder="Arrival Date" onkeydown="return false">
		</div>
		<div class="col-sm-2">
		    <select id="auchildarrivalVisa[]" name="auchildarrivalVisa[]" class="form-control" >
					  <option value="">Arrival Visa</option>
					 <option value="H-1B">H-1B</option>
					 <option value="H-4">H-4</option>
					 <option value="F-1">F-1</option>
					 <option value="L-1">L-1</option>
					 <option value="J-1">J-1</option>
					 <option value="B-1/B-2">B-1/B-2</option>
					 <option value="O-1">O-1</option>
					 <option value="P-1">P-1</option>
					 <option value="TN">TN</option>
					  <option value="Other">Other</option>
			</select>
		<!-- 	<input type="text" class="form-control"
			name="" id="arrivalVisa[]" placeholder="Arrival Visa"> -->
		</div>
		<div class="col-sm-2">
			<input type="text" class="form-control" autocomplete="off"
			name="auchilddepartureDate[]" id="auchilddepartureDate[]" placeholder="Departure Date" disabled onkeydown="return false">
		</div>
		<div class="col-sm-2">
		     <select id="auchilddepartureVisa[]" name="auchilddepartureVisa[]" class="form-control" >
					 <option value="">Departure Visa</option>
					 <option value="H-1B">H-1B</option>
					 <option value="H-4">H-4</option>
					 <option value="F-1">F-1</option>
					 <option value="L-1">L-1</option>
					 <option value="J-1">J-1</option>
					 <option value="B-1/B-2">B-1/B-2</option>
					 <option value="O-1">O-1</option>
					 <option value="P-1">P-1</option>
					 <option value="TN">TN</option>
					  <option value="Other">Other</option>
			</select>
		</div>
		<div id="remId" style="display:block;">
			 <button type="button" class="btn btn-sm btn-danger removeButton">
						<i class="fa fa-minus"></i>
			 </button>
		</div>
	</div>
</div>
              <div class="text-center ml-5">
				<input type="button" class="btn btn-default" id="childbtnUpdate" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Update">
				<button type="button" data-dismiss="modal" class="btn btn-default" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;" id="reset">Close</button>
			  </div>
			  
		 </form>
		   <center><div id="ChildEntryExitListTableId" style="display:none;">	
							<!--  <input type="hidden" id="SubCatDocList" > -->
							<!-- <table class="table information_json" id="tableId" style="width: 70%;margin-left: 20%;">
												<thead>
												<tr style="line-height: 0px;border-bottom:0px;">
													<th style="border-bottom:0px;">Arrival Date</th>
													<th  style="border-bottom:0px;">Arrival Visa</th>
													<th  style="border-bottom:0px;">Departure Date</th>
													<th  style="border-bottom:0px;">Departure Visa</th>
												</tr>
												</thead>
							</table> -->
								 <table id="ChildEntryExitListTable" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>Arrival Date</th>
								<th>Arrival Visa</th>
								<th>Departure Date</th>
								<th>Departure Visa</th>
								<th>Action</th>
								</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table> 
	    </div></center>
	    	<c:if test="${role == 4 && questionnarieDto.initiateObj.status=='Active'}">
							         <br>
							          <div class="text-center ml-5">
							     <input type="button" id="btnh1bchildAdmin"
							        style="border-radius: 12px;background-color:#2196f3;"
							        class="btn btn-primary btn-sm collapsibleh1bchildAdmin" value="Child Status">
							      
							      <button type="button"	id="chhistoryId" style='letter-spacing: 1px; background-color:#15aabf;color:white;'
							       class="btn btn-info btn-sm addButton" ><i class="fa fa-history"></i></button>
							      
							      <%--  <c:if test="${questionnarieDto.rejformsspousehistoryList.size() gt 0}">
							        <button type="button"	style='letter-spacing: 1px; background-color:#15aabf;color:white;' class="btn btn-info btn-sm addButton" 
									onclick="viewCommentHistory1(${questionnarieDto.spouseObj.h1questionnrie_id},'Spouse','H1B Questionnaries')"><i class="fa fa-history"></i></button>
							        </c:if> --%>
							     </div>
							      </c:if>
	 </div>
   </div>
</div>
</div>


				<div class="modal fade" id="h1bchildEntryExitmodal" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true" style="top: 160px;">
								<div class="modal-dialog modal-lg" role="document" style="width:120%;">
									<div class="modal-content">
										<div class="modal-header" style="padding: .5rem;">
											<button class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h5 class="modal-title" id="exampleModalLabel"
												style="font-size: 15px">
												<b>Entry and Exit Details</b>
											</h5>
										</div>
										<div class="modal-body">
										<table class="table information_json" id="tableId" style="width: 70%;margin-left: 20%;">
												<thead>
												<tr style="line-height: 0px;border-bottom:0px;">
													<th style="border-bottom:0px;">Arrival Date</th>
													<th  style="border-bottom:0px;">Arrival Visa</th>
													<th  style="border-bottom:0px;">Departure Date</th>
													<th  style="border-bottom:0px;">Departure Visa</th>
												</tr>
												</thead>
									</table>
									<form action="/" class="form-horizontal" id="updatechildEntryExitsForm" enctype="multipart/form-data">
								    <input type="hidden" id="childEntryid" name="childEntryid">
								    <input type="hidden" id="uchildh1que_id" name="uchildh1que_id">
								    <div class="form-group row">
										<label for="inputPassword" class="col-sm-2 control-label"></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" value="${applEntryList.arrival_date}" autocomplete="off"
											name="ucharrivalDate" id="ucharrivalDate" placeholder="Arrival Date" onkeydown="return false">
										</div>
										<div class="col-sm-2">
										         <select id="ucharrivalVisa" name="ucharrivalVisa" class="form-control">
													 <option value="">Arrival Visa</option>
													 <c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}">${nonimmistatus}</option>
												    </c:forEach>
											</select>
										</div>
										<div class="col-sm-2">
											<input type="text" class="form-control" autocomplete="off"
											name="uchdepartureDate" id="uchdepartureDate" placeholder="Departure Date" onkeydown="return false">
										</div>
										<div class="col-sm-2">
										     <select id="uchdepartureVisa" name="uchdepartureVisa" class="form-control" >
													<option value="">Departure Visa</option>
													<c:forEach var="nonimmistatus" items="${immiStatusList}">
															<option value="${nonimmistatus}">${nonimmistatus}</option>
												    </c:forEach>
											</select>
										</div>
									</div>
									<div class="text-center ml-5">
												<button type="button" class="btn btn-info btn-sm"
													id="childEntryUpdate">Update</button>
									</div>
									</form>
								</div>
						</div>
					</div>
		</div>
	
	<div class="modal fade" id="rejectcommentshistorymodal" tabindex="-1"
	aria-hidden="true" role="dialog" style="top:20%" ><!-- style="top:60%" -->
	<div class="modal-dialog modal-lg" role="document" style="max-width:80%">
		<div class="modal-content">
			<div class="modal-header" style="padding: .5rem;">
				<button class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h5 class="modal-title" id="exampleModalLabel"
					style="font-size: 15px">
					<b>Comments History Details</b>
				</h5>
			</div>
			<div class="modal-body">
			             <table id="commentshistoryTable1" class="table table-hover table-bordered" style="text-align:center;">
								<thead>
								<tr>
								<th>Id</th>
								<th>Status</th>
								<th>Fields Rejected</th>
								<th>Comments</th>
								<th>Verified By</th>
								<th>Verified On</th>
								</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>
			</div>
		</div>
	</div>
  </div>
			
	
	<div class="modal fade" id="h1bRejectionmodal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true" >
	<div class="modal-dialog modal-lg" style="max-width: 90%"
		role="document">
		<div class="modal-content">
			<div class="modal-header" style="padding: .5rem;">
				<button class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h5 class="modal-title" id="exampleModalLabel"
					style="font-size: 15px">
					<b>H4 Questionnaire Details</b>
				</h5>
			</div>
			<div class="modal-body">
			<form action="/" class="form-horizontal" id="rejectFieldFormid" enctype="multipart/form-data" autocomplete="off">
			<!-- <h4><b>Candidate Details</b></h4> -->
			<input type="hidden" id="rejcand_id"  name="rejcand_id">
			<input type="hidden" id="rejh1que_id"  name="rejh1que_id">
			<input type="hidden" id="rejprof_type"  name="rejprof_type">
			<input type="hidden" id="rejform_type"  name="rejform_type" value="H1B Questionnaries">
			
			<div id="h1bqueDiv">
			<div class="row">
			<!-- <div id="rejDiv" style="display:none;"> -->
		    <div class="col-md-6 col-sm-12" id="rejDiv">
		    	<div class="form-group row">
				<label for="inputPassword" class="col-sm-3 control-label">Last Name</label>
				 <div class="col-sm-1"> 
					<input type="checkbox" name="applRejects" id="rejlastName" value="lastName" style=" width: 20px;height: 20px;"/>
				 </div>
				<label for="inputPassword" class="col-sm-3 control-label">First Name</label>
				 <div class="col-sm-1"> 
					<input type="checkbox" name="applRejects" id="rejfirstName" value="firstName" style=" width: 20px;height: 20px;"/>
				 </div> 
				<label for="inputPassword" class="col-sm-3 control-label">Middle Name</label>
					<div class="col-sm-1"> 
					<input type="checkbox" name="applRejects" id="rejmiddleName"value="middleName" style=" width: 20px;height: 20px;"/>
				 </div>
			</div>
			
			
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-3 control-label">Country of Citizenship</label>
			   <div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejcountryofcitizenship" value="countryofcitizenship" style=" width: 20px;height: 20px;"/>
				</div>
			   <label for="inputPassword" class="col-sm-3 control-label">Telephone Number in US</label>
			   <div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejtelephoneNo" value="telephoneNo" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">Social Security Number</label>
			   <div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejssnNo" value="ssnNo" style=" width: 20px;height: 20px;"/>
				</div>
			</div>
		
		<div class="form-group row">
				<label for="inputPassword" class="col-sm-3 control-label">I-94 Number</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="reji94No" value="i94No" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">Personal email id</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejpersonalemailid" value="personalemailid" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">Current Non-Immigrant Status</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejcurrimmistatus" value="currimmistatus" style=" width: 20px;height: 20px;"/>
				</div>
			</div>
			<div class="form-group row" id="rejappl2">
			     <label for="inputPassword" class="col-sm-3 control-label">Official email id</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejofficialemailid" value="officialemailid" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">Date Of First Entry Into US</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejdateoffirstEntry" value="dateoffirstEntry" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">Status</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejstausoffirstEntry" value="stausoffirstEntry" style=" width: 20px;height: 20px;"/>
				</div>
			</div>
		    </div>
		    <div class="col-md-6 col-sm-12" id="rejDiv1">
		    <div class="form-group row">
				<label for="inputPassword" class="col-sm-3 control-label">Date Of Birth</label>
					<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejdob" value="dob" style=" width: 20px;height: 20px;"/>
					</div>
				<label for="inputPassword" class="col-sm-3 control-label">Country Of Birth</label>
					<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejcountryofbirth" value="countryofbirth" style=" width: 20px;height: 20px;"/>
					</div>
			    <label for="inputPassword" class="col-sm-3 control-label">City Of Birth</label>
			    <div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejcityofbirth" value="cityofbirth" style=" width: 20px;height: 20px;"/>
				</div>
			</div>
		    	
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-3 control-label">Passport Number</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejpassportNo" value="passportNo" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">Passport Issue Date</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejpassportissueDate" value="passportissueDate" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">Passport Expiry Date</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejpassportexpDate" value="passportexpDate" style=" width: 20px;height: 20px;"/>
				</div>
			</div>
			<div class="form-group row" id="rejappl1">
				<label for="inputPassword" class="col-sm-3 control-label">Highest Education</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejhighestEdu" value="highestEdu" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">Years of Experience in IT Industry</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejyearsofItExp" value="yearsofItExp" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">Specialization</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejSpecialization" value="Specialization" style=" width: 20px;height: 20px;"/>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-3 control-label">Date Of Most Recent Entry Into US</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejdateofrecentEntry" value="dateofrecentEntry" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">Status</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejstausofrecentEntry" value="stausofrecentEntry" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" id="rejappl3" class="col-sm-3 control-label">Consulate to be notified for Visa Stamping :</label>
				<div class="col-sm-1" id="rejappl4">
					<input type="checkbox" name="applRejects" id="rejvisastamping" value="visastamping" style=" width: 20px;height: 20px;"/>
				</div>
			</div>
				<%-- <div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label">Current Non-Immigrant Status</label>
				<div class="col-sm-6">
					<select id="uchildimmigrantstatus" 
					 autocomplete="off" placeholder="Current Non-Immigrant Status" name="uchildimmigrantstatus" class="form-control" >
					 <option value="">Select Non-Immigrant Status</option>
					 <option value="H-1B">H-1B</option>
					 <option value="H-4">H-4</option>
					 <option value="F-1">F-1</option>
					 <option value="L-1">L-1</option>
					 <option value="J-1">J-1</option>
					 <option value="B-1/B-2">B-1/B-2</option>
					 <option value="O-1">O-1</option>
					 <option value="P-1">P-1</option>
					 <option value="TN">TN</option>
					 </select>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-4 control-label">Status</label>
				<div class="col-sm-6">
					<!-- <input id="childstausofrecentEntry" type="text" minlength="1" maxlength="40"
					title="only alphabets are allowed" 
					 autocomplete="off" placeholder="Status" name="childstausofrecentEntry" class="form-control"  required> -->
					  <select id="uchildstausofrecentEntry" name="uchildstausofrecentEntry" class="form-control">
					    <option value="">Please Select Status</option>
					   <c:forEach var="nonimmistatus" items="${immiStatusList}">
						<option value="${nonimmistatus}">${nonimmistatus}</option>
				     </c:forEach>
			       </select>
				</div>
			</div> --%>
		    </div>
		    <div class="col-md-6 col-sm-12" id="rejDiv2">
		    <!--  <h5><b>Address in U.S.A.</b></h5> -->
		    <div class="form-group row">
				<label for="inputPassword" class="col-sm-3 control-label">Line1</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejline1" value="line1" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">Line2</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejline2" value="line2" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">City</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejcity" value="city" style=" width: 20px;height: 20px;"/>
				</div>
			</div>
		    </div>
		   
		    <div class="col-md-6 col-sm-12" id="rejDiv3">
		    <div class="form-group row">
				<label for="inputPassword" class="col-sm-3 control-label">State</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejstate" value="state" style=" width: 20px;height: 20px;"/>
				</div>
				<label for="inputPassword" class="col-sm-3 control-label">Zipcode</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejzipcode" value="zipcode" style=" width: 20px;height: 20px;"/>
				</div>
			</div>
		    </div>
		 <div class="col-md-6 col-sm-12" id="rejDiv4">	
		     <div class="form-group row">
				<label for="inputPassword" class="col-sm-7 control-label">Home/Foreign/Permanent address outside U.S.A. :</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejpermanentAddr" value="permanentAddr" style=" width: 20px;height: 20px;"/>
				</div>
		    </div>
		</div>
		 <div class="col-md-6 col-sm-12" id="rejDiv5">	
		     <div class="form-group row">
				<label for="inputPassword" class="col-sm-7 control-label">Has an immigrant petition or Labor Certification been filed on your behalf, Form I-140 and/or Form I-485?</label>
				<div class="col-sm-1">
					<input type="checkbox" name="applRejects" id="rejpetitionfiled_behalf" value="petitionfiled_behalf" style=" width: 20px;height: 20px;"/>
				</div>
		    </div>
		</div>
		<div class="col-md-6 col-sm-12" id="rejentryDiv8" >
		 <!-- <table class="table information_json" id="tableId" style="width: 70%;margin-left: 20%;">
												<thead>
												<tr style="line-height: 0px;border-bottom:0px;">
													<th style="border-bottom:0px;">Arrival Date</th>
													<th  style="border-bottom:0px;">Arrival Visa</th>
													<th  style="border-bottom:0px;">Departure Date</th>
													<th  style="border-bottom:0px;">Departure Visa</th>
												</tr>
												</thead>
		</table> -->
		<div id="rejentryDiv"></div>
		</div>
		<!-- <div id="init_addOtherLocation" class="form-group" style="display: none;">
											<input type="hidden" id="initulcaotherloc_addrid" name="initulcaotherloc_addrid[]" >
											<div class="row" id="inituaddOtherLocationDiv">
											<div class="col-md-6 col-sm-12">
											<div class="form-group row">
											<label for="inputPassword" class="col-sm-7 control-label"><Span style="color:red;"></Span>Entry and Exit Id</label>
												<div class="col-sm-1">
													<input type="checkbox" name="applRejects" id="rejentryid" style=" width: 20px;height: 20px;"/>
												</div>
		    									</div>
											</div>
											</div>
								</div> -->
			
		  <!--  </div> -->
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 control-label"><Span style="color:red;">*</Span>Status</label>
				<div class="col-sm-6">
					<select id="rejstatusid" autocomplete="off" name="rejstatusid"
					required class="form-control">
					</select>
				</div>
				<!-- <button type="button"	style='letter-spacing: 1px; background-color:#15aabf;color:white;' 
				      id="chistoryId" class="btn btn-info btn-sm addButton"><i class="fa fa-history"></i></button> -->
		    </div>
			
		    <div class="form-group row">
				<label for="inputPassword" class="col-sm-2 control-label"><Span style="color:red;">*</Span>Comments</label>
				<div class="col-sm-6">
					<textarea type="text" name="rejectComments" id="rejectComments"
					 placeholder="Employee Address" row="3" column="50" class="form-control"/></textarea>
				</div>
		    </div>
		    
		 <!-- onclick="viewCommentHistory1()" -->
	  </div>
  </div>
             <div class="text-center ml-5">
				<input type="button" class="btn btn-default" id="rejectbtnId" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Update Status">
				<button type="button" data-dismiss="modal" class="btn btn-default" style="padding:7px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;" id="reset">Close</button>
			  </div> 
		 </form>
	 </div>
   </div>
   </div>
</div>
</div>
			<!-- .animated -->
		</div>
 
 <script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
	<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript">
/* $('#childtableId').DataTable(); */
var count=0;
$('#h1bqueDetailsForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {
    	ssnNo: {
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
        highestEdu : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Highest Education is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Highest Education should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Highest Education accepts alpha numerics '
	                },
	            }
	    },
	    specialization : {
            validators: {
            	 notEmpty: {
                    message: 'Specialization is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Specialization should have minimum 2 and maximum 80 characters '
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Specialization accepts alpha numerics '
                },
            }
       },
       i94No : {
           validators: {
           	 notEmpty: {
                   message: 'I-94 Number is mandatory'
               },
               stringLength: {
                   min: 11,
                   max: 11,
                   message: 'I-94 Number should have minimum 11 and maximum 11 characters '
               },
               regexp: {
               regexp: /[a-zA-Z0-9][a-zA-Z0-9]*/,
                 message: 'I-94 Number accepts alpha numerics '
               },
           }
      },
   immigrantstatus:{
            validators: {
            	notEmpty: {
                    message: 'Please select immigrant status'
                }
            }
        },
    passportNo : {
            validators: {
            	 notEmpty: {
                    message: 'Passport Number is mandatory'
                },
                stringLength: {
                    min: 9,
                    max: 16,
                    message: 'Passport Number should have minimum 9 and maximum 16 characters '
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9]*/,
                  message: 'Passport Number accepts alpha numerics '
                },
            }
       },
	    passportissueDate: {
            validators: {
                notEmpty: {
                    message: 'Passport issue date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter Joining date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Passport issue date is not a valid'
                }
            }
        },
        passportexpDate: {
            validators: {
                notEmpty: {
                    message: 'Passport expiry date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter Joining date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Passport expiry date is not a valid'
                }
            }
        },
        dateoffirstEntry: {
            validators: {
                notEmpty: {
                    message: 'Date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Date is not a valid'
                }
            }
        },
        dateofrecentEntry: {
            validators: {
                notEmpty: {
                    message: 'Date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Date is not a valid'
                }
            }
        },
     stausoffirstEntry:{
            validators: {
            	notEmpty: {
                    message: 'Please select status'
                }
            }
        },
     stausofrecentEntry:{
            validators: {
            	notEmpty: {
                    message: 'Please select status'
                }
            }
        },
     /*    stausoffirstEntry : {
            validators: {
            	 notEmpty: {
                    message: 'Status is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Status name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s],
                  message: 'Status accepts alpha numerics '
                },
            }
        },
        stausofrecentEntry : {
        	 validators: {
            	 notEmpty: {
                    message: 'Status is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Status name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s],
                  message: 'Status accepts alpha numerics '
                },
            }
        }, */
        officialemailid: {
            validators: {
            	isEmpty: {
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
        personalemailid: {
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
        telephoneNo : {
            validators: {
            	notEmpty: {
                    message: 'Telephone number is mandatory'
                },
                stringLength: {
                    min: 12,
                    max: 12,
                    message: 'Telephone Number should be 10 numbers'
                },
                regexp: {
                   regexp: /^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$/,
                   message: 'Please enter valid Telephone Number'
                },
            }
        },        
        line1 : {
            validators: {
            	 notEmpty: {
                    message: 'Line1 name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line1 name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 name accepts alpha numerics '
                },
            }
        },
        line2 : {
            validators: {
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line2 name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 name accepts alpha numerics '
                },
            }
        },
        city : {
            validators: {
            	notEmpty: {
                    message: 'City name is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'City name should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'City name accepts alphanumerics'
                },
            }
        },
        state : {
            validators: {
            	notEmpty: {
                    message: 'State name is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'State name should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'State name accepts character'
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
         yearsofItExp : {
             validators: {
             	 notEmpty: {
                     message: 'Years of It Experience is mandatory'
                 },
                 stringLength: {
                     min: 2,
                     max: 80,
                     message: 'Years of It Experience should have minimum 2 and maximum 80 characters'
                 },
                 regexp: {
                 regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                   message: 'Years of It Experience accepts alphanumerics '
                 },
             }
         },
         permanentAddr: {
             validators: {
            	 notEmpty: {
                     message: 'Address is mandatory'
                 },
                 stringLength: {
                     min: 2,
                     message: 'Address length should be min 2'
                 },
                 regexp: {
                    regexp: /^[^\s_@.#&-(),'"]+([a-zA-Z0-9_@.#&(),'"\s-])*[a-zA-Z0-9_@.#&(),'"\s-]+$/,
                     message: 'Address can only consist of alphabetical and Space allowed but is not at beginning or end of the word'
                 },
             }
         },
         countryofcitizenship : {
             validators: {
             	notEmpty: {
                     message: 'Country of citizenship is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'Country of citizenship should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'Country of citizenship accepts characters'
                 },
             }
         },
         countryofbirth : {
             validators: {
             	notEmpty: {
                     message: 'Country of birth is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'Country of birth should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'Country of birth accepts characters'
                 },
             }
         },
         cityofbirth : {
             validators: {
             	notEmpty: {
                     message: 'City of birth is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'City of birth should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'City of birth accepts characters'
                 },
             }
         },
         petitionfiled_behalf : {
             validators: {
             	notEmpty: {
                     message: 'Petition filed is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'Petition filed should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'Petition filed accepts characters'
                 },
             }
         }, 
         visastamping : {
             validators: {
             	notEmpty: {
                     message: 'Visa stamping is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'Visa stamping should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'Visa stamping accepts characters'
                 },
             }
         },
     tdepartureDate : {
             validators: {
                 notEmpty: {
                     message: 'Date is required'
                 },
                 regexp: {
                 	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                     message: 'Please enter date in MM/DD/YYYY format'
                 },
                 date: {
                     format: 'MM/DD/YYYY',
                     message: 'Date is not a valid'
                 }
             }
         },
   tarrivalDate : {
             validators: {
                 notEmpty: {
                     message: 'Date is required'
                 },
                 regexp: {
                 	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                     message: 'Please enter date in MM/DD/YYYY format'
                 },
                 date: {
                     format: 'MM/DD/YYYY',
                     message: 'Date is not a valid'
                 }
             }
         },
   tarrivalVisa : {
	 validators: {
      	notEmpty: {
      		message: 'Please select status'
          }
       }
    },
  tdepartureVisa : {
             validators: {
             	notEmpty: {
             		message: 'Please select status'
                 }
             }
         },  
      'departureDate[]' : {
                 validators: {
                     notEmpty: {
                         message: 'Date is required'
                     },
                     regexp: {
                     	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                         message: 'Please enter date in MM/DD/YYYY format'
                     },
                     date: {
                         format: 'MM/DD/YYYY',
                         message: 'Date is not a valid'
                     }
                 }
             },
     'arrivalDate[]': {
                 validators: {
                     notEmpty: {
                         message: 'Date is required'
                     },
                     regexp: {
                     	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                         message: 'Please enter date in MM/DD/YYYY format'
                     },
                     date: {
                         format: 'MM/DD/YYYY',
                         message: 'Date is not a valid'
                     }
                 }
             },
    'arrivalVisa[]' : {
    	 validators: {
          	notEmpty: {
          		message: 'Please select status'
              }
           }
        },
    'departureVisa[]' : {
                 validators: {
                 	notEmpty: {
                 		message: 'Please select status'
                     }
                 }
             }      
      }
}).on('click', '.addButton', function() {
	 count++;
     var $template = $('#addEntrtyExits'),
         $clone    = $template
                         .clone()
                         .removeAttr('style')
                         .removeAttr('id')
                         .attr('data-book-index', count)
                         .attr('class', "applEntryExitsAdd")
                         .insertAfter($template);
     //
     // Add new field
    /* alert(count);
      if(count==1){
    	  alert("if");
    	  $("#remId").hide();
     }else{
    	 alert("else");
    	  $("#remId").show();
     } */
    // alert(count);
     $('#h1bqueDetailsForm')
     .formValidation('addField', $clone.find('[name="arrivalDate[]"]'))
     .formValidation('addField', $clone.find('[name="arrivalVisa[]"]'))
     .formValidation('addField', $clone.find('[name="departureDate[]"]'))
     .formValidation('addField', $clone.find('[name="departureVisa[]"]'));
 
     $('input[name="arrivalDate[]"]').datepicker({
     }).on('changeDate', function(selected) {
    	   $('input[name="departureDate[]"]').prop("disabled",false);
     	 $('#h1bqueDetailsForm').formValidation('revalidateField', 'arrivalDate[]');
     });
     $('input[name="departureDate[]"]').datepicker({
     }).on('changeDate', function(selected) {
     	 $('#h1bqueDetailsForm').formValidation('revalidateField', 'departureDate[]');
     }); 
 })
 .on('click', '.removeButton', function() {
         var $row  = $(this).parents('.form-group'),
         index = $row.attr('data-book-index');
        $arrivalDate = $row.find('[name="arrivalDate[]"]');
     // Remove fields
     $('#h1bqueDetailsForm')
     	  .formValidation('removeField', $row.find('[name="arrivalDate[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="arrivalVisa[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="departureDate[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="departureVisa[' + index + ']"]'))
          .formValidation('removeField', $arrivalDate);
     // Remove element containing the fields
     $row.remove();
});
/* 
$("[id='arrId']").each(function(){
var id=$(this).val();
alert(id);
 $("#arrivalDate"+id).datepicker({
	}).on('changeDate', function(selected) {
	        var minDate = new Date(selected.date.valueOf());
	        $('#departureDate'+id).datepicker('setStartDate', minDate);
	        $("#departureDate"+id).prop("disabled",false);
	        $('#h1bqueDetailsForm').formValidation('revalidateField', 'arrivalDate');
	});
    $("#departureDate"+id).datepicker({
	}).on('changeDate', function(selected) {
	        var minDate = new Date(selected.date.valueOf());
	        $('#arrivalDate'+count).datepicker('setEndDate', minDate);
	        $('#h1bqueDetailsForm').formValidation('revalidateField', 'departureDate');
	}); 
}); */
/* .on('change', '[name="arrivalDate[]"]', function(e) { 
	var $row  = $(this).parents('.form-group'),
    index = $row.attr('data-book-index');
	alert(index);
}); */

/* $('input[name="arrivalDate[]"]').datepicker({
}).on('changeDate', function(selected) {
	 
	 $('#h1bqueDetailsForm').formValidation('revalidateField', 'arrivalDate[]');
});
$('input[name="departureDate[]"]').datepicker({
}).on('changeDate', function(selected) {
	 $('#h1bqueDetailsForm').formValidation('revalidateField', 'arrivalDate[]');
});  */

var ucount=0;
$('#updateh1bqueDetailsForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {
    	ussnNo: {
            validators: {
            	notEmpty: {
                    message: 'SSN is mandatory'
                }
            }
        },
        ufirstName: {
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
        umiddleName: {
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
        ufamilyName: {
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
                }
            }
        },
        udob: {
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
        uhighestEdu : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Highest Education is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Highest Education should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Highest Education accepts alpha numerics '
	                },
	            }
	    },
	    uspecialization : {
            validators: {
            	 notEmpty: {
                    message: 'Specialization is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Specialization should have minimum 2 and maximum 80 characters '
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Specialization accepts alpha numerics '
                },
            }
       },
       ui94No : {
           validators: {
           	 notEmpty: {
                   message: 'I-94 Number is mandatory'
               },
               stringLength: {
                   min: 11,
                   max: 11,
                   message: 'I-94 Number should have minimum 11 and maximum 11 characters '
               },
               regexp: {
               regexp: /[a-zA-Z0-9][a-zA-Z0-9]*/,
                 message: 'I-94 Number accepts alpha numerics '
               },
           }
      },
   uimmigrantstatus:{
            validators: {
            	isEmpty: {
                    message: 'Please select immigrant status'
                }
            }
        },
    upassportNo : {
            validators: {
            	 notEmpty: {
                    message: 'Passport Number is mandatory'
                },
                stringLength: {
                    min: 9,
                    max: 16,
                    message: 'Passport Number should have minimum 9 and maximum 16 characters '
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9]*/,
                  message: 'Passport Number accepts alpha numerics '
                },
            }
       },
	    upassportissueDate: {
            validators: {
                notEmpty: {
                    message: 'Passport issue date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter Joining date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Passport issue date is not a valid'
                }
            }
        },
        upassportexpDate: {
            validators: {
                notEmpty: {
                    message: 'Passport expiry date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter Joining date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Passport expiry date is not a valid'
                }
            }
        },
        udateoffirstEntry: {
            validators: {
                notEmpty: {
                    message: 'Date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Date is not a valid'
                }
            }
        },
        udateofrecentEntry: {
            validators: {
                notEmpty: {
                    message: 'Date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Date is not a valid'
                }
            }
        },
        ustausoffirstEntry:{
            validators: {
            	notEmpty: {
                    message: 'Please select status'
                }
            }
        },
        ustausofrecentEntry:{
            validators: {
            	notEmpty: {
                    message: 'Please select status'
                }
            }
        },
       /*  ustausoffirstEntry : {
            validators: {
            	 notEmpty: {
                    message: 'Status is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Status name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s],
                  message: 'Status accepts alpha numerics '
                },
            }
        },
        ustausofrecentEntry : {
        	 validators: {
            	 notEmpty: {
                    message: 'Status is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Status name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s],
                  message: 'Status accepts alpha numerics '
                },
            }
        }, */
        uofficialemailid: {
            validators: {
            	isEmpty: {
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
        upersonalemailid: {
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
        utelephoneNo : {
            validators: {
            	notEmpty: {
                    message: 'Telephone number is mandatory'
                },
                stringLength: {
                    min: 12,
                    max: 12,
                    message: 'Telephone Number should be 10 numbers'
                },
                regexp: {
                   regexp: /^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$/,
                   message: 'Please enter valid Telephone Number'
                },
            }
        },        
        uline1 : {
            validators: {
            	 notEmpty: {
                    message: 'Line1 name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line1 name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 name accepts alpha numerics '
                },
            }
        },
        uline2 : {
            validators: {
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line2 name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 name accepts alpha numerics '
                },
            }
        },
        ucity : {
            validators: {
            	notEmpty: {
                    message: 'City name is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'City name should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'City name accepts alphanumerics'
                },
            }
        },
        ustate : {
            validators: {
            	notEmpty: {
                    message: 'State name is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'State name should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'State name accepts character'
                },
            }
        },
        uzipcode : {
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
         uyearsofItExp : {
             validators: {
             	 notEmpty: {
                     message: 'Years of It Experience is mandatory'
                 },
                 stringLength: {
                     min: 2,
                     max: 80,
                     message: 'Years of It Experience should have minimum 2 and maximum 80 characters'
                 },
                 regexp: {
                 regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                   message: 'Years of It Experience accepts alphanumerics '
                 },
             }
         },
         upermanentAddr: {
             validators: {
            	 notEmpty: {
                     message: 'Address is mandatory'
                 },
                 stringLength: {
                     min: 2,
                     message: 'Address length should be min 2'
                 },
                 regexp: {
                    regexp: /^[^\s_@.#&-(),'"]+([a-zA-Z0-9_@.#&(),'"\s-])*[a-zA-Z0-9_@.#&(),'"\s-]+$/,
                     message: 'Address can only consist of alphabetical and Space allowed but is not at beginning or end of the word'
                 },
             }
         },
         ucountryofcitizenship : {
             validators: {
             	notEmpty: {
                     message: 'Country of citizenship is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'Country of citizenship should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'Country of citizenship accepts characters'
                 },
             }
         },
         ucountryofbirth : {
             validators: {
             	notEmpty: {
                     message: 'Country of birth is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'Country of birth should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'Country of birth accepts characters'
                 },
             }
         },
         ucityofbirth : {
             validators: {
             	notEmpty: {
                     message: 'City of birth is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'City of birth should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'City of birth accepts characters'
                 },
             }
         },
         upetitionfiled_behalf : {
             validators: {
             	notEmpty: {
                     message: 'Petition filed is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'Petition filed should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'Petition filed accepts characters'
                 },
             }
         }, 
         uvisastamping : {
             validators: {
             	notEmpty: {
                     message: 'Visa stamping is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'Visa stamping should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'Visa stamping accepts characters'
                 },
             }
         },
      udepartureDate : {
                 validators: {
                     notEmpty: {
                         message: 'Date is required'
                     },
                     regexp: {
                     	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                         message: 'Please enter date in MM/DD/YYYY format'
                     },
                     date: {
                         format: 'MM/DD/YYYY',
                         message: 'Date is not a valid'
                     }
                 }
             },
     uarrivalDate : {
                 validators: {
                     notEmpty: {
                         message: 'Date is required'
                     },
                     regexp: {
                     	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                         message: 'Please enter date in MM/DD/YYYY format'
                     },
                     date: {
                         format: 'MM/DD/YYYY',
                         message: 'Date is not a valid'
                     }
                 }
             },
    uarrivalVisa : {
    	 validators: {
          	notEmpty: {
          		message: 'Please select status'
              }
           }
        },
    udepartureVisa : {
                 validators: {
                 	notEmpty: {
                 		message: 'Please select status'
                     }
                 }
             },
    'audepartureDate[]' : {
                 validators: {
                     notEmpty: {
                         message: 'Date is required'
                     },
                     regexp: {
                     	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                         message: 'Please enter date in MM/DD/YYYY format'
                     },
                     date: {
                         format: 'MM/DD/YYYY',
                         message: 'Date is not a valid'
                     }
                 }
             },
     'auarrivalDate[]' : {
                 validators: {
                     notEmpty: {
                         message: 'Date is required'
                     },
                     regexp: {
                     	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                         message: 'Please enter date in MM/DD/YYYY format'
                     },
                     date: {
                         format: 'MM/DD/YYYY',
                         message: 'Date is not a valid'
                     }
                 }
             },
    'auarrivalVisa[]' : {
    	 validators: {
          	notEmpty: {
          		message: 'Please select status'
              }
           }
        },
    'audepartureVisa[]' : {
                 validators: {
                 	notEmpty: {
                 		message: 'Please select status'
                     }
                 }
             }      
      }
}).on('click', '.addButton', function() {
	ucount++;
     var $template = $('#uaddEntrtyExits'),
         $clone    = $template
                         .clone()
                         .removeAttr('style')
                         .removeAttr('id')
                         .attr('data-book-index', ucount)
                         .attr('class', "uapplEntryExits")
                         .insertAfter($template);
     //
     // Add new field
    /* alert(count);
      if(count==1){
    	  alert("if");
    	  $("#remId").hide();
     }else{
    	 alert("else");
    	  $("#remId").show();
     } */
    /*  $clone.find('[name="auarrivalDate[]"]').attr('id','auarrivalDate'+ucount);
     $clone.find('[name="audepartureDate[]"]').attr('id','audepartureDate'+ucount);
     $clone.find('[name="auarrivalVisa[]"]').attr('id','auarrivalVisa'+ucount);
     $clone.find('[name="audepartureVisa[]"]').attr('id','audepartureVisa'+ucount);
     $clone.find('[id="uarrId"]').val(ucount); */
     
     $('#updateh1bqueDetailsForm')
     .formValidation('addField', $clone.find('[name="auarrivalDate[]"]'))
     .formValidation('addField', $clone.find('[name="auarrivalVisa[]"]'))
     .formValidation('addField', $clone.find('[name="audepartureDate[]"]'))
     .formValidation('addField', $clone.find('[name="audepartureVisa[]"]'));
    /*  $("#arrivalDate[]").datepicker({
     }).on('changeDate', function(selected) {
     	 $('#h1bqueDetailsForm').formValidation('revalidateField', 'arrivalDate[]');
     }); */
     
     
    /*  var uapdob=new Date($('#udob').val());
     $("#auarrivalDate"+ucount).datepicker('setStartDate', uapdob);
		$("[id='uarrId']").each(function(){
			var uid=$(this).val();
			 $("#auarrivalDate"+uid).datepicker({
				}).on('changeDate', function(selected) {
				        var minDate = new Date(selected.date.valueOf());
				        $('#audepartureDate'+uid).datepicker('setStartDate', minDate);
				        $("#audepartureDate"+uid).prop("disabled",false);
				        $('#updateh1bqueDetailsForm').formValidation('revalidateField', 'auarrivalDate[]');
				});
			   $("#audepartureDate"+uid).datepicker({
				}).on('changeDate', function(selected) {
				        var minDate = new Date(selected.date.valueOf());
				        $('#auarrivalDate'+uid).datepicker('setEndDate', minDate);
				        $('#updateh1bqueDetailsForm').formValidation('revalidateField', 'audepartureDate[]');
				}); 
		}); */
      $('input[name="auarrivalDate[]"]').datepicker({
     }).on('changeDate', function(selected) {
    	 $('input[name="audepartureDate[]"]').prop("disabled",false);
     	 $('#updateh1bqueDetailsForm').formValidation('revalidateField', 'auarrivalDate[]');
     });
     $('input[name="audepartureDate[]"]').datepicker({
     }).on('changeDate', function(selected) {
     	 $('#updateh1bqueDetailsForm').formValidation('revalidateField', 'audepartureDate[]');
     });
 })
 .on('click', '.removeButton', function() {
     var $row  = $(this).parents('.form-group'),
         index = $row.attr('data-book-index');
        $arrivalDate = $row.find('[name="auarrivalDate[]"]');
     // Remove fields
     $('#updateh1bqueDetailsForm')
     	  .formValidation('removeField', $row.find('[name="auarrivalDate[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="auarrivalVisa[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="audepartureDate[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="audepartureVisa[' + index + ']"]'))
          .formValidation('removeField', $arrivalDate);
     // Remove element containing the fields
     $row.remove();
});

var spousecount=0;
$('#spouseh1bqueDetailsForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {
    	spousessnNo: {
            validators: {
            	isEmpty: {
                    message: 'SSN is mandatory'
                }
            }
        },
        spousefirstName: {
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
        spousemiddleName: {
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
        spousefamilyName: {
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
                }
            }
        },
    spousedob: {
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
       spousei94No : {
           validators: {
           	 notEmpty: {
                   message: 'I-94 Number is mandatory'
               },
               stringLength: {
                   min: 11,
                   max: 11,
                   message: 'I-94 Number should have minimum 11 and maximum 11 characters '
               },
               regexp: {
               regexp: /[a-zA-Z0-9][a-zA-Z0-9]*/,
                 message: 'I-94 Number accepts alpha numerics '
               },
           }
      },
      spousepassportNo : {
          validators: {
          	 notEmpty: {
                  message: 'Passport Number is mandatory'
              },
              stringLength: {
                  min: 9,
                  max: 16,
                  message: 'Passport Number should have minimum 9 and maximum 16 characters '
              },
              regexp: {
              regexp: /[a-zA-Z0-9][a-zA-Z0-9]*/,
                message: 'Passport Number accepts alpha numerics '
              },
          }
     },
      spouseimmigrantstatus:{
            validators: {
            	notEmpty: {
                    message: 'Please select immigrant status'
                }
            }
        },
        spousepassportissueDate: {
            validators: {
                notEmpty: {
                    message: 'Passport issue date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter Joining date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Passport issue date is not a valid'
                }
            }
        },
        spousepassportexpDate: {
            validators: {
                notEmpty: {
                    message: 'Passport expiry date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter Joining date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Passport expiry date is not a valid'
                }
            }
        },
        spousedateofrecentEntry: {
            validators: {
                notEmpty: {
                    message: 'Date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Date is not a valid'
                }
            }
        },
        spousestausofrecentEntry:{
            validators: {
            	notEmpty: {
                    message: 'Please select status'
                }
            }
        },
       /*  spousestausofrecentEntry : {
        	 validators: {
            	 notEmpty: {
                    message: 'Status is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Status name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s],
                  message: 'Status accepts alpha numerics '
                },
            }
        }, */
        spousepersonalemailid: {
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
        spousetelephoneNo : {
            validators: {
            	notEmpty: {
                    message: 'Telephone number is mandatory'
                },
                stringLength: {
                    min: 12,
                    max: 12,
                    message: 'Telephone Number should be 10 numbers'
                },
                regexp: {
                   regexp: /^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$/,
                   message: 'Please enter valid Telephone Number'
                },
            }
        },        
        spouseline1 : {
            validators: {
            	 notEmpty: {
                    message: 'Line1 name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line1 name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 name accepts alpha numerics '
                },
            }
        },
        spouseline2 : {
            validators: {
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line2 name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 name accepts alpha numerics '
                },
            }
        },
        spousecity : {
            validators: {
            	notEmpty: {
                    message: 'City name is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'City name should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'City name accepts alphanumerics'
                },
            }
        },
        spousestate : {
            validators: {
            	notEmpty: {
                    message: 'State name is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'State name should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'State name accepts character'
                },
            }
        },
        spousezipcode : {
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
      spousepermanentAddr: {
             validators: {
            	 notEmpty: {
                     message: 'Address is mandatory'
                 },
                 stringLength: {
                     min: 2,
                     message: 'Address length should be min 2'
                 },
                 regexp: {
                    regexp: /^[^\s_@.#&-(),'"]+([a-zA-Z0-9_@.#&(),'"\s-])*[a-zA-Z0-9_@.#&(),'"\s-]+$/,
                     message: 'Address can only consist of alphabetical and Space allowed but is not at beginning or end of the word'
                 },
             }
         },
         spousecountryofcitizenship : {
             validators: {
             	notEmpty: {
                     message: 'Country of citizenship is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'Country of citizenship should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'Country of citizenship accepts characters'
                 },
             }
         },
         spousecountryofbirth : {
             validators: {
             	notEmpty: {
                     message: 'Country of birth is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'Country of birth should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'Country of birth accepts characters'
                 },
             }
         },
         spousecityofbirth : {
             validators: {
             	notEmpty: {
                     message: 'City of birth is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'City of birth should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'City of birth accepts characters'
                 },
             }
         },
   tspousedepartureDate : {
             validators: {
                 notEmpty: {
                     message: 'Date is required'
                 },
                 regexp: {
                 	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                     message: 'Please enter date in MM/DD/YYYY format'
                 },
                 date: {
                     format: 'MM/DD/YYYY',
                     message: 'Date is not a valid'
                 }
             }
         },
   tspousearrivalDate : {
             validators: {
                 notEmpty: {
                     message: 'Date is required'
                 },
                 regexp: {
                 	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                     message: 'Please enter date in MM/DD/YYYY format'
                 },
                 date: {
                     format: 'MM/DD/YYYY',
                     message: 'Date is not a valid'
                 }
             }
         },
   tspousearrivalVisa : {
	 validators: {
      	notEmpty: {
      		message: 'Please select status'
          }
       }
    },
  tspousedepartureVisa : {
             validators: {
             	notEmpty: {
             		message: 'Please select status'
                 }
             }
         },    
      'spousedepartureDate[]' : {
                 validators: {
                     notEmpty: {
                         message: 'Date is required'
                     },
                     regexp: {
                     	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                         message: 'Please enter date in MM/DD/YYYY format'
                     },
                     date: {
                         format: 'MM/DD/YYYY',
                         message: 'Date is not a valid'
                     }
                 }
             },
     'spousearrivalDate[]' : {
                 validators: {
                     notEmpty: {
                         message: 'Date is required'
                     },
                     regexp: {
                     	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                         message: 'Please enter date in MM/DD/YYYY format'
                     },
                     date: {
                         format: 'MM/DD/YYYY',
                         message: 'Date is not a valid'
                     }
                 }
             },
    'spousearrivalVisa[]' : {
    	 validators: {
          	notEmpty: {
          		message: 'Please select status'
              }
           }
        },
    'spousedepartureVisa[]' : {
                 validators: {
                 	notEmpty: {
                 		message: 'Please select status'
                     }
                 }
             }      
      }
}).on('click', '.addButton', function() {
	spousecount++;
     var $template = $('#spouseaddEntrtyExits'),
         $clone    = $template
                         .clone()
                         .removeAttr('style')
                         .removeAttr('id')
                         .attr('data-book-index', spousecount)
                         .attr('class', "spouseEntryExitsAdd")
                         .insertAfter($template);
     //
     // Add new field
    /* alert(count);
      if(count==1){
    	  alert("if");
    	  $("#remId").hide();
     }else{
    	 alert("else");
    	  $("#remId").show();
     } */
     
    /*  $clone.find('[name="spousearrivalDate[]"]').attr('id','spousearrivalDate['+spousecount+']');
     $clone.find('[name="spousedepartureDate[]"]').attr('id','spousedepartureDate['+spousecount+']');
     $clone.find('[id="sparrId"]').val(spousecount); */
     
     $('#spouseh1bqueDetailsForm')
     .formValidation('addField', $clone.find('[name="spousearrivalDate[]"]'))
     .formValidation('addField', $clone.find('[name="spousearrivalVisa[]"]'))
     .formValidation('addField', $clone.find('[name="spousedepartureDate[]"]'))
     .formValidation('addField', $clone.find('[name="spousedepartureVisa[]"]'));
     $('input[name="spousearrivalDate[]"]').datepicker({
     }).on('changeDate', function(selected) {
    	 $('input[name="spousedepartureDate[]"]').prop("disabled",false);
     	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousearrivalDate[]');
     });
     $('input[name="spousedepartureDate[]"]').datepicker({
     }).on('changeDate', function(selected) {
     	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spchdepartureDate[]');
     });
     
  /*   var spassportid=new Date($('#spousepassportissueDate').val());
  	var spassported=new Date($('#spousepassportexpDate').val()); */
  	
  	
  	/* 	var aspdob=new Date($('#spousedob').val());
        $('#spousearrivalDate'+spousecount).datepicker('setStartDate', aspdob);
		$("[id='sparrId']").each(function(){
			var id=$(this).val();
			 $("#spousearrivalDate"+id).datepicker({
				}).on('changeDate', function(selected) {
				        var minDate = new Date(selected.date.valueOf());
				        $('#spousedepartureDate'+id).datepicker('setStartDate', minDate);
				        $("#spousedepartureDate"+id).prop("disabled",false);
				        $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousearrivalDate[]');
				});
			   $("#spousedepartureDate"+id).datepicker({
				}).on('changeDate', function(selected) {
				        var minDate = new Date(selected.date.valueOf());
				        $('#spousearrivalDate'+id).datepicker('setEndDate', minDate);
				        $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousedepartureDate[]');
				}); 
		}); */
 })
 .on('click', '.removeButton', function() {
     var $row  = $(this).parents('.form-group'),
         index = $row.attr('data-book-index');
        $arrivalDate = $row.find('[name="spousearrivalDate[]"]');
     // Remove fields
     $('#spouseh1bqueDetailsForm')
     	  .formValidation('removeField', $row.find('[name="spousearrivalDate[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="spousearrivalVisa[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="spousedepartureDate[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="spousedepartureVisa[' + index + ']"]'))
          .formValidation('removeField', $arrivalDate);
     // Remove element containing the fields
     $row.remove();
});

var uspousecount=0;
$('#updatespouseh1bqueDetailsForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {
    	uspousessnNo: {
            validators: {
            	isEmpty: {
                    message: 'SSN is mandatory'
                }
            }
        },
        uspousefirstName: {
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
        uspousemiddleName: {
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
        uspousefamilyName: {
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
                }
            }
        },
    uspousedob: {
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
       uspousei94No : {
           validators: {
           	 notEmpty: {
                   message: 'I-94 Number is mandatory'
               },
               stringLength: {
                   min: 11,
                   max: 11,
                   message: 'I-94 Number should have minimum 11 and maximum 11 characters '
               },
               regexp: {
               regexp: /[a-zA-Z0-9][a-zA-Z0-9]*/,
                 message: 'I-94 Number accepts alpha numerics '
               },
           }
      },
      uspousepassportNo : {
          validators: {
          	 notEmpty: {
                  message: 'Passport Number is mandatory'
              },
              stringLength: {
                  min: 9,
                  max: 16,
                  message: 'Passport Number should have minimum 9 and maximum 16 characters '
              },
              regexp: {
              regexp: /[a-zA-Z0-9][a-zA-Z0-9]*/,
                message: 'Passport Number accepts alpha numerics '
              },
          }
     },
      uspouseimmigrantstatus:{
            validators: {
            	isEmpty: {
                    message: 'Please select immigrant status'
                }
            }
        },
        uspousepassportissueDate: {
            validators: {
                notEmpty: {
                    message: 'Passport issue date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter Joining date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Passport issue date is not a valid'
                }
            }
        },
        uspousepassportexpDate: {
            validators: {
                notEmpty: {
                    message: 'Passport expiry date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter Joining date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Passport expiry date is not a valid'
                }
            }
        },
        uspousedateofrecentEntry: {
            validators: {
                notEmpty: {
                    message: 'Date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Date is not a valid'
                }
            }
        },
        uspousestausofrecentEntry:{
            validators: {
            	notEmpty: {
                    message: 'Please select status'
                }
            }
        },
        /* uspousestausofrecentEntry : {
        	 validators: {
            	 notEmpty: {
                    message: 'Status is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Status name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s],
                  message: 'Status accepts alpha numerics '
                },
            }
        }, */
        uspousepersonalemailid: {
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
        uspousetelephoneNo : {
            validators: {
            	notEmpty: {
                    message: 'Telephone number is mandatory'
                },
                stringLength: {
                    min: 12,
                    max: 12,
                    message: 'Telephone Number should be 10 numbers'
                },
                regexp: {
                   regexp: /^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$/,
                   message: 'Please enter valid Telephone Number'
                },
            }
        },        
        uspouseline1 : {
            validators: {
            	 notEmpty: {
                    message: 'Line1 name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line1 name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 name accepts alpha numerics '
                },
            }
        },
        uspouseline2 : {
            validators: {
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line2 name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 name accepts alpha numerics '
                },
            }
        },
        uspousecity : {
            validators: {
            	notEmpty: {
                    message: 'City name is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'City name should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'City name accepts alphanumerics'
                },
            }
        },
        uspousestate : {
            validators: {
            	notEmpty: {
                    message: 'State name is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'State name should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'State name accepts character'
                },
            }
        },
        uspousezipcode : {
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
      uspousepermanentAddr: {
             validators: {
            	 notEmpty: {
                     message: 'Address is mandatory'
                 },
                 stringLength: {
                     min: 2,
                     message: 'Address length should be min 2'
                 },
                 regexp: {
                    regexp: /^[^\s_@.#&-(),'"]+([a-zA-Z0-9_@.#&(),'"\s-])*[a-zA-Z0-9_@.#&(),'"\s-]+$/,
                     message: 'Address can only consist of alphabetical and Space allowed but is not at beginning or end of the word'
                 },
             }
         },
         uspousecountryofcitizenship : {
             validators: {
             	notEmpty: {
                     message: 'Country of citizenship is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'Country of citizenship should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'Country of citizenship accepts characters'
                 },
             }
         },
         uspousecountryofbirth : {
             validators: {
             	notEmpty: {
                     message: 'Country of birth is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'Country of birth should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'Country of birth accepts characters'
                 },
             }
         },
         uspousecityofbirth : {
             validators: {
             	notEmpty: {
                     message: 'City of birth is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'City of birth should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'City of birth accepts characters'
                 },
             }
         },
      'uspousedepartureDate[]' : {
                 validators: {
                     notEmpty: {
                         message: 'Date is required'
                     },
                     regexp: {
                     	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                         message: 'Please enter date in MM/DD/YYYY format'
                     },
                     date: {
                         format: 'MM/DD/YYYY',
                         message: 'Date is not a valid'
                     }
                 }
             },
     'uspousearrivalDate[]' : {
                 validators: {
                     notEmpty: {
                         message: 'Date is required'
                     },
                     regexp: {
                     	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                         message: 'Please enter date in MM/DD/YYYY format'
                     },
                     date: {
                         format: 'MM/DD/YYYY',
                         message: 'Date is not a valid'
                     }
                 }
             },
    'uspousearrivalVisa[]' : {
    	 validators: {
          	notEmpty: {
          		message: 'Please select status'
              }
           }
        },
    'uspousedepartureVisa[]' : {
                 validators: {
                 	notEmpty: {
                 		message: 'Please select status'
                     }
                 }
             },
    'auspousedepartureDate[]' : {
                 validators: {
                     notEmpty: {
                         message: 'Date is required'
                     },
                     regexp: {
                     	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                         message: 'Please enter date in MM/DD/YYYY format'
                     },
                     date: {
                         format: 'MM/DD/YYYY',
                         message: 'Date is not a valid'
                     }
                 }
             },
     'auspousearrivalDate[]' : {
                 validators: {
                     notEmpty: {
                         message: 'Date is required'
                     },
                     regexp: {
                     	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                         message: 'Please enter date in MM/DD/YYYY format'
                     },
                     date: {
                         format: 'MM/DD/YYYY',
                         message: 'Date is not a valid'
                     }
                 }
             },
    'auspousearrivalVisa[]' : {
    	 validators: {
          	notEmpty: {
          		message: 'Please select status'
              }
           }
        },
    'auspousedepartureVisa[]' : {
                 validators: {
                 	notEmpty: {
                 		message: 'Please select status'
                     }
                 }
             }         
      }
}).on('click', '.addButton', function() {
	uspousecount++;
     var $template = $('#uspouseaddEntrtyExits'),
         $clone    = $template
                         .clone()
                         .removeAttr('style')
                         .removeAttr('id')
                         .attr('data-book-index', uspousecount)
                         .attr('class', "uspouseEntryExitsAdd")
                         .insertAfter($template);
     //
     // Add new field
    /* alert(count);
      if(count==1){
    	  alert("if");
    	  $("#remId").hide();
     }else{
    	 alert("else");
    	  $("#remId").show();
     } */
     
 	 /* $clone.find('[name="auspousearrivalDate[]"]').attr('id','auspousearrivalDate'+uspousecount);
     $clone.find('[name="auspousedepartureDate[]"]').attr('id','auspousedepartureDate'+uspousecount);
     $clone.find('[id="usparrId"]').val(uspousecount); */
     
     $('#updatespouseh1bqueDetailsForm')
     .formValidation('addField', $clone.find('[name="auspousearrivalDate[]"]'))
     .formValidation('addField', $clone.find('[name="auspousearrivalVisa[]"]'))
     .formValidation('addField', $clone.find('[name="auspousedepartureDate[]"]'))
     .formValidation('addField', $clone.find('[name="auspousedepartureVisa[]"]'));
     
    /*  var uaspdob=new Date($('#uspousedob').val());
     $("#auspousearrivalDate"+uspousecount).datepicker('setStartDate', uaspdob);
		$("[id='usparrId']").each(function(){
			var uid=$(this).val();
			 $("#auspousearrivalDate"+uid).datepicker({
				}).on('changeDate', function(selected) {
				        var minDate = new Date(selected.date.valueOf());
				        $('#auspousedepartureDate'+uid).datepicker('setStartDate', minDate);
				        $("#auspousedepartureDate"+uid).prop("disabled",false);
				        $('#updatespouseh1bqueDetailsForm').formValidation('revalidateField', 'auspousearrivalDate[]');
				});
			   $("#auspousedepartureDate"+uid).datepicker({
				}).on('changeDate', function(selected) {
				        var minDate = new Date(selected.date.valueOf());
				        $('#auspousearrivalDate'+uid).datepicker('setEndDate', minDate);
				        $('#updatespouseh1bqueDetailsForm').formValidation('revalidateField', 'auspousedepartureDate[]');
				}); 
		}); */
      $('input[name="auspousearrivalDate[]"]').datepicker({
     }).on('changeDate', function(selected) {
    	 $('input[name="auspousedepartureDate[]"]').prop("disabled",false);
     	 $('#updatespouseh1bqueDetailsForm').formValidation('revalidateField', 'auspousearrivalDate[]');
     });
     $('input[name="auspousedepartureDate[]"]').datepicker({
     }).on('changeDate', function(selected) {
     	 $('#updatespouseh1bqueDetailsForm').formValidation('revalidateField', 'auspchdepartureDate[]');
     });
 })
 .on('click', '.removeButton', function() {
     var $row  = $(this).parents('.form-group'),
         index = $row.attr('data-book-index');
        $arrivalDate = $row.find('[name="auspousearrivalDate[]"]');
     // Remove fields
     $('#updatespouseh1bqueDetailsForm')
     	  .formValidation('removeField', $row.find('[name="auspousearrivalDate[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="auspousearrivalVisa[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="auspousedepartureDate[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="auspousedepartureVisa[' + index + ']"]'))
          .formValidation('removeField', $arrivalDate);
     // Remove element containing the fields
     $row.remove();
});
var childcount=0;
$('#childh1bqueDetailsForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {
    	childssnNo: {
            validators: {
            	isEmpty: {
                    message: 'SSN is mandatory'
                }
            }
        },
        childfirstName: {
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
        childmiddleName: {
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
        childfamilyName: {
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
                }
            }
        },
    childdob: {
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
       childi94No : {
           validators: {
           	 notEmpty: {
                   message: 'I-94 Number is mandatory'
               },
               stringLength: {
                   min: 11,
                   max: 11,
                   message: 'I-94 Number should have minimum 11 and maximum 11 characters '
               },
               regexp: {
               regexp: /[a-zA-Z0-9][a-zA-Z0-9]*/,
                 message: 'I-94 Number accepts alpha numerics '
               },
           }
      },
      childpassportNo : {
          validators: {
          	 notEmpty: {
                  message: 'Passport Number is mandatory'
              },
              stringLength: {
                  min: 9,
                  max: 16,
                  message: 'Passport Number should have minimum 9 and maximum 16 characters '
              },
              regexp: {
              regexp: /[a-zA-Z0-9][a-zA-Z0-9]*/,
                message: 'Passport Number accepts alpha numerics '
              },
          }
     },
      childimmigrantstatus:{
            validators: {
            	notEmpty: {
                    message: 'Please select immigrant status'
                }
            }
        },
        childpassportissueDate: {
            validators: {
                notEmpty: {
                    message: 'Passport issue date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter Joining date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Passport issue date is not a valid'
                }
            }
        },
        childpassportexpDate: {
            validators: {
                notEmpty: {
                    message: 'Passport expiry date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter Joining date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Passport expiry date is not a valid'
                }
            }
        },
        childdateofrecentEntry: {
            validators: {
                notEmpty: {
                    message: 'Date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Date is not a valid'
                }
            }
        },
      /*   childstausofrecentEntry : {
        	 validators: {
            	 notEmpty: {
                    message: 'Status is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Status name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s],
                  message: 'Status accepts alpha numerics '
                },
            }
        }, */
        childstausofrecentEntry:{
            validators: {
            	notEmpty: {
                    message: 'Please select status'
                }
            }
        },
        childpersonalemailid: {
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
        childtelephoneNo : {
            validators: {
            	notEmpty: {
                    message: 'Telephone number is mandatory'
                },
                stringLength: {
                    min: 12,
                    max: 12,
                    message: 'Telephone Number should be 10 numbers'
                },
                regexp: {
                   regexp: /^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$/,
                   message: 'Please enter valid Telephone Number'
                },
            }
        },        
        childline1 : {
            validators: {
            	 notEmpty: {
                    message: 'Line1 name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line1 name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 name accepts alpha numerics '
                },
            }
        },
        childline2 : {
            validators: {
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line2 name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 name accepts alpha numerics '
                },
            }
        },
        childcity : {
            validators: {
            	notEmpty: {
                    message: 'City name is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'City name should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'City name accepts alphanumerics'
                },
            }
        },
        childstate : {
            validators: {
            	notEmpty: {
                    message: 'State name is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'State name should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'State name accepts character'
                },
            }
        },
        childzipcode : {
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
      childpermanentAddr: {
             validators: {
            	 notEmpty: {
                     message: 'Address is mandatory'
                 },
                 stringLength: {
                     min: 2,
                     message: 'Address length should be min 2'
                 },
                 regexp: {
                    regexp: /^[^\s_@.#&-(),'"]+([a-zA-Z0-9_@.#&(),'"\s-])*[a-zA-Z0-9_@.#&(),'"\s-]+$/,
                     message: 'Address can only consist of alphabetical and Space allowed but is not at beginning or end of the word'
                 },
             }
         },
         childcountryofcitizenship : {
             validators: {
             	notEmpty: {
                     message: 'Country of citizenship is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'Country of citizenship should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'Country of citizenship accepts characters'
                 },
             }
         },
         childcountryofbirth : {
             validators: {
             	notEmpty: {
                     message: 'Country of birth is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'Country of birth should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'Country of birth accepts characters'
                 },
             }
         },
         childcityofbirth : {
             validators: {
             	notEmpty: {
                     message: 'City of birth is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'City of birth should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'City of birth accepts characters'
                 },
             }
         },
      'childdepartureDate[]' : {
                 validators: {
                     notEmpty: {
                         message: 'Date is required'
                     },
                     regexp: {
                     	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                         message: 'Please enter date in MM/DD/YYYY format'
                     },
                     date: {
                         format: 'MM/DD/YYYY',
                         message: 'Date is not a valid'
                     }
                 }
             },
     'childarrivalDate[]' : {
                 validators: {
                     notEmpty: {
                         message: 'Date is required'
                     },
                     regexp: {
                     	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                         message: 'Please enter date in MM/DD/YYYY format'
                     },
                     date: {
                         format: 'MM/DD/YYYY',
                         message: 'Date is not a valid'
                     }
                 }
             },
    'childarrivalVisa[]' : {
    	 validators: {
          	notEmpty: {
          		message: 'Please select status'
              }
           }
        },
    'childdepartureVisa[]' : {
                 validators: {
                 	notEmpty: {
                 		message: 'Please select status'
                     }
                 }
             }      
      }
}).on('click', '.addButton', function() {
	childcount++;
     var $template = $('#childaddEntrtyExits'),
         $clone    = $template
                         .clone()
                         .removeAttr('style')
                         .removeAttr('id')
                         .attr('data-book-index', childcount)
                         .attr('class', "childEntryExitsAdd")
                         .insertAfter($template);
     //
     // Add new field
    /* alert(count);
      if(count==1){
    	  alert("if");
    	  $("#remId").hide();
     }else{
    	 alert("else");
    	  $("#remId").show();
     } */
     
/*      $clone.find('[name="childarrivalDate[]"]').attr('id','childarrivalDate'+childcount);
     $clone.find('[name="childdepartureDate[]"]').attr('id','childdepartureDate'+childcount);
     $clone.find('[id="charrId"]').val(childcount); */
     
     $('#childh1bqueDetailsForm')
     .formValidation('addField', $clone.find('[name="childarrivalDate[]"]'))
     .formValidation('addField', $clone.find('[name="childarrivalVisa[]"]'))
     .formValidation('addField', $clone.find('[name="childdepartureDate[]"]'))
     .formValidation('addField', $clone.find('[name="childdepartureVisa[]"]'));
 
  /*  	var achdob=new Date($('#childdob').val());
   	 $("#childarrivalDate"+childcount).datepicker('setStartDate', achdob);
 	$("[id='charrId']").each(function(){
 			var id=$(this).val();
 			 $("#childarrivalDate"+id).datepicker({
 				}).on('changeDate', function(selected) {
 				        var minDate = new Date(selected.date.valueOf());
 				        $('#childdepartureDate'+id).datepicker('setStartDate', minDate);
 				        $("#childdepartureDate"+id).prop("disabled",false);
				        $('#childh1bqueDetailsForm').formValidation('revalidateField', 'childarrivalDate[]');
 				});
 			   $("#childdepartureDate"+id).datepicker({
 				}).on('changeDate', function(selected) {
 				        var minDate = new Date(selected.date.valueOf());
 				        $('#childarrivalDate'+id).datepicker('setEndDate', minDate);
 				       $('#childh1bqueDetailsForm').formValidation('revalidateField', 'childdepartureDate[]');
 				}); 
 		}); */
 		
    $('input[name="childarrivalDate[]"]').datepicker({
     }).on('changeDate', function(selected) {
    	 $('input[name="childdepartureDate[]"]').prop("disabled",false);
     	 $('#childh1bqueDetailsForm').formValidation('revalidateField', 'childarrivalDate[]');
     });
     $('input[name="childdepartureDate[]"]').datepicker({
     }).on('changeDate', function(selected) {
     	 $('#childh1bqueDetailsForm').formValidation('revalidateField', 'childdepartureDate[]');
     });
 })
 .on('click', '.removeButton', function() {
     var $row  = $(this).parents('.form-group'),
         index = $row.attr('data-book-index');
        $arrivalDate = $row.find('[name="childarrivalDate[]"]');
     // Remove fields
     $('#childh1bqueDetailsForm')
     	  .formValidation('removeField', $row.find('[name="childarrivalDate[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="childarrivalVisa[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="childdepartureDate[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="childdepartureVisa[' + index + ']"]'))
          .formValidation('removeField', $arrivalDate);
     // Remove element containing the fields
     $row.remove();
});



var uchildcount=0;
$('#updatechildh1bqueDetailsForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {
    	uchildssnNo: {
            validators: {
            	isEmpty: {
                    message: 'SSN is mandatory'
                }
            }
        },
        uchildfirstName: {
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
        uchildmiddleName: {
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
        uchildfamilyName: {
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
                }
            }
        },
    uchilddob: {
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
       uchildi94No : {
           validators: {
           	 notEmpty: {
                   message: 'I-94 Number is mandatory'
               },
               stringLength: {
                   min: 11,
                   max: 11,
                   message: 'I-94 Number should have minimum 11 and maximum 11 characters '
               },
               regexp: {
               regexp: /[a-zA-Z0-9][a-zA-Z0-9]*/,
                 message: 'I-94 Number accepts alpha numerics '
               },
           }
      },
      uchildpassportNo : {
          validators: {
          	 notEmpty: {
                  message: 'Passport Number is mandatory'
              },
              stringLength: {
                  min: 9,
                  max: 16,
                  message: 'Passport Number should have minimum 9 and maximum 16 characters '
              },
              regexp: {
              regexp: /[a-zA-Z0-9][a-zA-Z0-9]*/,
                message: 'Passport Number accepts alpha numerics '
              },
          }
     },
      uchildimmigrantstatus:{
            validators: {
            	notEmpty: {
                    message: 'Please select immigrant status'
                }
            }
        },
        uchildpassportissueDate: {
            validators: {
                notEmpty: {
                    message: 'Passport issue date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter Joining date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Passport issue date is not a valid'
                }
            }
        },
        uchildpassportexpDate: {
            validators: {
                notEmpty: {
                    message: 'Passport expiry date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter Joining date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Passport expiry date is not a valid'
                }
            }
        },
        uchilddateofrecentEntry: {
            validators: {
                notEmpty: {
                    message: 'Date is required'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'Date is not a valid'
                }
            }
        },
        uchildstausofrecentEntry:{
            validators: {
            	notEmpty: {
                    message: 'Please select status'
                }
            }
        },
        uchildpersonalemailid: {
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
        uchildtelephoneNo : {
            validators: {
            	notEmpty: {
                    message: 'Telephone number is mandatory'
                },
                stringLength: {
                    min: 12,
                    max: 12,
                    message: 'Telephone Number should be 10 numbers'
                },
                regexp: {
                   regexp: /^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$/,
                   message: 'Please enter valid Telephone Number'
                },
            }
        },        
        uchildline1 : {
            validators: {
            	 notEmpty: {
                    message: 'Line1 name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line1 name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 name accepts alpha numerics '
                },
            }
        },
        uchildline2 : {
            validators: {
                stringLength: {
                    min: 2,
                    max: 80,
                    message: 'Line2 name should have minimum 2 and maximum 80 characters'
                },
                regexp: {
                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
                  message: 'Line1 name accepts alpha numerics '
                },
            }
        },
        uchildcity : {
            validators: {
            	notEmpty: {
                    message: 'City name is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'City name should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'City name accepts alphanumerics'
                },
            }
        },
        uchildstate : {
            validators: {
            	notEmpty: {
                    message: 'State name is mandatory'
                },
                stringLength: {
                	min: 2,
                    max: 25,
                    message: 'State name should have 2 characters'
                },
                regexp: {
                	regexp: /^[a-zA-Z\s]+$/,
                   message: 'State name accepts character'
                },
            }
        },
        uchildzipcode : {
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
      uchildpermanentAddr: {
             validators: {
            	 notEmpty: {
                     message: 'Address is mandatory'
                 },
                 stringLength: {
                     min: 2,
                     message: 'Address length should be min 2'
                 },
                 regexp: {
                    regexp: /^[^\s_@.#&-(),'"]+([a-zA-Z0-9_@.#&(),'"\s-])*[a-zA-Z0-9_@.#&(),'"\s-]+$/,
                     message: 'Address can only consist of alphabetical and Space allowed but is not at beginning or end of the word'
                 },
             }
         },
         uchildcountryofcitizenship : {
             validators: {
             	notEmpty: {
                     message: 'Country of citizenship is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'Country of citizenship should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'Country of citizenship accepts characters'
                 },
             }
         },
         uchildcountryofbirth : {
             validators: {
             	notEmpty: {
                     message: 'Country of birth is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'Country of birth should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'Country of birth accepts characters'
                 },
             }
         },
         uchildcityofbirth : {
             validators: {
             	notEmpty: {
                     message: 'City of birth is mandatory'
                 },
                 stringLength: {
                 	min: 2,
                     max: 25,
                     message: 'City of birth should have 2 characters'
                 },
                 regexp: {
                 	regexp: /^[a-zA-Z]+$/,
                    message: 'City of birth accepts characters'
                 },
             }
         },
      'auchilddepartureDate[]' : {
                 validators: {
                     notEmpty: {
                         message: 'Date is required'
                     },
                     regexp: {
                     	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                         message: 'Please enter date in MM/DD/YYYY format'
                     },
                     date: {
                         format: 'MM/DD/YYYY',
                         message: 'Date is not a valid'
                     }
                 }
             },
     'auchildarrivalDate[]' : {
                 validators: {
                     notEmpty: {
                         message: 'Date is required'
                     },
                     regexp: {
                     	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                         message: 'Please enter date in MM/DD/YYYY format'
                     },
                     date: {
                         format: 'MM/DD/YYYY',
                         message: 'Date is not a valid'
                     }
                 }
             },
    'auchildarrivalVisa[]' : {
    	 validators: {
          	notEmpty: {
          		message: 'Please select status'
              }
           }
        },
    'auchilddepartureVisa[]' : {
                 validators: {
                 	notEmpty: {
                 		message: 'Please select status'
                     }
                 }
             }      
      }
}).on('click', '.addButton', function() {
	 uchildcount++;
     var $template = $('#uchildaddEntrtyExits'),
         $clone    = $template
                         .clone()
                         .removeAttr('style')
                         .removeAttr('id')
                         .attr('class', 'uchildaddEntrty')
                         .attr('data-book-index', uchildcount)
                         .insertAfter($template);
     //
     // Add new field
    /* alert(count);
      if(count==1){
    	  alert("if");
    	  $("#remId").hide();
     }else{
    	 alert("else");
    	  $("#remId").show();
     } */
   /*   $clone.find('[name="auchildarrivalDate[]"]').attr('id','auchildarrivalDate'+uchildcount);
     $clone.find('[name="auchilddepartureDate[]"]').attr('id','auchilddepartureDate'+uchildcount);
     $clone.find('[id="ucharrId"]').val(uchildcount);
     var uchdob=new Date($('#uchilddob').val()); */
     
     $('#updatechildh1bqueDetailsForm')
     .formValidation('addField', $clone.find('[name="auchildarrivalDate[]"]'))
     .formValidation('addField', $clone.find('[name="auchildarrivalVisa[]"]'))
     .formValidation('addField', $clone.find('[name="auchilddepartureDate[]"]'))
     .formValidation('addField', $clone.find('[name="auchilddepartureVisa[]"]'));
     
    /*  $("#auchildarrivalDate"+uchildcount).datepicker('setStartDate', uchdob);
		$("[id='ucharrId']").each(function(){
			var uid=$(this).val();
			 $("#auchildarrivalDate"+uid).datepicker({
				}).on('changeDate', function(selected) {
				        var minDate = new Date(selected.date.valueOf());
				        $('#auchilddepartureDate'+uid).datepicker('setStartDate', minDate);
				        $("#auchilddepartureDate"+uid).prop("disabled",false);
				        $('#updatechildh1bqueDetailsForm').formValidation('revalidateField', 'auchildarrivalDate[]');
				});
			   $("#auchilddepartureDate"+uid).datepicker({
				}).on('changeDate', function(selected) {
				        var minDate = new Date(selected.date.valueOf());
				        $('#auchildarrivalDate'+uid).datepicker('setEndDate', minDate);
				        $('#updatechildh1bqueDetailsForm').formValidation('revalidateField', 'auchilddepartureDate[]');
				}); 
		}); */
     
     $('input[name="auchildarrivalDate[]"]').datepicker({
     }).on('changeDate', function(selected) {
    	 $('input[name="auchilddepartureDate[]"]').prop("disabled",false);
     	 $('#updatechildh1bqueDetailsForm').formValidation('revalidateField', 'auchildarrivalDate[]');
     });
     $('input[name="auchilddepartureDate[]"]').datepicker({
     }).on('changeDate', function(selected) {
     	 $('#updatechildh1bqueDetailsForm').formValidation('revalidateField', 'auchilddepartureDate[]');
     });
 })
 .on('click', '.removeButton', function() {
     var $row  = $(this).parents('.form-group'),
         index = $row.attr('data-book-index');
        $arrivalDate = $row.find('[name="auchildarrivalDate[]"]');
     // Remove fields
     $('#updatechildh1bqueDetailsForm')
     	  .formValidation('removeField', $row.find('[name="auchildarrivalDate[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="auchildarrivalVisa[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="auchilddepartureDate[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="auchilddepartureVisa[' + index + ']"]'))
          .formValidation('removeField', $arrivalDate);
     // Remove element containing the fields
     $row.remove();
});



$('#updatechildEntryExitsForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {
    ucharrivalDate : {
             validators: {
                 notEmpty: {
                     message: 'Date is required'
                 },
                 regexp: {
                 	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                     message: 'Please enter date in MM/DD/YYYY format'
                 },
                 date: {
                     format: 'MM/DD/YYYY',
                     message: 'Date is not a valid'
                 }
             }
         },
   uchdepartureDate : {
             validators: {
                 notEmpty: {
                     message: 'Date is required'
                 },
                 regexp: {
                 	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                     message: 'Please enter date in MM/DD/YYYY format'
                 },
                 date: {
                     format: 'MM/DD/YYYY',
                     message: 'Date is not a valid'
                 }
             }
         },
   ucharrivalVisa : {
	 validators: {
      	notEmpty: {
      		message: 'Please select status'
          }
       }
    },
    uchdepartureVisa : {
             validators: {
             	notEmpty: {
             		message: 'Please select status'
                 }
             }
         }
      }
});


/* $("[id='childh1que_id']").each(function(){
	 var id=$(this).val();
	$('#updatechildh1bqueDetailsForm'+id).formValidation({
		 framework: 'bootstrap',
		    row: {
		        valid: 'field-success',
		        invalid: 'field-error'
		    },
		    fields: {
		        uchildfamilyName: {
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
		        }
		    }
	});
}); */
/* .on('added.field.fv', function(e, data) {
    if (data.field === 'arrivalDate[]') {
        if ($('#h1bqueDetailsForm').find(':visible[name="arrivalDate[]"]').length ==1) {
            $('#addClientVendorForm').find('.addButton').attr('disabled', 'disabled');
         }
    }
 }).on('removed.field.fv', function(e, data) {
     if (data.field === 'othr_client_name[]') {
          if ($('#h1bqueDetailsForm').find(':visible[name="othr_client_name[]"]').length <= MAX_OPTIONS) {
              $('#h1bqueDetailsForm').find('.addButton').removeAttr('disabled');
          }
      }
 }); */
 if($("#tapplh1que_id").val()!=""){
		var tdob=new Date($("#dob").val());
		//$('#upassportissueDate,#udateoffirstEntry,#udateofrecentEntry').datepicker('setEndDate', upaasEDate);
		if($("#dob").val()!="" || $("#passportissueDate").val()!="" || $("#passportexpDate").val()!="" || $("#dateoffirstEntry").val()!=""){
		//$('#upassportissueDate,#udateoffirstEntry,#udateofrecentEntry').datepicker('setStartDate', audob);
		$("#dob").datepicker({
			maxDate:0
		}).on('changeDate', function(selected) {
			 $("#passportissueDate,#btnid,#dateoffirstEntry").prop("disabled",false);
			 var minDate = new Date(selected.date.valueOf());
		     $('#passportissueDate,#dateoffirstEntry').datepicker('setStartDate', minDate);
			 $('#h1bqueDetailsForm').formValidation('revalidateField', 'dob');
		});
		$("#passportissueDate").datepicker({
			
		}).on('changeDate', function(selected) {
			 var minDate = new Date(selected.date.valueOf());
		     $('#passportexpDate').datepicker('setStartDate', minDate);
			 $("#passportexpDate").prop("disabled",false);
			 $('#h1bqueDetailsForm').formValidation('revalidateField', 'passportissueDate');
		});
		$("#passportexpDate").datepicker({
		}).on('changeDate', function(selected) {
			var minDate = new Date(selected.date.valueOf());
		    $('#passportissueDate').datepicker('setEndDate', minDate);
			 $('#h1bqueDetailsForm').formValidation('revalidateField', 'passportexpDate');
		});
		$("#dateoffirstEntry").datepicker({
		}).on('changeDate', function(selected) {
			 var minDate = new Date(selected.date.valueOf());
			 $('#dateofrecentEntry').datepicker('setStartDate', minDate);
			 $("#dateofrecentEntry").prop("disabled",false);
			 $('#h1bqueDetailsForm').formValidation('revalidateField', 'dateoffirstEntry');
		});
		$("#dateofrecentEntry").datepicker({
		}).on('changeDate', function(selected) {
			var minDate = new Date(selected.date.valueOf());
		    $('#dateoffirstEntry').datepicker('setEndDate', minDate);
			 $('#h1bqueDetailsForm').formValidation('revalidateField', 'dateofrecentEntry');
		});
		//$('#upassportissueDate,#udateoffirstEntry,#udateofrecentEntry').datepicker('setStartDate', audob);
		if($("#dob").val()!=""){
			$('#passportissueDate,#dateoffirstEntry,#dateofrecentEntry').datepicker('setStartDate', tdob);
			$('#dob').datepicker('setEndDate', new Date());
			$("#passportissueDate,#dateoffirstEntry,#btnid").prop("disabled",false);
	     }
	  }else{
		  $("#dob").datepicker({
				maxDate:0
			}).on('changeDate', function(selected) {
				$("#passportissueDate,#btnid,#dateoffirstEntry").prop("disabled",false);
				 var minDate = new Date(selected.date.valueOf());
			     $('#passportissueDate,#dateoffirstEntry').datepicker('setStartDate', minDate);
				 $('#h1bqueDetailsForm').formValidation('revalidateField', 'dob');
			});
			$("#passportissueDate").datepicker({
				
			}).on('changeDate', function(selected) {
				 var minDate = new Date(selected.date.valueOf());
			     $('#passportexpDate').datepicker('setStartDate', minDate);
				 $("#passportexpDate").prop("disabled",false);
				 $('#h1bqueDetailsForm').formValidation('revalidateField', 'passportissueDate');
			});
			$("#passportexpDate").datepicker({
			}).on('changeDate', function(selected) {
				var minDate = new Date(selected.date.valueOf());
			    $('#passportissueDate').datepicker('setEndDate', minDate);
				 $('#h1bqueDetailsForm').formValidation('revalidateField', 'passportexpDate');
			});
			$("#dateoffirstEntry").datepicker({
			}).on('changeDate', function(selected) {
				 var minDate = new Date(selected.date.valueOf());
				 $('#dateofrecentEntry').datepicker('setStartDate', minDate);
				 $("#dateofrecentEntry").prop("disabled",false);
				 $('#h1bqueDetailsForm').formValidation('revalidateField', 'dateoffirstEntry');
			});
			$("#dateofrecentEntry").datepicker({
			}).on('changeDate', function(selected) {
				var minDate = new Date(selected.date.valueOf());
			    $('#dateoffirstEntry').datepicker('setEndDate', minDate);
				 $('#h1bqueDetailsForm').formValidation('revalidateField', 'dateofrecentEntry');
			});
	  }
}else{
$("#dob").datepicker({
	maxDate:0
}).on('changeDate', function(selected) {
	$("#passportissueDate,#btnid,#dateoffirstEntry").prop("disabled",false);
	 var minDate = new Date(selected.date.valueOf());
     $('#passportissueDate,#dateoffirstEntry').datepicker('setStartDate', minDate);
	 $('#h1bqueDetailsForm').formValidation('revalidateField', 'dob');
});
$("#passportissueDate").datepicker({
	
}).on('changeDate', function(selected) {
	 var minDate = new Date(selected.date.valueOf());
     $('#passportexpDate').datepicker('setStartDate', minDate);
	 $("#passportexpDate").prop("disabled",false);
	 $('#h1bqueDetailsForm').formValidation('revalidateField', 'passportissueDate');
});
$("#passportexpDate").datepicker({
}).on('changeDate', function(selected) {
	var minDate = new Date(selected.date.valueOf());
    $('#passportissueDate').datepicker('setEndDate', minDate);
	 $('#h1bqueDetailsForm').formValidation('revalidateField', 'passportexpDate');
});
$("#dateoffirstEntry").datepicker({
}).on('changeDate', function(selected) {
	 var minDate = new Date(selected.date.valueOf());
	 $('#dateofrecentEntry').datepicker('setStartDate', minDate);
	 $("#dateofrecentEntry").prop("disabled",false);
	 $('#h1bqueDetailsForm').formValidation('revalidateField', 'dateoffirstEntry');
});
$("#dateofrecentEntry").datepicker({
}).on('changeDate', function(selected) {
	var minDate = new Date(selected.date.valueOf());
    $('#dateoffirstEntry').datepicker('setEndDate', minDate);
	 $('#h1bqueDetailsForm').formValidation('revalidateField', 'dateofrecentEntry');
});
}
if($("#applh1que_id").val()!=""){
	//alert($("#udob").val());
	var audob=new Date($("#udob").val());
	//$('#upassportissueDate,#udateoffirstEntry,#udateofrecentEntry').datepicker('setEndDate', upaasEDate);
	if($("#udob").val()!="" || $("#upassportissueDate").val()!="" || $("#upassportexpDate").val()!="" || $("#udateoffirstEntry").val()!=""){
	//$('#upassportissueDate,#udateoffirstEntry,#udateofrecentEntry').datepicker('setStartDate', audob);
	$("#udob").datepicker({
	  }).on('changeDate', function(selected) {
		 $('#updateh1bqueDetailsForm').formValidation('revalidateField', 'udob');
	});
	$("#upassportissueDate").datepicker({
	}).on('changeDate', function(selected) {
		 $('#upassportexpDate').datepicker('setStartDate', minDate);
		 $('#updateh1bqueDetailsForm').formValidation('revalidateField', 'upassportissueDate');
	});
	$("#upassportexpDate").datepicker({
		
	}).on('changeDate', function(selected) {
		 $('#updateh1bqueDetailsForm').formValidation('revalidateField', 'upassportexpDate');
	});
	$("#udateoffirstEntry").datepicker({
	}).on('changeDate', function(selected) {
		 $('#udateofrecentEntry').datepicker('setStartDate', minDate);
		 $('#updateh1bqueDetailsForm').formValidation('revalidateField', 'udateoffirstEntry');
	});
	$("#udateofrecentEntry").datepicker({
	}).on('changeDate', function(selected) {
		 $('#udateoffirstEntry').datepicker('setEndDate', minDate);
		 $('#updateh1bqueDetailsForm').formValidation('revalidateField', 'udateofrecentEntry');
	});
	//$('#upassportissueDate,#udateoffirstEntry,#udateofrecentEntry').datepicker('setStartDate', audob);
	if($("#udob").val()!=""){
		$('#upassportissueDate,#udateoffirstEntry,#udateofrecentEntry').datepicker('setStartDate', audob);
		$('#udob').datepicker('setEndDate', new Date());
     }
  }
	
	
}



/* $("#spousedob").datepicker({
}).on('changeDate', function(selected) {
	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousedob');
});
$("#spousepassportissueDate").datepicker({
}).on('changeDate', function(selected) {
	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousepassportissueDate');
});
$("#spousepassportexpDate").datepicker({
}).on('changeDate', function(selected) {
	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousepassportexpDate');
});
$("#spousedateofrecentEntry").datepicker({
}).on('changeDate', function(selected) {
	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousedateofrecentEntry');
});
 */
 if($("#tspouseh1que_id").val()!=""){
	// alert($("#tspouseh1que_id").val());
		//$('#upassportissueDate,#udateoffirstEntry,#udateofrecentEntry').datepicker('setEndDate', upaasEDate);
     if($("#spousedob").val()!="" || $("#spousepassportissueDate").val()!="" || $("#spousepassportexpDate").val()!="" || $("#spousedateofrecentEntry").val()!=""){
		//$('#upassportissueDate,#udateoffirstEntry,#udateofrecentEntry').datepicker('setStartDate', audob);
$("#spousedob").datepicker({
}).on('changeDate', function(selected) {
	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousedob');
});
$("#spousepassportissueDate").datepicker({
}).on('changeDate', function(selected) {
	var minDate = new Date(selected.date.valueOf());
	 $('#spousepassportexpDate').datepicker('setStartDate', minDate);
	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousepassportissueDate');
});
$("#spousepassportexpDate").datepicker({
}).on('changeDate', function(selected) {
	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousepassportexpDate');
});
$("#spousedateofrecentEntry").datepicker({
}).on('changeDate', function(selected) {
	var minDate = new Date(selected.date.valueOf());
    $('#spousepassportissueDate').datepicker('setEndDate', minDate);
	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousedateofrecentEntry');
});

 if($("#spousedob").val()!=""){
	 var ausdob=new Date($("#spousedob").val());
	$('#spousepassportissueDate,#spousedateofrecentEntry').datepicker('setStartDate', ausdob);
	$('#spousedob').datepicker('setEndDate', new Date());
	$("#spousepassportissueDate,#spousebtnid,#spousedateofrecentEntry").prop("disabled",false);
	if($("#spousepassportissueDate").val()!=""){
		var passissuedt=new Date($("#spousepassportissueDate").val());
		$('#spousepassportexpDate').datepicker('setStartDate', passissuedt);
	  }
	if($("#spousepassportexpDate").val()!=""){
		var passexpdt=new Date($("#spousepassportexpDate").val());
		$('#spousepassportissueDate').datepicker('setEndDate', passexpdt);
	  }
    }
  }else{
	    $("#spousedob").datepicker({
			 maxDate:0
		 }).on('changeDate', function(selected) {
		 	  var minDate = new Date(selected.date.valueOf());
		 	  $("#spousepassportissueDate,#spousebtnid,#spousedateofrecentEntry").prop("disabled",false);
		      $('#spousepassportissueDate,#spousedateofrecentEntry').datepicker('setStartDate', minDate);
		 	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousedob');
		 });
		 $("#spousepassportissueDate").datepicker({
		 	
		 }).on('changeDate', function(selected) {
		 	 var minDate = new Date(selected.date.valueOf());
		      $('#spousepassportexpDate').datepicker('setStartDate', minDate);
		 	 $("#spousepassportexpDate").prop("disabled",false);
		 	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousepassportissueDate');
		 });
		 $("#spousepassportexpDate").datepicker({
		 }).on('changeDate', function(selected) {
		 	var minDate = new Date(selected.date.valueOf());
		     $('#spousepassportissueDate').datepicker('setEndDate', minDate);
		 	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousepassportexpDate');
		 });
		 $("#spousedateofrecentEntry").datepicker({
		 }).on('changeDate', function(selected) {
		 	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousedateofrecentEntry');
		 });
	  $("#spousepassportissueDate,#spousebtnid,#spousedateofrecentEntry").prop("disabled",true);
   }
 }else{
	 $("#spousedob").datepicker({
		 maxDate:0
	 }).on('changeDate', function(selected) {
	 	  var minDate = new Date(selected.date.valueOf());
	 	  $("#spousepassportissueDate,#spousebtnid,#spousedateofrecentEntry").prop("disabled",false);
	      $('#spousepassportissueDate,#spousedateofrecentEntry').datepicker('setStartDate', minDate);
	 	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousedob');
	 });
	 $("#spousepassportissueDate").datepicker({
	 	
	 }).on('changeDate', function(selected) {
	 	 var minDate = new Date(selected.date.valueOf());
	      $('#spousepassportexpDate').datepicker('setStartDate', minDate);
	 	 $("#spousepassportexpDate").prop("disabled",false);
	 	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousepassportissueDate');
	 });
	 $("#spousepassportexpDate").datepicker({
	 }).on('changeDate', function(selected) {
	 	var minDate = new Date(selected.date.valueOf());
	     $('#spousepassportissueDate').datepicker('setEndDate', minDate);
	 	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousepassportexpDate');
	 });
	 $("#spousedateofrecentEntry").datepicker({
	 }).on('changeDate', function(selected) {
	 	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'spousedateofrecentEntry');
	 });
 }
 
 if($("#spouseh1que_id").val()!=""){
		//alert($("#udob").val());
		var ausdob=new Date($("#uspousedob").val());
		//$('#upassportissueDate,#udateoffirstEntry,#udateofrecentEntry').datepicker('setEndDate', upaasEDate);
		if($("#uspousedob").val()!="" || $("#uspousepassportissueDate").val()!="" || $("#uspousepassportexpDate").val()!="" || $("#uspousedateofrecentEntry").val()!=""){
		//$('#upassportissueDate,#udateoffirstEntry,#udateofrecentEntry').datepicker('setStartDate', audob);
		$("#uspousedob").datepicker({
}).on('changeDate', function(selected) {
	 $('#updatespouseh1bqueDetailsForm').formValidation('revalidateField', 'uspousedob');
});
$("#uspousepassportissueDate").datepicker({
}).on('changeDate', function(selected) {
	 $('#updatespouseh1bqueDetailsForm').formValidation('revalidateField', 'uspousepassportissueDate');
});
$("#uspousepassportexpDate").datepicker({
}).on('changeDate', function(selected) {
	 $('#updatespouseh1bqueDetailsForm').formValidation('revalidateField', 'uspousepassportexpDate');
});
$("#uspousedateofrecentEntry").datepicker({
}).on('changeDate', function(selected) {
	 $('#updatespouseh1bqueDetailsForm').formValidation('revalidateField', 'uspousedateofrecentEntry');
});
 if($("#uspousedob").val()!=""){
	$('#uspousepassportissueDate,#uspousedateofrecentEntry').datepicker('setStartDate', ausdob);
	$('#uspousedob').datepicker('setEndDate', new Date());
  }
 }
}

 $('#dob,#spousedob,#childdob').datepicker('setEndDate', new Date());
 $("#childdob").datepicker({
		
 }).on('changeDate', function(selected) {
 	$("#childpassportissueDate,#childbtnid,#childdateofrecentEntry").prop("disabled",false);
 	 var minDate = new Date(selected.date.valueOf());
      $('#childpassportissueDate,#childdateofrecentEntry').datepicker('setStartDate', minDate);
 	 $('#childh1bqueDetailsForm').formValidation('revalidateField', 'childdob');
 });
 $("#childpassportissueDate").datepicker({
 	
 }).on('changeDate', function(selected) {
 	 var minDate = new Date(selected.date.valueOf());
      $('#childpassportexpDate').datepicker('setStartDate', minDate);
 	 $("#childpassportexpDate").prop("disabled",false);
 	 $('#childh1bqueDetailsForm').formValidation('revalidateField', 'childpassportissueDate');
 });
 $("#childpassportexpDate").datepicker({
 }).on('changeDate', function(selected) {
 	var minDate = new Date(selected.date.valueOf());
      $('#childpassportissueDate').datepicker('setEndDate', minDate);
 	 $('#childh1bqueDetailsForm').formValidation('revalidateField', 'childpassportexpDate');
 });
 $("#childdateofrecentEntry").datepicker({
 }).on('changeDate', function(selected) {
 	 $('#childh1bqueDetailsForm').formValidation('revalidateField', 'childdateofrecentEntry');
 });
     /*    jQuery('.plus').click(function(){

    	   jQuery('.information_json_plus_answer').before(
    	            '<tr>' +
    	            '<td><input type="text" class="col-xs-5" id="information_json_name[]" placeholder="answer"></td>' +
    	            '<td><input type="checkbox" class="checkbox" id="information_json_val[]"></td>' +
    	            '<td><span class="btn btn-danger minus pull-right">&ndash;</span></td>' +
    	            '</tr>');
    	});


  	jQuery('.plus-new').click(function(){
    		jQuery('.information_json_new').before(
    	        '<tr>' +
    			'<th>question</th>' +
    			'<th>multanswer</th>' +
    			'<th></th>' +
    		'</tr>'+
    		'<tr>' +
    			'<td><input type="text" class="form-control" id="information_json_name[]" placeholder="Question"></td>' +
    			'<td><input type="checkbox" class="checkbox" id="information_json_val[]"></td>' +
    			'<td><span class="btn btn-danger minus pull-right">&ndash;</span><span class="btn btn-success plus pull-right">+</span></td>' +
    	    '</tr>'
    	    '<tr class="information_json_plus">'+
    	        '<td></td>'+
    	        '<td></td>'+
    	        '<td></td>'+
    	    '</tr>' 
    	    );
    	    
    	}); */

    	/* jQuery(document).on('click', '.minus', function(){
    		jQuery( this ).closest( 'tr' ).remove(); 
    	    jQuery(this).closest('plus').remove();
    	   
    	}); */
    	jQuery(document).on('click', '.minus', function(){
            $(this).closest( 'tr' ).remove();
            $(this).closest( 'tr.question' ).remove(); 
            $(this).closest('plus').remove();
		});
    	jQuery(document).on('click', '.plus', function(){
    		jQuery( this ).closest( 'tr' ).before(
    	        '<tr>' +
    	            '<td><input type="text" class="form-control" id="arrivalDate[]" placeholder="Arrival Date"></td>' +
    	            '<td><input type="text" class="form-control" id="arrivalVisa[]" placeholder="Arrival Visa"></td>' +
    	            '<td><input type="text" class="form-control" id="departureDate[]" placeholder="Departure Date"></td>' +
    	            '<td><input type="text" class="form-control" id="departureVisa[]" placeholder="Departure Visa"></td>' +
    	            '<td><span class="btn btn-danger minus pull-right">&ndash;</span></td>' +
    	        '</tr>'
    	        );
});
    	/* var collk = document.getElementsByClassName("collapsibleh1bAppl");
		var k;
		for (k = 0; k < collk.length; k++) {
			collk[k].addEventListener("click", function() {
				this.classList.toggle("active");
				var content = this.nextElementSibling;
				if (content.style.display === "block") {
					content.style.display = "none";
				} else {
					content.style.display = "block";
				}
			});
		}
		var collk = document.getElementsByClassName("collapsibleh1bspouse");
		var k;
		for (k = 0; k < collk.length; k++) {
			collk[k].addEventListener("click", function() {
				this.classList.toggle("active");
				var content = this.nextElementSibling;
				if (content.style.display === "block") {
					content.style.display = "none";
				} else {
					content.style.display = "block";
				}
			});
		}
		var collk = document.getElementsByClassName("collapsibleh1bchild");
		var k;
		for (k = 0; k < collk.length; k++) {
			collk[k].addEventListener("click", function() {
				this.classList.toggle("active");
				var content = this.nextElementSibling;
				if (content.style.display === "block") {
					content.style.display = "none";
				} else {
					content.style.display = "block";
				}
			});
		} */
		 jQuery(document).on('click', '.collapsibleh1bAppl', function(){
			$("#h1bApplId").show();
			$('#h1bSpouseId').hide();
		});
		jQuery(document).on('click', '.collapsibleh1bspouse', function(){
			$('#h1bApplId').hide();
			$("#h1bSpouseId").show();
		});
		jQuery(document).on('click', '.collapsibleh1bchild', function(){
			$("#h1bChildId").show();
			$('#childh1bqueDetailsForm').data('formValidation').resetForm();
			$('#childh1bqueDetailsForm').bootstrapValidator('resetForm', true);
			$('#h1bApplId').hide();
		}); 
		$('#btnh1bAppl,#btnh1bspouse,#btnh1bchild,#btnh1bspouseAdmin,#btnh1bApplAdmin').hide();
		$( document ).ready(function() {
			$('#h1bAppl').trigger("click");
		});
		$("#h1bAppl").click(function(){
			$('.applEntryExitsAdd').empty();
		/* 	if($("#roleid").val()==4){
				if($("#applh1que_id").val()!=""){
						 $('#h1bApplId').show();
					}else{$('#h1bApplId').hide(); } 
				if($("#spouseh1que_id").val()!=""){
					$('#h1bSpouseId').show();
			}else{ $('#h1bSpouseId').hide(); }
			}else{ */
			if($('#applh1que_id').val()!=""){
				var applrejfields= $("#applrejfields").val();
				var applrejform_status= $("#applrejform_status").val();
				//alert(applrejform_status+"Applicant Rej Fields"+applrejfields);
				if(applrejform_status=='Rejected'){
				$("#updateh1bqueDetailsForm :input").attr("readonly", true);
				if(applrejfields.includes("lastName")){
					  $("#ufamilyName").prop("readonly", false);
				 }else{
					 $("#ufamilyName").prop("readonly", true);
				 }
				 if(applrejfields.includes("firstName")){
					  $("#ufirstName").prop("readonly", false);
				 }else{
					  $("#ufirstName").prop("readonly", true);
				 }
				 if(applrejfields.includes("passportNo")){
					  $("#upassportNo").prop("readonly", false);
				 }else{
					  $("#upassportNo").prop("readonly", true);
				 }
				 if(applrejfields.includes("highestEdu")){
					  $("#uhighestEdu").prop("readonly", false);
				 }else{
					  $("#uhighestEdu").prop("readonly", true);
				 }
				 if(applrejfields.includes("middleName")){
						  $("#umiddleName").prop("readonly",false);
					  }else{
						  $("#umiddleName").prop("readonly", true);  
					  }
				 if(applrejfields.includes("countryofcitizenship")){
					  $("#ucountryofcitizenship").prop("readonly", false);  
				 }else{
					  $("#ucountryofcitizenship").prop("readonly", true);  
				 }
				 if(applrejfields.includes("telephoneNo")){
					  $("#utelephoneNo"). prop("readonly", false);
				 }else{
					  $("#utelephoneNo"). prop("readonly", true);
				 }
				 if(applrejfields.includes("ssnNo")){
					  $("#ussnNo"). prop("readonly", false);
				 }else{
					  $("#ussnNo"). prop("readonly", true);
				 }
				 if(applrejfields.includes("i94No")){
					  $("#ui94No"). prop("readonly", false);
				 }else{
					  $("#ui94No"). prop("readonly", true);
				 }
				 if(applrejfields.includes("officialemailid")){
					  $("#uofficialemailid"). prop("readonly", false);
				 }else{
					  $("#uofficialemailid"). prop("readonly", true); 
				 }
				 if(applrejfields.includes("personalemailid")){
					  $("#upersonalemailid"). prop("readonly", false);
				 }else{
					  $("#upersonalemailid"). prop("readonly", true);
				 }
				// alert(applrejfields.includes("currimmistatus"));
				 if(applrejfields.includes("currimmistatus")){
					 $("#uimmigrantstatus"). attr("readonly", false);
				 }else{
					  $("#uimmigrantstatus"). attr("readonly", true);
					  var value=$("#uimmigrantstatus").val();
					  $("#uimmigrantstatus").children('option').hide();
					  $("#uimmigrantstatus").children("option[value^='" + value + "']").show();
				 }
				 
				 if(applrejfields.includes("dateoffirstEntry")){
					  $("#udateoffirstEntry"). prop("readonly", false);
				 }else{
					  $("#udateoffirstEntry"). prop("readonly", true);
				 }
				 if(applrejfields.includes("stausoffirstEntry")){ 
					  $("#ustausoffirstEntry"). attr("readonly", false);
				 }else{
					  $("#ustausoffirstEntry"). attr("readonly", true); 
					  var value=$("#ustausoffirstEntry").val();
					  $("#ustausoffirstEntry").children('option').hide();
					  $("#ustausoffirstEntry").children("option[value^='" + value + "']").show();
				 }
				 if(applrejfields.includes("dob")){
						$("#udob"). prop("readonly", false);
				 }else{
						$("#udob"). prop("readonly", true);
				 }
				if(applrejfields.includes("countryofbirth")){
					 $("#ucountryofbirth"). prop("readonly", false);
				 }else{
					  $("#ucountryofbirth"). prop("readonly", true);
				 }  
				if(applrejfields.includes("cityofbirth")){
					  $("#ucityofbirth"). prop("readonly", false);
				 }else{
					  $("#ucityofbirth"). prop("readonly", true);
				 }

				if(applrejfields.includes("yearsofItExp")){
					$("#uyearsofItExp"). prop("readonly", false);
				}else{
				 $("#uyearsofItExp"). prop("readonly", true);
				}
				if(applrejfields.includes("Specialization")){
				$("#uspecialization"). prop("readonly", false);
				}else{
				 $("#uspecialization"). prop("readonly", true);
				}  
				if(applrejfields.includes("passportissueDate")){
				 $("#upassportissueDate"). prop("readonly", false);
				}else{
				 $("#upassportissueDate"). prop("readonly", true); 
				}
				if(applrejfields.includes("passportexpDate")){
				 $("#upassportexpDate"). prop("readonly", false);
				}else{
				 $("#upassportexpDate"). prop("readonly", true); 
				}
				if(applrejfields.includes("line1")){
				$("#uline1"). prop("readonly", false);
				}else{
				$("#uline1"). prop("readonly", true);
				}
				if(applrejfields.includes("line2")){
				$("#uline2"). prop("readonly", false);
				}else{
				$("#uline2"). prop("readonly", true);
				}  
				if(applrejfields.includes("city")){
				$("#ucity"). prop("readonly", false);
				}else{
				$("#ucity"). prop("readonly", true);
				}

				if(applrejfields.includes("state")){
				$("#ustate"). prop("readonly", false);
				}else{
				$("#ustate"). prop("readonly", true);
				}
				if(applrejfields.includes("zipcode")){
				$("#uzipcode"). prop("readonly", false);
				}else{
				$("#uzipcode"). prop("readonly", true);
				}  
				if(applrejfields.includes("permanentAddr")){
				$("#upermanentAddr"). prop("readonly", false);
				}else{
				$("#upermanentAddr"). prop("readonly", true );
				}
				if(applrejfields.includes("petitionfiled_behalf")){
				$("#upetitionfiled_behalf"). prop("readonly", false);
				}else{
				$("#upetitionfiled_behalf"). prop("readonly", true);
				  }
				
				//if(benf_type=='Applicant'){
					if(applrejfields.includes("dateofrecentEntry")){
						  $("#udateofrecentEntry"). prop("readonly", false);
					  }else{
						  $("#udateofrecentEntry"). prop("readonly", true);
					  }
					  if(applrejfields.includes("stausofrecentEntry")){ 
						  $("#ustausofrecentEntry"). attr("readonly", false);
					  }else{
						  $("#ustausofrecentEntry"). attr("readonly", true); 
						  var value=$("#ustausofrecentEntry").val();
						  $("#ustausofrecentEntry").children('option').hide();
						  $("#ustausofrecentEntry").children("option[value^='" + value + "']").show();
					  }
				  if(applrejfields.includes("visastamping")){
					   $("#uvisastamping"). prop("readonly", false);
					   }else{
						$("#uvisastamping"). prop("readonly", true);
					   }
				// }
				
				  $("[id='applEntryid']").each(function(){
						var id=$(this).val();
						//alert(id);
						if(applrejfields.includes(id)){
							 $("#uarrivalDate"+id).attr("readonly", false);
							 $("#uarrivalVisa"+id).attr("readonly", false);
							 $("#udepartureDate"+id).attr("readonly", false);
							 $("#udepartureVisa"+id).attr("readonly", false);
						  }else{
							  var value=$("#uarrivalVisa"+id).val();
							  $("#uarrivalVisa"+id).children('option').hide();
							  $("#uarrivalVisa"+id).children("option[value^='" + value + "']").show();
							  var value1=$("#udepartureVisa"+id).val();
							  $("#udepartureVisa"+id).children('option').hide();
							  $("#udepartureVisa"+id).children("option[value^='" + value1 + "']").show();
						  }
				     });
				}
				//alert($('#u_ssnNo').val()+"****"+$('#u_passportNo').val());
				var applssn=$("#dc_ussnNo").val();
				var applpp=$("#dc_upassportNo").val();
				$("#upassportNo").val(atob(applpp));
				$("#ussnNo").val(atob(applssn));
				//var decodedString = atob(encodedString);
			}else{
			//	alert($("#tapplh1que_id").val());
				if($("#tapplh1que_id").val()!=""){
					$("#passportNo").val(atob($('#tu_passportNo').val()));
					$("#ssnNo").val(atob($('#tu_ssnNo').val()));
				//	$('#passportissueDate,#dateoffirstEntry,#btnid').attr('disabled', false);
				 }else{
					 $('#h1bqueDetailsForm').data('formValidation').resetForm();
					$('#h1bqueDetailsForm').bootstrapValidator('resetForm', true);
				    $('#passportissueDate,#passportexpDate,#dateoffirstEntry,#dateofrecentEntry,#btnid').attr('disabled', true);
				 }
			}
			
			$('#btnh1bspouse,#btnh1bchild,#btnh1bspouseAdmin').hide();
			$('#btnh1bAppl,#h1bApplId,#btnh1bApplAdmin').show();
			$('#h1bSpouseId,#childTbl,#h1bChildId').hide();
			//}
			//$('.addButton').trigger("click");
			//document.getElementById("spchh1bqueDetailsForm").reset();
			 //window.location.href="h1bquestionnaire";
			//$('#spchh1bqueDetailsForm').bootstrapValidator('resetForm', true);
		});
		$("#h1bspouse").click(function(){
			$('.spouseEntryExitsAdd').empty();
		/* 	if($("#roleid").val()==4){
				if($("#spouseh1que_id").val()!=""){
					$('#h1bSpouseId').show();
			}else{ $('#h1bSpouseId').hide(); }
			}else{ */
			if($('#spouseh1que_id').val()!=""){
				var spossn=$("#dc_uspousessnNo").val();
				var spopp=$("#dc_uspousepassportNo").val();
				$("#uspousessnNo").val(atob(spossn));
				$("#uspousepassportNo").val(atob(spopp)); 
				var spouserejfields= $("#spouserejfields").val();
				var spouserejform_status= $("#spouserejform_status").val();
				//alert(spouserejform_status+"Spouse Rej Fields"+spouserejfields);
				if(spouserejform_status=='Rejected'){
				$("#updatespouseh1bqueDetailsForm :input").attr("readonly", true);
				if(spouserejfields.includes("lastName")){
					  $("#uspousefamilyName").prop("readonly", false);
				 }else{
					 $("#uspousefamilyName").prop("readonly", true);
				 }
				 if(spouserejfields.includes("firstName")){
					//  alert("first name");
					  $("#uspousefirstName").prop("readonly", false);
				 }else{
					  $("#uspousefirstName").prop("readonly", true);
				 }
				 if(spouserejfields.includes("passportNo")){
					  //alert("passportNo");
					  $("#uspousepassportNo").prop("readonly", false);
				 }else{
					  $("#uspousepassportNo").prop("readonly", true);
				 }
				 
				 if(spouserejfields.includes("middleName")){
						  $("#uspousemiddleName").prop("readonly",false);
					  }else{
						  $("#uspousemiddleName").prop("readonly", true);  
					  }
				 if(spouserejfields.includes("countryofcitizenship")){
					  $("#uspousecountryofcitizenship").prop("readonly", false);  
				 }else{
					  $("#uspousecountryofcitizenship").prop("readonly", true);  
				 }
				 if(spouserejfields.includes("telephoneNo")){
					  $("#uspousetelephoneNo"). prop("readonly", false);
				 }else{
					  $("#uspousetelephoneNo"). prop("readonly", true);
				 }
				 if(spouserejfields.includes("ssnNo")){
					  $("#uspousessnNo"). prop("readonly", false);
				 }else{
					  $("#uspousessnNo"). prop("readonly", true);
				 }
				 if(spouserejfields.includes("i94No")){
					  $("#uspousei94No"). prop("readonly", false);
				 }else{
					  $("#uspousei94No"). prop("readonly", true);
				 }
				 
				 if(spouserejfields.includes("personalemailid")){
					  $("#uspousepersonalemailid"). prop("readonly", false);
				 }else{
					  $("#uspousepersonalemailid"). prop("readonly", true);
				 }
				 
				 if(spouserejfields.includes("currimmistatus")){
					 $("#uspouseimmigrantstatus"). attr("readonly", false);
				 }else{
					  $("#uspouseimmigrantstatus"). attr("readonly", true); 
					  var value=$("#uspouseimmigrantstatus").val();
					  $("#uspouseimmigrantstatus").children('option').hide();
					  $("#uspouseimmigrantstatus").children("option[value^='" + value + "']").show();
				 }
				
				 if(spouserejfields.includes("dateofrecentEntry")){
					  $("#uspousedateofrecentEntry"). prop("readonly", false);
				  }else{
					  $("#uspousedateofrecentEntry"). prop("readonly", true);
				  }
				  if(spouserejfields.includes("stausofrecentEntry")){ 
					  $("#uspousestausofrecentEntry"). attr("readonly", false);
				  }else{
					  $("#uspousestausofrecentEntry"). attr("readonly", true); 
					  var value=$("#uspousestausofrecentEntry").val();
					  $("#uspousestausofrecentEntry").children('option').hide();
					  $("#uspousestausofrecentEntry").children("option[value^='" + value + "']").show();
				  }
				 
				 if(spouserejfields.includes("dob")){
						$("#uspousedob"). prop("readonly", false);
				 }else{
						$("#uspousedob"). prop("readonly", true);
				 }
				if(spouserejfields.includes("countryofbirth")){
					 $("#uspousecountryofbirth"). prop("readonly", false);
				 }else{
					  $("#uspousecountryofbirth"). prop("readonly", true);
				 }  
				if(spouserejfields.includes("cityofbirth")){
					  $("#uspousecityofbirth"). prop("readonly", false);
				 }else{
					  $("#uspousecityofbirth"). prop("readonly", true);
				 }

				 
				if(spouserejfields.includes("passportissueDate")){
				 $("#uspousepassportissueDate"). prop("readonly", false);
				}else{
				 $("#uspousepassportissueDate"). prop("readonly", true); 
				}
				if(spouserejfields.includes("passportexpDate")){
				 $("#uspousepassportexpDate"). prop("readonly", false);
				}else{
				 $("#uspousepassportexpDate"). prop("readonly", true); 
				}
				if(spouserejfields.includes("line1")){
				$("#uspouseline1"). prop("readonly", false);
				}else{
				$("#uspouseline1"). prop("readonly", true);
				}
				if(spouserejfields.includes("line2")){
				$("#uspouseline2"). prop("readonly", false);
				}else{
				$("#uspouseline2"). prop("readonly", true);
				}  
				if(spouserejfields.includes("city")){
				$("#uspousecity"). prop("readonly", false);
				}else{
				$("#uspousecity"). prop("readonly", true);
				}

				if(spouserejfields.includes("state")){
				$("#uspousestate"). prop("readonly", false);
				}else{
				$("#uspousestate"). prop("readonly", true);
				}
				if(spouserejfields.includes("zipcode")){
				$("#uspousezipcode"). prop("readonly", false);
				}else{
				$("#uspousezipcode"). prop("readonly", true);
				}  
				if(spouserejfields.includes("permanentAddr")){
				$("#uspousepermanentAddr"). prop("readonly", false);
				}else{
				$("#uspousepermanentAddr"). prop("readonly", true );
				}
				
				$("[id='spouseEntryid']").each(function(){
					var id=$(this).val();
					//alert(id);
					if(spouserejfields.includes(id)){
						 $("#uspousearrivalDate"+id).attr("readonly", false);
						 $("#uspousearrivalVisa"+id).attr("readonly", false);
						 $("#uspousedepartureDate"+id).attr("readonly", false);
						 $("#uspousedepartureVisa"+id).attr("readonly", false);
					  }else{
						  var value=$("#uspousearrivalVisa"+id).val();
						  $("#uspousearrivalVisa"+id).children('option').hide();
						  $("#uspousearrivalVisa"+id).children("option[value^='" + value + "']").show();
						  var value1=$("#uspousedepartureVisa"+id).val();
						  $("#uspousedepartureVisa"+id).children('option').hide();
						  $("#uspousedepartureVisa"+id).children("option[value^='" + value1 + "']").show();
					  }
			     });
				}
			}else{
				if($('#tspouseh1que_id').val()!=""){
					$("#spousessnNo").val(atob($('#tsp_ssnNo').val()));
					$("#spousepassportNo").val(atob($('#tsp_passportNo').val()));
				}else{
					$('#spouseh1bqueDetailsForm').data('formValidation').resetForm();
					$('#spouseh1bqueDetailsForm').bootstrapValidator('resetForm', true);
					$('#spousepassportissueDate,#spousepassportexpDate,#spousedateofrecentEntry,#spousebtnid').attr('disabled', true);	
				}
			}
			
			$('#btnh1bAppl,#btnh1bchild,#btnh1bApplAdmin').hide();
			$('#btnh1bspouse,#h1bSpouseId,#btnh1bspouseAdmin').show();
			$('#h1bApplId,#childTbl,#h1bChildId').hide();
			//}
		//	$('#benftype').val("Spouse");
		//	document.getElementById("h1bqueDetailsForm").reset();
			//$('#h1bqueDetailsForm').bootstrapValidator('resetForm', true);
			// window.location.href="h1bquestionnaire";
		});	
		$("#h1bchild").click(function(){
			$('.childEntryExitsAdd').empty();
			
			if($('#applh1que_id').val()!=""){
				
			}else{
				if($('#tapplh1que_id').val()!=""){
					
				}else{
					$('#h1bqueDetailsForm').data('formValidation').resetForm();
					$('#h1bqueDetailsForm').bootstrapValidator('resetForm', true);
				}
				if($('#tspouseh1que_id').val()!=""){
					
				}else{
					$('#spouseh1bqueDetailsForm').data('formValidation').resetForm();
					$('#spouseh1bqueDetailsForm').bootstrapValidator('resetForm', true);
					//$('#spousepassportissueDate,#spousepassportexpDate,#spousedateofrecentEntry,#spousebtnid').attr('disabled', true);	
				}
				$('#childh1bqueDetailsForm').data('formValidation').resetForm();
				$('#childh1bqueDetailsForm').bootstrapValidator('resetForm', true);
				$('#childpassportissueDate,#childpassportexpDate,#childdateofrecentEntry,#childbtnid').attr('disabled', true);
		      }
			
			$('#btnh1bAppl,#btnh1bspouse').hide();
		//	alert($('#childsSize').val());
			if($('#childsSize').val()>0){
				$('#childTbl').show();
			}else{
				$('#childTbl').hide();
			}
			$('#btnh1bchild').show();
			$('#h1bApplId,#h1bSpouseId,#btnh1bspouseAdmin,#btnh1bApplAdmin').hide();
		//	$('#benftype').val("Child");
			// document.getElementById("h1bqueDetailsForm").reset();
			// window.location.href="h1bquestionnaire";
			//$('#h1bqueDetailsForm').bootstrapValidator('resetForm', true);
		});	
		
		$("#h1bapplsaveid").click(function(event) {
			getsesVal().done(function(data){
				  if(data!=""){
			event.preventDefault();
		/*  $('#h1bqueDetailsForm').formValidation('validate'); */
			if($('#familyName').val()==""){
				$("#familyName").focus();
			}else if($('#firstName').val()==""){
				$("#firstName").focus();
			}
		/*  if($('#').val()=="" && $('#').val()=="") {
			    alert("Please enter Family Name && First Name");
			} */ else { 
				$("#h1bapplsaveid").attr("disabled", true);
				var form = $('#h1bqueDetailsForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "saveh1bapplicantTemp", //this is the submit URL
					type : "POST",
					enctype : 'multipart/form-data',
					data : data,
					processData : false,
					contentType : false,
					cache : false,
					success : function(data) {
						 if(data!="" || data!=null){
							 alert("Details saved successfully");
							 window.location.href="h1bquestionnaire";
			   	   	         }
			   	   	      else{
			   	   	          window.location.href="loginpage";
			   	   	   	      }
					}
				});
			}
				  }else{window.location.href="loginpage";}});
		});
		$("#h1bapplsubmitid").click(function(event) {
			getsesVal().done(function(data){
				  if(data!=""){
			event.preventDefault();
			$('#h1bqueDetailsForm').formValidation('validate');
		 if (!$('#h1bqueDetailsForm').data('formValidation').isValid()) {
			   // alert("Not Valid");
			   //$("#spanError").text("Please select atleast one Amendment");
			} else { 
				//alert("Valid");
				//$("#spanError").text('');
				$("#h1bapplsubmitid").attr("disabled", true);
				var form = $('#h1bqueDetailsForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "saveh1bapplicant", //this is the submit URL
					type : "POST",
					enctype : 'multipart/form-data',
					data : data,
					processData : false,
					contentType : false,
					cache : false,
					success : function(data) {
						 if(data!="" || data!=null){
							 alert("Details added successfully");
							 window.location.href="h1bquestionnaire";
			   	   	         }
			   	   	      else{
			   	   	          window.location.href="loginpage";
			   	   	   	      }
					}
				});
			}
				  }else{window.location.href="loginpage";}});
		});
		$("#spouseresetid").click(function(){
			$("#h1bspouse").trigger("click");
		});
		$("#h1bapplresetid").click(function(){
			$("#h1bAppl").trigger("click");
		});
		$("#childresetid").click(function(){
			$("#h1bchild").trigger("click");
		});
		
		$("#spousesaveid").click(function(event) {
			getsesVal().done(function(data){
				  if(data!=""){
			event.preventDefault();
			if($('#spousefamilyName').val()==""){
				$("#spousefamilyName").focus();
			}else if($('#spousefirstName').val()==""){
				$("#spousefirstName").focus();
			}
			/*  if($('#spousefamilyName').val()=="" && $('#spousefirstName').val()=="") {
				    alert("Please enter Family Name && First Name");
			   // alert("Not Valid");
			   //$("#spanError").text("Please select atleast one Amendment");
			} */ else { 
				//alert("Valid");
				//$("#spanError").text('');
				$("#spousesaveid").attr("disabled", true);
				var form = $('#spouseh1bqueDetailsForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "saveh1bspouseTemp", //this is the submit URL
					type : "POST",
					enctype : 'multipart/form-data',
					data : data,
					processData : false,
					contentType : false,
					cache : false,
					success : function(data) {
						 if(data!="" || data!=null){
							 alert("Details saved successfully");
							 window.location.href="h1bquestionnaire";
			   	   	         }
			   	   	      else{
			   	   	          window.location.href="loginpage";
			   	   	   	      }
					}
				});
			}
				  }else{window.location.href="loginpage";}});
		});
		$("#spousesubmitid").click(function(event) {
			getsesVal().done(function(data){
				  if(data!=""){
			event.preventDefault();
			$('#spouseh1bqueDetailsForm').formValidation('validate');
		 if (!$('#spouseh1bqueDetailsForm').data('formValidation').isValid()) {
			   // alert("Not Valid");
			   //$("#spanError").text("Please select atleast one Amendment");
			} else { 
				//alert("Valid");
				//$("#spanError").text('');
				$("#spousesubmitid").attr("disabled", true);
				var form = $('#spouseh1bqueDetailsForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "saveh1bspouse", //this is the submit URL
					type : "POST",
					enctype : 'multipart/form-data',
					data : data,
					processData : false,
					contentType : false,
					cache : false,
					success : function(data) {
						 if(data!="" || data!=null){
							 alert("Details added successfully");
							 window.location.href="h1bquestionnaire";
			   	   	         }
			   	   	      else{
			   	   	          window.location.href="loginpage";
			   	   	   	      }
					}
				});
			}
				  }else{window.location.href="loginpage";}});
		});
		$("#childsubmitid").click(function(event) {
			getsesVal().done(function(data){
				  if(data!=""){
			event.preventDefault();
			$('#childh1bqueDetailsForm').formValidation('validate');
		 if (!$('#childh1bqueDetailsForm').data('formValidation').isValid()) {
			   // alert("Not Valid");
			   //$("#spanError").text("Please select atleast one Amendment");
			} else { 
				//alert("Valid");
				//$("#spanError").text('');
				$("#childsubmitid").attr("disabled", true);
				var form = $('#childh1bqueDetailsForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "saveh1bchild", //this is the submit URL
					type : "POST",
					enctype : 'multipart/form-data',
					data : data,
					processData : false,
					contentType : false,
					cache : false,
					success : function(data) {
						 if(data!="" || data!=null){
							 alert("Details added successfully");
							 window.location.href="h1bquestionnaire";
			   	   	         }
			   	   	      else{
			   	   	          window.location.href="loginpage";
			   	   	   	      }
					}
				});
			}
				  }else{window.location.href="loginpage";}});
		});
		
		$("#h1bapplbtnUpdate").click(function(event) {
			getsesVal().done(function(data){
				  if(data!=""){
			event.preventDefault();
			$('#updateh1bqueDetailsForm').formValidation('validate');
		 if (!$('#updateh1bqueDetailsForm').data('formValidation').isValid()) {
			 //  alert("Not Valid");
			   //$("#spanError").text("Please select atleast one Amendment");
			} else { 
				//alert("Valid");
				//$("#spanError").text('');
				$("#h1bapplbtnUpdate").attr("disabled", true);
				var form = $('#updateh1bqueDetailsForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "updateh1bapplicant", //this is the submit URL
					type : "POST",
					enctype : 'multipart/form-data',
					data : data,
					processData : false,
					contentType : false,
					cache : false,
					success : function(data) {
						 if(data!="" || data!=null){
							 alert("Details added successfully");
							 window.location.href="h1bquestionnaire";
			   	   	         }
			   	   	      else{
			   	   	          window.location.href="loginpage";
			   	   	   	      }
					}
				});
			}
				  }else{window.location.href="loginpage";}});
		});
		
		$("#uspousesbtnUpdate").click(function(event) {
			getsesVal().done(function(data){
				  if(data!=""){
			event.preventDefault();
			$('#updatespouseh1bqueDetailsForm').formValidation('validate');
		 if (!$('#updatespouseh1bqueDetailsForm').data('formValidation').isValid()) {
			 //  alert("Not Valid");
			   //$("#spanError").text("Please select atleast one Amendment");
			} else { 
				//alert("Valid");
				//$("#spanError").text('');
				$("#h1bapplbtnUpdate").attr("disabled", true);
				var form = $('#updatespouseh1bqueDetailsForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "updateh1bspouse", //this is the submit URL
					type : "POST",
					enctype : 'multipart/form-data',
					data : data,
					processData : false,
					contentType : false,
					cache : false,
					success : function(data) {
						 if(data!="" || data!=null){
							 alert("Details added successfully");
							 window.location.href="h1bquestionnaire";
			   	   	         }
			   	   	      else{
			   	   	          window.location.href="loginpage";
			   	   	   	      }
					}
				});
			}
				  }else{window.location.href="loginpage";}});
		});


$('input[name="ssnNo"]').mask('999-99-9999');
$('input[name="telephoneNo"]').mask('999-999-9999');	
$('input[name="ussnNo"]').mask('999-99-9999');
$('input[name="utelephoneNo"]').mask('999-999-9999');	
$('input[name="spousessnNo"]').mask('999-99-9999');
$('input[name="spousetelephoneNo"]').mask('999-999-9999');
$('input[name="uspousessnNo"]').mask('999-99-9999');
$('input[name="uspousetelephoneNo"]').mask('999-999-9999');
$('input[name="childssnNo"]').mask('999-99-9999');
$('input[name="uchildssnNo"]').mask('999-99-9999');
$('input[name="childtelephoneNo"]').mask('999-999-9999');


$("#ssnNo,#telephoneNo").blur(function () {
    $('#h1bqueDetailsForm').bootstrapValidator('revalidateField', 'ssnNo');
    $('#h1bqueDetailsForm').bootstrapValidator('revalidateField', 'telephoneNo');
});
$("#ussnNo,#utelephoneNo").blur(function () {
    $('#updateh1bqueDetailsForm').bootstrapValidator('revalidateField', 'ussnNo');
    $('#updateh1bqueDetailsForm').bootstrapValidator('revalidateField', 'utelephoneNo');
});

$("#spousessnNo,#spousetelephoneNo").blur(function () {
    $('#spouseh1bqueDetailsForm').bootstrapValidator('revalidateField', 'spousessnNo');
    $('#spouseh1bqueDetailsForm').bootstrapValidator('revalidateField', 'spousetelephoneNo');
});
$("#uspousessnNo,#uspousetelephoneNo").blur(function () {
    $('#uspouseh1bqueDetailsForm').bootstrapValidator('revalidateField', 'uspousessnNo');
    $('#uspouseh1bqueDetailsForm').bootstrapValidator('revalidateField', 'uspousetelephoneNo');
});

$("#childssnNo,#childtelephoneNo").blur(function () {
    $('#childh1bqueDetailsForm').bootstrapValidator('revalidateField', 'childssnNo');
    $('#childh1bqueDetailsForm').bootstrapValidator('revalidateField', 'childtelephoneNo');
});
$('input[name="tarrivalDate"]').datepicker({
}).on('changeDate', function(selected) {
	 $('#h1bqueDetailsForm').formValidation('revalidateField', 'tarrivalDate');
});
$('input[name="tdepartureDate"]').datepicker({
}).on('changeDate', function(selected) {
	 $('#h1bqueDetailsForm').formValidation('revalidateField', 'tdepartureDate');
});
$('input[name="tspousearrivalDate"]').datepicker({
}).on('changeDate', function(selected) {
	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'tspousearrivalDate');
});
$('input[name="tspousedepartureDate"]').datepicker({
}).on('changeDate', function(selected) {
	 $('#spouseh1bqueDetailsForm').formValidation('revalidateField', 'tspousedepartureDate');
});
$('input[name="uarrivalDate"]').datepicker({
}).on('changeDate', function(selected) {
	 $('#updateh1bqueDetailsForm').formValidation('revalidateField', 'uarrivalDate[]');
});
$('input[name="udepartureDate"]').datepicker({
}).on('changeDate', function(selected) {
	 $('#updateh1bqueDetailsForm').formValidation('revalidateField', 'udepartureDate[]');
});
$('input[name="uspousearrivalDate[]"]').datepicker({
}).on('changeDate', function(selected) {
	 $('#updatespouseh1bqueDetailsForm').formValidation('revalidateField', 'uspousearrivalDate[]');
});
$('input[name="uspousedepartureDate[]"]').datepicker({
}).on('changeDate', function(selected) {
	 $('#updatespouseh1bqueDetailsForm').formValidation('revalidateField', 'uspchdepartureDate[]');
});

var tablechild = $('#ChildEntryExitListTable').DataTable({
	 "order": [[0, "desc"]],
	  lengthMenu: [[5, 10, 15, -1], [5, 10, 15, "All"]],
	  bLengthChange: true,
	  paging: true
	});
	
function edith1bChild(h1bqueid,role){
	getsesVal().done(function(data){
	if(data!=""){
	$("[class='uchildaddEntrty']").each(function(){
	      var id=$(this).val();
		 $('.uchildaddEntrty').remove(); 
	 });
	 $.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/json", // NOT dataType!
		url : "getchilddetailsbyid",
		data : {
			h1bqueid : h1bqueid
		      },
		success : function(response) {
			var childObj=response.childObj;
			var childEntryList=response.childEntryList;
			var rejformChildObj=response.rejformChildObj;
			var rejformschildhistoryList=response.rejformschildhistoryList;
			var h1queid=childObj.h1questionnrie_id;
		    $('#childh1que_id').val(childObj.h1questionnrie_id);
			$('#uchildfirstName').val(childObj.first_name);
			$('#uchildmiddleName').val(childObj.middle_name);
			$('#uchildfamilyName').val(childObj.family_name);
			$('#uchilddob').val(childObj.dob);
			$('#uchildcountryofbirth').val(childObj.country_birth);
			$('#uchildcityofbirth').val(childObj.city_birth);
			$('#uchildcountryofcitizenship').val(childObj.country_citizenship);
			$('#uchildtelephoneNo').val(childObj.us_phonenumber);
			$('#uchildpersonalemailid').val(childObj.personal_email);
			//var decodedString = atob(encodedString);
			$('#uchildssnNo').val(atob(childObj.ssn));
		    $('#uchildpassportNo').val(atob(childObj.passport_number));
			$('#uchildpassportissueDate').val(childObj.passport_issuedate);
			$('#uchildpassportexpDate').val(childObj.passport_expirydate);
			$('#uchildi94No').val(childObj.i94_number);
			
			$('#uchildimmigrantstatus').val(childObj.current_non_immiStatus);
			$('#uchilddateofrecentEntry').val(childObj.recententry_dateinUS);
			$('#uchildstausofrecentEntry').val(childObj.recententry_statusinUS);
			$('#uchildline1').val(childObj.line1)
			$('#uchildline2').val(childObj.line2)
			$('#uchildcity').val(childObj.city)
			$('#uchildstate').val(childObj.state)
			$('#uchildzipcode').val(childObj.zipcode)
			$('#uchildpermanentAddr').val(childObj.outside_us_address)
			 if (tablechild) tablechild.clear();
       	     var dtatus; var daction;
	         $('#ChildEntryExitListTable').dataTable().fnClearTable();
	            	  for(var i=0;i<childEntryList.length;i++){
	      				//$('#rejentryDiv').empty(); 
	      			  //  $('#rejentryDiv').append("<div class=' form-group row'><label class='col-sm-2 control-label'><span style='color:green;'>"+childEntryList[i].dates_id+"</span></label><div class='col-sm-2'><input type='text' class='form-control' value='"+childEntryList[i].arrival_date+"' autocomplete='off' name='uarrivalDate' id='uarrivalDate"+childEntryList[i].dates_id+"' placeholder='Arrival Date' onkeydown='return false'></div><div class="col-sm-2'><select id='uarrivalVisa"+childEntryList[i].dates_id+"' name='uarrivalVisa' class='form-control' value='+childEntryList[i].arrival_date+'><option value=''>Arrival Visa</option></select></div><div class='col-sm-2'><input type='text' class='form-control' value='+childEntryList[i].departure_date+' autocomplete='off' name='uarrivalDate' id='uarrivalDate${applEntryList.dates_id}' placeholder='Arrival Date' onkeydown='return false'></div><div class="col-sm-2'><select id='uarrivalVisa${applEntryList.dates_id}' name='uarrivalVisa' class='form-control'><option value=''>Arrival Visa</option></select></div></div>");
	            		    if(role==1){
	            		       if(rejformChildObj!=null){
	            		    	   var childrejfields=rejformChildObj.rejectedfields;
	            			        if(rejformChildObj.form_status=='Rejected' && rejformChildObj.rejectedfields!=null){
	            			        	if(childrejfields.includes(childEntryList[i].dates_id)){
	            			        			daction='<button class="btn btn-success btn-sm"  onclick="editEntryExitChild(\''+childEntryList[i].dates_id+'\',\''+childEntryList[i].arrival_date+'\',\''+childEntryList[i].arrival_visa+'\',\''+childEntryList[i].departure_date+'\',\''+childEntryList[i].departure_visa+'\',\''+h1queid+'\');" data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"><i class="fa fa-edit" aria-hidden="true"></i></button>'; 
	            			        	     }else{
	            			        	    	 daction='<button class="btn btn-success btn-sm" disabled onclick="editEntryExitChild(\''+childEntryList[i].dates_id+'\',\''+childEntryList[i].arrival_date+'\',\''+childEntryList[i].arrival_visa+'\',\''+childEntryList[i].departure_date+'\',\''+childEntryList[i].departure_visa+'\',\''+h1queid+'\');" data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"><i class="fa fa-edit" aria-hidden="true"></i></button>';  
	            			        	     }
	            			        	}else{
           			        	    	 daction='<button class="btn btn-success btn-sm" disabled onclick="editEntryExitChild(\''+childEntryList[i].dates_id+'\',\''+childEntryList[i].arrival_date+'\',\''+childEntryList[i].arrival_visa+'\',\''+childEntryList[i].departure_date+'\',\''+childEntryList[i].departure_visa+'\',\''+h1queid+'\');" data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"><i class="fa fa-edit" aria-hidden="true"></i></button>';  
           			        	        }
	            			        }else{
	            		    		daction='<button class="btn btn-success btn-sm"  onclick="editEntryExitChild(\''+childEntryList[i].dates_id+'\',\''+childEntryList[i].arrival_date+'\',\''+childEntryList[i].arrival_visa+'\',\''+childEntryList[i].departure_date+'\',\''+childEntryList[i].departure_visa+'\',\''+h1queid+'\');" data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"><i class="fa fa-edit" aria-hidden="true"></i></button>';
	            		    	}
	            		    }else{
	            			  daction='<button class="btn btn-success btn-sm" disabled onclick="editEntryExitChild(\''+childEntryList[i].dates_id+'\',\''+childEntryList[i].arrival_date+'\',\''+childEntryList[i].arrival_visa+'\',\''+childEntryList[i].departure_date+'\',\''+childEntryList[i].departure_visa+'\',\''+h1queid+'\');" data-toggle="modal"  style="padding: 0px 0px; font-size: 12px;"><i class="fa fa-edit" aria-hidden="true"></i></button>';  
	            		      }
	            		     tablechild.row.add([
	            			''+childEntryList[i].dates_id+'',
	                      	''+childEntryList[i].arrival_date+'',
	                      	''+childEntryList[i].arrival_visa+'',
	                    	''+childEntryList[i].departure_date+'',
	                    	''+childEntryList[i].departure_visa+'',
	                      	''+daction+'',
	                     ]).draw();   
       	        }
	          if(childEntryList.length>0){ 	  
	               $("#ChildEntryExitListTableId").show();
	           }else{
	        	   $("#ChildEntryExitListTableId").hide();
	           }
	          if(role==1){
	        	  $("#uaddchild,#childbtnUpdate").show();
	        	  $("#btnh1bchildAdmin").hide();
	        	  $("#childbtnUpdate").attr("disabled", false);
	          }else{
	        	  $("#uaddchild,#childbtnUpdate").hide();
	        	  $("#btnh1bchildAdmin").show();
	        	  $("#updatechildh1bqueDetailsForm :input").attr("disabled", true);
	          }
	          if(rejformChildObj!=null){
		          var childrejfields=rejformChildObj.rejectedfields;
		          if(rejformChildObj.form_status=='Rejected'){
		        	  $("#updatechildh1bqueDetailsForm :input").attr("readonly", true);
		        	  $("#chrejcommentDiv").show();
		        	  $("#chrejcomments").text(rejformChildObj.rejectioncoments);
		        	  if(childrejfields.includes("lastName")){
		        	  	  $("#uchildfamilyName").prop("readonly", false);
		        	   }else{
		        	  	 $("#uchildfamilyName").prop("readonly", true);
		        	   }
		        	   if(childrejfields.includes("firstName")){
		        	  	//  alert("first name");
		        	  	  $("#uchildfirstName").prop("readonly", false);
		        	   }else{
		        	  	  $("#uchildfirstName").prop("readonly", true);
		        	   }
		        	   if(childrejfields.includes("passportNo")){
		        	  	  //alert("passportNo");
		        	  	  $("#uchildpassportNo").prop("readonly", false);
		        	   }else{
		        	  	  $("#uchildpassportNo").prop("readonly", true);
		        	   }
		        	   
		        	   if(childrejfields.includes("middleName")){
		        	  		  $("#uchildmiddleName").prop("readonly",false);
		        	  	  }else{
		        	  		  $("#uchildmiddleName").prop("readonly", true);  
		        	  	  }
		        	   if(childrejfields.includes("countryofcitizenship")){
		        	  	  $("#uchildcountryofcitizenship").prop("readonly", false);  
		        	   }else{
		        	  	  $("#uchildcountryofcitizenship").prop("readonly", true);  
		        	   }
		        	   if(childrejfields.includes("telephoneNo")){
		        	  	  $("#uchildtelephoneNo"). prop("readonly", false);
		        	   }else{
		        	  	  $("#uchildtelephoneNo"). prop("readonly", true);
		        	   }
		        	   if(childrejfields.includes("ssnNo")){
		        	  	  $("#uchildssnNo"). prop("readonly", false);
		        	   }else{
		        	  	  $("#uchildssnNo"). prop("readonly", true);
		        	   }
		        	   if(childrejfields.includes("i94No")){
		        	  	  $("#uchildi94No"). prop("readonly", false);
		        	   }else{
		        	  	  $("#uchildi94No"). prop("readonly", true);
		        	   }
		        	   
		        	   if(childrejfields.includes("personalemailid")){
		        	  	  $("#uchildpersonalemailid"). prop("readonly", false);
		        	   }else{
		        	  	  $("#uchildpersonalemailid"). prop("readonly", true);
		        	   }
		        	   
		        	   if(childrejfields.includes("currimmistatus")){
							 $("#uchildimmigrantstatus"). attr("readonly", false);
						 }else{
							  $("#uchildimmigrantstatus"). attr("readonly", true); 
							  var value=$("#uchildimmigrantstatus").val();
							  $("#uchildimmigrantstatus").children('option').hide();
							  $("#uchildimmigrantstatus").children("option[value^='" + value + "']").show();
						 }
						
						 if(childrejfields.includes("dateofrecentEntry")){
							  $("#uchilddateofrecentEntry"). prop("readonly", false);
						  }else{
							  $("#uchilddateofrecentEntry"). prop("readonly", true);
						  }
						  if(childrejfields.includes("stausofrecentEntry")){ 
							  $("#uchildstausofrecentEntry"). attr("readonly", false);
						  }else{
							  $("#uchildstausofrecentEntry"). attr("readonly", true); 
							  var value=$("#uchildstausofrecentEntry").val();
							  $("#uchildstausofrecentEntry").children('option').hide();
							  $("#uchildstausofrecentEntry").children("option[value^='" + value + "']").show();
						  }
		        	   
		        	   if(childrejfields.includes("dob")){
		        	  		$("#uchilddob"). prop("readonly", false);
		        	   }else{
		        	  		$("#uchilddob"). prop("readonly", true);
		        	   }
		        	  if(childrejfields.includes("countryofbirth")){
		        	  	 $("#uchildcountryofbirth"). prop("readonly", false);
		        	   }else{
		        	  	  $("#uchildcountryofbirth"). prop("readonly", true);
		        	   }  
		        	  if(childrejfields.includes("cityofbirth")){
		        	  	  $("#uchildcityofbirth"). prop("readonly", false);
		        	   }else{
		        	  	  $("#uchildcityofbirth"). prop("readonly", true);
		        	   }
		        	
		        	  if(childrejfields.includes("passportissueDate")){
		        	   $("#uchildpassportissueDate"). prop("readonly", false);
		        	  }else{
		        	   $("#uchildpassportissueDate"). prop("readonly", true); 
		        	  }
		        	  if(childrejfields.includes("passportexpDate")){
		        	   $("#uchildpassportexpDate"). prop("readonly", false);
		        	  }else{
		        	   $("#uchildpassportexpDate"). prop("readonly", true); 
		        	  }
		        	  if(childrejfields.includes("line1")){
		        	  $("#uchildline1"). prop("readonly", false);
		        	  }else{
		        	  $("#uchildline1"). prop("readonly", true);
		        	  }
		        	  if(childrejfields.includes("line2")){
		        	  $("#uchildline2"). prop("readonly", false);
		        	  }else{
		        	  $("#uchildline2"). prop("readonly", true);
		        	  }  
		        	  if(childrejfields.includes("city")){
		        	  $("#uchildcity"). prop("readonly", false);
		        	  }else{
		        	  $("#uchildcity"). prop("readonly", true);
		        	  }

		        	  if(childrejfields.includes("state")){
		        	  $("#uchildstate"). prop("readonly", false);
		        	  }else{
		        	  $("#uchildstate"). prop("readonly", true);
		        	  }
		        	  if(childrejfields.includes("zipcode")){
		        	  $("#uchildzipcode"). prop("readonly", false);
		        	  }else{
		        	  $("#uchildzipcode"). prop("readonly", true);
		        	  }  
		        	  if(childrejfields.includes("permanentAddr")){
		        	  $("#uchildpermanentAddr"). prop("readonly", false);
		        	  }else{
		        	  $("#uchildpermanentAddr"). prop("readonly", true );
		        	  }
		        	  }else{
		        		  $("#chrejcommentDiv").hide();
		        	  }
		           }else{
		        	   $("#updatechildh1bqueDetailsForm :input").attr("readonly", false);
		        	   $("#chrejcommentDiv").hide();
		           }
	          if(rejformschildhistoryList!=null){
	          if(rejformschildhistoryList.length>0){
				   $('#chistoryId').show();
				   var benf_type="Child";
				   var form_type="H1B Questionnaries";
				   $('#chhistoryId').attr('onclick','viewCommentHistory1(\''+childObj.h1questionnrie_id+'\',\''+benf_type+'\',\''+form_type+'\')');  
			   }else{
				   $('#chhistoryId').hide();
			     } 
	          }else{
	        	  $('#chhistoryId').hide();
	          }
	        $('#h1bchilddetailsmodal').modal('show');
		}
	});
		  }else{window.location.href="loginpage";}});
}

$("#childbtnUpdate").click(function(event) {
	getsesVal().done(function(data){
	if(data!=""){
	event.preventDefault();
	$('#updatechildh1bqueDetailsForm').formValidation('validate');
 if (!$('#updatechildh1bqueDetailsForm').data('formValidation').isValid()) {
	 //  alert("Not Valid");
	   //$("#spanError").text("Please select atleast one Amendment");
	} else { 
		//alert("Valid");
		//$("#spanError").text('');
		// var h1bqueid=$('#childh1que_id').val();
		$("#childbtnUpdate").attr("disabled", true);
		var form = $('#updatechildh1bqueDetailsForm')[0];
		var data = new FormData(form);
		$.ajax({
			url : "updateh1bchild", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(data) {
				 if(data!="" || data!=null){
					 alert("Details added successfully");
					// edith1bChild(h1bqueid);
					$('#h1bchilddetailsmodal').modal('hide');
					  window.location.href="h1bquestionnaire";
					  // $("#h1bchild").trigger("click");
	   	   	         }
	   	   	      else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			}
		});
	}
		  }else{window.location.href="loginpage";}});
});

function editEntryExitChild(date_id,arr_date,arr_visa,dept_date,dept_visa,h1que_id){
	getsesVal().done(function(data){
		  if(data!=""){
	$('#uchildh1que_id').val(h1que_id);
	$('#childEntryid').val(date_id);
	$('#ucharrivalDate').val(arr_date);
	$('#ucharrivalVisa').val(arr_visa);
	$('#uchdepartureDate').val(dept_date);
	$('#uchdepartureVisa').val(dept_visa);
	$("#childEntryUpdate").attr("disabled", false);
	$('#h1bchildEntryExitmodal').modal('show');
		  }else{window.location.href="loginpage";}});
	/* h1bchildEntryExitmodal 
	updatechildEntryExitsForm
	ucharrivalDate ucharrivalVisa uchdepartureDate uchdepartureVisa */
}

$("#childEntryUpdate").click(function(event) {
	getsesVal().done(function(data){
		  if(data!=""){
	event.preventDefault();
	$('#updatechildEntryExitsForm').formValidation('validate');
 if (!$('#updatechildEntryExitsForm').data('formValidation').isValid()) {
	 //  alert("Not Valid");
	   //$("#spanError").text("Please select atleast one Amendment");
	} else { 
		//alert("Valid");
		//$("#spanError").text('');
		// var h1bqueid=$('#uchildh1que_id').val();
		$("#childEntryUpdate").attr("disabled", true);
		var form = $('#updatechildEntryExitsForm')[0];
		var data = new FormData(form);
		$.ajax({
			url : "updatechildEntryExits", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(data) {
				 if(data!="" || data!=null){
					 alert("Details updated successfully");
					// edith1bChild(h1bqueid);
					$('#h1bchildEntryExitmodal,#h1bchilddetailsmodal').modal('hide');
					  // edith1bChild(h1bqueid);
					 //window.location.href="h1bquestionnaire";
					   $("#h1bchild").trigger("click");
	   	   	         }
	   	   	      else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			}
		});
	}
		  }else{window.location.href="loginpage";}});
});

$("#cvlbtnUpdateadmin").click(function(event) {
	getsesVal().done(function(data){
		  if(data!=""){
	event.preventDefault();
 	var candidateId=$("#candidateId").val();
 	/*var statusId=$("#approveStatus").val();
	if(statusId!="" && commentId!=""){ */
		$('#updatecvlimmiformstausId').formValidation('validate');
	 if (!$('#updatecvlimmiformstausId').data('formValidation').isValid()) {
		   // alert("Not Valid");
		   //$("#spanError").text("Please select atleast one Amendment");
		} else {
		$("#cvlbtnUpdateadmin").attr("disabled", true);
		var form = $('#updatecvlimmiformstausId')[0];
		var data = new FormData(form);
		$.ajax({
			url : "updatecvlimmiformstaus", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(data) {
				 if(data!="" || data!=null){
					 alert("Details updated successfully");
					 //window.location.href="clientvendorquestionnaire";
					   var initiateid="";
					    window.location.href="h1bqueadmin?candidateId="+candidateId+"&&initiateid="+initiateid+"";
	   	   	          }
	   	   	       else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			 }
		 });
	}
  }else{window.location.href="loginpage";}});
});

$('#updatecvlimmiformstausId').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {
    	approveStatus:{
	          validators: {
	           	notEmpty: {
	                   message: 'Please select status '
	               }
	           }
	       },
	  candicomments : {
			validators : {
				notEmpty : {
					message : 'Comments required. '
				},
				stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Comments must be more than 2 and less than 100 characters long. '
                }/* ,
                regexp: {
                	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &.\/-]*)?$/,
                     message: 'Document Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                } */
			}
		  }
      }
});
var vstatus=$("#verifierStatus").val();
var $dropdown4=$("select[name='approveStatus']");
$dropdown4.find('option[value="'+vstatus+'"]').text(vstatus).attr('selected', true);

var tablech = $('#commentshistoryTable').DataTable({
	"order" : [ [ 0, "desc" ] ],
	lengthMenu : [ [ 5, 10, 15, -1 ], [ 5, 10, 15, "All" ] ],
	bLengthChange : true,
	paging : true
});
function viewCommentHistory(candId,formtype) {
	getsesVal().done(function(data){
	if(data!=""){
	$.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/json", // NOT dataType!
		url : "viewCommentHistorybyCandId",
		data : {
			"candId" : candId,
			"form_type" : formtype
		},
		success : function(response) {
			if (tablech)tablech.clear();
			$('#commentshistoryTable').dataTable().fnClearTable();
			if (response!="") {
				
				for (var i = 0; i < response.length; i++) {
					const decisionDate = '/Date('+response[i].submitted_date+')/';
					const d = new Date(decisionDate.match(/\d+/)[0] * 1);
					const formattedDate = d.getFullYear()+'-'+("0"+(d.getMonth()+1)).slice(-2)+'-'+("0"+d.getDate()).slice(-2)
					
					tablech.row.add(
						          [ '' + response[i].status + '',
									'' + response[i].comments + '',
									'' + response[i].submittedby_name + '',
									'' +response[i].submitted_date + ''
									]).draw();
				}
			}
			$('#commentshistory').modal('show');
		}
	});
		  }else{window.location.href="loginpage";}});
}

$('#h1bchildEntryExitmodal').on('shown.bs.modal', function()
{
/* $("[id='childEntryid']").each(function(){
var id=$(this).val(); */
$("#ucharrivalDate").datepicker({
}).on('changeDate', function(selected) {
	 $('#updatechildEntryExitsForm').formValidation('revalidateField', 'ucharrivalDate');
});
$("#uchdepartureDate").datepicker({
}).on('changeDate', function(selected) {
	 $('#updatechildEntryExitsForm').formValidation('revalidateField', 'uchdepartureDate');
});
//});
});
/* 
$('#h1bchildEntryExitmodal').on('hidden.bs.modal', function () {
	  // Load up a new modal...updatechildEntryExitsForm
	  $('#h1bchilddetailsmodal').modal('show')
}) */
$('#h1bchildEntryExitmodal').on('hidden.bs.modal', function(){
	 $('#updatechildEntryExitsForm,#updatechildh1bqueDetailsForm').bootstrapValidator('resetForm', true);
	 $('#h1bchildEntryExitmodal,#h1bchilddetailsmodal').modal('hide');
	 $("#h1bchild").trigger("click");
});
$('#h1bchilddetailsmodal').on('hidden.bs.modal', function(){
	$('#updatechildh1bqueDetailsForm').bootstrapValidator('resetForm', true);
});
$('#h1bchilddetailsmodal').on('shown.bs.modal', function(){
	 if($("#childh1que_id").val()!=""){
			var uchdob=new Date($("#uchilddob").val());
			if($("#uchilddob").val()!="" || $("#uchildpassportissueDate").val()!="" || $("#uchildpassportexpDate").val()!="" || $("#uchilddateofrecentEntry").val()!=""){
			$("#uchilddob").datepicker({
	}).on('changeDate', function(selected) {
		 $('#uchildh1bqueDetailsForm').formValidation('revalidateField', 'uspousedob');
	});
	$("#uchildpassportissueDate").datepicker({
	}).on('changeDate', function(selected) {
		 $('#uchildh1bqueDetailsForm').formValidation('revalidateField', 'uchildpassportissueDate');
	});
	$("#uchildpassportexpDate").datepicker({
	}).on('changeDate', function(selected) {
		 $('#uchildh1bqueDetailsForm').formValidation('revalidateField', 'uchildpassportexpDate');
	});
	$("#uchilddateofrecentEntry").datepicker({
	}).on('changeDate', function(selected) {
		 $('#uchildh1bqueDetailsForm').formValidation('revalidateField', 'uchilddateofrecentEntry');
	});
	 if($("#uspousedob").val()!=""){
		$('#uchildpassportissueDate,#uchilddateofrecentEntry').datepicker('setStartDate', uchdob);
		$('#uchilddob').datepicker('setEndDate', new Date());
	  }
	 }
	}

	//alert("hi close");
/* $('#uchilddob').datepicker('setEndDate', new Date());
$("#uchilddob").datepicker({
}).on('changeDate', function(selected) {
	 $('#uchildh1bqueDetailsForm').formValidation('revalidateField', 'uchilddob');
});
$("#uchildpassportissueDate").datepicker({
}).on('changeDate', function(selected) {
	 $('#uchildh1bqueDetailsForm').formValidation('revalidateField', 'uchildpassportissueDate');
});
$("#uchildpassportexpDate").datepicker({
}).on('changeDate', function(selected) {
	 $('#uchildh1bqueDetailsForm').formValidation('revalidateField', 'uchildpassportexpDate');
}); 
$("#uchilddateofrecentEntry").datepicker({
}).on('changeDate', function(selected) {
	 $('#uchildh1bqueDetailsForm').formValidation('revalidateField', 'uchilddateofrecentEntry');
}); */
});  

/* $('#h1bchildEntryExitmodal').on('hide.bs.modal', function(){
	 $('#updatechildEntryExitsForm').bootstrapValidator('resetForm', strue);
}); */
/* $("#closechentry").click(function(event) {
	
	 $('#h1bchildEntryExitmodal,#h1bchilddetailsmodal').modal('hide');
	 $("#h1bchild").trigger("click");
}); */
if($("#roleid").val()==4){
	$("#updateh1bqueDetailsForm :input").attr("disabled", true);
	$("#updatespouseh1bqueDetailsForm :input").attr("disabled", true);
}
//if($('#ssnNo').val()!=null){
var textInputssn = document.getElementById('ssnNo');
if(textInputssn!=null){
var timeout = null;
textInputssn.onkeyup = function (e) {
clearTimeout(timeout);
timeout = setTimeout(function () {
	getsesVal().done(function(data){
		  if(data!=""){
	var ssnNo=$('#ssnNo').val();
    if(ssnNo==""){
    	$('#assnshow').text('');
    }else{
    	var regex = new RegExp("^(?!\\b(\\d)\\1+-(\\d)\\1+-(\\d)\\1+\\b)(?!123-45-6789|219-09-9999|078-05-1120)(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$");
        if(!regex.test(ssnNo)){
    	   $('#assnshow').html("<font color=red>Not a valid SSN</font>");
    		$("#h1bapplsubmitid").attr("disabled", true);
        }else{
        	$('#assnshow').html("<font color=#009900>Valid SSN number</font>");	
        	$("#h1bapplsubmitid").attr("disabled", false);
        }
    }
		  }else{window.location.href="loginpage";}});
  }, 5);
};
}
//if($('#ussnNo').val()!=null){
	var utextInputssn = document.getElementById('ussnNo');
	if(utextInputssn!=null){
	var timeout = null;
	utextInputssn.onkeyup = function (e) {
	clearTimeout(timeout);
	timeout = setTimeout(function () {
		getsesVal().done(function(data){
			  if(data!=""){
		var ussnNo=$('#ussnNo').val();
	    if(ussnNo==""){
	    	$('#uassnshow').text('');
	    }else{
	    	var regex = new RegExp("^(?!\\b(\\d)\\1+-(\\d)\\1+-(\\d)\\1+\\b)(?!123-45-6789|219-09-9999|078-05-1120)(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$");
	        if(!regex.test(ussnNo)){
	    	   $('#uassnshow').html("<font color=red>Not a valid SSN</font>");
	    		$("#h1bapplbtnUpdate").attr("disabled", true);
	        }else{
	        	$('#uassnshow').html("<font color=#009900>Valid SSN number</font>");
	        	$("#h1bapplbtnUpdate").attr("disabled", false);
	        }
	    }
	 }else{window.location.href="loginpage";}});
	  }, 5);
	};
}
//if($('#spousessnNo').val()!=null){
	var sptextInputssn = document.getElementById('spousessnNo');
	if(sptextInputssn!=null){
	var timeout = null;
	sptextInputssn.onkeyup = function (e) {
	clearTimeout(timeout);
	timeout = setTimeout(function () {
		getsesVal().done(function(data){
			  if(data!=""){
		var ssnNo=$('#spousessnNo').val();
	    if(ssnNo==""){
	    	$('#spssnshow').text('');
	    }else{
	    	var regex = new RegExp("^(?!\\b(\\d)\\1+-(\\d)\\1+-(\\d)\\1+\\b)(?!123-45-6789|219-09-9999|078-05-1120)(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$");
	        if(!regex.test(ssnNo)){
	    	   $('#spssnshow').html("<font color=red>Not a valid SSN</font>");
	    		$("#spousesubmitid").attr("disabled", true);
	        }else{
	        	$('#spssnshow').html("<font color=#009900>Valid SSN number</font>");
	        	$("#spousesubmitid").attr("disabled", false);
	        }
	    }
			  }else{window.location.href="loginpage";}});
	  }, 5);
	};
}
//if($('#uspousessnNo').val()!=null){
		var usptextInputssn = document.getElementById('uspousessnNo');
		if(usptextInputssn!=null){
		var timeout = null;
		usptextInputssn.onkeyup = function (e) {
		clearTimeout(timeout);
		timeout = setTimeout(function () {
			getsesVal().done(function(data){
				  if(data!=""){
			var ussnNo=$('#uspousessnNo').val();
		    if(ussnNo==""){
		    	$('#uspssnshow').text('');
		    }else{
		    	var regex = new RegExp("^(?!\\b(\\d)\\1+-(\\d)\\1+-(\\d)\\1+\\b)(?!123-45-6789|219-09-9999|078-05-1120)(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$");
		        if(!regex.test(ussnNo)){
		    	   $('#uspssnshow').html("<font color=red>Not a valid SSN</font>");
		    	   $("#uspousesbtnUpdate").attr("disabled", true);
		        }else{
		        	$('#uspssnshow').html("<font color=#009900>Valid SSN number</font>");	
		        	$("#uspousesbtnUpdate").attr("disabled", false);
		        }
		    }
		 }else{window.location.href="loginpage";}});
		  }, 5);
		};
}

//if($('#childssnNo').val()!=null){
	var chtextInput = document.getElementById('childssnNo');
	if(chtextInput!=null){
	var timeout = null;
	chtextInput.onkeyup = function (e) {
	clearTimeout(timeout);
	timeout = setTimeout(function () {
		getsesVal().done(function(data){
			  if(data!=""){
		var ssnNo=$('#childssnNo').val();
	    if(ssnNo==""){
	    	$('#chssnshow').text('');
	    }else{
	    	var regex = new RegExp("^(?!\\b(\\d)\\1+-(\\d)\\1+-(\\d)\\1+\\b)(?!123-45-6789|219-09-9999|078-05-1120)(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$");
	        if(!regex.test(ssnNo)){
	    	   $('#chssnshow').html("<font color=red>Not a valid SSN</font>");
	    	   $("#childsubmitid").attr("disabled", true);
	        }else{
	        	$('#chssnshow').html("<font color=#009900>Valid SSN number</font>");
	        	$("#childsubmitid").attr("disabled", false);
	        }
	    }
			  }else{window.location.href="loginpage";}});
	  }, 5);
	};
}
//if($('#uchildssnNo').val()!=null){
		var uchtextInput = document.getElementById('uchildssnNo');
		if(uchtextInput!=null){
		var timeout = null;
		uchtextInput.onkeyup = function (e) {
		clearTimeout(timeout);
		timeout = setTimeout(function () {
			getsesVal().done(function(data){
				  if(data!=""){
			var ussnNo=$('#uchildssnNo').val();
		    if(ussnNo==""){
		    	$('#uchssnshow').text('');
		    }else{
		    	var regex = new RegExp("^(?!\\b(\\d)\\1+-(\\d)\\1+-(\\d)\\1+\\b)(?!123-45-6789|219-09-9999|078-05-1120)(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$");
		        if(!regex.test(ussnNo)){
		    	   $('#uchssnshow').html("<font color=red>Not a valid SSN</font>");
		    		$("#childbtnUpdate").attr("disabled", true);
		        }else{
		        	$('#uchssnshow').html("<font color=#009900>Valid SSN number</font>");	
		        	$("#childbtnUpdate").attr("disabled", false);
		        }
		    }
		 }else{window.location.href="loginpage";}});
		  }, 5);
		};
     }

/* var childqnid=$("#childqnid").val();
var childpassport=$("#childpassport"+childqnid).val();
$("#child_qnid").text(atob(childpassport));   */
$("tr.child").each(function() {
    var chqnid = $(this).find("input.chqnid").val(),
    chpp = $(this).find("input.chpp").val();
   $("#child_qnid"+chqnid).text(atob(chpp)); 
});

jQuery(document).on('click', '.collapsibleh1bApplAdmin', function(){
	//alert($("#applh1que_id").val());
	$("#rejh1que_id").val($("#applh1que_id").val());
	$("#rejcand_id").val($("#candidateId").val());
	var h1que_id=$("#applh1que_id").val();
	$("#rejprof_type").val("Applicant");
	var benf_type="Applicant";
	var form_type="H1B Questionnaries";
	ajaxCall(h1que_id,benf_type,form_type);
});
jQuery(document).on('click', '.collapsibleh1bspouseAdmin', function(){
	//alert($("#applh1que_id").val());
	$("#rejh1que_id").val($("#spouseh1que_id").val());
	$("#rejcand_id").val($("#candidateId").val());
	var h1que_id=$("#spouseh1que_id").val();
	$("#rejprof_type").val("Spouse");
	var benf_type="Spouse";
	var form_type="H1B Questionnaries";
	ajaxCall(h1que_id,benf_type,form_type);
});
jQuery(document).on('click', '.collapsibleh1bchildAdmin', function(){
	//alert($("#applh1que_id").val());
	$("#rejh1que_id").val($("#childh1que_id").val());
	$("#rejcand_id").val($("#candidateId").val());
	var h1que_id=$("#childh1que_id").val();
	$("#rejprof_type").val("Child");
	var benf_type="Child";
	var form_type="H1B Questionnaries";
	ajaxCall(h1que_id,benf_type,form_type);
});

function ajaxCall(h1que_id,benf_type,form_type){
	loadStatus1();
    $('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4,#rejDiv5,#rejentryDiv8').hide();
	$.ajax({
	type : "GET",
	asyn : false,
	contentType : "application/json", // NOT dataType!
	url : "getrejectedfields",
	data : {
		h1bqueid : h1que_id,
		benf_type : benf_type,
		form_type : form_type
	      },
	success : function(response) {
		//alert(response.rejformsObj);
		   var rejformsObj=response.rejformsObj;
		   var rejformshistoryList=response.rejformshistoryList;
		   var entryList=response.applEntryList;
	  if(response.rejformsObj!=null){
		  // alert(rejformsObj.rejectedfields);
		  /*  if(rejformshistoryList.length>0){
			   $('#chistoryId').show();
			   $('#chistoryId').attr('onclick','viewCommentHistory1(\''+h1que_id+'\',\''+benf_type+'\',\''+form_type+'\')');  
		   }else{
			   $('#chistoryId').hide();
		   } */
		   var $dd = $("select[name='rejstatusid']");
		 /* if(rejformsObj.rejectedfields!=null){
			 
		 }else{
			// $('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4,#rejDiv5').hide();
			// $('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4,#rejDiv5,#rejappl1,#rejappl2,#rejappl3,#rejappl4').hide();  
		 } */
	  $dd.find('option[value="' + rejformsObj.form_status + '"]').text(rejformsObj.form_status).attr('selected', true);
	  if(rejformsObj.rejectedfields!=null){
		  if(benf_type=='Applicant'){
				 $('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4').show();
				 $('#rejappl1,#rejappl2,#rejappl3,#rejappl4,#rejDiv5').show();  
			 }else{
				 $('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4').show();
				 $('#rejappl1,#rejappl2,#rejappl3,#rejappl4,#rejDiv5').hide();
			 }
	  if(rejformsObj.rejectedfields.includes("lastName")){
		 // alert("family name");
		  $("#rejlastName"). prop("checked", true);
	  }else{
		  $("#rejlastName"). prop("checked", false);
	  }
	  if(rejformsObj.rejectedfields.includes("firstName")){
		//  alert("first name");
		  $("#rejfirstName"). prop("checked", true);
	  }else{
		  $("#rejfirstName"). prop("checked", false);
	  }
	  if(rejformsObj.rejectedfields.includes("passportNo")){
		  //alert("passportNo");
		  $("#rejpassportNo"). prop("checked", true);
	  }else{
		  $("#rejpassportNo"). prop("checked", false);
	  }
	  if(rejformsObj.rejectedfields.includes("middleName")){
			  $("#rejmiddleName"). prop("checked", true);
		  }else{
			  $("#rejmiddleName"). prop("checked", false);  
		  }
	  if(rejformsObj.rejectedfields.includes("countryofcitizenship")){
		  $("#rejcountryofcitizenship"). prop("checked", true);  
	  }else{
		  $("#rejcountryofcitizenship"). prop("checked", false);  
	  }
	  if(rejformsObj.rejectedfields.includes("telephoneNo")){
		  $("#rejtelephoneNo"). prop("checked", true);
	  }else{
		  $("#rejtelephoneNo"). prop("checked", false);
	  }
	  if(rejformsObj.rejectedfields.includes("ssnNo")){
		  $("#rejssnNo"). prop("checked", true);
	  }else{
		  $("#rejssnNo"). prop("checked", false);
	  }
	  if(rejformsObj.rejectedfields.includes("i94No")){
		  $("#reji94No"). prop("checked", true);
	  }else{
		  $("#reji94No"). prop("checked", false);
	  }
	  
	  if(rejformsObj.rejectedfields.includes("personalemailid")){
		  $("#rejpersonalemailid"). prop("checked", true);
	  }else{
		  $("#rejpersonalemailid"). prop("checked", false);
	  }
	  if(rejformsObj.rejectedfields.includes("currimmistatus")){
		  $("#rejcurrimmistatus"). prop("checked", true);
	  }else{
		  $("#rejcurrimmistatus"). prop("checked", false);  
	  }
	  
	  if(rejformsObj.rejectedfields.includes("dob")){
			$("#rejdob"). prop("checked", true);
	  }else{
			$("#rejdob"). prop("checked", false);
	  }
	 if(rejformsObj.rejectedfields.includes("countryofbirth")){
		 $("#rejcountryofbirth"). prop("checked", true);
	  }else{
		  $("#rejcountryofbirth"). prop("checked", false);
	  }  
	if(rejformsObj.rejectedfields.includes("cityofbirth")){
		  $("#rejcityofbirth"). prop("checked", true);
	  }else{
		  $("#rejcityofbirth"). prop("checked", false);
	  }
 if(rejformsObj.rejectedfields.includes("Specialization")){
	 $("#rejSpecialization"). prop("checked", true);
  }else{
	  $("#rejSpecialization"). prop("checked", false);
  }  
if(rejformsObj.rejectedfields.includes("passportissueDate")){
	  $("#rejpassportissueDate"). prop("checked", true);
  }else{
	  $("#rejpassportissueDate"). prop("checked", false); 
  }
if(rejformsObj.rejectedfields.includes("passportexpDate")){
	  $("#rejpassportexpDate"). prop("checked", true);
  }else{
	  $("#rejpassportexpDate"). prop("checked", false); 
  }
if(rejformsObj.rejectedfields.includes("line1")){
	$("#rejline1"). prop("checked", true);
}else{
	$("#rejline1"). prop("checked", false);
}
if(rejformsObj.rejectedfields.includes("line2")){
     $("#rejline2"). prop("checked", true);
}else{
	 $("#rejline2"). prop("checked", false);
}  
if(rejformsObj.rejectedfields.includes("city")){
  $("#rejcity"). prop("checked", true);
}else{
	$("#rejcity"). prop("checked", false);
}

if(rejformsObj.rejectedfields.includes("state")){
    $("#rejstate"). prop("checked", true);
}else{
	$("#rejstate"). prop("checked", false);
}
if(rejformsObj.rejectedfields.includes("zipcode")){
    $("#rejzipcode"). prop("checked", true);
}else{
	$("#rejzipcode"). prop("checked", false);
}  
if(rejformsObj.rejectedfields.includes("permanentAddr")){
    $("#rejpermanentAddr"). prop("checked", true);
}else{
	$("#rejpermanentAddr"). prop("checked", false );
}
if(rejformsObj.rejectedfields.includes("dateofrecentEntry")){
	  $("#rejdateofrecentEntry"). prop("checked", true);
}else{
	  $("#rejdateofrecentEntry"). prop("checked", false);
}
if(rejformsObj.rejectedfields.includes("stausofrecentEntry")){ 
	  $("#rejstausofrecentEntry"). prop("checked", true);
}else{
	  $("#rejstausofrecentEntry"). prop("checked", false); 
}

if(benf_type=='Applicant'){
	if(rejformsObj.rejectedfields.includes("dateoffirstEntry")){
		  $("#rejdateoffirstEntry"). prop("checked", true);
	  }else{
		  $("#rejdateoffirstEntry"). prop("checked", false);
	  }
	  if(rejformsObj.rejectedfields.includes("stausoffirstEntry")){ 
		  $("#rejstausoffirstEntry"). prop("checked", true);
	  }else{
		  $("#rejstausoffirstEntry"). prop("checked", false); 
	  }
	if(rejformsObj.rejectedfields.includes("yearsofItExp")){
		$("#rejyearsofItExp"). prop("checked", true);
  }else{
	  $("#rejyearsofItExp"). prop("checked", false);
  }
	if(rejformsObj.rejectedfields.includes("highestEdu")){
		  $("#rejhighestEdu"). prop("checked", true);
	  }else{
		  $("#rejhighestEdu"). prop("checked", false); 
	  }
	if(rejformsObj.rejectedfields.includes("officialemailid")){
		  $("#rejofficialemailid"). prop("checked", true);
	  }else{
		  $("#rejofficialemailid"). prop("checked", false); 
	  }
  if(rejformsObj.rejectedfields.includes("petitionfiled_behalf")){
   $("#rejpetitionfiled_behalf"). prop("checked", true);
   }else{
	$("#rejpetitionfiled_behalf"). prop("checked", false);
   }
  if(rejformsObj.rejectedfields.includes("visastamping")){
	   $("#rejvisastamping"). prop("checked", true);
	   }else{
		$("#rejvisastamping"). prop("checked", false);
	   }
 }
if(entryList!="" && entryList.length>0){
	  $('#rejentryDiv8').show(); 
	  $('#rejentryDiv').empty(); 
	  for(var i=0;i<entryList.length;i++){
      // $('#rejentryDiv').append("<div class='form-group row'><label class='col-sm-3 col-form-label'><span style='color:red;'>"+entryList[i].dates_id+"</span>&nbsp;&nbsp;<span style='color:blue;'>"+entryList[i].arrival_date+"</span></label><input type='checkbox' name='applRejects' id='applRejects"+i+"' value='"+entryList[i].arrival_date+""+entryList[i].dates_id+"' style='width: 20px;height: 20px;'/><label class='col-sm-2 col-form-label'><span style='color:blue;'>"+entryList[i].arrival_visa+"</span></label><input type='checkbox' name='applRejects' id='applRejects"+i+"' value='"+entryList[i].arrival_visa+""+entryList[i].dates_id+"' style='width: 20px;height: 20px;'/><label class='col-sm-2 col-form-label'><span style='color:blue;'>"+entryList[i].departure_date+"</span></label><input type='checkbox' name='applRejects' id='applRejects"+i+"' value='"+entryList[i].departure_date+""+entryList[i].dates_id+"' style='width: 20px;height: 20px;'/><label class='col-sm-2 col-form-label'><span style='color:blue;'>"+entryList[i].departure_visa+"</span></label><input type='checkbox' name='applRejects' id='applRejects"+i+"' value='"+entryList[i].departure_visa+""+entryList[i].dates_id+"' style='width: 20px;height: 20px;'/></div></div>");
      $('#rejentryDiv').append("<div class=' form-group row'><label class='col-sm-3 col-form-label'>Entry and Exit Id <span style='color:blue;'>&nbsp;&nbsp;"+entryList[i].dates_id+"</span></label><input type='checkbox' name='applRejects' id='applRejects"+i+"' value='"+entryList[i].dates_id+"' style='width: 20px;height: 20px;'/></div></div>"); 
      if(rejformsObj.rejectedfields!=null){
       if(rejformsObj.rejectedfields.includes(entryList[i].dates_id)){
      	     $("#applRejects"+i). prop("checked", true);
 	      }else{
 	    	$("#applRejects"+i). prop("checked", false);
 	      }
       }
	 }
   }
}else{
	if(entryList!="" && entryList.length>0){
		 $('#rejentryDiv8').hide(); 
		 $('#rejentryDiv').empty(); 
     	  for(var i=0;i<entryList.length;i++){
	        // $('#rejentryDiv').append("<div class=' form-group row'><label class='col-sm-3 col-form-label'>Entry and Exit Id <span style='color:blue;'>"+entryList[i].dates_id+"</span></label><input type='checkbox' name='applRejects' id='applRejects"+i+"' value='"+entryList[i].dates_id+"' style='width: 20px;height: 20px;'/></div></div>");
     		  $('#rejentryDiv').append("<div class=' form-group row'><label class='col-sm-3 col-form-label'>Entry and Exit Id <span style='color:blue;'>&nbsp;&nbsp;"+entryList[i].dates_id+"</span></label><input type='checkbox' name='applRejects' id='applRejects"+i+"' value='"+entryList[i].dates_id+"' style='width: 20px;height: 20px;'/></div></div>");
     	  }
	  }
}
	  /*
	    rejfirstName rejcountryofcitizenship rejtelephoneNo rejssnNo
		reji94No  rejpersonalemailid  rejofficialemailid  rejcurrimmistatus
		
		 rejpassportNo rejpassportissueDate rejpassportexpDate
		rejhighestEdu rejyearsofItExp rejSpecialization
		rejdateofrecentEntry rejstausofrecentEntry rejvisastamping
		rejline1 rejline2 rejcity rejstate  rejzipcode rejpermanentAddr  rejpetitionfiled_behalf
	  */
	  if(rejformsObj.rejectioncoments!="" || rejformsObj.rejectioncoments!=null){
		    $("#rejectComments").val(rejformsObj.rejectioncoments);
  	          }else{
  	        	$("#rejectComments").val('');  
  	          }
	
		}else{
			$('input[name=applRejects]').attr('checked', false);
			$("#rejectComments").val(''); 
			if(entryList!="" && entryList.length>0){
				 $('#rejentryDiv8').hide(); 
				 $('#rejentryDiv').empty(); 
		      	  for(var i=0;i<entryList.length;i++){
			        // $('#rejentryDiv').append("<div class=' form-group row'><label class='col-sm-3 col-form-label'>Entry and Exit Id <span style='color:blue;'>"+entryList[i].dates_id+"</span></label><input type='checkbox' name='applRejects' id='applRejects"+i+"' value='"+entryList[i].dates_id+"' style='width: 20px;height: 20px;'/></div></div>");
		      		  $('#rejentryDiv').append("<div class=' form-group row'><label class='col-sm-3 col-form-label'>Entry and Exit Id <span style='color:blue;'>&nbsp;&nbsp;"+entryList[i].dates_id+"</span></label><input type='checkbox' name='applRejects' id='applRejects"+i+"' value='"+entryList[i].dates_id+"' style='width: 20px;height: 20px;'/></div></div>");
		      	  }
			  }
			/* if(benf_type=='Applicant'){
				 $('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4,#rejDiv5').show();  
			 }else{
				 $('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4').show(); 
				 $('#rejappl1,#rejappl2,#rejDiv5').hide();
			 } */
  	   	      }
	 $('#h1bRejectionmodal').modal('show');
 }
});
}

$('#h1bRejectionmodal').on('hide.bs.modal', function(){
     $('#rejectFieldFormid').bootstrapValidator('resetForm', true);
     loadStatus1();
     $('input[name=applRejects]').attr('checked', false);
});

function loadStatus1() {
	 var slist = ["Approved"];
	 var slist1 = ["Rejected"];
	$('#rejstatusid').empty();
	$('#rejstatusid').append(
	$('<option/>').attr("value", '').text("Select Status"));
	for (var i = 0; i < slist.length; i++) {
		$('#rejstatusid').append(
				$('<option/>').attr("value", slist[i]).text("Approve"));
	}
	for (var i = 0; i < slist1.length; i++) {
		$('#rejstatusid').append(
				$('<option/>').attr("value", slist1[i]).text("Reject"));
	}
}

$("#rejectbtnId").click(function(event) {
	getsesVal().done(function(data){
		  if(data!=""){
	event.preventDefault();
 	var candidateId=$("#candidateId").val();
 	/*var statusId=$("#approveStatus").val();
	if(statusId!="" && commentId!=""){ */
		$('#rejectFieldFormid').formValidation('validate');
	 if(!$('#rejectFieldFormid').data('formValidation').isValid()) {
		   // alert("Not Valid");
		   //$("#spanError").text("Please select atleast one Amendment");
		} else {
			var sub=false;
			var status=$('#rejstatusid').val();
	        if(status=="Rejected"){
			if($('input[name="applRejects"]').is(':checked'))
			{  sub=true;  }else{	sub=false;	}
	        }else if(status=="Approved"){	sub=true;    }
	     if(sub==true){
		$("#rejectbtnId").attr("disabled", true);
		var form = $('#rejectFieldFormid')[0];
		var data = new FormData(form);
		$.ajax({
			url : "updaterejectfields", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(data) {
				 if(data!="" || data!=null){
					  alert(data);
					 //window.location.href="clientvendorquestionnaire";
					    var initiateid="";
					    window.location.href="h1bqueadmin?candidateId="+candidateId+"&&initiateid="+initiateid+"";
	   	   	          }
	   	   	       else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			 }
		 });
	   }else{
		   alert("Please check atleast one field to reject")
	   }
	}
  }else{window.location.href="loginpage";}});
});

$('#rejectFieldFormid').formValidation({
	framework : 'bootstrap',
	row : {
		valid : 'field-success',
		invalid : 'field-error'
	},
	fields : {
		rejstatusid : {
			validators : {
				notEmpty : {
					message : 'Please select status'
				}
			}
		},
		/* applRejects : {
			validators : {
				notEmpty : {
					message : 'Please select fields'
				}
			}
		}, */
		rejectComments : {
			validators : {
				notEmpty : {
					message : 'Please enter comments'
				}
			}
		}
	}
});
$("#rejstatusid").change(function() {
	var status=$('#rejstatusid').val();
	if(status=="Rejected"){
		var benf_type=$("#rejprof_type").val();
		if(benf_type=='Applicant'){
			 $('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4').show();
			 $('#rejappl1,#rejappl2,#rejappl3,#rejappl4,#rejDiv5').show();  
		 }else{
			 $('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4').show();
			 $('#rejappl1,#rejappl2,#rejappl3,#rejappl4,#rejDiv5').hide();
		 }
		/* if(benf_type=='Applicant'){
			 $('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4,#rejDiv5,#rejappl1,#rejappl2,#rejappl3,#rejappl4').show();  
		 }else{
			 $('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4').show(); 
			 $('#rejappl1,#rejappl2,#rejappl3,#rejappl4,#rejDiv5').hide();
		 } */
		  //$('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4,#rejDiv5').show();
	  // $('#rejectFieldFormid').bootstrapValidator('enableFieldValidators','rejectComments',true);
	   $('#rejentryDiv8').show(); 
	   }else{
			 $('#rejDiv,#rejDiv1,#rejDiv2,#rejDiv3,#rejDiv4').hide();  
		      $('#rejappl1,#rejappl2,#rejappl3,#rejappl4,#rejDiv5').hide();
		      $('#rejentryDiv8').hide(); 
			//  $('#rejectFieldFormid').bootstrapValidator('enableFieldValidators','rejectComments',false);
		}
});	
var tablech1 = $('#commentshistoryTable1').DataTable({
	"order" : [ [ 0, "desc" ] ],
	lengthMenu : [ [ 5, 10, 15, -1 ], [ 5, 10, 15, "All" ] ],
	bLengthChange : true,
	paging : true
});
function viewCommentHistory1(h1que_id,benf_type,form_type){
	//alert(h1que_id+"**"+benf_type+"**"+form_type);
	getsesVal().done(function(data){
	if(data!=""){
	$.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/json", // NOT dataType!
		url : "viewrejectedfieldshistorybyid",
		data : {
			h1bqueid : h1que_id,
			benf_type : benf_type,
			form_type : form_type
		},
		success : function(response) {
			if (tablech1)tablech1.clear();
			$('#commentshistoryTable1').dataTable().fnClearTable();
			if (response!="") {
				for (var i = 0; i < response.length; i++) {
					var rejfields;	
				      if(response[i].rejectedfields!=null){
					   rejfields='<div style="overflow-y:auto;width:400px;max-height:200px;word-wrap: break-word;table-layout: fixed;">' + response[i].rejectedfields + '</div>';
					  }else{
						rejfields="";
						}
				    tablech1.row.add(
						          [ '' + response[i].history_id + '',
						        	'' + response[i].form_status + '',
						        	'' +rejfields+ '',  
									'' + response[i].rejectioncoments + '',
									'' + response[i].varifier_by + '',
									'' +response[i].submitted_on + ''
									]).draw();
				}
			  $('#rejectcommentshistorymodal').modal('show');
			}
		}
	});
		  }else{window.location.href="loginpage";}});
}
</script>
</body>
</html>
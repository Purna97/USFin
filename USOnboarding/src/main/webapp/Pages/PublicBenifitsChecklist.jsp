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
</head>
<style type="text/css">
.field-error .control-label, .field-error .help-block, .field-error .form-control-feedback
	{
	color: red;
}

.field-success .control-label, .field-success .help-block,
	.field-success .form-control-feedback {
	color: #3c763d;
}

.tablepb table, p {
	font-size: 15px;
	font-family: sans-serif;
	font-weight: 500;
	line-height: 17px;
	color: black;
}

/* DivTable.com */
.divTable {
	display: table;
	width: 100%;
}

.divTableRow {
	display: table-row;
}

.divTableHeading {
	background-color: #EEE;
	display: table-header-group;
}

.divTableCell, .divTableHead {
	border: 1px solid #999999;
	display: table-cell;
	padding: 3px 10px;
}

.divTableHeading {
	background-color: #EEE;
	display: table-header-group;
	font-weight: bold;
}

.divTableFoot {
	background-color: #EEE;
	display: table-footer-group;
	font-weight: bold;
}

.divTableBody {
	display: table-row-group;
}
</style>

<body>
	<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
					<!-- <form action="/" id="savepublicbenefits"> -->
					
					
						<div class="card">
							<h5 class="card-header">Public Benefits Checklist</h5>
							
							<div class="card-body">
							<input type="hidden" id="roleid" name="roleid" value="${role}">
							<c:if test="${pbcsize.size() gt 0 }">
								<div class="row">
								<form action="savepublicbenefits" id="savepublicbenefits" method="POST">
									<!-- 	<div class="col-md-12"> -->
									<table id="tablepb" style="height: 723px; width: 1000px;">
										<tbody>
											<tr>
												<td style="width: 52px;">
													<p>
														<strong>&nbsp;</strong>
													</p>
													<p>
														<strong>No.</strong>
													</p>
												</td>
												<td style="width: 497px;">
													<p>
														<strong>&nbsp;</strong>
													</p>
													<p>
														<strong>Public Benefits Received</strong>
													</p>
												</td>
												    <c:if test="${pbcDto.allbenfitsList.size() gt 0}">
													<c:forEach var="allbenfit" items="${pbcDto.allbenfitsList}">
												    <input type="hidden" name="benifit_id" id="benifit_id" value="${allbenfit.benefits_id}">
												   <td style="width: 113px;">
													<p>
														<strong>${allbenfit.beneficiary_type}-${allbenfit.beneficiary_Name}</strong>
													</p>
													<!-- <p>
														<strong>Yes/No</strong>
													</p> -->
												  </td>
												  </c:forEach>
												<!-- <td style="width: 113px;">
													<p>
														<strong>Beneficiary</strong>
													</p>
													<p>
														<strong>Yes/No</strong>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<strong>Spouse</strong>
													</p>
													<p>
														<strong>Yes/No</strong>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<strong>Kids</strong>
													</p>
													<p>
														<strong>Yes/No</strong>
													</p>
												</td> -->
												</c:if>
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>1</p>
												</td>
												<td style="width: 497px;">
													<p>Any Federal, State, local or tribe cash assistance
														for&nbsp; income maintenance</p>
												</td>
												 <c:if test="${pbcDto.allbenfitsList.size() gt 0}">
													<c:forEach var="allbenfit" items="${pbcDto.allbenfitsList}">
												    <td style="width: 113px;">
													<p>
													<c:choose>
												    <c:when test="${not empty pbcDto.applicantObj.income_maintenance}">
												   <c:if test="${pbcDto.applicantObj.income_maintenance eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="income_maintenance${allbenfit.benefits_id}" id="income_maintenanceY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="income_maintenance${allbenfit.benefits_id}" id="income_maintenanceN" value="No"  />No</label>
													</c:if>
													<c:if test="${pbcDto.applicantObj.income_maintenance eq 'No'}">
														<label for="q1-y"><input type="radio" name="income_maintenance${allbenfit.benefits_id}" id="income_maintenanceY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="income_maintenance${allbenfit.benefits_id}" id="income_maintenanceN" value="No"  checked />No</label>
													</c:if>
												    </c:when>
												    <c:otherwise>
												        <label for="q1-y"><input type="radio" name="income_maintenance${allbenfit.benefits_id}" id="income_maintenanceY" value="Yes" required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="income_maintenance${allbenfit.benefits_id}" id="income_maintenanceN" value="No"  />No</label>
												    </c:otherwise>
												    </c:choose>
													</p>
												   </td>
												</c:forEach>
												</c:if>
												<!-- <td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="spouse_income_maintenance" id="spouse_maintenanceY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_income_maintenance" id="spouse_maintenanceN" value="No"  />No</label>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="kids_income_maintenance" id="kids_maintenanceY" value="Yes" required  />Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_income_maintenance" id="kids_maintenanceN" value="No"  />No</label>
													</p>
												</td> -->
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>2</p>
												</td>
												<td style="width: 497px;">
													<p>Supplemental Security Income (SSI)</p>
												</td>
												
												 <c:if test="${pbcDto.allbenfitsList.size() gt 0}">
												<c:forEach var="allbenfit" items="${pbcDto.allbenfitsList}">
												<td style="width: 113px;">
													<p>
													<c:choose>
												    <c:when test="${not empty allbenfit.ssi}">
												     <c:if test="${allbenfit.ssi eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="ssi${allbenfit.benefits_id}" id="ssiY" value="Yes"  checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ssi${allbenfit.benefits_id}" id="ssiN" value="No" />No</label>
														</c:if>
														   <c:if test="${allbenfit.ssi eq 'No'}">
														<label for="q1-y"><input type="radio" name="ssi${allbenfit.benefits_id}" id="ssiY" value="Yes"   required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ssi${allbenfit.benefits_id}" id="ssiN" value="No" checked/>No</label>
														</c:if>
												    </c:when>
												    <c:otherwise>
												        <label for="q1-y"><input type="radio" name="ssi${allbenfit.benefits_id}" id="ssiY" value="Yes" required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ssi${allbenfit.benefits_id}" id="ssiN" value="No"  />No</label>
												    </c:otherwise>
												    </c:choose>
													</p>
												</td>
												</c:forEach>
												</c:if>
												<!-- <td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="spouse_ssi" id="spouse_ssiY" value="Yes"  required />Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_ssi" id="spouse_ssiN" value="No" />No</label>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="kids_ssi" id="kids_ssiY" value="Yes"   required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_ssi" id="kids_ssiN" value="No"  />No</label>
													</p>
												</td> -->
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>3</p>
												</td>
												<td style="width: 497px;">
													<p>Temporary Assistance for Needy Families (TANF)</p>
												</td>
												 <c:if test="${pbcDto.allbenfitsList.size() gt 0}">
												<c:forEach var="allbenfit" items="${pbcDto.allbenfitsList}">
												<td style="width: 113px;">
													<p>
													<c:choose>
												    <c:when test="${not empty allbenfit.tanf}">
												        <c:if test="${allbenfit.tanf eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="tanf${allbenfit.benefits_id}" id="tanfY" value="Yes" checked  required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="tanf${allbenfit.benefits_id}" id="tanfN" value="No" />No</label>
														 </c:if>
														 <c:if test="${allbenfit.tanf eq 'No'}">
														<label for="q1-y"><input type="radio" name="tanf${allbenfit.benefits_id}" id="tanfY" value="Yes"   required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="tanf${allbenfit.benefits_id}" id="tanfN" value="No" checked/>No</label>
														 </c:if>
												    </c:when>
												    <c:otherwise>
												      <label for="q1-y"><input type="radio" name="tanf${allbenfit.benefits_id}" id="tanfY" value="Yes"   required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="tanf${allbenfit.benefits_id}" id="tanfN" value="No" />No</label>
												    </c:otherwise>
												    </c:choose>
													</p>
												</td>
												</c:forEach>
												</c:if>
											<!-- 	<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="spouse_tanf" id="spouse_tanfY" value="Yes" required/>Yes</label>
                                                        <label for="q1-n"><input type="radio" name="spouse_tanf" id="spouse_tanfN" value="No" />No</label>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="kids_tanf" id="kids_tanfY" value="Yes" required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_tanf" id="kids_tanfN" value="No" />No</label>
													</p>
												</td> -->
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>4</p>
												</td>
												<td style="width: 497px;">
													<p>&nbsp;General Assistance (GA)</p>
												</td>
												 <c:if test="${pbcDto.allbenfitsList.size() gt 0}">
												<c:forEach var="allbenfit" items="${pbcDto.allbenfitsList}">
												<td style="width: 113px;">
													<p>
													<c:choose>
												    <c:when test="${not empty allbenfit.ga}">
												        <c:if test="${allbenfit.ga eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="ga${allbenfit.benefits_id}" id="gaY" value="Yes" checked required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="ga${allbenfit.benefits_id}" id="gaN" value="No" />No</label>
														 </c:if>
														   <c:if test="${allbenfit.ga eq 'No'}">
														<label for="q1-y"><input type="radio" name="ga${allbenfit.benefits_id}" id="gaY" value="Yes"  required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="ga${allbenfit.benefits_id}" id="gaN" value="No" checked/>No</label>
														 </c:if>
												    </c:when>
												    <c:otherwise>
												         <label for="q1-y"><input type="radio" name="ga${allbenfit.benefits_id}" id="gaY" value="Yes"  required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="ga${allbenfit.benefits_id}" id="gaN" value="No" />No</label>
												    </c:otherwise>
												    </c:choose>
														
													</p>
												</td>
												</c:forEach>
												</c:if>
											<!-- 	<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="spouse_ga" id="spouse_gaY" value="Yes" required />Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_ga" id="spouse_gaN" value="No" />No</label>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="kids_ga" id="kids_gaY" value="Yes"  required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="kids_ga" id="kids_gaN" value="No" />No</label>
													</p>
												</td> -->
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>5</p>
												</td>
												<td style="width: 497px;">
													<p>Supplemental Nutrition Assistance Program (SNAP,
														formerly called &ldquo;Food Stamps&rdquo;)</p>
												</td>
												 <c:if test="${pbcDto.allbenfitsList.size() gt 0}">
												<c:forEach var="allbenfit" items="${pbcDto.allbenfitsList}">
												<td style="width: 113px;">
													<p>
													<c:choose>
												    <c:when test="${not empty allbenfit.snap}">
												      <c:if test="${allbenfit.snap eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="snap${allbenfit.benefits_id}" id="snapY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="snap${allbenfit.benefits_id}" id="snapN" value="No" />No</label>
														</c:if>
														  <c:if test="${allbenfit.snap eq 'No'}">
														<label for="q1-y"><input type="radio" name="snap${allbenfit.benefits_id}" id="snapY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="snap${allbenfit.benefits_id}" id="snapN" value="No" checked/>No</label>
														</c:if>
												    </c:when>
												    <c:otherwise>
												       <label for="q1-y"><input type="radio" name="snap${allbenfit.benefits_id}" id="snapY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="snap${allbenfit.benefits_id}" id="snapN" value="No" />No</label>
												    </c:otherwise>
												    </c:choose>
														
													</p>
												</td>
												</c:forEach>
												</c:if>
												<!-- <td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="spouse_snap" id="spouse_snapY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_snap" id="spouse_snapN" value="No" />No</label>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="kids_snap" id="kids_snapY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_snap" id="kids_snapN" value="No" />No</label>
													</p>
												</td> -->
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>6</p>
												</td>
												<td style="width: 497px;">
													<p>Section 8 Housing Assistance under the Housing
														Choice Voucher Program</p>
												</td>
												 <c:if test="${pbcDto.allbenfitsList.size() gt 0}">
												<c:forEach var="allbenfit" items="${pbcDto.allbenfitsList}">
												<td style="width: 113px;">
													<p>
													<c:choose>
												    <c:when test="${not empty allbenfit.housing_assistance}">
												       <c:if test="${allbenfit.housing_assistance eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="housing_assistance${allbenfit.benefits_id}" id="housing_assistanceY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="housing_assistance${allbenfit.benefits_id}" id="housing_assistanceN" value="No" />No</label>
														</c:if>
														 <c:if test="${allbenfit.housing_assistance eq 'No'}">
														<label for="q1-y"><input type="radio" name="housing_assistance${allbenfit.benefits_id}" id="housing_assistanceY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="housing_assistance${allbenfit.benefits_id}" id="housing_assistanceN" value="No" checked/>No</label>
														</c:if>
												    </c:when>
												    <c:otherwise>
												       <label for="q1-y"><input type="radio" name="housing_assistance${allbenfit.benefits_id}" id="housing_assistanceY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="housing_assistance${allbenfit.benefits_id}" id="housing_assistanceN" value="No" />No</label>
												    </c:otherwise>
												    </c:choose>
														
													</p>
												</td>
												</c:forEach>
												</c:if>
											<!-- 	<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="spouse_housing_assistance" id="spouse_housing_assistanceY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_housing_assistance" id="spouse_housing_assistanceN" value="No" />No</label>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="kids_housing_assistance" id="kids_housing_assistanceY" value="Yes" required />Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_housing_assistance" id="kids_housing_assistanceN" value="No" />No</label>
													</p>
												</td> -->
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>7</p>
												</td>
												<td style="width: 497px;">
													<p>Section 8 Project-Based Rental Assistance (including
														Moderate Rehabilitation)</p>
												</td>
												 <c:if test="${pbcDto.allbenfitsList.size() gt 0}">
												<c:forEach var="allbenfit" items="${pbcDto.allbenfitsList}">
												<td style="width: 113px;">
													<p>
													<c:choose>
												    <c:when test="${not empty allbenfit.project_rental_assistance}">
												       <c:if test="${allbenfit.project_rental_assistance eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="project_rental_assistance${allbenfit.benefits_id}" id="project_rental_assistanceY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="project_rental_assistance${allbenfit.benefits_id}" id="project_rental_assistanceN" value="No" />No</label>
														</c:if>
														<c:if test="${allbenfit.project_rental_assistance eq 'No'}">
														<label for="q1-y"><input type="radio" name="project_rental_assistance${allbenfit.benefits_id}" id="project_rental_assistanceY" value="Yes" required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="project_rental_assistance${allbenfit.benefits_id}" id="project_rental_assistanceN" value="No" checked />No</label>
														</c:if>
												    </c:when>
												    <c:otherwise>
												       	<label for="q1-y"><input type="radio" name="project_rental_assistance${allbenfit.benefits_id}" id="project_rental_assistanceY" value="Yes" />Yes</label> 
														<label for="q1-n"><input type="radio" name="project_rental_assistance${allbenfit.benefits_id}" id="project_rental_assistanceN" value="No" />No</label>
												    </c:otherwise>
												    </c:choose>
													</p>
												</td>
												</c:forEach>
												</c:if>
												<!-- <td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="spouse_project_rental_assistance" id="spouse_project_rental_assistanceY" value="Yes" />Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_project_rental_assistance" id="spouse_project_rental_assistanceN" value="No" />No</label>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="kids_project_rental_assistance" id="kids_project_rental_assistanceY" value="Yes" />Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_project_rental_assistance" id="kids_project_rental_assistanceN" value="No" />No</label>
													</p>
												</td> -->
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>8</p>
												</td>
												<td style="width: 497px;">
													<p>Public Housing under the Housing Act of 1937, 42
														U.S.C. 1437 et seq.</p>
												</td>
												 <c:if test="${pbcDto.allbenfitsList.size() gt 0}">
												<c:forEach var="allbenfit" items="${pbcDto.allbenfitsList}">
												<td style="width: 113px;">
													<p>
													<c:choose>
												    <c:when test="${not empty allbenfit.public_housing_act}">
												      <c:if test="${allbenfit.public_housing_act eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="public_housing_act${allbenfit.benefits_id}" id="public_housing_actY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="public_housing_act${allbenfit.benefits_id}" id="public_housing_actN" value="No" />No</label>
														</c:if>
															<c:if test="${allbenfit.public_housing_act eq 'No'}">
														<label for="q1-y"><input type="radio" name="public_housing_act${allbenfit.benefits_id}" id="public_housing_actY" value="Yes" required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="public_housing_act${allbenfit.benefits_id}" id="public_housing_actN" value="No" checked/>No</label>
														</c:if>
												    </c:when>
												    <c:otherwise>
												       <label for="q1-y"><input type="radio" name="public_housing_act${allbenfit.benefits_id}" id="public_housing_actY" value="Yes" />Yes</label> 
														<label for="q1-n"><input type="radio" name="public_housing_act${allbenfit.benefits_id}" id="public_housing_actN" value="No" />No</label>
												    </c:otherwise>
												    </c:choose>
														
													</p>
												</td>
												</c:forEach>
												</c:if>
											<!-- 	<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="spouse_public_housing_act" id="spouse_public_housing_actY" value="Yes" />Yes</label>
														 <label for="q1-n"><input type="radio" name="spouse_public_housing_act" id="spouse_public_housing_actN" value="No" />No</label>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="kids_public_housing_act" id="kids_public_housing_actY" value="Yes" />Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_public_housing_act" id="kids_public_housing_actN" value="No" />No</label>
													</p>
												</td> -->
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>9</p>
												</td>
												<td style="width: 497px;">
													<p>Federally-Funded Medicaid for an emergency medical
														condition</p>
												</td>
												 <c:if test="${pbcDto.allbenfitsList.size() gt 0}">
												<c:forEach var="allbenfit" items="${pbcDto.allbenfitsList}">
												<td style="width: 113px;">
													<p>
													<c:choose>
												    <c:when test="${not empty allbenfit.ffm_medicalemergency}">
												   <c:if test="${allbenfit.ffm_medicalemergency eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="ffm_medicalemergency${allbenfit.benefits_id}" id="ffm_medicalemergencyY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_medicalemergency${allbenfit.benefits_id}" id="ffm_medicalemergencyN" value="No" />No</label>
														</c:if>
														    <c:if test="${allbenfit.ffm_medicalemergency eq 'No'}">
														<label for="q1-y"><input type="radio" name="ffm_medicalemergency${allbenfit.benefits_id}" id="ffm_medicalemergencyY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_medicalemergency${allbenfit.benefits_id}" id="ffm_medicalemergencyN" value="No" checked/>No</label>
														</c:if>
												    </c:when>
												    <c:otherwise>
												      <label for="q1-y"><input type="radio" name="ffm_medicalemergency${allbenfit.benefits_id}" id="ffm_medicalemergencyY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_medicalemergency${allbenfit.benefits_id}" id="ffm_medicalemergencyN" value="No" />No</label>
												    </c:otherwise>
												    </c:choose>
													</p>
												</td>
												</c:forEach>
												</c:if>
												<!-- <td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="spouse_ffm_medicalemergency" id="spouse_ffm_medicalemergencyY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_ffm_medicalemergency" id="spouse_ffm_medicalemergencyN" value="No" />No</label>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="kids_ffm_medicalemergency" id="kids_ffm_medicalemergencyY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_ffm_medicalemergency" id="kids_ffm_medicalemergencyN" value="No" />No</label>
													</p>
												</td> -->
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>10</p>
												</td>
												<td style="width: 497px;">
													<p>Federally-Funded Medicaid for a service under the
														Individuals with Disabilities Education Act (IDEA)</p>
												</td>
												 <c:if test="${pbcDto.allbenfitsList.size() gt 0}">
												<c:forEach var="allbenfit" items="${pbcDto.allbenfitsList}">
												<td style="width: 113px;">
													<p>
													<c:choose>
												    <c:when test="${not empty allbenfit.ffm_ideact}">
												   <c:if test="${allbenfit.ffm_ideact eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="ffm_ideact${allbenfit.benefits_id}" id="ffm_ideactY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_ideact${allbenfit.benefits_id}" id="ffm_ideactN" value="No" />No</label>
														</c:if>
														<c:if test="${allbenfit.ffm_ideact eq 'No'}">
														<label for="q1-y"><input type="radio" name="ffm_ideact${allbenfit.benefits_id}" id="ffm_ideactY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_ideact${allbenfit.benefits_id}" id="ffm_ideactN" value="No" checked/>No</label>
														</c:if>
												    </c:when>
												    <c:otherwise>
												    <label for="q1-y"><input type="radio" name="ffm_ideact${allbenfit.benefits_id}" id="ffm_ideactY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_ideact${allbenfit.benefits_id}" id="ffm_ideactN" value="No" />No</label>
												    </c:otherwise>
												    </c:choose>
														
													</p>
												</td>
												</c:forEach>
												</c:if>
											<!-- 	<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="spouse_ffm_ideact" id="spouse_ffm_ideactY" value="Yes"  required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="spouse_ffm_ideact" id="spouse_ffm_ideactN" value="No" />No</label>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="kids_ffm_ideact" id="kids_ffm_ideactY" value="Yes" required />Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_ffm_ideact" id="kids_ffm_ideactN" value="No" />No</label>
													</p>
												</td> -->
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>11</p>
												</td>
												<td style="width: 497px;">
													<p>Federally-Funded Medicaid other school-based
														benefits or services available up to the oldest age
														eligible for secondary education under state law.</p>
												</td>
												 <c:if test="${pbcDto.allbenfitsList.size() gt 0}">
												<c:forEach var="allbenfit" items="${pbcDto.allbenfitsList}">
												<td style="width: 113px;">
													<p>
													<c:choose>
												    <c:when test="${not empty allbenfit.ffm_schoolbenefits}">
												      <c:if test="${allbenfit.ffm_schoolbenefits eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="ffm_schoolbenefits${allbenfit.benefits_id}" id="ffm_schoolbenefitsY" value="Yes" checked required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="ffm_schoolbenefits${allbenfit.benefits_id}" id="ffm_schoolbenefitsN" value="No" />No</label>
														 </c:if>
														 <c:if test="${allbenfit.ffm_schoolbenefits eq 'No'}">
														<label for="q1-y"><input type="radio" name="ffm_schoolbenefits${allbenfit.benefits_id}" id="ffm_schoolbenefitsY" value="Yes"  required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="ffm_schoolbenefits${allbenfit.benefits_id}" id="ffm_schoolbenefitsN" value="No" checked/>No</label>
														 </c:if>
												    </c:when>
												    <c:otherwise>
												        <label for="q1-y"><input type="radio" name="ffm_schoolbenefits${allbenfit.benefits_id}" id="ffm_schoolbenefitsY" value="Yes"  required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="ffm_schoolbenefits${allbenfit.benefits_id}" id="ffm_schoolbenefitsN" value="No" />No</label>
												    </c:otherwise>
												    </c:choose>
														
													</p>
												</td>
												</c:forEach>
												</c:if>
												<!-- <td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="spouse_ffm_schoolbenefits" id="spouse_ffm_schoolbenefitsY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_ffm_schoolbenefits" id="spouse_ffm_schoolbenefitsN" value="No" />No</label>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="kids_ffm_schoolbenefits" id="kids_ffm_schoolbenefitsY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_ffm_schoolbenefits" id="kids_ffm_schoolbenefitsN" value="No" />No</label>
													</p>
												</td> -->
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>12</p>
												</td>
												<td style="width: 497px;">
													<p>Federally-Funded Medicaid while you were under the
														age of 21</p>
												</td>
												 <c:if test="${pbcDto.allbenfitsList.size() gt 0}">
												<c:forEach var="allbenfit" items="${pbcDto.allbenfitsList}">
												<td style="width: 113px;">
													<p>
														<c:choose>
												    <c:when test="${not empty allbenfit.ffm_uderage21}">
												       <c:if test="${allbenfit.ffm_uderage21 eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="ffm_uderage21${allbenfit.benefits_id}" id="ffm_uderage21Y" value="Yes" checked required />Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_uderage21${allbenfit.benefits_id}" id="ffm_uderage21N" value="No" />No</label>
														</c:if>
														<c:if test="${allbenfit.ffm_uderage21 eq 'No'}">
														<label for="q1-y"><input type="radio" name="ffm_uderage21${allbenfit.benefits_id}" id="ffm_uderage21Y" value="Yes" required />Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_uderage21${allbenfit.benefits_id}" id="ffm_uderage21N" value="No" checked/>No</label>
														</c:if>
												    </c:when>
												    <c:otherwise>
												       <label for="q1-y"><input type="radio" name="ffm_uderage21${allbenfit.benefits_id}" id="ffm_uderage21Y" value="Yes" required />Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_uderage21${allbenfit.benefits_id}" id="ffm_uderage21N" value="No" />No</label>
												    </c:otherwise>
												    </c:choose>
													</p>
												</td>
												</c:forEach>
												</c:if>
												<!-- <td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="spouse_ffm_uderage21" id="spouse_ffm_uderage21Y" value="Yes" required />Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_ffm_uderage21" id="spouse_ffm_uderage21N" value="No" />No</label>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="kids_ffm_uderage21" id="kids_ffm_uderage21Y" value="Yes"  required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="kids_ffm_uderage21" id="kids_ffm_uderage21N" value="No" />No</label>
													</p>
												</td> -->
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>13</p>
												</td>
												<td style="width: 497px;">
													<p>Federally-Funded Medicaid while you were pregnant or
														during the 60 day period following the last day of
														pregnancy.</p>
												</td>
												 <c:if test="${pbcDto.allbenfitsList.size() gt 0}">
												<c:forEach var="allbenfit" items="${pbcDto.allbenfitsList}">
												<td style="width: 113px;">
													<p>
													<c:choose>
												    <c:when test="${not empty allbenfit.ffm_pregnant_period60}">
												      <c:if test="${allbenfit.ffm_pregnant_period60 eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="ffm_pregnant_period60${allbenfit.benefits_id}" id="ffm_pregnant_period60Y" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_pregnant_period60${allbenfit.benefits_id}" id="ffm_pregnant_period60N" value="No" />No</label>
														</c:if>
														<c:if test="${allbenfit.ffm_pregnant_period60 eq 'No'}">
														<label for="q1-y"><input type="radio" name="ffm_pregnant_period60${allbenfit.benefits_id}" id="ffm_pregnant_period60Y" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_pregnant_period60${allbenfit.benefits_id}" id="ffm_pregnant_period60N" value="No" checked/>No</label>
														</c:if>
												    </c:when>
												    <c:otherwise>
												        <label for="q1-y"><input type="radio" name="ffm_pregnant_period60${allbenfit.benefits_id}" id="ffm_pregnant_period60Y" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_pregnant_period60${allbenfit.benefits_id}" id="ffm_pregnant_period60N" value="No" />No</label>
												    </c:otherwise>
												    </c:choose>
														
													</p>
												</td>
												</c:forEach>
												</c:if>
												<!-- <td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="spouse_ffm_pregnant_period60" id="spouse_ffm_pregnant_period60Y" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_ffm_pregnant_period60" id="spouse_ffm_pregnant_period60N" value="No" />No</label>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="kids_ffm_pregnant_period60" id="kids_ffm_pregnant_period60Y" value="Yes" required />Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_ffm_pregnant_period60" id="kids_ffm_pregnant_period60N" value="No" />No</label>
													</p>
												</td> -->
											</tr>
											<!-- <tr>
												<td style="width: 52px;">
													<p>13</p>
												</td>
												<td style="width: 497px;">
													<p>Federally-Funded Medicaid while you were pregnant or
														during the 60-day period following the last day of
														pregnancy</p>
												</td>
												<td style="width: 113px;">
													<p>
														<label for="q1-y"><input type="radio" name="q1"
															id="q1-y" value="Yes" />Yes</label> <label for="q1-n"><input
															type="radio" name="q1" id="q1-n" value="No" />No</label>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="q1"
															id="q1-y" value="yes" />Yes</label> <label for="q1-n"><input
															type="radio" name="q1" id="q1-n" value="No" />No</label>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<label for="q1-y"><input type="radio" name="q1"
															id="q1-y" value="yes" />Yes</label> <label for="q1-n"><input
															type="radio" name="q1" id="q1-n" value="no" />No</label>
													</p>
												</td>
											</tr> -->
										</tbody>
									</table>
										<c:if test="${role == 1}">
										
										<c:choose>
									    <c:when test="${not empty pbcDto.applicantObj.income_maintenance}">
									    <div class="text-center ml-12" id="updateBtn">
									<button type="submit" class="btn btn-info btn-sm"
										id="Submitbtn" >Update</button>
									<!-- <button type="button" class="btn btn-info btn-sm"
										id="btn-colorb" onClick="window.location.reload()">Reset</button> -->
									<a href="mydocuments" class="btn btn-default"
										style="padding: 7px; background-color: grey; color: white; text-transform: INITIAL; line-height: 0.728571;"
										id="reset">Back</a>
								    </div>
										 </c:when>
										 <c:otherwise>
										  <div class="text-center ml-12" id="subBtnId">
									<button type="submit" class="btn btn-info btn-sm"
										id="Submitbtn" >Submit</button>
									<button type="button" class="btn btn-info btn-sm"
										id="btn-colorb" onClick="window.location.reload()">Reset</button>
									<a href="mydocuments" class="btn btn-default"
										style="padding: 7px; background-color: grey; color: white; text-transform: INITIAL; line-height: 0.728571;"
										id="reset">Back</a>
								    </div>
										 </c:otherwise>
										</c:choose>
									
								   
								</c:if>
								</form>
								</div>
							
								</c:if>
								
								
							<%-- 	<c:if test="${pbcsize.size() gt 0}">
								<form action="updatepublicbenefits" id="updatepublicbenefits" method="POST">
								<div class="row">
									<!-- 	<div class="col-md-12"> -->
									<table id="tablepb" style="height: 723px; width: 1000px;">
										<tbody>
											<tr>
												<td style="width: 52px;">
													<p>
														<strong>&nbsp;</strong>
													</p>
													<p>
														<strong>No.</strong>
													</p>
												</td>
												<td style="width: 497px;">
													<p>
														<strong>&nbsp;</strong>
													</p>
													<p>
														<strong>Public Benefits Received</strong>
													</p>
												</td>
												<td style="width: 113px;">
													<p>
														<strong>Beneficiary</strong>
													</p>
													<p>
														<strong>Yes/No</strong>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<strong>Spouse</strong>
													</p>
													<p>
														<strong>Yes/No</strong>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<strong>Kids</strong>
													</p>
													<p>
														<strong>Yes/No</strong>
													</p>
												</td>
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>1</p>
												</td>
												<td style="width: 497px;">
													<p>Any Federal, State, local or tribe cash assistance
														for&nbsp; income maintenance</p>
												</td>
												<td style="width: 113px;">
													<p>
													<c:if test="${pbcDto.applicantObj.income_maintenance eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="income_maintenance" id="income_maintenanceY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="income_maintenance" id="income_maintenanceN" value="No"  />No</label>
													</c:if>
													<c:if test="${pbcDto.applicantObj.income_maintenance eq 'No'}">
														<label for="q1-y"><input type="radio" name="income_maintenance" id="income_maintenanceY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="income_maintenance" id="income_maintenanceN" value="No"  checked />No</label>
													</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													<c:if test="${pbcDto.spouseObj.income_maintenance eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="spouse_income_maintenance" id="spouse_maintenanceY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_income_maintenance" id="spouse_maintenanceN" value="No"  />No</label>
													</c:if>
													<c:if test="${pbcDto.spouseObj.income_maintenance eq 'No'}">
													    <label for="q1-y"><input type="radio" name="spouse_income_maintenance" id="spouse_maintenanceY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_income_maintenance" id="spouse_maintenanceN" value="No" checked />No</label>
													</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													    <c:if test="${pbcDto.childObj.income_maintenance eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="kids_income_maintenance" id="kids_maintenanceY" value="Yes" checked required  />Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_income_maintenance" id="kids_maintenanceN" value="No"  />No</label>
														</c:if>
														 <c:if test="${pbcDto.childObj.income_maintenance eq 'No'}">
														<label for="q1-y"><input type="radio" name="kids_income_maintenance" id="kids_maintenanceY" value="Yes"  required  />Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_income_maintenance" id="kids_maintenanceN" value="No" checked />No</label>
														</c:if>
													</p>
												</td>
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>2</p>
												</td>
												<td style="width: 497px;">
													<p>Supplemental Security Income (SSI)</p>
												</td>
												<td style="width: 113px;">
													<p>
													      <c:if test="${pbcDto.applicantObj.ssi eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="ssi" id="ssiY" value="Yes"  checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ssi" id="ssiN" value="No" />No</label>
														</c:if>
														   <c:if test="${pbcDto.applicantObj.ssi eq 'No'}">
														<label for="q1-y"><input type="radio" name="ssi" id="ssiY" value="Yes"   required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ssi" id="ssiN" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													    <c:if test="${pbcDto.spouseObj.ssi eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="spouse_ssi" id="spouse_ssiY" value="Yes" checked required />Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_ssi" id="spouse_ssiN" value="No" />No</label>
														</c:if>
														 <c:if test="${pbcDto.spouseObj.ssi eq 'No'}">
														<label for="q1-y"><input type="radio" name="spouse_ssi" id="spouse_ssiY" value="Yes"  required />Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_ssi" id="spouse_ssiN" value="No" checked />No</label>
														</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													      <c:if test="${pbcDto.childObj.ssi eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="kids_ssi" id="kids_ssiY" value="Yes"  checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_ssi" id="kids_ssiN" value="No"  />No</label>
														</c:if>
														  <c:if test="${pbcDto.childObj.ssi eq 'No'}">
														<label for="q1-y"><input type="radio" name="kids_ssi" id="kids_ssiY" value="Yes"   required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_ssi" id="kids_ssiN" value="No" checked />No</label>
														</c:if>
													</p>
												</td>
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>3</p>
												</td>
												<td style="width: 497px;">
													<p>Temporary Assistance for Needy Families (TANF)</p>
												</td>
												<td style="width: 113px;">
													<p>
													    <c:if test="${pbcDto.applicantObj.tanf eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="tanf" id="tanfY" value="Yes" checked  required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="tanf" id="tanfN" value="No" />No</label>
														 </c:if>
														 <c:if test="${pbcDto.applicantObj.tanf eq 'No'}">
														<label for="q1-y"><input type="radio" name="tanf" id="tanfY" value="Yes"   required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="tanf" id="tanfN" value="No" checked/>No</label>
														 </c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
												     	<c:if test="${pbcDto.spouseObj.tanf eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="spouse_tanf" id="spouse_tanfY" value="Yes" checked required/>Yes</label>
                                                        <label for="q1-n"><input type="radio" name="spouse_tanf" id="spouse_tanfN" value="No" />No</label>
                                                        </c:if>
                                                        <c:if test="${pbcDto.spouseObj.tanf eq 'No'}">
														<label for="q1-y"><input type="radio" name="spouse_tanf" id="spouse_tanfY" value="Yes"  required/>Yes</label>
                                                        <label for="q1-n"><input type="radio" name="spouse_tanf" id="spouse_tanfN" value="No" checked />No</label>
                                                        </c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													    <c:if test="${pbcDto.childObj.tanf eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="kids_tanf" id="kids_tanfY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_tanf" id="kids_tanfN" value="No" />No</label>
														</c:if>
														 <c:if test="${pbcDto.childObj.tanf eq 'No'}">
														<label for="q1-y"><input type="radio" name="kids_tanf" id="kids_tanfY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_tanf" id="kids_tanfN" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>4</p>
												</td>
												<td style="width: 497px;">
													<p>&nbsp;General Assistance (GA)</p>
												</td>
												<td style="width: 113px;">
													<p>
													    <c:if test="${pbcDto.applicantObj.ga eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="ga" id="gaY" value="Yes" checked required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="ga" id="gaN" value="No" />No</label>
														 </c:if>
														   <c:if test="${pbcDto.applicantObj.ga eq 'No'}">
														<label for="q1-y"><input type="radio" name="ga" id="gaY" value="Yes"  required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="ga" id="gaN" value="No" checked/>No</label>
														 </c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													    <c:if test="${pbcDto.spouseObj.ga eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="spouse_ga" id="spouse_gaY" value="Yes" checked required />Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_ga" id="spouse_gaN" value="No" />No</label>
														</c:if>
														 <c:if test="${pbcDto.spouseObj.ga eq 'No'}">
														<label for="q1-y"><input type="radio" name="spouse_ga" id="spouse_gaY" value="Yes"  required />Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_ga" id="spouse_gaN" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													  <c:if test="${pbcDto.childObj.ga eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="kids_ga" id="kids_gaY" value="Yes" checked required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="kids_ga" id="kids_gaN" value="No" />No</label>
														 </c:if>
														   <c:if test="${pbcDto.childObj.ga eq 'No'}">
														<label for="q1-y"><input type="radio" name="kids_ga" id="kids_gaY" value="Yes"  required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="kids_ga" id="kids_gaN" value="No" checked/>No</label>
														 </c:if>
													</p>
												</td>
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>5</p>
												</td>
												<td style="width: 497px;">
													<p>Supplemental Nutrition Assistance Program (SNAP,
														formerly called &ldquo;Food Stamps&rdquo;)</p>
												</td>
												<td style="width: 113px;">
													<p>
													    <c:if test="${pbcDto.applicantObj.snap eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="snap" id="snapY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="snap" id="snapN" value="No" />No</label>
														</c:if>
														  <c:if test="${pbcDto.applicantObj.snap eq 'No'}">
														<label for="q1-y"><input type="radio" name="snap" id="snapY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="snap" id="snapN" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													    <c:if test="${pbcDto.spouseObj.snap eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="spouse_snap" id="spouse_snapY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_snap" id="spouse_snapN" value="No" />No</label>
														</c:if>
														 <c:if test="${pbcDto.spouseObj.snap eq 'No'}">
														<label for="q1-y"><input type="radio" name="spouse_snap" id="spouse_snapY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_snap" id="spouse_snapN" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													      <c:if test="${pbcDto.childObj.snap eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="kids_snap" id="kids_snapY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_snap" id="kids_snapN" value="No" />No</label>
														</c:if>
														<c:if test="${pbcDto.childObj.snap eq 'No'}">
														<label for="q1-y"><input type="radio" name="kids_snap" id="kids_snapY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_snap" id="kids_snapN" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>6</p>
												</td>
												<td style="width: 497px;">
													<p>Section 8 Housing Assistance under the Housing
														Choice Voucher Program</p>
												</td>
												<td style="width: 113px;">
													<p>
													   <c:if test="${pbcDto.applicantObj.housing_assistance eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="housing_assistance" id="housing_assistanceY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="housing_assistance" id="housing_assistanceN" value="No" />No</label>
														</c:if>
														 <c:if test="${pbcDto.applicantObj.housing_assistance eq 'No'}">
														<label for="q1-y"><input type="radio" name="housing_assistance" id="housing_assistanceY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="housing_assistance" id="housing_assistanceN" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													 <c:if test="${pbcDto.spouseObj.housing_assistance eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="spouse_housing_assistance" id="spouse_housing_assistanceY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_housing_assistance" id="spouse_housing_assistanceN" value="No" />No</label>
														</c:if>
														 <c:if test="${pbcDto.spouseObj.housing_assistance eq 'No'}">
														<label for="q1-y"><input type="radio" name="spouse_housing_assistance" id="spouse_housing_assistanceY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_housing_assistance" id="spouse_housing_assistanceN" value="No" checked />No</label>
														</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													   <c:if test="${pbcDto.childObj.housing_assistance eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="kids_housing_assistance" id="kids_housing_assistanceY" value="Yes" checked required />Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_housing_assistance" id="kids_housing_assistanceN" value="No" />No</label>
														</c:if>
														 <c:if test="${pbcDto.childObj.housing_assistance eq 'No'}">
														<label for="q1-y"><input type="radio" name="kids_housing_assistance" id="kids_housing_assistanceY" value="Yes" required />Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_housing_assistance" id="kids_housing_assistanceN" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>7</p>
												</td>
												<td style="width: 497px;">
													<p>Section 8 Project-Based Rental Assistance (including
														Moderate Rehabilitation)</p>
												</td>
												<td style="width: 113px;">
													<p>
															<c:if test="${pbcDto.applicantObj.project_rental_assistance eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="project_rental_assistance" id="project_rental_assistanceY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="project_rental_assistance" id="project_rental_assistanceN" value="No" />No</label>
														</c:if>
														<c:if test="${pbcDto.applicantObj.project_rental_assistance eq 'No'}">
														<label for="q1-y"><input type="radio" name="project_rental_assistance" id="project_rental_assistanceY" value="Yes" required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="project_rental_assistance" id="project_rental_assistanceN" value="No" checked />No</label>
														</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													<c:if test="${pbcDto.spouseObj.project_rental_assistance eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="spouse_project_rental_assistance" id="spouse_project_rental_assistanceY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_project_rental_assistance" id="spouse_project_rental_assistanceN" value="No" />No</label>
														</c:if>
														<c:if test="${pbcDto.spouseObj.project_rental_assistance eq 'No'}">
														<label for="q1-y"><input type="radio" name="spouse_project_rental_assistance" id="spouse_project_rental_assistanceY" value="Yes" required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_project_rental_assistance" id="spouse_project_rental_assistanceN" value="No" checked />No</label>
														</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													<c:if test="${pbcDto.childObj.project_rental_assistance eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="kids_project_rental_assistance" id="kids_project_rental_assistanceY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_project_rental_assistance" id="kids_project_rental_assistanceN" value="No" />No</label>
														</c:if>
														<c:if test="${pbcDto.childObj.project_rental_assistance eq 'No'}">
														<label for="q1-y"><input type="radio" name="kids_project_rental_assistance" id="kids_project_rental_assistanceY" value="Yes" required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_project_rental_assistance" id="kids_project_rental_assistanceN" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>8</p>
												</td>
												<td style="width: 497px;">
													<p>Public Housing under the Housing Act of 1937, 42
														U.S.C. 1437 et seq.</p>
												</td>
												<td style="width: 113px;">
													<p>
													<c:if test="${pbcDto.applicantObj.public_housing_act eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="public_housing_act" id="public_housing_actY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="public_housing_act" id="public_housing_actN" value="No" />No</label>
														</c:if>
															<c:if test="${pbcDto.applicantObj.public_housing_act eq 'No'}">
														<label for="q1-y"><input type="radio" name="public_housing_act" id="public_housing_actY" value="Yes" required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="public_housing_act" id="public_housing_actN" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													<c:if test="${pbcDto.spouseObj.public_housing_act eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="spouse_public_housing_act" id="spouse_public_housing_actY" value="Yes" checked required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="spouse_public_housing_act" id="spouse_public_housing_actN" value="No" />No</label>
														 </c:if>
														 <c:if test="${pbcDto.spouseObj.public_housing_act eq 'No'}">
														<label for="q1-y"><input type="radio" name="spouse_public_housing_act" id="spouse_public_housing_actY" value="Yes" required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="spouse_public_housing_act" id="spouse_public_housing_actN" value="No" checked/>No</label>
														 </c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													<c:if test="${pbcDto.childObj.public_housing_act eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="kids_public_housing_act" id="kids_public_housing_actY" value="Yes" checked required />Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_public_housing_act" id="kids_public_housing_actN" value="No" />No</label>
														</c:if>
														<c:if test="${pbcDto.childObj.public_housing_act eq 'No'}">
														<label for="q1-y"><input type="radio" name="kids_public_housing_act" id="kids_public_housing_actY" value="Yes" required />Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_public_housing_act" id="kids_public_housing_actN" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>9</p>
												</td>
												<td style="width: 497px;">
													<p>Federally-Funded Medicaid for an emergency medical
														condition</p>
												</td>
												<td style="width: 113px;">
													<p>
													    <c:if test="${pbcDto.applicantObj.ffm_medicalemergency eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="ffm_medicalemergency" id="ffm_medicalemergencyY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_medicalemergency" id="ffm_medicalemergencyN" value="No" />No</label>
														</c:if>
														    <c:if test="${pbcDto.applicantObj.ffm_medicalemergency eq 'No'}">
														<label for="q1-y"><input type="radio" name="ffm_medicalemergency" id="ffm_medicalemergencyY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_medicalemergency" id="ffm_medicalemergencyN" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													 <c:if test="${pbcDto.spouseObj.ffm_medicalemergency eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="spouse_ffm_medicalemergency" id="spouse_ffm_medicalemergencyY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_ffm_medicalemergency" id="spouse_ffm_medicalemergencyN" value="No" />No</label>
														</c:if>
														<c:if test="${pbcDto.spouseObj.ffm_medicalemergency eq 'No'}">
														<label for="q1-y"><input type="radio" name="spouse_ffm_medicalemergency" id="spouse_ffm_medicalemergencyY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_ffm_medicalemergency" id="spouse_ffm_medicalemergencyN" value="No" checked />No</label>
														</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													 <c:if test="${pbcDto.childObj.ffm_medicalemergency eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="kids_ffm_medicalemergency" id="kids_ffm_medicalemergencyY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_ffm_medicalemergency" id="kids_ffm_medicalemergencyN" value="No" />No</label>
														</c:if>
														<c:if test="${pbcDto.childObj.ffm_medicalemergency eq 'No'}">
														<label for="q1-y"><input type="radio" name="kids_ffm_medicalemergency" id="kids_ffm_medicalemergencyY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_ffm_medicalemergency" id="kids_ffm_medicalemergencyN" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>10</p>
												</td>
												<td style="width: 497px;">
													<p>Federally-Funded Medicaid for a service under the
														Individuals with Disabilities Education Act (IDEA)</p>
												</td>
												<td style="width: 113px;">
													<p>
													 <c:if test="${pbcDto.applicantObj.ffm_ideact eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="ffm_ideact" id="ffm_ideactY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_ideact" id="ffm_ideactN" value="No" />No</label>
														</c:if>
														<c:if test="${pbcDto.applicantObj.ffm_ideact eq 'No'}">
														<label for="q1-y"><input type="radio" name="ffm_ideact" id="ffm_ideactY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_ideact" id="ffm_ideactN" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													 <c:if test="${pbcDto.spouseObj.ffm_ideact eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="spouse_ffm_ideact" id="spouse_ffm_ideactY" value="Yes" checked required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="spouse_ffm_ideact" id="spouse_ffm_ideactN" value="No" />No</label>
														 </c:if>
														  <c:if test="${pbcDto.spouseObj.ffm_ideact eq 'No'}">
														<label for="q1-y"><input type="radio" name="spouse_ffm_ideact" id="spouse_ffm_ideactY" value="Yes"  required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="spouse_ffm_ideact" id="spouse_ffm_ideactN" value="No" checked/>No</label>
														 </c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													<c:if test="${pbcDto.childObj.ffm_ideact eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="kids_ffm_ideact" id="kids_ffm_ideactY" value="Yes" checked required />Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_ffm_ideact" id="kids_ffm_ideactN" value="No" />No</label>
														</c:if>
														<c:if test="${pbcDto.childObj.ffm_ideact eq 'No'}">
														<label for="q1-y"><input type="radio" name="kids_ffm_ideact" id="kids_ffm_ideactY" value="Yes" required />Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_ffm_ideact" id="kids_ffm_ideactN" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>11</p>
												</td>
												<td style="width: 497px;">
													<p>Federally-Funded Medicaid other school-based
														benefits or services available up to the oldest age
														eligible for secondary education under state law.</p>
												</td>
												<td style="width: 113px;">
													<p>
													<c:if test="${pbcDto.applicantObj.ffm_schoolbenefits eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="ffm_schoolbenefits" id="ffm_schoolbenefitsY" value="Yes" checked required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="ffm_schoolbenefits" id="ffm_schoolbenefitsN" value="No" />No</label>
														 </c:if>
														 <c:if test="${pbcDto.applicantObj.ffm_schoolbenefits eq 'No'}">
														<label for="q1-y"><input type="radio" name="ffm_schoolbenefits" id="ffm_schoolbenefitsY" value="Yes"  required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="ffm_schoolbenefits" id="ffm_schoolbenefitsN" value="No" checked/>No</label>
														 </c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													<c:if test="${pbcDto.spouseObj.ffm_schoolbenefits eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="spouse_ffm_schoolbenefits" id="spouse_ffm_schoolbenefitsY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_ffm_schoolbenefits" id="spouse_ffm_schoolbenefitsN" value="No" />No</label>
														</c:if>
														<c:if test="${pbcDto.spouseObj.ffm_schoolbenefits eq 'No'}">
														<label for="q1-y"><input type="radio" name="spouse_ffm_schoolbenefits" id="spouse_ffm_schoolbenefitsY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_ffm_schoolbenefits" id="spouse_ffm_schoolbenefitsN" value="No" checked />No</label>
														</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
														<c:if test="${pbcDto.childObj.ffm_schoolbenefits eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="kids_ffm_schoolbenefits" id="kids_ffm_schoolbenefitsY" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_ffm_schoolbenefits" id="kids_ffm_schoolbenefitsN" value="No" />No</label>
														</c:if>
															<c:if test="${pbcDto.childObj.ffm_schoolbenefits eq 'No'}">
														<label for="q1-y"><input type="radio" name="kids_ffm_schoolbenefits" id="kids_ffm_schoolbenefitsY" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_ffm_schoolbenefits" id="kids_ffm_schoolbenefitsN" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>12</p>
												</td>
												<td style="width: 497px;">
													<p>Federally-Funded Medicaid while you were under the
														age of 21</p>
												</td>
												<td style="width: 113px;">
													<p>
													<c:if test="${pbcDto.applicantObj.ffm_uderage21 eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="ffm_uderage21" id="ffm_uderage21Y" value="Yes" checked required />Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_uderage21" id="ffm_uderage21N" value="No" />No</label>
														</c:if>
														<c:if test="${pbcDto.applicantObj.ffm_uderage21 eq 'No'}">
														<label for="q1-y"><input type="radio" name="ffm_uderage21" id="ffm_uderage21Y" value="Yes" required />Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_uderage21" id="ffm_uderage21N" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													<c:if test="${pbcDto.spouseObj.ffm_uderage21 eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="spouse_ffm_uderage21" id="spouse_ffm_uderage21Y" value="Yes" checked required />Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_ffm_uderage21" id="spouse_ffm_uderage21N" value="No" />No</label>
														</c:if>
														<c:if test="${pbcDto.spouseObj.ffm_uderage21 eq 'No'}">
														<label for="q1-y"><input type="radio" name="spouse_ffm_uderage21" id="spouse_ffm_uderage21Y" value="Yes" required />Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_ffm_uderage21" id="spouse_ffm_uderage21N" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													<c:if test="${pbcDto.childObj.ffm_uderage21 eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="kids_ffm_uderage21" id="kids_ffm_uderage21Y" value="Yes" checked required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="kids_ffm_uderage21" id="kids_ffm_uderage21N" value="No" />No</label>
														 </c:if>
														 <c:if test="${pbcDto.childObj.ffm_uderage21 eq 'No'}">
														<label for="q1-y"><input type="radio" name="kids_ffm_uderage21" id="kids_ffm_uderage21Y" value="Yes"  required/>Yes</label>
														 <label for="q1-n"><input type="radio" name="kids_ffm_uderage21" id="kids_ffm_uderage21N" value="No" checked/>No</label>
														 </c:if>
													</p>
												</td>
											</tr>
											<tr>
												<td style="width: 52px;">
													<p>13</p>
												</td>
												<td style="width: 497px;">
													<p>Federally-Funded Medicaid while you were pregnant or
														during the 60 day period following the last day of
														pregnancy.</p>
												</td>
												<td style="width: 113px;">
													<p>
													<c:if test="${pbcDto.applicantObj.ffm_pregnant_period60 eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="ffm_pregnant_period60" id="ffm_pregnant_period60Y" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_pregnant_period60" id="ffm_pregnant_period60N" value="No" />No</label>
														</c:if>
														<c:if test="${pbcDto.applicantObj.ffm_pregnant_period60 eq 'No'}">
														<label for="q1-y"><input type="radio" name="ffm_pregnant_period60" id="ffm_pregnant_period60Y" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="ffm_pregnant_period60" id="ffm_pregnant_period60N" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													<c:if test="${pbcDto.spouseObj.ffm_pregnant_period60 eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="spouse_ffm_pregnant_period60" id="spouse_ffm_pregnant_period60Y" value="Yes" checked required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_ffm_pregnant_period60" id="spouse_ffm_pregnant_period60N" value="No" />No</label>
														</c:if>
															<c:if test="${pbcDto.spouseObj.ffm_pregnant_period60 eq 'No'}">
														<label for="q1-y"><input type="radio" name="spouse_ffm_pregnant_period60" id="spouse_ffm_pregnant_period60Y" value="Yes"  required/>Yes</label> 
														<label for="q1-n"><input type="radio" name="spouse_ffm_pregnant_period60" id="spouse_ffm_pregnant_period60N" value="No" checked/>No</label>
														</c:if>
													</p>
												</td>
												<td style="width: 103px;">
													<p>
													<c:if test="${pbcDto.childObj.ffm_pregnant_period60 eq 'Yes'}">
														<label for="q1-y"><input type="radio" name="kids_ffm_pregnant_period60" id="kids_ffm_pregnant_period60Y" value="Yes" checked required />Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_ffm_pregnant_period60" id="kids_ffm_pregnant_period60N" value="No" />No</label>
														</c:if>
																<c:if test="${pbcDto.childObj.ffm_pregnant_period60 eq 'No'}">
														<label for="q1-y"><input type="radio" name="kids_ffm_pregnant_period60" id="kids_ffm_pregnant_period60Y" value="Yes" required />Yes</label> 
														<label for="q1-n"><input type="radio" name="kids_ffm_pregnant_period60" id="kids_ffm_pregnant_period60N" value="No" checked/>No</label>
														</c:if>
													</p>
												</td> 
											</tr>
										</tbody>
									</table>
									<c:if test="${role == 1}">
								<center>
									<div class="text-center ml-12">
									<button type="submit" class="btn btn-info btn-sm"
										id="updatebtn" >Update</button>
									<button type="reset" class="btn btn-info btn-sm"
										id="btn-colorb" onClick="window.location.reload()">Reset</button>
									<a href="mydocuments" class="btn btn-default"
										style="padding: 7px; background-color: grey; color: white; text-transform: INITIAL; line-height: 0.728571;"
										id="reset">Back</a>
								   </div>
								   </center>
								   </c:if>
								   </div>
								   </form>
								   </c:if> --%>
									</div>
							</div>
				</div>
						</div>
						<div class="row">
				
						<c:if test="${role == 4 && pbcDto.initiateObj.status=='Active'}">
					<center>
						<div>
						<form  action="updateimmiformstaus" method="post" >
						<input type="hidden" id="form_type" name="form_type" value="Public Benefits Checklist">
						<input type="hidden"  name="candidate_id" value="${candId}">
			
								
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
								<div> <button type="button" id="CchistoryId" data-toggle="modal"  data-target='#commentshistory' 
									style='letter-spacing: 1px; background-color: #15aabf; color: white;' class="btn btn-info btn-sm addButton" 
									onclick="viewCommentHistory(${candId},'Public Benefits Checklist')"><i class="fa fa-history"></i></button></div>
							
							</div>
							  <div class="form-group row" style="width: 160%;">
							<label for="inputPassword" class="col-sm-6 control-label"><Span style="color:red;"></Span></label>
							<div class="col-sm-5">
								<button type="submit" class="btn btn-primary btn-sm" onclick=" ">Submit</button>
								<!-- <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button> -->
								<a href="immigration" class="btn btn-secondary btn-sm" >Back</a>
								</div>
							</div> 
					</form>
			</div></center>
						</c:if>
						</div>
						</div>
					</div>
				</div>
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
			<!-- .animated -->
					<div class="modal fade" id="commentshistory" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 160px;">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content" style="width:120%;">
					<div class="modal-header" style="padding: .5rem;">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<center>
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 15px">
								<b>Comments History Details</b>
							</h5>
						</center>
					</div>
					<form class='form form-horizontal validate-form'
						action="/" id="saveCommentsForm" method="post"
						style='margin-bottom: 0;' enctype="multipart/form-data">
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
					</form>
				</div>
			</div>
		</div>

	<script src="resources/js/js/jquery-2.1.4.min.js"></script>
	<script src="resources/js/newjs/bootstrap.min.js"></script>
	<script src="resources/js/newjs/formValidation.min.js"></script>
	<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
	<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
	<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
		<script src="resources/preDefined/goback.js"></script>
    <!--  <script type="text/javascript">
		$("#btnSubmit").click(function(event) {
			event.preventDefault();
			
				//$("#btnSubmit").attr("disabled", true);
				var form = $('#savepublicbenefits')[0];
				var data = new FormData(form);
			
				$.ajax({
					url : "savepublicbenefits", //this is the submit URL
					type : "POST",
					enctype : 'multipart/form-data',
					data : data,
					processData : false,
					contentType : false,
					cache : false,
					success : function(data) {
						alert(data)
					}
				});
			
		});
		
	</script>-->
	<script >
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
			}else{
				 window.location.href="loginpage";
			}
		});
	}
	
	if($("#roleid").val()==4){
	    $("#savepublicbenefits :input").attr("disabled", true);
	}
	</script>


</body> 
</html>
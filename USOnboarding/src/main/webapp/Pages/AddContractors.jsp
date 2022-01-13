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
</style>

<body class="sidebar-mini fixed">
    <div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">US Onboarding- Add Consultants</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-md-8 col-sm-12">
										<fieldset>
										<form action="/" method="post" id="formid" class="form-horizontal">
										<input type="hidden" name="emptype" id="emptype" value="${emptype}">
									<input type="hidden" name="role" id="role" value="${role}">
									<input type="hidden" name="dept" id="dept" value="${dept}">
										
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>SSN Number</label>
												<div class="col-sm-4">
													<input id="ssn_emp" type="text"  title="Enter Valid SSN" maxlength="11" 
													autocomplete="off" placeholder="Enter SSN Number as AAA-GG-SSSS" name="ssn_emp" class="form-control" required>
													<span  style="color:red;" id="ssnshow"></span>
												</div>
											</div>
											<!-- data-masked-input="999-99-9999"  onchange="checkSSN()" pattern="^(?!000|666)[0-8][0-9]{2}-(?!00)[0-9]{2}-(?!0{4})[0-9]{4}$" -->
											
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Consultant FirstName</label>
												<div class="col-sm-4">
													<input id="FullName" type="text" title="only alphabets are allowed"  minlength="2" maxlength="40"
													autocomplete="off" placeholder="First Name" name="FullName" class="form-control"  required>
												</div><!--  -->
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Middle Name</label>
												<div class="col-sm-4">
													<input id="middleName" type="text" title="only alphabets are allowed"  minlength="1" maxlength="40"
													autocomplete="off" placeholder="Middle Name" name="middleName" class="form-control"  >
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Last Name</label>
												<div class="col-sm-4">
													<input id="familyName" type="text" title="only alphabets are allowed" minlength="2" maxlength="40"
													autocomplete="off" placeholder="Last Name" name="familyName" class="form-control"  required>
												</div>
											</div>
											<div class="form-group row" style="display:none;" id="appenduser">
											<input type="hidden" name="autouname" id="autouname" value="">
										    </div> 
										   <!--  <div class="form-group row" style="display:none;" id="empnumer">
											<input type="hidden" name="autoempnumer" id="autoempnumer" value="">
										    </div>  onchange="autoEmpNumber()"  -->
										    
										    
										 	 <div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Consultant Type</label>
											   <div class="col-sm-4">
											     <select name="Emp_type" class="form-control text-left" id="Emp_type" required>
										             <option value="">--SELECT EMPLOYEE TYPE--</option>
										             <option value="C2C">C2C</option>
										             <option value="1099">1099</option>
										         </select>
										      </div>
										    </div>
										    <!-- onchange="ConsultantType()" -->
										    <div class="form-group row" id="c2c" style="display:none;">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>C2C Type</label>
											   <div class="col-sm-4">
                                                    <label>Direct</label><input type="radio" name="c2cType" value="Direct"/><label>Pass Through</label><input type="radio" name="c2cType" value="Pass_Through"/><br>
												</div>
										    </div>
									<div class="form-group row w2administrationemployees boxx">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Work Authorization</label>
											   <div class="col-sm-4">
											     <select name="work_auth" autoComplete="off" class="form-control text-left" id="work_auth" required>
										             <%--  <option value="">--Select type--</option> 
										  			<c:forEach var="wa" items="${waList}">
														  <option value="${wa.work_auth_name}">${wa.work_auth_name}</option>
													</c:forEach> --%>
										         </select>
										      </div>
										    </div>	
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Recruiter Name</label>
												<div class="col-sm-4">
							 						<input id="rec_name" type="text" title="only alphabets are allowed" minlength="2" maxlength="100"
													autocomplete="off" placeholder="Recruiter Name" name="rec_name" class="form-control" >
												</div>
											</div>
											<c:choose>
											<c:when test="${contractTeam.size() > 0}">
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Contract Team Name</label>
												<div class="col-sm-4">
												 <select name="cont_team_name" autoComplete="off" class="form-control text-left"  id="cont_team_name" >
														<option value="">Select Contract Team Name</option>
														<c:forEach var="ctName" items="${contractTeam}">
														<option value="${ctName.ctName}">${ctName.ctName}</option>
														</c:forEach>
										         </select>
												</div>
											 </div>
											</c:when>
											<c:otherwise>
											   <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Contract Team Name</label> 
												<div class="col-sm-4">
													<input id="cont_team_name" type="text" title="only alphabets are allowed" minlength="2" maxlength="20"
													autocomplete="off" placeholder="Contract Team Name" name="cont_team_name" class="form-control">
												</div>
											   </div>
											</c:otherwise>
											</c:choose>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Personal e-mail ID</label>
												<div class="col-sm-4">
													<input id="email_id" type="text" title="Enter Valid e-mail format ex:xyz@gmail.com" minlength="8" maxlength="80"
													autocomplete="off" placeholder="Personal e-mail ID" name="email_id" class="form-control"  required>
												<Span id="emailspan" style="color:red;"></Span>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Personal Contact No</label>
												<div class="col-sm-4">
													<input id="phne_no" type="text" minlength="12" maxlength="12" title="Enter Only Digits" data-masked-input="999-999-9999"
													autocomplete="off" placeholder="Personal Contact No" name="phne_no" class="form-control"  required><!-- data-masked-input="999-999-9999" -->
												 <Span id="phonespan" style="color:red;"></Span>
												</div>
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label">Alternative Contact No 1</label>
												<div class="col-sm-4 col-md-4">
													<input id="phne_no2" type="text"  minlength="12" maxlength="12" title="Enter Contact Number" 
													 autocomplete="off" placeholder="Alternative Contact number 1" name="phne_no2" class="form-control"> 
												<Span id="phonespan2" style="color:red;"></Span>
												</div>
												<div class="col-sm-3 col-md-3" style="padding-right:40px;">
     											 	<label>Work</label>&nbsp;<input type="radio" name="ctype2" value="Work"/>&nbsp;<label>Other</label>&nbsp;<input type="radio" name="ctype2" value="Other"/>
    											</div> 
											</div>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label">Alternative Contact No 2</label>
												<div class="col-sm-4 col-md-4">
													<input id="phne_no3" type="text"  minlength="12" maxlength="12" title="Enter Contact Number" 
													 autocomplete="off" placeholder="Alternative Contact number 2" name="phne_no3" class="form-control"> <!-- data-masked-input="999-999-9999"  -->
												<Span id="phonespan3" style="color:red;"></Span>
												</div>
												<div class="col-sm-3 col-md-3" style="padding-right:40px;">
     												<label>Work</label>&nbsp;<input type="radio" name="ctype3" value="Work"/>&nbsp;<label>Other</label>&nbsp;<input type="radio" name="ctype3" value="Other"/>
    											</div> 
											</div>							
											
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Date Of Birth</label>
											<div class="col-sm-4">
												<input type="text" id="dob" class="form-control text-left"  title="Enter date in MM/DD/YYYY format only" autocomplete="off"
												 name="dob" placeholder="Date Of Birth" class="form-control" required  >
											</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label">
												<Span id="mand" style="color:red;">*</Span>Date Of Joining</label>
											<div class="col-sm-4">
												<input type="text" id="joining_Date" class="form-control text-left"  autocomplete="off"
												title="Enter date in MM/DD/YYYY format only" 
												 name="joining_Date" placeholder="Date Of Joining"  class="form-control" >
											</div>
											</div>
											<div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>BGC Type</label>
											   <div class="col-sm-4">
											     <select name="bgc" class="form-control text-left" id="bgcId"  >
										             <option value="">--SELECT BGC--</option>
										             <option value="PreOnboarding">Pre Onboarding</option>
										             <option value="PostOnboarding">Post Onboarding</option>
										         </select>
										      </div>
										    </div> 
										   <!-- <div class="form-group row" id="dj"  style="display:none;">
												<label for="inputPassword" class="col-sm-4 control-label">
												<Span id="mand" style="color:red;">*</Span>Date Of Joining</label>
											<div class="col-sm-4">
												<input type="text" id="joining_Date" class="form-control text-left"  autocomplete="off"
												title="Enter date in MM/DD/YYYY format only" 
												 name="joining_Date" placeholder="Date Of Joining"  class="form-control" >
											</div>
											</div> -->
																					
											 <div class="form-group row">
												<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;"></Span>Job Title</label>
												<div class="col-sm-4">
													<input id="designation" type="text" autocomplete="off" minlength="2" maxlength="100"
                                                      title="Enter only Characters and numbers" placeholder="Job Title" name="designation" class="form-control">
												</div>
											</div>
											<!-- <div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Timesheet Type</label>
											   <div class="col-sm-4">
											   <select name="payrolltype" class="form-control text-left" id="payrolltype">
										             <option value="">--Select Timesheet Type--</option>
										             <option value="Weekly">Weekly</option>
										            <option value="Bi-Weekly1">Bi-Weekly1</option>
										             <option value="Bi-Weekly2">Bi-Weekly2</option>
										             <option value="Semi-Monthly">Semi-Monthly</option>
										             <option value="Monthly">Monthly</option>
										         </select>
											   		
												</div>
										    </div>-->
										    
										    <div class="form-group row">
											<label for="inputPassword" class="col-sm-4 control-label"><Span style="color:red;">*</Span>Validation Required By</label>
											   <div class="col-sm-4">
											   		<label>Manager</label>&nbsp;<input type="checkbox" id="mgrvalidate" name="validation" value="Manager" checked disabled/>&nbsp;<label>HR</label>&nbsp;<input type="checkbox" name="validation" id="hrvalidate" value="HR" />&nbsp;<label>Audit</label>&nbsp;<input type="checkbox"  name="validation" id="auditvalidate" value="Audit" />
													 <br>
												</div>
										    </div>
										<input type="hidden"  name="validateby"  id="validateby">
									     <div class="text-center ml-4">										
												<input type="button" class="btn btn-default" id="submitid" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Submit"  onclick="btnClick()">
												<a href="" class="btn btn-default" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;" id="reset">Reset</a>
											</div>
										</form>		
							</fieldset>
					    	  </div>
					    </div>
				    </div>
			    </div>
			    
			    <input type="hidden"  name="un"  id="un" >
			<input type="hidden"  name="canid"  id="canid" >
			
			
	<form action="searchlist" method="post" id="bformid" style="display:none">
				<input type="hidden"  name="semp_type"  id="etype" value="${semp_type}">
				<input type="hidden" name="susername"  id="euser" value="${susername}">
  	        	<input type="hidden"  name="sfullname"  id="efullname" value="${sfullname}">
			    <input type="hidden"  name="spendingdocs"   id="edocs" value="${spendingdocs}">
			    <input type="hidden" name="s_subtype"  id="esubtpe" value="${s_subtype}">
		  </form> 
		  
		  
		     </div>
    	 </div>
    	 
    	 <div class="modal" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true"
				style="top: 150px;">
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
									<b>Employee Details</b>
								</h5>
							</center>
						</div>
						<center>
							<div class="modal-body">
								<table>
									<tr>
										<th>First Name</th>
										<td style="padding: 6px;"><strong><span
												style="color: red" id="fName"></span></strong></td>
									</tr>
									<tr>
										<th>Middle Name</th>
										<td style="padding: 6px;"><strong><span
												style="color: red" id="mName"></span></strong></td>
									</tr>
									<tr>
										<th>Last Name</th>
										<td style="padding: 6px;"><strong><span
												style="color: red" id="sName"></span></strong></td>
									</tr>
									<tr>
										<th>User Name</th>
										<td style="padding: 6px;"><strong><span
												style="color: red" id="uname"></span></strong></td>
									</tr>

								</table>
							</div>
							<b><span style="color: red">Please Verify Employee
									Information. Do you want to Continue?</span></b><br>
						</center>
						<div class="modal-footer">
							<button class="btn btn-primary btn-sm" type="submit" id="mybutton"
								value="Go" onclick="submitForm()" >
								<strong>Yes</strong>
							</button>
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
    </div>
</div>
</div>
			
    <!-- Javascripts-->
<script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script src="resources/preDefined/goback.js"></script>
<script>
$('#formid').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {	       
    	ssn_emp: {
            validators: {
            	notEmpty: {
                    message: 'SSN number  is mandatory'
                }
            }
        },
        FullName: {
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
                stringLength: {
                    min: 1,
                    max: 40,
                    message: 'Middle Name must be more than 1 and less than 40 characters long'
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
        Emp_type:{
            validators: {
            	notEmpty: {
                    message: 'Please select Consultant type'
                }
            }
        },
        c2cType:{
          enabled: false,
            validators: {
            	notEmpty: {
                    message: 'Please Choose C2C type'
                }
            }
        },
        rec_name:{
            validators: {
            stringLength: {
            min: 2,
            max: 100,
            message: 'Recruiter Name must be more than 2 and less than 100 characters long'
           },
             regexp: {
            regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
            message: 'Recruiter Name accepts alphabets and Space allowed but is not at beginning or end of the word'
               }
           }
       },
       cont_team_name:{
            validators: {
            	isEmpty: {
                    message: 'Contract Team Name is mandatory'
                },
            stringLength: {
            min: 2,
            max: 20,
            message: 'Contract Team Name must be more than 2 and less than 20 characters long'
           },
             regexp: {
            regexp: /^[a-zA-Z]+( [a-zA-Z]+)*$/,
            message: 'Contract Team Name accepts alphabets and and Space allowed but is not at beginning or end of the word'
             }
          }
     },
        
        email_id:{
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
             	 //regexp: /[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/,
                 regexp: /^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$/,
                 message: 'Please enter valid e-mail ID'
             }
           }
      },
       
        phne_no:{
            validators: {
            	notEmpty: {
                    message: 'Contact Number is mandatory'
            	 },
                 stringLength: {
                 min: 12,
                 max: 12,
                 message: 'Contact Number min length can be 10 and max length can be 10'
                },
                regexp: {
                	regexp: /^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$/,
                    message: 'Please enter valid Contact Number'
                },
            }
        },
        dob: {
            validators: {
                notEmpty: {
                    message: 'Date of Birth is mandatory'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter DOB in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY',
                    message: 'DOB is not a valid'
                }
            }
        },
        work_auth:{
            validators: {
            	notEmpty: {
                    message: 'Please select Work authorization type'
                }
            }
        },
        bgc:{
            validators: {
            	isEmpty: {
                    message: 'Please select BGC Type'
                }
            }
        },
       joining_Date:{
            validators: {
            	notEmpty: {
                    message: 'Joining Date is mandatory'
                },
                regexp: {
                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
                    message: 'Please enter Joining Date in MM/DD/YYYY format'
                },
                date: {
                    format: 'MM/DD/YYYY', 
                    message: 'Joining Date is not a valid'
                }
            }
        },
        /* payrolltype:{
            validators: {
            	notEmpty: {
                    message: 'Please Choose timesheet type'
                }
            }
        }, */
        validateby:{
            validators: {
            	notEmpty: {
                    message: 'Please check validate by'
                }
            }
        }, 
        designation:{
            validators: {
            	isEmpty: {
                    message: 'Title is mandatory'
            	 },
                 stringLength: {
                 min: 2,
                 max: 100,
                 message: 'Title must be more than 2 and less than 100 characters long'
                },
                  regexp: {
                 regexp: /^(?!\d\s+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &():\/\\-]*)?$/,
                 message: 'Title accepts alphanumeric, Specical characters like &-()/: allowed and Space allowed but is not at beginning or end of the word'
                  }
               }
           },
           phne_no2 : {
           	enabled: false,
               validators: {
               	notEmpty: {
                       message: 'Contact number is mandatory'
                   },
                   stringLength: {
                       min: 12,
                       max: 12,
                       message: 'Contact Number should be 10 numbers'
                   },
                   regexp: {
                      regexp: /^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$/,
                      message: 'Please enter valid Contact Number'
                   },
                   
               }
           
           },
           phne_no3 : {
           	enabled: false,
               validators: {
               	notEmpty: {
                       message: 'Contact number is mandatory'
                   },
                   stringLength: {
                       min: 12,
                       max: 12,
                       message: 'Contact Number should be 10 numbers'
                   },
                   regexp: {
                      regexp: /^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$/,
                      message: 'Please enter valid Contact Number'
                   },
                   
               }
           
           },
           ctype2:{
           	enabled: false,
               validators: {
               	notEmpty: {
                       message: 'Please Choose  Contact type'
                   }
               }
           },
           ctype3:{
           	enabled: false,
               validators: {
               	notEmpty: { 
                       message: 'Please Choose  Contact type'
                   }
               }
           }
     }
})
.on('change', '[name="phne_no2"]', function(e) {
    var phne_no2 =$("#phne_no2").val();
    if(phne_no2!=""){
		   $('#formid').bootstrapValidator('enableFieldValidators','ctype2',true);
		   $('#formid').bootstrapValidator('enableFieldValidators','phne_no2',true);
     } else {
		   $('#formid').bootstrapValidator('enableFieldValidators','ctype2',false);
		   $('#formid').bootstrapValidator('enableFieldValidators','phne_no2',false);
      } 
   })
   /* .on('change', '[name="email_id"]', function(e) {
   var email_id =$("#email_id").val();
   $.ajax({
   	type : "GET",
       asyn : false,
       contentType: "text/plain", // NOT dataType!
       url  : "checkEmail?email="+email_id+"",
       success  : function(response){
    	   if(response!=""){
    		   $('#emailspan').text("Email id already exists");
    		   $("#submitid").attr("disabled", true);
    	   }else{
    		   $('#emailspan').text('');
    		   $("#submitid").attr("disabled", false);  
    	   }
         }
	 });
		  //
    })
    .on('change', '[name="phne_no"]', function(e) {
   var phne_no =$("#phne_no").val();
   $.ajax({
	    	type : "GET",
	        asyn : false,
	        contentType: "text/plain", // NOT dataType!
	        url  : "checkPhoneNo?phone="+phne_no+"",
	        success  : function(response){
	        	if(response!=""){
	     		   $('#phonespan').text("Contact number already exists");
	     		  $("#submitid").attr("disabled", true);
	     	   }else{
	     		  $('#phonespan').text('');
	     		 $("#submitid").attr("disabled", false);  
	     	   }
	          }
		 });
		  // $('#formid').bootstrapValidator('enableFieldValidators','w2admin_details',true);
    }) */
  .on('change', '[name="phne_no3"]', function(e) {
    var phne_no3 =$("#phne_no3").val();
    if(phne_no3!=""){
		   $('#formid').bootstrapValidator('enableFieldValidators','ctype3',true);
		   $('#formid').bootstrapValidator('enableFieldValidators','phne_no3',true);
     }else{
		   $('#formid').bootstrapValidator('enableFieldValidators','ctype3',false);
		   $('#formid').bootstrapValidator('enableFieldValidators','phne_no3',false);
      } 
   })
 .on('click', '[name="ctype3"]', function(e) {
	 	var ctype3=$("input[name='ctype3']:checked").val();
	if (ctype3!=""){
		   $('#formid').bootstrapValidator('enableFieldValidators','phne_no3',true);
	   }else{
		   $('#formid').bootstrapValidator('enableFieldValidators','phne_no3',false);
	   }
  })
   .on('click', '[name="ctype2"]', function(e) {
	   var ctype2=$("input[name='ctype2']:checked").val();
	   if (ctype2!=""){
		   $('#formid').bootstrapValidator('enableFieldValidators','phne_no2',true);
	   }else{
		   $('#formid').bootstrapValidator('enableFieldValidators','phne_no2',false);
	   }
  })
 /* .on('change', '[name="bgc"]', function(e) {
	   if ($(this).val()=='PreOnboarding') {
		   $('#formid').bootstrapValidator('enableFieldValidators','joining_Date',true);
       } else if($(this).val()=='PostOnboarding'){
    	   $('#formid').bootstrapValidator('enableFieldValidators', 'joining_Date',false);
       } 
     }) */
.on('change', '[name="Emp_type"]', function(e) {
	   if ($("#Emp_type").val()=='C2C') {
		   $("#c2c").show();
		   $('#formid').bootstrapValidator('enableFieldValidators','c2cType',true);
		     fngetWorkAutharization($("#Emp_type").val());
         }else{
        	 $("#c2c").hide();
        	 $('#formid').bootstrapValidator('enableFieldValidators','c2cType',false);
        	 fngetWorkAutharization($("#Emp_type").val());
         }
});
function fngetWorkAutharization(type){
	getsesVal().done(function(data){
		if(data!=""){
	   $.ajax({
		    url:"getWorkAutharization",
	    	type : "GET",
	        asyn : false,
	        data: {"emptype":type},
	        success  : function(response){
	        	$('#work_auth').empty();
	        	$('#work_auth').append($('<option/>').attr("value", '').text("--Select type--"));
	        	 for(var i=0;i<response.length;i++)
		     	   {
		        	$('#work_auth').append($('<option/>').attr("value", response[i].work_auth_name).text(response[i].work_auth_name));
		           } 
	            }
	   });
   }else{
			 window.location.href="loginpage";
		 }
  });
}
</script>  
<script>  
$("#joining_Date").attr("disabled", true);
var emptype=$("#emptype").val(); 
var role=$("#role").val();
var dept=$("#dept").val();
var date = new Date();
	date.setDate(date.getDate());
  //  $("#dob").datepicker({
  $('input[name="dob"]').datepicker({
		changeMonth:true,
		changeYear:true,
		minDate: "-70Y",
		endDate: date,
		yearRange: "1950:2000"
    }).on('changeDate', function(selected) {
	     $("#joining_Date").attr("disabled", false);
	    $('#formid').formValidation('revalidateField', 'dob');
    });
    
    $("#dob").on('change', function(){
    	   var dob1=$('#dob').val();
    	   if(dob1!=""){
    	     var minDate=new Date(dob1);
    	     $('#joining_Date').datepicker('setStartDate', minDate);
    	   }else{
    		   $("#joining_Date").attr("disabled", true);
    		   $('#joining_Date').val('').datepicker('update');
    	   }
    });
  
    $("#joining_Date").datepicker({
		changeMonth:true,
		changeYear:true,
	})
    .on('changeDate', function(e) {
        $('#formid').formValidation('revalidateField', 'joining_Date');
    });  
</script>  
<script type="text/javascript">
/*  function ConsultantType(){
	   var emptype=$('#Emp_type').val();
	   if (emptype == "C2C") {
	    	  $("#c2c").show();
	    	  document.getElementById('directId').required=true;
	    }
	    else{
	    	 $("#c2c").hide();
	    	 document.getElementById('directId').required=false;
	    }
	 } */
</script>
	    
<script>
		function btnClick(){
			getsesVal().done(function(data){
				if(data!=""){
			$('#formid').formValidation('validate');
			if( !$('#formid').data('formValidation').isValid())
				 {
				  // alert("Not Valid");
				 }
			else{
				var phne1=$('#phonespan').text();
				var phne2=$('#phonespan2').text();
				var phne3=$('#phonespan3').text();
				var emailspan=$('#emailspan').text();
				if(phne1!="" || phne2!="" || phne3!="" || emailspan!=""){
					
				}else{
			    var fullname = document.getElementById("FullName").value;
				var middleName = document.getElementById("middleName").value;
				var familyName = document.getElementById("familyName").value;
				 $.ajax({
				    	type : "GET",
				        asyn : false,
				        contentType: "application/json", // NOT dataType!
				        data:{fullname:fullname,middleName:middleName,familyName:familyName},
			        	url:"checkUserName", 
				        success  : function(response){
				        	$('#fName').text(fullname);
				        	$('#mName').text(middleName);
				        	$('#sName').text(familyName);
				        	$('#uname').text(response.toLowerCase());
				        	$('#autouname').val(response);
				        	$('#myModal').modal('show');
				            }
				   });
			}
			}
		}else{
					 window.location.href="loginpage";
				 }
		 });
	}
function submitForm(){
	getsesVal().done(function(data){
	if(data!=""){
		//	document.getElementById("formid").submit();
		
	var mgrvalidate=$('#mgrvalidate').is(":checked");
	var hrvalidate=$ ('#hrvalidate').is(":checked");
	var auditvalidate=$('#auditvalidate').is(":checked");

	/* var weekly=$('#weekly').is(":checked");
	var semimonthly=$('#semimonthly').is(":checked");
	var payroll_type="";
	if(weekly==true){
		payroll_type="weekly";
		
	}else{
		payroll_type="semimonthly";
		}
 */
	if(mgrvalidate==true && hrvalidate==true && auditvalidate==true){
		$('#validateby').val(3);
		}else if(mgrvalidate==true && hrvalidate==true){
			$('#validateby').val(2);
			}else{
				$('#validateby').val(1);
				}
	
		    $('#myModal').modal('hide');
			$("#submitid").attr("disabled",true);
			var firstName=$('#FullName').val();
			var middleName=$('#middleName').val();
			var familyName=$('#familyName').val();
			var ssn_emp=$('#ssn_emp').val();
			var rec_name=$('#rec_name').val();
			var email_id=$('#email_id').val();
			var phne_no=$('#phne_no').val();
			var dob=$('#dob').val();
			var emp_type=$('#Emp_type').val();
			var bgcType=$('#bgcId').val();
			var validateby=$('#validateby').val();
			
			//var payroll_type=$('#validateby').val();
			/* if (bgcType=="PreOnboarding") {
				 
		    }
		    else if(bgcType=="PostOnboarding"){
		    	
		    } */
			var designation=$('#designation').val();
			var cont_team_name=$('#cont_team_name').val();
			var work_auth=$('#work_auth').val();
			var joining_Date=$('#joining_Date').val();
			var autouname=$('#autouname').val();
			var c2c_type=$("input[name='c2cType']:checked").val();
			var phne_no2=$('#phne_no2').val();
			var phne_no3=$('#phne_no3').val();
			var ctype2=$('#ctype2').val();
			var ctype3=$('#ctype3').val();
			var fullName=firstName+" "+familyName;
			var joiningDate = new Date(joining_Date);
		//	var joining_Date = $("#joining_Date").val() + ' '+ moment().format('h:mm A'); 
			var contractors = {
					fullName: fullName,
					first_name : firstName,
					middle_name : middleName,
					family_name : familyName,
					ssn_no : ssn_emp,
					dob : dob,
					contact_no1 : phne_no,
					email: email_id,
					contact_no2:phne_no2,
					contact_no3:phne_no3,
					contact_no_type2:ctype2,
					contact_no_type3:ctype3
			 }
			var candidateDetial={
					c2c_type : c2c_type,
					bgc_type : bgcType,
					work_authorization : work_auth,
					contact_team_person : cont_team_name,
					emp_type : emp_type,
					recruiter_name : rec_name,
					designation : designation,
					joining_date : joiningDate,
					//payroll_type : payroll_type,
					validateby_flag : validateby,
			   }
			
			var model = {  
		            "empbasic": contractors,  
		            "candidateInfo": candidateDetial  
		           }
			
			$.ajax({
				type : "Post",
				url : "saveContrators?autouname="+autouname+"",
				cache : false,
				async : false,
				contentType : 'application/json',
				data : JSON.stringify(model),
				success : function(response) {
					   if(response!=null || response!=""){
						     var message=response.message;
				   	         var candidateId=response.candidateId;
				   	         var emp_type=response.empType;
				   	      	  alert(message);
			   	            	   window.location.href="addConsultantDocs?candidate_id="+candidateId+"&empType="+emp_type+"";
				   	   	    }
				   	        else{
				   	          window.location.href="loginpage";
				   	   	        }
				      },
				     error : function() {
				   }
			     });
	}else{
		 window.location.href="loginpage";
	   }
  });
}
function closeModal(){
			$ ('#myModal').hide();
		}
	</script>
 <!-- <script type="text/javascript">
	$(function () {
			  $("#bgcId").change(function () {
				  if ($(this).val() == "PreOnboarding") {
					  $("#dj").show();
					  $("#mand").show();
					   document.getElementById('joining_Date').required=true;  
		            } else{
		            	 $("#dj").show();
		            	 $("#mand").hide();
		            	document.getElementById('joining_Date').required=false;
		            }
		        });
		    });
	</script>  -->
<script type="text/javascript">
$('form').on('reset', function() {
	$('#formid').data('formValidation').resetForm();
	});
$("#c2c").hide();
$('input[name="ssn_emp"]').mask('999-99-9999');
$('input[name="phne_no"]').mask('999-999-9999');
$('input[name="phne_no2"]').mask('999-999-9999');
$('input[name="phne_no3"]').mask('999-999-9999');

$("#ssn_emp").blur(function () {
    $('#formid').bootstrapValidator('revalidateField', 'ssn_emp');
});
$("#phne_no").blur(function () {
    $('#formid').bootstrapValidator('revalidateField', 'phne_no');
});
$("#phne_no2").blur(function () {
    $('#formid').bootstrapValidator('revalidateField', 'phne_no2');
});
$("#phne_no3").blur(function () {
    $('#formid').bootstrapValidator('revalidateField', 'phne_no3');
});
$("#email_id").blur(function () {
    $('#formid').bootstrapValidator('revalidateField', 'email_id');
});


var date = new Date();
date.setDate(date.getDate());

var textInput = document.getElementById('ssn_emp');
var timeout = null;
textInput.onkeyup = function (e) {
clearTimeout(timeout);
timeout = setTimeout(function () {
    var ssn_emp=$('#ssn_emp').val();
    getsesVal().done(function(data){
   if(data!=""){
    if(ssn_emp==""){
    	$('#ssnshow').text('');
    	 $("#submitid").attr("disabled", false);
    }else{
    	var regex = new RegExp("^(?!\\b(\\d)\\1+-(\\d)\\1+-(\\d)\\1+\\b)(?!123-45-6789|219-09-9999|078-05-1120)(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$");
        if(!regex.test(ssn_emp)){
    	   $('#ssnshow').html("<font color=red>Not a valid SSN</font>");
    	   $("#submitid").attr("disabled", true);
        }else{
        	 $.ajax({
     	    	type : "GET",
     	        asyn : false,
     	        contentType: "text/plain", // NOT dataType!
     	        url  : "ssncheck?ssn_emp="+ssn_emp+"",
     	        //data: JSON.stringify(data),
     	        success  : function(response){
     	        	$('#un').val(response.userName);
	        		$('#canid').val(response.candidate_id);
	        		
	        		if(response!=""){
	        			$.ajax({
	   		   	 	    	type : "GET",
	   		   	 	        asyn : false,
	   		   	 	        contentType: "application/json", // NOT dataType!
	   		   	 	        url  : "getempTypeByCanId?canid="+response.candidate_id+"",
	   		   	 	        success  : function(resEtype){
	        			if(dept==1&&emptype=="Admin"&&role==4){ 
     		        		$('#ssnshow').html("Found a record with this SSN"+'<a href="#" onclick="getEmployee()"><font color="blue">ClickHere</font></a>');
     		        		 $("#submitid").attr("disabled", true);
     		                 $("input[type=submit]").css("background-color", "grey");
     		        		}
     	        	else if(dept==5 && emptype=="W2 Admin" && role==2){ 
             			if(resEtype=="C2C" || resEtype=="1099" || resEtype=="W2"){
             			 $('#ssnshow').html("Found a record with this SSN"+'<a href="#" onclick="getEmployee()"><font color="blue">ClickHere</font></a>');
        	        		 $("#submitid").attr("disabled", true);
        	                 $("input[type=submit]").css("background-color", "grey");
             			}
             			 else if(resEtype=="W2 Admin"){
                 			 $('#ssnshow').html("SSN Already Exist. But contracts team doesn't have access to view W2 Administraion Employee records");
            	        		 $("#submitid").attr("disabled", true);
            	                 $("input[type=submit]").css("background-color", "grey");
                 			} 
             			else
             			{
         	        		$('#ssnshow').html("<font color=#009900>Valid SSN number</font>");	
         	                $("#submitid").attr("disabled", false);
         	        		$("#reset").attr("disabled", false);
             			}
  	   	          } 
  	   	        	}   });//emptype response ends here
  	   	        	
  	   	        	}
     	        	else{
     	        		$('#ssnshow').html("<font color=#009900>Valid SSN number</font>");	
     	                $("#submitid").attr("disabled", false);
     	        		$("#reset").attr("disabled", false);
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
function  getEmployee(){
	getsesVal().done(function(data){
		if(data!=""){
	var un=$('#un').val();
	var canid=$('#canid').val();
	$.ajax({
    	type : "GET",
        asyn : false,
        contentType: "application/json", // NOT dataType!
        url  : "getempTypeByCanId?canid="+canid+"",
        success  : function(response){
        	var etpe="";
        	if(response=='C2C' || response=='1099'){
        		etpe="Contractors";
        	}else{
        		etpe="Employees";
        	}
        	$('#etype').val(etpe);$('#euser').val(un);
    		$('#efullname').val("");$('#edocs').val("");$('#esubtpe').val("");
    		document.getElementById("bformid").submit();
        }
	    });
   }else{
			 window.location.href="loginpage";
		 }
  });
}

var emailInput = document.getElementById('email_id');
var emailtimeout = null;
emailInput.onkeyup = function (e) {
clearTimeout(emailtimeout);
emailtimeout = setTimeout(function () {
	 var email_id=$('#email_id').val();
	 getsesVal().done(function(data){
			if(data!=""){
	    if(email_id==""){
	    	 $('#emailspan').text('');
	    	 $("#submitid").attr("disabled", false);
	    }else{
	    	var regex = new RegExp("^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$");
	    if(!regex.test(email_id)){
	    	  // $('#emailspan').text("Please enter valid number");
	    	   $("#submitid").attr("disabled", true);
	    }else{
	    	 $.ajax({
	    		   	type : "GET",
	    		       asyn : false,
	    		       contentType: "text/plain", // NOT dataType!
	    		       url  : "checkEmail?email="+email_id+"",
	    		       success  : function(response){
	    		    	   if(response==email_id){
	    		    		   $('#emailspan').text("Email id already exists");
	    		    		   $("#submitid").attr("disabled", true);
	    		    	   }else{
	    		    		   //$('#emailspan').text("Email id not available");
	    		    		   $('#emailspan').text('');
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

var phoneInput = document.getElementById('phne_no');
var phonetwoInput = document.getElementById('phne_no2');
var phonethreeInput = document.getElementById('phne_no3');

var phonetimeout = null;
phoneInput.onkeyup = function (e) {
clearTimeout(phonetimeout);
phonetimeout = setTimeout(function () {
	 var phne_no=$('#phne_no').val();
	 getsesVal().done(function(data){
	 if(data!=""){
	    if(phne_no==""){
	    	 $('#phonespan').text('');
	    	 $("#submitid").attr("disabled", false);
	    }else{
	    	var regex = new RegExp("^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$");
	    if(!regex.test(phne_no)){
	    	  // $('#emailspan').text("Please enter valid number");
	    	   $("#submitid").attr("disabled", true);
	    }else{
	    	$.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "text/plain", // NOT dataType!
		        url  : "checkPhoneNo?phone="+phne_no+"",
		        success  : function(response){
		        	if(response.contactno1==phne_no || response.contactno2==phne_no || response.contactno3==phne_no){
		     		   $('#phonespan').text("Contact number already exists");
		     		  $("#submitid").attr("disabled", true);
		     	   }else{
		     		  $('#phonespan').text('');
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

var phonetwotimeout = null;
phonetwoInput.onkeyup = function (e) {
clearTimeout(phonetwotimeout);
phonetwotimeout = setTimeout(function () {
	 var phne_no=$('#phne_no2').val();
	 getsesVal().done(function(data){
		 if(data!=""){
	    if(phne_no==""){
	    	 $('#phonespan2').text('');
	    	 $("#submitid").attr("disabled", false);
	    }else{
	    	var regex = new RegExp("^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$");
	    if(!regex.test(phne_no)){
	    	  // $('#emailspan').text("Please enter valid number");
	    	   $("#submitid").attr("disabled", true);
	    }else{
	    	$.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "text/plain", // NOT dataType!
		        url  : "checkPhoneNo?phone="+phne_no+"",
		        success  : function(response){
		        	
		        	if(response.contactno1==phne_no || response.contactno2==phne_no || response.contactno3==phne_no){
		     		   $('#phonespan2').text("Contact number already exists");
		     		  $("#submitid").attr("disabled", true);
		     	   }else{
		     		  $('#phonespan2').text('');
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

var phonethreetimeout = null;
phonethreeInput.onkeyup = function (e) {
clearTimeout(phonethreetimeout);
phonethreetimeout = setTimeout(function () {
	 var phne_no=$('#phne_no3').val();
	 getsesVal().done(function(data){
		 if(data!=""){
	    if(phne_no==""){
	    	 $('#phonespan3').text('');
	    	 $("#submitid").attr("disabled", false);
	    }else{
	    	var regex = new RegExp("^(?!000|911)[0-9]{3}-[0-9]{3}-[0-9]{4}$");
	    if(!regex.test(phne_no)){
	    	  // $('#emailspan').text("Please enter valid number");
	    	   $("#submitid").attr("disabled", true);
	    }else{
	    	$.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "text/plain", // NOT dataType!
		        url  : "checkPhoneNo?phone="+phne_no+"",
		        success  : function(response){
		        	
		        	if(response.contactno1==phne_no || response.contactno2==phne_no || response.contactno3==phne_no){
		     		   $('#phonespan3').text("Contact number already exists");
		     		  $("#submitid").attr("disabled", true);
		     	   }else{
		     		  $('#phonespan3').text('');
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
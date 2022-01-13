 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<!DOCTYPE html PUBLIC "-/W3C/DTD HTML 4.01 Transitional/EN" "http:/www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <meta charset="utf-8"> -->
<!-- <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />  -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="resources/images/favicon.ico">
<link rel="stylesheet"href="resources/css/css/normalize.min.css">
<link rel="stylesheet" href="resources/css/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/css/themify-icons.css">
<link rel="stylesheet" href="resources/css/css/pe-icon-7-stroke.min.css">
<link rel="stylesheet" href="resources/css/css/flag-icon.min.css">
<link rel="stylesheet" href="resources/css/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/style-skin.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/all.css">
<link type="text/css" rel="stylesheet" href="resources/js/newdt/dataTables.bootstrap4.min.css">
</head>
    <style type="text/css">
    

/* Styles for verification */
#pswd_info {
	position:absolute;
	/* bottom:-95px;
	bottom: -115px\9; */
	right:5px;
	width:250px;
	padding:15px;
	background:#fefefe; 
	font-size:.875em;
	border-radius:5px;
	box-shadow:0 1px 3px #ccc;
	border:1px solid #ddd;
	display:none;
}
#pswd_info::before {
	content: "\25B2";
	position:absolute;
	top:-12px;
	left:45%;
	font-size:14px;
	line-height:14px;
	color:#ddd;
	text-shadow:none;
	display:block;
}
#pswd_info h4 {
	margin:0 0 10px 0; 
	padding:0;
	font-weight:normal;
}

.invalid {
	background:url(images/invalid.png) no-repeat 0 50%;
	padding-left:22px;
	line-height:24px;
	color:#ec3f41;
}
.valid {
	background:url(images/valid.png) no-repeat 0 50%;
	padding-left:22px;
	line-height:24px;
	color:#3a7d34;
}
</style>
</head>
<%
String uname=null;
if(session.getAttribute("username")==null){
	      String redirectURL = "loginpage";
          response.sendRedirect(redirectURL); 
      }
else{
    uname=(String)session.getAttribute("username");
 }
  %>
<body>
    <!-- Left Panel -->
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
       <ul class="nav navbar-nav">
                    <li class="active">
                    </li><!-- index.html -->
                    
                    <li>
                       <!--  <a href="#"><i class="menu-icon fa fa-laptop"></i>Raise Ticket </a> -->
                    </li>
                    <li>
                       <!--  <a href="#"><i class="menu-icon fa fa-laptop"></i>View Ticket </a> -->
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->
    <!-- Preloader -->
  <!--   <div id="preloader">
        <i class="circle-preloader"></i>
        <img src="resources/images/preloader.png" alt="">
    </div> -->
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <!-- Header-->
        <header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                     <a class="navbar-brand" href="home"><img src="resources/images/logo-web.png" alt="Logo"></a>
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
          <div class="top-right">
                <div class="header-menu">
                    <div class="header-left">
                    </div>
                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class='user-name hidden-phone' style="font-weight:bolder;color:aliceblue">
                            <c:out value="${username}" /></span> &nbsp;&nbsp;
                            <input type="hidden" name="username" value="${username}" id="username">
                            <img class="user-avatar" src="resources/images/unknown_user.png" alt="User Avatar">
                        </a>
                        <%--    ${name} --%>
                        <div class="user-menu dropdown-menu">
                             <a class="nav-link" href="ChangePassword"><i class="fa fa -cog"></i>Change Password</a>
                             <a class="nav-link" href="loginpage"><i class="fa fa-power -off"></i>Logout</a>
                        </div>
                    </div>

                </div>
            </div>
        </header>
        
        <div class="content">
            <!-- Animated -->
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col">
                        <div class="card">
                    <h5 class="card-header">Change Password</h5>
                    <div class="card-body">
                    
                    
                <form action="\" id="ChangeLoginPassword" method="post">
				<div class="form-group row mt-4">
						<label class="col-sm-4 col-form-label"><span style="color:red">*</span>Current Password</label>
						<div class="col-sm-5">
            	<input name="currentPwd" id="currentPwd" placeholder="Enter Current Password" class="form-control"  
            	  title="Enter your old password"  autocomplete="off" type="password"  data-error="some error" required></div>
				 </div>
				  <div class="form-group row">
                                        <label class="col-sm-4 col-form-label"><span style="color:red">*</span>New Password</label>
                                        <div class="col-sm-5">
                                            <input id="Npassword" type="password" placeholder="New Password" name="newPassword" minlength="8" maxlength="16" class="form-control" required>  
                                         <span id="password_strength"></span>
                                        </div>
                                    </div>
									<div id="pswd_info">
										<h4>Password must meet the following requirements:</h4>
										<ul>
											<li id="letter" class="invalid">At least <strong>one
													letter</strong></li>
											<li id="capital" class="invalid">At least <strong>one
													capital letter</strong></li>
											<li id="number" class="invalid">At least <strong>one
													number</strong></li>
											<li id="specialchar" class="invalid">At least <strong>one
													special character</strong></li>		
											<li id="length" class="invalid">Be at least <strong>8
													characters</strong></li>
										</ul>
									</div>
									<!-- onchange="checkUserName()"  -->  
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label"><span style="color:red">*</span>Confirm Password</label>
                                        <div class="col-sm-5">
                                        <input id="Cpassword" type="password" placeholder="Confirm Password" name="confirmPassword" class="form-control" required>
                                        <span id='message'></span>
                                        </div>
                                 </div>
                       <div class="row">
                       	<div class="col mx-auto">
                       		<div class="btncenter text-center mb-4">
						<button class="btn btn-primary  btn-sm" style="background: #205081;" type="button" value="Submit"  id="submitid" name="submitid"
						>Save Changes</button>
						<!-- onclick="return Validate()" -->
					  <a href="dashboard" type="button" class="btn btn-warning btn-sm" type="button">Cancel</a>
					</div>
                       	</div>
                       </div>
					 
				</form>
				
                       <!--  <form>
                            <div class="form-group row mt-4">
                                <label class="col-sm-4 col-form-label">Current Password</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Enter Current Password">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">New Password</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Enter New Password">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Confirm Password</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" placeholder="Confirm Password">
                                </div>
                            </div>
                            <div class="btncenter text-center mb-4">
                                <button type="button" class="btn btn-primary">Save Changes</button>
                            <button type="button" class="btn btn-secondary">cancel</button>
                            
                            </div>
                            
                        </form> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- .animated -->
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
    </div>
 <script src="resources/js/js/jquery-2.1.4.min.js"></script>  
<script src="resources/js/newjs/bootstrap.min.js"></script>
<script src="resources/js/newjs/formValidation.min.js"></script>
<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
<script src="resources/js/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
<script src="resources/preDefined/goback.js"></script>
</body>
<script>
		history.pushState(null, document.title, location.href);
		window.addEventListener('popstate',function(event){
		history.pushState(null,document.title, location.href);
		});

		$("#submitid").click(function (event) {
			     event.preventDefault();
	    		 var form = $('#ChangeLoginPassword')[0];
	    	     var data = new FormData(form);
	    		$.ajax({
	    	            url: "ChangeLoginPassword", //this is the submit URL
	    	            type: "POST",
	    	            enctype: 'multipart/form-data',
	    	           
	    	            data: data,
	    	            processData: false,
	    	            contentType: false,
	    	            cache: false,
	    	            success: function(data){
	    	            	  if(data!=null || data!=""){
	    	     	            	$('#addsummaryfields').html(data);
	    	     	      		  	$('#myModal').show(); 
	    	     	   	            }
	    	     	   	            else{
	    	     	   	          window.location.href="loginpage";
	    	     	   	   	            }
	    	            }
	    	        });
		});

	$("#closePopupSave").click(function (event) {

		$('#myModal').hide(); 

		window.location.reload();
		
	});


		
</script>
<script> 
$('#Cpassword,#Npassword').on('change', function () {
  if ($('#Npassword').val() == $('#Cpassword').val()) {
    $('#message').html('Matching').css('color', 'green');
    $('#submitid').prop("disabled", false);
  }else{
	 $('#message').html('Not Matching').css('color', 'red');
	 $('#submitid').prop("disabled", true);
  }
}); 
</script> 
 <script> 
$('#Npassword').on('keyup', function () {
	//validate the length
	var valid = true;
	var pswd=$('#Npassword').val()
	if ( pswd.length < 8 ) {
	    $('#length').removeClass('valid').addClass('invalid');
	    valid = false;
	} else {
	    $('#length').removeClass('invalid').addClass('valid');
	}
	//validate letter
	if ( pswd.match(/[A-z]/) ) {
	    $('#letter').removeClass('invalid').addClass('valid');
	} else {
	    $('#letter').removeClass('valid').addClass('invalid');
	    valid = false;
	}

	//validate capital letter
	if ( pswd.match(/[A-Z]/) ) {
	    $('#capital').removeClass('invalid').addClass('valid');
	} else {
	    $('#capital').removeClass('valid').addClass('invalid');
	    valid = false;
	}

	//validate number
	if ( pswd.match(/\d/) ) {
	    $('#number').removeClass('invalid').addClass('valid');
	} else {
	    $('#number').removeClass('valid').addClass('invalid');
	    valid = false;
	}
	//validate special char
	if ( pswd.match(/([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<])/) ) {
	    $('#specialchar').removeClass('invalid').addClass('valid');
	} else {
	    $('#specialchar').removeClass('valid').addClass('invalid');
	    valid = false;
	}
	//alert("valid****"+valid);
	 if(valid){
	        $('#submitid').prop("disabled", false);   
	  }else{
		  $('#submitid').prop("disabled", true);
		  }
	 
}).focus(function() {
    $('#pswd_info').show();
}).blur(function() {
    $('#pswd_info').hide();
});
</script>
</html>
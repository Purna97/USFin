<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- CSS-->
		<link rel="stylesheet" type="text/css" href="resources/css/main.css">
		<title>USOnboarding</title>
	</head>
	<body>
		<!-- <section class="material-half-bg" Style="background-color:#ffffff;">
			<div class="cover" Style="background-color:white;"></div>
		</section> -->
		<section class="login-content">
			<div class="logo">
				<h1><img src="resources/images/homo_logo.png" /></h1>
			</div>
			<div class="login-box" style="min-height: 405px;" id="LoginWithEmailId">
				<form action="validateLoginWithEmailId" method="post" class="login-form">
					<h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
					<div class="form-group">
						<label class="control-label">EMAIL ID</label>
						<input type="text" name="emailId" id="emailId" placeholder="Email Id" class="form-control" required>
						 <center><span style="color:red" id="emailshow"></span></center>
					</div>
					 <!-- pattern="^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$" title="Please Enter Valid Email Id" -->
					<div class="form-group">
						<label class="control-label">PASSWORD</label>
						<input type="password" name="epassword" id="fpassword"  placeholder="Password" class="form-control" minlength="8" maxlength="64" required>
						  <center><span style="color:red"><c:out value="${invalidEmail}"></c:out></span></center>
					     <%-- <center><span style="color:red"> <c:out value="${invalidEmail}"></c:out></span></center> --%>
					</div>
					<div class="form-group btn-container">
						<button type="submit" class="btn btn-primary btn-block" Style="background-color:#4387fd;">SIGN IN <i class="fa fa-sign-in fa-lg"></i></button>
						<button type="button" class="btn btn-primary btn-block" Style="background-color:#4387fd;" onclick="forgotPassword()"><i class="fa fa -cog"></i>Forgot Password</button>
					    <a class="btn btn-info btn-block" Style="background-color:#4387fd;" href="loginpage">SIGN IN With User Name <i class="fa fa-sign-in fa-lg"></i></a>
					</div>
				</form>
			</div>	
			
			<div class="login-box" id="forgotPasswordId" style="display:none;">
				<form action="validateLoginWithEmailId" method="post" class="login-form">
					<h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>Forgot Password</h3>
					<div class="form-group">
						<label class="control-label">EMAIL ID</label>
						<input type="text" name="emailId" id="femailId" placeholder="Email Id" class="form-control" required>
						  <center><span style="color:red" id="spanShow"></span></center>
					</div>
					<div class="form-group btn-container">
						<button type="button" class="btn btn-primary btn-block" Style="background-color:#4387fd;" onclick="sendforgotPassword()"><i class="fa fa -cog"></i>Forgot Password</button>
					   <a  class="btn btn-info btn-block" Style="background-color:#4387fd;" href="loginWithEmail">SIGN IN With e-mailID <i class="fa fa-sign-in fa-lg"></i></a>
					   <!--  <a class="btn btn-info btn-block" Style="background-color:#4387fd;" href="loginpage">SIGN IN With User Name <i class="fa fa-sign-in fa-lg"></i></a> -->
					</div>
				</form>
			</div>
				
		</section>
		
	</body>
<script>
		history.pushState(null, document.title, location.href);
		window.addEventListener('popstate',function(event){
		history.pushState(null,document.title, location.href);
		});
</script>
	<script src="resources/js/js/jquery-2.1.4.min.js"></script> 
 <!-- <script src="resources/js/newjs/js/bootstrap.min.js"></script> -->
<!-- <script	src="resources/js/js/jquery.matchHeight.min.js"></script>
	<script src="resources/js/js/main.js"></script> -->
	<script type="text/javascript">	
	
	var textInput = document.getElementById('emailId');
	var timeout = null;
	textInput.onkeyup = function (e) {
	clearTimeout(timeout);
	timeout = setTimeout(function () {
		 var email=$('#emailId').val();
		    if(email!=""){
		    	 var regex = new RegExp("^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$");
				    if(!regex.test(email)){
				    	   $('#emailshow').html("<font color=red>Not a valid Email</font>");
				    }else{
				    	   $('#emailshow').html('');
				      }
		    }else{
		    	 $('#emailshow').text('');
		    	 $("#submitid").attr("disabled", true);
		  }
	}, 500);
	};
	
	$("#forgotPasswordId").hide();
	function forgotPassword(){
		$("#forgotPasswordId").show();
		$("#LoginWithEmailId").hide();
	}
	
	function sendforgotPassword(){
		var emailId=$("#femailId").val()
		if(emailId!=""){
			 var regex = new RegExp("^[a-z0-9](\.?[a-z0-9_-]){0,}@[a-z0-9-]+\.([a-z]{1,6}\.)?[a-z]{2,6}$");
			    if(!regex.test(emailId)){
			    	   $('#spanShow').html("<font color=red>Not a valid Email</font>");
			    }else{
			    	$("#spanShow").text('');
		$.ajax({
			url : "forgotPassword?emailId="+emailId+"", //this is the submit URL
			type : "GET",
			contentType : "application/json",
			success : function(data) {
				 if(data!=null || data!=""){
					 if(data=='Success'){
						 var data="Password sent your Email Id";
						 $("#spanShow").css("color", "green");
						 $("#spanShow").text(data);
					 }else{
						 var data="Email Id not exists";
						 $("#spanShow").css("color", "red");
						 $("#spanShow").text(data);
					 }
	   	   	         }
	   	   	      else{
	   	   	   		   $("#spanShow").text('');
	   	   	           window.location.href="loginpage";
	   	   	         }
			   }
		  });
       }
	   }else{
		   $("#femailId").focus();
		   $("#spanShow").text('');
	   }
	}
	
	
	
/* 	$("#loginWEmailId").click(function(event) {
		var emailId=$("#femailId").val()
		var password=$("#fpassword").val()
		if(emailId!="" && password!=""){
			var form = $('#validateLoginWithEmailIdForm')[0];
			var data = new FormData(form);
			$.ajax({
				url : "validateLoginWithEmailId?emailId="+emailId+"&epassword="+password+"", //this is the submit URL
				type : "POST",
				success : function(data) {
					 if(data!=null || data!=""){
						 $("#spanShow").text(data);
		   	   	       }
		   	   	     else{
		   	   	  		  alert(data);
		   	   	          window.location.href="dashboard";
		   	   	   	      } 
				}
			});
		}else{
			 $("#femailId,#fpassword").focus();
			 $("#spanShow").text('');
		}
	}); */

	</script>
</html>

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
			<div class="login-box" id="loginWithUserName">
				<form action="validateLogin" method="post" class="login-form">
					<h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
					<div class="form-group">
						<label class="control-label">USER NAME</label>
						<input type="text" name="username" id="username" placeholder="User Name" autofocus class="form-control" required>
					</div>
					<div class="form-group">
						<label class="control-label">PASSWORD</label>
						<input type="password" name="password" id="password"  placeholder="Password" class="form-control" required>
					<center> <span style="color:red"> <c:out value="${invalid}"></c:out></span></center>
					</div>
					
					<div class="form-group btn-container">
						<button class="btn btn-primary btn-block" Style="background-color:#4387fd;">SIGN IN <i class="fa fa-sign-in fa-lg"></i></button>
					   <a  class="btn btn-info btn-block" Style="background-color:#4387fd;" href="loginWithEmail">SIGN IN With e-mailID <i class="fa fa-sign-in fa-lg"></i></a>
					</div>
				</form>
			</div>
			
			<%-- <div class="login-box" id="loginWithEmailId" style="display:none;">
				<form action="validateLoginWithEmailId" method="post" class="login-form">
					<h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
					<div class="form-group">
						<label class="control-label">EMAIL ID</label>
						<input type="text" name="emailId" id="emailId" placeholder="Email Id" autofocus class="form-control" required>
					</div>
					<div class="form-group">
						<label class="control-label">PASSWORD</label>
						<input type="password" name="epassword" id="epassword"  placeholder="Password" class="form-control" required>
					     <center><span style="color:red"> <c:out value="${invalid}"></c:out></span></center>
					</div>
					<div class="form-group btn-container">
						<button class="btn btn-primary btn-block" Style="background-color:#4387fd;">SIGN IN <i class="fa fa-sign-in fa-lg"></i></button>
						<a class="btn btn-primary btn-block" Style="background-color:#4387fd;" href="forgotPassword"><i class="fa fa -cog"></i>Forgot Password</a>
					    <button type="button" class="btn btn-info btn-block" Style="background-color:#4387fd;" onclick="loginWithUserName()">SIGN IN With User Name <i class="fa fa-sign-in fa-lg"></i></button>
					</div>
				</form>
			</div> --%>		
			
		</section>
	</body>
<script>
		history.pushState(null, document.title, location.href);
		window.addEventListener('popstate',function(event){
		history.pushState(null,document.title, location.href);
		});
</script>
	<script src="resources/js/js/jquery-2.1.4.min.js"></script> 
	<!-- <script src="resources/js/js/bootstrap.min.js"></script>
	<script	src="resources/js/js/jquery.matchHeight.min.js"></script>
	<script src="resources/js/js/main.js"></script> -->
	<script type="text/javascript">
	function loginWithEmailId(){
		$("#loginWithEmailId").show();
		$("#loginWithUserName").hide();	
	 }
	function loginWithUserName(){
		$("#loginWithEmailId").hide();
		$("#loginWithUserName").show();	
	} 
	</script>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="resources/images/favicon.ico">
<link rel="stylesheet" href="resources/css/css/normalize.min.css">
<link rel="stylesheet" href="resources/css/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/css/themify-icons.css">
<link rel="stylesheet" href="resources/css/css/pe-icon-7-stroke.min.css">
<link rel="stylesheet" href="resources/css/css/flag-icon.min.css">
<link rel="stylesheet" href="resources/css/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/style-skin.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/all.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>US Onboarding</title>
<style type="text/css">
.navbar .navbar-nav li > a:hover,
.navbar .navbar-nav li > a:hover .menu-icon {
    color: #fff;
}
.swal2-popup {
  font-size: 0.8rem !important;
 }
  
.card .card-body {
    padding: 0.09em;
     line-height: 4.5; 
}

li {
	transition: transform .4s;
	margin: 0 auto;
}

li:hover {
	transform: scale(1.3);
}

.zoom {
	transition: transform .4s;
}

.zoom:hover {
	transform: scale(1.2);
}

.Counter {
	padding: 2px 10px;
	font-size: 14px;
	f font-weight: 600;
	line-height: 1;
	color: #586069;
	background-color: rgba(27, 31, 35, 0.08);
	border-radius: 20px;
}
.stat-heading .badge {
  position: absolute;
  top: -10px;
  right: -10px;
  padding: 10px 15px;
  border-radius: 50%;
  background-color: red;
  color: white;
}


</style>
</head>

<body class="sidebar-mini fixed">
	<div id="right-panel" class="right-panel">
		<!-- Navbar-->
		<header id="header" class="header">
		<div class="top-left">
			<div class="navbar-header">
				<a class="navbar-brand" href="dashboard"><img
					src="resources/images/logo-web.png" alt="Logo"></a> <a
					id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
			</div>
		</div>
		<div class="top-right">
			<div class="header-menu">
				<div class="header-left"></div>
				<div class="user-area dropdown float-right">
					<a href="#" class="dropdown-toggle active" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <span
						class='user-name hidden-phone'
						style="font-weight: bolder; color: aliceblue"> <c:out
								value="${username}"></c:out></span> &nbsp;&nbsp; <input type="hidden"
						name="username" value="${username}" id="username">
						<input type="hidden" name="deptId" value="${dept}" id="deptId">
						 <img class="user-avatar" src="resources/images/unknown_user.png" alt="User Avatar">
					</a>
					<div class="user-menu dropdown-menu">
						<a class="nav-link" href="ChangePassword"><i
							class="fa fa -cog"></i>Change Password</a> <a class="nav-link"
							href="loginpage"><i class="fa fa-power -off"></i>Logout</a>
					</div>
				</div>

			</div>
		</div>
		</header>
		<!-- Side-Nav-->
		<aside id="left-panel" class="left-panel"> <nav
			class="navbar navbar-expand-sm navbar-default">
		<div id="main-menu" class="main-menu collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li  style="background-color:#008ab9; "><a href="dashboard"><i style="font-size:25px;" class="menu-icon fa fa-dashboard"></i>Dashboard</a></li>
				
				<c:choose>
				<c:when test="${dept == 1 && (emptype eq 'Admin' || emptype eq 'W2 Admin') && role == 4}">
				<li><a href="addEmployees"><i style="font-size:25px;" class="menu-icon fa fa-user"></i>Candidates</a></li>
				</c:when>
				
				<c:when test="${dept == 2 && role == 2}">
				<li><a href="addEmployees"><i style="font-size:25px;" class="menu-icon fa fa-user"></i>Candidates</a></li>
				</c:when>
				
				<c:when test="${dept == 5 && role == 2}">
				<li><a href="addContractors"><i style="font-size:25px;" class="menu-icon fa fa-user"></i>Contractors</a></li>
				</c:when>
				<c:when test="${dept == 9 && role == 5}">
				<li><a href="search"><i class="menu-icon fa fa-group"></i>Candidate Info</a></li>
				<!-- <li><a href="repoSearch"><i style="font-size:25px;" class="menu-icon fa fa-user"></i>Document Repository</a></li> -->
				</c:when>
			</c:choose>
				
				<c:if test="${not empty dept}">
				<li><a href="timesheet"><i style="font-size:25px;" class="menu-icon fa fa-clock"></i>Timesheet</a></li>
				</c:if>
				<c:if test="${(emptype eq 'W2 Admin' || emptype eq 'Admin' || emptype eq 'W2')}">
				<li><a href="addreport"><i style="font-size:25px;" class="menu-icon fa fa-user"></i>Status Reports</a></li>
				</c:if> 
				<c:if test="${(dept == 5 || dept == 1) && (role == 2 || role == 4 || role == 1) && (emptype eq 'W2 Admin' || emptype eq 'Admin')}">
				<li><a href="contractspanel"><i style="font-size:25px;" class="menu-icon fa fa-user"></i>BGC</a></li>
				</c:if>
				
				<c:if test="${dept ==3 || dept == 1 && (emptype eq 'Admin' || emptype eq 'W2 Admin') && role == 4}">
				<li><a href="addemployee"><i style="font-size: 30px;"
						class='fas fa-user'></i>&nbsp;&nbsp; Invoice</a></li>
				<!-- <li><a href="addcustomer"><i style="font-size: 30px;"
						class='fas fa-user'></i>&nbsp;&nbsp;All Customers</a></li>

				<li><a href="products"><i style="font-size: 30px;"
						class='fas fa-user'></i>&nbsp;&nbsp;Products and Services</a></li>

				<li><a href="invoicepage"><i style="font-size: 30px;"
						class="fas fa-file-invoice-dollar"></i>&nbsp;&nbsp;Create Invoice</a></li>

				<li><a href="allinvoices"><i style="font-size: 30px;"
						class="fas fa-file-invoice-dollar"></i>&nbsp;&nbsp;All Invoices</a></li>

				<li><a href="expensepage"><i style="font-size: 30px;"
						class='fas fa-hand-holding-usd'></i>&nbsp;&nbsp;Expenses</a></li>

				<li><a href="addemployee"><i style="font-size: 30px;"
						class='fas fa-user'></i>&nbsp;&nbsp;All Employees</a></li> -->
				</c:if>			
				<c:if test="${not empty lgemailid}">
						<li><a href="bgvFormsUser"><i style="font-size:25px;" class="menu-icon fa fa-user"></i>BGC Documents Upload</a></li>
				</c:if>
				<c:if test="${dept == 8 || (dept == 1 && (emptype eq 'Admin' || emptype eq 'W2 Admin') && role == 4)}">			
				<li><a href="addtstemplate"><i style="font-size:25px;" class="menu-icon fa fa-file"></i>Templates</a></li>
				</c:if>
				<%-- <c:if test="${dept == 1 && (emptype eq 'Admin' || emptype eq 'W2 Admin') && role == 4}">	 --%>
				<c:if test="${(dept == 9 || dept == 1) && (role == 2 || role == 4 || role == 5) && (emptype eq 'W2 Admin' || emptype eq 'Admin')}">		
				<li><a href="immigration"><i style="font-size:25px;" class="menu-icon fa fa-user"></i>Immigration</a></li>
					 <!-- <li><a href="invoicepage"><i style="font-size:30px;" class="fas fa-file-invoice-dollar"></i>&nbsp;&nbsp;Invoice</a></li> -->
					 <!--  <li><a href="connectToQuickbooks"><i style="font-size:30px;" class="fas fa-file-invoice-dollar"></i>&nbsp;&nbsp;Invoice</a></li> -->
				</c:if>
				<c:if test="${(lgworkAuth ne 'US Citizen' && lgworkAuth ne 'Green Card')&&(emptype eq 'W2')}">
				 <li><a href="mydocuments"><i style="font-size:25px;" class="menu-icon fa fa-user"></i>Immigration Documents</a></li>
				</c:if>
				</ul>
				
		</div>
		</nav> </aside>
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">US Onboarding Dashboard</h5>
							<div class="card-body">
 								<div class="row"  style="margin-top:20px;">
 								
								<%-- <c:if test="${dept==1 && role==4 && (emptype eq 'W2 Admin' || emptype eq 'Admin')}"> --%>
 								<c:if test="${(dept == 2 || dept == 5) || (dept == 1 && role == 4)}">
 								<div class="col-lg-3 col-md-6">
												<a href="myDashboard">
													<div class="card">
														<div class="card-body">
															<div class="stat-widget-five zoom">
																<div class="stat-icon dib flat-color-1">
																	<i class="fa fa-trash">
																	</i>
																</div>
																<div class="stat-content">
																	<div class="text-left dib">
																		<div class="stat-heading"  style="color:black;font-size:15px;">Expiring Documents
																		<span style="font-size:110%;" class="badge"><c:if test="${not empty myDashboard.count}">
																	     ${myDashboard.count}
																	    </c:if></span>
																	    </div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</a>
											</div>
											</c:if>
											&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;
											<c:if test="${(dept ==9) || (dept == 1 && role == 4)}">
											<div class="col-lg-3 col-md-6">
												<a href="immidashboard">
													<div class="card">
														<div class="card-body">
															<div class="stat-widget-five zoom">
																<div class="stat-icon dib flat-color-1">
																	<img alt="" src="resources/ICONS/Immigration.png"/>
																</div>
																<div class="stat-content">
																	<div class="text-left dib">
																		<div class="stat-heading"  style="color:black;font-size:15px;">Immigration Pending Items
																		<span style="font-size:110%;"class="badge"><c:if test="${not empty dasboardcount}">
																	     ${dasboardcount}
																	    </c:if></span>
																	    </div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</a>
											</div>
											</c:if>
											&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;
										<c:if test="${emptype eq 'W2' || emptype eq 'W2 Admin' || emptype eq 'Admin'}">
									<div class="col-lg-3 col-md-6">
												<a href="timesheet">
													<div class="card">
														<div class="card-body">
															<div class="stat-widget-five zoom">
																<div class="stat-icon dib flat-color-4">
																	<i class="fa fa-clock"></i>
																</div>

																<div class="stat-content">
																	<div class="text-left dib">
																		<div class="stat-heading"  style="color:black;font-size:15px;">Timesheet
																		<c:if test="${not empty timesheetList}">
																		<c:if test="${timesheetList.size() gt 0}"><span style="font-size:110%;" class="badge">
																	     ${timesheetList.size()}
																	    </span></c:if></c:if></div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</a>
											</div>
											</c:if>
											&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;
											<c:if test="${(emptype eq 'W2' && role == 1)}">
											<!--<div class="col-lg-3 col-md-6">
											<a href="addreport">
												<div class="card">
													<div class="card-body">
														<div class="stat-widget-five">
															<div class="stat-icon dib flat-color-2">
																<i class="fa fa-calendar-check"></i>
															</div>
															<div class="stat-content">
																<div class="text-left dib">
																	<div class="stat-heading">Status Reports</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</a>
										</div> -->
										
										<!-- <div class="col-lg-3 col-md-6">
											<a href="mydocuments">
												<div class="card">
													<div class="card-body">
														<div class="stat-widget-five">
															<div class="stat-icon dib flat-color-1">
																<i class="fas fa-file-upload"></i>
															</div>
															<div class="stat-content">
																<div class="text-left dib">
																	<div class="stat-heading">Immigration Documents</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</a>
										</div>  -->
										
										<div class="col-lg-3 col-md-6">
											   <c:if test="${usercount gt 0 }">
												<a href="userimmidashboard" >
													<div class="card">
														<div class="card-body">
															<div class="stat-widget-five zoom">
																<div class="stat-icon dib flat-color-1">
																	<img alt="" src="resources/ICONS/Immigration.png"/>
																</div>
																<div class="stat-content">
																	<div class="text-left dib">
																		<div class="stat-heading"  style="color:black;font-size:10px;"> Immigration Pending Items
																		<span style="font-size:110%;"class="badge">
																		<c:if test="${not empty usercount}">
																	     ${usercount}
																	    </c:if></span>
																	    </div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</a>
												</c:if>
												<c:if test="${usercount eq 0 }">
												<a href="userimmidashboard">
												   <div class="card">
														<div class="card-body">
															<div class="stat-widget-five zoom">
																<div class="stat-icon dib flat-color-1">
																	<img alt="" src="resources/ICONS/Immigration.png"/>
																</div>
																<div class="stat-content">
																	<div class="text-left dib">
																		<div class="stat-heading"  style="color:black;font-size:10px;"> Immigration Pending Items
																		<span style="font-size:110%;"class="badge">
																		<c:if test="${not empty usercount}">
																	     ${usercount}
																	    </c:if></span>
																	    </div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													</a>
												</c:if>
											</div>
										</c:if>
										&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;
									<%--<c:choose>
										<c:when test="${dept == 1 && (emptype eq 'Admin' || emptype eq 'W2 Admin') && role == 4}">
											<div class="col-lg-3 col-md-6">
												<a href="addEmployees">
													<div class="card">
														<div class="card-body">
															<div class="stat-widget-five">
																<div class="stat-icon dib flat-color-1">
																	<i class="fa fa-users"></i>
																</div>
																<div class="stat-content">
																	<div class="text-left dib">
																		<div class="stat-heading">Candidates</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</a>
											</div>
											<div class="col-lg-3 col-md-6">
												<a href="addtstemplate">
													<div class="card">
														<div class="card-body">
															<div class="stat-widget-five">
																<div class="stat-icon dib flat-color-7">
																	<i class="fa fa-file"></i>
																</div>

																<div class="stat-content">
																	<div class="text-left dib">
																		<div class="stat-heading">Templates</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</a>
											</div>
											<!-- <div class="col-lg-3 col-md-6">
												<a href="allstatus">
													<div class="card">
														<div class="card-body">
															<div class="stat-widget-five">
																<div class="stat-icon dib flat-color-2">
																	<i class="fa fa-calendar-check"></i>
																</div>

																<div class="stat-content">
																	<div class="text-left dib">
																		<div class="stat-heading">Status Reports</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</a>
											</div> -->
											
											<div class="col-lg-3 col-md-6">
												<a href="myDashboard">
													<div class="card">
														<div class="card-body">
															<div class="stat-widget-five">
																<div class="stat-icon dib flat-color-1">
																	<i class="fa fa-trash">
																	</i>
																</div>
																<div class="stat-content">
																	<div class="text-left dib">
																		<div class="stat-heading">Expiring Documents
																		<span class="badge"><c:if test="${not empty myDashboard.count}">
																	     ${myDashboard.count}
																	    </c:if></span>
																	    </div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</a>
											</div>
											<div class="col-lg-3 col-md-6">
												<a href="immigration">
													<div class="card">
														<div class="card-body">
															<div class="stat-widget-five">
																<div class="stat-icon dib flat-color-2">
																<!-- <i class="fa fa-dashboard" style="font-size:55px;color:red;"></i> -->
															
																	 <img alt="" src="resources/ICONS/Immigration.png"/> 
																</div>
																<div class="stat-content">
																	<div class="text-left dib">
																		<div class="stat-heading">Immigration<span class="badge"><c:if test="${not empty dasboardcount}">
																	     ${dasboardcount}
																	    </c:if></span></div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</a>
											</div>
											
											<div class="col-lg-3 col-md-6">
												<a href="immidashboard">
													<div class="card">
														<div class="card-body">
															<div class="stat-widget-five">
																<div class="stat-icon dib flat-color-2">
																 <i class="fa fa-dashboard" style="font-size:55px;color:red;"></i> 
															
																	 <!-- <img alt="" src="resources/ICONS/Immigration.png"/> --> 
																</div>
																<div class="stat-content">
																	<div class="text-left dib">
																		<div class="stat-heading">My DashBoard <span class="badge"><c:if test="${not empty dasboardcount}">
																	     ${dasboardcount}
																	    </c:if></span></div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</a>
											</div>
										</c:when>

										<c:when test="${dept == 2 && role == 2}">
											<div class="col-lg-3 col-md-6">
												<a href="addEmployees">
													<div class="card">
														<div class="card-body">
															<div class="stat-widget-five">
																<div class="stat-icon dib flat-color-1">
																	<i class="fa fa-users"></i>
																</div>
																<div class="stat-content">
																	<div class="text-left dib">
																		<div class="stat-heading">Employees</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</a>
											</div>
										</c:when>
										<c:when test="${dept == 5 && role == 2}">
											<div class="col-lg-3 col-md-6">
												<a href="addContractors">
													<div class="card">
														<div class="card-body">
															<div class="stat-widget-five">
																<div class="stat-icon dib flat-color-1">
																	<i class="fa fa-group"></i>
																</div>
																<div class="stat-content">
																	<div class="text-left dib">
																		<div class="stat-heading">Contractors</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</a>
											</div>
										</c:when>
										
									</c:choose>
									<c:if test="${(emptype eq 'W2 Admin' || emptype eq 'W2') && (emptype ne 'Admin')}">
									<c:if test="${(lgworkAuth ne 'US Citizen' && lgworkAuth ne 'Green Card')&&(emptype ne 'Admin')}">
										<div class="col-lg-3 col-md-6">
											<a href="addreport">
												<div class="card">
													<div class="card-body">
														<div class="stat-widget-five">
															<div class="stat-icon dib flat-color-2">
																<i class="fa fa-calendar-check"></i>
															</div>
															<div class="stat-content">
																<div class="text-left dib">
																	<div class="stat-heading">Status Reports</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</a>
										</div>
									 	<div class="col-lg-3 col-md-6">
											<a href="mydocuments">
												<div class="card">
													<div class="card-body">
														<div class="stat-widget-five">
															<div class="stat-icon dib flat-color-1">
																<i class="fas fa-file-upload"></i>
															</div>
															<div class="stat-content">
																<div class="text-left dib">
																	<div class="stat-heading">Immigration Documents</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</a>
										</div> 
									</c:if>
									<c:if test="${not empty dept}">
									<div class="col-lg-3 col-md-6">
												<a href="timesheet">
													<div class="card">
														<div class="card-body">
															<div class="stat-widget-five">
																<div class="stat-icon dib flat-color-4">
																	<i class="fa fa-clock"></i>
																</div>

																<div class="stat-content">
																	<div class="text-left dib">
																		<div class="stat-heading">Timesheet
																		<c:if test="${not empty timesheetList}">
																		<c:if test="${timesheetList.size() gt 0}"><span class="badge">
																	     ${timesheetList.size()}
																	    </span></c:if></c:if></div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</a>
											</div>
											</c:if>
											<c:if test="${dept == 5 && role == 2 || (emptype eq 'Admin' && role eq 4)}">
											<c:if test="${(dept == 5 || dept == 1) && (role == 1) && (emptype eq 'W2 Admin' || emptype eq 'Admin')}">
											<div class="col-lg-3 col-md-6">
												<a href="category">
													<div class="card">
														<div class="card-body">
															<div class="stat-widget-five">
																<div class="stat-icon dib flat-color-1">
																	<i class="fa fa-group"></i>
																</div>
																<div class="stat-content">
																	<div class="text-left dib">
																		<div class="stat-heading">BGC</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</a>
											</div>
										</c:if>
											<c:if test="${(dept == 5) && (role == 1) && (emptype eq 'W2 Admin')}">
											<div class="col-lg-3 col-md-6">
												<a href="category">
													<div class="card">
														<div class="card-body">
															<div class="stat-widget-five">
																<div class="stat-icon dib flat-color-1">
																	<i class="fa fa-group"></i>
																</div>
																<div class="stat-content">
																	<div class="text-left dib">
																		<div class="stat-heading">BGC</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</a>
											</div>
										</c:if>
										<c:if test="${(dept == 5 || dept == 1) && (role == 2 || role == 4 || role == 1) && (emptype eq 'W2 Admin' || emptype eq 'Admin')}">
											<div class="col-lg-3 col-md-6">
												<a href="contractspanel">
													<div class="card">
														<div class="card-body">
															<div class="stat-widget-five">
																<div class="stat-icon dib flat-color-1">
																	<i class="fa fa-group"></i>
																</div>
																<div class="stat-content">
																	<div class="text-left dib">
																		<div class="stat-heading">BGC</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</a>
											</div>
										</c:if>
										 --%>
										 <c:if test="${not empty lgemailid}">
											<div class="col-lg-3 col-md-6">
												<a href="bgvFormsUser">
													<div class="card">
														<div class="card-body">
															<div class="stat-widget-five">
																<div class="stat-icon dib flat-color-1">
																	<i class="fa fa-group"></i>
																</div>
																<div class="stat-content">
																	<div class="text-left dib">
																		<div class="stat-heading"  style="color:black;font-size:10px;">BGC Documents Upload</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</a>
											</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div></div>
		
	<!-- Javascripts-->
	<script src="resources/js/js/jquery.min.js"></script>
	<script src="resources/js/js/popper.min.js"></script>
	<script src="resources/js/js/bootstrap.min.js"></script>
	<script src="resources/js/js/jquery.matchHeight.min.js"></script>
	<script src="resources/js/js/main.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
		type="text/javascript"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
	if(($('#deptId').val()==3) || ($('#deptId').val()==1)){
	 window.onload=function(){
		 $.ajax({
			    type : "GET",
				asyn : false,
				contentType : "application/text",
				url : "checktokens",
				success : function(response) {
			 	 if(response=='Token expired'){
					  Swal.fire({
								  position: 'top',
								  icon: 'info',
								  width:'620px',
								  height:'900px', 
								  title: 'Connecting to QuickBooks..Please wait',
								  showConfirmButton: false,
								  timer: 1800,
								}).then((result) => {
									window.location.href="connectToQuickbooks";
								});
				} 
				}
		 });
	 } 
 }
</script>
</body>
</html>
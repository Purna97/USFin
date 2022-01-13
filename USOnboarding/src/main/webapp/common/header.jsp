 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.dropdown-content a:hover {background-color: none}
.right-panel .navbar-brand img {
    max-width: 38px;
</style>
<%--  <%
String uname=null;
if(session.getAttribute("username")==null){
	      String redirectURL = "loginpage";
          response.sendRedirect(redirectURL); 
      }
else{

    uname=(String)session.getAttribute("username");
 }
  %> --%>
</head>
 <header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                    <a class="navbar-brand" href="dashboard"><img src="resources/images/logo-web.png" alt="Logo"></a>
                     <a id="menuToggle" class="menutoggle"><i class="fa fa-bars" style="color: green"></i></a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <div class="header-left">
                    </div>
                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class='user-name hidden-phone' style="font-weight:bolder;color:aliceblue">
                            <c:out value="${username}"></c:out></span> &nbsp;&nbsp;
                            <input type="hidden" name="username" value="${username}" id="username">
                            <img class="user-avatar" src="resources/images/unknown_user.png" alt="User Avatar">
                        </a>
                        <%--    ${name} --%>
                        <div class="user-menu dropdown-menu">
                             <a class="nav-link" href="ChangePassword"><i class="fa fa -cog"></i>Change Password</a>
                             <a class="nav-link" href="logout"><i class="fa fa-power -off"></i>Logout</a>
                        </div>
                    </div>

                </div>
            </div>
        </header>
      
</html> 
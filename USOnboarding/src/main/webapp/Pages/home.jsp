<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js" lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>HPCL-Helpdesk</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<%
// HttpSession session=request.getSession();
   if(session.getAttribute("username")==null){
             response.sendRedirect("login.jsp");  
         }
  %>
<body>
    <div id="preloader">
        <i class="circle-preloader"></i>
        <img src="resources/images/preloader.png" alt="">
    </div>
    <div id="right-panel" class="right-panel">
    </div>
<script>
	history.forward();	
</script> 
</body>
</html>

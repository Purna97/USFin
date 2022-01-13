<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.net.URLDecoder"%>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" /> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/css/select2.min.css"	rel="stylesheet"/>
</head>
<style type="text/css">
#pendingdocs {
	width: 105% !important;
}

.col-lg-2 {
	padding-right: 5px;
}

.form-control {
	font-size: 12px;
}
</style>
<body>
	<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<h5 class="card-header">Employee/Contractor History Details</h5>
									<div class="card-body">
										<div style="text-align: center;"></div>
										<div
											style="max-width: 980px;white-space: nowrap;">
											<table id="historyid1"
												class="table table-hover table-bordered"
												style="text-align: center;">
												<thead>
													<tr>
														<th style="text-align: center">Date of Joining</th>
														<th style="text-align: center">Last Working Day</th>
														<th style="text-align: center">Status</th>

													</tr>
												</thead>
												<tbody>
													<c:forEach var="emph" items="${empHistoryobj}">
														<tr>
													<%-- 	<jsp:useBean id="date" class="java.util.Date" />
														<fmt:formatDate value="${date}" type="date"
															pattern="dd-MMM-yyyy" /> --%>
															<fmt:parseDate value="${emph.joindate}" pattern="yyyy-MM-dd HH:mm:ss" var="jDate"/>
															<fmt:formatDate value="${jDate}" var="joinDate" pattern="MM/dd/yyyy"/>
															<fmt:parseDate value="${emph.exitdate}" pattern="yyyy-MM-dd HH:mm:ss" var="eDate"/>
															<fmt:formatDate value="${eDate}" var="exitDate" pattern="MM/dd/yyyy"/>
															<%-- <td><fmt:formatDate pattern="MM-dd-yyyy" value="${emph.joindate}"/></td> --%>
															<td><c:out value="${joinDate}"/></td>
															<%-- <td>${emph.joindate}</td> --%>
															<td><c:out value="${exitDate}"/></td>
															<td>${emph.estatus}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="text-center ml-3">
							 <button type="button" onclick="goBack()" class="btn btn-default btn-sm" style="padding:7px;background-color:grey;color:white;line-height:0.728571;">Back</button>
							</div>
						</div>
					</div>
				</div>
			</div>
				<form action="searchlist" method="post" id="bformid" style="display: none;">
				<input type="text"  name="semp_type"  value="${semp_type}">
				<input type="text" name="susername"  value="${susername}">
  	        	<input type="text"  name="sfullname"  value="${sfullname}">
			    <input type="text"  name="spendingdocs"  value="${spendingdocs}">
			    <input type="text" name="s_subtype"  value="${s_subtype}">
			    <input type="hidden" name="empstatus" value="${sempstatus}">
				</form>
		</div>
	</div>
	<script src="resources/js/js/jquery-2.1.4.min.js"></script>
	<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
	<script type="text/javascript" src="resources/js/js/select2.min.js"></script>
	<script src="resources/preDefined/goback.js"></script>
<script>
function goBack() {
	getsesVal().done(function(data){
		  if(data!=""){
	document.getElementById("bformid").submit();
}else{
	 window.location.href="loginpage";
}
});
	}
</script>
</body>
</html>

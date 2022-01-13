<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.net.URLDecoder"%>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" /> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" href="resources/css/css/select2.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="resources/css/css/datepicker3.min.css" />
</head>

<style type="text/css">

.btns{
background-color:#4384c3;
border-radius:25px;
 border: none;
margin-left:40px;
width:350px;
font-size:18px; 
transition: transform .9s;

}
.btns:hover {
	transform: scale(1.1);
	background-color:#4384c3;
}
</style>

<body>
	<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<%-- <center>
					<img id="loadid" src="resources/images/loader.gif">
				</center> --%>
				<div id="empdiv">
					<div class="row">
						<div class="col">
							<div class="card">
								<center><h5 style="font-size:18px;border-radius:25px;" class="card-header"><b>Generate Reports</b></h5></center>
								<br>
							<button type="button" data-toggle="modal"  data-target='#custbaldetail'  class="btn btn-primary btn-sm btns"><b>Customer Balance Detail</b></button><br>
						     <button type="button" data-toggle="modal"  data-target='#aragingmodal'  class="btn btn-primary btn-sm btns"><b>A/R Aging Summary</b></button><br>
					<!-- 		<button type="button"  class="btn btn-primary btn-sm btns"><b>Sales By Customer</b></button><br>
							<button type="button"  class="btn btn-primary btn-sm btns"><b>Sales By Department</b></button><br>  
							<button type="button"  class="btn btn-primary btn-sm btns"><b>Sales ByProduct</b></button><br> 
							<button type="button"  class="btn btn-primary btn-sm btns"><b>Payments received By Customer</b></button><br> --> 
							</div>
						</div>
					</div>
				</div>

				<div class="modal fade" id="custbaldetail" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width: 95%"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b>Customer Balance Detail Report</b>
								</h5>
							</div>
							<div class="modal-body">
									<div class="row">

										 <div class="col-md-12 col-sm-12">

									<div class="form-group row">
									<label for="inputPassword" class="col-sm-3 col-form-label" style="font-size:15px;"
										style="margin-top: .5%;"><Span style="color: red;"></Span>Customer</label>
									<div class="col-sm-3">
										<select name="customerid" class="form-control text-left"  
											id="customerid" required>
										</select>
									</div>
									<button type="button" style="font-size:16px;" onclick="getcustbaldetails()"
											 class="btn btn-primary btn-sm"> Run Report </button>
					                </div>
					                <br>
					                	
					                <div id="custdiv">
										 <center><h4><b>Sandbox Company_US_1</b></h4></center>
											<center><span style="font-size:20px;">Customer Balance Detail</span></center>
														
														<span id="rangedates"></span>							
											<table id="custdetailtable"
													class="table table-hover table-bordered"
													style="text-align: center;">
													<thead style="background-color: lavender;">
														<tr>
														    <th style="text-align: center">Customer</th>  
															<th style="text-align: center">Date</th>
															<th style="text-align: center">Transaction Type </th>
															<th style="text-align: center">Num</th>
															<th style="text-align: center">Due Date</th>
															<th style="text-align: center">Amount</th>
															<th style="text-align: center">Open Balance</th>
															<th style="text-align: center">Balance</th>
														</tr>
													</thead>
													<tbody id="custdetail">
													</tbody>
												</table>
												</div>
										</div>
									</div>
							</div>
						</div>
					</div>
				</div>
				
				
				
				<div class="modal fade" id="aragingmodal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" style="max-width: 95%"
						role="document">
						<div class="modal-content">
							<div class="modal-header" style="padding: .5rem;">
								<button class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="exampleModalLabel"
									style="font-size: 15px">
									<b>A/R Aging Summary Report</b>
								</h5>
								
							</div>
							<div class="modal-body">
									<div class="row">
										 <div class="col-md-12 col-sm-12">
									 <div class="form-group row">
									<label for="inputPassword" class="col-sm-3 col-form-label" style="font-size:15px;"
										style="margin-top: .5%;"><Span style="color: red;"></Span>Range</label>
									<div class="col-sm-3">
										<select name="daterange" class="form-control"
											id="daterange" required>
									      <!--  <option value="">Select Date Range</option> -->
										   <option value="Today">Today</option>
										   <option value="Yesterday">Yesterday</option>
										   <option value="This Week">This Week</option>
										   <option value="Last Week">Last Week</option>
										   <option value="This Week-to-date">This Week-to-date</option>
										   <option value="Last Week-to-date">Last Week-to-date</option>
										   <option value="Next Week">Next Week</option>
										   <option value="Next 4 Weeks">Next 4 Weeks</option>
										   <option value="This Month">This Month</option>
										   <option value="Last Month">Last Month</option>
										   <option value="This Month-to-date">This Month-to-date</option>
										   <option value="Last Month-to-date">Last Month-to-date</option>
										   <option value="Next Month">Next Month</option>
										   <option value="This Fiscal Quarter">This Fiscal Quarter</option>
										   <option value="Last Fiscal Quarter">Last Fiscal Quarter</option>
										   <option value="This Fiscal Quarter-to-date">This Fiscal Quarter-to-date</option>
										   <option value="Last Fiscal Quarter-to-date">Last Fiscal Quarter-to-date</option>
										   <option value="Next Fiscal Quarter">Next Fiscal Quarter</option>
										   <option value="This Fiscal Year">This Fiscal Year</option>
										   <option value="Last Fiscal Year">Last Fiscal Year</option>
										   <option value="This Fiscal Year-to-date">This Fiscal Year-to-date</option>
										   <option value="Last Fiscal Year-to-date">Last Fiscal Year-to-date</option>
										   <option value="Next Fiscal Year">Next Fiscal Year</option>
										</select>
									</div>
									<button type="button" style="font-size:16px;" onclick="aragingreport()"
											 class="btn btn-primary btn-sm"> <b>Run Report</b> </button>
					                </div> 
					                <br>
					                	
					                <div id="agingdiv">
										 <center><h4><b>Sandbox Company_US_1</b></h4></center>
											<center><span style="font-size:20px;">A/R Aging Summary</span></center>
											<center><span id="rangspan"></span></center>
											<table id="aragingtable"
													class="table table-hover table-bordered"
													style="text-align: center;">
													<thead style="background-color: lavender;">
														<tr>
														    <th style="text-align: center">Customer</th>  
														    <th style="text-align: center">Current</th>  
															<th style="text-align: center">1 - 30</th>
															<th style="text-align: center">31 - 60</th>
															<th style="text-align: center">61 - 90</th>
															<th style="text-align: center">91 and over</th>
															<th style="text-align: center">Total</th>
														</tr>
													</thead>
													<tbody id="aging">
													</tbody>
												</table>
												</div>
										</div>
									</div>
							</div>
						</div>
					</div>
				</div>
				
				
			</div>
		</div>
	</div>

	<script src="resources/js/js/jquery-2.1.4.min.js"></script>
	<script src="resources/js/newjs/bootstrap.min.js"></script>
	<script src="resources/js/newjs/formValidation.min.js"></script>
	<script src="resources/js/newjs/frameworkbootstrap.min.js"></script>
	<script src="resources/js/newdt/jquery.dataTables.min.js"></script>
	<script src="resources/js/newdt/dataTables.bootstrap4.min.js"></script>
	<script src="resources/js/newdt/datatables-init.js"></script>
	<script type="text/javascript" src="resources/js/js/select2.min.js"></script>
	<script src="resources/preDefined/goback.js"></script>
   <!--  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>  -->
<script >

var tabledocse2 = $('#custdetailtable').DataTable({
	"order" : [ [ 0, "asc" ] ],
	lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
	bLengthChange : true,
	paging : true
});

var tabledocse3 = $('#aragingtable').DataTable({
	"order" : [ [ 0, "asc" ] ],
	lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
	bLengthChange : true,
	paging : true
});

$('#custdiv,#agingdiv').hide();
window.onload=function(){
	$.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/text",
		url : "getallcustomers",
		success : function(response) {
		$('#customerid').empty(); 
			  const obj = JSON.parse(response);
				$('#customerid').append($('<option/>').attr("value", '').text("Select Customer"));
			    $.each(obj.IntuitResponse.QueryResponse.Customer, function (index, value) {  
				$('#customerid').append($('<option/>').attr("value",value. Id).text(value.DisplayName));
			 });
		}
	});
}
function getcustbaldetails(){
	$('#custdiv').hide();
	var custid=$('#customerid').val();
	alert(custid)
	$('#custname').text("");
	$.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/text",
		url : "getcustbaldetailreport",
		data : {
			custid : custid,
		},
		success : function(response){
			if(response!=""){
				
				$('#custdetail').empty();
				$('#custdiv').show();
				const obj = JSON.parse(response);
				 var customerName= obj.Rows.Row[0].Header.ColData[0].value;
				 $('#custdetailtable').dataTable().fnClearTable();
		  			if (tabledocse2)tabledocse2.clear();
		  			
		  			 var jsonObj=obj.Rows.Row[0].Rows.Row;
		  		     var count = Object.keys(jsonObj).length;
		  		  
					 for(j=0;j<=count-1;j++){
						 
					 var date=        obj.Rows.Row[0].Rows.Row[j].ColData[0].value;
					 var type=        obj.Rows.Row[0].Rows.Row[j].ColData[1].value;
					 var num=         obj.Rows.Row[0].Rows.Row[j].ColData[2].value;
					 var duedate=     obj.Rows.Row[0].Rows.Row[j].ColData[3].value;
					 var amt=         obj.Rows.Row[0].Rows.Row[j].ColData[4].value;
					 var openbal=     obj.Rows.Row[0].Rows.Row[j].ColData[5].value;
					 var bal=         obj.Rows.Row[0].Rows.Row[j].ColData[6].value;
					 
					 var customerName= obj.Rows.Row[0].Header.ColData[0].value;
					 
					  tabledocse2.row.add([
						    '' + customerName	+ '',
						    '' + date	+ '',
						    '' + type	+ '',
						    '' + num	+ '',
						    '' + duedate	+ '',
						    '' + amt	+ '',
				  			'' + openbal	+ '',
				            '' + bal + '' ]).draw();
				    }
					 var date1=        "<span style='color:green;font-size:16px;'><b>"+obj.Rows.Row[0].Summary.ColData[0].value;+"</b></span>";  
					 var cust1=        obj.Rows.Row[0].Summary.ColData[1].value;
					 var type1=        obj.Rows.Row[0].Summary.ColData[1].value;
					 var num1=         obj.Rows.Row[0].Summary.ColData[2].value;
					 var duedate1=     obj.Rows.Row[0].Summary.ColData[3].value;
					 var amt1=         "<span style='color:green;font-size:16px;'><b>"+obj.Rows.Row[0].Summary.ColData[4].value;+"</b></span>";          
					 var openbal1=     "<span style='color:green;font-size:16px;'><b>"+obj.Rows.Row[0].Summary.ColData[5].value;+"</b></span>";        
					 var bal1=         obj.Rows.Row[0].Summary.ColData[6].value;
					 
					 tabledocse2.row.add([
						    '' + date1	+ '',
						    '' + cust1	+ '',
						    '' + type1	+ '',
						    '' + num1	+ '',
						    '' + duedate1	+ '',
						    '' + amt1	+ '',
				  			'' + openbal1	+ '',
				            '' + bal1 + '' ]).draw();
		  }
		}
	});
}

function aragingreport(){
	var range=$('#daterange').val();
	$('#agingdiv').hide();
	$.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/text",
		url : "getaragingreport",
		data : {
			range : range,
		},
		success : function(response){
			if(response!=""){
				
				$('#agingdiv').show();
				const obj = JSON.parse(response);
				 $('#aragingtable').dataTable().fnClearTable();
		  			if (tabledocse3)tabledocse3.clear();
		  			
		  			 var jsonObj=obj.Rows.Row;
		  		     var count = Object.keys(jsonObj).length;

		  		     var fromdate=obj.Header.StartPeriod;
		  		     var todate=obj.Header.EndPeriod;
		  		   $('#rangspan').empty(rangespan);
		  		     var rangespan="<span style='color:red;font-size:16px;'><b>"+fromdate+"</b></span>" +" TO "+ "<span style='color:red;font-size:16px;'><b>"+todate+"</b></span>"  ;
		  		   $('#rangspan').append(rangespan);
		  		   
		  		   /* 
		  		   **** draw headers ***
		  		   $('#headerid').empty();
		  		    var headers=[];
		  		    headers.push("<tr>")
		  		     for(i=0;i<=count1-1;i++){
		  		    	var head="<td>"+obj.Columns.Column[i].ColTitle+"</td>"
		  		    	headers.push(head)
		  		     }
		  		   headers.push("</tr>")
		  		   $('#headerid').append(headers); */
		  		   
		  		   
					 for(j=0;j<=count-2;j++){
						 
					 var customername= obj.Rows.Row[j].ColData[0].value;
					 var current=      obj.Rows.Row[j].ColData[1].value;
					 var firstdate=    obj.Rows.Row[j].ColData[2].value;
					 var secodate=     obj.Rows.Row[j].ColData[3].value;
					 var thidate=      obj.Rows.Row[j].ColData[4].value;
					 var frdate=       obj.Rows.Row[j].ColData[5].value;
					 var total=        obj.Rows.Row[j].ColData[6].value;
			
					  tabledocse3.row.add([
						    '' + customername	+ '',
						    '' + current	+ '',
						    '' + firstdate	+ '',
						    '' + secodate	+ '',
						    '' + thidate	+ '',
						    '' + frdate	+ '',
				            '' + total + '' ]).draw();
			        } 

					 var customername1=   "<span style='color:green;font-size:16px;'><b>"+obj.Rows.Row[count-1].Summary.ColData[0].value;+"</b></span>";   
					 var current1=        "<span style='color:green;font-size:16px;'><b>"+obj.Rows.Row[count-1].Summary.ColData[1].value;+"</b></span>";   
					 var firstdate1=      "<span style='color:green;font-size:16px;'><b>"+obj.Rows.Row[count-1].Summary.ColData[2].value;+"</b></span>";   
					 var secodate1=       "<span style='color:green;font-size:16px;'><b>"+obj.Rows.Row[count-1].Summary.ColData[3].value;+"</b></span>";   
					 var thidate1=        "<span style='color:green;font-size:16px;'><b>"+obj.Rows.Row[count-1].Summary.ColData[4].value;+"</b></span>";   
					 var frdate1=         "<span style='color:green;font-size:16px;'><b>"+obj.Rows.Row[count-1].Summary.ColData[5].value;+"</b></span>";   
					 var total1=          "<span style='color:green;font-size:16px;'><b>"+obj.Rows.Row[count-1].Summary.ColData[6].value;+"</b></span>";   

					 var row = [''+customername1+'', ''+current1+'', ''+firstdate1+'', ''+secodate1+'', ''+thidate1+'', ''+frdate1+'',''+total1+''];
				     tabledocse3.row.add(row).draw(false);
				     tabledocse3.order([1, 'asc']).draw();
				     tabledocse3.page('last').draw(false);
	}
					}
				});
	}
</script>

</body>
</html>

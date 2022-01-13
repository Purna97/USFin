<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%@ taglib uri="http://java.sun.com/js/p/js/tl/core" prefix="c" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />  -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<div id="right-panel" class="right-panel">
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<div class="row">
					<div class="col">
						<div class="card">
							<h5 class="card-header">US Onboarding- Add W2 Employees</h5>
							<div class="card-body">
								<div class="row">
								<div class="col-md-8 col-sm-12">
									<input type="hidden" name="emptype" id="emptype" value="${emptype}">
									<input type="hidden" name="role" id="role" value="${role}">
									<input type="hidden" name="dept" id="dept" value="${dept}">
										<center><font color=red>Employee Name :</font>&nbsp;&nbsp;<b></b>&nbsp;&nbsp;<font color=red>Employee Number :</font>&nbsp;&nbsp;<b></b>&nbsp;&nbsp;<font color=red>Employee Username :</font>&nbsp;&nbsp;<b></b></center>
										<br>
										<!-- onsubmit="return checkForm(this);" -->
										<fieldset>
										 <form action="/" class="form-horizontal" id="formidFiles" enctype="multipart/form-data"> 
											<br>
											<input type="hidden" name="userid" value="${userid}">
										
											
									<div class="form-group row">
									  <label for="offerletter" class="col-lg-4 control-label" id="offerletter"><Span style="color:red;">*</Span>Upload Offer letter</label>
										<!-- <input type="hidden" id="offerletter" name="offerletter" value="offerletter"> -->
										<div class="col-lg-4">
										<input type="file" id="offer_letter" name="offer_letter"s>
										<%-- <span id="offer" onclick="downloadDocument(${empobj.emp_number},'${attachmentBean.offerletter}','offerletter')" style="color: blue">${attachmentBean.offerletter}</span> --%>
									</div>
									<%-- <button class="btn btn-default btn-xs"  id="edtoff" data-toggle="modal" onclick="editw2Docs('${attachmentBean.offerletter}',${attachmentBean.fileId},'offerletter');">Edit</button> --%>
									</div>
									
									 <div class="form-group row">
									  <label for="empagreement" class="col-lg-4 control-label" id="empagreementlid"><Span style="color:red;">*</Span>Upload Employment agreement</label>
										<!-- <input type="hidden" id="empagreement" name="empagreement" value="empagreement"> -->
										<div class="col-lg-4">
										<input type="file" id="agreement" name="agreement">
										<%-- <span id="empagrement" onclick="downloadDocument(${empobj.emp_number},'${attachmentBean.agreement}','empagreement')" style="color: blue">${attachmentBean.agreement}</span> --%>
									</div>
									<%-- <button class="btn btn-default btn-xs"  id="edtagg" data-toggle="modal" onclick="editw2Docs('${attachmentBean.agreement}',${attachmentBean.afile},'empagreement');">Edit</button> --%>
									</div>
										
									  <div class="form-group row">
									  <label for="i9_form" class="col-lg-4 control-label" id="i9_form"><Span style="color:red;">*</Span>I9 Form Upload</label>
									<!-- 	<input type="hidden" id="i9_form" name="i9_form"  value="i9_form" > -->
										<div class="col-lg-4">
										<input type="file" id="i9" name="i9">
										<%-- <span id="i9file" onclick="downloadDocument(${empobj.emp_number},'${attachmentBean.i9}','i9_form')" style="color: blue">${attachmentBean.i9} </span> --%>
									   </div>
									<%-- <button class="btn btn-default btn-xs"  id="edti9" data-toggle="modal" onclick="editw2Docs('${attachmentBean.i9}',${attachmentBean.ifile},'i9_form');">Edit</button> --%>
									 
									  <div class="col-lg-3 control-label"> 
									    <button class="btn btn-success btn-sm" type="button" onclick="i9Formadd();">
										<span class="glyphicon glyphicon-plus" aria-hidden="true">+</span>
									  </button></div>
									</div>
								    <div id="i9FormBtnDiv"></div>
										
									<div class="form-group row">
									  <label for="w4_form" class="col-lg-4 control-label" id="w4_form"><Span style="color:red;">*</Span>W4 Form Upload</label>
										<!-- <input type="hidden" id="w4_form" name="w4_form" value="w4_form" > -->
										<div class="col-lg-4">
										<input type="file" id="w4" name="w4">
										<%-- <a href="USOBT_BasicDetails?action=downloadocs&empno=${empobj.emp_number}&filetype=w4_form&filename=${attachmentBean.w4}" style="color:blue;"><span id="w4file">${attachmentBean.w4}</span></a> --%>
									</div>
									<%-- <button class="btn btn-default btn-xs"  id="edtw4" data-toggle="modal" onclick="editw2Docs('${attachmentBean.w4}',${attachmentBean.wfile},'w4_form');">Edit</button> --%>
									</div>
									<div class="form-group row">
									<label class="col-lg-4 control-label"><b>Supporting Documents For I9 Form</b></label>
	                                	 <div class="col-lg-3 control-label"> 
									    <button class="btn btn-success btn-sm" type="button" onclick="i9SupportingAdd();">
										<span class="glyphicon glyphicon-plus" aria-hidden="true">+</span>
									  </button></div>
									  <span id="moredoc"></span>
									</div>
								    <div id="i9SupporBtnDiv"></div> 
								    
								    <div class="form-group row">
									<label class="col-lg-4 control-label"><b>Other Additional Documents</b></label>
	                                	 <div class="col-lg-3 control-label"> 
									    <button class="btn btn-success btn-sm" type="button" onclick="OtherAdditional();">
										<span class="glyphicon glyphicon-plus" aria-hidden="true">+</span>
									  </button></div>
									  <span id="w2moredoc"></span>
									</div>
								    <div id="OtherBtnDiv"></div>  
									
						            <br>
												<center>
												
												<div class="text-center ml-5">
												<input type="button" onclick="saveDocuments()" class="btn btn-success" style="padding:7px;background-color:green;color:white;text-transform:INITIAL;line-height:0.728571;" value="Upload Documents" id="allDocs">
												<input type="Reset" class="btn btn-default btn-sm" style="padding:7px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;" value="Reset">
												<button onclick="goBack()" class="btn btn-default btn-sm" style="padding:7px;background-color:grey;color:white;line-height:0.728571;">Back</button>			
												
																		
											</div></center>
								 </form>	
										</fieldset>
								</div>
							</div>
							
							
						</div>
					</div>
					</div>
					</div>
						<form action="searchlist" method="post" id="bformid">
				<input type="hidden"  name="semp_type"  value="${semp_type}">
				<input type="hidden" name="susername"  value="${susername}">
  	        	<input type="hidden"  name="sfullname"  value="${sfullname}">
			    <input type="hidden"  name="spendingdocs"  value="${spendingdocs}">
			    <input type="hidden" name="s_subtype"  value="${s_subtype}">
			      <input type="hidden" name="empstatus" value="${sempstatus}">
				</form> 
					
						
					<center><div class="modal fade" id="w2Modal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true" style="top:150px;">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
								<%-- <form class='form form-horizontal validate-form' action="EditFile?action=addEditfile" method="post"
								style='margin-bottom: 0;' enctype="multipart/form-data">
								<input type="hidden" id="userid" name="userid" value="${userid}">
								<input type="hidden" id="fileType1" name="fileType"> <input
									type="hidden" id="fileid1" name="fileId"> <input
									type="hidden" id="filename1" name="filename1"> <input
									type="hidden" id="ssn_no" name="ssn_no" value="${ssn_no}">
								<input type="hidden" name="empno" value="${empno}"> <input
									type="hidden" name="emptype" value="${emptype}">
							 <div class="modal-body">
								<div class="col-sm-4">
									<label>File Name:</label> <span id="span1"></span>
								</div>
									 <div class="form-group">
									  <label class="col-lg-3 control-label" ><Span style="color:red;">*</Span>Upload File :</label>
										<div class="col-lg-3">
										<input type="file" id="editFile" name="editFile"  class="form-control text-left" onchange="ValidateSize(this)"
											required /><br>
									</div>
									</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">Save
									changes</button>
							</div>
							</form> --%>
						</div>
					</div>
				</div></center>
				 </div></div></div>
 <!-- Javascripts-->
<script src="resources/js/js/jquery-2.1.4.min.js"></script> 
<script src="resources/preDefined/goback.js"></script>
<!-- <script type="text/javascript" src="resources/preDefined/goback.js"></script>  -->
<script>
	function w4upload(){
		/* alert("yes"); */
		$("#w4uploaddetails").show();	
};
</script>
<script type="text/javascript">
var icval = 0;
var max_field=15;
function i9Formadd() {
	icval++;      
	$('#allDocs').removeAttr("disabled");
	$('#i9FormAddBtnCount').val(icval);
    var objTo = document.getElementById('i9FormBtnDiv');
    var divtest = document.createElement("div");
	divtest.setAttribute("class", "form-group row removeclass"+icval);
	var rdiv = 'removeclass'+icval;
    divtest.innerHTML = '<div class="col-lg-4"><div class="form-group row"> <input type="text" class="form-control" name="i9forminput'+icval+'" placeholder="Enter Document name" required><input type="hidden" value="'+icval+'" name="i9FormAddBtnCount"></div></div><div class="col-lg-4"><div class="form-group row"> <input type="file" class="form-control" name="i9formFile'+icval+'" placeholder="I9 add doc" onchange="ValidateSize(this)" required></div></div><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="removefieldsaddi9('+icval+');"> <span class="glyphicon glyphicon-minus" aria-hidden="true">-</span> </button></div></div></div></div><div class="clear"></div>';
    if(icval<=max_field){
   	 objTo.appendChild(divtest);
   }else if(icval>max_field){
   	 alert("Cannot upload more than 15 documents!!");
   }
}
function removefieldsaddi9(rid) {
	   $('.removeclass'+rid).remove();
	   icval--;
	}

var sp_icval = 0;
function i9SupportingAdd() {
	sp_icval++;      
		$('#allDocs').removeAttr("disabled");
		$('#i9supportbtncount').val(sp_icval);
	    var objTo = document.getElementById('i9SupporBtnDiv');
	    var divtest = document.createElement("div");
		divtest.setAttribute("class", "form-group row removeclass"+sp_icval);
		var rdiv = 'removeclass'+sp_icval;
	    divtest.innerHTML = '<div class="col-lg-4"><div class="form-group row"> <input type="text" class="form-control" name="i9supportinput'+sp_icval+'"  placeholder="Enter Document name" required><input type="hidden" value="'+sp_icval+'" name="i9supportbtncount"></div></div><div class="col-lg-4"><div class="form-group row"> <input type="file" class="form-control" name="i9supportFile'+sp_icval+'" placeholder="I9 add doc" onchange="ValidateSize(this)" required></div></div><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="removefieldsupporti9('+sp_icval+');"> <span class="glyphicon glyphicon-minus" aria-hidden="true">-</span> </button></div></div></div></div><div class="clear"></div>';
	    if(sp_icval<=max_field){
	   	 objTo.appendChild(divtest);
	   }else if(sp_icval>max_field){
	   	 alert("Cannot upload more than 15 documents!!");
	   }
	}
	function removefieldsupporti9(rid) {
		   $('.removeclass'+rid).remove();
		   sp_icval--;
	}

	var io_cval = 0; 
function OtherAdditional() { 
	io_cval++;      
		$('#allDocs').removeAttr("disabled");
		$('#OtherBtnCount').val(io_cval);
	    var objTo = document.getElementById('OtherBtnDiv');
	    var divtest = document.createElement("div");
		divtest.setAttribute("class", "form-group row removeclass"+io_cval);
		var rdiv = 'removeclass'+io_cval;
	    divtest.innerHTML = '<div class="col-lg-4"><div class="form-group row"> <input type="text" class="form-control" name="otherAddtnlinput'+io_cval+'"  placeholder="Enter Document name" required><input type="hidden" value="'+io_cval+'" name="OtherBtnCount"></div></div><div class="col-lg-4"><div class="form-group row"> <input type="file" class="form-control" name="otherAddtnlFile'+io_cval+'" placeholder="I9 add doc" onchange="ValidateSize(this)" required></div></div><div class="input-group-btn"> <button class="btn btn-danger" type="button" onclick="removefieldsupporti9('+io_cval+');"> <span class="glyphicon glyphicon-minus" aria-hidden="true">-</span> </button></div></div></div></div><div class="clear"></div>';
	    if(io_cval<=max_field){
	   	 objTo.appendChild(divtest);
	   }else if(io_cval>max_field){
	   	 alert("Cannot upload more than 15 documents!!");
	   }
	}
	function removefieldsupporti9(rid) {
		   $('.removeclass'+rid).remove();
		   io_cval--;		  
	}
	
    </script>
    <script type="text/javascript">
    $('#allDocs').attr("disabled", "disabled");
    </script>
    <script>
    $('input[type="file"]').change(function(e){
        var fileName = e.target.files[0].name;
        $('#allDocs').removeAttr("disabled");
    });
    	
    </script>
  
	<script>
	$('#span1').text('');
	/* function editw2Docs(fname,fid,ftype){
	//alert(fname+""+fid+""+ftype);
	//var encoded = encodeURIComponent(fname);	
		 $('#fileType1').val(ftype);
		 $('#fileid1').val(fid);
		 $('#filename1').val(fname);
		 $('#span1').text(fname); 
		 $('#w2Modal').modal('show');  
		 $("#formidFiles").submit(function(e){
		        e.preventDefault();
		    });
		} ;  */
</script>
<script>
/* function deleteDocFnC2C(fileid,empno,userid,etype){
	//alert(fileid+""+empno+""+userid+""+etype);
	 $.ajax({
	    	type : "POST",
	        asyn : false,
	        contentType: "application/json", // NOT dataType!
	        url  : "DeleteFile?fileId="+fileid+"&userid="+userid+"&empno="+empno+"&emp_type="+etype,
	        success  : function(response){
	        	 alert("File deleted successfully");
	        	 window.location.href = "USOBT_BasicDetails?action=adddoc&empno="+empno+"&userid="+userid+"&emptype="+etype+"";
	        	 $( "#offer" ).val('');
	        	 $( "#empagrement" ).val('');
	        	 $( "#i9file" ).val('');
	        	 $( "#w4" ).val('');
	    		 $("#formidFiles").submit(function(e){
	    		        e.preventDefault();
	    		    });
	        },
	 error : function() {
            }
		    });
} */
</script>


<!-- <script>
$( document ).ready(function() {
	 var ofletter=document.getElementById("offer").innerText;
    if(ofletter!=""){
    	var msg="Offer Letter";
        $("#edtoff").show();
        $("#delDocC2C1").show();
        $("#offer_letter").hide();
        $("#offerletter").text(msg);
        }
        else{
        	 $("#edtoff").hide();
        	 $("#delDocC2C1").hide();
        	  $("#offer_letter").show();
        }
    
});
</script>  
<script>
$( document ).ready(function() {
	 var aggrement=document.getElementById("empagrement").innerText;
	 if(aggrement!=""){
		 var msg="Agreement";
	        $("#edtagg").show();
	        $("#delDocC2C2").show();
	        $("#agreement").hide();
	        $("#empagreementlid").text(msg);
	        }
	        else{
	         $("#edtagg").hide();
	         $("#delDocC2C2").hide();
	         $("#agreement").show();
	        }
	
});
</script>

<script>
$( document ).ready(function() {
	 var file9=document.getElementById("i9file").innerText;
	 if(file9!=""){
		 var msg="I9Form";
	    	$("#delDocC2C3").show();
	        $("#edti9").show();
	        $("#i9").hide();
	        $("#i9_form").text(msg);
	        }
	        else{
	        	$("#edti9").hide();
	            $("#delDocC2C3").hide();
	            $("#i9").show();
	        }
	
});
</script>

<script>
$( document ).ready(function() {
	var filew=document.getElementById("w4file").innerText;
	 if(filew!=""){
		 var msg="W4Form";
	        $("#edtw4").show();
	        $("#delDocC2C4").show();
	        $("#w4").hide();
	        $("#w4_form").text(msg);
	        }
	        else{
	         $("#edtw4").hide();
	         $("#delDocC2C4").hide();
	         $("#w4").show();
	        }
});
</script>-->
 <script>
	function addfieldsI9(empno,userid){
		getsesVal().done(function(data){
			  if(data!=""){
		 var modal="#I9AddModal";
		 $.ajax({
				type : "get",
				url : "USOBT_BasicDetails?action=viewI9AdditionalDocs&empno="+empno+"&userid="+userid,
				cache : false,
				async : false,
				success : function(response) {
					var list1 = response.length;
					//alert(list1);
					 $( modal ).show();
				},
				error : function() {
				}
			});
			  }else{
					 window.location.href="loginpage";
				}
			});
		}; 
</script>

<script type="text/javascript">
function downloadDocument(empno,fname,ftype){
	getsesVal().done(function(data){
		  if(data!=""){
	//alert('downloadDocument'+empno+fname+ftype);
	var encoded = encodeURIComponent(fname);	
	$.ajax({
		type: "get",
		url: "USOBT_BasicDetails?action=downloadocs&empno="+empno+"&filename="+encoded+"&filetype="+ftype,
		cache: false,
		async: false, 				
		//data:"comment="+comment,
		
		success: function(response){
			window.location='USOBT_BasicDetails?action=downloadocs&empno='+empno+'&filename='+encoded+'&filetype='+ftype;
		},
		error: function(){	
								
			alert('Error while request..');
		}
		
	});
		  }else{
				 window.location.href="loginpage";
			}
		});
}	

function checkForm(form)
{
	getsesVal().done(function(data){
    if(data!=""){
	 var offer_letter = $('#offer_letter').val(); 
     var agreement = $('#agreement').val(); 
     var i9 = $('#i9').val(); 
     var pd = $('#pendingDocs').val(); 
     var i9_doc=$("input[name='i9_doc[]']").length;
     var w2_doc=$("input[name='w2_doc[]']").length;
     var i9add_doc=$("input[name='i9add_doc[]']").length;
     var i9add_doc=$("#i9add_doc").val();
     var filenames = ';';
     
      if(offer_letter!='' || agreement!='' || i9!='' || i9_doc>0 || w2_doc>0 || i9add_doc!='') 
     { 
 	    return true;
     }else{
    	  alert( 'Please select file' );
    	  return false;
      } 
    }else{
		 window.location.href="loginpage";
	}
});
}


function saveDocuments(){
	getsesVal().done(function(data){
		  if(data!=""){
    	 $("#allDocs").attr("disabled",true);
 		 var form = $('#formidFiles')[0];
 	     var data = new FormData(form);
 		$.ajax({
 	            url: "saveEmpDocuments", //this is the submit URL
 	            type: "POST",
 	            enctype: 'multipart/form-data',
 	            data: data,
 	            processData: false,
 	            contentType: false,
 	            cache: false,
 	            success: function(response){
 	   	        if(response!=null || response!=""){
 	   	             alert(response);
 	   	         window.location.href="viewEmpDocuments?userid="+userid+"";
 	   	   	        }
 	   	            else{
 	   	          window.location.href="loginpage";
 	   	   	            }
 	            }
 	        });
		  }else{
				 window.location.href="loginpage";
			}
		});
}

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
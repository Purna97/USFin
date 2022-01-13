function goBack() {
			/*$('#b_Emp_type').val($('#semp_type').val());
			$('#b_username').val($('#susername').val());
			$('#b_fullname').val($('#sfullname').val());
			$('#b_pendingdocs').val($('#pendingdocs').val());
			$('#b_emp_type').val($('#spendingdocs').val());*/
			document.getElementById("bformid").submit();
}
function getsesVal() {
	return $.ajax({
    	   type : "GET",
    	   asyn : false,
          contentType: "application/json", // NOT dataType!
    	   url:"checkSessionUserName", 
		   success:function(data) {
		    }
	  });
}
$('input').attr("autocomplete", 'off');
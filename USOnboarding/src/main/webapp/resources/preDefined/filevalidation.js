 //$('input[type="file"]').attr("accept", ".jpeg,.xls,.xlsx,.jpg,.png,.pdf,.doc,.docx");
$('#Cust_MSA,#Ven_MSA,#exe_irs_w9_form,#insu_certi,#std_cert,#certi_corp,#cw_order,#w_order,#cagreement,#cCompliance,#bfile,#offer_letter,#agreement,#i9,#w4,#editFile,#WA_copy,#W9_copy,#SSNCopy').attr("accept", ".jpeg,.xls,.xlsx,.jpg,.png,.pdf,.doc,.docx,.pptx,.txt,.tiff");
//$('#mgr_approved_mail_VWO,#mgr_approved_mail_CWO,#mgr_approved_mail').attr("accept",".msg");
function ValidateSize(file) {
	var FileSize = file.files[0].size/1024/1024;
	 var filename = file.files[0].name;
	 var type = $(file).val().split(".").pop().toLowerCase();
        if (FileSize > 50) {
            alert('File size exceeds 50 MB');
            $(file).val('');
        } else {
        	if(type=="pdf" || type=="png" || type=="docx" || type=="doc"|| type=="jpg"|| type=="jpeg" || type=="xlsx" || type=="xls" || type=="pptx" || type=="txt" || type=="tiff"){
        	$.ajax({
        		type : "GET",
 		        asyn : false,
 		        contentType: "application/json",
				url : "checkSelectedFileName?filename="+filename,
				cache : false,
				async : false,
				success : function(response) {
				  if(response=='Uploaded'){
						alert("This file is already "+response + ". Please check");
						$(file).val('');
					}else{
						
					}
				},
				error : function() {
				}
			});
        	}else{
    	    	 $(file).val('');
    	    	 alert("Please upload file with docx, doc, png, jpg, jpeg, xls, xlsx, pptx, txt, tiff or pdf file format");
    		    }
        }
    }
function ValidateMsgFile(file) {
	var FileSize = file.files[0].size/1024/1024;
	 var filename = file.files[0].name;
	 var type = $(file).val().split(".").pop().toLowerCase();
        if (FileSize > 50) {
            alert('File size exceeds 50 MB');
            $(file).val('');
        } else {
        	if(type=="msg" || type=="eml"){
        	$.ajax({
        		type : "GET",
 		        asyn : false,
 		        contentType: "application/json",
 		        url : "checkSelectedFileName?filename="+filename,
				cache : false,
				async : false,
				success : function(response) {
				  if(response=='Uploaded'){
						alert("This file is already "+response + ". Please check");
						$(file).val('');
					}else{
						
					}
				},
				error : function() {
				}
			});
        	}else{
    	    	 $(file).val('');
    	    	 alert("Please upload file with .msg or .eml file format");
    		    }
        }
    }

function downloadDocument(fname,ftype){	
	var candidate_id=$('#candidate_id').val();
	var encoded = encodeURIComponent(fname);	
	window.location.href="downloadocs?filename="+encoded+"&filetype="+ftype+"&candidate_id="+candidate_id;
}
function ValidateFileSize(file) {
	var candidateid = document.getElementById('candidateid').value;
	if($(file).val()!=""){
	var FileSize = file.files[0].size/1024/1024;
	 var filename = file.files[0].name;
	 var type = $(file).val().split(".").pop().toLowerCase();
        if (FileSize > 50) {
            alert('File size exceeds 50 MB');
            $(file).val('');
        } else {
        	if(type=="pdf" || type=="png" || type=="docx" || type=="doc"|| type=="jpg"|| type=="jpeg" || type=="xlsx" || type=="xls" || type=="pptx" || type=="txt" || type=="tiff"){
        	$.ajax({
        		type : "GET",
				contentType : "application/json", // NOT dataType!
				url : "checkSelectedFileNameById",
				cache : false,
				async : false,
				data : {
					"filename":filename,
		        	"candidateid" : candidateid,
				},
				success : function(response) {
				  if(response=='Uploaded'){
						alert("This file is already "+response + ". Please check");
						$(file).val('');
					}else{
						
					}
				},
				error : function() {
				}
			});
        	}else{
    	    	 $(file).val('');
    	    	 alert("Please upload file with docx, doc, png, jpg, jpeg, xls, xlsx, pptx, txt, tiff or pdf file format");
    		    }
        }
    }else{
    	//alert("No file");
    }
}

$("#initiatebutton").click(function(){
		 $('#init_candidateid').val('');
		var candidateid = document.getElementById('candidateid').value;
		$('input[name=lcaTypeInP]').attr('checked', false);
		$.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "getCanidateDetailsByCanId",
			data : {
				candidateid : candidateid
			},
			success : function(response) {
			if(response!=null){
			var workauth=response.work_authorization;
			var emp_type=response.emp_type;
			
			if(emp_type=="W2" && (workauth!="US Citizen" || workauth!="Green Card")){
				//alert("W2 H-1B");
				$('#lcaTypeInP').attr("disabled",true).prop("title","You can't choose In House Project As Candidadate has client poject");
				$('#lcaTypeCP').attr("disabled",false);
			  }else{
				 // alert("no H-1B");
				  $('#lcaTypeInP').attr("disabled",false);
				  $('#lcaTypeCP').attr("disabled",true).prop("title","You can't choose Client Project As Candidadate has In House Project");
			      }
			  }
			$('#init_candidateid').val(candidateid);
		 	$('#init_remoteAddress,#init_remoteAddress1').hide();
		  	//$("#init_worklocation1,#init_worklocation2").prop("checked", false);
		 	 $('input[name=init_worklocation]').attr('checked', false);
		 	 $('#init_lcaqbtnUpdateId').hide();
		 	//$('#init_LCAQDetailsForm').bootstrapValidator('resetForm', true);
			//document.getElementById("updatedocformid").reset();
		 	 $('#init_endClientName').empty();
			 $('#initlcadetailsmodal').modal('show');
			 }
		});
		
	});
	
	
	 
	/* $("#client").change(function(){
		$('#lcadiv').hide();
		$('#immi').show();
		var client = document.getElementById('client').value;
		if(client!=""){
			$('#clientid').val(client);
		}
	}); */
	/*$("#cancle,#btn-colorb").click(function(){
		$('#taskmodal,#addtaskmodal').modal('hide');
	});*/
	$('#addtaskmodal').on('shown.bs.modal', function (){
		 document.getElementById("addTaskForm").reset();
		 $('#addTaskForm').bootstrapValidator('resetForm', true);
	});
	
	$('#addtaskmodal').on('hidden.bs.modal', function (){
		 document.getElementById("addTaskForm").reset();
		 $('#addTaskForm').bootstrapValidator('resetForm', true);
	});
	
	$('#addh1taskmodal').on('shown.bs.modal', function (){
		 document.getElementById("addTaskForm").reset();
		 $('#addh1TaskForm').bootstrapValidator('resetForm', true);
	});
	
	$('#addh1taskmodal').on('hidden.bs.modal', function (){
		 document.getElementById("addTaskForm").reset();
		 $('#addh1TaskForm').bootstrapValidator('resetForm', true);
	});
	
	$('#taskmodal').on('shown.bs.modal', function (){
	  // $('#updateTaskForm').bootstrapValidator('resetForm', true);
	});
	$('#taskmodal').on('hide.bs.modal', function (){
		$('#updateTaskForm').bootstrapValidator('resetForm', true);
	});
	 
	$('#updateh1taskmodal').on('hide.bs.modal', function (){
		$('#updateh1TaskForm').bootstrapValidator('resetForm', true);
	});
	
	$("lcahistory").click(function(){
		$('#lcahistorymodal').modal('show');
	});
	
	var tablefh = $('#lcadatatable').DataTable({
		"order" : [ [ 0, "desc" ] ],
		lengthMenu : [ [ 5, 10, 15, -1 ], [ 5, 10, 15, "All" ] ],
		bLengthChange : true,
		paging : true
	});
	
	var tablelcas = $('#alllcatableid').DataTable({
		"order" : [ [ 0, "desc" ] ],
		lengthMenu : [ [ 5, 10, 15, -1 ], [ 5, 10, 15, "All" ] ],
		bLengthChange : true,
		paging : true
	});
	var tabletasks = $('#alltasktableid').DataTable({
		"order" : [ [ 0, "desc" ] ],
		lengthMenu : [ [ 5, 10, 15, -1 ], [ 5, 10, 15, "All" ] ],
		bLengthChange : true,
		paging : true
	});
	
	$("#lcatab").click(function(){
		$('#lcadiv').show();
		$('#h1bdiv,#pafdiv,#tasksdiv,#viewalltaskdetailsbtn').hide();
		var candidateid = document.getElementById('candidateid').value;
	/* 	var clientid = document.getElementById('clientid').value; */
		var candiname=$("#candidate option:selected").text();
		$('#amcandidateid').val(candidateid);
		//$('#amclientid').val(clientid);
		$.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "gettaskdetails",
			data : {
				candidateid : candidateid,
				type:"LCA"
			},
			//clientid : clientid,
			success : function(response) {
			
				var tasklist=response.alltaskList;
				var lcaList=response.alllcaList;
				var clientList=response.endclientList;
				var acitveInacitveLCA=response.acitveInacitveLCAList;
				$('#alltasktableid').dataTable().fnClearTable();
				$('#alllcatableid').dataTable().fnClearTable();
	  			if(lcaList!=""){
	  			if (tablelcas)tablelcas.clear();
	  			for(var i=0;i<acitveInacitveLCA.length;i++){
	  				var lca_number="";var lcadoc_count="";var action;
	  				if(acitveInacitveLCA[i].lca_number!=null){
	  					lca_number=acitveInacitveLCA[i].lca_number+"/ RN"+acitveInacitveLCA[i].lca_reference+"";
	  				
					}else{
						lca_number="NA"+"-RN"+acitveInacitveLCA[i].lca_reference+"";
					}
	  				if(acitveInacitveLCA[i].lcadoc_count==0){
						//lcadoc_count="Pending";
	  					action="<a class='btn btn-secondary btn-sm addButton' disabled style='letter-spacing: 1px; background-color: #15aabf; color: white;padding:3px;text-transform:INITIAL;line-height:0.728571;' title='No Data Availabe'>" + lca_number	+ "</a>";
	  					lcadoc_count="Pending <a class='btn btn-danger btn-sm' style='padding:3px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;' onclick='deleteRefNo("+acitveInacitveLCA[i].lca_id+");' title='Delete Reference Number'><i class='fa fa-trash'></i></a>";
					}else if(acitveInacitveLCA[i].lcadoc_count==1){
						//lcadoc_count="Initiated";
						action="<a class='btn btn-secondary btn-sm addButton' data-toggle='modal' onclick='viewLCADocuments("+acitveInacitveLCA[i].lca_id+");' style='letter-spacing: 1px; background-color: #15aabf; color: white;padding:3px;text-transform:INITIAL;line-height:0.728571;'>" + lca_number	+ "</a>";
	  					if(acitveInacitveLCA[i].lcastatus=='Active'){
	  						lcadoc_count="Initiated <a class='btn btn-danger btn-sm' style='padding:3px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;' onclick='inactiveRefNo("+acitveInacitveLCA[i].lca_id+");' title='Inactive Reference Number'><i class='fa fa-ban'></i></a>";
	  					}else{
	  						lcadoc_count="Initiated <a class='btn btn-danger btn-sm' style='padding:3px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;' disabled><i class='fa fa-ban'></i></a>";
	  					}
					}else if(acitveInacitveLCA[i].lcadoc_count==2){
						//lcadoc_count="Certified"; onclick='inactiveRefNo("+acitveInacitveLCA[i].lca_id+");'
						action="<a class='btn btn-secondary btn-sm addButton' data-toggle='modal' onclick='viewLCADocuments("+acitveInacitveLCA[i].lca_id+");' style='letter-spacing: 1px; background-color: #15aabf; color: white;padding:3px;text-transform:INITIAL;line-height:0.728571;'>" + lca_number	+ "</a>";
						if(acitveInacitveLCA[i].lcastatus=='Active'){
							lcadoc_count="Certified <a class='btn btn-danger btn-sm' style='padding:3px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;' onclick='inactiveRefNo("+acitveInacitveLCA[i].lca_id+");' title='Inactive Approved LCA'><i class='fa fa-ban'></i></a>";
						}else{
						   lcadoc_count="Certified <a class='btn btn-danger btn-sm' style='padding:3px;background-color:grey;color:white;text-transform:INITIAL;line-height:0.728571;' disabled><i class='fa fa-ban'></i></a>";
						}
					}else if(acitveInacitveLCA[i].lcadoc_count==3){
						action="<a class='btn btn-secondary btn-sm addButton' data-toggle='modal' onclick='viewLCADocuments("+acitveInacitveLCA[i].lca_id+");' style='letter-spacing: 1px; background-color: #15aabf; color: white;padding:3px;text-transform:INITIAL;line-height:0.728571;'>" + lca_number	+ "</a>";
						lcadoc_count="Completed";
					}
	  				
	  		   tablelcas.row.add([
	  			''+action+'',
	  			'<a class="btn btn-secondary btn-sm addButton" onclick="viewLCADetails('+acitveInacitveLCA[i].lca_id+')"><i class="fa fa-eye"></i></a>',
	  			'' + acitveInacitveLCA[i].client_name	+ '',
	  			'' + acitveInacitveLCA[i].enclientsatus	+ '',
	  			'' + lcadoc_count+ '',
	  			'' + acitveInacitveLCA[i].lcastatus+ '', ]).draw();
	  			}
	  			
	  			$("#alllcadocListId").hide();
	  		   }else{
	  			$("#alllcadocListId").hide();
	  		   } 
	  			
				$('#client,#lcaclient').empty();
				$('#client,#lcaclient').append($('<option/>').attr("value", '').text("Select Client"));
				for (var i = 0; i < clientList.length; i++) {
					$('#client,#lcaclient').append($('<option/>').attr("value",clientList[i].clientid).text(clientList[i].clientName));
				}
				if(tasklist!=null){
		  			if (tabletasks)tabletasks.clear();
		  			for(var i=0;i<tasklist.length;i++){
		  				var lca_number="";
		  			//	alert(tasklist[i].lca_number);
		  				if(tasklist[i].lca_number!=null){
		  					if(tasklist[i].lca_number==""){
		  						lca_number="RN"+tasklist[i].lca_reference+"";
		  					}else{
		  						lca_number=tasklist[i].lca_number+"/ RN"+tasklist[i].lca_reference+"";
		  					}
		  					
						}else{
							lca_number="NA"+"-RN"+tasklist[i].lca_reference+"";
						}	
		  	var created_date = dateFormatdates(tasklist[i].created_date);
		  	tabletasks.row.add([
		  			'' + candiname	+ '',		  			
		  			'' + tasklist[i].task_name	+ '',
		  			'' + tasklist[i].task_description	+ '',
		  			'' + lca_number	+ '',
		  			/*'' + tasklist[i].clientName	+ '',*/
		  			'' + created_date	+ '',
		  			'' + tasklist[i].due_date	+ '',
		  			'' + tasklist[i].task_status	+ '',
		  			'<a class="btn btn-secondary btn-sm" data-toggle="modal" onclick="viewtask('+tasklist[i].task_id+')" ><i class="fa fa-edit"></i></a>', ]).draw();
		  			}
		  			$("#alltasksListId").hide();
		  		   }else{
		  			// $("#alltasksListId").hide();
		  		   }
			
			}
		});
	});
	
	$("#client").change(function(){
		var clientid = document.getElementById('client').value;
		var candidateid = document.getElementById('candidateid').value;
		if (tabletasks)tabletasks.clear();
		$('#alltasktableid').dataTable().fnClearTable();
		$.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "gettasksbyclientid",
			data : {
				candidateid : candidateid,
				clientid : clientid,
				type:"LCA",
			},
			success : function(response) {
				var tasklist=response.alltaskList;
				if(tasklist!=""){
		  			for(var i=0;i<tasklist.length;i++){
		  				
		  				var lca_number="";
		  				//alert(tasklist[i].lca_number);
		  				if(tasklist[i].lca_number!=null){
		  					if(tasklist[i].lca_number==""){
		  						lca_number="RN"+tasklist[i].lca_reference+"";
		  					}else{
		  						lca_number=tasklist[i].lca_number+"/ RN"+tasklist[i].lca_reference+"";
		  					}
						}else{
							lca_number="NA"+"-RN"+tasklist[i].lca_reference+"";
						}	
		  				
		  	tabletasks.row.add([
		  			'' + $("#candidate option:selected").text()	+ '',
		  			'' + tasklist[i].task_name	+ '',
		  			'' + tasklist[i].task_description	+ '',
		  			'' + lca_number	+ '',
		  			'' + tasklist[i].clientName	+ '',
		  			'' + tasklist[i].created_date	+ '',
		  			'' + tasklist[i].due_date	+ '',
		  			'' + tasklist[i].task_status	+ '',
		  			'<a class="btn btn-secondary btn-sm" data-toggle="modal" onclick="viewh1task('+tasklist[i].task_id+')" ><i class="fa fa-edit"></i></a>', ]).draw();
		  			}
		  			
		  		   }
			}
		});
	}); 
	
	$("#lcaclient").change(function(){
		var clientid = document.getElementById('lcaclient').value;
		var candidateid = document.getElementById('candidateid').value;
		if (tablelcas)tablelcas.clear();
		$('#alllcatableid').dataTable().fnClearTable();
		$.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "gettasksbyclientid",
			data : {
				candidateid : candidateid,
				clientid : clientid,
				type:"LCA",
			},
			success : function(response) {
				var lcaList=response.alllcaList;
			
	  			if(lcaList!=""){
	  			if (tablelcas)tablelcas.clear();
	  			for(var i=0;i<lcaList.length;i++){
	  				var lca_number="";var lcadoc_count=0;
	  				if(lcaList[i].lca_number!=null){
	  					lca_number=lcaList[i].lca_number+"/ RN"+lcaList[i].lca_reference+"";
					}else{
						lca_number="NA"+"-RN"+lcaList[i].lca_reference+"";
					}	
	  				if(lcaList[i].lcadoc_count==0){
						//lcadoc_count="Pending";
						lcadoc_count="Pending <a class='btn btn-danger btn-sm' style='padding:3px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;' onclick='deleteRefNo("+lcaList[i].lca_id+");' title='Delete Reference Number'><i class='fa fa-trash'></i></a>";
					}else if(lcaList[i].lcadoc_count==1){
						//lcadoc_count="Initiated";
						lcadoc_count="Initiated <a class='btn btn-danger btn-sm' style='padding:3px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;' onclick='inactiveRefNo("+lcaList[i].lca_id+");' title='Inactive Reference Number'><i class='fa fa-ban'></i></a>";
					}else if(lcaList[i].lcadoc_count==2){
						//lcadoc_count="Certified";
						lcadoc_count="Certified <a class='btn btn-danger btn-sm' style='padding:3px;background-color:red;color:white;text-transform:INITIAL;line-height:0.728571;' onclick='inactiveRefNo("+lcaList[i].lca_id+");' title='Inactive Approved LCA'><i class='fa fa-ban'></i></a>";
					}else if(lcaList[i].lcadoc_count==3){
						lcadoc_count="Completed";
					}
	  		   tablelcas.row.add([
	  			'<a class="btn btn-secondary btn-sm addButton" data-toggle="modal" disabled onclick="viewLCADocuments(\''+lcaList[i].lca_id+'\');" style="letter-spacing: 1px; background-color: #15aabf; color: white;padding:3px;text-transform:INITIAL;line-height:0.728571;">' + lca_number	+ '</a>',
	  			'' + lcaList[i].client_name	+ '',
	  			'' + lcaList[i].enclientsatus	+ '',
	  			'' + lcadoc_count+ '', ]).draw();
	  			}
	  	
	  		   }
			}
		});
	});
	
	function inactiveRefNo(lcaid){
		var result = confirm("Are you sure to inactive LCA reference number.");
		if(result==true){
		$.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "inactiveRefNo",
			data : {
				lcaid : lcaid
			},
			success : function(response) {
				alert(response);
						$('#candidate').trigger("change");
						$('.collapsiblelca').trigger("click");
						
			}
		});
		}
	}
	
	function deleteRefNo(lcaid){
		var result = confirm("Are you sure to Delete LCA reference number.");
		if(result==true){
		$.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "deleteRefNo",
			data : {
				lcaid : lcaid
			},
			success : function(response) {
						if(response=='Success'){
							alert("LCA Reference Number Deleted!!");
						}else{
							alert("Failed to Delete LCA Reference Number !!");
						}
						$('#candidate').trigger("change");
						$('.collapsiblelca').trigger("click");
						
			}
		});
		}
	}
	$("#addtask").click(function(){
		var clientid = document.getElementById('clientid').value;
		$('#client_id').val(clientid);
		$('#ataskname,#adescription,#aduedate').val('');
		var candidateid = document.getElementById('candidateid').value;
		//var clientid = document.getElementById('clientid').value;
		var clientid ="";
		$.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "getlcaquestionaries",
			data : {
				candidateid : candidateid,
				clientid : clientid
			},
			success : function(response) {
				var allLcaList=response.alllcaList;
				$('#lcaRefNoListTask').empty();
				$('#lcaRefNoListTask').append($('<option/>').attr("value", '').text("Select LCA"));
				for (var i = 0; i < allLcaList.length; i++) {
					var lca;
					if(allLcaList[i].lca_number!=null){
						lca=allLcaList[i].lca_number+"/ RN"+allLcaList[i].lca_reference+" ("+allLcaList[i].client_name+")";
					}else{
						lca="NA"+"-RN"+allLcaList[i].lca_reference+" ("+allLcaList[i].client_name+")";
					}
					$('#lcaRefNoListTask').append($('<option/>').attr("value",allLcaList[i].lca_id).text(lca));
				}
				$('#addtaskmodal').modal('show');
			 }
		});
	});
	
	$("#addh1task").click(function(){
		var candidateid = document.getElementById('candidateid').value;
		$('#ah1candidateid').val(candidateid);
		$('#ah1taskname,#ah1description,#ah1duedate').val('');
		$('#addh1taskmodal').modal('show');
	});
	
	
	function viewLCADocuments(lcaid){
		 var candidateid = document.getElementById('candidateid').value;
		    var candiname=$("#candidate option:selected").text();
			$('#empname').text(candiname);
			$.ajax({
				type : "GET",
			    asyn : false,
			    contentType: "application/json",
				url : "lcadetailsbylcaid",
				data : {
					lcaid : lcaid,
				},
				success : function(response) {
					$('#clientname,#h_jobtitle').text('');
					$('#lcadatatable').dataTable().fnClearTable();
					var lca=$('#lcaRefNoList').val();
					var lca_r=$('#lcaList').val();
					if(response!=""){
					if (tablefh)
						tablefh.clear();
					var jobtitle;var clientname;
					for(var i=0;i<response.length;i++){
						var lca_number=""; var startdate="";var expirydate="";
						if(response[i].lca_number==null){	
							lca_number='<span class="label label-success" style="background-color:grey;color:white;">NA</span>';
							}else{
								lca_number=response[i].lca_number;
								}
						if(response[i].startdate==null){	
							startdate=startdate;}
						else{
								startdate=response[i].startdate;
								}
						if(response[i].expirydate==null){	
							expirydate=expirydate;}
						else{
							expirydate=response[i].expirydate;
							}
						jobtitle=response[i].jobtitle;
						clientname=response[i].client_name;
				var encoded = encodeURIComponent(response[i].file_name);
				/*var action;
				if(lca_r==lca){
					action='<a class="btn btn-secondary btn-sm addButton" data-toggle="modal" onclick="editLCADocument(\''+response[i].document_id+'\',\''+response[i].subdocname+'\',\''+candidateid+'\',\''+response[i].file_name+'\',\''+startdate+'\',\''+expirydate+'\',\''+response[i].inputval+'\');" style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-edit"></i></a> <a class="btn btn-info btn-sm addButton" data-toggle="modal" onclick="LcaDocHistory(\''+response[i].lca_id+'\',\''+response[i].documentsubtype_id+'\');" disabled style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-history" disabled></i></a>';
				}else{
					action='<a class="btn btn-default btn-sm addButton" data-toggle="modal" disabled style="letter-spacing: 1px; background-color: #7d8384; color: white;" disabled><i class="fa fa-edit"></i></a> <a class="btn btn-info btn-sm addButton" data-toggle="modal" onclick="LcaDocHistory(\''+response[i].lca_id+'\',\''+response[i].documentsubtype_id+'\');" disabled style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-history"></i></a>';
				}*/
				tablefh.row.add([
					'' + lca_number	+ '',
					'' + response[i].subdocname	+ '',
					'' + startdate	+ '',
					'' + expirydate	+ '',
					//'' + response[i].client_name	+ '',
					//'' + response[i].jobtitle	+ '',
					'<a href="downloadimmigrationdocs?filename='+encoded+'&candidate_id='+candidateid+'" style="color:blue">'+ response[i].file_name+'</a>',
					/*'' + action	+ ''*/,]).draw();
					/* '<a class="btn btn-secondary btn-sm addButton" data-toggle="modal" disabled onclick="editLCADocument(\''+response[i].document_id+'\',\''+response[i].subdocname+'\',\''+candidateid+'\',\''+response[i].file_name+'\');" style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-edit"></i></a> <a class="btn btn-info btn-sm addButton" data-toggle="modal" onclick="LcaDocHistory(\''+response[i].lca_id+'\',\''+response[i].documentsubtype_id+'\');" disabled style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-history"></i></a>', ]).draw(); */
					}
					$('#clientname').text(clientname);
					$('#h_jobtitle').text(jobtitle);
				    }
				  $('#lcahistorymodal').modal('show');
				}
			});
	}
	function viewtask(taskid){
		$('#taskid').val(taskid);
		$.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "gettaskdetailsbyid",
			data : {
				taskid : taskid
			},
			success : function(response) {
				 var dt=response.created_date;
					//$('#taskid').val(response.task_id);
					if(response.task_status=='Closed'){
						 $("#taskstatus option[value='" + response.task_status + "']").attr('selected', 'selected').text('Closed');
						 //$("#btnSubmit").attr("disabled", true);
					}else{
					$('#taskstatus').val(response.task_status);
					 $("#btnSubmit").attr("disabled", false);
					}
					$('#duedate').val(response.due_date);
					$('#createddate').val($.date(dt));
					$('#description').val(response.task_description);
					$('#taskname').val(response.task_name);
					$('#comments').val(response.comments);
					var udueDate=new Date($.date(dt));
					$('#duedate').datepicker('setStartDate', udueDate);
			}
		});
		$('#taskmodal').modal('show');
	}
	
	function viewh1task(taskid){
		$('#h1taskid').val(taskid);
		$.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "gettaskdetailsbyid",
			data : {
				taskid : taskid
			},
			success : function(response) {
				 var dt=response.created_date;
					//$('#taskid').val(response.task_id);
					if(response.task_status=='Closed'){
						 $("#uh1taskstatus option[value='" + response.task_status + "']").attr('selected', 'selected').text('Closed');
						 //$("#btnSubmit").attr("disabled", true);
					}else{
					$('#uh1taskstatus').val(response.task_status);
					 $("#uh1btnUpdate").attr("disabled", false);
					}
					$('#uh1duedate').val(response.due_date);
					$('#uh1createddate').val($.date(dt));
					$('#uh1description').val(response.task_description);
					$('#uh1task_name').val(response.task_name);
					$('#uh1comments').val(response.comments);
					var uh1dueDate=new Date($.date(dt));
					$('#uh1duedate').datepicker('setStartDate', uh1dueDate);
			}
		});
		$('#updateh1taskmodal').modal('show');
	}
	
	$.date = function(dateObject) {
	    var d = new Date(dateObject);
	    var day = d.getDate();
	    var month = d.getMonth() + 1;
	    var year = d.getFullYear();
	    if (day < 10) {
	        day = "0" + day;
	    }
	    if (month < 10) {
	        month = "0" + month;
	    }
	    var date = month + "/" + day + "/" + year;
	    return date;
	};
	
	$("#lcahistory").click(function(){
		var candidateid = document.getElementById('candidateid').value;
		var clientid = document.getElementById('clientid').value;
		var candiname=$("#candidate option:selected").text();
		$('#empname').text(candiname);
	
		$('#lcadatatable').dataTable().fnClearTable();
		$.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "getlcahistory",
			data : {
				candidateid : candidateid,
				clientid : clientid 
			},
			success : function(response) {
				var lcahistory=response.lcaHistoryList;
				var lcaList=response.lcaList;
				var lcaId=response.lcaId;
				$('#lcaList').empty();
				$('#lcaList').append($('<option/>').attr("value", '').text("Select LCA"));
				for (var i = 0; i < lcaList.length; i++) {
					var lca;
					//alert(lcaList[i].lca_number)
					if(lcaList[i].lca_number!=null){
						lca=lcaList[i].lca_number+"/ RN"+lcaList[i].lca_reference+"("+lcaList[i].client_name+")";
					}else{
						lca="NA"+"-RN"+lcaList[i].lca_reference+"  ("+lcaList[i].client_name+")";;
					}
					$('#lcaList').append($('<option/>').attr("value",lcaList[i].lca_id).text(lca));
				  }
				  $("#lcaList option[value="+lcaId+"]").attr('selected', 'selected'); 
				//  $('#lcaList').trigger('change');
			}
		});
		 $('#lcahistorymodal').modal('show');
	});
	
	$("#btnSubmit").click(function(event) {
		event.preventDefault();
		$('#updateTaskForm').formValidation('validate');
	 if (!$('#updateTaskForm').data('formValidation').isValid()) {
		 
		} else { 
			$("#btnSubmit").attr("disabled", true);
			var form = $('#updateTaskForm')[0];
			var data = new FormData(form);
			$.ajax({
				url : "updatetask", //this is the submit URL
				type : "POST",
				enctype : 'multipart/form-data',
				data : data,
				processData : false,
				contentType : false,
				cache : false,
				success : function(data) {
					 if(data!=null || data!=""){
						 var taskid = document.getElementById('taskid').value;
						 $('#taskmodal').modal('hide');
						 $('#lcatab').trigger('click');
						 alert(data);
						 //viewtask(taskid);
		   	   	         }
		   	   	      else{
		   	   	          window.location.href="loginpage";
		   	   	   	      }
				}
			});
		}
	});
	
  /*  var date = new Date();
	date.setDate(date.getDate()); 
	$("#duedate,#aduedate").datepicker({
		minDate:0
	}).on('changeDate', function(selected) {
	    $('#updatTaskForm,#addTaskForm').formValidation('revalidateField', 'duedate');
	});	*/
	
	/*$("#uh1duedate").datepicker({
		minDate:0
	}).on('changeDate', function(selected) {
	    $('#updateh1TaskForm').formValidation('revalidateField', 'duedate');
	});*/	
	
	/*$("#uh1duedate").datepicker({});*/
	$("#ah1btnSubmit").click(function(event) {
		event.preventDefault();
		$('#addh1TaskForm').formValidation('validate');
	 if (!$('#addh1TaskForm').data('formValidation').isValid()) {
		} else { 
			$("#ah1btnSubmit").attr("disabled", true);
			/*var candidateid = document.getElementById('candidateid').value;
			$("#ah1candidateid").val(candidateid);*/
			var form = $('#addh1TaskForm')[0];
			var data = new FormData(form);
			$.ajax({
				url : "addh1task", //this is the submit URL
				type : "POST",
				enctype : 'multipart/form-data',
				data : data,
				processData : false,
				contentType : false,
				cache : false,
				success : function(data) {
					 if(data!=null || data!=""){
						 $('#addh1taskmodal').modal('hide');
						 $('#h1btab').trigger('click');
						 alert(data);
						 //viewtask(taskid);
		   	   	         }
		   	   	      else{
		   	   	          window.location.href="loginpage";
		   	   	   	      }
				}
			});
		}
	});
	
	$("#uh1btnUpdate").click(function(event) {
		event.preventDefault();
		$('#updateh1TaskForm').formValidation('validate');
	 if (!$('#updateh1TaskForm').data('formValidation').isValid()) {
		 
		} else { 
			$("#uh1btnUpdate").attr("disabled", true);
			var form = $('#updateh1TaskForm')[0];
			var data = new FormData(form);
			$.ajax({
				url : "updateh1task", //this is the submit URL
				type : "POST",
				enctype : 'multipart/form-data',
				data : data,
				processData : false,
				contentType : false,
				cache : false,
				success : function(data) {
					 if(data!=null || data!=""){
						 var taskid = document.getElementById('taskid').value;
						 $('#updateh1taskmodal').modal('hide');
						 $('#h1btab').trigger('click');
						 alert(data);
						 //viewtask(taskid);
		   	   	         }
		   	   	      else{
		   	   	          window.location.href="loginpage";
		   	   	   	      }
				}
			});
		}
	});
	
	$("#abtnSubmit").click(function(event) {
		event.preventDefault();
		$('#addTaskForm').formValidation('validate');
	 if (!$('#addTaskForm').data('formValidation').isValid()) {
		} else { 
			$("#abtnSubmit").attr("disabled", true);
			var candidateid = document.getElementById('candidateid').value;
			$("#canid").val(candidateid);
			var form = $('#addTaskForm')[0];
			var data = new FormData(form);
			$.ajax({
				url : "addtask", //this is the submit URL
				type : "POST",
				enctype : 'multipart/form-data',
				data : data,
				processData : false,
				contentType : false,
				cache : false,
				success : function(data) {
					 if(data!=null || data!=""){
						 $('#addtaskmodal').modal('hide');
						 $('#lcatab').trigger('click');
						 alert(data);
						 //viewtask(taskid);
		   	   	         }
		   	   	      else{
		   	   	          window.location.href="loginpage";
		   	   	   	      }
				}
			});
		}
	});
	
	
	$('#updateh1TaskForm').formValidation({
		framework : 'bootstrap',
		row : {
			valid : 'field-success',
			invalid : 'field-error'
		},
		fields : {
			uh1task_name : {
				validators : {
					notEmpty : {
						message : 'Please enter Task Name. '
					},
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Task Name should have minimum 2 and maximum 80 characters. '
	                },
	                regexp: {
	                	regexp: /^[^\s\d\@#$&*()_\/\\<>\[\]-]+([a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+\s)*[a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+$/,
	                	message: 'Task Name accepts alphanumerical characters. Spaces are not allowed at beginning or end of the field. Accepts symbols @#$&*()_-\/<>[]'
	                },
				}
			},
			uh1description : {
				validators : {
					notEmpty : {
						message : 'Please enter Task Description. '
					},
	                stringLength: {
	                    min: 2,
	                   // max: 80,
	                    message: 'Task Description should have minimum 2 and maximum 80 characters. '
	                },
	                regexp: {
	                	regexp: /^[^\s\d\@#$&*()_\/\\<>\[\]-]+([a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+\s)*[a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+$/,
	                	message: 'Task Description accepts alphanumerical characters. Spaces are not allowed at beginning or end of the field. Accepts symbols @#$&*()_-\/<>[]'
	                },
				}
			},
			uh1duedate : {
				validators : {
					notEmpty : {
						message : 'Please select Due Date. '
					},
					regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please select Due Date in MM/DD/YYYY format'
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'Due Date is not a valid'
	                }
				}
			},
			uh1comments : {
				validators : {
					notEmpty : {
						message : 'Please enter comments. '
					}
				}
			}
		}
	});
	
	$('#addh1TaskForm').formValidation({
		framework : 'bootstrap',
		row : {
			valid : 'field-success',
			invalid : 'field-error'
		},
		fields : {
			ah1taskname : {
				validators : {
					notEmpty : {
						message : 'Please enter Task Name. '
					},
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Task Name should have minimum 2 and maximum 80 characters. '
	                },
	                regexp: {
	                	regexp: /^[^\s\d\@#$&*()_\/\\<>\[\]-]+([a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+\s)*[a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+$/,
	                	message: 'Task Name accepts alphanumerical characters. Spaces are not allowed at beginning or end of the field. Accepts symbols @#$&*()_-\/<>[]'
	                },
				}
			},
			ah1description : {
				validators : {
					notEmpty : {
						message : 'Please enter Task Description. '
					},
	                stringLength: {
	                    min: 2,
	                   // max: 80,
	                    message: 'Task Description should have minimum 2 and maximum 80 characters. '
	                },
	                regexp: {
	                	regexp: /^[^\s\d\@#$&*()_\/\\<>\[\]-]+([a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+\s)*[a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+$/,
	                	message: 'Task Description accepts alphanumerical characters. Spaces are not allowed at beginning or end of the field. Accepts symbols @#$&*()_-\/<>[]'
	                },
				}
			}
		}
	});
	
	$('#updateTaskForm').formValidation({
		framework : 'bootstrap',
		row : {
			valid : 'field-success',
			invalid : 'field-error'
		},
		fields : {
		 	taskname : {
				validators : {
					notEmpty : {
						message : 'Please enter Task Name. '
					},
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Task Name should have minimum 2 and maximum 80 characters. '
	                },
	                regexp: {
	                	regexp: /^[^\s\d\@#$&*()_\/\\<>\[\]-]+([a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+\s)*[a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+$/,
	                	message: 'Task Name accepts alphanumerical characters. Spaces are not allowed at beginning or end of the field. Accepts symbols @#$&*()_-\/<>[]'
	                },
				}
			},
			udescription : {
				validators : {
					notEmpty : {
						message : 'Please enter Task Description. '
					},
	                stringLength: {
	                    min: 2,
	                   // max: 80,
	                    message: 'Task Description should have minimum 2 and maximum 80 characters. '
	                },
	                regexp: {
	                	regexp: /^[^\s\d\@#$&*()_\/\\<>\[\]-]+([a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+\s)*[a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+$/,
	                	message: 'Task Description accepts alphanumerical characters. Spaces are not allowed at beginning or end of the field. Accepts symbols @#$&*()_-\/<>[]'
	                },
				}
			},
			duedate : {
				validators : {
					notEmpty : {
						message : 'Please select Due Date. '
					},
					regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please select Due Date in MM/DD/YYYY format'
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'Due Date is not a valid'
	                }
				}
			},
			comments : {
				validators : {
					notEmpty : {
						message : 'Please enter comments. '
					}
				}
			},
			taskstatus: {
				validators : {
					notEmpty : {
						message : 'Please select status. '
					}
				}
			}
		}
	});
	$('#addTaskForm').formValidation({
		framework : 'bootstrap',
		row : {
			valid : 'field-success',
			invalid : 'field-error'
		},
		fields : {
		 	taskname : {
				validators : {
					notEmpty : {
						message : 'Please enter Task Name. '
					},
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Task Name should have minimum 2 and maximum 80 characters. '
	                },
	                regexp: {
	                	regexp: /^[^\s\d\@#$&*()_\/\\<>\[\]-]+([a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+\s)*[a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+$/,
	                	message: 'Task Name accepts alphanumerical characters. Spaces are not allowed at beginning or end of the field. Accepts symbols @#$&*()_-\/<>[]'
	                },
				}
			},
			description : {
				validators : {
					notEmpty : {
						message : 'Please enter Task Description. '
					},
	                stringLength: {
	                    min: 2,
	                   // max: 80,
	                    message: 'Task Description should have minimum 2 and maximum 80 characters. '
	                },
	                regexp: {
	                	regexp: /^[^\s\d\@#$&*()_\/\\<>\[\]-]+([a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+\s)*[a-zA-Z0-9@#$&*()_\/<>\[\]\\-]+$/,
	                	message: 'Task Description accepts alphanumerical characters. Spaces are not allowed at beginning or end of the field. Accepts symbols @#$&*()_-\/<>[]'
	                },
				}
			},
			duedate : {
				validators : {
					notEmpty : {
						message : 'Please select Due Date. '
					},
					regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please select Due Date in MM/DD/YYYY format'
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'Due Date is not a valid'
	                }
				}
			},
			comments : {
				validators : {
					notEmpty : {
						message : 'Please enter comments. '
					}
				}
			},
	  lcaRefNoListTask : {
				validators : {
					notEmpty : {
						message : 'Please select LCA/Ref.no  '
					}
				}
			}
		}
	});
	
	$("#lcadetails").click(function(){
		$('#lcaqUdiv,#lcaqbtnUpdate').hide();
		var candidateid = document.getElementById('candidateid').value;
		var clientid = document.getElementById('clientid').value;
		$.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "getlcaquestionaries",
			data : {
				candidateid : candidateid,
				clientid : clientid
			},
			success : function(response) {
				var allLcaList=response.alllcaList;
				 $('#lcaqueDiv').hide();
				$('#lcaqueRefNoList').empty();
				$('#lcaqueRefNoList').append($('<option/>').attr("value", '').text("Select LCA"));
				for (var i = 0; i < allLcaList.length; i++) {
					var lca;
					if(allLcaList[i].lca_number!=null){
						lca=allLcaList[i].lca_number+"/ RN"+allLcaList[i].lca_reference+" ("+allLcaList[i].client_name+")";
					}else{
						lca="NA"+"-RN"+allLcaList[i].lca_reference+" ("+allLcaList[i].client_name+")";
					}
					$('#lcaqueRefNoList').append($('<option/>').attr("value",allLcaList[i].lca_id).text(lca));
				}
			}
		});
		 $('#lcadetailsmodal').modal('show');
	});
	
	$("#amendment").click(function(){
		var candidateid = document.getElementById('candidateid').value;
		var clientid = document.getElementById('clientid').value;
		$("#duties,#role,#rate,#msa,#None").prop("checked", false);
	    $("#duties,#role,#rate,#msa,#None").prop("disabled", false); 
	    $("#spanError,#spanDuties,#spanRate,#spanMsa").text('');
		$.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "getamendmentdetails",
			data : {
				candidateid : candidateid,
				clientid : clientid
			},
			success : function(data) {
		var amendmentval=data.amendment_status;
		if(amendmentval!=null){
		var amendment = amendmentval.split(',');
			for (var i = 0; i < amendment.length; i++) {
					 if(amendment[i].includes("duties")){
						 $("#duties"). prop("checked", true);
						 $("#spanDuties").text("H-1B amendment required");
					 }else  if(amendment[i].includes("role")){
						 $("#role"). prop("checked", true);
					 }else  if(amendment[i].includes("rate")){
	   	   	      	 	 $("#rate"). prop("checked", true);
	   	   	     		  $("#spanRate").text("H-1B amendment required");
	   	   	         }else  if(amendment[i].includes("msa")){
	   	   	       		 $("#msa"). prop("checked", true);
	   	   	       		 $("#spanMsa").text("H-1B amendment required");
	   	   	         }else if(amendment[i].includes("None")){
	   	   	             $("#None"). prop("checked", true);
	   	   	             $("#duties,#role,#rate,#msa").prop("disabled", true); 
	   	   	             //$("#duties,#role,#rate,#msa").prop("checked", false); 
	   	   	           } 
				} 
	   	   	   } 
			}
		});
		$("#saveid").attr("disabled", false);
		 $('#amendmentmodal').modal('show');
	});
	
	$("#saveid").click(function(event) {
		event.preventDefault();
		$('#amendmentForm').formValidation('validate');
	 if (!$('#amendmentForm').data('formValidation').isValid()) {
		   // alert("Not Valid");
		 $("#spanError").text("Please select atleast one Amendment");
		} else { 
			//alert("Valid");
			$("#spanError").text('');
			$("#saveid").attr("disabled", true);
			var form = $('#amendmentForm')[0];
			var data = new FormData(form);
			$.ajax({
				url : "saveamendment", //this is the submit URL
				type : "POST",
				enctype : 'multipart/form-data',
				data : data,
				processData : false,
				contentType : false,
				cache : false,
				success : function(data) {
					 if(data!="" || data!=null){
						 alert("Amendment details updated successfully");
								var amendment = data.split(',');
								for (var i = 0; i < amendment.length; i++) {
										 if(amendment[i].includes("duties")){
											 $("#duties"). prop("checked", true);
									    	 $("#spanDuties").text("H-1B amendment required");
										 }else  if(amendment[i].includes("role")){
											 $("#role"). prop("checked", true);
										 }else  if(amendment[i].includes("rate")){
						   	   	      	 	 $("#rate"). prop("checked", true);
						   	   	       		$("#spanRate").text("H-1B amendment required");
						   	   	         }else  if(amendment[i].includes("msa")){
						   	   	       		 $("#msa"). prop("checked", true);
						   	   	      		 $("#spanMsa").text("H-1B amendment required");
						   	   	         }else if(amendment[i].includes("None")){
						   	   	             $("#None"). prop("checked", true);
						   	   	             $("#duties,#role,#rate,#msa").prop("disabled", true); 
						   	   	             //$("#duties,#role,#rate,#msa,#None").prop("checked", false); 
						   	   	         }  
									} 
								 $('#amendmentmodal').modal('hide');
								 $('#lcatab').trigger('click');
						// $("#saveid").attr("disabled", false);
		   	   	         }
		   	   	      else{
		   	   	          window.location.href="loginpage";
		   	   	   	      }
				}
			});
		}
	});
	
	$("#uploadlcadetails").click(function(){
		var candidateid = document.getElementById('candidateid').value;
		var clientid = document.getElementById('clientid').value;
		$('#approvedlca').hide();
		$("#lcabtnSubmit").attr("disabled", false);
		 $('#documentsubtype').empty();
		 $.ajax({
			type : "GET",
			asyn : false,
			contentType : "application/json", // NOT dataType!
			url : "getlcaquestionaries",
			data : {
				candidateid : candidateid,
				clientid : clientid
			    },
			success : function(response) {
				/* var endclient=response.clientObj;
				var ecaddress=response.endclientaddres;
				var remoteAdrs=response.remoteaddress;
				*/
				var docTypeyList=response.docTypeyList; 
				var allLcaList=response.alllcaList;
				var pendinglcaList=response.pendinglcaList;
			/* 	var lcaId=response.lcaId; */
				
			/* 	if(ecaddress!=null){
					var ecA;
					if(ecaddress.line2!=""){
						ecA=ecaddress.line1+","+ecaddress.line2+","+ecaddress.city+","+ecaddress.state+","+ecaddress.zipcode;
					}else{
						ecA=ecaddress.line1+","+ecaddress.city+","+ecaddress.state+","+ecaddress.zipcode;
					}
					$('#location1').val(ecA);
				}
				if(remoteAdrs!=null){
					var rA;
					if(remoteAdrs.line2!=""){
						rA=remoteAdrs.line1+","+remoteAdrs.line2+","+remoteAdrs.city+","+remoteAdrs.state+","+remoteAdrs.zipcode;
					}else{
						rA=remoteAdrs.line1+","+remoteAdrs.city+","+remoteAdrs.state+","+remoteAdrs.zipcode;
					}
					$('#location2').val(rA);
				}else{
					$('#location2').val("NA");
				}  
				$('#lcacandidateId').val(candidateid);
				$('#lcaclientId').val(clientid);
				$('#lcapayrateId').val(endclient.payrate_id);
				$('#lcaCandName').val($('#candidateidname').val());
				$('#lcacounty').val(endclient.county);
				$('#soc_code').val(endclient.soc_code);
				$('#job_title').val(endclient.cand_job_title);
				$('#lcaRefNoList').trigger('change');*/
				var doctypename;
				var doctypeid;
				 $("#lcaNumber,#startdate,#enddate").val('');
				 $("#lcaNumber").attr("readonly",false);
				var lcaList=response.lcaList;
				$('#lcaRefNoList').empty();
				$('#lcaRefNoList').append($('<option/>').attr("value", '').text("Select LCA"));
				for (var i = 0; i < pendinglcaList.length; i++) {
					var lca;
					//alert(lcaList[i].lca_number)
					if(pendinglcaList[i].lca_number!=null){
						lca=pendinglcaList[i].lca_number+"/ RN"+pendinglcaList[i].lca_reference+" ("+pendinglcaList[i].client_name+")";
					}else{
						lca="NA"+"-RN"+pendinglcaList[i].lca_reference+" ("+pendinglcaList[i].client_name+")";
					}
					$('#lcaRefNoList').append($('<option/>').attr("value",pendinglcaList[i].lca_id).text(lca));
				}
				for (var i = 0; i < docTypeyList.length; i++) {
					if(docTypeyList[i].document_type=='LCA'){
						doctypename=docTypeyList[i].document_type;
						doctypeid=docTypeyList[i].documenttype_id;
					}
				}
				$('#documenttypeId').val('');
				$('#documenttypeId').val(doctypeid);
			 }
		});
	  $('#uploadlcadetailsmodal').modal('show');
});	
	
	$("#lcabtnSubmit").click(function(event) {
		event.preventDefault();
		 var lca=$('#lcaRefNoList option:selected').html();
		 if(lca.includes("NA")){
			 $("#lcaNumber").attr("readonly",false);
			 $('#addLCADetailsForm').bootstrapValidator('enableFieldValidators','lcaNumber',true);
		 }else{
			 $('#addLCADetailsForm').bootstrapValidator('enableFieldValidators','lcaNumber',false);
		 } 
		$('#addLCADetailsForm').formValidation('validate');
		if (!$('#addLCADetailsForm').data('formValidation').isValid()) {
			//alert("not Valid");
		} else {
			$("#lcabtnSubmit").attr("disabled", true);
			var form = $('#addLCADetailsForm')[0];
			var data = new FormData(form);
			$.ajax({
				url : "uploadLCADetails", //this is the submit URL
				type : "POST",
				enctype : 'multipart/form-data',
				data : data,
				processData : false,
				contentType : false,
				cache : false,
				success : function(data) {
					 if(data!=null || data!=""){
		   	            	/* $('#addsummaryfields').html(data);
		   	      		  	$('#myModal').show();  */
						 alert(data);
		   	      		//$('#uploadlcadetailsmodal').modal('hide');
		   	      		//$('#lcaList').trigger('change');
		   	      		document.getElementById("addLCADetailsForm").reset();
		   	      	    $('#uploadlcadetailsmodal').modal('hide');
		   	      	    $("#lcatab").trigger('click');
		   	      	    //document.getElementById("addLCADetailsForm").reset();
		   	      		//$('form').get(0).reset() 
		   	      	   //  $('#lcaList').trigger('click');
	                     //addLCADetailsForm window.location.href="immigration";
		   	   	         }
		   	   	      else{
		   	   	          window.location.href="loginpage";
		   	   	   	      }
				}
			});
		}
	});
    var date = new Date();
	date.setDate(date.getDate()); 
	/* $("#lcaBeginDate").datepicker({
	}).on('changeDate', function(selected) {
	    $('#addLCADetailsForm').formValidation('revalidateField', 'lcaBeginDate');
	});	
	$("#lcaEndDate").datepicker({
	}).on('changeDate', function(selected) {
	    $('#addLCADetailsForm').formValidation('revalidateField', 'lcaEndDate');
	}); 
	
	$("#lcaSubDate ").datepicker({
	}).on('changeDate', function(selected) {
	   //     var minDate = new Date(selected.date.valueOf());
	     //   $('#fromdate').datepicker('setEndDate', minDate);
	    $('#addLCADetailsForm').formValidation('revalidateField', 'lcaSubDate');
	});
	*/
	
/*	$("#lcaCertifiedDate ").datepicker({
		
	}).on('changeDate', function(selected) {
		// var minDate = new Date(selected.date.valueOf());
	  //   $('#expirydate').datepicker('setStartDate', minDate);
	    $('#addLCADetailsForm').formValidation('revalidateField', 'lcaCertifiedDate');
	});	*/
	
	$("#startdate").datepicker({
	}).on('changeDate', function(selected) {
		 var minDate = new Date(selected.date.valueOf());
		 $('#enddate').datepicker('setStartDate', minDate);
	    //$('#addLCADetailsForm').formValidation('revalidateField', 'lcaSubDate');
	});
	
	$("#enddate").datepicker({
	}).on('changeDate', function(selected) {
		var minDate = new Date(selected.date.valueOf());
		 $('#startdate').datepicker('setEndDate', minDate);
	    //$('#addLCADetailsForm').formValidation('revalidateField', 'lcaSubDate');
	});
	
	$("#u_lcaBeginDate").datepicker({
	}).on('changeDate', function(selected) {
		 var minDate = new Date(selected.date.valueOf());
		$('#u_lcaEndDate').datepicker('setStartDate', minDate);
	    $('#updateLCAQDetailsForm').formValidation('revalidateField', 'u_lcaBeginDate');
	});	
	$("#u_lcaEndDate").datepicker({
	}).on('changeDate', function(selected) {
		 var minDate = new Date(selected.date.valueOf());
		 $('#u_lcaBeginDate').datepicker('setEndDate', minDate);
	    $('#updateLCAQDetailsForm').formValidation('revalidateField', 'u_lcaEndDate');
	});
	$("#u_lcaPostedDate").datepicker({
	}).on('changeDate', function(selected) {
	    $('#updateLCAQDetailsForm').formValidation('revalidateField', 'u_lcaPostedDate');
	});
	

$('#amendmentForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {
    	amendmentchange: {
            validators: {
            	notEmpty: {
                    message: 'Amendment is mandatory'
                }
            }
        }
    }
});

$('#edlcadocsForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {
    	lcaeditFile:{
	          validators: {
	           	notEmpty: {
	                   message: 'Document is mandatory '
	               }
	           }
	       },
	   edinputval : {
			validators : {
				notEmpty : {
					message : 'Please Document Name. '
				},
				stringLength: {
                    min: 2,
                    max: 50,
                    message: 'Document Name must be more than 2 and less than 50 characters long. '
                },
                regexp: {
                	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &.\/-]*)?$/,
                     message: 'Document Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                }
			}
		}
      }
});



$('#updateLCAQDetailsForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {
    	endClientName: {
	            validators: {
	            	notEmpty: {
	                    message: 'End Client Name is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 20,
	                    message: 'End Client Name must be more than 2 and less than 20 characters long'
	                },
	                regexp: {
	                	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
	                     message: 'End Client Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
	                }
	            }
	        },
	       education : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Education is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Education should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Education accepts alpha numerics '
	                },
	            }
	        },
	       reason_lca : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Please Select Reason for filing LCA'
	                }
	            }
	        }, 
	        cand_job_title : {
	            validators: {
	            	notEmpty: {
	                    message: 'Job Title is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 100,
	                    message: 'Job Title min length 4 and max length 20 '
	                },
	                regexp: {
	                	regexp: /^(?!\d\s+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &():\/\\-]*)?$/,
	                    message: 'Job Title accepts alphanumeric, specical characters like &-()/: allowed and Space allowed but is not at beginning or end of the word'
	                },
	            }
	        },
	        u_duties : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Job Duties are mandatory'
	                },
	                /* stringLength: {
	                    min: 2,
	                    max: 25,
	                    message: 'Duties should have more than 2 and less than 80 characters '
	                }, */
	                regexp: {
	                  regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Duties accepts alpha numerics '
	                }
	            }
	        },
	        endline1 : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Line1 is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Line1 should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Line1 accepts alpha numerics '
	                },
	            }
	        },
	        endcity : {
	            validators: {
	            	notEmpty: {
	                    message: 'City is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'City should have 2 characters'
	                },
	                regexp: {
	                	regexp: /^[a-zA-Z\s]+$/,
	                   message: 'City accepts alphanumerics'
	                },
	            }
	        },
	        endstate : {
	            validators: {
	            	notEmpty: {
	                    message: 'State is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'State should have 2 characters'
	                },
	                regexp: {
	                	regexp: /^[a-zA-Z\s]+$/,
	                   message: 'State accepts character'
	                },
	            }
	        },
	        endzipcode : {
	            validators: {
	            	notEmpty: {
	                    message: 'Zipcode is mandatory'
	                },
	                stringLength: {
	                    min: 5,
	                    max: 5,
	                    message: 'Zipcode must be 5 digits'
	                },
	                regexp: {
	                	regexp: /[0-9]/,
	                    message: 'Zipcode accepts digits'
	                },
	            }
	        }, 
	        remote_county : {
	            validators: {
	            	notEmpty: {
	                    message: 'County is mandatory'
	                },
	                stringLength: {
	                    min: 4,
	                    max: 20,
	                    message: 'County min length 4 and max length 20 '
	                },
	                regexp: {
	                	regexp: /[a-zA-Z]/,
	                    message: 'County accepts character'
	                },
	            }
	        },
	        remote_soc_code : {
	            validators: {
	            	notEmpty: {
	                    message: 'Soc Code is mandatory'
	                },
	                stringLength: {
	                    min: 7,
	                    max: 7,
	                    message: 'Soc Code must be 6 digits'
	                },
	                regexp: {
	                	regexp: /[0-9]{2}-[0-9]{4}/,
	                    message: 'Soc Code accepts digits'
	                },
	            }
	        },
	        remote_line1 : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Line1 is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Line1 should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Line1 accepts alpha numerics '
	                },
	            }
	        },
	        remote_city : {
	            validators: {
	            	notEmpty: {
	                    message: 'City is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'City should have 2 characters'
	                },
	                regexp: {
	                	regexp: /^[a-zA-Z\s]+$/,
	                   message: 'City accepts alphanumerics'
	                },
	            }
	        },
	        remote_state : {
	            validators: {
	            	notEmpty: {
	                    message: 'State is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'State should have 2 characters'
	                },
	                regexp: {
	                	regexp: /^[a-zA-Z\s]+$/,
	                   message: 'State accepts character'
	                },
	            }
	        },
	   u_wageRate : {
	            validators: {
	            	notEmpty: {
	                    message: 'Wage Rate is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 10,
	                    message: 'Wage Rate should have 2 digits'
	                },
	                regexp: {
	                	//regexp: /^[0-9]*$/,
	                	regexp: /^[0-9]+(\.[0-9]{2})?$/,
	                    message: 'Wage Rate accepts digits'
	                }
	            }
	        },
	        uwr_option : {
	            validators: {
	            	notEmpty: {
	                    message: 'Please select one option'
	                }
	            }
	        },
	   /*     u_wageRate : {
	            validators: {
	            	notEmpty: {
	                    message: 'Wage Rate is mandatory'
	                },
	                stringLength: {
	                    min: 4,
	                    max: 9,
	                    message: 'Wage Rate must be should have minimum 4 and maximum 9 digits'
	                },
	                regexp: {
	                	regexp: /[a-zA-Z0-9,\/]/,
	                    message: 'Wage Rate accepts alphanumerics'
	                }
	            }
	        }, */ 
	        u_lcaBeginDate: {
		            validators: {
		            	notEmpty: {
		                    message: 'LCA Begin Date is mandatory'
		                },
		                regexp: {
		                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
		                    message: 'please enter LCA Begin Date in MM/DD/YYYY format'
		                },
		                date: {
		                    format: 'MM/DD/YYYY', 
		                    message: 'LCA Begin Date is not a valid, please enter in MM/DD/YYYY format'
		                }
		            }
		        },
		        u_lcaEndDate: {
		            validators: {
		            	notEmpty: {
		                    message: 'LCA End Date is mandatory'
		                },
		                regexp: {
		                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
		                    message: 'please enter LCA End Date in MM/DD/YYYY format'
		                },
		                date: {
		                    format: 'MM/DD/YYYY', 
		                    message: 'LCA End Date is not a valid, please enter in MM/DD/YYYY format'
		                }
		            }
		        },	
		    u_lcaPostedDate: {
		            validators: {
		            	notEmpty: {
		                    message: 'LCA Filing Date is mandatory'
		                },
		                regexp: {
		                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
		                    message: 'please enter LCA End Date in MM/DD/YYYY format'
		                },
		                date: {
		                    format: 'MM/DD/YYYY', 
		                    message: 'LCA End Date is not a valid, please enter in MM/DD/YYYY format'
		                }
		            }
		        },
		    u_metro_politan_area : {
		            validators: {
		            	notEmpty: {
		                    message: 'MetroPolitan Area is mandatory'
		                },
		                stringLength: {
		                	min: 2,
		                    max: 25,
		                    message: 'MetroPolitan Area should have 2 characters'
		                },
		                regexp: {
		                	//regexp: /^[a-zA-Z\s]+$/,
		                	regexp: /^[a-zA-Z]+(-[a-zA-Z]+)*$/,
		                   message: 'MetroPolitan Area accepts characters'
		                },
		            }
		        },
	        remote_zipcode : {
	            validators: {
	            	notEmpty: {
	                    message: 'Zipcode is mandatory'
	                },
	                stringLength: {
	                    min: 5,
	                    max: 5,
	                    message: 'Zipcode must be 5 digits'
	                },
	                regexp: {
	                	regexp: /[0-9]/,
	                    message: 'Zipcode accepts digits'
	                },
	            }
	        },
	        'ulca_othr_line1[]' : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Line1 is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Line1 should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Line1 accepts alpha numerics '
	                },
	            }
	        },
	        'ulca_othr_line2[]' : {
	            validators: {
	            	 isEmpty: {
	                    message: 'Line2 is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Line2 should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Line2 accepts alpha numerics '
	                },
	            }
	        },
	        'ulca_othr_city[]' : {
	            validators: {
	            	notEmpty: {
	                    message: 'City is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'City should have minimum 2 and maximum 25 characters'
	                },
	                regexp: {
	                	regexp: /^[a-zA-Z\s]+$/,
	                   message: 'City accepts alphanumerics'
	                },
	            }
	        },
	        'ulca_othr_state[]' : {
	            validators: {
	            	notEmpty: {
	                    message: 'State is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'State should have 2 characters'
	                },
	                regexp: {
	                	regexp: /^[a-zA-Z\s]+$/,
	                   message: 'State accepts character'
	                },
	            }
	        },
	        'ulca_othr_zipcode[]' : {
	            validators: {
	            	notEmpty: {
	                    message: 'Zipcode is mandatory'
	                },
	                stringLength: {
	                    min: 5,
	                    max: 5,
	                    message: 'Zipcode must be 5 digits'
	                },
	                regexp: {
	                	regexp: /[0-9]/,
	                    message: 'Zipcode accepts digits'
	                },
	            }
	        },
	    'ulca_othr_remote_metro[]' : {
	            validators: {
	            	notEmpty: {
	                    message: 'MetroPolitan Area is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'MetroPolitan Area should have 2 characters'
	                },
	                regexp: {
	                   regexp: /^[a-zA-Z]+(-[a-zA-Z]+)*$/,
	                   message: 'MetroPolitan Area accepts characters'
	                },
	            }
	        }
	       /* ulcaothrline1 : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Line1 is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Line1 should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                  message: 'Line1 accepts alpha numerics '
	                },
	            }
	        },
	        ulca_othr_line2 : {
	            validators: {
	            	 isEmpty: {
	                    message: 'Line2 is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Line2 should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                  message: 'Line2 accepts alpha numerics '
	                },
	            }
	        },
	        ulca_othr_city : {
	            validators: {
	            	notEmpty: {
	                    message: 'City is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'City should have minimum 2 and maximum 25 characters'
	                },
	                regexp: {
	                	regexp: /^[a-zA-Z\s]+$/,
	                   message: 'City accepts alphanumerics'
	                },
	            }
	        },
	        ulca_othr_state : {
	            validators: {
	            	notEmpty: {
	                    message: 'State is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'State should have 2 characters'
	                },
	                regexp: {
	                	regexp: /^[a-zA-Z\s]+$/,
	                   message: 'State accepts character'
	                },
	            }
	        },
	        ulca_othr_zipcode : {
	            validators: {
	            	notEmpty: {
	                    message: 'Zipcode is mandatory'
	                },
	                stringLength: {
	                    min: 5,
	                    max: 5,
	                    message: 'Zipcode must be 5 digits'
	                },
	                regexp: {
	                	regexp: /[0-9]/,
	                    message: 'Zipcode accepts digits'
	                },
	            }
	        },
	    ulca_othr_remote_metro : {
	            validators: {
	            	notEmpty: {
	                    message: 'MetroPolitan Area is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'MetroPolitan Area should have 2 characters'
	                },
	                regexp: {
	                   regexp: /^[a-zA-Z]+(-[a-zA-Z]+)*$/,
	                   message: 'MetroPolitan Area accepts characters'
	                },
	            }
	        }*/
      }
}).on('click', '[name="workinglocation"]', function(e) {
    // var checkBox = document.getElementById("worklocation1");
    // var workloc=$("#workinglocation1").val();
     var checkBox1=$("input[name='workinglocation']:checked").val();
     if($("input[name='workinglocation']:checked").val()==$('#working_location1').val())
		{
	    	document.getElementById('lcaqbtnUpdate').disabled=true;
		}else if($("input[name='workinglocation']:checked").val()!=$('#working_location1').val()){
			document.getElementById('lcaqbtnUpdate').disabled=false;
		  }
   //  alert("checkBox1"+checkBox1);
	 if(checkBox1=='Remote/Home'){
		//alert("**if***"+checkBox.checked);
	    $("#remoteAddress,#remoteAddress1").show();
	    $('#updateLCAQDetailsForm').formValidation('enableFieldValidators','remote_line1',true);
	    $('#updateLCAQDetailsForm').formValidation('enableFieldValidators','remote_line2',true);
	    $('#updateLCAQDetailsForm').formValidation('enableFieldValidators','remote_city',true);
	    $('#updateLCAQDetailsForm').formValidation('enableFieldValidators','remote_state',true);
	    $('#updateLCAQDetailsForm').formValidation('enableFieldValidators','remote_zipcode',true);
	    $('#updateLCAQDetailsForm').formValidation('enableFieldValidators','remote_county',true);
        $('#updateLCAQDetailsForm').formValidation('enableFieldValidators','remote_soc_code',true);
   }else if(checkBox1=='EndClient'){
 	//	alert("**else**"+checkBox);
         $("#remoteAddress,#remoteAddress1").hide();
         $('#updateLCAQDetailsForm').formValidation('enableFieldValidators','remote_line1',false);
 	    $('#updateLCAQDetailsForm').formValidation('enableFieldValidators','remote_line2',false);
 	    $('#updateLCAQDetailsForm').formValidation('enableFieldValidators','remote_city',false);
 	    $('#updateLCAQDetailsForm').formValidation('enableFieldValidators','remote_state',false);
 	    $('#updateLCAQDetailsForm').formValidation('enableFieldValidators','remote_zipcode',false);
 	    $('#updateLCAQDetailsForm').formValidation('enableFieldValidators','remote_county',true);
 	    $('#updateLCAQDetailsForm').formValidation('enableFieldValidators','remote_soc_code',true);
      } 
});
var othercl=0;
var MAX_OPTIONS = 3;
$('#init_LCAQDetailsForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {
    /* 	lcaeditFile:{
	          validators: {
	           	notEmpty: {
	                   message: 'Document is mandatory '
	               }
	           }
	       }, */
	       lcaType: {
	            validators: {
	            	notEmpty: {
	                    message: 'Please choose atleast one'
	                }
	            }
	        },
	        init_workinglocation: {
	            validators: {
	            	notEmpty: {
	                    message: 'Please choose atleast one'
	                }
	            }
	        },
	       init_endClientName: {
	            validators: {
	            	notEmpty: {
	                    message: 'End Client Name is mandatory'
	                }/* ,
	                stringLength: {
	                    min: 2,
	                    max: 100,
	                    message: 'End Client Name must be more than 2 and less than 100 characters long'
	                },
	                regexp: {
	                    regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
	                    message: 'End Client Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
	                } */
	            }
	        },
	       init_education : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Education is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Education should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Education accepts alpha numerics '
	                },
	            }
	        },
	        init_reason_lca : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Please Select Reason for filing LCA'
	                }
	            }
	        }, 
	        init_cand_job_title : {
	            validators: {
	            	notEmpty: {
	                    message: 'Job Title is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 100,
	                    message: 'Job Title min length 4 and max length 20 '
	                },
	                regexp: {
	                	regexp: /^(?!\d\s+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &():\/\\-]*)?$/,
	                    message: 'Job Title accepts alphanumeric, specical characters like &-()/: allowed and Space allowed but is not at beginning or end of the word'
	                },
	            }
	        },
	        init_duties : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Job Duties are mandatory'
	                },
	                /* stringLength: {
	                    min: 2,
	                    max: 25,
	                    message: 'Duties should have more than 2 and less than 80 characters '
	                }, */
	                regexp: {
	                  regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Duties accepts alpha numerics '
	                }
	            }
	        },
	        init_endline1 : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Line1 is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Line1 should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Line1 accepts alpha numerics '
	                },
	            }
	        },
	        init_endcity : {
	            validators: {
	            	notEmpty: {
	                    message: 'City is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'City should have 2 characters'
	                },
	                regexp: {
	                	regexp: /^[a-zA-Z\s]+$/,
	                   message: 'City accepts alphanumerics'
	                },
	            }
	        },
	        init_endstate : {
	            validators: {
	            	notEmpty: {
	                    message: 'State is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'State should have 2 characters'
	                },
	                regexp: {
	                	regexp: /^[a-zA-Z\s]+$/,
	                   message: 'State accepts character'
	                },
	            }
	        },
	        init_endzipcode : {
	            validators: {
	            	notEmpty: {
	                    message: 'Zipcode is mandatory'
	                },
	                stringLength: {
	                    min: 5,
	                    max: 5,
	                    message: 'Zipcode must be 5 digits'
	                },
	                regexp: {
	                	regexp: /[0-9]/,
	                    message: 'Zipcode accepts digits'
	                },
	            }
	        }, 
	        init_remote_county : {
	            validators: {
	            	notEmpty: {
	                    message: 'County is mandatory'
	                },
	                stringLength: {
	                    min: 4,
	                    max: 20,
	                    message: 'County min length 4 and max length 20 '
	                },
	                regexp: {
	                	regexp: /[a-zA-Z]/,
	                    message: 'County accepts character'
	                },
	            }
	        },
	        init_remote_soc_code : {
	            validators: {
	            	notEmpty: {
	                    message: 'Soc Code is mandatory'
	                }/*,
	                stringLength: {
	                    min: 7,
	                    max: 7,
	                    message: 'Soc Code must be 6 digits'
	                },
	                regexp: {
	                	regexp: /[0-9]{2}-[0-9]{4}/,
	                    message: 'Soc Code accepts digits'
	                },*/
	            }
	        },
	        init_wageRate : {
	            validators: {
	            	notEmpty: {
	                    message: 'Wage Rate is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 10,
	                    message: 'Wage Rate should have 2 digits'
	                },
	                regexp: {
	                	//regexp: /^[0-9]*$/,
	                	 regexp: /^[0-9]+(\.[0-9]{2})?$/,
	                    message: 'Wage Rate accepts digits'
	                }
	            }
	        },
	        iwr_option : {
	            validators: {
	            	notEmpty: {
	                    message: 'Please select one option'
	                }
	            }
	        },
	      /*  init_wageRate : {
	            validators: {
	            	notEmpty: {
	                    message: 'Wage Rate is mandatory'
	                },
	                stringLength: {
	                    min: 4,
	                    max: 9,
	                    message: 'Wage Rate must be should have minimum 4 and maximum 9 digits'
	                },
	                regexp: {
	                	regexp: /[a-zA-Z0-9,\/]/,
	                    message: 'Wage Rate accepts alphanumerics'
	                }
	            }
	        },*/  
	        init_lcaBeginDate: {
		            validators: {
		            	notEmpty: {
		                    message: 'LCA Begin Date is mandatory'
		                },
		                regexp: {
		                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
		                    message: 'please enter LCA Begin Date in MM/DD/YYYY format'
		                },
		                date: {
		                    format: 'MM/DD/YYYY', 
		                    message: 'LCA Begin Date is not a valid, please enter in MM/DD/YYYY format'
		                }
		            }
		        },
		        init_lcaEndDate: {
		            validators: {
		            	notEmpty: {
		                    message: 'LCA End Date is mandatory'
		                },
		                regexp: {
		                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
		                    message: 'please enter LCA End Date in MM/DD/YYYY format'
		                },
		                date: {
		                    format: 'MM/DD/YYYY', 
		                    message: 'LCA End Date is not a valid, please enter in MM/DD/YYYY format'
		                }
		            }
		        },
		        init_lcaPostedDate: {
		            validators: {
		            	notEmpty: {
		                    message: 'LCA Filing Date is mandatory'
		                },
		                regexp: {
		                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
		                    message: 'please enter LCA End Date in MM/DD/YYYY format'
		                },
		                date: {
		                    format: 'MM/DD/YYYY', 
		                    message: 'LCA End Date is not a valid, please enter in MM/DD/YYYY format'
		                }
		            }
		        },
	init_end_metro_politan_area : {
		            validators: {
		            	notEmpty: {
		                    message: 'MetroPolitan Area is mandatory'
		                },
		                stringLength: {
		                	min: 2,
		                    max: 25,
		                    message: 'MetroPolitan Area should have 2 characters'
		                },
		                regexp: {
		                	//regexp: /^[a-zA-Z\s]+$/,
		                	regexp: /^[a-zA-Z]+(-[a-zA-Z]+)*$/,
		                   message: 'MetroPolitan Area accepts characters'
		                },
		            }
		        },
		    init_remote_metro_politan_area : {
		            validators: {
		            	notEmpty: {
		                    message: 'MetroPolitan Area is mandatory'
		                },
		                stringLength: {
		                	min: 2,
		                    max: 25,
		                    message: 'MetroPolitan Area should have 2 characters'
		                },
		                regexp: {
		                	//regexp: /^[a-zA-Z\s]+$/,
		                	regexp: /^[a-zA-Z]+(-[a-zA-Z]+)*$/,
		                   message: 'MetroPolitan Area accepts characters'
		                },
		            }
		        },    
	        init_remote_line1 : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Line1 is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Line1 should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Line1 accepts alpha numerics '
	                },
	            }
	        },
	        init_remote_city : {
	            validators: {
	            	notEmpty: {
	                    message: 'City is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'City should have 2 characters'
	                },
	                regexp: {
	                	regexp: /^[a-zA-Z\s]+$/,
	                   message: 'City accepts alphanumerics'
	                },
	            }
	        },
	        init_remote_state : {
	            validators: {
	            	notEmpty: {
	                    message: 'State is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'State should have 2 characters'
	                },
	                regexp: {
	                	regexp: /^[a-zA-Z\s]+$/,
	                   message: 'State accepts character'
	                },
	            }
	        },
	        init_remote_zipcode : {
	            validators: {
	            	notEmpty: {
	                    message: 'Zipcode is mandatory'
	                },
	                stringLength: {
	                    min: 5,
	                    max: 5,
	                    message: 'Zipcode must be 5 digits'
	                },
	                regexp: {
	                	regexp: /[0-9]/,
	                    message: 'Zipcode accepts digits'
	                },
	            }
	        },
	        'lca_othr_line1[]' : {
	            validators: {
	            	 notEmpty: {
	                    message: 'Line1 is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Line1 should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Line1 accepts alpha numerics '
	                },
	            }
	        },
	        'lca_othr_line2[]' : {
	            validators: {
	            	 isEmpty: {
	                    message: 'Line2 is mandatory'
	                },
	                stringLength: {
	                    min: 2,
	                    max: 80,
	                    message: 'Line2 should have minimum 2 and maximum 80 characters '
	                },
	                regexp: {
	                regexp: /[a-zA-Z0-9][a-zA-Z0-9\s]*/,
	                  message: 'Line2 accepts alpha numerics '
	                },
	            }
	        },
	        'lca_othr_city[]' : {
	            validators: {
	            	notEmpty: {
	                    message: 'City is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'City should have minimum 2 and maximum 25 characters'
	                },
	                regexp: {
	                	regexp: /^[a-zA-Z\s]+$/,
	                   message: 'City accepts alphanumerics'
	                },
	            }
	        },
	        'lca_othr_state[]' : {
	            validators: {
	            	notEmpty: {
	                    message: 'State is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'State should have 2 characters'
	                },
	                regexp: {
	                	regexp: /^[a-zA-Z\s]+$/,
	                   message: 'State accepts character'
	                },
	            }
	        },
	        'lca_othr_zipcode[]' : {
	            validators: {
	            	notEmpty: {
	                    message: 'Zipcode is mandatory'
	                },
	                stringLength: {
	                    min: 5,
	                    max: 5,
	                    message: 'Zipcode must be 5 digits'
	                },
	                regexp: {
	                	regexp: /[0-9]/,
	                    message: 'Zipcode accepts digits'
	                },
	            }
	        },
	    'lca_othr_remote_metro[]' : {
	            validators: {
	            	notEmpty: {
	                    message: 'MetroPolitan Area is mandatory'
	                },
	                stringLength: {
	                	min: 2,
	                    max: 25,
	                    message: 'MetroPolitan Area should have 2 characters'
	                },
	                regexp: {
	                	//regexp: /^[a-zA-Z\s]+$/,
	                   regexp: /^[a-zA-Z]+(-[a-zA-Z]+)*$/,
	                   message: 'MetroPolitan Area accepts characters'
	                },
	            }
	        }
      }
}).on('click', '[name="init_workinglocation"]', function(e) {
    // var checkBox = document.getElementById("worklocation1");
    // var workloc=$("#workinglocation1").val();
     var checkBox1=$("input[name='init_workinglocation']:checked").val();
   //  alert("checkBox1"+checkBox1);
	 if(checkBox1=='Remote/Home'){
		//alert("**if***"+checkBox.checked);
	    $("#init_remoteAddress,#init_remoteAddress1").show();
	    $('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_remote_line1',true);
	    $('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_remote_line2',true);
	    $('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_remote_city',true);
	    $('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_remote_state',true);
	    $('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_remote_zipcode',true);
	    $('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_remote_county',true);
        $('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_remote_soc_code',true);
   }else if(checkBox1=='EndClient'){
 	//	alert("**else**"+checkBox);
         $("#init_remoteAddress,#init_remoteAddress1").hide();
        $('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_remote_line1',false);
 	    $('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_remote_line2',false);
 	    $('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_remote_city',false);
 	    $('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_remote_state',false);
 	    $('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_remote_zipcode',false);
 	    $('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_remote_county',true);
 	    $('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_remote_soc_code',true);
      } 
}).on('click', '[name="lcaType"]', function(e) {
	var checkBox1=$("input[name='lcaType']:checked").val();
	var candidate = document.getElementById('candidate').value;
           $("#init_lcaBeginDate").datepicker({
			}).on('changeDate', function(selected) {
				$("#init_lcaEndDate").prop("disabled",false);
				var minDate = new Date(selected.date.valueOf());
			    $('#init_lcaEndDate').datepicker('setStartDate', minDate);
			    $('#init_LCAQDetailsForm').formValidation('revalidateField', 'init_lcaBeginDate');
			});	
			$("#init_lcaEndDate").datepicker({
			}).on('changeDate', function(selected) {
				  var minDate = new Date(selected.date.valueOf());
				  $('#init_lcaBeginDate').datepicker('setEndDate', minDate);
			    $('#init_LCAQDetailsForm').formValidation('revalidateField', 'init_lcaEndDate');
			});
			$("#init_lcaPostedDate").datepicker({
			}).on('changeDate', function(selected) {
			    $('#init_LCAQDetailsForm').formValidation('revalidateField', 'init_lcaPostedDate');
			});
		 $('#init_endClientSpan').text('');
		 $('#init_remote_soc_code').select2({	
			    placeholder: "Select Soc Code",
		 });
		 if(checkBox1=='Client Project'){
			 $('#init_lcaqbtnUpdateId').hide();
			 $('#init_endline1,#init_endline2,#init_endcity,#init_endstate,#init_endzipcode,#init_remote_county,#init_cand_job_title,#init_education,#init_reason_lca,#init_remote_soc_code,#init_duties').val('');
			// alert("if "+checkBox1);
				$.ajax({
					type : "GET",
					asyn : false,
					contentType : "application/json", // NOT dataType!
					url : "getendclientlist",
					data : {
						candidateid : candidate
					},
					success : function(response) {
						$('#init_endClientName').empty();
						$('#init_endClientName').append($('<option/>').attr("value", '').text("Select Client"));
						if(response.length>0){
							for (var i = 0; i < response.length; i++) {
								$('#init_endClientName').append($('<option/>').attr("value",response[i].clientid).text(response[i].clientName));
							 }
						}else{
						   $('#init_endClientSpan').text("There is no client data. Please add client&vendor details.");
						}
					  }
				}); 
				/* $('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_endClientName',true);
				$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_endline1',true);
			 	$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_endcity',true);
			 	$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_endstate',true);
			 	$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_endzipcode',true);
			 	$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_remote_county',true);
			 	$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_worklocation',false);
				$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_cand_job_title',false);
				$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_education',false);
			 	$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_reason_lca',false);
			 	$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_remote_soc_code',false); */
			 	
		 }else{
			$.ajax({
					type : "GET",
					asyn : false,
					contentType : "application/json", // NOT dataType!
					url : "getSocCodeList",
					data : {
						candidateid : candidate
					},
					success : function(response) {
						var socCodeList=response.socCodeList;
						$('#init_remote_soc_code').empty();
						$('#init_remote_soc_code').append($('<option/>').attr("value", '').text("Select Soc Code"));
					   // alert(socCodeList);
						if(socCodeList.length>0){
							for (var i = 0; i < socCodeList.length; i++) {
								$('#init_remote_soc_code').append($('<option/>').attr("value",socCodeList[i].soc_code).text(socCodeList[i].soc_code));
							  }
						  }
					  }
				}); 
			 $('#init_lcaqbtnUpdateId').show();
			 $('#init_remoteAddress,#init_remoteAddress1').hide();
			 $('#init_remote_addressId,#init_endClientId,#init_end_addressId,#init_remote_line1,#init_remote_line2,#init_remote_city,#init_remote_state,#init_remote_zipcode').val('')
			 $('#init_cand_job_title,#init_education,#init_reason_lca,#init_remote_soc_code').val('');
			// alert("else "+checkBox1);
			 $('#init_endClientName').empty();
			// $('select[name^="init_endClientName"] option[value="Bruce Jones"]').attr("selected","selected");
			$('#init_endClientName').append($('<option/>').attr("value", 'Tekskills Inc').text("Tekskills Inc"));
			$('#init_endline1').val("5 Independence Way, Suite 135");
			$('#init_endcity').val("Princeton");
			$('#init_endstate').val("New Jersey");
			$('#init_endzipcode').val("08540");
			$('#init_remote_county').val("Mercer");
		/* 	$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_endClientName',false);
			$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_endline1',false);
		 	$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_endcity',false);
		 	$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_endstate',false);
		 	$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_endzipcode',false);
		 	$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_remote_county',false); */
		 	$("#init_worklocation1,#init_worklocation2"). prop("checked", false);
		 /* 	$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_worklocation',true);
		 	$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_cand_job_title',true);
			$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_education',true);
		 	$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_reason_lca',true);
		 	$('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_remote_soc_code',true); */
		 	
			//$('#init_remote_soc_code').val();
			//$('#init_endline1,#init_endline2,#init_endcity,#init_endstate,#init_endzipcode,#init_remote_county,#init_remote_soc_code').val('');
			// Mercer
			 //init_endClientName
		 }
}).on('change', '[name="init_endClientName"]', function(e) {
 if($("#init_endClientName").val()==""){
		   $('#init_lcaqbtnUpdateId').hide();
		 //  document.getElementById('lcaqbtnUpdate').disabled=false;
		 }else {
			 $('#init_lcaqbtnUpdateId').show();
			// document.getElementById("init_LCAQDetailsForm").reset();
			   var candidateid = document.getElementById('candidateid').value;
			   var clientid = document.getElementById('init_endClientName').value;
			   if(clientid!='Tekskills Inc'){	
				$.ajax({
					type : "GET",
					asyn : false,
					contentType : "application/json", // NOT dataType!
					url : "getlcaquestionaries",
					data : {
						candidateid : candidateid,
						clientid : clientid
					},
		          success  : function(response){
					var endclient=response.clientObj;
					var ecaddress=response.endclientaddres;
					var remoteAdrs=response.remoteaddress;
					var socCodeList=response.socCodeList;
					var lcaLocationList=response.lcaLocationList;
					if(ecaddress!=null){
						$('#init_end_addressId').val(ecaddress.address_id);
						$('#init_endline1').val(ecaddress.line1);
						$('#init_endline2').val(ecaddress.line2);
						$('#init_endcity').val(ecaddress.city);
						$('#init_endstate').val(ecaddress.state);
						$('#init_endzipcode').val(ecaddress.zipcode);
					  } 
					
					if(remoteAdrs!=null){
						$('#init_remote_addressId').val(remoteAdrs.address_id);
						$('#init_remote_line1').val(remoteAdrs.line1);
						$('#init_remote_line2').val(remoteAdrs.line2);
						$('#init_remote_city').val(remoteAdrs.city);
						$('#init_remote_state').val(remoteAdrs.state);
						$('#init_remote_zipcode').val(remoteAdrs.zipcode);
						$('#init_remote_zipcode').val(remoteAdrs.zipcode);
						$('#init_remoteAddress,#init_remoteAddress1').show();
					}else{
						$('#init_remoteAddress,#init_remoteAddress1').hide();
						//$('#remoteaddress').val("NA");
					}
					/* $('#init_LCAQDetailsForm').formValidation('enableFieldValidators','init_worklocation',false); */
					if(endclient.workinglocation=='Remote/Home'){
						$("#init_worklocation1"). prop("checked", true);
					}else{
						$("#init_worklocation2"). prop("checked", true);
					}
					/* endClientId end_addressId  remote_addressId job_title1 education1 working_location1 reason_lca1 end_line1 end_line2 end_city  end_state end_zipcode
                    remoteline1 remoteline2 remotecity remotestate remotezipcode remotecounty remotesoc_code */
                    $('#init_endClientId').val(endclient.client_id);
					//$('#endClientName').val(endclient.clientName);
					//$('#init_organization').val(endclient.organization_name);
					//$('#init_candiname').val($('#candidateidname').val());
					$('#init_education').val(endclient.education);
					$('#init_cand_job_title').val(endclient.cand_job_title);
					$('#init_remote_county').val(endclient.county);
					
					$('#init_remote_soc_code').empty();
					$('#init_remote_soc_code').append($('<option/>').attr("value", '').text("Select Soc Code"));
				   // alert(socCodeList);
					if(socCodeList.length>0){
						for (var i = 0; i < socCodeList.length; i++) {
							$('#init_remote_soc_code').append($('<option/>').attr("value",socCodeList[i].soc_code).text(socCodeList[i].soc_code));
						  }
					  }
				/*	$('#init_remote_soc_code').select2({	
					    placeholder: "Select Soc Code",
					});*/
					/* var val=endclient.soc_code;
					 var $dropdown2=$("select[name='init_remote_soc_code']");
				     $dropdown2.find('option[value="'+val+'"]').attr('selected', true);	*/
					 $("#init_remote_soc_code").val(endclient.soc_code).trigger('change');
					
					//$('#init_remote_soc_code').val(endclient.soc_code); 
					/*else{
					   $('#init_endClientSpan').text("There is no client data. Please add client&vendor details.");
					 }*/
					
					
					$('#init_reason_lca').val(endclient.reason_lca); 
					$('#init_metro_politan_area').val(endclient.metro_politan_area); 
					
					$('.initlcaothr_locs').empty();
					if(lcaLocationList.length>0){
						for (var i = 0; i < lcaLocationList.length; i++) {
							/*var objTo = document.getElementById('OtherLocationBtnDiv');
						    var divtest = document.createElement("div");
						    divtest.setAttribute("class", "row");
						  //  <div class="row" id="uaddOtherLocationDiv">
						    divtest.innerHTML ='<div class="col-md-6 col-sm-12"><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label><div class="col-sm-6"><input id="ulcaothrline1'+lcaLocationList[i].address_id+'" type="text"  minlength="2" maxlength="80" autocomplete="off" placeholder="Enter Line1" name="ulcaothrline1" value="'+lcaLocationList[i].line1+'" class="form-control"  required></div></div><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Span style="color: red;">*</Span>City</label><div class="col-sm-6"><input id="ulca_othr_city'+lcaLocationList[i].address_id+'" type="text" minlength="2"maxlength="25" title="only Characters are allowed"autocomplete="off" placeholder="City" name="ulca_othr_city'+lcaLocationList[i].address_id+'"  value="'+lcaLocationList[i].city+'" class="form-control" required></div></div><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Span style="color: red;">*</Span>Zip Code</label><div class="col-sm-6"><input id="ulca_othr_zipcode'+lcaLocationList[i].address_id+'" type="text" pattern="[0-9]{5}" minlength="5" maxlength="5"	title="only digits are allowed" autocomplete="off"placeholder="Zip Code" name="ulca_othr_zipcode"  value="'+lcaLocationList[i].zipcode+'"class="form-control" required></div></div></div><div class="col-md-6 col-sm-12"><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Span style="color: red;"></Span>Line2</label><div class="col-sm-6"><input id="col-sm-5" type="text"pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*" minlength="2"maxlength="80" title="only alpha numerics are allowed"placeholder="Enter Line2" autocomplete="off"name="ulca_othr_line2" id="ulca_othr_line2'+lcaLocationList[i].address_id+'"  value="'+lcaLocationList[i].line2+'"class="form-control"></div></div><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Spanstyle="color: red;">*</Span>State</label><div class="col-sm-6"><input id="ulca_othr_state" type="text" minlength="2" maxlength="25" title="only Characters are allowed" autocomplete="off" placeholder="State"name="ulca_othr_state"  value="'+lcaLocationList[i].state+'" class="form-control" required></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-3 control-label"><Span style="color: red;">*</Span>Metro Politan Area</label><div class="col-sm-6"><input id="ulca_othr_remote_metro'+lcaLocationList[i].address_id+'" type="text" minlength="2"maxlength="25" title="only Characters are allowed" autocomplete="off" placeholder="Metro Politan Area" name="ulca_othr_remote_metro"  value="'+lcaLocationList[i].metro_politan_area+'" class="form-control" required></div></div></div></div>';
							objTo.appendChild(divtest);*/
							 var $template = $('#init_addOtherLocation'),
					         $clone    = $template
					                         .clone()
					                         .removeAttr('style')
					                         .removeAttr('id')
					                         .attr('data-book-index', i)
					                         .attr('class', "form-group initlcaothr_locs")
					                         .insertAfter($template);

					     // Add new field
						 $clone.find('[id="initulcaotherloc_addrid"]').val(lcaLocationList[i].address_id);
						 $clone.find('[id="initulca_othr_line1"]').val(lcaLocationList[i].line1);
						 $clone.find('[id="initulca_othr_line2"]').val(lcaLocationList[i].line2);
						 $clone.find('[id="initulca_othr_city"]').val(lcaLocationList[i].city);
						 $clone.find('[id="initulca_othr_state"]').val(lcaLocationList[i].state);
						 $clone.find('[id="initulca_othr_zipcode"]').val(lcaLocationList[i].zipcode);
						 $clone.find('[id="initulca_othr_remote_metro"]').val(lcaLocationList[i].metro_politan_area);
					     $('#init_LCAQDetailsForm')
					     .formValidation('addField', $clone.find('[name="initulca_othr_line1[]"]'))
					     .formValidation('addField', $clone.find('[name="initulca_othr_line2[]"]'))
					     .formValidation('addField', $clone.find('[name="initulca_othr_city[]"]'))
					     .formValidation('addField', $clone.find('[name="initulca_othr_state[]"]'))
					     .formValidation('addField', $clone.find('[name="initulca_othr_zipcode[]"]'))
					     .formValidation('addField', $clone.find('[name="initulca_othr_remote_metro[]"]'));
						  }
					  }
					
			      } 
	          });
	        }else{
	        	
	        }
	    }
}).on('click', '.addButtonloc', function() {
	othercl++;
	/* $('#element').removeAttr('style'); */
     var $template = $('#addOtherLocation'),
         $clone    = $template
                         .clone()
                         .removeAttr('style')
                         .removeAttr('id')
                         .attr('data-book-index', othercl)
                         .insertAfter($template);

     // Add new field
     $('#init_LCAQDetailsForm')
     .formValidation('addField', $clone.find('[name="lca_othr_line1[]"]'))
     .formValidation('addField', $clone.find('[name="lca_othr_line2[]"]'))
     .formValidation('addField', $clone.find('[name="lca_othr_city[]"]'))
     .formValidation('addField', $clone.find('[name="lca_othr_state[]"]'))
     .formValidation('addField', $clone.find('[name="lca_othr_zipcode[]"]'))
     .formValidation('addField', $clone.find('[name="lca_othr_remote_metro[]"]'));
 })
 .on('click', '.removeButtonloc', function() {
        var $row  = $(this).parents('.form-group'),
        index = $row.attr('data-book-index');
        $lca_othr_line1 = $row.find('[name="lca_othr_line1[]"]');

     // Remove fields
     $('#init_LCAQDetailsForm')
          .formValidation('removeField', $row.find('[name="lca_othr_line1[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="lca_othr_line2[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="lca_othr_city[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="lca_othr_state[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="lca_othr_remote_metro[' + index + ']"]'))
          .formValidation('removeField', $row.find('[name="lca_othr_zipcode[' + index + ']"]'))
          .formValidation('removeField', $lca_othr_line1);

     // Remove element containing the fields
     $row.remove();
       })
       .on('added.field.fv', function(e, data) {
           if (data.field === 'lca_othr_line1[]') {
               if ($('#init_LCAQDetailsForm').find(':visible[name="lca_othr_line1[]"]').length >= MAX_OPTIONS) {
                   $('#init_LCAQDetailsForm').find('.addButtonloc').attr('disabled', 'disabled');
               }
             }
        })
        .on('removed.field.fv', function(e, data) {
            if (data.field === 'lca_othr_line1[]') {
                 if ($('#init_LCAQDetailsForm').find(':visible[name="lca_othr_line1[]"]').length <= MAX_OPTIONS) {
                     $('#init_LCAQDetailsForm').find('.addButtonloc').removeAttr('disabled');
                 }
             }
});


$("#init_lcaqbtnUpdate").click(function(event) {
	event.preventDefault();
	$('#init_LCAQDetailsForm').formValidation('validate');
	if (!$('#init_LCAQDetailsForm').data('formValidation').isValid()) {
		//alert("not Valid");
	} else {
		$("#init_lcaqbtnUpdate").attr("disabled", true);
		var form = $('#init_LCAQDetailsForm')[0];
		var data = new FormData(form);
		$.ajax({
			url : "InitiateLCAQDetails", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(data) {
				 if(data!=null || data!=""){
	   	            	/* $('#addsummaryfields').html(data);
	   	      		  	$('#myModal').show();  */
					 alert(data);
	   	      		document.getElementById("init_LCAQDetailsForm").reset();
	   	      	   $('#initlcadetailsmodal').modal('hide');
	   	      		//$('#lcaList').trigger('change');
	   	      	    $("#lcatab").trigger('click');
	   	           
	   	      	    //document.getElementById("addLCADetailsForm").reset();
	   	      		//$('form').get(0).reset() 
	   	      	   //  $('#lcaList').trigger('click');
                     //addLCADetailsForm window.location.href="immigration";
	   	   	         }
	   	   	      else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			}
		});
	}
});

$('#addLCADetailsForm').formValidation({
    framework: 'bootstrap',
    row: {
        valid: 'field-success',
        invalid: 'field-error'
    },
    fields: {
    	lcaDocName: {
            validators: {
            	notEmpty: {
                    message: 'Document Name is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 50,
                    message: 'Document Name must be more than 2 and less than 50 characters long. '
                },
                regexp: {
                	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &.\/-]*)?$/,
                     message: 'Document Name accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                }
            }
        },
        lcaDocument: {
            validators: {
            	notEmpty: {
                    message: 'Document is mandatory'
                }
            }
        },
        documenttype: {
            validators: {
            	notEmpty: {
                    message: 'Please Select Document Type'
                }
            }
        },
        documentsubtype: {
            validators: {
            	notEmpty: {
                    message: 'Please Select Document Sub Type'
                }
            }
        },
    	caseType: {
    		enabled: false,
            validators: {
            	notEmpty: {
                    message: 'Case Type is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 50,
                    message: 'Case Type must be more than 2 and less than 50 characters long. '
                },
                regexp: {
                	 regexp: /^(?!\s\/&.-+$)(?:([a-zA-Z])[a-zA-Z &.\/-]*)?$/,
                     message: 'Case Type accepts alphabetical, specical characters like &-./ allowed and Space allowed but is not at beginning or end of the word'
                }
            }
        },
        job_title: {
        	enabled: false,
            validators: {
            	isEmpty: {
                    message: 'Job Title is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 100,
                    message: 'Job Title min length 4 and max length 20 '
                },
                regexp: {
                	regexp: /^(?!\d\s+$)(?:([a-zA-Z0-9])[a-zA-Z0-9 &():\/\\-]*)?$/,
                    message: 'Job Title accepts alphanumeric, specical characters like &-()/: allowed and Space allowed but is not at beginning or end of the word'
                },
            }
        },
        lcacounty : {
            validators: {
            	notEmpty: {
                    message: 'County is mandatory'
                },
                stringLength: {
                    min: 4,
                    max: 20,
                    message: 'County min length 4 and max length 20 '
                },
                regexp: {
                	regexp: /[a-zA-Z]/,
                    message: 'County accepts character'
                },
            }
        },
        soc_code : {
            validators: {
            	notEmpty: {
                    message: 'Soc Code is mandatory'
                },
                stringLength: {
                    min: 7,
                    max: 7,
                    message: 'Soc Code must be 6 digits'
                },
                regexp: {
                	regexp: /[0-9]{2}-[0-9]{4}/,
                    message: 'Soc Code accepts digits'
                },
            }
        },
        lcaNumber : {
        	enabled: false,
            validators: {
            	notEmpty: {
                    message: 'LCA Number is mandatory'
                },
                stringLength: {
                    min: 18,
                    max: 18,
                    message: 'LCA Number must be 15 digits'
                },
                regexp: {
                	regexp: /[A-Z]{1}-[0-9]{3}-[0-9]{5}-[0-9]{6}/,
                    message: 'Please enter valid LCA Number'
                 }
            }
        },
        prevailingWage : {
        	enabled: false,
            validators: {
            	notEmpty: {
                    message: 'Prevailing Wage is mandatory'
                },
                stringLength: {
                    min: 4,
                    max: 9,
                    message: 'Prevailing Wage should have minimum 4 and maximum 8 digits'
                },
                regexp: {
                	regexp: /[a-zA-Z0-9,\/]/,
                    message: 'Prevailing Wage accepts alphanumerics'
                }
            }
        },
        wageRate : {
        	enabled: false,
            validators: {
            	isEmpty: {
                    message: 'Wage Rate is mandatory'
                },
                stringLength: {
                    min: 2,
                    max: 9,
                    message: 'Wage Rate must be should have minimum 2 and maximum 8 digits'
                },
                regexp: {
                	regexp: /[a-zA-Z0-9,\/]/,
                    message: 'Wage Rate accepts alphanumerics'
                }
            }
        },
        wageLevel : {
        	enabled: false,
            validators: {
            	notEmpty: {
                    message: 'Please Select Wage Level'
                }
            }
        },    
   	   lcaBeginDate: {
   			enabled: false,
	            validators: {
	            	isEmpty: {
	                    message: 'LCA Begin Date is mandatory'
	                },
	                regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please enter LCA Begin Date in MM/DD/YYYY format'
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'LCA Begin Date is not a valid, please enter in MM/DD/YYYY format'
	                }
	            }
	        },
	        lcaEndDate: {
	        	enabled: false,
	            validators: {
	            	isEmpty: {
	                    message: 'LCA End Date is mandatory'
	                },
	                regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please enter LCA End Date in MM/DD/YYYY format'
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'LCA End Date is not a valid, please enter in MM/DD/YYYY format'
	                }
	            }
	        },	
	        lcaCertifiedDate: {
	        	enabled: false,
	            validators: {
	            	notEmpty: {
	                    message: 'LCA Certified Date is mandatory'
	                },
	                regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please enter LCA Certified Date in MM/DD/YYYY format'
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'LCA Certified Date is not a valid, please enter in MM/DD/YYYY format'
	                }
	            }
	        },
	        lcaSubDate: {
	        	enabled: false,
	            validators: {
	            	notEmpty: {
	                    message: 'LCA Submitted Date Level is mandatory'
	                },
	                regexp: {
	                	regexp: /(0[1-9]|1[012]).(0[1-9]|1[0-9]|2[0-9]|3[01]).[0-9]{4}/,
	                    message: 'please enter LCA Submitted Date in MM/DD/YYYY format'
	                },
	                date: {
	                    format: 'MM/DD/YYYY', 
	                    message: 'LCA Submitted Date is not a valid, please enter in MM/DD/YYYY format'
	                }
	            }
	        }
        }
}).on('change', '[name="lcaRefNoList"]', function(e) {
	 	 $("#lcaNumber").val('');
	 	//$('#lcaDocName,#lcaNumber,#caseType,#lcaBeginDate,#lcaCertifiedDate,#prevailingWage,#lcaSubDate,#lcaEndDate,#wageRate,#wageLevel').val('');
		 if($("#lcaRefNoList").val()==""){
			 $("#lcadisp").hide();
			 $('#documentsubtype').empty();
			// $("#lcaNumber").val('');
			 $("#lcaNumber").attr("readonly",false);
			 }else {
				 var lcaid=$("#lcaRefNoList").val();
				 var docid=$("#documenttypeId").val();
				 var candidateid = document.getElementById('candidateid').value;
				 
				
				/*  var clientid = document.getElementById('clientid').value; */
				 $.ajax({
			    	type : "GET",
			        asyn : false,
			        contentType: "application/json", // NOT dataType!
			        url  :"getsubdocsbydoclcaid",
			        data : {
			        	docid : docid,
			        	lcaid : lcaid,
			        	candidateid : candidateid,
					},
			        success  : function(response){
			        	var docCount=response.docCount;
			        	var subDoc=response.subdocTypeList;
			            var endclient=response.clientObj;
			            var lcaObj=response.lcaObj;
						var ecaddress=response.endclientaddres;
						var remoteAdrs=response.remoteaddress;
						var subTypeListDb=response.lcaHistoryList;
						
			        	 $('#docCount').val(docCount);		      
			        	 $('#documentsubtype').empty();
					     //$('#documentsubtype').append($('<option/>').attr("value", '').text("Select Document Sub Type"));
				        for(var i=0;i<subDoc.length;i++)
				     	 {
				              $('#documentsubtype').append($('<option/>').attr("value", subDoc[i].subdoctypeid).text(subDoc[i].subdoctypename));
				          } 
				        $('#documentsubtype').trigger("change");
				 	if(ecaddress!=null){
							var ecA;
							if(ecaddress.line2!=""){
								ecA=ecaddress.line1+","+ecaddress.line2+","+ecaddress.city+","+ecaddress.state+","+ecaddress.zipcode;
							}else{
								ecA=ecaddress.line1+","+ecaddress.city+","+ecaddress.state+","+ecaddress.zipcode;
							}
							$('#location1').val(ecA);
						}
						if(remoteAdrs!=null){
							var rA;
							if(remoteAdrs.line2!=""){
								rA=remoteAdrs.line1+","+remoteAdrs.line2+","+remoteAdrs.city+","+remoteAdrs.state+","+remoteAdrs.zipcode;
							}else{
								rA=remoteAdrs.line1+","+remoteAdrs.city+","+remoteAdrs.state+","+remoteAdrs.zipcode;
							}
							$('#location2').val(rA);
						}else{
							$('#location2').val("NA");
						}  
						$('#lcacandidateId').val(candidateid);
						$('#lcaclientId').val(endclient.client_id);
						$('#lcapayrateId').val(endclient.payrate_id);
						$('#lcaCandName').val($('#candidateidname').val());
						$('#lcacounty').val(endclient.county);
						$('#soc_code').val(endclient.soc_code);
						$('#job_title').val(endclient.cand_job_title);
						$('#lcaBeginDate').val(lcaObj.lca_begin_date); 
						$('#lcaEndDate').val(lcaObj.lca_end_date); 
						$('#wageRate').val(lcaObj.wage_rate+" "+lcaObj.wr_option); 
						$('#lcaSubDate').val(lcaObj.lca_submitted_date); 
						var lcaSubDate=new Date(lcaObj.lca_submitted_date);
						$('#lcaCertifiedDate').datepicker('setStartDate', lcaSubDate);
						$('input[name="lcaCertifiedDate"]').datepicker({
						}).on('changeDate', function(selected) {
							 $('#addLCADetailsForm').formValidation('revalidateField', 'lcaCertifiedDate');
						});
			             }
				    });
				 var lca=$('#lcaRefNoList option:selected').html();
				
				 if(lca.includes("NA")){
					 $("#lcaNumber").attr("readonly",false);
				 }else{
					 $("#lcaNumber").val(lca);
					 $("#lcaNumber").attr("readonly",true);
					 $('#addLCADetailsForm').bootstrapValidator('enableFieldValidators','lcaNumber',false);
				   } 
			  }
}).on('change', '[name="documentsubtype"]', function(e) {
	 if($("#documentsubtype").val()==""){
		 // $("#lcaNumber").val('');
		// $("#lcaNumber").attr("readonly",false);
		 $("#lcabtnSubmit").attr("disabled",false);
		 }else {
			// alert("else"+$('#docCount').val());
			 if($('#docCount').val()==0){
				 var lca=$('#lcaRefNoList option:selected').html();
				 var documentsubtype=$('#documentsubtype option:selected').html();
				 if(documentsubtype=='LCA Questionnaire'){
					 $("#lcadisp").hide();
				 }else{
					 $("#lcadisp").show();
					 alert("Please upload LCA Questionnaire for selected "+lca); 
				 }
			 }else{
			  $("#lcadisp").show();
			 var lcaid=$("#lcaRefNoList").val();
			 var docid=$("#documenttypeId").val();
			 var subdocid=$("#documentsubtype").val();
			 var subdoc=$('#documentsubtype option:selected').html();
			 var lca=$('#lcaRefNoList option:selected').html();
			 $.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "application/json", // NOT dataType!
		        url  :"checksubdocsbydoclcaid",
		        data : {
		        	docid : docid,
		        	subdocid : subdocid,
		        	lcaid : lcaid,
				},
		        success  : function(response){
		        	 		if(response=='Exists'){
		        	 			alert("You have already uploaded "+subdoc+" for selected "+lca);
		        	 			$("#lcabtnSubmit").attr("disabled",true);
		        	 		}else{
		        	 			$("#lcabtnSubmit").attr("disabled",false);
		        	 		}
		              }
			      });
			   }
		  }
});
 
 
 
/* var textInput = document.getElementById('lcaDocName');
var timeout = null;
textInput.onkeyup = function(e) {
	clearTimeout(timeout);
	timeout = setTimeout(function() {
		var docInput = $('#lcaDocName').val();
		  var empno=$('#empno').val(); 
		 var lcapayrateId=$('#lcapayrateId').val();
		 var type="";
    if(empno!=null){ 
		if (docInput == "") {
			$('#lcaDocInput').text('');				
			} else {
				if(lcapayrateId!=0){
			$.ajax({
				type : "GET",
				asyn : false,
				contentType : "application/json", // NOT dataType!
				url : "checkImmigrationSelectedFileName",
				data : {
					lcapayrateId : lcapayrateId,
					docInput : docInput,
					docType : type,
				},
				success : function(response) {
					if (response!="") {
						$('#lcaDocInput').text('Document Name Already Exist');
						$('#lcabtnSubmit').attr("disabled", true);
					} else {
						$('#lcaDocInput').text('');
						$('#lcabtnSubmit').attr("disabled", false);
					}
				}
			  });
		   }
		}
	 }else{
		window.location.href="loginpage";
		} 
	}, 500);
};  
 */
function ValidateSizeImmigration(file) {
	var FileSize = file.files[0].size/1024/1024;
	 var filename = file.files[0].name;
	 var type = $(file).val().split(".").pop().toLowerCase();
        if (FileSize > 50) {
            alert('File size exceeds 50 MB');
            $(file).val('');
        } else {
        	if(type=="pdf" || type=="png" || type=="docx" || type=="doc"|| type=="jpg"|| type=="jpeg" || type=="xlsx" || type=="xls" || type=="pptx" || type=="txt" || type=="tiff"){
        		var docInput=$("#lcaDocName").val();
        		var lcapayrateId=$('#lcapayrateId').val();
        		$.ajax({
        		type : "GET",
 		        asyn : false,
 		        contentType: "application/json",
				url : "checkImmigrationSelectedFileName",
				data : {
					lcapayrateId : lcapayrateId,
					docInput : docInput,
					docType : type,
				},
				success : function(response) {
					if (response!="") {
						alert("This file is already "+response + ". Please check");
						$(file).val('');
						$('#lcabtnSubmit').attr("disabled", true);
					}else{
						$('#lcaDocInput').text('');
						$('#lcabtnSubmit').attr("disabled", false);
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

$("input[name='amendmentchange']").change(function() {
    var fields = $("input[name='amendmentchange']").serializeArray(); 
    if (fields.length === 0) 
    { 
       // alert('nothing selected');
        $("#spanError").text("Please select atleast one Amendment");
		$("#duties,#role,#rate,#msa,#None").prop("disabled", false); 
		$("#spanDuties,#spanRate,#spanMsa").text('');
    } 
    else 
    { 
    	if ($('#None').is(":checked"))
    	{
    		//alert("if None is selected");
    		$("#duties,#role,#rate,#msa").prop("checked", false); 
    		$("#duties,#role,#rate,#msa").prop("disabled", true); 
    	//	$("#None").prop("disabled", false);
    	}else{
    		//alert("else None is de selected");
    		$("#duties,#role,#rate,#msa").prop("disabled", false);
    		$("#spanDuties,#spanRate,#spanMsa").text('');
    		$("#None").prop("disabled", true);
    	}
    	 
    	if ($('#duties').is(":checked")){  $("#spanDuties").text("H-1B amendment required"); } else {  $("#spanDuties").text('');}
    	if ($('#rate').is(":checked")){  $("#spanRate").text("H-1B amendment required"); } else {  $("#spanRate").text('');}
    	if ($('#msa').is(":checked")){  $("#spanMsa").text("H-1B amendment required"); } else {  $("#spanMsa").text('');}
    	//spanDuties  spanMsa
         $("#spanError").text('');
      //  $("#duties,#role,#rate,#msa"). prop("checked", false);
    }
});

/*   $("#None").change(function(){
	if ($('#None').is(":checked"))
	{
		//alert("if None is selected");
		$("#duties,#role,#rate,#msa").prop("checked", false); 
		$("#duties,#role,#rate,#msa").prop("disabled", true); 
	//	$("#None").prop("disabled", false);
	}else{
		//alert("else None is de selected");
		$("#duties,#role,#rate,#msa").prop("disabled", false);
		//$("#None").prop("disabled", false);
	}
}); */
/* function getSubDocType(){
	 var documenttype=document.getElementById('documenttype').value;
	 if(documenttype==""){
		 $('#documentsubtype').empty();
		 }else {
			 $.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "application/json", // NOT dataType!
		        url  :"getsubdocsbydocid",
		        data:{docid:documenttype},
		        success  : function(response){
		        	  $('#documentsubtype').empty();
			    	  $('#documentsubtype').append($('<option/>').attr("value", '').text("Select Document Sub Type"));
		        	for(var i=0;i<response.length;i++)
		     	       {
		        		$('#documentsubtype').append($('<option/>').attr("value", response[i].subdocumenttype_id).text(response[i].document_type));
		               }
		            }
			    });
		  }
} */

function getSubDocTypeByLcaId(){
	 var lcaRefNoList=document.getElementById('lcaRefNoList').value;
	 if(documenttype==""){
		 $('#documentsubtype').empty();
		 }else {
			 $.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "application/json", // NOT dataType!
		        url  :"getsubdocsbydocid",
		        data:{docid:documenttype},
		        success  : function(response){
		        	  $('#documentsubtype').empty();
			    	  $('#documentsubtype').append($('<option/>').attr("value", '').text("Select Document Sub Type"));
		        	for(var i=0;i<response.length;i++)
		     	       {
		        		$('#documentsubtype').append($('<option/>').attr("value", response[i].subdocumenttype_id).text(response[i].document_type));
		               }
		            }
			    });
		  }
}


$('#approvedlca').hide();
$("#documentsubtype" ).change(function() {
	var subdocid=$('#documentsubtype').val();
	var subdocname=$("#documentsubtype option:selected").text();
	$('#subdocname').val(subdocname);
	if(subdocname=='Approved LCA'){
		/* <div class="row"><h5><span><b>LCA Details</b></span></h5><br><br></div> */
		  $('#approvedlca').show();
		  $('#std,#end').hide();
		 // enddate startdate 
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','caseType',true);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','lcaNumber',true);
		 // $('#addLCADetailsForm').formValidation('enableFieldValidators','lcaBeginDate',true);
		//  $('#addLCADetailsForm').formValidation('enableFieldValidators','lcaEndDate',true);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','lcaCertifiedDate',true);
		//  $('#addLCADetailsForm').formValidation('enableFieldValidators','lcaSubDate',true);
		//  $('#addLCADetailsForm').formValidation('enableFieldValidators','soc_code',true);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','prevailingWage',true);
		//  $('#addLCADetailsForm').formValidation('enableFieldValidators','lcacounty',true);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','job_title',true);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','wageRate',false);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','wageLevel',true);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','lcacounty',true);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','soc_code',true);
		  $('#lcaspan').text('LCA Details');
		 // $('#lcaNumber').prop("required",true);
	}else{
		  $('#approvedlca').hide();
		  $('#std,#end').show();
		  //$('#lcaNumber').prop("required",false);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','lcaNumber',false);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','caseType',false);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','lcaBeginDate',false);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','lcaEndDate',false);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','lcaCertifiedDate',false);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','lcaSubDate',false);
		//  $('#addLCADetailsForm').formValidation('enableFieldValidators','soc_code',false);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','prevailingWage',false);
		//  $('#addLCADetailsForm').formValidation('enableFieldValidators','lcacounty',false);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','job_title',false);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','wageRate',false);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','wageLevel',false);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','lcacounty',false);
		  $('#addLCADetailsForm').formValidation('enableFieldValidators','soc_code',false);
	//	$('#lcaNumber,#caseType,#lcaBeginDate,#lcaEndDate,#lcaCertifiedDate,#lcaSubDate,#soc_code,#prevailingWage,#lcacounty,#job_title,#wageRate,#wageLevel').formValidation('enableFieldValidators', 'Cust_MSA',true); 
		 $('#lcaspan').text('');
	}
});


var lcaNumber = document.getElementById('lcaNumber');
var lcatimeoutup = null;
lcaNumber.onkeyup = function(e) {
	clearTimeout(lcatimeoutup);
	lcatimeoutup = setTimeout(function() {
		var lcaNumber = $('#lcaNumber').val();
		 var empno=$('#empno').val();
   if(empno!=null){ 
		if (lcaNumber == "") {
			$('#checklca').text('');
		} else {
			$.ajax({
				type : "GET",
				asyn : false,
				contentType : "application/json", // NOT dataType!
				url : "checklcanumber?lcaNumber=" + lcaNumber + "",
				success : function(response) {
					if (response !="") {
						$('#checklca').text('LCA Number Already Exist');
						$('#updateid').attr("disabled", true);
					} else {
						$('#checklca').text('');
						$('#updateid').attr("disabled", false);
					}
				}
			});
		}
	 }else{
		window.location.href="loginpage";
		} 
	}, 500);
};
$('input[name="lcaNumber"]').mask('A-999-99999-999999');
//$('input[name="soc_code"]').mask('99-9999');
//$('input[name="remote_soc_code"]').mask('99-9999');
//$('input[name="init_remote_soc_code"]').mask('99-9999');

$("#lcaList").change(function() {
	//$("#lcabtnSubmit").attr("disabled", false);
    var lcaid=$('#lcaList').val();
    var candidateid = document.getElementById('candidateid').value;
    if(lcaid!=""){
	$.ajax({
		type : "GET",
	    asyn : false,
	    contentType: "application/json",
		url : "lcadetailsbylcaid",
		data : {
			lcaid : lcaid,
		},
		success : function(response) {
			$('#clientname,#h_jobtitle').text('');
			$('#lcadatatable').dataTable().fnClearTable();
			var lca=$('#lcaRefNoList').val();
			var lca_r=$('#lcaList').val();
			if(response!=""){
			if (tablefh)
				tablefh.clear();
			var jobtitle;var clientname;
			for(var i=0;i<response.length;i++){
				var lca_number=""; var startdate="";var expirydate="";
				if(response[i].lca_number==null){	
					lca_number='<span class="label label-success" style="background-color:grey;color:white;">NA</span>';
					}else{
						lca_number=response[i].lca_number;
						}
				if(response[i].startdate==null){	
					startdate=startdate;}
				else{
						startdate=response[i].startdate;
						}
				if(response[i].expirydate==null){	
					expirydate=expirydate;}
				else{
					expirydate=response[i].expirydate;
					}
				jobtitle=response[i].jobtitle;
				clientname=response[i].client_name;
		var encoded = encodeURIComponent(response[i].file_name);
		var action;
		if(lca_r==lca){
			action='<a class="btn btn-secondary btn-sm addButton" data-toggle="modal" onclick="editLCADocument(\''+response[i].document_id+'\',\''+response[i].subdocname+'\',\''+candidateid+'\',\''+response[i].file_name+'\',\''+startdate+'\',\''+expirydate+'\',\''+response[i].inputval+'\');" style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-edit"></i></a> <a class="btn btn-info btn-sm addButton" data-toggle="modal" onclick="LcaDocHistory(\''+response[i].lca_id+'\',\''+response[i].documentsubtype_id+'\');" disabled style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-history"></i></a>';
		}else{
			action='<a class="btn btn-default btn-sm addButton" data-toggle="modal" disabled style="letter-spacing: 1px; background-color: #7d8384; color: white;"><i class="fa fa-edit"></i></a> <a class="btn btn-info btn-sm addButton" data-toggle="modal" onclick="LcaDocHistory(\''+response[i].lca_id+'\',\''+response[i].documentsubtype_id+'\');" disabled style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-history"></i></a>';
		}
		
		tablefh.row.add([
			'' + lca_number	+ '',
			'' + response[i].subdocname	+ '',
			'' + startdate	+ '',
			'' + expirydate	+ '',
			//'' + response[i].client_name	+ '',
			//'' + response[i].jobtitle	+ '',
			'<a href="downloadimmigrationdocs?filename='+encoded+'&candidate_id='+candidateid+'" style="color:blue">'+ response[i].file_name+'</a>',
			'' + action	+ '',]).draw();
			/* '<a class="btn btn-secondary btn-sm addButton" data-toggle="modal" disabled onclick="editLCADocument(\''+response[i].document_id+'\',\''+response[i].subdocname+'\',\''+candidateid+'\',\''+response[i].file_name+'\');" style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-edit"></i></a> <a class="btn btn-info btn-sm addButton" data-toggle="modal" onclick="LcaDocHistory(\''+response[i].lca_id+'\',\''+response[i].documentsubtype_id+'\');" disabled style="letter-spacing: 1px; background-color: #15aabf; color: white;"><i class="fa fa-history"></i></a>', ]).draw(); */
			}
			$('#clientname').text(clientname);
			$('#h_jobtitle').text(jobtitle);
		    }
		}
	});
   }else{
	   $('#clientname,#h_jobtitle').text('');
		$('#lcadatatable').dataTable().fnClearTable();
   }
});
$('#lcaqUdiv,#lcaqbtnUpdate').hide();
var tablehbyid = $('#hisotybyidtable').DataTable({
	"order" : [ [ 0, "desc" ] ],
	lengthMenu : [ [ 5, 10, 15, -1 ], [ 5, 10, 15, "All" ] ],
	bLengthChange : true,
	paging : true
});

function LcaDocHistory(lcaid,docsubtypeid){
	var candiname=$("#candidate option:selected").text();
	  var candidateid = document.getElementById('candidateid').value;
	
	$.ajax({
		type : "GET",
		asyn : false,
		contentType : "application/json", // NOT dataType!
		url : "getdochistorybyId",
		data : {
			lcaid : lcaid,
			docsubtypeid : docsubtypeid,
			type:"LCA"
		},
		success : function(response) {
			$('#hidclientname,#hid_jobtitle').text('');
			$('#hisotybyidtable').dataTable().fnClearTable();
			if(response!=""){
			if (tablehbyid)
				tablehbyid.clear();
			var jobtitle;var clientname;var doctypename;
			for(var i=0;i<response.length;i++){
				var lca_number=""; var startdate="";var expirydate="";
				if(response[i].lca_number==null){	
					lca_number='<span class="label label-success" style="background-color:grey;color:white;">NA</span>';
					}else{
						lca_number=response[i].lca_number;
						}
				if(response[i].startdate==null){	
					startdate=startdate;}
				else{
						startdate=response[i].startdate;
						}
				if(response[i].expirydate==null){	
					expirydate=expirydate;}
				else{
					expirydate=response[i].expirydate;
					}
				jobtitle=response[i].jobtitle;
				clientname=response[i].client_name;
				doctypename=response[i].subdocname
		var encoded = encodeURIComponent(response[i].file_name);
		tablehbyid.row.add([
			'' + response[i].document_id	+ '',
			'' + lca_number	+ '',
			'' + response[i].subdocname	+ '',
			'' + startdate	+ '',
			'' + expirydate	+ '',
			'<a href="downloadimmigrationdocs?filename='+encoded+'&candidate_id='+candidateid+'" style="color:blue">'+ response[i].file_name+'</a>', ]).draw();
			}
			
			$('#typeid').text(doctypename);
			$('#hidempname').text(candiname);
			$('#hidclientname').text(clientname);
			$('#hid_jobtitle').text(jobtitle);
			
			}
			$('#lcahistorybyidmodal').modal('show');
		}
	});
}


function editLCADocument(id,docName,candidateid,fname,std,expd,inputval){
    $('#lcadocumentid,#lcaeditFile,#edenddate,#edstartdate,#edinputval').val('');
    $('#lcaedfileName').text('');
    $('#lcadocumentid').val(id);
    $('#lcaedcandidateid').val(candidateid);
    $('#edstartdate').val(std);
    $('#edenddate').val(expd);
    $('#edinputval').val(inputval);
   // lcadocumentid	lcaedfileName  lcaeditFile edlcadocsForm edlcadocsaveid
    var encoded = encodeURIComponent(fname);
   if(docName=='LCA Questionnaire'){
	   $('#edstd').hide();
	   $("#edstartdate,#edenddate").attr("required",false);
   }else{
	   $('#edstd').show();
	   $("#edstartdate,#edenddate").attr("required",true);
	   $("#edstartdate,#edenddate").datepicker({});
      }
	$('#lcaedfileName').append('<a href="downloadimmigrationdocs?filename='+encoded+'&candidate_id='+candidateid+'" style="color:blue">'+fname+'</a>');
 	$('#editlcaDoc').text(docName+" Document Details");	
	$("#edlcadocsaveid").attr("disabled", false);
	$('#EditLCADocumentModal').modal('show');
};	

$('#EditLCADocumentModal').on('hide.bs.modal', function()
{
	$('#edlcadocsForm').bootstrapValidator('resetForm', true);
});

 $('#uploadlcadetailsmodal').on('hidden.bs.modal', function(){
	// alert("hi close");
	//$('#approvedlca').show();
	//$('#addLCADetailsForm').bootstrapValidator('resetForm', true);
});
 $('#uploadlcadetailsmodal').on('shown.bs.modal', function(){
	// alert("hi close");
	 $('#startdate,#enddate,#lcaCertifiedDate').val('').datepicker('update');
	 $("#startdate,#enddate,#lcaCertifiedDate").datepicker('setStartDate', null);
	 $("#startdate,#enddate,#lcaCertifiedDate").datepicker('setEndDate', null);
	 $('#approvedlca').show();
	 $('#addLCADetailsForm').bootstrapValidator('resetForm', true);
	 $('#approvedlca').hide();
});
 $('#lcadetailsmodal').on('shown.bs.modal', function(){
	 $('#lcaqueDiv').show();
	 $('input[name=workinglocation]').attr('checked', false);
	// $("#remote_soc_code").val('').trigger('change') ; 
	// $("#remote_soc_code").empty().trigger('change');
	 $('#updateLCAQDetailsForm').bootstrapValidator('resetForm', true);
});
 $('#lcadetailsmodal').on('hidden.bs.modal', function(){
	 $('#lcaqueDiv').show();
	 $('input[name=workinglocation]').attr('checked', false);
	 $("#remote_soc_code").empty().trigger('change');
	 document.getElementById("updateLCAQDetailsForm").reset();
	 $('#updateLCAQDetailsForm input').attr('disabled', false);
	 $('#remote_soc_code,#reason_lca').attr('disabled', false);
	 $('#updateLCAQDetailsForm').bootstrapValidator('resetForm', true);
}); 
$('#initlcadetailsmodal').on('hidden.bs.modal', function(){
	//alert("***");
//	$('#init_endClientName').empty();
	 $("#init_remote_soc_code").empty().trigger('change');
	 $('#init_endClientSpan').text('');
	 $("#init_lcaEndDate").prop("disabled",true);
	 $('#init_lcaPostedDate,#init_lcaBeginDate,#init_lcaEndDate').val('').datepicker('update');
	 $("#init_lcaPostedDate,#init_lcaBeginDate,#init_lcaEndDate").datepicker('setStartDate', null);
	 $("#init_lcaPostedDate,#init_lcaBeginDate,#init_lcaEndDate").datepicker('setEndDate', null);
	$('#init_LCAQDetailsForm').bootstrapValidator('resetForm', true);
});
$('#initlcadetailsmodal').on('shown.bs.modal', function (){
	//$('#init_endClientName').empty();
	$('.initlcaothr_locs').empty();
	$('#init_LCAQDetailsForm').bootstrapValidator('resetForm', true);
});

$("#edlcadocsaveid").click(function(event) {
	event.preventDefault();
  $('#edlcadocsForm').formValidation('validate');
 if(!$('#edlcadocsForm').data('formValidation').isValid()) {
	} else {
		$("#edlcadocsaveid").attr("disabled", true);
		var form = $('#edlcadocsForm')[0];
		var data = new FormData(form);
		$.ajax({
			url : "updateLCADocuments", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(data) {
				 if(data!="" || data!=null){
					  alert("Document updated successfully");
					  $('#EditLCADocumentModal').modal('hide');
					 // $('#lcatab').trigger('click');
					  $('#lcaList').trigger('change');
					 // $('#lcaRefNoList').trigger('change');
	   	   	         }
	   	   	      else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			}
		});
	}
});

$("#lcaqueRefNoList").change(function() {
	// $('#updateLCAQDetailsForm').bootstrapValidator('resetForm', true);
	 if($("#lcaqueRefNoList").val()==""){
		 $('#lcaqueDiv').hide();
		 //  document.getElementById('lcaqbtnUpdate').disabled=false;
		 }else {
			// document.getElementById('lcaqbtnUpdate').disabled=true;
			 $('#lcaqueDiv').show();
			 var lcaid=$("#lcaqueRefNoList").val();
			 $.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "application/json", // NOT dataType!
		        url  :"getquestionnairebylcaid",
		        data : {
		        	lcaid : lcaid
				},
		        success  : function(response){
		        	var lcaObj=response.lcaObj;
					var endclient=response.clientObj;
					var ecaddress=response.endclientaddres;
					var remoteAdrs=response.remoteaddress;
					var socCodeList=response.socCodeList;
					var lcaLocationList=response.lcaLocationList;
					//alert(lcaLocationList.length);
					
					$('#remote_soc_code').empty();
					//$('#remote_soc_code').append($('<option/>').attr("value", '').text("Select Soc Code"));
					$('#remote_soc_code').select2({	
					    placeholder: "Select Soc Code",
					});
				   // alert(socCodeList);
					if(socCodeList.length>0){
						for (var i = 0; i < socCodeList.length; i++) {
							$('#remote_soc_code').append($('<option/>').attr("value",socCodeList[i].soc_code).text(socCodeList[i].soc_code));
						  }
					  }
					/* var val=endclient.soc_code;
					 var $dropdown2=$("select[name='remote_soc_code']");
				     $dropdown2.find('option[value="'+val+'"]').attr('selected', true);	*/
				     $("#remote_soc_code").val(endclient.soc_code).trigger('change');
				     
					if(ecaddress!=null){
						$('#end_addressId').val(ecaddress.address_id);
						$('#endline1,#end_line1').val(ecaddress.line1);
						$('#endline2,#end_line2').val(ecaddress.line2);
						$('#endcity,#end_city').val(ecaddress.city);
						$('#endstate,#end_state').val(ecaddress.state);
						$('#endzipcode,#end_zipcode').val(ecaddress.zipcode);
					  } 
					if(remoteAdrs!=null){
						$('#remote_addressId').val(remoteAdrs.address_id);
						$('#remote_line1,#remoteline1').val(remoteAdrs.line1);
						$('#remote_line2,#remoteline2').val(remoteAdrs.line2);
						$('#remote_city,#remotecity').val(remoteAdrs.city);
						$('#remote_state,#remotestate').val(remoteAdrs.state);
						$('#remote_zipcode,#remotezipcode').val(remoteAdrs.zipcode);
						$('#uremote_metro,#uremotemetro').val(remoteAdrs.metro_politan_area);
						$('#remoteAddress,#remoteAddress1').show();
					}else{
						$('#remoteAddress,#remoteAddress1').hide();
						//$('#remoteaddress').val("NA");
					}
					
					if(endclient.workinglocation=='Remote/Home'){
						$("#worklocation1"). prop("checked", true);
					}else{
						$("#worklocation2"). prop("checked", true);
					}
					 
					/* endClientId end_addressId  remote_addressId job_title1 education1 working_location1 reason_lca1 end_line1 end_line2 end_city  end_state end_zipcode
                   remoteline1 remoteline2 remotecity remotestate remotezipcode remotecounty remotesoc_code */
                   $('#endClientId').val(endclient.client_id);
                   $('#working_location1').val(endclient.workinglocation);
					$('#endClientName').val(endclient.clientName);
					$('#organization').val(endclient.organization_name);
					$('#candiname').val($('#candidateidname').val());
					$('#education,#education1').val(endclient.education);
					$('#cand_job_title,#job_title1').val(endclient.cand_job_title);
					$('#u_duties,#uduties').val(lcaObj.job_duties);
					$('#remote_county,#remotecounty').val(endclient.county);
					$('#remote_soc_code,#remotesoc_code').val(endclient.soc_code); 
					$('#reason_lca,#reason_lca1').val(endclient.reason_lca); 
					$('#u_lcaBeginDate,#ulcaBeginDate').val(lcaObj.lca_begin_date); 
					$('#u_lcaEndDate,#ulcaEndDate').val(lcaObj.lca_end_date); 
					$('#u_wageRate,#uwageRate').val(lcaObj.wage_rate); 
					$('#u_metro_politan_area,#umetro_politan_area').val(endclient.metro_politan_area); 
					$('#u_lcaPostedDate,#ulcaPostedDate').val(lcaObj.lca_submitted_date); 
					//u_duties u_metro_politan_area
				//	var m='<div class="row" id="addOtherLocationDiv"><div class="col-md-6 col-sm-12"><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label><div class="col-sm-6"><input id="lca_othr_line1" type="text"  minlength="2" maxlength="80" autocomplete="off" placeholder="Enter Line1" name="lca_othr_line1[]" class="form-control"  required></div></div><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Span style="color: red;">*</Span>City</label><div class="col-sm-6"><input id="lca_othr_city" type="text" minlength="2"maxlength="25" title="only Characters are allowed"autocomplete="off" placeholder="City" name="lca_othr_city[]"class="form-control" required></div></div><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Span style="color: red;">*</Span>Zip Code</label><div class="col-sm-6"><input id="lca_othr_zipcode" type="text" pattern="[0-9]{5}" minlength="5" maxlength="5"	title="only digits are allowed" autocomplete="off"placeholder="Zip Code" name="lca_othr_zipcode[]"class="form-control" required></div></div></div><div class="col-md-6 col-sm-12"><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Span style="color: red;"></Span>Line2</label><div class="col-sm-6"><input id="col-sm-5" type="text"pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*" minlength="2"maxlength="80" title="only alpha numerics are allowed"placeholder="Enter Line2" autocomplete="off"name="lca_othr_line2[]" id="lca_othr_line2" class="form-control"></div></div><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Spanstyle="color: red;">*</Span>State</label><div class="col-sm-6"><input id="lca_othr_state" type="text" minlength="2" maxlength="25" title="only Characters are allowed" autocomplete="off" placeholder="State"name="lca_othr_state[]" class="form-control" required></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-3 control-label"><Span style="color: red;">*</Span>Metro Politan Area</label><div class="col-sm-6"><input id="lca_othr_remote_metro" type="text" minlength="2"maxlength="25" title="only Characters are allowed" autocomplete="off" placeholder="Metro Politan Area" name="lca_othr_remote_metro[]" class="form-control" required></div></div></div></div>';
					//$('#OtherLocationBtnDiv').empty();
					
					$('.ulcaothr_locs').empty();
					if(lcaLocationList.length>0){
						for (var i = 0; i < lcaLocationList.length; i++) {
							/*var objTo = document.getElementById('OtherLocationBtnDiv');
						    var divtest = document.createElement("div");
						    divtest.setAttribute("class", "row");
						  //  <div class="row" id="uaddOtherLocationDiv">
						    divtest.innerHTML ='<div class="col-md-6 col-sm-12"><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label><div class="col-sm-6"><input id="ulcaothrline1'+lcaLocationList[i].address_id+'" type="text"  minlength="2" maxlength="80" autocomplete="off" placeholder="Enter Line1" name="ulcaothrline1" value="'+lcaLocationList[i].line1+'" class="form-control"  required></div></div><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Span style="color: red;">*</Span>City</label><div class="col-sm-6"><input id="ulca_othr_city'+lcaLocationList[i].address_id+'" type="text" minlength="2"maxlength="25" title="only Characters are allowed"autocomplete="off" placeholder="City" name="ulca_othr_city'+lcaLocationList[i].address_id+'"  value="'+lcaLocationList[i].city+'" class="form-control" required></div></div><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Span style="color: red;">*</Span>Zip Code</label><div class="col-sm-6"><input id="ulca_othr_zipcode'+lcaLocationList[i].address_id+'" type="text" pattern="[0-9]{5}" minlength="5" maxlength="5"	title="only digits are allowed" autocomplete="off"placeholder="Zip Code" name="ulca_othr_zipcode"  value="'+lcaLocationList[i].zipcode+'"class="form-control" required></div></div></div><div class="col-md-6 col-sm-12"><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Span style="color: red;"></Span>Line2</label><div class="col-sm-6"><input id="col-sm-5" type="text"pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*" minlength="2"maxlength="80" title="only alpha numerics are allowed"placeholder="Enter Line2" autocomplete="off"name="ulca_othr_line2" id="ulca_othr_line2'+lcaLocationList[i].address_id+'"  value="'+lcaLocationList[i].line2+'"class="form-control"></div></div><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Spanstyle="color: red;">*</Span>State</label><div class="col-sm-6"><input id="ulca_othr_state" type="text" minlength="2" maxlength="25" title="only Characters are allowed" autocomplete="off" placeholder="State"name="ulca_othr_state"  value="'+lcaLocationList[i].state+'" class="form-control" required></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-3 control-label"><Span style="color: red;">*</Span>Metro Politan Area</label><div class="col-sm-6"><input id="ulca_othr_remote_metro'+lcaLocationList[i].address_id+'" type="text" minlength="2"maxlength="25" title="only Characters are allowed" autocomplete="off" placeholder="Metro Politan Area" name="ulca_othr_remote_metro"  value="'+lcaLocationList[i].metro_politan_area+'" class="form-control" required></div></div></div></div>';
							objTo.appendChild(divtest);*/
							 var $template = $('#uaddOtherLocation'),
					         $clone    = $template
					                         .clone()
					                         .removeAttr('style')
					                         .removeAttr('id')
					                         .attr('data-book-index', i)
					                         .attr('class', "form-group ulcaothr_locs")
					                         .insertAfter($template);

					     // Add new field
						 $clone.find('[id="ulcaotherloc_addrid"]').val(lcaLocationList[i].address_id);
						 $clone.find('[id="ulca_othr_line1"]').val(lcaLocationList[i].line1);
						 $clone.find('[id="ulca_othr_line2"]').val(lcaLocationList[i].line2);
						 $clone.find('[id="ulca_othr_city"]').val(lcaLocationList[i].city);
						 $clone.find('[id="ulca_othr_state"]').val(lcaLocationList[i].state);
						 $clone.find('[id="ulca_othr_zipcode"]').val(lcaLocationList[i].zipcode);
						 $clone.find('[id="ulca_othr_remote_metro"]').val(lcaLocationList[i].metro_politan_area);
					     $('#updateLCAQDetailsForm')
					     .formValidation('addField', $clone.find('[name="ulca_othr_line1[]"]'))
					     .formValidation('addField', $clone.find('[name="ulca_othr_line2[]"]'))
					     .formValidation('addField', $clone.find('[name="ulca_othr_city[]"]'))
					     .formValidation('addField', $clone.find('[name="ulca_othr_state[]"]'))
					     .formValidation('addField', $clone.find('[name="ulca_othr_zipcode[]"]'))
					     .formValidation('addField', $clone.find('[name="ulca_othr_remote_metro[]"]'));
						  }
					  }
					//alert(lcaObj.wr_option);
					$('#uwr_option').val(lcaObj.wr_option); 
					if(response.docCount==0){
						$('#u_duties').attr('disabled', false);
						$('#updateLCAQDetailsForm input').attr('disabled', false);
						$('#remote_soc_code,#reason_lca,#uwr_option').attr('disabled', false);
						$('#lcaqUdiv,#lcaqbtnUpdate').show();
					}else{
						$('#u_duties').attr('disabled', true);
						 $('#updateLCAQDetailsForm input').attr('disabled', 'disabled');
						 $('#remote_soc_code,#reason_lca,#uwr_option').attr('disabled', 'disabled');
						 $('#lcaqueRefNoList').attr('disabled', false); 
						$('#lcaqUdiv,#lcaqbtnUpdate').hide();
					}
			    } 
	        });
	    }
});

$('#endline1').on('keyup', function() {
	 if($('#endline1').val()==$('#end_line1').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});
$('#endline2').on('keyup', function() {
	 if($('#endline2').val()==$('#end_line2').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});

$('#endcity').on('keyup', function() {
	 if($('#endcity').val()==$('#end_city').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});
$('#endstate').on('keyup', function() {
	 if($('#endstate').val()==$('#end_state').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});
$('#endzipcode').on('keyup', function() {
	 if($('#endzipcode').val()==$('#end_zipcode').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});

$('#remote_line1').on('keyup', function() {
	 if($('#remote_line1').val()==$('#remoteline1').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});
$('#remote_line2').on('keyup', function() {
	 if($('#remote_line2').val()==$('#remoteline2').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});


$('#u_lcaBeginDate').on('change', function() {
	 if($('#u_lcaBeginDate').val()==$('#ulcaBeginDate').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});
$('#u_lcaEndDate').on('change', function() {
	 if($('#u_lcaEndDate').val()==$('#ulcaEndDate').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});
$('#u_lcaPostedDate').on('change', function() {
	 if($('#u_lcaPostedDate').val()==$('#ulcaPostedDate').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});
$('#u_wageRate').on('keyup', function() {
	 if($('#u_wageRate').val()==$('#uwageRate').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});
$('#u_metro_politan_area').on('keyup', function() {
	 if($('#u_metro_politan_area').val()==$('#umetro_politan_area').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});


$('#remote_city').on('keyup', function() {
	 if($('#remote_city').val()==$('#remotecity').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});
$('#remote_state').on('keyup', function() {
	 if($('#remote_state').val()==$('#remotestate').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});
$('#remote_zipcode').on('keyup', function() {
	 if($('#remote_zipcode').val()==$('#remotezipcode').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});
$('#remote_county').on('keyup', function() {
	 if($('#remote_county').val()==$('#remotecounty').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});
$('#remote_soc_code').on('keyup', function() {
	 if($('#remote_soc_code').val()==$('#remotesoc_code').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});
  

$('#reason_lca').on('change', function() {
	 if($('#reason_lca').val()==$('#reason_lca1').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});
$('#cand_job_title').on('keyup', function() {
	 if($('#cand_job_title').val()==$('#job_title1').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});

$('#education').on('keyup', function() {
	 if($('#education').val()==$('#education1').val())
	{document.getElementById('lcaqbtnUpdate').disabled=true;}else{document.getElementById('lcaqbtnUpdate').disabled=false;} 
});


$("#lcaqbtnUpdate").click(function(event) {
	event.preventDefault();
	$('#updateLCAQDetailsForm').formValidation('validate');
	if (!$('#updateLCAQDetailsForm').data('formValidation').isValid()) {
		//alert("not Valid");
	} else {
		/* endClientId end_addressId  remote_addressId education cand_job_title reason_lca endClientName */
		$("#lcaqbtnUpdate").attr("disabled", true);
		var form = $('#updateLCAQDetailsForm')[0];
		var data = new FormData(form);
		$.ajax({
			url : "updatelcaqetails", //this is the submit URL
			type : "POST",
			enctype : 'multipart/form-data',
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			success : function(data) {
				 if(data!=null || data!=""){
					 alert(data);
	   	      		 document.getElementById("updateLCAQDetailsForm").reset();
	   	      	     $('#lcaqUdiv').hide();
	   	      	     $('#lcadetailsmodal').modal('hide');
	   	      	     $("#lcatab").trigger('click');
	   	      	     $("#lcadetails").trigger('click');
	   	      		 //$("#lcaqueRefNoList").trigger('change');
	   	   	         }
	   	   	      else{
	   	   	          window.location.href="loginpage";
	   	   	   	      }
			}
		});
	}
});

		var coll = document.getElementsByClassName("collapsibletask");
		var i;

		for (i = 0; i < coll.length; i++) {
			coll[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var content = this.nextElementSibling;
				if (content.style.display === "block") {
					content.style.display = "none";
				} else {
					content.style.display = "block";
				}
			});
		}
		var collj = document.getElementsByClassName("collapsiblelca");
		var j;
		for (j = 0; j < collj.length; j++) {
			collj[j].addEventListener("click", function() {
				this.classList.toggle("active");
				var content = this.nextElementSibling;
				if (content.style.display === "block") {
					content.style.display = "none";
				} else {
					content.style.display = "block";
				}
			});
		}
		function isNumber(evt) {
		    var iKeyCode = (evt.which) ? evt.which : evt.keyCode
		    if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57)){
		    	return false;
		    }
		    return true;
		}
		function viewLCADetails(lcaid){

			 $('#viewlcadetailsmodal').modal('show');
			 $.ajax({
		    	type : "GET",
		        asyn : false,
		        contentType: "application/json", // NOT dataType!
		        url  :"getquestionnairebylcaid",
		        data : {
		        	lcaid : lcaid
				},
		        success  : function(response){
		        	var lcaObj=response.lcaObj;
					var endclient=response.clientObj;
					var ecaddress=response.endclientaddres;
					var remoteAdrs=response.remoteaddress;
					var socCodeList=response.socCodeList;
					var lcaLocationList=response.lcaLocationList;
					$('#vlremote_soc_code').empty();
					//$('#remote_soc_code').append($('<option/>').attr("value", '').text("Select Soc Code"));
					$('#vlremote_soc_code').select2({	
					    placeholder: "Select Soc Code",
					});
				   // alert(socCodeList);
					if(socCodeList.length>0){
						for (var i = 0; i < socCodeList.length; i++) {
							$('#vlremote_soc_code').append($('<option/>').attr("value",socCodeList[i].soc_code).text(socCodeList[i].soc_code));
						  }
					  }
					/* var val=endclient.soc_code;
					 var $dropdown2=$("select[name='remote_soc_code']");
				     $dropdown2.find('option[value="'+val+'"]').attr('selected', true);	*/
				     $("#vlremote_soc_code").val(endclient.soc_code).trigger('change');
				     
					if(ecaddress!=null){
						$('#vlend_addressId').val(ecaddress.address_id);
						$('#vlendline1,#vlend_line1').val(ecaddress.line1);
						$('#vlendline2,#vlend_line2').val(ecaddress.line2);
						$('#vlendcity,#vlend_city').val(ecaddress.city);
						$('#vlendstate,#vlend_state').val(ecaddress.state);
						$('#vlendzipcode,#vlend_zipcode').val(ecaddress.zipcode);
					  } 
					if(remoteAdrs!=null){
						$('#vlremote_addressId').val(remoteAdrs.address_id);
						$('#vlremote_line1,#vlremoteline1').val(remoteAdrs.line1);
						$('#remote_line2,#vlremoteline2').val(remoteAdrs.line2);
						$('#vlremote_city,#vlremotecity').val(remoteAdrs.city);
						$('#vlremote_state,#vlremotestate').val(remoteAdrs.state);
						$('#vlremote_zipcode,#vlremotezipcode').val(remoteAdrs.zipcode);
						$('#vlremoteAddress,#vlremoteAddress1').show();
					}else{
						$('#vlremoteAddress,#vlremoteAddress1').hide();
						//$('#remoteaddress').val("NA");
					}
					
					if(endclient.workinglocation=='Remote/Home'){
						$("#vlworklocation1"). prop("checked", true);
					}else{
						$("#vlworklocation2"). prop("checked", true);
					}
					
					/* endClientId end_addressId  remote_addressId job_title1 education1 working_location1 reason_lca1 end_line1 end_line2 end_city  end_state end_zipcode
                  remoteline1 remoteline2 remotecity remotestate remotezipcode remotecounty remotesoc_code */
                  $('#vlendClientId').val(endclient.client_id);
                  $('#vlworking_location1').val(endclient.workinglocation);
					$('#vlendClientName').val(endclient.clientName);
					$('#vlorganization').val(endclient.organization_name);
					$('#vlcandiname').val($('#candidateidname').val());
					$('#vleducation,#vleducation1').val(endclient.education);
					$('#vlcand_job_title,#vljob_title1').val(endclient.cand_job_title);
					$('#vlremote_county,#vlremotecounty').val(endclient.county);
					$('#vlremote_soc_code,#vlremotesoc_code').val(endclient.soc_code); 
					$('#vlreason_lca,#vlreason_lca1').val(endclient.reason_lca); 
					$('#vlu_lcaBeginDate,#vlulcaBeginDate').val(lcaObj.lca_begin_date); 
					$('#vlu_lcaEndDate,#vlulcaEndDate').val(lcaObj.lca_end_date); 
					$('#vlu_wageRate,#vluwageRate').val(lcaObj.wage_rate); 
					$('#vlu_metro_politan_area,#vlumetro_politan_area').val(endclient.metro_politan_area); 
					$('#vlu_lcaPostedDate,#vlulcaPostedDate').val(lcaObj.lca_submitted_date); 
					$('#vluwr_option').val(lcaObj.wr_option);
					
					$('#vOtherLocationBtnDiv').empty();
					if(lcaLocationList.length>0){
						for (var i = 0; i < lcaLocationList.length; i++) {
							var objTo = document.getElementById('vOtherLocationBtnDiv');
						    var divtest = document.createElement("div");
						    divtest.setAttribute("class", "row");
						    divtest.innerHTML ='<div class="col-md-6 col-sm-12"><h5><b>LCA Location Details</b></h5><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Span style="color:red;">*</Span>Line1</label><div class="col-sm-6"><input id="ulcaothrline1'+lcaLocationList[i].address_id+'" type="text"  minlength="2" maxlength="80" autocomplete="off" placeholder="Enter Line1" name="ulcaothrline1" value="'+lcaLocationList[i].line1+'" class="form-control"  required></div></div><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Span style="color: red;">*</Span>City</label><div class="col-sm-6"><input id="ulca_othr_city'+lcaLocationList[i].address_id+'" type="text" minlength="2"maxlength="25" title="only Characters are allowed"autocomplete="off" placeholder="City" name="ulca_othr_city'+lcaLocationList[i].address_id+'"  value="'+lcaLocationList[i].city+'" class="form-control" required></div></div><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Span style="color: red;">*</Span>Zip Code</label><div class="col-sm-6"><input id="ulca_othr_zipcode'+lcaLocationList[i].address_id+'" type="text" pattern="[0-9]{5}" minlength="5" maxlength="5"	title="only digits are allowed" autocomplete="off"placeholder="Zip Code" name="ulca_othr_zipcode"  value="'+lcaLocationList[i].zipcode+'"class="form-control" required></div></div></div><div class="col-md-6 col-sm-12"><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Span style="color: red;"></Span>Line2</label><div class="col-sm-6"><input id="col-sm-5" type="text"pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*" minlength="2"maxlength="80" title="only alpha numerics are allowed"placeholder="Enter Line2" autocomplete="off"name="ulca_othr_line2" id="ulca_othr_line2'+lcaLocationList[i].address_id+'"  value="'+lcaLocationList[i].line2+'"class="form-control"></div></div><div class="form-group row"><label for="inputPassword" class="col-sm-3 control-label"><Spanstyle="color: red;">*</Span>State</label><div class="col-sm-6"><input id="ulca_othr_state" type="text" minlength="2" maxlength="25" title="only Characters are allowed" autocomplete="off" placeholder="State"name="ulca_othr_state"  value="'+lcaLocationList[i].state+'" class="form-control" required></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-3 control-label"><Span style="color: red;">*</Span>Metro Politan Area</label><div class="col-sm-6"><input id="ulca_othr_remote_metro'+lcaLocationList[i].address_id+'" type="text" minlength="2"maxlength="25" title="only Characters are allowed" autocomplete="off" placeholder="Metro Politan Area" name="ulca_othr_remote_metro"  value="'+lcaLocationList[i].metro_politan_area+'" class="form-control" required></div></div></div></div>';
							objTo.appendChild(divtest);
							/* var $template = $('#uaddOtherLocation'),
					         $clone    = $template
					                         .clone()
					                         .removeAttr('style')
					                         .removeAttr('id')
					                         .attr('data-book-index', i)
					                         .attr('class', "form-group ulcaothr_locs")
					                         .insertAfter($template);

					     // Add new field
						 $clone.find('[id="ulcaotherloc_addrid"]').val(lcaLocationList[i].address_id);
						 $clone.find('[id="ulca_othr_line1"]').val(lcaLocationList[i].line1);
						 $clone.find('[id="ulca_othr_line2"]').val(lcaLocationList[i].line2);
						 $clone.find('[id="ulca_othr_city"]').val(lcaLocationList[i].city);
						 $clone.find('[id="ulca_othr_state"]').val(lcaLocationList[i].state);
						 $clone.find('[id="ulca_othr_zipcode"]').val(lcaLocationList[i].zipcode);
						 $clone.find('[id="ulca_othr_remote_metro"]').val(lcaLocationList[i].metro_politan_area);
					     $('#updateLCAQDetailsForm')
					     .formValidation('addField', $clone.find('[name="ulca_othr_line1[]"]'))
					     .formValidation('addField', $clone.find('[name="ulca_othr_line2[]"]'))
					     .formValidation('addField', $clone.find('[name="ulca_othr_city[]"]'))
					     .formValidation('addField', $clone.find('[name="ulca_othr_state[]"]'))
					     .formValidation('addField', $clone.find('[name="ulca_othr_zipcode[]"]'))
					     .formValidation('addField', $clone.find('[name="ulca_othr_remote_metro[]"]'));*/
						  }
					  }
					/*if(response.docCount==0){
						$('#vlupdateLCAQDetailsForm input').attr('disabled', false);
						$('#vlupdateLCAQDetailsForm input').attr('disabled', false);
						$('#remote_soc_code,#vlreason_lca').attr('disabled', false);
						$('#lcaqUdiv,#vllcaqbtnUpdate').show();
						 $('#vlupdateLCAQDetailsForm input').attr('disabled', 'disabled');
						 $('#vlremote_soc_code,#vlreason_lca').attr('disabled', 'disabled');
						 $('#vllcaqueRefNoList').attr('disabled', false); 
						$('#vllcaqUdiv,#vllcaqbtnUpdate').hide();
					}else{*/
						 $('#vlupdateLCAQDetailsForm input').attr('disabled', 'disabled');
						 $('#vlremote_soc_code,#vlreason_lca').attr('disabled', 'disabled');
						 $('#vllcaqueRefNoList').attr('disabled', false); 
						 $('#vllcaqUdiv,#vllcaqbtnUpdate').hide();
					//}
			    } 
	        });
	    //}
}//);
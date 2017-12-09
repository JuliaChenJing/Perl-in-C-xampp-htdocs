/**
 * EasyUI for jQuery 1.5.3
 * 
 * author:Ming Li
 *
 */


$.fn.datebox.defaults.formatter = function(date){
	var y = date.getFullYear();
	var m = date.getMonth()+1;
	var d = date.getDate();
	return y+'-'+m+'-'+d;
}
$.fn.datebox.defaults.parser = function(s){
	var t = Date.parse(s);
	if (!isNaN(t)){
		return new Date(t);
	} else {
		return new Date();
	}
}

 

//replace the request service url   queryServices.pl  addServices.pl
common_url = "perl/";


$( document ).ready(function() {
	// Handler for .ready() called.
	initPage();
});


function initPage(){
	//alert("initPage");
	fn_loadData();
}


function fn_loadData(searchKey){
	var josonData ;
	if (searchKey == null){
		josonData = {"keyWords":''};
	}else{
		josonData = {"keyWords":searchKey};
	}
	//josonData = JSON.stringify({keyWords:"test"});
	josonData = JSON.stringify(josonData);
	$.ajax({
		  url			: common_url+'queryServices.pl',
		  type			: 'POST',
		  //data			: JSON.stringify({keyWords:"test"}),
		  data			: josonData,
		  dataType  	: "json",
		  contentType   : "application/json; charset=utf-8",
		  success		: function(data) {
			//called when successful
			//console.log(data);
			$('#table_appointments').datagrid({
				data: data
			});
		  },
		  error			: function(e) {
			//called when there is an error
			console.log(e.message);
		  }
	});
}

function fn_showAddWIndows(self){
	$('#win').window('open');  // open a window
}

function fn_searchAppointments(self){
	var searchKey = $("#search_appointmentDescription").val();
	fn_loadData(searchKey);
}

function fn_saveAppointments(self){
	alert("fn_saveAppointments");
	var josonData = {};
	josonData.appointmentDescription =  $('#appointmentDescription').val();
	 
	josonData.appointmentDate =  $('#appointmentDate').val();
	josonData.appointmentTime = $('#appointmentTime').val();
	josonData = JSON.stringify(josonData);
	$.ajax({
		  url			: common_url+"addServices.pl",
		  type			: 'POST',
		  data			: josonData,
		  dataType  	: "json",
		  contentType   : "application/json; charset=utf-8",
		  success		: function(data) {
			console.log("success"+data);
			$('#win').window('close');  // close a window
		  },
		  error			: function(e) {
			//called when there is an error
			console.log(e.message);
		  }
	});
}

function fn_test(self){
	alert("Easy to implement,But I am sorry for this, I didn't do more"); 
}
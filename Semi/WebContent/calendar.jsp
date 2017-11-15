<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<title>Document</title>

<script src="./js/moment.min.js"></script>
<link rel="stylesheet" href="./css/fullcalendar.css" />
<link rel="stylesheet" href="./css/fullcalendar.print.css" media='print' />

<script src="./js/jquery.min.js"></script>
<script src="./js/fullcalendar.js"></script>
<script src="./js/locale-all.js"></script>


<style type="text/css">
.Disponible {
	background-color: green;
	color: #ffffff;
	border-radius: 20px;
}

.NoDisponible {
	background-color: red;
	color: #ffffff;
	border-radius: 20px;
}
html{
	width: 650px;
	height: 550px;
	display: inline-block;

}

body{
	width: 650px;
	height: 550px;
	display: inline-block;
}

</style>

<script type="text/javascript">

var json1 = null;

	$(document).ready(function() {
	
		$.get("./function/functionCalGet.function",function(data){
			
			//var obj = JSON.parse(data);
			//alert(data);
			console.log("data : "+data);

		    $('#calendar').fullCalendar({
		        // put your options and callbacks here 
		        events:	$.parseJSON(data)

		        ,
		        dayClick: function(date, jsEvent, view) {

				alert('Current title: ' + view.title + 'Clicked date: ' + date.format());
				console.log("date: " + date.format());
		   	    //  $(this).css('background-color', 'red');
		        $("#contents_title").text(date.format());
		        
		        $.get("./function/functionCalList.function?date="+date.format(),function(data){
		        	
		        	//alert(data);
		        	$("#contents_top").html(data);
		        	//console.log(data);
		        	//$("#contents_top").text(data);
		        	$("#contents_top").on("click", ".delete",function(){
		        	
		        	console.log("value: "+$(this).data("value"));
		        	
		        	 $.get("./function/functionCalDelete.function?id="+$(this).data("value"),function(data){
		     			
		     			//alert(data+" "+$(message));
		      			$.get("./function/functionCalList.function?date="+date.format(), function(data){

		      				//alert(data);
		      				$("#contents_top").html(data);
		      				
		      				});
		      			}); 
		        	});
		        	
		        	$("#contents_top").on("click", ".add",function(){ 
		        		
		        		$.get("./function/functionCalView.function?type="+"addview",function(data){
		        			$("#contents_bottom").html(data);
		        			$("#contents_bottom").on("click","#add_btn",function(){
		        				
		        				console.log(" title: "+$("#title").val()+"  contents: "+$("textarea#contents").val()+"  start: "+$("#date_start").val()+"  end: "+$("#date_end").val());
								var title = $("#title").val().trim();
								var contents = $("textarea#contents").val();
								var start = $("#date_start").val().trim();
								var end = $("#date_end").val().trim();
								
		        				if(title !="" && contents !="" && start !=""){
									$.get("./function/functionCalAdd.function?title="+title+"&contents="+contents+"&start="+start+"&end="+end,function(data){
										var result =data.trim();
										if(result =="OK"){
											alert("추가완료");
					        			}else{
					        				alert("추가실패");
					        			}
									});
								}else{
									alert("정확한 정보를 기입해주세요.");
								}	
		        			});	
		        		});		
		        	});
		        	
		        $("#contents_top").on("click", ".update",function(){ 
		        		var id = $(this).data("value");
			        	console.log("value: "+$(this).data("value"));
			        	
			        $.get("./function/functionCalView.function?id="+id+"&type="+"view",function(data){
			        	
			        	$("#contents_bottom").html(data);
			        	$("#contents_bottom").on("click","#update_btn",function(){
			        		
			        		console.log("id: "+$("#id").val()+"  title: "+$("#title").val()+"  contents: "+$("#contents").val());
			        		var table  = $("#id").val()+"&title="+$("#title").val() +"&contents="+$("#contents").val() +"&date_start="+$("#date_start").val()
			        		+"&date_end="+$("#date_end").val() +"&url="+$("#url").val() +"&className="+$("#className").val() +"&editable="+$("#editable").val() +"&contents="+$("#contents").val();
			        		$.get("./function/functionCalUpdate.function?id="+table,function(data){
									var result =data.trim();
			        			if(result == "OK"){
			        				alert("수정완료");
			        			}else{
			        				alert("수정실패");
			        			}
			        				
			        		});			
			        	});     	
			        	   });
			        	});
			        		
		        });	        
				// alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
		   	    //alert('Current view: ' + view.name);
		   	    },
		   	   // titleFormat: '[calendar]'   
		    })
		    
		});
    /* ------------------------------------------------- popup start ----------------------------------------------------- */
    
		/* ------------------------------------------------- popup end ----------------------------------------------------- */   
});

</script>

</head>
<body>
	FUll calendar
		<div id='calendar' style="width: 600px; height: 700px; float:left;"></div>
		<div id="contents"
		style="border: 1px solid black; width: 600px; height: 600px; float: right;">
		<div id="contents_title"
			style="border: 1px solid black; width: 100px; height: 100px;"></div>
		<div id="contents_top"
			style="border: 1px solid black; width: 500px; height: 250px; margin-top: 20px;">
		</div>
		<div id="contents_bottom"
			style="border: 1px solid black; width: 500px; height: 200px; margin-top: 20px;"></div>
		</div>
</body>
</html>

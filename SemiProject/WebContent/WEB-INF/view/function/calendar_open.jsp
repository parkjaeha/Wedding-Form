<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body>

	<h1>Calendar Schedule</h1>
	<h1>${year}년${month}월 ${day}일</h1>


	<div class="col-md-8 col-centered" id="ctable"></div>

	<div class="col-md-8 col-centered" id="cadd"></div>


	<button id="btn">확인</button>
	<button id="add">추가</button>


	<script type="text/javascript">



$(function(){

	// basic set
	$.get("./functionCalList.function?id="+${id}, function(data){
		//alert(data);
		var data2 = $("#ctable").html(data);	

	});
	
	// update
	$("#ctable").on("click", ".update",function(){
		
		 $.get("./functionCalAddMove.function", function(data){
			//$("#cadd").css("visibility","visible");
			$("#cadd").html(data);
		});

		 
		 var upd =  $(this).data("value");
		 
			$("#cadd").on("click", "#plus",function(data){
				//alert("plus"+$("#data").val()+"/ "+ );
				 $.get("./functionCalUpdate.function?num="+upd+"&id="+${id}+"&data="+$("#data").val(),function(data){
					
					$("#cadd").css("visibility","hidden");
					
					$.get("./functionCalList.function?id="+${id}, function(data){
						//alert(data);
						var data2 = $("#ctable").html(data);
					});
				});
			});
			
			$("#cadd").on("click", "#minus",function(){
				$("#cadd").css("visibility","hidden");
				
				$.get("./functionCalList.function?id="+${id}, function(data){
					var data2 = $("#ctable").html(data);	
				});
			});
		 
		
		
		/* var upd =  $(this).data("value");
		 $.get("./functionCalUpdate.function?update="+upd+"&id="+${id},function(data){
				
				//alert(data+" "+$(message));
	 			$.get("./functionCalList.function?id="+${id}, function(data){
	 				
	 				//alert(data);
	 				var data2 = $("#ctable").html(data);
	 			});
	 		});  */

		 
	}); 
	
	
	// delete	
 	$("#ctable").on("click", ".delete",function(){
 		
 		
 		//alert($(".minus").data("value")+"/ "+$(this).data("value"));
 		var del =  $(this).data("value");
 		//alert($(this).data("value")+" / " + del);
 		 $.get("./functionCalDelete.function?num="+del,function(data){
			
			//alert(data+" "+$(message));
 			$.get("./functionCalList.function?id="+${id}, function(data){
 				
 		 		
 				//alert(data);
 				var data2 = $("#ctable").html(data);
 			});
 		}); 
	}); 
	
	// close
	$("#btn").click(function(){
		alert("click");
	});
	
	// add
	$("#add").click(function(){
		$.get("./functionCalAddMove.function", function(data){
			$("#cadd").css("visibility","visible");
			$("#cadd").html(data);
		});
		
		$("#cadd").on("click", "#plus",function(data){
			alert("plus"+$("#data").val());
			$.get("./functionCalAddEvent.function?data="+$("#data").val()+"&id="+${id}, function(data){
				
				$("#cadd").css("visibility","hidden");
				
				$.get("./functionCalList.function?id="+${id}, function(data){
					//alert(data);
					var data2 = $("#ctable").html(data);
				});
			});
		});
		
		$("#cadd").on("click", "#minus",function(){
			$("#cadd").css("visibility","hidden");
			
			$.get("./functionCalList.function?id="+${id}, function(data){
				var data2 = $("#ctable").html(data);	
			});
		});
	});
	
	
});

</script>

</body>
</html>
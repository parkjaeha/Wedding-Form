<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

<script type="text/javascript">
	//var result = ""+${result};
	$(function(){
		
		if(${result}.equals("id")){
			console.log("enter id");
			$("#for_id").css("color","yellow");
			$("#for_pass").css("color","black");
			$.get("./commonId.common",function(data){
					$("#result").hide();
					$("#result").innerHtml(data);
					
				});
			
		}else if(result == "pass"){

			console.log("enter pass");
			$("#for_id").css("color","black");
			$("#for_pass").css("color","yellow");
			$.get("./commonPassword.common",function(data){
				$("#result").hide();
				$("#result").innerHtml(data);
				
			});
			
		}else{
			console.log("please select you want type");
		}
	
		
		
		
		$(".for_id").click(function(){
			$("#for_id").css("color","yellow");
			$("#for_pass").css("color","black");
			$.get("./commonId.common",function(data){
				$("#result").hide();
				$("#result").innerHtml(data);
			});
		});
		
	$(".for_pass").click(function(){
		$("#for_id").css("color","black");
		$("#for_pass").css("color","yellow");
			$.get("./commonPassword.common",function(data){
				$("#result").hide();
				$("#result").innerHtml(data);
			});
		});
		
	});
</script>

</head>
<body>

	<div class="row">
		<div id ="for_id" class="col-sm-6">Id</div>
		<div id ="for_pass" class="col-sm-6">Password</div>
	</div>

	<div class="row">
		<div class="col-sm-3">color-3</div>
		<div class="col-sm-6">
			<div id="result">
			
			
		
			</div>
		</div>
		<div class="col-sm-3">color-3</div>	
	</div>

</body>
</html>
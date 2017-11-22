<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			//$("#result").load("ajax_3_result.jsp");
			$.get("ajax_3_result.jsp", function(data){
				
				alert(data);
				var data2 = $("#result").html(data);
			});

		});
		
	
		
		//이벤트 위임
		$("#result").on("click", ".click",function(){
		
			alert("btn2");
		});
		
	});

</script>	
</head>
<body>
	<button id="btn">CLICK</button>
	<div id="result">
	
	</div>


</body>
</html>
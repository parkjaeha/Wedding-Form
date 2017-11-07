<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<h1>${year}년 ${month}월 ${day}일</h1>


<div class="col-md-8 col-centered">
		<table class="table">
		
			<tr>
				<td colspan="12" style="text-align: center;">
					내용
					</td>
					
					<td colspan="1" style="text-align: right; margin-right: 10px;">
					삭제
				</td>
			</tr>
			
			

			<tr>
				<td colspan="12" style="text-align: center;">
					${data}</td>
			<td colspan="1" style="text-align: right; margin-right: 10px;">
			<div id="delete"><a href="#">1</a></div>
					<!-- blank -->
				</td>
			
			</tr>

			

		</table>
	</div>

<button id="btn">확인</button>
<button id="add">추가</button>


<script type="text/javascript">

$(function(){
	$("#btn").click(function(){
		alert("click");
	});
	

	$("#delete").click(function(){
		alert("delete");
		
		$.get("./functionCalendar1.function", function(data){
			
			//alert(data);
			var data2 = $("#kCalendar").html(data);
		});
		
		
	});
	
	$("#add").click(function(){
		alert("add");
		
	});
	
});

</script>

</body>
</html>
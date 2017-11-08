<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	
	<style type="text/css">
		.navbar {
			margin-top: 10px;
			padding: 5px;
			border-top: 1px solid black;
			border-bottom: 0.5px solid lightgray;
		}
		
		.imageBox {
			border: 1px solid lightgray;
			padding: 10px;
		}
		
		.left {
			display: block;
			float: left;
		}
		.table {
			width: %;
		}
		
		td:first-child {
			text-align: left;
		}
		
		td:last-child {
			text-align: right;
		}
	</style>
	
<title>Insert title here</title>
</head>
<body>
	
	<div class="container navbar">
		<h3>${view.hall_name}</h3>
		<span>${view.region}</span>
	</div>
	
	<div class="container imageBox">
		<img class="left" alt="wedding_hall_img" src="../image/hall/wedding_sample.jpg">
		
		<div class="container">
			<div class="container" style="background-color: lightgreen"><h3>기본정보</h3></div>
			<table class=".table">
				<tr>
					<td>홀타입:</td>
					<td><span>${view.type}</span></td>
				</tr>
				
				<tr>
					<td>인근지하철:</td>
					<td><span>${view.subway}</span></td>
				</tr>
				
				<tr>
					<td>식사메뉴: </td>
					<td><span>${view.meal_menu}</span></td>
				</tr>
				
				<tr>
					<td>식사가격:</td>
					<td><span>${view.meal_cost}</span></td>
				</tr>
				
				<tr>
					<td>방문객: </td>
					<td><span>${view.visitor}</span></td>
				</tr>
				
				<tr>
					<td>홀가격: </td>
					<td><span>${view.hall_cost}</span></td>
				</tr>
			</table>
		</div>
	</div>
	
	
</body>
</html>
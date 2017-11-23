<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		var ids = [];
		var names = [];
		var addrs = [];
		var types = [];
		var meal_costs = [];
		var meal_menus = [];
		var visitors = [];
		var hall_costs = [];
		var type = ['일반웨딩', '야외웨딩', '호텔웨딩', '전통혼례'];
		var meal_cost = ['1~2만원', '2~3만원', '3~4만원', '4~5만원', '5~6만원', '6~7만원', '7만원'];
		var meal_menu = ['양식', '한식', '일식', '중식', '뷔페'];
		var visitor = ['50~100명', '100~200명', '200~300명', '300~400명', '400~500명', '500명이상'];
		var hall_cost = ['500000','1500000','2500000','3500000','4500000','5500000','6500000','7500000','8500000','9500000']; 
		
		var random = 0;
		$.ajax({
			url: "./weddinghall.json",
			type: "GET",
			async: false,
			success: function(data){
				for(var i=0; i< data.result.header.paging.totalCount; i++) {
					ids.push("company"+i);
					addrs.push(data.result.body.rows[0].row[i].rdnWhlAddr);
					names.push(data.result.body.rows[0].row[i].bplcNm);
					types.push(type[(Math.floor(Math.random() * 4))]);
					meal_costs.push(meal_cost[(Math.floor(Math.random() * 7))]);
					meal_menus.push(meal_menu[(Math.floor(Math.random() * 5))]);
					visitors.push(visitor[(Math.floor(Math.random() * 6))]);
					hall_costs.push(hall_cost[(Math.floor(Math.random() * 10))])
				}
			}
		});
		
		console.log(ids);
		console.log(addrs);
		console.log(names);
		console.log(types);
		console.log(meal_costs);
		console.log(meal_menus);
		console.log(visitors);
		console.log(hall_costs)
		
		$("#id").val(ids);
		$("#name").val(names);
		$("#addr").val(addrs);
		$("#type").val(types);
		$("#meal_cost").val(meal_costs);
		$("#meal_menu").val(meal_menus);
		$("#visitor").val(visitors);
		$("#hall_cost").val(hall_costs);
	});
	
</script>
</head>
<body>
	<form action="./testExtraInsertProcess.jsp" method="POST">
		<p>ID: <input type="text" name="id" id="id"></p>
		<p>NAME: <input type="text" name="name" id="name"></p>
		<p>ADDR: <input type="text" name="addr" id="addr"></p>
		<p>TYPE: <input type="text" name="type" id="type"></p>
		<p>MEAL_COST: <input type="text" name="meal_cost" id="meal_cost"></p>
		<p>MEAL_MENU: <input type="text" name="meal_menu" id="meal_menu"></p>
		<p>VISITOR: <input type="text" name="visitor" id="visitor"></p>
		<p>HALL_COST: <input type="text" name="hall_cost" id="hall_cost"></p>
		
		<input type="submit" value="제출">
	</form>
</body>
</html>
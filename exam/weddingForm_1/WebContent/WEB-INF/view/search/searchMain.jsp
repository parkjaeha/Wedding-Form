<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	<script type="text/javascript">
		var cur_Page = 1; 
		$(function() {
			$("#result").on("click", ".btn_add", function() {
				cur_Page++;
				$.ajax({
					type: "GET",
					url: "searchAdd.search",
					data: {
						curPage: cur_Page,
						type: "${search.type}",
						region: "${search.region}",
						subway: "${search.subway}",
						meal_cost: "${search.meal_cost}",
						meal_menu: "${search.meal_menu}",
						visitor: "${search.visitor}",
						hall_name: "${search.hall_name}"
					},
					success:function(data) {
						$("#result").html(data);
					}
				});
			});
			
			$("#btn").click(function() {
				var checkType = [];
				$("input:checkbox[name='type']:checked").each(function(index) {
					checkType.push($(this).val());
				});
				
				var checkCost = [];
				$("input:checkbox[name='meal_cost']:checked").each(function(index) {
					checkCost.push($(this).val());
				});
				
				var checkMenu = [];
				$("input:checkbox[name='meal_menu']:checked").each(function(index) {
					checkMenu.push($(this).val());
				});
				
				var checkVisitor = [];
				$("input:checkbox[name='visitor']:checked").each(function(index) {
					checkVisitor.push($(this).val());
				});
				
				var region = $("#region01").val() +" "+ $("#region02").val();
				var subway = $("#subway01").val() +" "+ $("#subway02").val();
				var hall_name = $("#hall_name").val();
				
				var allData = { "type": checkType, "meal_cost": checkCost,
								"meal_menu": checkMenu, "visitor": checkVisitor,
								"hall_name": hall_name, "region": region, "subway": subway };
				
				$.ajax({
					type: "GET",
					url: "./searchTable.search",
					data : allData,
					success:function(data) {
						$("#result").html(data);
					}
				});
			}); // End #btn
		});
	</script>
	
	<style type="text/css">
		.card {
			display: inline-block;
			width: 350px;
			text-align: center;
		}
	</style>
	
<title>Insert title here</title>
</head>
<body>
	<form action="">
		<div class="container">
			<table class="table">
				<!-- 웨딩홀 지역 -->
				<tr>
					<td>웨딩홀 지역</td>
					<td>
						<select id="region01" name="region01">
							<option value="">시도</option>
							<option value="region">REGION</option>
						</select>
						
						<select id="region02" name="regtion02">
							<option value="">시군구</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
						</select>
					</td>
				</tr>
				
				<!-- 지하철 노선 -->
				<tr>
					<td>지하철 노선</td>
					<td>
						<select id="subway01" name="subway01">
							<option value="">지하철</option>
							<option value="subway">SUBWAY</option>
						</select>
						
						<select id="subway02" name="subway02">
							<option value="">역선택</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
						</select>
					</td>
				</tr>
				
				<!-- 웨딩홀 타입 -->
				<tr>
					<td>웨딩홀 타입</td>
					<td>
						<input type="checkbox" name="type" id="type" value="All"><label for="type">전체</label>
						<input type="checkbox" name="type" id="type01" value="일반웨딩홀"><label for="type01">일반웨딩홀</label>
						<input type="checkbox" name="type" id="type02" value="야외웨딩홀"><label for="type02">야외웨딩홀</label>
						<input type="checkbox" name="type" id="type03" value="전통웨딩홀"><label for="type03">전통웨딩홀</label>
						<input type="checkbox" name="type" id="type04" value="호텔웨딩홀"><label for="type04">호텔웨딩홀</label>
						<input type="checkbox" name="type" id="type05" value="공공기관"><label for="type05">공공기관</label>
					</td>
				</tr>
				
				<!-- 식사 가격 -->
				<tr>
					<td>식사가격</td>
					<td>
						<input type="checkbox" name="meal_cost" id="meal_cost" value="All"><label for="meal_cost">전체</label>
						<input type="checkbox" name="meal_cost" id="meal_cost01" value="1~2만원"><label for="meal_cost01">1~2만원</label>
						<input type="checkbox" name="meal_cost" id="meal_cost02" value="2~3만원"><label for="meal_cost02">2~3만원</label>
						<input type="checkbox" name="meal_cost" id="meal_cost03" value="3~4만원"><label for="meal_cost03">3~4만원</label>
						<input type="checkbox" name="meal_cost" id="meal_cost04" value="4~5만원"><label for="meal_cost04">4~5만원</label>
						<input type="checkbox" name="meal_cost" id="meal_cost05" value="5~6만원"><label for="meal_cost05">5~6만원</label>
						<input type="checkbox" name="meal_cost" id="meal_cost06" value="6~7만원"><label for="meal_cost06">6~7만원</label>
						<input type="checkbox" name="meal_cost" id="meal_cost07" value="7만원이상"><label for="meal_cost07">7만원이상</label>
					</td>
				</tr>
				
				<!-- 식사 메뉴 -->
				<tr>
					<td>식사메뉴</td>
					<td>
						<input type="checkbox" name="meal_menu" id="meal_menu" value="All"><label for="meal_menu">전체</label>
						<input type="checkbox" name="meal_menu" id="meal_menu01" value="양식"><label for="meal_menu01">양식</label>
						<input type="checkbox" name="meal_menu" id="meal_menu02" value="한식"><label for="meal_menu02">한식</label>
						<input type="checkbox" name="meal_menu" id="meal_menu03" value="일식"><label for="meal_menu03">일식</label>
						<input type="checkbox" name="meal_menu" id="meal_menu04" value="중식"><label for="meal_menu04">중식</label>
						<input type="checkbox" name="meal_menu" id="meal_menu05" value="뷔페"><label for="meal_menu05">뷔페</label>
					</td>
				</tr>
				
				<!-- 하객수 -->
				<tr>
					<td>하객수</td>
					<td>
						<input type="checkbox" name="visitor" id="visitor" value="All"><label for="visitor">전체</label>
						<input type="checkbox" name="visitor" id="visitor01" value="50~100명"><label for="visitor01">50~100명</label>
						<input type="checkbox" name="visitor" id="visitor02" value="100~200명"><label for="visitor02">100~200명</label>
						<input type="checkbox" name="visitor" id="visitor03" value="200~300명"><label for="visitor03">200~300명</label>
						<input type="checkbox" name="visitor" id="visitor04" value="300~400명"><label for="visitor04">300~400명</label>
						<input type="checkbox" name="visitor" id="visitor05" value="400~500명"><label for="visitor05">400~500명</label>
						<input type="checkbox" name="visitor" id="visitor06" value="500명이상"><label for="visitor06">500명이상</label>
					</td>
				</tr>
				
				<tr>
					<td>웨딩홀명</td>
					<td><input type="text" name="hall_name" id="hall_name"></td>
				</tr>
			</table>
		</div>
	</form>
	
	<div class="container" style="text-align: center">
		<input type="button" id="btn" class="btn btn-primary" value="위 조건으로 검색하기">
	</div>
	
	<br>
	
	<div id="result">
		<div class="container">
			<c:forEach items="${list}" var="dto">
				<div class="card">
					<img class="card-img-top" src="../image/hall/wedding_main.jpg" alt="Card image" style="width:100%">
				    <div class="card-body">
				    	<p class="card-text addr">${dto.region} / ${dto.type}</p>
				    	<h4 class="card-title name">${list[0].hall_name}</h4>
				    	<div class="info">
					     	<p style="line-height: 5px;">홀 사용료 : ${dto.hall_cost}</p>
							<p style="line-height: 5px;">하객수 : ${dto.visitor}</p>
							<p style="line-height: 5px;">인근 지하철 : ${dto.subway}</p>
							<p style="line-height: 5px;">식사종류 : ${dto.meal_menu}</p>
							<p style="line-height: 5px;">식사가격 : ${dto.meal_cost}</p>
				    	</div>
				      	<a href="#" class="btn btn-primary">See Profile</a>
				    </div>
				</div>
			</c:forEach>
		</div>
		
		<div class="container" style="text-align: center;">
			<button id="btn_add" class="btn btn_add">더보기</button>
		</div>
	</div>
	
	
</body>
</html>
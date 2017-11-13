<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	var cur_Page = 1;
	$(function() {
		$(".watch-type").click(function() {
			changeType($(this));
			
			var allData = data();
			$.ajax({
				type : "GET",
				url : "./searchTable.search",
				data : allData,
				success : function(data) {
					$("#result").html(data);
				}
			});
		});
		
		$("#perNumber").change(function() {
			var allData = data();
			$.ajax({
				type : "GET",
				url : "./searchAdd.search",
				data : allData,
				success : function(data) {
					$("#result").html(data);
				}
			});
		});
		
		$(".sort").click(function() {
			var allData = data();
			$.ajax({
				type : "GET",
				url : "./searchAdd.search",
				data : allData,
				success : function(data) {
					$("#result").html(data);
				}
			});
		});
		
		
		$("#result").on("click", ".btn_add", function() {
			cur_Page++;
			var allData = data();
			$.ajax({
				type : "GET",
				url : "./searchAdd.search",
				data : allData,
				success : function(data) {
					$("#result").html(data);
				}
			});
		});

		$("#btn").click(function() {
			cur_Page = 1;
			var allData = data();
			$.ajax({
				type : "GET",
				url : "./searchTable.search",
				data : allData,
				success : function(data) {
					$("#result").html(data);
				}
			});
		}); // End #btn

		// 시도 군구
		var area0 = [ "서울특별시", "인천광역시", "대전광역시", "광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주도" ];
		var area1 = [ "군/구", "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ];
		var area2 = [ "군/구", "계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군" ];
		var area3 = [ "군/구", "대덕구", "동구", "서구", "유성구", "중구" ];
		var area4 = [ "군/구", "광산구", "남구", "동구", "북구", "서구" ];
		var area5 = [ "군/구", "남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군" ];
		var area6 = [ "군/구", "남구", "동구", "북구", "중구", "울주군" ];
		var area7 = [ "군/구", "강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군" ];
		var area8 = [ "군/구", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군" ];
		var area9 = [ "군/구", "강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군" ];
		var area10 = [ "군/구", "제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군" ];
		var area11 = [ "군/구", "계룡시", "공주시", "논산시", "보령시", "서산시", "아산시", "천안시", "금산군", "당진군", "부여군", "서천군", "연기군", "예산군", "청양군", "태안군", "홍성군" ];
		var area12 = [ "군/구", "군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군" ];
		var area13 = [ "군/구", "광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군" ];
		var area14 = [ "군/구", "경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군" ];
		var area15 = [ "군/구", "거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군" ];
		var area16 = [ "군/구", "서귀포시", "제주시", "남제주군", "북제주군" ];

		// 시/도 선택 박스 초기화
		$("select[name^=sido]").each(function() {
			$selsido = $(this);
			$.each(eval(area0), function() {
				$selsido.append("<option value='" + this + "'>" + this + "</option>");
			});
		});

		// 시/도 선택시 군/구 설정
		$("select[name^=sido]").change(function() {
			var area = "area" + $("option", $(this)).index($("option:selected", $(this))); // 선택지역의 구군 Array
			var $gugun = $(this).next(); // 선택영역 군구 객체
			$("option", $gugun).remove(); // 구군 초기화
			if (area == "area0")
				$gugun.append("<option value=' '>군/구</option>");else {
				$.each(eval(area), function() {
					if(this == '군/구') {
						$gugun.append("<option value=' '>" + this + "</option>");
					} else {
						$gugun.append("<option value='" + this + "'>" + this + "</option>");
					}
				});
			}
		});
		
		// 지하철
		var subway0 = [ "1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선", "9호선", "경부선", "경의선", "경원선", "장안선", "경축선", "중앙선", "경인선", "안산선", "과천선", "분당선", "일산선", "공항철도선", "인천1호선", "분당선", "신분당선"];
		
		$("select[name=subway01]").each(function() {
			$selssub = $(this);
			$.each(eval(subway0), function() {
				$selssub.append("<option value='" + this + "'>" + this + "</option>");
			});
		});
		
		$("#subway01").change(function() {
			$("#subway02 option").remove();
			$("#subway02").append("<option value=' '>역선택</option>");
			var index = 0;
			$.ajax({
				url: "../json/subway.json",
				type: "GET",
				success: function(data) {
					while(data[index] != null) {
						if($("#subway01").val().trim() == data[index].line.trim()) {
							$("#subway02").append("<option value='"+data[index].subway+"'>"+data[index].subway+"</option>");
						}
						index++;
					}
				}
			});
		});
	});
	
	function changeType(title) {
		if(title.attr("title") == "grid") {
			document.getElementById("img_grid").setAttribute("class", "nav-link watch-type watch active");
			document.getElementById("img_list").setAttribute("class", "nav-link watch-type")
		} else {
			document.getElementById("img_grid").setAttribute("class", "nav-link watch-type");
			document.getElementById("img_list").setAttribute("class", "nav-link watch-type watch active")
		}
	}
	
	function changeActive(index) {
		var len = document.getElementsByClassName("sort").length;
		for(var i=0; i<len; i++) {
			if(i == index-1) {
				document.getElementById("sort"+(i+1)).setAttribute("class", "nav-link active");
			} else {
				document.getElementById("sort"+(i+1)).setAttribute("class", "nav-link");
			}
		}
	}
	
	////////////////////////////데이터///////////////////////////////////////////////////
	function data() {
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

		var region = $("#sido1").val() + " " + $("#gungu1").val();
		var subway = $("#subway01").val() + " " + $("#subway02").val();
		var hall_name = $("#hall_name").val();
		var active = $(".active").attr("title");
		
		var perNumber = $("#perNumber").val();
		
		var watch_type = $(".watch").attr("title");

		var allData = {
			"type" : checkType,
			"meal_cost" : checkCost,
			"meal_menu" : checkMenu,
			"visitor" : checkVisitor,
			"hall_name" : hall_name,
			"region" : region,
			"subway" : subway,
			"sort" : active,
			"curPage" : cur_Page,
			"perNumber" : perNumber,
			"watch_type" : watch_type
		};
		
		return allData;
	}
</script>

<style type="text/css">
.card {
	display: inline-block;
	width: 300px;
	margin: 0 30px 15px	30px;
	text-align: center;
}

.position {
	position: relative;
}

.positionRight {
	position: absolute;
	top:0;
	right: 0;
}

</style>

<style>
	/* The Modal (background) */
	.modal {
	    display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Sit on top */
	    padding-top: 100px; /* Location of the box */
	    left: 0;
	    top: 0;
	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    overflow: auto; /* Enable scroll if needed */
	    background-color: rgb(0,0,0); /* Fallback color */
	    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content */
	.modal-content {
	    background-color: #fefefe;
	    margin: auto;
	    padding: 20px;
	    border: 1px solid #888;
	    width: 80%;
	}
	
	/* The Close Button */
	.close {
	    color: #aaaaaa;
	    float: right;
	    font-size: 28px;
	    font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	    color: #000;
	    text-decoration: none;
	    cursor: pointer;
	}
	</style>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<table class="table">
			<!-- 웨딩홀 지역 -->
			<tr>
				<td>웨딩홀 지역</td>
				<td>
					<select name="sido1" id="sido1">
						<option value=" ">시/도</option>
					</select>
					<select name="gungu1" id="gungu1">
						<option value=" ">군/구</option>
					</select>
				</td>
			</tr>

			<!-- 지하철 노선 -->
			<tr>
				<td>지하철 노선</td>
				<td>
					<select id="subway01" name="subway01">
						<option value=" ">지하철</option>
					</select> 
					<select id="subway02" name="subway02">
						<option value=" ">역선택</option>
					</select>
				</td>
			</tr>

			<!-- 웨딩홀 타입 -->
			<tr>
				<td>웨딩홀 타입</td>
				<td>
					<input type="checkbox" name="type" id="type" value="All">
					<label for="type">전체</label> 
					<input type="checkbox" name="type" id="type01" value="일반웨딩홀">
					<label for="type01">일반웨딩홀</label>
					<input type="checkbox" name="type" id="type02" value="야외웨딩홀">
					<label for="type02">야외웨딩홀</label> 
					<input type="checkbox" name="type" id="type03" value="전통웨딩홀">
					<label for="type03">전통웨딩홀</label>
					<input type="checkbox" name="type" id="type04" value="호텔웨딩홀">
					<label for="type04">호텔웨딩홀</label> 
					<input type="checkbox" name="type" id="type05" value="공공기관"><label for="type05">공공기관</label>
				</td>
			</tr>

			<!-- 식사 가격 -->
			<tr>
				<td>식사가격</td>
				<td>
				<input type="checkbox" name="meal_cost" id="meal_cost" value="All">
				<label for="meal_cost">전체</label> 
				<input type="checkbox" name="meal_cost" id="meal_cost01" value="1~2만원">
				<label for="meal_cost01">1~2만원</label> 
				<input type="checkbox" name="meal_cost" id="meal_cost02" value="2~3만원">
				<label for="meal_cost02">2~3만원</label> 
				<input type="checkbox" name="meal_cost" id="meal_cost03" value="3~4만원">
				<label for="meal_cost03">3~4만원</label> 
				<input type="checkbox" name="meal_cost" id="meal_cost04" value="4~5만원">
				<label for="meal_cost04">4~5만원</label> 
				<input type="checkbox" name="meal_cost" id="meal_cost05" value="5~6만원">
				<label for="meal_cost05">5~6만원</label> 
				<input type="checkbox" name="meal_cost" id="meal_cost06" value="6~7만원">
				<label for="meal_cost06">6~7만원</label> 
				<input type="checkbox" name="meal_cost" id="meal_cost07" value="7만원이상">
				<label for="meal_cost07">7만원이상</label></td>
			</tr>

			<!-- 식사 메뉴 -->
			<tr>
				<td>식사메뉴</td>
				<td><input type="checkbox" name="meal_menu" id="meal_menu"
					value="All"><label for="meal_menu">전체</label> <input
					type="checkbox" name="meal_menu" id="meal_menu01" value="양식"><label
					for="meal_menu01">양식</label> <input type="checkbox"
					name="meal_menu" id="meal_menu02" value="한식"><label
					for="meal_menu02">한식</label> <input type="checkbox"
					name="meal_menu" id="meal_menu03" value="일식"><label
					for="meal_menu03">일식</label> <input type="checkbox"
					name="meal_menu" id="meal_menu04" value="중식"><label
					for="meal_menu04">중식</label> <input type="checkbox"
					name="meal_menu" id="meal_menu05" value="뷔페"><label
					for="meal_menu05">뷔페</label></td>
			</tr>

			<!-- 하객수 -->
			<tr>
				<td>하객수</td>
				<td><input type="checkbox" name="visitor" id="visitor"
					value="All"><label for="visitor">전체</label> <input
					type="checkbox" name="visitor" id="visitor01" value="50~100명"><label
					for="visitor01">50~100명</label> <input type="checkbox"
					name="visitor" id="visitor02" value="100~200명"><label
					for="visitor02">100~200명</label> <input type="checkbox"
					name="visitor" id="visitor03" value="200~300명"><label
					for="visitor03">200~300명</label> <input type="checkbox"
					name="visitor" id="visitor04" value="300~400명"><label
					for="visitor04">300~400명</label> <input type="checkbox"
					name="visitor" id="visitor05" value="400~500명"><label
					for="visitor05">400~500명</label> <input type="checkbox"
					name="visitor" id="visitor06" value="500명이상"><label
					for="visitor06">500명이상</label></td>
			</tr>

			<tr>
				<td><label for="hall_name">웨딩홀명</label></td>
				<td><input type="text" name="hall_name" id="hall_name" value=""></td>
			</tr>
		</table>
	</div>

	<div class="container" style="text-align: center">
		<input type="button" id="btn" class="btn btn-primary"
			value="위 조건으로 검색하기">
	</div>

	<br>
	<div class="container position">
		<ul class="nav nav-tabs ul-size">
		    <li class="nav-item sort">
		      <a class="nav-link active" id="sort1" title="hall_name asc" onclick="changeActive(1)">가나다순</a>
		    </li>
		    <li class="nav-item sort">
		      <a class="nav-link" id="sort2" title="meal_cost asc" onclick="changeActive(2)">낮은 식대순</a>
		    </li>
		    <li class="nav-item sort">
		      <a class="nav-link" id="sort3" title="meal_cost desc" onclick="changeActive(3)">높은 식대순</a>
		    </li>
		</ul>
		
		<div class="positionRight">
			<ul class="nav nav-pills">
				<li class="nav-item"><a class="nav-link">비교하기</a></li>
				<li class="nav-item">
					<a id="img_grid" class="nav-link watch-type watch active" title="grid">그리드</a>
				</li>
				<li class="nav-item">	
					<a id="img_list" class="nav-link watch-type" title="list">리스트</a>
				</li>
				<li>
					<select id="perNumber">
						<option value="6">6개보기</option>
						<option value="9">9개보기</option>
						<option value="12">12개보기</option>
					</select>
				</li>
			</ul>
			
			<script type="text/javascript">
			
			</script>
		</div>
		
	</div>
	
	<br>

	<div id="result">
		<div class="container">
			<c:forEach items="${list}" var="dto">
				<div class="card">
					<img class="card-img-top" src="../image/hall/wedding_main.jpg"
						alt="Card image" style="width: 100%">
					<div class="card-body">
						<p class="card-text addr">${dto.region}/ ${dto.type}</p>
						<h4 class="card-title name">${list[0].hall_name}</h4>
						<div class="info">
							<p style="line-height: 5px;">홀 사용료 : ${dto.hall_cost}</p>
							<p style="line-height: 5px;">하객수 : ${dto.visitor}</p>
							<p style="line-height: 5px;">인근 지하철 : ${dto.subway}</p>
							<p style="line-height: 5px;">식사종류 : ${dto.meal_menu}</p>
							<p style="line-height: 5px;">식사가격 : ${dto.meal_cost}</p>
						</div>
						<a href="./searchView.search?id=${dto.id}" class="btn btn-primary">See Profile</a> 
					</div>
				</div>
			</c:forEach>
		</div>

		<c:if test="${curPage != total}">
			<div class="container" style="text-align: center;">
				<button id="btn_add" class="btn btn_add">더보기</button>
			</div>
		</c:if>
	</div>


</body>
</html>
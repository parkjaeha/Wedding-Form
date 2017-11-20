<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: Arial;
	font-size: 14px;
}

a {
	text-decoration: none;
	color: #2096BA;
}

a:visited, a:link {
	color: #2096BA;
}

#map-container {
	width: 100%;
}

#map {
	width: 80%;
	height: 800px;
	float: left;
}

#panel {
	float: left;
	width: 20%;
	height: 800px;
	overflow: auto;
}

#markerlist {
	height: 400px;
	margin: 10px 5px 0 10px;
}

#searchInput {
	  background-image: url('../image/common/searchicon.gif');
	  background-position: 10px 12px;
	  background-repeat: no-repeat;
	  width: 75%;
	  font-size: 16px;
	  padding: 12px 20px 12px 40px;
	  border: 1px solid #ddd;
	  margin-bottom: 12px;
}

#myUL {
	  list-style-type: none;
	  padding: 0;
	  margin: 0;
	}
	
#myUL li a {
	  border: 1px solid #ddd;
	  margin-top: -1px; /* Prevent double borders */
	  padding: 12px;
	  text-decoration: none;
	  font-size: 18px;
	  color: black;
	  display: block
}

#myUL li a:hover:not(.header) {
	background-color: #eee;
}
.title {
	text-align: center;
}

/* .hide {
	display: none;
} */

.btn {
	display: inline-block;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    border: 1px solid transparent;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: .25rem;
}
</style>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOUu60DDyAcyY5lpmQY1go7BuBibCGqhI&callback=weddingMap.init"></script>
<script type="text/javascript" src="../src/markerclusterer.js"></script>
<script src="../json/data.json"></script>
<script src="../js/weddingMap.js"></script>

<script>
      google.maps.event.addDomListener(window, 'load', weddingMap.init);
</script>

<script type="text/javascript">
	/* $(function() {
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
	}); */

	function searchFunction() {
	    var input, filter, ul, li, a, i;
	    input = document.getElementById("searchInput");
	    filter = input.value.toUpperCase();
	    ul = document.getElementById("myUL");
	    li = ul.getElementsByTagName("li");
	    console.log("li.length: " + li.length);
	    for (i = 0; i < li.length; i++) {
	        a = li[i].getElementsByTagName("a")[0];
	        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
	            li[i].style.display = "";
	        } else {
	            li[i].style.display = "none";
	
	        }
	    }
	}
	
	function searchRegion() {
		var sido, gungu, filter, table, tr, td, i;
		
		sido = document.getElementById("sido");
		gungu = document.getElementById("gungu");
		filter = (sido.value + " " + gungu.value).toUpperCase().trim();
		table = document.getElementById("weddingTable");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[0];
		    if (td) {
		      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
		        tr[i].style.display = "";
		      } else {
		        tr[i].style.display = "none";
		      }
		    }       
		  }
	}

</script>

</head>
<body>
	<div class="container">
		<input type="text" id="searchInput" onkeyup="searchFunction()" placeholder="웨딩홀 이름을 입력해주세요">
		<i class="fa fa-angle-right" style="font-size:24px"></i>
		<a class="btn btn-info" href="./searchMain.search">상세 검색</a>
	</div>

	<div id="map-container">
		<div id="map"></div>
		
		<div id="panel">
			<h3 class="title">Wedding Hall List</h3>
			
			<select name="sido" id="sido">
				<option value=" ">시/도</option>
			</select>
			<select name="gungu" id="gungu" onchange="searchRegion()">
				<option value=" ">군/구</option>
			</select>
			
			<ul id="myUL"></ul>
		</div>
	</div>
	
</body>
</html>
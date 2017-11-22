<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--Load the AJAX API-->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    	
    	$(function() {
			// Load the Visualization API and the corechart package.
		    google.charts.load('current', {'packages':['corechart']});
		
		    // Set a callback to run when the Google Visualization API is loaded.
		    google.charts.setOnLoadCallback(drawChartCombo);
		    google.charts.setOnLoadCallback(drawChartAvg);
		    
		    $("#region").change(drawChartCombo);
    		
    	});
    	
    	function drawChartAvg() {
	    	var selector = $("#region").val();
	    	
    	  	// 해당 지역 월별로 보기
    	  	$.ajax({
				type: "GET",
				url: "./sample.json",
				success:function(result){
					var avg = new Array(12);
					
					for(var i = 0; i < result.length; i++) {
						avg[i] = 0;
						avg[i] = avg[i] + result[i].sixteen_1 + result[i].sixteen_2 + result[i].sixteen_3
						+ result[i].sixteen_4 + result[i].sixteen_5 + result[i].sixteen_6 + result[i].sixteen_7
						+ result[i].sixteen_8 + result[i].sixteen_9 + result[i].sixteen_10 + result[i].sixteen_11
						+ result[i].sixteen_11 + result[i].sixteen_12;
					}
					
					// Create the data table.
			        var data = new google.visualization.DataTable();
			        data.addColumn('string', '전국');
			        data.addColumn('number', '혼인건수');
					for(var i=1; i<result.length; i++) {
						data.addRows([[result[i].region, avg[i]]]);
					}
					
					
					// Set chart options
					var options = {'width':1000,
					               'height':600};
					
					// Instantiate and draw our chart, passing in some options.
					var chart = new google.visualization.PieChart(document.getElementById('chart_div1'));
					chart.draw(data, options);
				}
 	  		});
    	}
		
    	
	    function drawChartCombo() {
	    	var selector = $("#region").val();
	    	
    	  	// 해당 지역 월별로 보기
    	  	$.ajax({
				type: "GET",
				url: "./sample.json",
				success:function(result){
					var avg = new Array(12);
					var month = 0;
					while(month != 13){
						month++;
						switch(month){
						case 1:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_1;
							}
							break;
						case 2:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_2;
							}
							break;
						case 3:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_3;
							}
							break;
						case 4:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_4;
							}
							break;
						case 5:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_5;
							}
							break;
						case 6:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_6;
							}
							break;
						case 7:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_7;
							}
							break;
						case 8:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_8;
							}
							break;
						case 9:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_9;
							}
							break;
						case 10:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_10;
							}
							break;
						case 11:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_11;
							}
							break;
						case 12:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_12;
							}
							break;
						}
						
					} // END while
						
					// Create the data table.
					var data = new google.visualization.DataTable();
					data.addColumn('string', '날짜');
					data.addColumn('number', result[selector].region);
					data.addColumn('number', '평균');
					data.addRows([
					  ['01월', result[selector].sixteen_1, avg[0]/result.length],
					  ['02월', result[selector].sixteen_2, avg[1]/result.length],
					  ['03월', result[selector].sixteen_3, avg[2]/result.length],
					  ['04월', result[selector].sixteen_4, avg[3]/result.length],
					  ['05월', result[selector].sixteen_5, avg[4]/result.length],
					  ['06월', result[selector].sixteen_6, avg[5]/result.length],
					  ['07월', result[selector].sixteen_7, avg[6]/result.length],
					  ['08월', result[selector].sixteen_8, avg[7]/result.length],
					  ['09월', result[selector].sixteen_9, avg[8]/result.length],
					  ['10월', result[selector].sixteen_10, avg[9]/result.length],
					  ['11월', result[selector].sixteen_11, avg[10]/result.length],
					  ['12월', result[selector].sixteen_12, avg[11]/result.length]
					]);
					
					/* for(var i=0; i<4; i++) {
						data.addRows([['전국', 3+i, 1+i]]);
					} */
					
					
					// Set chart options
					var options = {
					      vAxis: {title: '혼인 건수'},
					      hAxis: {title: '월별'},
					      width : 1000,
					      height : 600,
					      seriesType: 'bars',
					      series: {1: {type: 'line'}}
					   };
					
					// Instantiate and draw our chart, passing in some options.
					var chart = new google.visualization.ComboChart(document.getElementById('chart_div2'));
					chart.draw(data, options);
				}
			});
      	}

	</script>


<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Lato", sans-serif;
}

body, html {
	height: 100%;
	color: #777;
	line-height: 1.8;
}

/* Create a Parallax Effect */
.bgimg-1, .bgimg-2, .bgimg-3 {
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.bgimg-4 {
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

/* First image (Logo. Full height) */
.bgimg-1 {
	background-image: url('./images/cover/wedding01.jpg');
	min-height: 100%;
}

/* Second image (Portfolio) */
.bgimg-2 {
	background-image: url("./images/cover/wedding_2.jpg");
	min-height: 400px;
}

/* Third image (Contact) */
.bgimg-3 {
	background-image: url("./images/cover/wedding_2.jpg");
	min-height: 400px;
}

.w3-wide {
	letter-spacing: 10px;
}

.w3-hover-opacity {
	cursor: pointer;
}

/* Turn off parallax scrolling for tablets and phones */
@media only screen and (max-device-width: 1024px) {
	.bgimg-1, .bgimg-2, .bgimg-3 {
		background-attachment: scroll;
	}
}
</style>
<title>Insert title here</title>
</head>
<body>

	<!-- Navbar (sit on top) -->
	<div class="w3-top">
		<div class="w3-bar" id="myNavbar">
			<a class="w3-bar-item w3-button w3-hover-black w3-hide-medium w3-hide-large w3-right" href="javascript:void(0);" onclick="toggleFunction()" title="Toggle Navigation Menu"></a> 
			<a href="#home" class="w3-bar-item w3-button">HOME</a> 
			<a href="#about" class="w3-bar-item w3-button w3-hide-small">ABOUT</a> 
			<a href="#portfolio" class="w3-bar-item w3-button w3-hide-small">CHART</a>
		</div>

		<!-- Navbar on small screens -->
		<div id="navDemo"
			class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium">
			<a href="#about" class="w3-bar-item w3-button"
				onclick="toggleFunction()">ABOUT</a> <a href="#portfolio"
				class="w3-bar-item w3-button" onclick="toggleFunction()">PORTFOLIO</a>
			<a href="#contact" class="w3-bar-item w3-button"
				onclick="toggleFunction()">CONTACT</a>
		</div>
	</div>

	<!-- First Parallax Image with Logo Text -->
	<div class="bgimg-1 w3-display-container w3-opacity-min" id="home">
		<div class="w3-display-middle" style="white-space: nowrap;">
			<a href="${pageContext.request.contextPath}/main.jsp" class="w3-button w3-hover-black">
			<span class="w3-center w3-padding-large w3-black w3-xlarge w3-wide w3-animate-opacity">WEDDINF
					FORM</span>
			</a>
		</div>
	</div>

	<!-- Container (About Section) -->
	<div class="w3-content w3-container w3-padding-64" id="about">
		<h3 class="w3-center">모바일 청첩장</h3>
		<p class="w3-center">
			<em>누구나, 언젠든지, 손쉽게</em>
		</p>
		<p>디자인 고민 없이 내용을 입력하고 사진과 동영상을 업데이트하면 바로 결과물을 확인할 수 있습니다. 또한 수정
			요청을 기다릴 필요 없이 원하실 때 언제든지 수정이 가능합니다. 모바일 청첩장을 반응형으로 만들었기 때문에 PC, 테블릿,
			모바일 어떤 기기에서도 자동으로 화면에 맞춰 보여집니다.</p>
		
		<div class="w3-row">
			<img class="w3-center w3-col m12" src="./images/cover/mobileInfo.jpg">
		</div>

		<h3 class="w3-center">웨딩홀 검색</h3>
		<p class="w3-center">
			<em>한 눈에, 비교를</em>
		</p>
		<div class="w3-row">
			<div class="w3-col m6 w3-center w3-padding-large">
				<img src="./images/cover/hall_2.jpg"
					class="w3-round w3-image w3-opacity w3-hover-opacity-off"
					alt="Photo of Me" width="500" height="333">
			</div>

			<div class="w3-col m6 w3-padding-large">
				<p style="font-size: 17px;">
					여러 웨딩홀 싸이트를 둘러보지 않고 자신에게 맞는 조건으로 검색을 할 수 있어 편리하고, 지도로
					통해 위치를 시각적으로 상세히 볼 수 있는 점이 WeddingForm의 장점입니다. 그리고 무수히 많은 웨딩홀의 정보들을
					비교하여 조금 더 합리적인 결정을 할 수 있도록 도와주고 있습니다.</p>
			</div>
		</div>
	</div>
	
	<br><br><br><br>

	<!-- Second Parallax Image with Portfolio Text -->
	<div class="bgimg-2 w3-display-container w3-opacity-min">
		<div class="w3-display-middle">
			<span class="w3-xxlarge w3-text-white w3-wide">WEDDING CHART</span>
		</div>
	</div>

	<!-- Container (Portfolio Section) -->
	<div class="w3-content w3-container w3-padding-64" id="portfolio">
		<p class="w3-wide">지역별 혼인 건수</p>
		<div id="chart_div1" style="width: 1000px; margin: 0 auto;"></div>
		<p class="w3-wide">2016년 지역별 혼인 건수</p>
		<div class="w3-large w3-right w3-padding-16"></div>
		<select id="region">
			<option value="1">서울특별시</option>
			<option value="2">부산광역시</option>
			<option value="3">대구광역시</option>
			<option value="4">인천광역시</option>
			<option value="5">광주광역시</option>
			<option value="6">대전광역시</option>
			<option value="7">울산광역시</option>
			<option value="8">세종특별자치시</option>
			<option value="9">경기도</option>
			<option value="10">강원도</option>
			<option value="11">충정북도</option>
			<option value="12">충정남도</option>
			<option value="13">전라북도</option>
			<option value="14">전라남도</option>
			<option value="15">경상북도</option>
			<option value="16">경상남도</option>
			<option value="17">제주특별자치도</option>
			<option value="18">국외</option>
		</select>
		<div id="chart_div2"></div>
	</div>

	<!-- Third Parallax Image with Portfolio Text -->
	<div class="bgimg-3 w3-display-container w3-opacity-min">
	</div>



	<script>

// Change style of navbar on scroll
window.onscroll = function() {myFunction()};
function myFunction() {
    var navbar = document.getElementById("myNavbar");
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        navbar.className = "w3-bar" + " w3-card" + " w3-animate-top" + " w3-white";
    } else {
        navbar.className = navbar.className.replace(" w3-card w3-animate-top w3-white", "");
    }
}

// Used to toggle the menu on small screens when clicking on the menu button
function toggleFunction() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else {
        x.className = x.className.replace(" w3-show", "");
    }
}
</script>
	<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* var latitude;
		var longitude;
		$.ajax({
			type: "GET",
			url: "https://maps.googleapis.com/maps/api/geocode/json?address="+"서울특별시 강남구 신사동 613-5 캐롤라인타워 b1하우스본 오스티엄"+"&key=AIzaSyAOUu60DDyAcyY5lpmQY1go7BuBibCGqhI",
			async: false,
			success: function(data) {
				console.log(data.results[0].geometry.location);
				latitude = data.results[0].geometry.location.lat;
				longitude = data.results[0].geometry.location.lng;
			}
		});
		console.log("lat: " + latitude);
		console.log("lng: " + longitude);
		
		$("#lat").val(latitude);
		$("#lng").val(longitude); */
	}); //End onload
	
	function getLatLng() {
		var latitude;
		var longitude;
		var address = $("#addr").val();
		$.ajax({
			type: "GET",
			url: "https://maps.googleapis.com/maps/api/geocode/json?address="+address+"&key=AIzaSyAOUu60DDyAcyY5lpmQY1go7BuBibCGqhI",
			async: false,
			success: function(data) {
				console.log(data.results[0].geometry.location);
				latitude = data.results[0].geometry.location.lat;
				longitude = data.results[0].geometry.location.lng;
			},
			error:function(request,status,error){
			    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("주소를 정확하게 입력해주세요.");
			}
		});
		
		$("#lat").val(latitude);
		$("#lng").val(longitude);
	}
</script>
</head>
<body>




	<form action="./companyInsert.company" method="post">
		<p>ID: <input type="text" name="id"></p>
		<p>웨딩이름: <input type="text" name="company_name"></p>
		<p>웨딩전화번호<input type="tel" name="company_tel"></p>
		<p>웨딩주소: <input id="addr" type="text" name="company_addr" onchange="getLatLng()"></p>
		<p>사업자번호: <input type="text" name="company_number"></p>
		<p><input type="text" name="latitude" id="lat"></p>
		<p><input type="text" name="longitude" id="lng"></p>
		<input type="submit" value="JOIN">
	</form>
</body>
</html>
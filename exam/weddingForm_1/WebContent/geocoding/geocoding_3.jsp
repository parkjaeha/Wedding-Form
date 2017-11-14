<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
	<script type="text/javascript">
	
		var markerArr = [];
		
		function initialize() {
		    var mapOptions = {
		                       zoom: 13, // 지도를 띄웠을 때의 줌 크기
		                       mapTypeId: google.maps.MapTypeId.ROADMAP
		                   };
		    
		    
		   var map = new google.maps.Map(document.getElementById("map-canvas"), // div의 id과 값이 같아야 함. "map-canvas"
		                               mapOptions);
		    
		   // Geocoding *****************************************************
		   var address = '서울특별시 강남구 신사동 613-5 캐롤라인타워 b1하우스본 오스티엄'; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
		   var marker = null;
		   var infowindow = null;
		  
		   var addrs = document.getElementsByClassName("addrList");
		   //alert(addrs[1].textContent);
		
		   var geocoder = new google.maps.Geocoder();
		   
		   geocoder.geocode( { 'address': addrs[i].textContent}, function(results, status) {
			   	if (status == google.maps.GeocoderStatus.OK) {
			   		map.setCenter(results[0].geometry.location);
			           	marker = new google.maps.Marker({
	 	                   map: map,
	                       title: 'title', // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
	                       position: results[0].geometry.location
	                    });
			           	markersArr.push(marker);
			           	alert(markerArr[i]);
			           	
			           	var content = "말풍선 안에 들어갈 내용"; // 말풍선 안에 들어갈 내용
			           	
			            // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
			            infowindow = new google.maps.InfoWindow({ content: content });
			            google.maps.event.addListener(marker, "click", function() {
			           		map.setCenter(marker.getPosition());
			           		infowindow.open(map,marker);
			           	});
			    } else {
			           alert("Geocode was not successful for the following reason: " + status);
			    }
			});
		    // Geocoding // *****************************************************

		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>
	<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOUu60DDyAcyY5lpmQY1go7BuBibCGqhI&callback=initialize"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>Search Map Page</h1>
	<div style="display: none;">
		<c:forEach items="${list}" var="dto" >
			<p class="addrList">${dto.addr}</p>
		</c:forEach>
	</div>
	<div id="map-canvas" style="width: 100%; height: 800px"></div>
</body>
</html>
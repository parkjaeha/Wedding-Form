<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
	<script type="text/javascript">
    function initMap() {
     
        var mapOptions = {
                            zoom: 18, // 지도를 띄웠을 때의 줌 크기
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };
         
         
        var map = new google.maps.Map(document.getElementById("map-canvas"), // div의 id과 값이 같아야 함. "map-canvas"
                                    mapOptions);
         
        // Geocoding *****************************************************
        var address = '서울특별시 강남구 논현동98번지 SB타워 G층s'; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
        var marker = null;
        var geocoder = new google.maps.Geocoder();
        
        geocoder.geocode( { 'address': address}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                marker = new google.maps.Marker({
                                map: map,
                                title: '대림아파트', // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                                position: results[0].geometry.location
                            });
 
                var content = "말풍선 안에 들어갈 내용"; // 말풍선 안에 들어갈 내용
             
                // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
                var infowindow = new google.maps.InfoWindow({ content: content});
                google.maps.event.addListener(marker, "click", function() {infowindow.open(map,marker);});
            } else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });
        // Geocoding // *****************************************************
         
    }
    google.maps.event.addDomListener(window, 'load', initialize);
	</script>
	<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOUu60DDyAcyY5lpmQY1go7BuBibCGqhI&callback=initMap"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="map-canvas" style="width: 100%; height: 800px" title="도서관 위치입니다."></div>
</body>
</html>
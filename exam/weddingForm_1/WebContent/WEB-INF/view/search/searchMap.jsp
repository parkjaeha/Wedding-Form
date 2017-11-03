<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
       var address = '서울특별시 강남구 신사동 613-5 캐롤라인타워 b1하우스본 오스티엄'; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
       var marker = null;
       var infowindow = null;
       var geocoder = new google.maps.Geocoder();

       var addrArray = [];
       function arrayInput(value) {
    	   for(var i=0; i<${list.size()}; i++) {
    		   addrArray.push(value);
    	   }
       }
       
       // 뿌려놓고 가져오기
       ${list[]}
       
       geocoder.geocode( { 'address': '${list[0].addr}'}, function(results, status) {
           if (status == google.maps.GeocoderStatus.OK) {
           	alert(results[0].geometry.location);
               map.setCenter(results[0].geometry.location);
               marker = new google.maps.Marker({
                               map: map,
                               title: 'title', // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                               position: results[0].geometry.location
                           });
               var content = "말풍선 안에 들어갈 내용"; // 말풍선 안에 들어갈 내용
            
               // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
               infowindow = new google.maps.InfoWindow({ content: content});
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
	<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOUu60DDyAcyY5lpmQY1go7BuBibCGqhI&callback=initMap"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>Search Map Page</h1>
	<h3>${list.size()}</h3>
	<div id="map-canvas" style="width: 100%; height: 800px"></div>
</body>
</html>
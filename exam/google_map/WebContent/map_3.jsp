<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<meta name="viewport" content="initial-scale=1.0, user-scalable=no">

	<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
<title>Insert title here</title>
</head>
<body>
	<div id="map"></div>
    <script>
      function initMap() {
	      var myLatlng = {lat: 37.499265, lng: 127.032845};
	
	      var map = new google.maps.Map(document.getElementById('map'), {
	        zoom: 4,
	        center: myLatlng
	      });
	
	      var marker = new google.maps.Marker({
	        position: myLatlng,
	        map: map,
	        title: 'Click to zoom'
	      });
	      
	      map.addListener('center_changed', function() {
	        // 3 seconds after the center of the map has changed, pan back to the
	        // marker.
	        window.setTimeout(function() {
	          map.panTo(marker.getPosition());
	        }, 3000);
	      });
	
	      marker.addListener('click', function() {
	        map.setZoom(19);
	        map.setCenter(marker.getPosition());
	      });
      }
    </script>
    <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOUu60DDyAcyY5lpmQY1go7BuBibCGqhI&callback=initMap"></script>

</body>
</html>
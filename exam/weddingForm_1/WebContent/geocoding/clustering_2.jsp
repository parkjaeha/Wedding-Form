<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOUu60DDyAcyY5lpmQY1go7BuBibCGqhI&callback=initialize"></script>

	<script>
      function initialize() {
	        var markers = [];
	        var locations = [];
    	  	var addr = document.getElementsByClassName("addrList");
    	  
	        var map = new google.maps.Map(document.getElementById('map'), {
    	      zoom: 11,
        	  center: {lat: 37.517379, lng: 127.047489}
        	});
        
	        var geocoder = new google.maps.Geocoder();
	
	        codeAddress(geocoder, markers, addr);
	        
	
	        // Create an array of alphabetical characters used to label the markers.
	        var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	
	        // Add a marker clusterer to manage the markers.
	        var markerCluster = new MarkerClusterer(map, markers,
	            {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
      }
      
      function codeAddress(geocoder, markers, addr) {
    	  index = 0;
    	  for(var i=0; i<${list.size()}; i++) {
	   	      geocoder.geocode( { 'address': addr[i].textContent}, function(results, status) {
			  	  if (status == 'OK') {
			  		  var latLng = new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng());
			  		  var marker = new google.maps.Marker({
			  			 position: latLng 
			  		  });
			  		  markers.push(marker);
	   	          } else {
	   	            alert('Geocode was not successful for the following reason: ' + status);
	   	          }
		      });
    	  }
   	  }
      
      
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>

	<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
      	margin: 0 auto;
      	width: 80%;
        height: 50%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>

</head>
<body>
	<div style="display: none;">
		<c:forEach items="${list}" var="dto" >
			<p class="addrList">${dto.addr}</p>
		</c:forEach>
	</div>


	<select id="region01" name="region01">
		<option value="">시도</option>
		<option value="서울특별시">서울특별시</option>
	</select>
	<select id="region02" name="regtion02">
		<option value="">시군구</option>
		<option value="강남구">강남구</option>
	</select>
	
	<input id="submit" type="button" value="search">

	<div id="map"></div>
	
</body>
</html>
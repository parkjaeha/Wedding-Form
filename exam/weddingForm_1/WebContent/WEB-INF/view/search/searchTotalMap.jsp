<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
	
	<script>
      function initialize() {
		      var locations = [];
    	  	var addr = document.getElementsByClassName("addrList");
    	  
	        var map = new google.maps.Map(document.getElementById('map'), {
    	      zoom: 11,
        	  center: {lat: 37.517379, lng: 127.047489}
        	});
        
	        var geocoder = new google.maps.Geocoder();
	
	        locations = codeAddress(geocoder, locations, addr);
	        
	        console.log(locations);
	        console.log(locations[0]);
	        console.log(locationArr);
	        console.log(locationArr[0]);
	        
	        /* locations.map(function(value, i) {
	        	console.log(value);
	        });
	        
	        locationArr.map(function(value, i) {
	        	console.log(value);
	        }); */
	
	        // Create an array of alphabetical characters used to label the markers.
	        var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	
	        var markers = locations.map(function(location, i) {
	          return new google.maps.Marker({
	            position: location,
	            label: labels[i % labels.length]
	          });
	        });

	        // Add a marker clusterer to manage the markers.
	        var markerCluster = new MarkerClusterer(map, markers,
	            {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
      }
      
      function codeAddress(geocoder, locations, addr) {
    	  var index = 0;
    	  for(var i=0; i<${list.size()}; i++) {
	   	      geocoder.geocode( { 'address': addr[i].textContent}, function(results, status) {
			  	  if (status == 'OK') {
			  		var location = {lat: results[0].geometry.location.lat(), lng: results[0].geometry.location.lng()};
			  		locations[index] = location;
			  		console.log(locations[index]);
			  		index++;
	   	          } else {
	   	            alert('Geocode was not successful for the following reason: ' + status);
	   	          }
		      });
    	  }
    	  return locations;
   	  }
      
      var locationArr = [
        {lat: -31.563910, lng: 147.154312},
        {lat: -33.718234, lng: 150.363181},
        {lat: -33.727111, lng: 150.371124},
        {lat: -33.848588, lng: 151.209834},
        {lat: -33.851702, lng: 151.216968},
        {lat: -34.671264, lng: 150.863657},
        {lat: -35.304724, lng: 148.662905},
        {lat: -36.817685, lng: 175.699196},
        {lat: -36.828611, lng: 175.790222},
        {lat: -37.750000, lng: 145.116667},
        {lat: -37.759859, lng: 145.128708},
        {lat: -37.765015, lng: 145.133858},
        {lat: -37.770104, lng: 145.143299},
        {lat: -37.773700, lng: 145.145187},
        {lat: -37.774785, lng: 145.137978},
        {lat: -37.819616, lng: 144.968119},
        {lat: -38.330766, lng: 144.695692},
        {lat: -39.927193, lng: 175.053218},
        {lat: -41.330162, lng: 174.865694},
        {lat: -42.734358, lng: 147.439506},
        {lat: -42.734358, lng: 147.501315},
        {lat: -42.735258, lng: 147.438000},
        {lat: -43.999792, lng: 170.463352}
      ];
      
    </script>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOUu60DDyAcyY5lpmQY1go7BuBibCGqhI&callback=initialize"></script>
	
</body>
</html>
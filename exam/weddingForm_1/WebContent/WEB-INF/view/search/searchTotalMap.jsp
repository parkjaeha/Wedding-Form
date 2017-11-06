<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	
	<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOUu60DDyAcyY5lpmQY1go7BuBibCGqhI&callback=initialize"></script>

	<script>
      function initialize() {
		    var locations = [];
    	  	var addrs = document.getElementsByClassName("addrList");
		    var names = document.getElementsByClassName("nameList");
		    var phones = document.getElementsByClassName("phoneList");
		    var mails = document.getElementsByClassName("mailList");
    	  
	        var map = new google.maps.Map(document.getElementById('map'), {
    	      zoom: 11,
        	  center: {lat: 37.517379, lng: 127.047489}
        	});
        
	        var geocoder = new google.maps.Geocoder();
	
	        codeAddress(geocoder, map, addrs, names, phones, mails);
      }
      
      function codeAddress(geocoder, resultMap, addrs, names, phones, mails) {
    	  var index = 0;
    	  var markers = [];
    	  var contents = [];
    	  var positions = [];
    	  var infoWindow = null;
    	  var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    	  for(var i=0; i<${list.size()}; i++) {
	   	      geocoder.geocode( { 'address': addrs[i].textContent}, function(results, status) {
			  	  if (status == 'OK') {
			  		  var count = 0;
			  		var location = {lat: results[0].geometry.location.lat(), lng: results[0].geometry.location.lng()};
			  		positions.push(location);
			  		
			  		var marker = new google.maps.Marker({
			  			position: positions[index],
			  			label: labels[i % labels.length],
			  			title: names[index].textContent,
			  		});
			  		var content = names[index].textContent +"<br>"+ phones[index].textContent +"<br>"+ mails[index].textContent;
			  		
			  		markers.push(marker);
			  		contents.push(content);
			  		
			  		infoWindow = new google.maps.InfoWindow();
		            
		  			google.maps.event.addListener(marker, 'click', (function(marker, index) {
		                return function() {
		                	infoWindow.setContent(contents[index]);
		                  	infoWindow.open(resultMap, marker);
		                }
		            })(marker, index));
		  			
			  		index++;
			  		
			  		if(index == 10) {
			  			var markerCluster = new MarkerClusterer(resultMap, markers,
			  					{ imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
			  		
			  			for(var j=0; j<${list.size()}; j++) {
				  			$("#"+j).click(function() {
				  				var num = $(this).attr('id');
				  				infoWindow.setContent(contents[num-1]);
				  				infoWindow.setPosition(positions[num-1]);
				  				infoWindow.open(resultMap, markers[num-1]);
				  			});
			  			}
			  		}
			  		
	   	          } else {
	   	            alert('Geocode was not successful for the following reason: ' + status);
	   	            return  locations;
	   	          }
		      });
    	  }
   	  }
    </script>
      
    <script>
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>

	<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      #panel {
      	float: left;
        width: 300px;
        height: 550px;
      }
      #markerlist {
        height: 400px;
        margin: 10px 5px 0 10px;
        overflow: auto;
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
	<div id="panel">
		<div id="search">
	    	<select id="region01" name="region01">
			<option value="">시도</option>
			<option value="서울특별시">서울특별시</option>
			</select>
			<select id="region02" name="regtion02">
				<option value="">시군구</option>
				<option value="강남구">강남구</option>
			</select>
			
			<input id="submit" type="button" value="search">
		</div>
		
		<strong>Wedding List</strong>
	    <div id="markerlist">
	    	<table class="table table-hover">
				<c:forEach items="${list}" var="dto" varStatus="count" >
				<tr>
					<td id="${count.count}">${dto.name}</td>
				</tr>
				</c:forEach>
	    	</table>
	    </div>
	    
	</div>
	
	<div id="map"></div>
	
	<div style="display: none;">
		<c:forEach items="${list}" var="dto" >
			<p class="addrList">${dto.addr}</p>
		</c:forEach>
	</div>
	<div style="display: none;">
		<c:forEach items="${list}" var="dto" >
			<p class="nameList">${dto.name}</p>
		</c:forEach>
	</div>
	<div style="display: none;">
		<c:forEach items="${list}" var="dto" >
			<p class="phoneList">${dto.phone}</p>
		</c:forEach>
	</div>
	<div style="display: none;">
		<c:forEach items="${list}" var="dto" >
			<p class="mailList">${dto.mail}</p>
		</c:forEach>
	</div>
	
</body>
</html>
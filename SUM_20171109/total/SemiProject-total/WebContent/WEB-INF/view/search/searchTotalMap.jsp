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

#panel {
	float: left;
	width: 300px;
	height: 800px;
}

#map-container {
	margin-left: 300px;
}

#map {
	width: 100%;
	height: 550px;
}

#markerlist {
	height: 400px;
	margin: 10px 5px 0 10px;
	overflow: auto;
}

#searchInput {
	  background-image: url('../image/common/searchicon.gif');
	  background-position: 10px 12px;
	  background-repeat: no-repeat;
	  width: 100%;
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
	border-bottom: 1px solid #e0ecff;
	overflow: hidden;
	width: 256px;
	cursor: pointer;
}

.title:visited {
	color: #000;
}

.title:hover {
	background: #e0ecff;
}
</style>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOUu60DDyAcyY5lpmQY1go7BuBibCGqhI&callback=weddingMap.init"></script>
<script type="text/javascript" src="../src/markerclusterer.js"></script>
<script src="../json/data.json"></script>
<script src="../js/weddingMap.js"></script>

<script>
      google.maps.event.addDomListener(window, 'load', weddingMap.init);
</script>
</head>
<body>
	<div id="panel">
		<input type="text" id="searchInput" onkeyup="searchFunction()" placeholder="웨딩홀 이름을 입력해주세요">
		
		<strong>Wedding Hall List</strong>
		<ul id="myUL">
		</ul>
		<script>
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
		</script>
		
		
	</div>
	<div id="map-container">
		<div id="map"></div>
	</div>
</body>
</html>
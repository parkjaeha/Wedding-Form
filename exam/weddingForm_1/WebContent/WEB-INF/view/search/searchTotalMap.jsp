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

a {
	text-decoration: none;
	color: #2096BA;
}

a:visited, a:link {
	color: #2096BA;
}

#map-container {
	width: 100%;
}

#map {
	width: 80%;
	height: 800px;
	float: left;
}

#panel {
	float: left;
	width: 20%;
	height: 800px;
	overflow: auto;
}

#markerlist {
	height: 400px;
	margin: 10px 5px 0 10px;
}

#searchInput {
	  background-image: url('../image/common/searchicon.gif');
	  background-position: 10px 12px;
	  background-repeat: no-repeat;
	  width: 75%;
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
	text-align: center;
}

/* .hide {
	display: none;
} */

.btn {
	display: inline-block;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    border: 1px solid transparent;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: .25rem;
}

.hide {
	display: none;
}
</style>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOUu60DDyAcyY5lpmQY1go7BuBibCGqhI&callback=weddingMap.init"></script>
<script type="text/javascript" src="../src/markerclusterer.js"></script>
<script src="../json/data.json"></script>
<script src="../js/weddingMap.js"></script>

<script>
      google.maps.event.addDomListener(window, 'load', weddingMap.init);
</script>

<script type="text/javascript">

	function searchFunction() {
	    var input, filter, ul, li, a, i;
	    input = document.getElementById("searchInput");
	    filter = input.value.toUpperCase();
	    ul = document.getElementById("myUL");
	    li = ul.getElementsByTagName("li");
	    for (i = 0; i < li.length; i++) {
	        a = li[i].getElementsByTagName("a")[0];
	        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
	            li[i].style.display = "";
	        } else {
	            li[i].style.display = "none";
	
	        }
	    }
	}
	
	function searchRegion() {
		var sido, gungu, filter, ul, li, span, i;
		
		sido = document.getElementById("sido");
		gungu = document.getElementById("gungu");
		filter = (sido.value + " " + gungu.value).toUpperCase().trim();
		ul = document.getElementById("myUL");
	    li = ul.getElementsByTagName("li");
		for (i = 0; i < li.length; i++) {
			span = li[i].getElementsByTagName("span")[0];
			if (span.innerHTML.toUpperCase().indexOf(filter) > -1) {
	            li[i].style.display = "";
	        } else {
	            li[i].style.display = "none";
	
	        }      
		  }
	}

</script>

</head>
<body>
	<div class="container">
		<input type="text" id="searchInput" onkeyup="searchFunction()" placeholder="웨딩홀 이름을 입력해주세요">
		<i class="fa fa-angle-right" style="font-size:24px"></i>
		<a class="btn btn-info" href="./searchMain.search">상세 검색</a>
	</div>

	<div id="map-container">
		<div id="map"></div>
		
		<div id="panel">
			<h3 class="title">Wedding Hall List</h3>
			
			<select name="sido" id="sido">
				<option value=" ">시/도</option>
			</select>
			<select name="gungu" id="gungu" onchange="searchRegion()">
				<option value=" ">군/구</option>
			</select>
			
			<ul id="myUL"></ul>
		</div>
	</div>
	
</body>
</html>
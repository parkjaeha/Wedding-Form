<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>

	<!-- <script src="https://maps.googleapis.com/maps/api/geocode/json?address=경기도 안산시 단원구 광덕서로 19&key=AIzaSyAOUu60DDyAcyY5lpmQY1go7BuBibCGqhI"></script> -->

	<script type="text/javascript">
	
		/* var latlng = '';
		$.ajax({
			url: 'https://maps.googleapis.com/maps/api/geocode/json?address=경기도 안산시 단원구 광덕서로 19&key=AIzaSyAOUu60DDyAcyY5lpmQY1go7BuBibCGqhI',
			type: 'GET',
			async: false,
			success: function(data){
				latlng = data.results[0].geometry.location;
			}
		}); */
	
		var latlng = '';
	
	
		function myFunction(callback) {
			var xhttp;
			if (window.XMLHttpRequest) {
				// code for modern browsers
				xhttp = new XMLHttpRequest();
			} else {
				// code for IE6, IE5
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					var myArr = JSON.parse(this.responseText);
					latlng = myArr.results[0].geometry.location;
					return callback(latlng);
				}
			};
			xhttp.open("GET", "https://maps.googleapis.com/maps/api/geocode/json?address=경기도 안산시 단원구 광덕서로 19&key=AIzaSyAOUu60DDyAcyY5lpmQY1go7BuBibCGqhI", true);
			xhttp.send();
		}
		
		this.myFunction(function(result) {
			latlng = result;
		});
		
		console.log(latlng);
		
		
	</script>

</body>
</html>
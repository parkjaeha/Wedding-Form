<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var ids = [];
		var names = [];
		var addrs = [];
		var numbers = [];
		var phones = [];
		var latitude = [];
		var longitude = [];
		var num = 220;
		
		$.ajax({
			url: "./weddinghall.json",
			type: "GET",
			async: false,
			success: function(data){
				for(var i=num; i< data.result.header.paging.totalCount; i++) { //data.result.header.paging.totalCount
					names.push(data.result.body.rows[0].row[i].bplcNm);
					addrs.push(data.result.body.rows[0].row[i].rdnWhlAddr);
					numbers.push(data.result.body.rows[0].row[i].mgtNo);
					phones.push(data.result.body.rows[0].row[i].siteTel);
					ids.push("company"+i);
				}
			}
		});
		
		for(var i=0; i<20; i++) {
			$.ajax({
				type: "GET",
				url: "https://maps.googleapis.com/maps/api/geocode/json?address="+addrs[i]+"&key=AIzaSyAOUu60DDyAcyY5lpmQY1go7BuBibCGqhI",
				async: false,
				success: function(data) {
					console.log((num+i+1)+"번");
					console.log(data.results[0].geometry.location);
					latitude.push(data.results[0].geometry.location.lat);
					longitude.push(data.results[0].geometry.location.lng);
				},
				error:function(request,status,error){
				    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    latitude.push(0);
					longitude.push(0);
				}
			});
		}
			
		
		$("#id").val(ids);
		$("#name").val(names);
		$("#addr").val(addrs);
		$("#tel").val(phones);
		$("#number").val(numbers);
		
		$("#lat").val(latitude);
		$("#lng").val(longitude);
		
		
	}); //End onload
	
</script>
</head>
<body>
	<form action="./testCompanyInsertProcess.jsp" method="POST">
		<p>ID: <input type="text" name="id" id="id"></p>
		<p>NAME: <input type="text" name="company_name" id="name"></p>
		<p>ADDR: <input type="text" name="company_addr" id="addr"></p>
		<p>PHONE: <input type="text" name="company_tel" id="tel"></p>
		<p>NUMBER: <input type="text" name="company_number" id="number"></p>
		<p>LAT: <input type="text" name="latitude" id="lat"></p>
		<p>LNG: <input type="text" name="longitude" id="lng"></p>		
		<input type="submit" value="제출">
	</form>



</body>
</html>
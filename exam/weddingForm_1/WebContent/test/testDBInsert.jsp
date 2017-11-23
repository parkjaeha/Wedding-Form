<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<script type="text/javascript">
	$(function() {
		var ids = [];
		var pws = [];
		var names = [];
		var addrs = [];
		var numbers = [];
		var phones = [];
		var mails = [];
		var jobs = [];
		$.ajax({
			url: "./weddinghall.json",
			type: "GET",
			async: false,
			success: function(data){
				/* console.log("업체명: "+data.result.body.rows[0].row[0].bplcNm);
				console.log("주소: "+data.result.body.rows[0].row[0].rdnWhlAddr);
				console.log("사업자번호: "+data.result.body.rows[0].row[0].mgtNo);
				console.log("전화번호: "+data.result.body.rows[0].row[0].siteTel); */
				
				for(var i=0; i< data.result.header.paging.totalCount; i++) {
					names.push(data.result.body.rows[0].row[i].bplcNm);
					addrs.push(data.result.body.rows[0].row[i].rdnWhlAddr);
					numbers.push(data.result.body.rows[0].row[i].mgtNo);
					phones.push(data.result.body.rows[0].row[i].siteTel);
					ids.push("company"+i);
					pws.push("company"+i);
					mails.push("company"+i+"@naver.com");
					jobs.push("Business");
				}
			}
		});
		console.log(ids);
		console.log(pws);
		console.log(names);
		console.log(addrs);
		console.log(numbers);
		console.log(phones);
		console.log(mails);
		console.log(jobs);
		
		$("#id").val(ids);
		$("#pw").val(pws);
		$("#name").val(names);
		$("#addr").val(addrs);
		$("#phone").val(phones);
		$("#email").val(mails);
		$("#job").val(jobs);
	});
	
</script>
</head>
<body>
	<form action="./testDBInsertProcess.jsp" method="POST">
		<p>ID: <input type="text" name="id" id="id"></p>
		<p>PW: <input type="text" name="pw" id="pw"></p>
		<p>NAME: <input type="text" name="name" id="name"></p>
		<p>ADDR: <input type="text" name="addr" id="addr"></p>
		<p>PHONE: <input type="text" name="phone" id="phone"></p>
		<p>MAIL: <input type="text" name="email" id="email"></p>
		<p>JOB: <input type="text" name="job" id="job"></p>
		
		<input type="submit" value="제출">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
	body {
		background-color: #333;
	}

	.container {
		max-width: 600px;
		margin: auto;
	}
	
	.row {
		border-top: 1px dotted white;
		border-bottom: 1px dotted white;
		color: #fff;
	}
	
	#write {
		display: block;
		width: 600px;
		margin: auto;
	}
</style>
</head>
<body>

<form action="./memoWrite.memo" method="get">
<div id="result" class="container">
	<h1 style="color: #fff;">memo List</h1>
	<c:forEach items="${requestScope.list}" var="dto">
	
		<div class="row">
			<span class="col-sm-2">${dto.id}</span>
			<span class="col-sm-8">${dto.contents}</span>
			<span class="col-sm-2">삭제</span>
		</div>
	
	</c:forEach>
</div>
<input type="submit" id="write" value="write">
</form>



</body>
</html>
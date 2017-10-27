
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.col-centered{
	float: none;
	margin: 0 auto;
	margin-bottom: 100px;
}
</style>

</head>
<body>
<div class="col-md-8 col-centered">
<h1>${board} </h1>
<table class="table">
<tr>
<td>title : ${view.title}</td>
</tr>
<tr>
<td>writer : ${view.writer} </td>
</tr>
<tr>
<td>date : ${view.reg_date}</td>
</tr>
<tr>
<td>hit : ${view.hit}</td>
</tr>
<tr>
<td>contents : ${view.contents}</td>
</tr>

</table>

<p><a href="./${board}Update.${board}?num=${view.num}">UPDATE</a></p>

<p><a href="./${board}Delete.${board}?num=${view.num}">DELETE</a></p>

<p><a href="./${board}List.${board}">LIST</a></p>

</div>

</body>
</html>
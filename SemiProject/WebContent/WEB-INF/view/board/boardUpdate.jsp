<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.col-centered{
	float: none;
	margin: 0 auto;
	margin-bottom: 100px;
}

</style>
</head>
<body>
 <c:import url="../../../temp/header.jsp"></c:import>
		<div class="col-md-8 col-centered">
			<form action="./${board}Update.${board}" method="post">
				<table class="table">
				
						<tr>
						<input type="hidden" name="num" value="${update.num}">
						
						<td>TITLE : <input class="form-control" type="text" name="title" value="${update.title }"></td>
					  </tr>
					<tr>
						<td id="writer">WRITER : <input class="form-control" type="text" name="writer" readonly="readonly" value="${update.writer}"></td>
					</tr>
					<tr>
					 	<td colspan="6" id="contents">CONTENTS : <textarea class="form-control" name="contents">${update.contents}</textarea></td>
					</tr>
				</table>
				
				<button>글쓰기</button>
			</form>
			</div>
 <c:import url="../../../temp/footer.jsp"></c:import>
</body>
</html>
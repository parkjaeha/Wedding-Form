<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		<h1>${board}</h1>
			<form action="./${board}Update.${board}" method="post">
				<table class="table">
				<input type="hidden" name="num" value="${update.num}">
					<tr>
						<td colspan="2">TITLE : <input class="form-control" type="text" name="title" value="${update.title}"></td>
						</tr>
						<tr>
						<td id="writer">WRITER : ${update.writer}</td>
					</tr>
					<tr>
					 	<td colspan="6" id="contents">CONTENTS : <textarea class="form-control" name="contents">${update.contents}</textarea></td>
					</tr>
				</table>
				
				<button>글쓰기</button>
			</form>
			</div>

</body>
</html>
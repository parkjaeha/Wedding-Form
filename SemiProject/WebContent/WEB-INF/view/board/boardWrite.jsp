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
			<form action="./${requestScope.board}Write.${board}" method="post">
				<table class="table">
					<tr>
						<td colspan="2">TITLE : <input class="form-control" type="text" name="title" placeholder="제목없음"></td>
						</tr>
						<tr>
						<td id="writer">WRITER : <input class="form-control" type="text" name="writer"></td>
					</tr>
					<tr>
					 	<td colspan="6" id="contents">CONTENTS : <textarea class="form-control" name="contents" placeholder="내용을 입력하세요."></textarea></td>
					</tr>
				</table>
				
				<button>글쓰기</button>
			</form>
			</div>

</body>
</html>
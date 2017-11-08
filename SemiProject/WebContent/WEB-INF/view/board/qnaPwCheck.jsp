<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form action="./qnaPwCheck.qna" method="post">
 <input type="hidden" name="num" value="${param.num}">



 
<h1>비밀번호를 입력하세요</h1>
<p><input type="password" name="password"></p>
	<button>확인</button>
	<h2><a href="./qnaList.qna">LIST</a></h2>
</form>
</body>
</html>
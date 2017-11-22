<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>




<form name="frm" class="form-horizontal" action="memberEmail.member" method="POST">
				<label>이메일</label><input type="text" name="to" value="qkrwogk110@naver.com">
				<label>제목</label><input type="text" name="subject">
				<label>내용</label><input type="text" name="content">
					<button type="submit">email</button>					
			</form>
			
			<a href = "memberPw.member">비밀번호 찾기</a>

			
			${result}
			

</body>
</html>
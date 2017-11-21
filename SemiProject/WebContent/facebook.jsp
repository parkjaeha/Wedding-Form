<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta property="og:title" content="NAVER">
<meta property="og:url" content="www.naver.com">
<meta property="og:description" content="내용">
<meta property="og:image" content="이미지 경로">
<title>Insert title here</title>
</head>
<body>
   <span onclick="sharing();">페이스북 공유하기</span>
</body>

<script>
function sharing () {
    window.open('http://www.facebook.com/sharer/sharer.php?u=http://naver.com');
}
</script>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.contents{
width: 1100px;
height: 800px;
margin: 0 auto;
}
</style>
</head>
<body>
 <c:import url="../../../temp/header.jsp"></c:import> 
 <div id="blank"></div>
 <div id="blank"></div>
 <div class="contents">
 
<a href="./reviewList.review?type=invitation&&curPage=1">청첩장</a>
<a href="./reviewList.review?type=wedding_hall&&curPage=1">웨딩홀</a>
</div>
 <c:import url="../../../temp/footer.jsp"></c:import>
</body>
</html>
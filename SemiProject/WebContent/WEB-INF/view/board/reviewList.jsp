<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style type="text/css">
.col-centered {
	float: none;
	margin: 0 auto;
	margin-bottom: 100px;
	width: 1100px;
	margin-top: 150px;
}

	a {
		text-decoration: none;
		color:gray;
	}
#blank {
	height: 50px;
}
.write_1{
	
font-size: 30px;

	
}



.w3-bar{
margin : 0 auto;

text-align : center;
}


</style>

</head>
<body>

<!-- main -->
	<div id="all">
 <c:import url="../../../temp/header.jsp"></c:import> 
 <div id="blank"></div>
  <div id="blank"></div>
	<div class="col-centered">


	<table class="table table-hover">
<div id="blank"></div>
<c:if test="${param.type eq 'invitation'}">
		<article class="write_1">INVITATION</article>
		</c:if>
<c:if test="${param.type eq 'wedding_hall'}">
		<article class="write_1">WEDDING</article>
		</c:if>
    

		<tr style="color: white; background-color: #2096BA;">
			<td>NUM</td>
			<td></td>
			<td>TITLE</td>
			<td>WRITER</td>
			<td>DATE</td>
			<td>HIT</td>
		</tr>

		<c:forEach items="${requestScope.list}" var="dto">
		
     
		<tr>
			<td>${dto.num}</td>
			<td>
			<div id="star">
        <c:forEach begin="1" end="${dto.star_score}" >
                      ★
        </c:forEach></p>
</div></td>
			<td>
			<img alt="" src="../img/memo.gif">
			<a href="./reviewView.review?num=${dto.num}" id="a">${dto.title}</a>
			</td>
			<td>${dto.writer}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.hit}</td>
			
		</tr>

			</c:forEach>


	</table>
	
	
	<!-- 페이징 처리 -->
			<div class="w3-bar">
			
					<c:if test="${page.curBlock>1}">
				
						<a href="./reviewList.review?type=${param.type}&&curPage=${requestScope.page.StartNum-1}" class="w3-button">&laquo;</a>
					</c:if>

					<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
						<a href="./reviewList.review?type=${param.type}&&curPage=${i}" class="w3-button">${i}</a>
					</c:forEach>

					<c:if test="${page.curBlock < page.totalBlock}">
						<a href="./reviewList.review?type=${param.type}&&curPage=${requestScope.page.lastNum+1}" class="w3-button">&raquo;</a>
					</c:if>

			



			</div>
	<%-- <c:if test="${not empty member}">
	</c:if> --%>
	
		<a href="./reviewWrite.review?type=${param.type}">
		<img alt="" src="../images/main/write.png" style="width: 80px; height: 30px;"></a>
	</div>

 <c:import url="../../../temp/footer.jsp"></c:import> 
 </div>
</body>
</html>





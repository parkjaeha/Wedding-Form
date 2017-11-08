<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	}

	a {
		text-decoration: none;
	}
#blank {
	height: 50px;
}
	.write_1{
	
	height: 34px;
	margin: 0 auto;
	text-align: center;
}


.write_2{
    width: 70px;
	height: 30px;
	border-top : 1px solid black;
	margin: 0 auto;
}
</style>

</head>
<body>
 <c:import url="../../../temp/header.jsp"></c:import> 
 <div id="blank"></div>
  <div id="blank"></div>
	<div class="col-md-8 col-centered">

	<table class="table table-hover">
<div id="blank"></div>
	<article class="write_1">${param.type }</article>
       <article class="write_2"></article>

		<tr>
			<td>num</td>
			<td>title</td>
			<td>writer</td>
			<td>date</td>
			<td>hit</td>
		</tr>

		<c:forEach items="${requestScope.list}" var="dto">
		
     
		<tr>
			<td>${dto.num}</td>
			<td>
			<a href="./reviewView.review?num=${dto.num}" id="a">${dto.title}</a>
			</td>
			<td>${dto.writer}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.hit}</td>
			
		</tr>

			</c:forEach>


	</table>
	
	
	<div>
		<ul class="pagination">
			<c:if test="${page.curBlock>1}">
			<li><button class="go" id="${page.startNum-1}">[이전]</button></li>
			</c:if>
			
			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
			<li><a
				href="./${board}List.${board}?curPage=${i}">${i}</a></li>
			</c:forEach>
			
			<c:if test="${page.curBlock < page.totalBlock}">
			<li><a
				href="./${board}List.${board}?curPage=${requestScope.page.lastNum+1}">[다음]</a></li>
			</c:if>
			
		</ul>



	</div> 
	
	<%-- <c:if test="${not empty member}">
	</c:if> --%>
	
		<a href="./reviewWrite.review?type=${param.type}"><img alt="" src="../images/write.png"></a>
	</div>
 <c:import url="../../../temp/footer.jsp"></c:import> 
</body>
</html>





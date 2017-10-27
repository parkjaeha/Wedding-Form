<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.col-centered {
		float: none;
		margin: 0 auto;
		margin-bottom: 100px;
	}

	a {
		text-decoration: none;
	}
</style>
</head>
<body>
<div class="col-md-8 col-centered">
	<h1>${board}</h1>
	<table class="table table-hover">
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
			<c:catch>
			<c:forEach begin="0" end="${dto.depth-1}">
				--
			</c:forEach>
			</c:catch>
			<a href="./${board}View.${board}?num=${dto.num}">${dto.title}</a>
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
				href="./${requestScope.board}List.${requestScope.board}?curPage=${i}">${i}</a></li>
			</c:forEach>
			
			<c:if test="${page.curBlock < page.totalBlock}">
			<li><a
				href="./${requestScope.board}List.${requestScope.board}?curPage=${requestScope.page.lastNum+1}">[다음]</a></li>
			</c:if>
			
		</ul> 



	</div>  
	
	<%-- <c:if test="${not empty member}">--%>
		<a href="./${requestScope.board}Write.${requestScope.board}">WRITE</a>
	<%--</c:if> --%>
	</div>

</body>
</html>





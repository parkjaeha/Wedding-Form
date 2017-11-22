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
	float: left;
	margin: 0 auto;
	margin-bottom: 100px;
	margin-top: 150px;
}

#blank {
	height: 50px;
}
.write_1{
	
font-size: 30px;

	
}

table a{
	text-decoration: none;
	color : gray;
}
table a:hover{
	text-decoration: none;
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
<div class="container-fluid" style="margin-top: 77px;">
  
  
  <div class="row content">
    <div class="col-sm-2 sidenav2" >
      <ul class="nav nav-pills nav-stacked" style="margin-left: 30px;">
      <li><h3 style="color: gray; margin-top : 50px;">Community</h3></li>
       <hr style="border: 1px #2096BA solid;">
        <li ><a href="${pageContext.request.contextPath}/notice/noticeList.notice">공지사항</a></li>
        <li><a href="${pageContext.request.contextPath}/qna/qnaList.qna">Q&A</a></li>
       <li><a href="${pageContext.request.contextPath}/report/reportPage.report">신고 하기</a></li>
       <li class="active"><a href="${pageContext.request.contextPath}/review/reviewPage.review">이용 후기</a></li>
      </ul><br>
    </div>





    <div class="col-sm-9" style="margin-left:30px;">

	<table class="table table-hover" style="width: 100%;">
<div id="blank"></div>
<c:if test="${param.type eq 'invitation'}">
		<h3 style="text-align: center; margin-top:50px;"><small>Invitation Review</small></h3>
      <hr>
		</c:if>
<c:if test="${param.type eq 'wedding_hall'}">
		<h3 style="text-align: center; margin-top:50px;"><small>Wedding Review</small></h3>
      <hr>
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
					
						<a href="./reviewList.review?type=${param.type}&&curPage=${page.startNum-1}" class="w3-button">«</a>
					</c:if>

					<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
						<a href="./reviewList.review?type=${param.type}&&curPage=${i}" class="w3-button">${i}</a>
					</c:forEach>

					<c:if test="${page.curBlock < page.totalBlock}">
						<a	href="./reviewList.review?type=${param.type}&&curPage=${page.lastNum+1}" class="w3-button">»</a>
					</c:if>
					




			</div>
	<%-- <c:if test="${not empty member}">
	</c:if> --%>
	
		<a href="./reviewWrite.review?type=${param.type}">
		<img alt="" src="../images/main/write.png" style="width: 80px; height: 30px;"></a>
	</div>
</div>

</div>
 <c:import url="../../../temp/footer.jsp"></c:import> 
 </div>
</body>
</html>





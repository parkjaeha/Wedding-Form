<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
	 document.frm.submit();	
	});
});
</script>
<body>
 <c:import url="../../../temp/header.jsp"></c:import>
 <div id="blank"></div>
 <div id="blank"></div>
	<div class="col-md-8 col-centered">
<div id="blank"></div>

			<table class="table table-hover">
			
		<c:if test="${board eq 'notice'}">
		<article class="write_1">NOTICE</article>
         <article class="write_2"></article>
         
			
				<tr>
					<td>num</td>
					<td></td>
					<td>title</td>
					<td>writer</td>
					<td>date</td>
					<td>hit</td>
				</tr>
				<c:forEach items="${requestScope.list}" var="dto">

					<tr>
						<td>${dto.num}</td>
						<td><img alt="" src="../img/mic.gif"></td>
						<td><a
							href="./${requestScope.board}View.${requestScope.board}?num=${dto.num}">${dto.title}</a>
						</td>
						<td><img alt="" src="../img/name.gif"></td>
						<td>${dto.reg_date}</td>
						<td>${dto.hit}</td>

					</tr>
				</c:forEach>
				</c:if>



				<c:if test="${board eq 'qna'}">
					<article class="write_1">Q&A</article>
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

							<td><c:catch>
			 						<c:forEach begin="0" end="${dto.depth-1}">
			                            <img alt="" src="../img/reply.gif">
			</c:forEach>
								</c:catch> <!-- 관리자면 그냥보기, 회원이면 pw입력 페이지로 이동 --> <c:if
									test="${dto.opencheck eq 'hide'}">
	                    <a href="./qnaPwCheck.qna?num=${dto.num}">
										<img alt="" src="../img/자물쇠.gif"> ${dto.title}
									</a>
								</c:if> <c:if test="${dto.opencheck eq 'open'}">
									<a
										href="./qnaView.qna?num=${dto.num}&&opencheck=${dto.opencheck}">${dto.title}</a>
								</c:if></td>

							<td>${dto.writer}</td>
							<td>${dto.reg_date}</td>
							<td>${dto.hit}</td>

						</tr>
					</c:forEach>
				</c:if>
				
			</table>
			
			
			<form name="frm" action="./${board}List.${board}" method="post">
				<select name="kind">
					<option value="title">TITLE</option>
					<option value="contents">CONTENTS</option>

				</select> <input type="text" id="search" name="search"> <input
					type="button" id="btn" class="btn btn-default" value="SEARCH">
			</form>

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

			<a href="./${requestScope.board}Write.${requestScope.board}">write</a>
	</div>
 <c:import url="../../../temp/footer.jsp"></c:import> 
</body>
</html>





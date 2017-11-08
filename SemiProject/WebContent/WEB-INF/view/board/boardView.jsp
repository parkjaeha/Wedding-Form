<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
.d{
	float: none;
	width:300px;
	height : 500px;
	margin: 0 auto;
	
}

.blank{
width: 50;
height: 100px;

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
<article class="write_1">${board }</article>
  <article class="write_2"></article>
<div class="d">
<p>TITLE : ${view.title}</p>
<p>DATE : ${view.reg_date}</p>
<p>HIT : ${view.hit}</p>
<p>WRTIER : ${view.writer}</p>
<p>CONTENTS : ${view.contents}</p>


				
	<a href="./${board}List.${board}"><img alt="" src="../image/list.gif"></a>
	<a href="./${board}Update.${board}?num=${view.num}"><img alt="" src="../image/su.gif"></a>
	<c:if test="${board eq 'notice'}" >
	<a href="./${board}Delete.${board}?num=${view.num}"><img alt="" src="../image/delete.gif"></a>
	</c:if>
	<c:if test="${board eq 'qna'}" >
	<a href="./${board}Delete.${board}?ref=${view.ref}"><img alt="" src="../image/delete.gif"></a>
	</c:if>
	
	<div class=blank></div>
	
	
	
	
	<!-- 관리자만 -->
	
	<c:if test="${board eq 'qna'}" >
	<form action="./qnaReply.qna" method="post">
			<input type="hidden" name="num" value="${param.num}">
			<input type="hidden" name="opencheck" value="${param.opencheck}">
			<input type="hidden" name="password" value="${param.password}">
		
			
			
	<table>
	<tr>
						<td colspan="2">--------------------댓글-------------------</td>
						</tr>
	<tr>
						<td colspan="2">TITLE : <input class="form-control" type="text" name="title" placeholder="제목"></td>
						</tr>
						<tr>
						<td id="reg_date"></td>
						</tr>
						<tr>
						<td id="writer">WRITER : <input class="form-control" type="text" name="writer"></td>
					</tr>
					<tr>
					 	<td colspan="6" id="contents">CONTENTS : <textarea class="form-control" name="contents" placeholder="내용을 입력하세요."></textarea></td>
					</tr>
					
	
	</table>
	<button  class="btn btn-default">글쓰기</button>
	</form>
	
	</c:if>
	
	
	</div>
	

</body>
</html>
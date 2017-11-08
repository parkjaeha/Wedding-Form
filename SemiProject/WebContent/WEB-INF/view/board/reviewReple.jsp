<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<c:forEach items="${requestScope.list}" var="dto">
	
	
	<pre style="background-color: #fff">
		
		WRITER : ${dto.writer}  
		DATE :  ${dto.reg_date}
		CONTENTS : ${dto.contents}	
		
		<a href="../reply/replyUpdate.reply?num=${dto.num}&&type=${dto.type}"><button class="btn btn-default">수정</button></a>
		<a href="../reply/replyDelete.reply?num=${dto.num}&&type=${dto.type}&&reviewNum=${dto.reviewNum}"><button class="btn btn-default">삭제</button></a>
	</pre>
	
	
 </c:forEach>
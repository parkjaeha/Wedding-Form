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
	<script type="text/javascript">
$(function(){
	$("#update").click(function(){
		$("#up").show();
	});
	
	$(".reply").click(function(){
		$("#"+$(this).attr('title')).slideToggle();
	});
});


</script>
<c:forEach items="${requestScope.list}" var="dto" varStatus="count">
	
	

		<div class="list-group-item">
		
		<c:catch>
			 	<c:forEach begin="0" end="${dto.depth-1}">
			     <span class="glyphicon glyphicon-arrow-right"></span>
			</c:forEach>
			</c:catch> 
			
			
		 <p class="glyphicon glyphicon-user">  ${dto.writer}  | ${dto.reg_date} | 
		 <span  class="reply" title="h${count.count}"><img alt="" src="../img/reply.gif">답글</span>
		 </p>
		<p>
		   ${dto.contents}</p>	 
		
         <!-- 글쓴이만 -->
         
         <!-- 수정 -->
         <form action="../reply/replyUpdate.reply" method="post">
         <input type="hidden" value="${dto.type}" name="type">
          <input type="hidden" value="${dto.num}" name="num">
		  <input type="hidden" value="${dto.reviewNum}" name="reviewNum">
         <p id="update">수정</p>
		  <div id="up" style="display: none;">
		 <textarea  cols="115" rows="5" name="contents">${dto.contents}</textarea>
	    <button  id="btn1" class="btn btn-default">수정</button></p>
		   </div>
		   </form>
		   
		   
		   <!-- 삭제 -->
		 <a href="../reply/replyDelete.reply?num=${dto.num}&&type=${dto.type}&&reviewNum=${dto.reviewNum}&&ref=${dto.ref}">삭제</a> 
		 
		 
		 <!-- 답글 -->
		 <form action="../reply/replyReple.reply" method="post">
		 
		 <div id="h${count.count}" style="display: none;">
		 <input type="hidden" value="${dto.type}" name="type">
		  <input type="hidden" value="${dto.num}" name="num">
		  <input type="hidden" value="${dto.reviewNum}" name="reviewNum">
		 <input type="text" name="writer" placeholder="writer">
		 <textarea  cols="115" rows="5" name="contents" placeholder="내용을 입력하세요."></textarea>
		   <button  id="btn2" class="btn btn-default">글쓰기</button></p>
		   </div>
		   </form>
		 </div>

	
 </c:forEach>
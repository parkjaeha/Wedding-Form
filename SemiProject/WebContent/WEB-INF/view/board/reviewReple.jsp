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
	$(".update").click(function(){
		var title = $(this).attr('title');
		$("#up"+title).slideToggle("slow");
	});
	
	$(".reply").click(function(){
		var title = $(this).attr('title');
		$("#hide"+title).slideToggle("slow");
	});

});


</script>


<c:forEach items="${requestScope.list}" var="dto" varStatus="count">
		
		<!-- 댓글 -->
			<c:if test="${dto.depth eq 0}">
		   <hr>	
	 	 <p class="glyphicon glyphicon-user">  ${dto.writer}  | ${dto.reg_date} | 
		 <span  class="reply" title="${count.count}"><img alt="" src="../img/reply.gif">답글</span>
		 </p>
		<p>
		   ${dto.contents}</p>
		   
		   <!-- 글쓴이만 삭제 -->
		   <a href="../reply/replyDelete.reply?num=${dto.num}&&type=${dto.type}&&reviewNum=${dto.reviewNum}&&ref=${dto.ref}">
		 <img alt="" src="../images/main/delete.png" style="width: 80px; height: 30px;"></a> 
		   </c:if>
	
	
<!--댓글의 댓글  -->
		<c:if test="${dto.depth != 0}">
			 
			   <span style="text-indent: 30px;">
			   <img alt="" src="../img/reply.gif">
			     <p class="glyphicon glyphicon-user"> 
			       ${dto.writer}  |  ${dto.reg_date}  | 
		 <span class="reply" title="${count.count}"><img alt="" src="../img/reply.gif">답글
		 
		 </span></p>
		
		<p>${dto.contents}</p>	
		
		<!-- 글쓴이만 삭제 -->
		  <a href="../reply/replyDelete_2.reply?num=${dto.num}&&type=${dto.type}&&reviewNum=${dto.reviewNum}">
		 <img alt="" src="../images/main/delete.png" style="width: 80px; height: 30px;"></a> 
		</span>
		
			</c:if>
			
			
		
       <!-- 글쓴이만 -->     
         <!-- 수정 -->
		   <img alt="" src="../images/main/update.png" style="width: 80px; height: 30px;" title="${count.count}" class="update">
         <form action="../reply/replyUpdate.reply" method="post">
         <input type="hidden" value="${dto.type}" name="type">
          <input type="hidden" value="${dto.num}" name="num">
		  <input type="hidden" value="${dto.reviewNum}" name="reviewNum">
		  <div id="up${count.count}" style="display: none;">
		 <textarea  cols="115" rows="5" name="contents">${dto.contents}</textarea>
	    <button  id="btn1" class="btn btn-default">수정 완료</button>
		   </div>
		   </form>
		   


		
		 <!-- 답글 -->
		 
		 <div id="hide${count.count}" style="display: none;">
		 <form action="../reply/replyReple.reply" method="post">
		 <input type="hidden" value="${dto.type}" name="type">
		  <input type="hidden" value="${dto.num}" name="num">
		  <input type="hidden" value="${dto.reviewNum}" name="reviewNum">
		  <!-- writer -->
	   <input type="text" name="writer" placeholder="writer">
		 <textarea  cols="115" rows="5" name="contents" placeholder="댓글을 입력해주세요."></textarea>
		   <button  id="btn2" class="btn btn-default">글쓰기</button>
		   </form>
		   </div>

 
	
	
 </c:forEach>
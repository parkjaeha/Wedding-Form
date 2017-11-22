<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>

    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav2 {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
    
    .w3-bar{
margin : 0 auto;

text-align : center;
}
 

  </style>
</head>
<script type="text/javascript">
$(function(){
	$(".pw").click(function(){
		var title = $(this).attr('title');
		$("#hide"+title).slideToggle("slow");
	});
	
});

</script>
<body>
<div id="all">
 <c:import url="../../../temp/header.jsp"></c:import>
<div class="container-fluid" style="margin-top: 77px;">
  
  
  <div class="row content">
    <div class="col-sm-2 sidenav2" >
      <ul class="nav nav-pills nav-stacked" style="margin-left: 30px;">
      <li><h3 style="color: gray; margin-top : 50px;">Community</h3></li>
       <hr style="border: 1px #2096BA solid;">
       
       <c:if test="${board eq 'notice'}"> 
       <li class="active"><a href="${pageContext.request.contextPath}/notice/noticeList.notice">공지사항</a></li>
       <li><a href="${pageContext.request.contextPath}/qna/qnaList.qna">Q&A</a></li>
   </c:if>
  
   <c:if test="${board eq 'qna'}"> 
   <li><a href="${pageContext.request.contextPath}/notice/noticeList.notice">공지사항</a></li>
      <li class="active"><a href="${pageContext.request.contextPath}/qna/qnaList.qna">Q&A</a></li>
  </c:if>
       <li><a href="${pageContext.request.contextPath}/report/reportPage.report">신고 하기</a></li>
       <li><a href="${pageContext.request.contextPath}/review/reviewPage.review">이용 후기</a></li>
      </ul><br>
    </div>





    <div class="col-sm-9" style="margin-left:30px;">

     <table class="table table-hover" style="width: 100%;">




		<c:if test="${board eq 'notice'}"> 
		<h3 style="text-align: center; margin-top:50px;"><small>NOTICE</small></h3>
      <hr>
                 
				<tr style="color: white; background-color:#2096BA;"> 
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
					<h3 style="text-align: center; margin-top:50px;"><small>Q&A</small></h3>
      <hr>
					<tr style="color: white; background-color: #2096BA;">
						<td>NUM</td>
						<td>TITLE</td>
						<td>WRITER</td>
						<td>DATE</td>
						<td>HIT</td>
					</tr>
					<c:forEach items="${requestScope.list}" var="dto" varStatus="count">

						<tr>

							<td>${dto.num}</td>

							<td><c:catch>
			 						<c:forEach begin="0" end="${dto.depth-1}">
			                            <img alt="" src="../img/reply.gif">
		                   </c:forEach>
								</c:catch> 
								
								<!-- 관리자면 그냥보기, 회원이면 pw입력 페이지로 이동 --> 
								<c:if test="${dto.opencheck eq 'hide'}">
	              <span class="pw" title="${count.count}"><img alt="" src="../img/자물쇠.gif"> ${dto.title}</span>
	             
	              
	              <div id="hide${count.count}" style="display: none; margin-top: 10px;">
	             <form action="./qnaPwCheck.qna" method="post">
                  <input type="hidden" name="num" value="${dto.num}">
               <p><input id="password" type="password" name="password" placeholder="비밀번호 입력">
              <button class="btn btn-default">확인</button></p>
                     
                  </form>
	              </div>
								</c:if>
								
								
								
								 <c:if test="${dto.opencheck eq 'open'}">
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
			
			<!-- search -->
			<form name="frm" action="./${board}List.${board}" method="post">
				<select name="kind">
					<option value="title">TITLE</option>
					<option value="contents">CONTENTS</option>

				</select> <input type="text" id="search" name="search"> <input
					type="button" id="btn" class="btn btn-default" value="SEARCH">
			</form>



      <!-- 페이징 처리 -->
			<div class="w3-bar" style="margin : 0 auto;">
				
					
					<c:if test="${page.curBlock>1}">
					
						<a href="./${board}List.${board}?curPage=${page.startNum-1}" class="w3-button">«</a>
					</c:if>

					<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
						<a href="./${board}List.${board}?curPage=${i}" class="w3-button">${i}</a>
					</c:forEach>

					<c:if test="${page.curBlock < page.totalBlock}">
						<a	href="./${board}List.${board}?curPage=${page.lastNum+1}" class="w3-button">»</a>
					</c:if>
					
					

			



			</div>

			<a href="./${requestScope.board}Write.${requestScope.board}">
			<img alt="" src="../images/main/write.png" style="width: 80px; height: 30px;"></a>
	</div>
  
 </div>
      
    
          </div>
        </div>
      </div>
  
 


  <c:import url="../../../temp/footer.jsp"></c:import> 

</div>
</body>
</html>
    
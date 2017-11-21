<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
.contents { 
	float: left;
	margin: 0 auto;
	margin-bottom: 100px;
	margin-top: 150px;
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



.blank{
width: 100%;
height: 50px;
}

.container-fluid {

}


</style>

</head>
<script type="text/javascript">
/*search 버튼  */
$(function(){
	$("#btn").click(function(){
	 document.frm.submit();	
	});
	$(".pw").click(function(){
		var title = $(this).attr('title');
		$("#hide"+title).slideToggle("slow");
	});
	

});
</script>
<body>

    
<!-- main -->
	<div id="all">
 <c:import url="../../../temp/header.jsp"></c:import>
 
 <div id="blank"></div>
 <div class="container-fluid">

  <c:import url="../../../temp/sideMenu.jsp"></c:import>

	<div class="contents col-sm-9">

			<table class="table table-hover" style="width: 1000px;">




		<c:if test="${board eq 'notice'}"> 
                    <p style="text-align: center; font-size: 20px;margin-bottom: 30px;">NOTICE</p>
                 

    
			
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
					<p style="text-align: center; font-size: 20px;margin-bottom: 30px;">Q&A</p>
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
			<div class="w3-bar">
				
					
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

 <c:import url="../../../temp/footer.jsp"></c:import> 
 </div>
</body>
</html>





<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC>
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
.d{
	float: none;
	width:500px;
	height : 500px;
	margin: 0 auto;

	
}

#blank{
width: 50;
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

#star{
font-size:22px;
}
</style>

<script type="text/javascript">
	$(function(){
		 var num=${view.num};
		 var type='${view.type}';
		 
			$.ajax({
				type: "GET",
				url: "../reply/replyList.reply",
				data:{
					num : num ,
				    type : type
				},
				success:function(data){
					$("#result").html(data);
				}
			});
	});

</script>

</head>


<body>
<div id="blank"></div>
	<article class="write_1">${view.type}</article>
       <article class="write_2"></article>
<div class="d">
<p>TITLE : ${view.title}</p>
<p>DATE : ${view.reg_date}</p>
<p>HIT : ${view.hit}</p>

<p>STAR SCORE  
<div id="star">
<c:forEach begin="1" end="${view.star_score}" >
★
</c:forEach></p>
</div>
<p>WRTIER : ${view.writer}</p>
<p>CONTENTS : ${view.contents}</p>


				
	<a href="./reviewList.review?type=${view.type}&&curPage=1"><img alt="" src="../image/list.gif"></a>
	<a href="./reviewUpdate.review?num=${view.num}&&type=${view.type}"><img alt="" src="../image/su.gif"></a>

	<a href="./reviewDelete.review?num=${view.num}&&type=${view.type}"><img alt="" src="../image/delete.gif"></a>

	
	<div id=blank></div>
	
	
	

		
			
			<form action="../reply/replyWrite.reply?num=${view.num}" method="post">
		<input type="hidden" value="${view.type}" name="type">
	<table>
	<tr>
						<td colspan="2">----------------댓글---------------</td>
						</tr>
	<tr>
						
		
						 <td id="writer">WRITER : <input class="form-control" type="text" name="writer" placeholder="writer"></td>
					</tr>
					<tr>
					 	<td colspan="6" id="contents">CONTENTS : <textarea class="form-control" name="contents" placeholder="내용을 입력하세요."></textarea></td>
					</tr>
					
	
	</table>
	<button  class="btn btn-default">글쓰기</button>
	</form>
	
<div id=blank></div>

<div id="result">
<%-- 	<h1>LIST : ${list}</h1>
	 <c:forEach items="${requestScope.list}" var="dto">
	<p>------------------------------------------------------</p>
	<p>TITLE : ${dto.title}  WRITER : ${dto.writer}  DATE :  ${dto.reg_date} </p>
	<p>CONTENTS : ${dto.contents}</p>
	<p>------------------------------------------------------</p>
	 </c:forEach> --%>
</div>
	
	</div>
	

</body>
</html>
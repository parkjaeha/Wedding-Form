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
	width:1000px;
	height : 1000px;
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

#panel{
width: 1000px;
height: 80px;
}

#li{
width:970px;
border : 1px dotted gray;
margin: 0 auto;
}
#border{

border-bottom: 1px solid gray;
}
#t{
font-size: 30px;
text-align: center;
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
 <c:import url="../../../temp/header.jsp"></c:import>
<div id="blank"></div>
	<article class="write_1">${view.type}</article>
       <article class="write_2"></article>
<div class="d">
<div id="border"></div>
<p id="t">${view.title}</p>
<p>WRTIER : ${view.writer}</p>

<p> <div id="star">
<c:forEach begin="1" end="${view.star_score}" >
★
</c:forEach></p>
</div>
<p>DATE : ${view.reg_date} | HIT : ${view.hit}</p>
<div id="border"></div>
<p>CONTENTS : ${view.contents}</p>


				
	<a href="./reviewList.review?type=${view.type}&&curPage=1"><img alt="" src="../image/list.gif"></a>
	<a href="./reviewUpdate.review?num=${view.num}&&type=${view.type}"><img alt="" src="../image/su.gif"></a>

	<a href="./reviewDelete.review?num=${view.num}&&type=${view.type}"><img alt="" src="../image/delete.gif"></a>

	
	<div id=blank></div>
	<div id=blank></div>
	
	

		
	<div class="panel panel-default">		
			<form action="../reply/replyWrite.reply?num=${view.num}" method="post">
		<input type="hidden" value="${view.type}" name="type">
	
<!-- writer 는 hidden타입으로!!!! -->	
  <input type="text" name="writer" placeholder="writer">
  <p class="panel-body"> <textarea  cols="120" rows="5" name="contents" placeholder="내용을 입력하세요."></textarea>
  <button  class="btn btn-default">글쓰기</button></p>
	</form>
	
<!-- 댓글 -->
<div id="result"></div>
	
	</div>


	
	</div>
	
 <c:import url="../../../temp/footer.jsp"></c:import>
</body>
</html>
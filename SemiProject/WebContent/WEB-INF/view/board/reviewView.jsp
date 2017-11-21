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
	width:1100px;
	margin: 0 auto;
	margin-bottom: 100px;

	
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


#border{

border-bottom: 1px solid gray;
}
#t{
font-size: 20px;
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
	<div id="all">
	
 <c:import url="../../../temp/header.jsp"></c:import>
<div id="blank"></div>
<div class="d container" style="margin-top: 100px;">
	<article class="write_1">${view.type}</article>
       <article class="write_2"></article>
  
  <div class="panel panel-default">
   <div class="panel-body"  id="t">
<p>${view.title}</p>
</div>
</div>


  <div class="panel panel-default">
   <div class="panel-body">
<p>WRTIER : ${view.writer} | DATE : ${view.reg_date} | HIT : ${view.hit} </p>

 <div id="star">
<c:forEach begin="1" end="${view.star_score}" >
★
</c:forEach>
</div>

<p>${view.contents}</p>

</div>
</div>



	<a href="./reviewList.review?type=${view.type}&&curPage=1">
	<img alt="" src="../images/main/list.png" style="width: 80px; height: 30px;"></a>
	
	<!--글쓴이만  -->			
	<a href="./reviewUpdate.review?num=${view.num}&&type=${view.type}">
	<img alt="" src="../images/main/update.png" style="width: 80px; height: 30px;"></a>

	<a href="./reviewDelete.review?num=${view.num}&&type=${view.type}">
	<img alt="" src="../images/main/delete.png" style="width: 80px; height: 30px;"></a>
	
	

		
	<div class="container" style="margin-top: 200px;">		
			<form action="../reply/replyWrite.reply?num=${view.num}" method="post">
		<input type="hidden" value="${view.type}" name="type">
	
<!-- writer 는 hidden타입으로!!!! -->	
<div class="list-group">
   <input type="text" name="writer" placeholder="writer">
  <p class="list-group-item"> <textarea  cols="120" rows="5" name="contents" placeholder="댓글을 입력해주세요."></textarea>
  <button  id="btn" class="btn btn-default">글쓰기</button></p>
	</form>
	
<!-- 댓글 -->
<div id="result" class="list-group-item"></div>
	</div>
</div>


	

	
 </div>
 <c:import url="../../../temp/footer.jsp"></c:import>
</body>
</html>
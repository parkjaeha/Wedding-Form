<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.contents{
width: 1100px;
height: 300px;
margin: 0 auto;

}

.pw{
width:400px;
height:60px;
margin: 0 auto;
margin-top : 200px;

}
#password{
width: 150px;
height:30px;
}

.panel-body{
text-align: center;
}
</style>
<script type="text/javascript">
/*목록으로 돌아가기 (취소 버튼) */
$(function(){
	$("#btn").click(function(){
		location.href='./qnaList.qna';
		
	})
	
});
</script>
</head>
<body>
<c:import url="../../../temp/header.jsp"></c:import>

<div class="contents">
 <form action="./qnaPwCheck.qna" method="post">
<div class="pw panel panel-default">

 <input type="hidden" name="num" value="${param.num}">
 
<p class="panel-body"> 비밀번호 <input id="password" type="password" name="password">
 <button class="btn btn-default">확인</button>
 <input type="button" id="btn" value="취소" class="btn btn-default"></p>
</form>
</div>

</div>

<c:import url="../../../temp/footer.jsp"></c:import>
</body>
</html>
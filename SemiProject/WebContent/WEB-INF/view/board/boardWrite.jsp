<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
  
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
.board_1 {
	height: 34px;
	margin: 0 auto;
	text-align: center;
}

.board_2 {
	width: 70px;
	height: 30px;
	border-top: 1px solid black;
	margin: 0 auto;
}

.contents {
	width: 1100px;
	height:500px;
	float: none;
	margin: 0 auto;
}

#pw{
display: none;
}


#hide, #open{
width:20px;
height:15px;
}
input{
width:400px;
height: 30px;
} 

</style>


<script>
$(document).ready(function(){
	 $("[type='radio']").click(function(e){
		  var tar = $(':radio[name="opencheck"]:checked').val(); 
		   
		  if(tar=="hide"){  
		   $("#pw").show();  
		  } else{
			  $("#pw").hide(); 
		  }
		  
		 });
    
	});
</script>
</head>

<body>
<c:import url="../../../temp/header.jsp"></c:import>

  <div id="blank"></div>
 <div id="blank"></div>
 <c:if test="${board eq 'qna'}">
 <article class="board_1">Q&A</article>
         <article class="board_2"></article>
         </c:if>
         <c:if test="${board eq 'notice'}">
 <article class="board_1">NOTICE</article>
         <article class="board_2"></article>
         </c:if>
          <div id="blank"></div>
		<div class="contents">


			<form action="./${board}Write.${board}" method="post">
			<input type="hidden" name="num" value="${param.num}">
				
					
					 <c:if test="${board eq 'qna'}">
		
              <p>공개글 <input type="radio" name="opencheck" value="open" id="open" checked="checked"> 
                   비밀글 <input type="radio" name="opencheck" value="hide" id="hide"></p> 	 		
		<div id="pw">
              <p>PASSWORD  <input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요."><p></div></c:if>
	    
	      <p>WRITER    <input  type="text" name="writer" ></p>
			
	      <p>TITLE     <input type="text" name="title" ></p>
			
 
	     <p> CONTENTS     
	      <textarea cols="55" rows="10"name="contents" placeholder="내용을 입력하세요."></textarea>
			
			            <button class="btn btn-default">글쓰기</button></p>
				
		
				
			</form>
			
		
			</div>
			
			<c:import url="../../../temp/footer.jsp"></c:import>

</body>
</html>
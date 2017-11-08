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
.contents {
	width: 1100px;
	height: 1000px;
	float: none;
	margin: 0 auto;
}

.report_1 {
	height: 34px;
	margin: 0 auto;
	text-align: center;
}

.report_2 {
	width: 70px;
	height: 30px;
	border-top: 1px solid black;
	margin: 0 auto;
}

pre {
	width : 800px;
	height : 700px;
	 margin: 0 auto;
	 font-size: 18px;
	 background-color: #F9F9F9;
	
}


input{
width:400px;
height: 30px;
} 
</style>

</head>

<body>
 <c:import url="../../../temp/header.jsp"></c:import>
  <div id="blank"></div>
 <div id="blank"></div>
		<div class="contents">
<article class="report_1">신고하기</article>
         <article class="report_2"></article>
  <div id="blank"></div>
 <div id="blank"></div>
			<form action="./reportWrite.report" method="post">
			
		
			
			<pre>
			
			
	      ID           <input  type="text" name="id" >
			
	      PASSWORD     <input type="password" name="password" >
			
	      TITLE        <input type="text" name="title" >
	       
	      COMPANY      <input  type="text" name="company_name" >
			
	       
	      CONTENTS     
	      <textarea cols="55" rows="10"name="contents" placeholder="내용을 입력하세요."></textarea>
			
			            <button class="btn btn-default">글쓰기</button>
			</pre>	
		
				
			</form>
			
			</div>
 <c:import url="../../../temp/footer.jsp"></c:import>
</body>
</html>
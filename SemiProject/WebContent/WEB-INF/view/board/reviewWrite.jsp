<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
.contents{
	float: none;
	margin: 0 auto;
		width:500px;
	height : 500px;
	margin-bottom: 100px;
}

.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#5D5D5D;}




</style>

<script type="text/javascript">
/*별점  */
var star;
$(function(){
	
$( ".star_rating a" ).click(function() {
    $(this).parent().children("a").removeClass("on");
    $(this).addClass("on").prevAll("a").addClass("on");
/*  star = $(this).prop("name");
    alert(star); */
   $("#temp").prop("value",$(this).prop("name"));
    return false;
});



});

</script>
</head>
<body>
 <c:import url="../../../temp/header.jsp"></c:import>
<div class="contents">


			<h1>${param.type}</h1>
				<table class="table">
				
					 <form action="./reviewWrite.review?type=${param.type}" method="post"> 
					
						<tr>
						<td colspan="2">TITLE : <input class="form-control" type="text" name="title" placeholder="제목"></td>
						</tr>
						<tr>
						<td id="writer">WRITER : <input class="form-control" type="text" name="writer"></td>
					</tr>
					<tr>
					 	<td>Star Score 
					 	 <p class="star_rating">
					 	 <input type="hidden" id="temp" name="starscore">
                                  <a href="#" class="on" name="1">★</a>
                                  <a href="#" class="on" name="2">★</a>
                                  <a href="#" class="on"name="3">★</a>
                                  <a href="#" name="4">★</a>
                                  <a href="#" name="5">★</a>
                                
                                 </p>
                          </td>


					</tr>
					<tr>
					 	<td colspan="6" id="contents">CONTENTS : <textarea class="form-control" name="contents" placeholder="내용을 입력하세요."></textarea></td>
					</tr>
					<tr>
					 	<td>FILE UPLOAD<input type="file"></td>
					</tr>
					
				</table>

				<button id="btn">글쓰기</button>
				</form>
			
			</div>
 <c:import url="../../../temp/footer.jsp"></c:import>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <script type="text/javascript" src="./js/jquery.waterwheelCarousel.js"></script>

<style type="text/css">

.contents{
width: 1200px;
height: 800px;
margin: 0 auto;

}


 .img{
width: 1200px;
height: 450px;
margin: 0 auto;
} 

.mySlides {display:none;}

</style>

</head>
<body>
<c:import url="./temp/header.jsp"></c:import>

<!-- 메인 슬라이드 이미지 -->
<div class="contents">
<div class="img w3-display-container">
<img class="mySlides w3-animate-opacity" src="./img/wedding.jpg" style="width:100%; height:450px;">
<img class="mySlides w3-animate-opacity" src="./img/wedding4.jpg" style="width:100%;height:450px;">
<img class="mySlides w3-animate-opacity" src="./img/모바일.PNG" style="width:100%; height:450px;">

<img class="next w3-padding w3-display-left " src="./img/prev.png" onclick="plusDivs(1)">
<img class="next w3-padding w3-display-right" src="./img/next.png" onclick="plusDivs(-1)">
</div>
<script>
/* 메인 슬라이드 */
   var myIndex = 0;
  carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 3500); 
}    


 var slideIndex = 1;
  showDivs(slideIndex);

function plusDivs(n) {
	myIndex++;
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>
</div>
</div>
<c:import url="./temp/footer.jsp"></c:import>
</body>
</html>
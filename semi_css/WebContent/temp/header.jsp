<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script> 
$(document).ready(function(){
    $(".dropdown").click(function(){
        $(".dropdown-content").slideToggle("slow");
    });
});
</script>
<html>
<header>
<div class="bar">
<nav>
		<ul>
		   <li><a href="#">MY PAGE</a></li>
			<li><a href="#">JOIN </a></li>
			<li><a href="#">LOGIN </a></li>
	        <li><a href="#"><img alt="" src="${pageContext.request.contextPath}/img/home.png">HOME </a></li>
			
		
			<!--로그인 했을때  
			<li><a href="#">MYPAGE</a></li>
			<li><a href="#">LOGOUT</a></li> -->
		
		
		</ul>
		</nav>

</div>
<div class="logo">
<a href="${pageContext.request.contextPath}/index.jsp"><img alt="" src="${pageContext.request.contextPath}/img/aaa.png"></a>
</div>
<div class="top_menu">
<p class="dropdown"><a href="#"><img alt="" src="${pageContext.request.contextPath}/img/menu.png">MENU</a></p>
<div class="dropdown-content">
<div id="blank"></div>
<article class="hiden">

      <p><a href="#">INVITATION > </a></p>
        <div id="line"></div>  
     <div id="blank"></div>
   <p> <a href="#">청첩장 </a></p>
  <p><a href="#">모바일 청첩장</a></p>  
  
 </article>
 
<article class="hiden">

      <p><a href="#">WEDDING > </a></p>
     	<div id="blank"></div>
  <p><a href="#">웨딩홀 </a></p> 
  <p><a href="#">하우스 웨딩 </a></p>  
  <p><a href="#">작은 결혼식 </a></p>

 </article>
 <article class="hiden">
 
       <p><a href="#">COMMUNITY > </a></p>   
     <div id="blank"></div>
  <p><a href="#">공지사항 </a></p> 
 <p> <a href="#">Q&A </a></p> 
  <p><a href="#">실시간 상담 </a></p>
  <p><a href="#">신고하기 </a></p>  
  <p><a href="#">리뷰 </a></p>
   
 </article>
 <article class="hiden">

       <p><a href="#">MY PAGE > </a></p>    
      <div id="blank"></div>
  <p><a href="#">예약현황 </a></p> 
  <p><a href="#">내 정보 </a> </p>  

 
 </article>
    </div> 


</div>
</header>
</html>

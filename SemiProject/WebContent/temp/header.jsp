<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script type="text/javascript">
 
	function openNav() {
	    document.getElementById("mySidenav").style.width = "250px";
	    document.getElementById("all").style.marginLeft = "250px";
	}

	function closeNav() {
	    document.getElementById("mySidenav").style.width = "0";
	    document.getElementById("all").style.marginLeft= "0";
	}
 
  $(function(){
	  $("#c1").click(function(){
		 $("#h1").slideToggle("slow"); 
	  });
	  $("#c2").click(function(){
			 $("#h2").slideToggle("slow"); 
		  });
	  $("#c3").click(function(){
			 $("#h3").slideToggle("slow"); 
		  });
	  $("#c4").click(function(){
			 $("#h4").slideToggle("slow"); 
		  });
	  
  })
  </script>
  <html>

<body>
<!-- side menu 시작 -->
	<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
 <a href="#" id="c1">청첩장</a>
  <div id="h1" style="display: none; ">
   <a href="#" > 청첩장</a>
    <a href="#" > 모바일 청첩장</a>
    </div>
    
     <a href="#" id="c2">Wedding</a>
  <div id="h2" style="display: none; ">
   <a href="#" > 웨딩홀</a>
    <a href="#" > 하우스 웨딩</a>
    <a href="#" > 작은 결혼식</a>
    </div>
    
     <a href="#" id="c3">Community</a>
  <div id="h3" style="display: none; ">
   <a href="${pageContext.request.contextPath}/notice/noticeList.notice" > 공지사항</a>
    <a href="${pageContext.request.contextPath}/qna/qnaList.qna" > Q&A</a>
    <a href="#" > 실시간 상담</a>
    <a href="${pageContext.request.contextPath}/report/reportPage.report" > 신고하기</a> 
    <a href="${pageContext.request.contextPath}/review/reviewPage.review" > 리뷰</a> 
    </div>
    

  <a href="#" id="c4">My Page</a>
  <div id="h4" style="display: none; ">
   <a href="#" > (회원)예약현황</a>
    <a href="#" > (회원)내 정보</a>
    <a href="#" > (업체)예약 현황</a>
    <a href="#" > (업체)내 정보</a> 
    <a href="#" > (관리자)블랙리스트</a> 
    </div>
</div>

<script type="text/javascript">

</script>


<!--side menu 끝  -->

<!-- header -->
<nav  class="navbar navbar-inverse" style="margin-bottom: 0px; background-color:#212121;border: 0; position: fixed; top: 0; z-index: 3; width: 100%;">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>

    </div>

    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="${pageContext.request.contextPath}/main.jsp"><span class="glyphicon glyphicon-home"></span> HOME</a></li>
        <li><a href="#" onclick="openNav()"><span class="glyphicon glyphicon-menu-hamburger"></span> MENU</a></li>
        <li><a href="./index.jsp"><span class="glyphicon glyphicon-briefcase"></span> ABOUT</a></li>
        <li><a href="./common/commonJoinUp.common"><span class="glyphicon glyphicon-user"></span> JOIN</a></li>
        
        <c:if test="${empty sessionScope.common}">
	 <li><a href="./common/commonLogin.common"><span class="glyphicon glyphicon-log-in"></span> LOGIN</a></li>
</c:if>
<c:if test="${not empty sessionScope.common}">
	   <li><a href="${pageContext.request.contextPath}/common/commonLogout.common"><span class="glyphicon glyphicon-log-in"></span> LOGOUT</a></li></c:if>
      </ul>

    </div>
 
  </div>
</nav><!-- header 끝 -->

</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">

.contents{
width:1100px;
margin: 0 auto;
margin-bottom: 100px;
}

</style>

</head>
<script type="text/javascript">
$(function(){
	$("#invitation").click(function(){
		$("#hiden").slideToggle("slow")
	});
	
	$("#wedding_hall").click(function(){
		$("#hiden2").slideToggle("slow")
	});
});
</script>
<body>

    
<!-- main -->
	<div id="all">
 <c:import url="../../../temp/header.jsp"></c:import> 
 <div id="blank"></div>
 <div id="blank"></div>

		

 
<div class="contents">


 

<!--청첩장 best review  -->
<div class="container ">
    <h2>청첩장 Review BEST <a href="./reviewList.review?type=invitation&&curPage=1">+더보기</a></h2>
 <div class="panel panel-default" >
    <div class="panel-body" style="margin-top: 100px;">
   <div id="blank"></div> 
  
      <p id="invitation"><img alt="" src="../img/invitation.jpg">  
      심플해서 더 맘에들었던 청첩장! 
     <img alt="" src="../img/ico_photo.gif"></p>
      <div id="blank"></div>
     <div id="hiden" style="display: none;">
      <div id="blank"></div>
     <img alt="" src="../img/invitation_2.JPG">
      <div id="blank"></div>
     <p>어른들에게 돌릴 청첩장이라 깔끔하면서도 심플한 디자인을 찾았었거든요.<br>
   이 디자인은 심플하면서도 리본끈이있어서 신경쓴 느낌을 동시에 주기에 저흰 이 청첩장으로 제작했어요.<br>
   리본끈때문에 손이 두번가지만 그래도 이뻐서 만족합니다.♡<br>
   추가적으로 받은 식권 디자인도 넘 맘에들구요 ㅎ.ㅎ<br>
   청첩장 다 접으면 모바일 청첩장 제작할 생각입니다.</p>
     </div>
  </div>
  </div>
</div>

<!-- 웨딩홀 best review  -->
<div class="container">
   <h3> 웨딩홀 Review BEST 
    <a href="./reviewList.review?type=wedding_hall&&curPage=1">+더보기</a></h3>
<div class="panel panel-default" style="max-width:1200px; margin : 0 auto;margin-bottom: 50px;">
     <div class="panel-body" style="margin-top: 100px;">
   <div id="blank"></div> 

  <p id="wedding_hall">  <img alt="" src="../img/wedding_hall.jpg">
          강동웨딩홀 노빌리티웨딩홀 후기!
     <img alt="" src="../img/ico_photo.gif"></p>
     <div id="blank"></div> 
    <div id="hiden2" style="display: none;">
      <div id="blank"></div>
     <img alt="" src="../img/wedding_hall2.jpg">
      <div id="blank"></div>

     <p>강동웨딩홀 노빌리티웨딩홀 후기입니다.<br>

       얼마전에 강동구청역 3번출구 근처에 있는 강동구 웨딩홀 이예요!<br>
      강동구 노빌리티웨딩홀 분위기가 차분하고 고급스러운 분위기!! 채플웨딩느낌났어요!<br>
      노빌리티웨딩홀 연회장은 굉장히 넓고 쾌적하고 깔끔했어요!<br>
     무엇보다 제일 큰 장점은 강동구청역 3번출구에서<br>
      도보로 3~5분 정도라 엄청 가까웠어요!<br>
     주차는 건물 주차 80분 무료주차 400대 주차가능한
    강동웨딩홀이었어요~~<br>
    직원분들이 모두 웃으시면서 잘 대해주셔서 넘 좋았네요~</p>
     </div> 
    </div>
    
    </div>
  </div>

</div>

</div>

 <c:import url="../../../temp/footer.jsp"></c:import>


 </div>
 
</body>
</html>
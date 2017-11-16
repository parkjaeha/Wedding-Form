<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #2096BA;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: white;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover {
    color: black;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

#main {
    transition: margin-left .5s;
    padding: 16px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

#h a{
font-size: 18px;
}
</style>

</head>
<body>
 	 
<!-- side menu -->
	<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

  <a href="#" id="c">My Page</a>
  <div id="h">
    <!-- 회원일 경우-->
  <a href="#">(회원)예약현황 </a>
  <a href="#">(회원)내 정보 </a>
  <!-- 업체일경우 --> 
  <a href="#">(업체)예약현황 </a>
  <a href="#">(업체)내 정보  </a>   
  <!-- 관리자일경우 -->
  <a href="#">(관리자)청첩장 예약 현황</a>
  <a href="#">(관리자)블랙리스트 관리</a> 
    </div>
</div>
<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
}
</script>
</body>
</html>
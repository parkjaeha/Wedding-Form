<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">


.contents{
width: 1100px;
height: 600px;
margin: 0 auto;
margin-top : 100px;

}
 #box{
width: 500px;
height: 400px;
margin: 0 auto;


} 

 a:hover{
color : gray;

}

</style>
</head>
<body>
 	 <c:import url="../../../temp/sideMenu.jsp"></c:import>
 <c:import url="../../../temp/header.jsp"></c:import>
 <div id="blank"></div>
 <div id="blank"></div>

<div class="main">
<div class="contents">
  <a onclick="openNav()">Community</a>
<a href="./reportWrite.report"><div id="box">
<img alt="" src="../img/report.png">
</div></a>
</div>

 <c:import url="../../../temp/footer.jsp"></c:import>
 </div>
</body>
</html>
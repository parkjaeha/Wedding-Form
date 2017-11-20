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
margin-top : 200px;

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



<div id="all">
 <c:import url="../../../temp/header.jsp"></c:import>
<div class="contents">
 
<a href="./reportWrite.report"><div id="box">
<img alt="" src="../images/report/report.png">
</div></a>
</div>

 <c:import url="../../../temp/footer.jsp"></c:import>
 </div>
</body>
</html>
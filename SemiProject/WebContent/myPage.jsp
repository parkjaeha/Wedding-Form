<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.contents{
width : 1100px;
margin: 0 auto;
margin-top: 150px;
}

</style>
</head>

<body> 
<div id="all">
 <c:import url="./temp/header.jsp"></c:import>
<div class="contents"  >
<h2>My Page</h2>
  
  <pre style="margin: 0 auto; width: 1100px;  margin-top:30px; margin-bottom: 100px; font-size: 15px;">
  
  ID 
  
  NAME 
  
  PASSWORD
   
  ADDRESS 
  
  PHONE 
  
  E-MAIL
  
  
  </pre>
  
</div>
<c:import url="./temp/footer.jsp"></c:import>
</div>
</body>
</html>
    
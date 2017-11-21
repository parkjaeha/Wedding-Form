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
.container{
margin: 0 auto;
margin-top: 100px;
}

</style>
</head>

<body> 
<div id="all">
 <c:import url="./temp/header.jsp"></c:import>
<div class="container">
  <h2>My Page</h2>
  <div class="panel panel-default">
    <div class="panel-body">ID</div>
    <hr>
     <div class="panel-body">NAME</div>
     <hr>
     <div class="panel-body">PASSWORD</div>
     <hr>
     <div class="panel-body">ADDRESS</div>
     <hr>
     <div class="panel-body">PHONE</div>
     <hr>
     <div class="panel-body">E-MAIL</div>
  </div>
</div>
<c:import url="./temp/footer.jsp"></c:import>
</div>
</body>
</html>
    
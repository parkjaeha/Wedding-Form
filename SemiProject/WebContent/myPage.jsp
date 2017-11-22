<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">

   @media screen and (max-width: 767px) {
      .sidenav2 {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }


</style>
</head>
<body>



<div id="all">
 <c:import url="./temp/header.jsp"></c:import>
<div class="container-fluid" style="margin-top: 77px;">
  
  
  <div class="row content">
    <div class="col-sm-2 sidenav2" >
      <ul class="nav nav-pills nav-stacked" style="margin-left: 30px;">
      <li><h3 style="color: gray; margin-top : 50px;">My Page</h3></li>
       <hr style="border: 1px #2096BA solid;">
        <li class="active"><a href="#">(회원)예약 현황</a></li>
        <li><a href="#">(회원)정보</a></li>
        <li><a href="#">(업체)예약 현황</a></li>
       <li><a href="#">(업체)정보</a></li>
       <li><a href="#">블랙 리스트</a></li>
       <li><a href="#">청첩장 예약 현황</a></li>
      </ul><br>
    </div>





    <div class="col-sm-9" style="margin-left:30px;">
 <div class="container" style="margin-top: 90px; ">

  <table class="table">
    <thead>
      <tr>
        <th style="width: 150px;">내 정보</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>ID</td>
        <td>Doe</td>
 
      </tr>
      <tr>
        <td>NAME</td>
        <td>Moe</td>
  
      </tr>
      <tr>
        <td>ADDRESS </td>
        <td>Dooley</td>
    
      </tr>
      
        <tr>
        <td>PHONE </td>
        <td>Dooley</td>
    
      </tr>
      
        <tr>
        <td>E-MAIL </td>
        <td>Dooley</td>
    
      </tr>
    </tbody>
  </table>
  
  
  
  <table class="table" style="margin-top: 100px;">
    <thead>
      <tr>
        <th style="width: 150px;">+추가 정보</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>ID</td>
        <td>Doe</td>
 
      </tr>
      <tr>
        <td>NAME</td>
        <td>Moe</td>
  
      </tr>
      <tr>
        <td>ADDRESS </td>
        <td>Dooley</td>
    
      </tr>
      
        <tr>
        <td>PHONE </td>
        <td>Dooley</td>
    
      </tr>
      
        <tr>
        <td>E-MAIL </td>
        <td>Dooley</td>
    
      </tr>
    </tbody>
  </table>

</div>
 
  



</div>
 </div>
 </div>
 <c:import url="./temp/footer.jsp"></c:import>
 </div>
</body>
</html>
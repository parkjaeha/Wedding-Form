<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

   <link href="./css/header.css" rel="stylesheet">
  <meta charset="utf-8">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  

  <style type="text/css">
 
#main {
    transition: margin-left .5s;
    padding: 16px;
}

  
.carousel-inner img {
 width: 100%; /* Set width to 100% */
  height: 200px;
 } 
 /* Hide the carousel text when the screen is less than 600 pixels wide */
 @media (max-width: 600px) {
  .carousel-caption {
   display: none; 
 }
 }
 
 </style>
 
 
</head>
<body>


<div id="all">
<c:import url="./temp/header.jsp"></c:import>

<!-- main 이미지 -->

<div class="container" style=" width: 100%;">
<div class="row">
  <div class="col-sm-13">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img src="./images/main/weddingMain_1.jpg" alt="Image" style="height:600px;">
           
        </div>
         <div class="item">
          <img src="./images/main/모바일청첩장.jpg" alt="Image" style=" height:600px;">
      
        </div>

        <div class="item">
          <img src="./images/main/weddingMain_2.jpg" alt="Image" style=" height:600px;">
      
        </div>
        
      </div>

      <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>
 
</div>
<hr>
</div><!--main 이미지 끝  -->


<div class="container text-center">    
  <h3>What We Do</h3>
  <br>
  <div class="row">
    <div class="col-sm-6">
    <div class="well" style="height: 100px; width: 550px;">
       <p>Some text..</p>
      </div>

    </div>
    
     <div class="col-sm-6">
    <div class="well" style="height: 100px; width: 550px;">
       <p>Some text..</p>
      </div>

    </div>
    </div>
   
    

</div>

<c:import url="./temp/footer.jsp"></c:import>
</div>
</body>
</html>
    
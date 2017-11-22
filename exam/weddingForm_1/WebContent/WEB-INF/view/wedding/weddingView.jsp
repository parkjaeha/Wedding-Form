<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href='https://fonts.googleapis.com/css?family=Caesar Dressing' rel='stylesheet'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<script type="text/javascript">
	window.onload = function() {
		
		var navbar = document.getElementById("navbar");
		var sticky = navbar.offsetTop;

		window.onscroll = function() { scrollFunction() };
	
		function scrollFunction() {
			if (window.pageYOffset >= sticky) {
			    navbar.classList.add("sticky")
			  } else {
			    navbar.classList.remove("sticky");
			  }
		}
	}
	
	
	
	function changeActive(index) {
		var link = document.getElementsByClassName("nav-link");
		
		for(var i=0; i<link.length; i++) {
			link[i].setAttribute("class", "nav-link");
			if(i == index) {
				link[i].setAttribute("class", "nav-link active");
				var title = link[i].getAttribute('title');
				if(i == 0) {
					location.href="./weddingView.wedding";
				} else {
					if(i == index) {
						ajaxFunc(title) // ajax
					} 
				}
			}
		}
		
	}
	
	function ajaxFunc(name) {
		$.ajax({
			url: "./weddingView.wedding",
			type: "POST",
			data: {
				type: name
			},
			success: function(data) {
				$("#result").html(data);
			}
		});
	}
	
	function openModal() {
		document.getElementById('myModal').style.display = "block";
	}
	
	function closeModal() {
		document.getElementById('myModal').style.display = "none";
	}
	
	var slideIndex = 1;
	showSlides(slideIndex);
	
	function plusSlides(n) {
		showSlides(slideIndex += n);
	}
	
	function currentSlide(n) {
		showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("demo");
		var captionText = document.getElementById("caption");
		if (n > slides.length) {slideIndex = 1}
		if (n < 1) {slideIndex = slides.length}
		for (i = 0; i < slides.length; i++) {
		    slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
		    dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex-1].style.display = "block";
		dots[slideIndex-1].className += " active";
		captionText.innerHTML = dots[slideIndex-1].alt;
	}
</script>

<style type="text/css">

/* The Modal (background) */
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  padding-top: 100px;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: black;
}

/* Modal Content */
.modal-content {
  position: relative;
  background-color: #fefefe;
  margin: auto;
  padding: 0;
  width: 90%;
  max-width: 1200px;
}

/* The Close Button */
.close {
  color: white;
  position: absolute;
  top: 10px;
  right: 25px;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #999;
  text-decoration: none;
  cursor: pointer;
}

.mySlides {
  display: none;
}

.cursor {
  cursor: pointer
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

img {
  margin-bottom: -4px;
}

.caption-container {
  text-align: center;
  background-color: black;
  padding: 2px 16px;
  color: white;
}

.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}

img.hover-shadow {
  transition: 0.3s
}

.hover-shadow:hover {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)
}
</style>

<style type="text/css">
	._header {
		text-align: center;
    	padding: 20px;
	}
	
	/* Create four equal columns that floats next to each other */
	._column {
	    float: left;
	    width: 33%;
	    padding: 10px;
	}
	
	._column img {
	    margin-top: 12px;
	}
	
	._row {
	
	}
	
	/* Clear floats after the columns */
	._row:after {
	    content: "";
	    display: table;
	    clear: both;
	}
	
	/* Responsive layout - makes a two column-layout instead of four columns */
	@media (max-width: 800px) {
	    ._column {
	        width: 50%;
	    }
	}
	
	/* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
	@media (max-width: 600px) {
	    ._column {
	        width: 100%;
	    }
	}

	.margin01 {
		margin-top: 60px;
	}
	
	.img_box  {
		position: relative;
		background-image: url('../image/house/house.jpg');
		background-position: top;
		background-repeat: no-repeat;
		background-size: cover;
		min-height: 300px;
		
	}
	
	.title {
		position: absolute;
	    top: 0;
	    color: #f1f1f1;
	    width: 100%;
	    padding: 20px 20px 0 20px;
	}
	
	.title h1 {
		float: left;
		font-family: 'Caesar Dressing';
		font-size: 50px;
		margin: 0;
	}
	
	.title p {
		clear: both;
		margin-top: 0px;
		margin-left: 30px;
		font-family: sans-serif;
		font-size: 18px
	}
	
	.title p span {
		padding-left: 5px;
		font-size: 11px;
	}
	
	#navbar {
		overflow: hidden;
		background-color: #fff;
	}

	#navbar a {
		float: left;
		display: block;
		color: #2096BA;
		text-align: center;
		padding: 14px 16px;
		text-decoration: none;
		font-size: 17px;
	}
	
	#navbar a:hover {
		border: 1px solid #2096BA;
		font-weight: bold;
	}
	
	#navbar a.active {
		background-color: #2096BA;
		color: white;
	}
	
	.content {
		padding: 16px;
	}
	
	.sticky {
		position: fixed;
		top: 0;
		width: 100%;
		z-index: 3;
	}
	
	.sticky + .contents {
		padding-top: 60px;
	}
	
	.card {
		display: inline-block;
		width: 320px;
		text-align: center;
	}
	
	.bgColor {
		margin-top: 20px;
		background-color: #F5F5DC;
	}
	
	.line {
	line-height: 60px;
	}
	
	.imgBox {
		max-width: 1400px;
		margin: auto;
	}
	
	.sub_title {
		padding: 20px 10px;
		border-bottom: 2px solid black;
		font-size: 30px;
		font-weight: bold;
	}
	
</style>

</head>
<body>

	<div class="container">
		<div class="img_box">
			<div class="title">
				<h1>House Wedding</h1>
				<p>
					나만의 특별한 웨딩을 꿈꾸는 당신을 위해...<br>
					<span>웨딩홀 정보포털 웨딩폼이 최고의 하우스웨딩을 추천합니다</span>				
				</p>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div id="navbar">
			<a class="nav-link active" onclick="changeActive(0)" title="하우스웨딩">하우스웨딩</a>
			<a class="nav-link" onclick="changeActive(1)" title="호텔웨딩">호텔웨딩</a>
			<a class="nav-link" onclick="changeActive(2)" title="야외웨딩">야외웨딩</a>
			<a class="nav-link" onclick="changeActive(3)" title="전통혼례">전통혼례</a>
		</div>
	</div>
	
	<div class="container margin01" style="text-align: center;">
		<img src="../image/house/house_info.PNG">
	</div>
	
	<div id="result" class="margin01">
		<div class="container">
		
			<!-- Header -->
			<div class="_header">
			  <h1>하우스 웨딩 갤러리</h1>
			  <p>아름다운 하우스 웨딩 사진들을 감상해보세요!</p>
			</div>
	
			<!-- Photo Grid -->
			<div class="_row"> 
				<div class="_column">
					<img src="../image/house/hotel/hotel_1.jpg" style="width:100%" onclick="openModal();currentSlide(1)">
					<img src="../image/house/hotel/hotel_2.jpg" style="width:100%" onclick="openModal();currentSlide(2)">
					<img src="../image/house/hotel/hotel_3.jpg" style="width:100%" onclick="openModal();currentSlide(3)">
					<img src="../image/house/hotel/hotel_4.jpg" style="width:100%" onclick="openModal();currentSlide(4)">
					<img src="../image/house/hotel/hotel_5.jpg" style="width:100%" onclick="openModal();currentSlide(5)">
					<img src="../image/house/hotel/hotel_6.jpg" style="width:100%" onclick="openModal();currentSlide(6)">
				</div>
				<div class="_column">
					<img src="../image/house/outdoor/outdoor_1.jpg" style="width:100%" onclick="openModal();currentSlide(8)">
					<img src="../image/house/outdoor/outdoor_2.jpg" style="width:100%" onclick="openModal();currentSlide(9)">
					<img src="../image/house/outdoor/outdoor_3.jpg" style="width:100%" onclick="openModal();currentSlide(10)">
					<img src="../image/house/outdoor/outdoor_4.jpg" style="width:100%" onclick="openModal();currentSlide(11)">
					<img src="../image/house/outdoor/outdoor_5.jpg" style="width:100%" onclick="openModal();currentSlide(11)">
				</div>  
				<div class="_column">
					<img src="../image/house/tradition/tradition_1.jpg" style="width:100%" onclick="openModal();currentSlide(12)">
					<img src="../image/house/tradition/tradition_2.jpg" style="width:100%" onclick="openModal();currentSlide(13)">
					<img src="../image/house/tradition/tradition_3.jpg" style="width:100%" onclick="openModal();currentSlide(14)">
					<img src="../image/house/tradition/tradition_4.jpg" style="width:100%" onclick="openModal();currentSlide(15)">
					<img src="../image/house/tradition/tradition_5.jpg" style="width:100%" onclick="openModal();currentSlide(16)">
					<img src="../image/house/tradition/tradition_6.jpg" style="width:100%" onclick="openModal();currentSlide(17)">
				</div>
			</div>
		</div>
		
		<div id="myModal" class="modal">
		  <span class="close cursor" onclick="closeModal()">&times;</span>
		  <div class="modal-content">
		
			<c:forEach begin="1" end="6" varStatus="count">
			    <div class="mySlides">
			      <div class="numbertext">${count.count} / 17</div>
			      <img src="../image/house/hotel/hotel_${count.count}.jpg" style="width:100%">
			    </div>
			</c:forEach>
			
			<c:forEach begin="1" end="5" varStatus="count">
			    <div class="mySlides">
			      <div class="numbertext">${count.count+6} / 17</div>
			      <img src="../image/house/outdoor/outdoor_${count.count}.jpg" style="width:100%">
			    </div>
			</c:forEach>
			
			<c:forEach begin="1" end="6" varStatus="count">
			    <div class="mySlides">
			      <div class="numbertext">${count.count+11} / 17</div>
			      <img src="../image/house/tradition/tradition_${count.count}.jpg" style="width:100%">
			    </div>
			</c:forEach>
		
		    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
		    <a class="next" onclick="plusSlides(1)">&#10095;</a>
		
		  </div>
		</div>
		
	</div>

</body>
</html>
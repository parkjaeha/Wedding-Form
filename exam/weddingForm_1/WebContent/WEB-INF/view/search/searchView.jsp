<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	
	<style type="text/css">
		body {
			min-height: 1000px;
		}
		.mySlides {
			display: none
		}
		
		/* Slideshow container */
		.slideshow-container {
			max-width: 1000px;
			position: relative;
			margin: auto;
		}
		
		/* Next & previous buttons */
		.prev, .next {
			cursor: pointer;
			position: absolute;
			top: 50%;
			width: auto;
			padding: 16px;
			margin-top: -22px;
			color: white;
			font-weight: bold;
			font-size: 18px;
			transition: 0.6s ease;
			border-radius: 0 3px 3px 0;
		}
		
		/* Position the "next button" to the right */
		.next {
			right: 0;
			border-radius: 3px 0 0 3px;
		}
		
		/* On hover, add a black background color with a little bit see-through */
		.prev:hover, .next:hover {
			background-color: rgba(0, 0, 0, 0.8);
		}
		
		/* Caption text */
		.text {
			color: #f2f2f2;
			font-size: 15px;
			padding: 8px 12px;
			position: absolute;
			bottom: 8px;
			width: 100%;
			text-align: center;
		}
		
		/* Number text (1/3 etc) */
		.numbertext {
			color: #f2f2f2;
			font-size: 12px;
			padding: 8px 12px;
			position: absolute;
			top: 0;
		}
		
		/* The dots/bullets/indicators */
		.dot {
			cursor: pointer;
			height: 15px;
			width: 15px;
			margin: 0 2px;
			background-color: #bbb;
			border-radius: 50%;
			display: inline-block;
			transition: background-color 0.6s ease;
		}
		
		.active, .dot:hover {
			background-color: #717171;
		}
		
		/* Fading animation */
		.fading {
		  -webkit-animation-name: fade;
		  -webkit-animation-duration: 1.5s;
		  animation-name: fade;
		  animation-duration: 1.5s;
		}
		
		@-webkit-keyframes fade {
		  from {opacity: .4} 
		  to {opacity: 1}
		}
		
		@keyframes fade {
		  from {opacity: .4} 
		  to {opacity: 1}
		}
		
		/* On smaller screens, decrease text size */
		@media only screen and (max-width: 300px) {
		  .prev, .next,.text {font-size: 11px}
		}
	</style>
	
	
	<style type="text/css">
		.container {
			margin-top: 20px;
		}
	
		.navbar {
			margin-top: 10px;
			padding: 5px;
			border-top: 1px solid black;
			border-bottom: 0.5px solid lightgray;
		}
		
		.imageBox {
			height: 500px;
			border: 1px solid lightgray;
			padding: 30px 10px;
		}
		
		.imageBox img {
			height: 400px;
		}
		
		.inherit {
			width: inherit;
			margin-top: 25px;
			border-top: 1px solid lightgray;
			border-bottom: 1px solid lightgray;
		}
		
		.inherit td {
			padding: 5px;
		}
		
		.inherit td:first-child {
			text-align: left;
			font-weight: bold;
		}
		
		.inherit td:last-child {
			text-align: right;
		}
		
		.textCenter {
			text-align: center;
		}
	</style>
	
	<style>
	/* The Modal (background) */
	.modal {
	    display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Sit on top */
	    padding-top: 100px; /* Location of the box */
	    left: 0;
	    top: 0;
	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    overflow: auto; /* Enable scroll if needed */
	    background-color: rgb(0,0,0); /* Fallback color */
	    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content */
	.modal-content {
	    background-color: #fefefe;
	    margin: auto;
	    padding: 20px;
	    border: 1px solid #888;
	    width: 80%;
	}
	
	/* The Close Button */
	.closer {
	    color: #aaaaaa;
	    float: right;
	    font-size: 28px;
	    font-weight: bold;
	    text-align: right;
	}
	
	.closer:hover,
	.closer:focus {
	    color: #000;
	    text-decoration: none;
	    cursor: pointer;
	}
	</style>
	
<title>Insert title here</title>
</head>
<body>
	
	<div class="container navbar">
		<h3>${view.hall_name}</h3>
		<span>${view.region}</span>
	</div>
	
	<!-- -----------------사진 동적으로 바꾸기 & dot 동적으로 바꾸기------------------------------------------  -->
	<div class="container imageBox">
		<div class="slideshow-container">
			<div class="mySlides fading">
				<div class="numbertext">1 / 3</div>
				<img src="../image/hall/sample_1.jpg" style="width: 100%">
				<div class="text">wedding_sample one</div>
			</div>
	
			<div class="mySlides fading">
				<div class="numbertext">2 / 3</div>
				<img src="../image/hall/sample_2.jpg" style="width: 100%">
				<div class="text">wedding_sample Two</div>
			</div>
	
			<div class="mySlides fading">
				<div class="numbertext">3 / 3</div>
				<img src="../image/hall/sample_3.jpg" style="width: 100%">
				<div class="text">wedding_sample Three</div>
			</div>
	
			<a class="prev" onclick="plusSlides(-1)">&#10094;</a> 
			<a class="next" onclick="plusSlides(1)">&#10095;</a>
		</div>
	
		<br>

		<div id="create_dot" style="text-align: center">
			<!-- <span class="dot" onclick="currentSlide(1)"></span> 
			<span class="dot" onclick="currentSlide(2)"></span> 
			<span class="dot" onclick="currentSlide(3)"></span> -->
		</div>

		<script>
			$(function() {
				
			});
		
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
			  var dots = document.getElementsByClassName("dot");
			  if (n > slides.length) {slideIndex = 1}    
			  if (n < 1) {slideIndex = slides.length}
			  for (i = 0; i < slides.length; i++) {
			      slides[i].style.display = "none";  
			  }
			  for (i = 0; i < dots.length; i++) {
			      dots[i].className = dots[i].className.replace("active", "");
			  }
			  slides[slideIndex-1].style.display = "block";  
			  dots[slideIndex-1].className += " active";
			}
		</script>
	</div>
	
	<div class="container">
			<h3 style="text-align: right;">기본정보</h3>
			<table class=".table inherit">
				<tr>
					<td>홀타입:</td>
					<td><span>${view.type}</span></td>
				</tr>
				
				<tr>
					<td>인근지하철:</td>
					<td><span>${view.subway}</span></td>
				</tr>
				
				<tr>
					<td>식사메뉴: </td>
					<td><span>${view.meal_menu}</span></td>
				</tr>
				
				<tr>
					<td>식사가격:</td>
					<td><span>${view.meal_cost}</span></td>
				</tr>
				
				<tr>
					<td>방문객: </td>
					<td><span>${view.visitor}</span></td>
				</tr>
				
				<tr>
					<td>홀가격: </td>
					<td><span>${view.hall_cost}</span></td>
				</tr>
			</table>
		</div>
		
		<div class="container textCenter">
			<button id="myBtn" class="btn btn-primary">예약하기</button>
			<button class="btn btn-primary">예약현황</button>
			<button id="list_btn" class="btn btn-primary">목록으로</button>
		</div>
		
		
		<!-- The Modal -->
		<div id="myModal" class="modal">
		
		  <!-- Modal content -->
		  <div class="modal-content">
		    <span class="closer">&times;</span>
		    <h3>상담신청</h3>
		    <form action="../reservation/reservationInsert.reservation" method="post">
		    <input type="hidden" value="${view.id}" name="company_id">
		    <table class="table">
		    	<tr>
		    		<td><label for="id">ID</label></td>
		    		<td> <input name="id" id="id" type="text" value="sessionID"> </td>
		    		<td><label for="name">예약자</label></td>
		    		<td> <input name="name" id="name" type="text" value="sessionNAME"> </td>
		    	</tr>
		    	
		    	<tr>
		    		<td><label for="hall_name">웨딩홀</label></td>
		    		<td> <input name="hall_name" id="hall_name" type="text" value="${view.hall_name}"> </td>
		    		<td><label for="reservation_date">예약날짜</label></td>
		    		<td> <input name="reservation_date" id="reserv_date" type="date"> </td>
		    	</tr>
		    	
		    	<tr>
		    		<td colspan="4"><label for="contents">문의내용</label></td>
		    	</tr>
		    	
		    	<tr>
		    		<td colspan="4"><textarea id="contents" name="contents" rows="10" style="width: 100%;"></textarea></td>
		    	</tr>
		    </table>
		    <div class="container textCenter">
			    <button id="reservation_btn" class="btn btn-primary">예약신청</button>
		    </div>
		    </form>
		  </div>
		
		</div>
		
		<script>
		// Get the modal
		var modal = document.getElementById('myModal');
		
		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");
		
		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("closer")[0];
		
		// When the user clicks the button, open the modal 
		btn.onclick = function() {
		    modal.style.display = "block";
		}
		
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
		    modal.style.display = "none";
		}
		
		var listBtn = document.getElementById("list_btn");
		listBtn.addEventListener('click', function(e) {
			location.href="./searchMain.search";
		});
		
		/* // When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		    if (event.target == modal) {
		        modal.style.display = "none";
		    }
		} */
		</script>
	
	
</body>
</html>
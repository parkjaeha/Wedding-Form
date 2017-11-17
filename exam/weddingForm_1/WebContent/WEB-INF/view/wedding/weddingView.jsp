<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			if(i == index-1) {
				link[i].setAttribute("class", "nav-link active");
				var title = link[i].getAttribute('title');
				ajaxFunc(title) // ajax
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
	
</script>

<style type="text/css">
	.margin10 {
		margin-top: 20px;
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
		width: 33%;
		text-align: center;
	}
	
	.bgColor {
		margin-top: 20px;
		background-color: #F5F5DC;
	}
	
	.line {
	}
	
	
</style>

<!----------------------------SLICE IMAGE------------------------------------------>
<script src="../slick/slick.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		$(".regular").slick({
	        dots: true,
	        infinite: true,
	        slidesToShow: 3,
	        slidesToScroll: 3
	      });
	});
</script>

<link rel="stylesheet" type="text/css" href="../slick/slick.css">
<link rel="stylesheet" type="text/css" href="../slick/slick-theme.css">
<style type="text/css">
	.slider {
	    width: 50%;
	    margin: 100px auto;
	}
	
	.slick-slide {
	  margin: 0px 20px;
	}
	
	.slick-slide img {
	  width: 100%;
	}
	
	.slick-prev:before,
	.slick-next:before {
	  color: black;
	}
	
	
	.slick-slide {
	  transition: all ease-in-out .3s;
	  opacity: .2;
	}
	
	.slick-active {
	  opacity: .5;
	}
	
	.slick-current {
	  opacity: 1;
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
			<a class="nav-link" onclick="changeActive(1)" title="호텔웨딩">호텔웨딩</a>
			<a class="nav-link" onclick="changeActive(2)" title="야외웨딩">야외웨딩</a>
			<a class="nav-link" onclick="changeActive(3)" title="전통혼례">전통혼례</a>
		</div>
	</div>
	
	<div class="contents">
		<div id="result">
			<div class="houseSet">
				<div class="container bgColor">
				</div>
			
				<section class="regular slider">
					<h1 class="line">Hotel <br>House <br>Wedding</h1>
					<div>
					  <img src="http://placehold.it/350x300?text=1">
					</div>
					<div>
					  <img src="http://placehold.it/350x300?text=2">
					</div>
					<div>
					  <img src="http://placehold.it/350x300?text=3">
					</div>
					<div>
					  <img src="http://placehold.it/350x300?text=4">
					</div>
					<div>
					  <img src="http://placehold.it/350x300?text=5">
					</div>
					<div>
					  <img src="http://placehold.it/350x300?text=6">
					</div>
				</section>
			</div>
			
			<div class="houseSet">
				<div class="container">
					<h1>야외웨딩</h1>
				</div>
			
				<section class="regular slider">
					<div>
					  <img src="http://placehold.it/350x300?text=1">
					</div>
					<div>
					  <img src="http://placehold.it/350x300?text=2">
					</div>
					<div>
					  <img src="http://placehold.it/350x300?text=3">
					</div>
					<div>
					  <img src="http://placehold.it/350x300?text=4">
					</div>
					<div>
					  <img src="http://placehold.it/350x300?text=5">
					</div>
					<div>
					  <img src="http://placehold.it/350x300?text=6">
					</div>
				</section>
			</div>
			
			<div class="houseSet">
				<div class="container">
					<h1>전통혼례</h1>
				</div>
			
				<section class="regular slider">
					<div>
					  <img src="http://placehold.it/350x300?text=1">
					</div>
					<div>
					  <img src="http://placehold.it/350x300?text=2">
					</div>
					<div>
					  <img src="http://placehold.it/350x300?text=3">
					</div>
					<div>
					  <img src="http://placehold.it/350x300?text=4">
					</div>
					<div>
					  <img src="http://placehold.it/350x300?text=5">
					</div>
					<div>
					  <img src="http://placehold.it/350x300?text=6">
					</div>
				</section>
			</div>
		</div>
	</div>

</body>
</html>
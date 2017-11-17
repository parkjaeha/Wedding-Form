<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
		
		//////////////////////////////////////////////////
		/* $("#hotel").click(function() {
			alert('hotel');
		});
		
		$("#outdoor").click(function() {
			alert("outdoor");
		});
		
		$("#tradition").click(function() {
			alert("tradition");
		}); */
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
				alert(data);
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
		top: 10px;
		left: 10px;
		font-size: 45px;
		font-weight: bold;
		color: #fff;
		
	}
	
	.sub_text {
		position: absolute;
		top: 60px;
		left: 45px;
		color: #F5F5F5;
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
	}
	
	.sticky + .content {
	  padding-top: 60px;
	}
</style>

</head>
<body>

	<div class="container">
		<div class="img_box">
			<div class="title"><h1>House Wedding</h1></div>
			<div class="sub_text">
				<p>나만의 특별한 웨딩을 꿈꾸는 당신을 위해...</p>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div id="navbar">
			<a class="nav-link active" onclick="changeActive(1)" title="호텔웨딩">호텔웨딩</a>
			<a class="nav-link" onclick="changeActive(2)" title="야외웨딩">야외웨딩</a>
			<a class="nav-link" onclick="changeActive(3)" title="전통혼례">전통혼례</a>
		</div>
	</div>
	
	<div class="content">
		<div id="result">
			
		</div>
	</div>

</body>
</html>
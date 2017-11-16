<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
* {
	margin: 0;
	padding: 0;
}

html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
a{
text-decoration: none;
}

</style>
<body>
<!--주소 확인할것  -->

<div id="main">
<c:import url="./temp/sideMenu_myPage.jsp"></c:import>
<c:import url="./temp/header.jsp"></c:import>
<!-- Page Container -->
<div class="w3-content w3-margin-top" style="max-width:1200px; margin : 0 auto;margin-bottom: 100px;">
<p> <a onclick="openNav()">My Page</a></p>
  <!-- The Grid -->
				<div class="w3-container w3-card w3-white w3-margin-bottom" style="margin-top: 100px;">
					<h2 class="w3-text-grey w3-padding-16">내 정보</h2>
					<div class="w3-container">

						<h6 class="w3-text-grey">
							<i
								class="fa fa-arrow-right fa-fw w3-margin-right w3-text-light-blue"></i>
							ID
						</h6>

						<hr>
					</div>
					<div class="w3-container">

						<h6 class="w3-text-grey">
							<i
								class="fa fa-arrow-right fa-fw w3-margin-right w3-text-light-blue"></i>
							NAME
						</h6>

						<hr>
					</div>
					<div class="w3-container">

						<h6 class="w3-text-grey">
							<i
								class="fa fa-arrow-right fa-fw w3-margin-right w3-text-light-blue"></i>
							PASSWORD
						</h6>

						<hr>
					</div>
					<div class="w3-container">

						<h6 class="w3-text-grey">
							<i
								class="fa fa-arrow-right fa-fw w3-margin-right w3-text-light-blue"></i>
							ADDRESS
						</h6>

						<hr>
					</div>

					<div class="w3-container">

						<h6 class="w3-text-grey">
							<i
								class="fa fa-arrow-right fa-fw w3-margin-right w3-large w3-text-light-blue"></i>PHONE
						</h6>

						<hr>
					</div>

					<div class="w3-container">

						<h6 class="w3-text-grey">
							<i
								class="fa fa-arrow-right fa-fw w3-margin-right w3-large w3-text-light-blue"></i>
							E-MAIL
						</h6>

						<br>
					</div>
				</div>
				<button
					class="w3-btn w3-white w3-border w3-border-blue w3-round-large">정보
					수정</button>
				<button
					class="w3-btn w3-white w3-border w3-border-blue w3-round-large">회원
					탈퇴</button>



			</div>

</div>
<c:import url="./temp/footer.jsp"></c:import>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>

   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- google -->
<meta name="google-signin-client_id" content="761108002241-lnbll7rt3dlsvv20g153605ntvaa2vub.apps.googleusercontent.com">
<!-- facebook -->
<script src="http://connect.facebook.net/en_US/all.js"></script>


<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

   <script type="text/javascript">
  (function() {
    var po = document.createElement('script');
    po.type = 'text/javascript'; po.async = true;
    po.src = 'https://plus.google.com/js/client:plusone.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(po, s);
  })();
  </script>
  

<style type="text/css">

	.g-signin2{
		margin-left:  500px;
		margin-top: 200px;
	}
	
	.data{
		display: none;
	}

</style>


<script type="text/javascript">
function onSignIn(googleUser){
	
	var profile = googleUser.getBasicProfile();
	$(".g-signin2").css("display","none");
	$(".data").css("display","block");
	$("#pic").attr('src',profile.getImageUrl());
	$("#email").text(profile.getEmail());
	
}

function signOut(){
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function(){
		
		
		alert("you have been successfully signed out");
		
		$(".g-signin2").css("display","block");
		$(".data").css("display","none");
		gapi.auth2.getAuthInstance().disconnect();
		 document.location.reload();
		
	});
}
</script>

</head>
<body>

<h1>Login</h1>
<link href="../css/login.css" rel="stylesheet">

<!-- 
<c:import url="./WEB-INF/view/temp/header.jsp"></c:import>
	 -->
<!-- contents 시작 -->
	<section class="contents_wrap2">

		<div class="blank"></div>
		<article class="content_top">
			<!-- logo -->
			<!-- <img alt="" src="../image/common/login_logo.gif"> -->
		</article>


		<article class="content_main2">


			<form name="frm" class="form-horizontal" action="commonLogin.common" method="post">
				<div class="imgcontainer">
				<!-- human icon -->
					<!-- <img src="../image/main/jyp.jpg" alt="Avatar" class="avatar"
						style="width: 300px; height: 300px; margin-top: 10px;"> -->
				</div>

<!-- login -->
				<div class="container">
					<label style="color: white;" class="btn btn-primary"><b>Id</b></label>
					<input type="text" placeholder="Enter Username" 
						required style="width: 60%;"  class="form-control" id="id"
									name="id">    <br>
						<label  style="color: white;" class="btn btn-primary"><b>Password</b></label>
					<input type="password" placeholder="Enter Password" 
						required style="width: 60%;"   class="form-control" id="pw1" name="pw">

					<button type="submit" style="width: 60%;">Login</button>		
					<input type="checkbox" checked="checked" value="remember" name="remember"> Remember me
				</div>

<!-- check your state -->
				<div class="container" style="background-color: #f1f1f1; height: 50px;" >

					<!-- customer business -->
				
					
					<div style="width: 50%; display: inline-block; padding-bottom: 10px;"> Choice State &nbsp;&nbsp;
					
					<div class="checkbox" style="width: 50%; display: inline-block;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" class="ch" checked="checked"
							value="customer" name="job"> customer
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" class="ch"
							value="business" name="job"> business
					</div>
					</div>
		
<!-- join & forgot password  -->					
					<div style="float: right;">&nbsp;&nbsp; or &nbsp;&nbsp;
						&nbsp;<a href="./commonId.common">
							id</a>?
					</div>  <div style="float: right;">Forgot &nbsp;
					<a href="./commonPassword.common">password? </a></div>
					
					<%-- ${pageContext.request.contextPath}/common/commonJoin.jsp --%>
					
				</div>
			</form>

<!-- -----------------------------------------------------google------------------------------------------------------- -->
<div class="g-signin2" data-onsuccess="onSignIn"></div>
<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="false"></div>

<div class="data">
	<p>Profile Details</p>
	<img id="pic" class="img-circle" width="100" height="100"/>
	<p>Email Address</p>
	<p id="email" class="alert alert-danger"></p>
	<p id="result"></p>
	
	<button onclick="signOut()" class="btn btn-danger">SignOut</button>

</div>

<!-- -----------------------------------------------------facebook------------------------------------------------------- -->


<script language="javascript" type="text/javascript">
    FB.init({
        appId: '138117166836292',
        status: true, 
        cookie: true, 
        xfbml: true
    });    
</script>

		</article>
	</section>
	<!-- contents 끝 -->



</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<!-- google -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<meta name="google-signin-client_id" content="761108002241-lnbll7rt3dlsvv20g153605ntvaa2vub.apps.googleusercontent.com">
<!-- facebook -->
<script src="http://connect.facebook.net/en_US/all.js"></script>



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
		/* margin-left:  500px;
		margin-top: 200px; */	
		width:75%;
		margin-top: 1%;
		margin-bottom: 1%;
	}
	
	.fb-login-button{
		width:75% !important;
    font-size: 16px !important;
    line-height: 30px !important;
    padding: 3px 8px !important;

	}
	
	.data{
		display: none;
	}

	.log_btn{
	 background: #ffffff;
  background-image: -webkit-linear-gradient(top, #ffffff, #ffffff);
  background-image: -moz-linear-gradient(top, #ffffff, #ffffff);
  background-image: -ms-linear-gradient(top, #ffffff, #ffffff);
  background-image: -o-linear-gradient(top, #ffffff, #ffffff);
  background-image: linear-gradient(to bottom, #ffffff, #ffffff);
   -webkit-border-radius: 11;
  -moz-border-radius: 11;
  border-radius: 11px;
  font-family: Arial;
  color: #0a090a;
  font-size: 16px;
  padding: 5px 20px 5px 20px;
  border: solid #f2f2f2 2px;
  text-decoration: none;
	}
	
.log_btn:hover {
  background: #d2d6d9;
  background-image: -webkit-linear-gradient(top, #d2d6d9, #dcdee0);
  background-image: -moz-linear-gradient(top, #d2d6d9, #dcdee0);
  background-image: -ms-linear-gradient(top, #d2d6d9, #dcdee0);
  background-image: -o-linear-gradient(top, #d2d6d9, #dcdee0);
  background-image: linear-gradient(to bottom, #d2d6d9, #dcdee0);
  text-decoration: none;
}
	

/* Shared */
.loginBtn {
  box-sizing: border-box;
  position: relative;
  /* width: 13em;  - apply for fixed size */
  margin: 0.2em;
  padding: 0 15px 0 46px;
  border: none;
  text-align: left;
  line-height: 34px;
  white-space: nowrap;
  border-radius: 0.2em;
  font-size: 16px;
  color: #FFF;
}
.loginBtn:before {
  content: "";
  box-sizing: border-box;
  position: absolute;
  top: 0;
  left: 0;
  width: 34px;
  height: 100%;
}
.loginBtn:focus {
  outline: none;
}
.loginBtn:active {
  box-shadow: inset 0 0 0 32px rgba(0,0,0,0.1);
}


/* Facebook */
.loginBtn--facebook {
  background-color: #4C69BA;
  background-image: linear-gradient(#4C69BA, #3B55A0);
  /*font-family: "Helvetica neue", Helvetica Neue, Helvetica, Arial, sans-serif;*/
  text-shadow: 0 -1px 0 #354C8C;
}
.loginBtn--facebook:before {
  border-right: #364e92 1px solid;
  background: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/14082/icon_facebook.png') 6px 6px no-repeat;
}
.loginBtn--facebook:hover,
.loginBtn--facebook:focus {
  background-color: #5B7BD5;
  background-image: linear-gradient(#5B7BD5, #4864B1);
}


/* Google */
.loginBtn--google {
  /*font-family: "Roboto", Roboto, arial, sans-serif;*/
  background: #DD4B39;
}
.loginBtn--google:before {
  border-right: #BB3F30 1px solid;
  background: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/14082/icon_google.png') 6px 6px no-repeat;
}
.loginBtn--google:hover,
.loginBtn--google:focus {
  background: #E74B37;
}


</style>


<script type="text/javascript">

/* $(function() {
   $(".loginBtn--facebook").on("click",".fb-login-button"function(){});
	
}); */

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
<!-- <link href="../css/login.css" rel="stylesheet"> -->

<%-- <c:import url="../../../temp/header.jsp"></c:import> --%>

<!-- contents 시작 -->
	<section class="contents_wrap2">

		<div class="blank"></div>
		<article class="content_top">
			<!-- logo -->
			<!-- <img alt="" src="../image/common/login_logo.gif"> -->
		</article>

		<article class="content_main2">

		<div class="row" style="margin:  0 auto;">

				<div class="col-sm-3" >.col-sm-3</div>
				
				<div class="col-sm-6" >
				
<form name="frm" class="form-horizontal" action="commonLogin.common" method="post">
				<div class="imgcontainer">
				<!-- human icon -->
					<!-- <img src="../image/main/jyp.jpg" alt="Avatar" class="avatar"
						style="width: 300px; height: 300px; margin-top: 10px;"> -->
				</div>

<!-- login -->
				<div class="container">
					<label style="color: white; display: inline-block; width: 15%; margin: 0 auto;" class="btn btn-primary"  ><b>Id</b></label>
					<input type="text" placeholder="Enter Username" 
						required style="width: 60%; display: inline-block;"  class="form-control" id="id"
									name="id">    <br>
						<label  style="color: white; display: inline-block; width: 15%;" class="btn btn-primary"  ><b>Password</b></label>
					<input type="password" placeholder="Enter Password" 
						required style="width: 60%; display: inline-block;"   class="form-control" id="pw1" name="pw">

					<button type="submit" style="width: 75%; display: block; margin-top: 1%;" class="log_btn">Login</button>		
					<input type="checkbox" checked="checked" value="remember" name="remember"> Remember me
				</div>

<!-- check your state -->
				<div class="state_check" style="background-color: #f1f1f1; height: 30px; width: 75%;" >

					<!-- customer business -->
					customer&nbsp;&nbsp;<input type="checkbox" class="ch" checked="checked" value="Customer" name="job"> 
					business&nbsp;&nbsp;<input type="checkbox" class="ch" value="Business" name="job" > 
					
<!-- join & forgot password  -->	

			<div style="width: 50%; height: 30px;  font-size:13px; float: right;">
						<div>
						Forgot &nbsp;<a href="./commonId.common">id?</a> &nbsp;&nbsp; or &nbsp;&nbsp;
					 <a href="./commonPassword.common">password?</a>
					</div>
			</div>			
					
					<%-- ${pageContext.request.contextPath}/common/commonJoin.jsp --%>
					
				</div>
			</form>

<!-- -----------------------------------------------------google------------------------------------------------------- -->
<div class="g-signin2" data-onsuccess="onSignIn"></div>
<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="false" ></div>

<center>
<div>
<button class="loginBtn loginBtn--facebook" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="false" >
  Login with Facebook
</button>

<button class="loginBtn loginBtn--google ">
  Login with Google
</button>

</div>
</center>

</div>
				
				<div class="col-sm-3" >.col-sm-3</div>

<div class="data">
	<p>Profile Details</p>
	<img id="pic" class="img-circle" width="100" height="100"/>
	<p>Email Address</p>
	<p id="email" class="alert alert-danger"></p>
	<p id="result"></p>
	
	<button onclick="signOut()" class="btn btn-danger">SignOut</button>

</div>


		</div>
		</article>
			



<!-- -----------------------------------------------------facebook------------------------------------------------------- -->


<script language="javascript" type="text/javascript">
    FB.init({
        appId: '138117166836292',
        status: true, 
        cookie: true, 
        xfbml: true
    });    
</script>

		
	</section>
	<!-- contents 끝 -->

<%-- <c:import url="../../../temp/header.jsp"></c:import> --%>


</body>
</html>
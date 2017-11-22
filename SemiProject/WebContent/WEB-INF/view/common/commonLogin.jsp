<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">
	<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
  
	<title>Login</title>
	
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<!-- google -->
<script  src="https://apis.google.com/js/platform.js" async defer></script>
	<!-- jQuery library -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta name="google-signin-client_id" content="761108002241-lnbll7rt3dlsvv20g153605ntvaa2vub.apps.googleusercontent.com">
<!-- facebook -->
<script src="http://connect.facebook.net/en_US/all.js"></script>
<!-- address -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>


<style rel="stylesheet">
@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);
* {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Lato', sans-serif;
  background-color: #f8f8f8;
}
body .container {
  position: relative;
  overflow: hidden;
  width: 700px;
  height: 500px;
  margin: 80px auto 0;
  background-color: #ffffff;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
}
body .container .half {
  float: left;
  width: 50%;
  height: 100%;
  padding: 25px 40px 0;
}
body .container .half.bg {
  background-image: url("${pageContext.request.contextPath}/images/cover/111.jpg");
  background-size: 400px;
  background-repeat: no-repeat;
}
body .container h1 {
  font-size: 18px;
  font-weight: 700;
  margin-bottom: 5px;
  text-align: center;
  text-indent: 6px;
  letter-spacing: 7px;
  text-transform: uppercase;
  color: #263238;
}
body .container .tabs {
  width: 100%;
  margin-bottom: 29px;
  border-bottom: 1px solid #d9d9d9;
}
body .container .tabs .tab {
  display: inline-block;
  margin-bottom: -1px;
  padding: 20px 15px 10px;
  cursor: pointer;
  letter-spacing: 0;
  border-bottom: 1px solid #d9d9d9;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab a {
  font-size: 11px;
  text-decoration: none;
  text-transform: uppercase;
  color: #d9d9d9;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab.active a, body .container .tabs .tab:hover a {
  color: #263238;
}
body .container .tabs .tab.active {
  border-bottom: 1px solid #263238;
}
body .container .content form {
  position: relative;
  height: 287px;
}
body .container .content label:first-of-type, body .container .content input:first-of-type, body .container .content .more:first-of-type {
  -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(2), body .container .content input:nth-of-type(2), body .container .content .more:nth-of-type(2) {
  -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(3), body .container .content input:nth-of-type(3), body .container .content .more:nth-of-type(3) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label {
  font-size: 12px;
  color: #263238;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
}
body .container .content label:not([for='remember']) {
  display: none;
}
body .container .content input.inpt {
  font-size: 14px;
  display: block;
  width: 100%;
  height: 42px;
  margin-bottom: 6px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #d9d9d9;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .container .content input.inpt::-webkit-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt::-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-ms-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:focus {
  border-color: #999999;
}
body .container .content input.submit {
  font-size: 12px;
  line-height: 42px;
  display: block;
  width: 100%;
  height: 42px;
  cursor: pointer;
  vertical-align: middle;
  letter-spacing: 2px;
  text-transform: uppercase;
  color: #263238;
  border: 1px solid #263238;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .container .content input.submit:hover {
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}
body .container .content input:focus {
  outline: none;
}
body .container .content .checkbox {
  margin-top: 4px;
  overflow: hidden;
  clip: rect(0 0 0 0);
  width: 0;
  height: 0;
  margin: 0px -1px;
  padding: 0;
  border: 0;
}
body .container .content .checkbox + label {
  vertical-align: middle;
  display: block;
  width: 50%;
}

body .container .content .checkbox + label:before {
  content: "\A";
  color: #999999;
  font-family: Verdana;
  font-weight: bold;
  font-size: 8px;
  line-height: 10px;
  text-align: center;
  display: inline-block;
  vertical-align: middle;
  position: relative;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  background: transparent;
  border: 1px solid #d9d9d9;
  width: 11px;
  height: 11px;
  margin: -2px 8px 0 0;
}
body .container .content .checkbox:checked + label:before {
  content: "✓";
}

body .container .content .login_check {
 
  overflow: hidden;
  clip: rect(0 0 0 0);
  width: 0;
  height: 0;
  margin: 17px -1px; 
  padding: 0;
  border: 0;
}

body .container .content .sign_check {
 
  overflow: hidden;
  clip: rect(0 0 0 0);
  width: 0;
  height: 0;
  margin: 17px -1px; 
  padding: 0;
  border: 0;
}

body .container .content .login_check + label {
  vertical-align: middle;
  display: inline;
  width: 50%;
}

body .container .content .sign_check + label {
  vertical-align: middle;
  display: inline;
  width: 50%;
}

body .container .content .login_check + label:before {
  content: "\A";
  color: #999999;
  font-family: Verdana;
  font-weight: bold;
  font-size: 8px;
  line-height: 10px;
  text-align: center;
  display: inline-block;
  vertical-align: middle;
  position: relative;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  background: transparent;
  border: 1px solid #d9d9d9;
  width: 11px;
  height: 11px;
  margin: -2px 8px 0 0;
}
body .container .content .login_check:checked + label:before {
  content: "✓";
}

body .container .content .sign_check + label:before {
  content: "\A";
  color: #999999;
  font-family: Verdana;
  font-weight: bold;
  font-size: 8px;
  line-height: 10px;
  text-align: center;
  display: inline-block;
  vertical-align: middle;
  position: relative;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  background: transparent;
  border: 1px solid #d9d9d9;
  width: 11px;
  height: 11px;
  margin: -2px 8px 0 0;
}
body .container .content .sign_check:checked + label:before {
  content: "✓";
}


body .container .content .submit-wrap {
  position: absolute;
  bottom: -10px;
  width: 100%;
  margin-top: 20px;
}
body .container .content .submit-wrap a{
  font-size: 12px;
  display: inline-block;
  text-align: center;
  text-decoration: none;
  color: #999999;
}

.submit-wrap  p{
  font-size: 12px;
  display: block;
  margin-top: 20px;
  text-align: center;
  text-decoration: none;
  color: #999999;
}


body .container .content .submit-wrap a:hover {
  text-decoration: underline;
}
body .container .content .signup-cont {
  display: none;
}

@keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
@-webkit-keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
.credits {
  display: block;
  position: absolute;
  right: 0;
  bottom: 0;
  color: #999999;
  font-size: 14px;
  margin: 0 10px 10px 0;
}
.credits a {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
  opacity: 0.8;
  color: inherit;
  font-weight: 700;
  text-decoration: none;
}

.fb-login-button{
		width:120px !important;
    font-size: 16px !important;
    line-height: 30px !important;
    padding: 3px 8px !important;
	heigth: 30px;
	}


* {
  box-sizing: border-box;
}

body {
  background: #f1f1f1;
  color: #333333;
  font-family: 'Cairo', sans-serif;
  font-size: 12px;
  height: 100vh;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -webkit-align-items: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: center;
  -webkit-justify-content: center;
      -ms-flex-pack: center;
          justify-content: center;
}

.dialog__trigger, .dialog__action {
  border: 3px solid #333333;
  background: #f1f1f1;
  padding: 5px 10px;
  font-size: 1.1rem;
  text-transform: uppercase;
  display: block;
  -webkit-transition: all 150ms ease-out;
  transition: all 150ms ease-out;
  -webkit-transform: translateY(0px);
          transform: translateY(0px);
}
.dialog__trigger:hover, .dialog__action:hover {
  -webkit-transform: translateY(-5px);
          transform: translateY(-5px);
  -webkit-transition: all 100ms ease-in;
  transition: all 100ms ease-in;
  box-shadow: 0 5px 10px rgba(51, 51, 51, 0.4);
}
.dialog__trigger:focus, .dialog__action:focus {
  outline: 0;
}
.dialog__trigger:active, .dialog__action:active {
  -webkit-transform: translateY(-3px);
          transform: translateY(-3px);
}

.dialog {
  background: #f1f1f1;
  width: 70%;
  position: absolute;
  left: calc(50% - 35%);
  top: 0;
  padding: 30px;
  box-shadow: 0 10px 30px rgba(51, 51, 51, 0.4);
  border: 3px solid #333333;
  visibility: hidden;
  opacity: 0;
  -webkit-transition: all 180ms ease-in;
  transition: all 180ms ease-in;
  z-index:999;
}
@media (max-width: 600px) {
  .dialog {
    width: 90%;
    left: calc(50% - 45%);
  }
}
.dialog.dialog--active {
  top: 10%;
  visibility: visible;
  opacity: 1;
  -webkit-transition: all 250ms ease-out;
  transition: all 250ms ease-out;
}
.dialog .dialog__close {
  font-size: 2rem;
  line-height: 2rem;
  position: absolute;
  right: 15px;
  top: 15px;
  cursor: pointer;
  padding: 15px;
  -webkit-transition: color 150ms ease;
  transition: color 150ms ease;
}
.dialog .dialog__close:hover {
  color: #E74C3C;
}
.dialog .dialog__title {
  font-size: 2rem;
  font-family: 'Slabo 27px', serif;
  font-weight: 100;
  margin: 0;
  padding: 0 0 15px 0;
  border-bottom: 2px solid #333333;
}
.dialog .dialog__content {
  font-size: 1.1rem;
  line-height: 2rem;
}
.dialog .dialog__action {
  margin: 0;
  font-size: 1rem;
}
//////////////////////////////////////////////


.signUpInput {
   width: 100%;
   height: 50px;
   margin-bottom: 25px;
   padding: 0 15px 2px;
   font-size: 17px;
   background: white;
   border: 2px solid #EBEBEB;
   border-radius: 4px;
   -webkit-box-shadow: inset 0 -2px #EBEBEB;
   box-shadow: inset 0 -2px #EBEBEB;
}

.signUpInput:focus {
   border-color: #62C2E4;
   outline: none;
   -webkit-box-shadow: inset 0 -2px #62C2E4;
   box-shadow: inset 0 -2px #62C2E4;
}

.lt-ie9 .signUpInput {
   line-height: 48px;
}



///////////////////////////////////////////////////
.onoffswitch {
    position: relative; width: 90px;
    -webkit-user-select:none; -moz-user-select:none; -ms-user-select: none;
}
.onoffswitch-checkbox {
    display: none;
}
.onoffswitch-label {
    display: block; overflow: hidden; cursor: pointer;
    border: 2px solid #999999; border-radius: 20px;
}
.onoffswitch-inner {
    display: block; width: 200%; margin-left: -100%;
    transition: margin 0.3s ease-in 0s;
}
.onoffswitch-inner:before, .onoffswitch-inner:after {
    display: block; float: left; width: 50%; height: 30px; padding: 0; line-height: 30px;
    font-size: 14px; color: white; font-family: Trebuchet, Arial, sans-serif; font-weight: bold;
    box-sizing: border-box;
}
.onoffswitch-inner:before {
    content: "ON";
    padding-left: 10px;
    background-color: #34A7C1; color: #FFFFFF;
}
.onoffswitch-inner:after {
    content: "OFF";
    padding-right: 10px;
    background-color: #F0D509; color: #FFFFFF;
    text-align: right;
}
.onoffswitch-switch {
    display: block; width: 18px; margin: 6px;
    background: #FFFFFF;
    position: absolute; top: 0; bottom: 0;
    right: 56px;
    border: 2px solid #999999; border-radius: 20px;
    transition: all 0.3s ease-in 0s; 
}
.onoffswitch-checkbox:checked + .onoffswitch-label .onoffswitch-inner {
    margin-left: 0;
}
.onoffswitch-checkbox:checked + .onoffswitch-label .onoffswitch-switch {
    right: 0px; 
}
///////////////////////////////////////////////////////////////////////////////

.onoffswitch-label {
	display: block;
}

</style>

<script type="text/javascript">
var count = 0;


(function() {
    var po = document.createElement('script');
    po.type = 'text/javascript'; po.async = true;
    po.src = 'https://plus.google.com/js/client:plusone.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(po, s);
  })();

function onSignIn(googleUser){
	
	var profile = googleUser.getBasicProfile();
	$(".g-signin2").css("display","none");
	$(".data").css("display","block");
	$("#pic").attr('src',profile.getImageUrl());
	$("#email").text(profile.getEmail());
	   console.log("ID: " + profile.getId()); // Don't send this directly to your server!
       console.log('Full Name: ' + profile.getName());
       console.log('Given Name: ' + profile.getGivenName());
       console.log('Family Name: ' + profile.getFamilyName());
       console.log("Image URL: " + profile.getImageUrl());
       console.log("Email: " + profile.getEmail());
       
  
   	

}

function signOut(){
	google_state =false;
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

<input type="hidden" id="get_result" value="${result}"/>
<section class="container">
		    <article class="half">
			        <h1>Azure</h1>
			        <div class="tabs">
				            <span class="tab signin active"><a href="#signin">Sign in</a></span>
				  		    <span class="tab signup"><a href="#signup">Sign up</a></span>
			        </div>
			        
			        
			        <div class="content">
				            <div class="signin-cont cont">
					                <form  action="./commonLogin.common" method="post">
						                    <input type="text" name="id" id="id" class="inpt" required="required" placeholder="Your id">
						                    <label for="id">Your id</label>
						                    <input type="password" name="password" id="password" class="inpt" required="required" placeholder="Your password">
                						    <label for="password">Your password</label>
						                    <input type="checkbox" id="remember" class="checkbox" checked>
						                    <label for="remember">Remember me</label>
						                   <!-- customer business -->
					customer&nbsp;&nbsp;<input type="checkbox" class="ch" checked="checked" value="Customer" name="job"> 
					business&nbsp;&nbsp;<input type="checkbox" class="ch" value="Business" name="job"> 
						                    
						                    <div class="submit-wrap">
							                        <input type="submit" value="Sign in" class="submit">
							                       <p style="height: 10px;"><a href="./common/commonId.common">Forgot &nbsp;id?</a> &nbsp; or &nbsp;
					 <a href="./common/commonPassword.common">Forgot &nbsp;password?</a></p>
					 <!-- login api google -->
					 						<div style="display:inline-block;" class="g-signin2" data-onsuccess="onSignIn"></div>
					 <!-- login api facebook -->
					 						<!-- <div  style="display: inline;"class="fb-login-button" size="medium" data-max-rows="1" data-size="small"  data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="false" ></div> -->
					 						<div style="text-align: -webkit-center; vertical-align: top;" class="fb-login-button fb_iframe_widget" data-max-rows="1" data-size="medium" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="false" login_text="Facebook" fb-xfbml-state="rendered" fb-iframe-plugin-query="app_id=138117166836292&amp;auto_logout_link=true&amp;container_width=120&amp;locale=en_US&amp;max_rows=1&amp;sdk=joey&amp;show_faces=false&amp;size=medium&amp;use_continue_as=false"><span style=" vertical-align: bottom; width: 100%; height: 100%;"><iframe name="f142f0dc823f7d8" width="1000px" height="1000px" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" title="fb:login_button Facebook Social Plugin" src="https://www.facebook.com/plugins/login_button.php?app_id=138117166836292&amp;auto_logout_link=true&amp;channel=http%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2FlY4eZXm_YWu.js%3Fversion%3D42%23cb%3Dff0b12e74eaf0c%26domain%3Dlocalhost%26origin%3Dhttp%253A%252F%252Flocalhost%252Ffa65754e7cb2cc%26relation%3Dparent.parent&amp;container_width=120&amp;locale=en_US&amp;max_rows=1&amp;sdk=joey&amp;show_faces=false&amp;size=medium&amp;use_continue_as=false" style=" 
					 						 border: none; visibility: visible; width: 140px; height: 46px;"></iframe></span></div>
					 						 
						                    </div>
        					        </form>
    				        </div>
    				        
             <form name="frm" class="form-horizontal"	
							action="./commonJoinUp.common" method="post">
    				        <div class="signup-cont cont">
    				        <span id="result">ID를 입력하세요.</span>
						                    <input type="text" name="id" id="sign_id" class="inpt signUpInput" required="required" placeholder="Enter id">
						                    <label for="id">Enter id</label>
						                    <input type="password" name="password" id="pw1" class="inpt signUpInput" required="required" placeholder="Enter password">
                						    <label for="password">Enter password</label>
                							<input type="password" name="cpassword" id="pw2" class="inpt signUpInput" required="required" placeholder="Enter check password">
                						    <label for="password_check">Enter check password</label>
                   							<input type="text" name="name" id="name" class="inpt signUpInput" required="required" placeholder="Enter name">
						                    <label for="name">Enter name</label>
						                 	<input type="text"  name="addr_main" id="addr_main" class="inpt postcodify_address" required="required" readonly="readonly" placeholder="press search button">
						                    <label for="addr">Enter addr_main</label>
						                    <!-- 주소  -->
											<input type="text" name="addr_sub" id="addr_sub" class="inpt signUpInput" required="required" placeholder="Enter detail address">
											  <label for="addr">Enter addr_sub</label>
											   <button type="button" id="postcodify_search_button" style="display: inline-block;">검색</button>
											<!-- 빈칸  -->
					      <span class="tab prev" style="margin-left: 50px;"><a href="#signup"> << </a></span>
				            <span class="tab next"><a href="#signup"> >></a></span>						
						      </div>
           					     
						      <div class="signup_next1 cont">
               
											<input type="tel" class="inpt"  id="phone" required="required" placeholder="Enter Phone" name="phone">			
                							<label for="phone">Enter phone</label>
								<!-- 인증번호 -->
											<input id="dialog" type="button" class="dialog__trigger" value="휴대폰 인증하기">
											<div class="dialog">
											  <span class="dialog__close">&#x2715;</span>
											  <h2 class="dialog__title">인증 번호</h2>
											  <p class="dialog__content">인증번호를 확인해 주세요.</p>
											  <input class="dialog__input"> <span class="timer" id="timer">3:00</span>
											 <!--  <button class="dialog__action">인증하기 &#8594;</button> -->
											</div>
									<!-- ------------------------------------------------------------------------------------- -->
										<input type="email" class="inpt"  id="email" required="required" placeholder="Enter email --- '@ ignore'" name="email">	
										<label for="email">Enter email</label>
																<input type="text" class="inpt select_result"
										id="select_result"  placeholder="Enter email site" name="select_result"
										 value="">
										<label for="select_result">Enter select_result</label>				
									<select id="email_select" style="height: 40px; width: 120px;" class="form-control">
											<option value="">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="google.com">google.com</option>
										</select>
										
		
										<!-- 	<input type="checkbox" name="sign-cus" id="sign-cus" class="sign_check" >
						                 <label for="sign-cus"> Customer </label>
						                    <input type="checkbox" name="sign-bus" id="sign-bus" class="sign_check">
						                     <label for="sign-bus"> Business </label> -->
						                     
cu<input type="radio" id="Customer" name="job" class="sign_ch inpt" style="width: 10px; height: 10px;" value="Customer">
bu<input type="radio" name="job" id="Business" class="sign_ch inpt" style="width: 10px; height: 10px;" value="Business">
										
								      <span class="tab prev" style="margin-left: 50px;"><a href="#signup"> << </a></span>
				            <span class="tab next"><a href="#signup"> >></a></span>		
	
           					 </div>
           					 
           					 <div class="signup_next2 cont">
               
               <!-- Customer 추가정보 -->
							<section id="add">
							<!-- Birth -->
								<label for="birth">select birth</label>
								<input type="date" class="inpt" required="required" id="birth" placeholder="select birth" name="birth">
								
								<!-- Gender -->
								<label for="gender">select gender</label>
남성<input type="radio" id="male" name="gender" class="gender_ch inpt" style="width: 20px; height: 20px;" value="male">
여성<input type="radio" name="gender" id="female" name="radio" class="gender_ch inpt" style="width: 20px; height: 20px;" value="female">
	
								<!-- Wedding_Day -->
								<label for="gender">wedding_day</label>
										<input type="date" class="inpt" id="wedding_day"
											placeholder="Enter wedding_day" name="wedding_day">
							</section>
						            
						          <span class="tab prev" style="margin-left: 50px;"><a href="#signup"> << </a></span>
				            <span class="tab next"><a href="#signup"> >></a></span>		
				               
           					 </div>
					<!-- ----------------------------------------- 웨딩 ---------------------------------------------------------- -->	           
						           <div class="signup_next3 cont">

						<table class="table">
            <!-- 웨딩홀 지역 -->
            <tr>
               <td><div class="require">*</div>웨딩홀 지역</td>
               <td>
                  <select name="sido1" id="sido1"></select>
                  <select name="gugun1" id="gugun1"></select>
               </td>
            </tr>

            <!-- 지하철 노선 -->
            <tr>
               <td><div class="require">*</div>지하철 노선</td>
               <td>
                  <select id="subway01" name="subway01"></select> 
                  <select id="subway02" name="subway02"></select>
               </td>
            </tr>

            <!-- 웨딩홀 타입 -->
            <tr>
               <td><div class="require">*</div>웨딩홀 타입</td>
               <td>
              
                  <input type="radio" name="type" id="type01" value="일반웨딩홀">일반웨딩홀
                  <input type="radio" name="type" id="type02" value="야외웨딩홀">야외웨딩홀
                  <input type="radio" name="type" id="type03" value="전통웨딩홀">전통웨딩홀
                  <input type="radio" name="type" id="type04" value="호텔웨딩홀">호텔웨딩홀
                  <input type="radio" name="type" id="type05" value="공공기관">공공기관
               </td>
            </tr>

           
         </table>				
         
               <span class="tab prev" style="margin-left: 50px;"><a href="#signup"> << </a></span>
				            <span class="tab next"><a href="#signup"> >></a></span>		
					</div>
					
					
					 <div class="signup_next4 cont">
					<table class="table">
					 <!-- 식사 가격 -->
            <tr>
               <td ><div class="require">*</div>식사가격</td>
               <td>
              
               <input type="radio" name="meal_cost" id="meal_cost01" value="1~2만원">
               1~2만원 
               <input type="radio" name="meal_cost" id="meal_cost02" value="2~3만원">
               2~3만원 
               <input type="radio" name="meal_cost" id="meal_cost03" value="3~4만원">
               3~4만원
               <input type="radio" name="meal_cost" id="meal_cost04" value="4~5만원">
               4~5만원
               <input type="radio" name="meal_cost" id="meal_cost05" value="5~6만원">
               5~6만원
               <input type="radio" name="meal_cost" id="meal_cost06" value="6~7만원">
               6~7만원 
               <input type="radio" name="meal_cost" id="meal_cost07" value="7만원이상">
               7만원이상</td>
            </tr>

            <!-- 식사 메뉴 -->
            <tr>
               <td><div class="require">*</div>식사메뉴</td>
               <td>
               	  <input
                  type="radio" name="meal_menu" id="meal_menu01" value="양식">양식
                  <input type="radio"
                  name="meal_menu" id="meal_menu02" value="한식">한식
                   <input type="radio"
                  name="meal_menu" id="meal_menu03" value="일식">일식
                  <input type="radio"
                  name="meal_menu" id="meal_menu04" value="중식">중식
                   <input type="radio"
                  name="meal_menu" id="meal_menu05" value="뷔페">뷔페
                  </td>
            </tr>

            <!-- 하객수 -->
            <tr>
               <td><div class="require">*</div>하객수</td>
               <td>
               	  <input type="radio" name="visitor" id="visitor01" value="50~100명">50~100명
                  <input type="radio" name="visitor" id="visitor02" value="100~200명">100~200명 
                  <input type="radio" name="visitor" id="visitor03" value="200~300명">200~300명
                  <input type="radio" name="visitor" id="visitor04" value="300~400명">300~400명
                  <input type="radio" name="visitor" id="visitor05" value="400~500명">400~500명
                  <input type="radio" name="visitor" id="visitor06" value="500명이상">500명이상
            </tr>      
         </table>		
								      <span class="tab prev" style="margin-left: 50px;"><a href="#signup"> << </a></span>
				            <span class="tab next"><a href="#signup"> >></a></span>		
				            		
					</div>
					
					
					 <div class="signup_next5 cont">
					<table class="table">
					 <!-- 홀 가격 -->
            <tr>
               <td ><div class="require">*</div>홀 가격</td>
               <td>
              
               <input type="text" class="inpt" name="hall_cost" id="hall_cost" placeholder="hall cost를 입력하세요.">
               
             </td>
            </tr>

            <!-- 홀 이름 -->
            <tr>
               <td><div class="require">*</div>웨딩홀 이름</td>
               <td>
               	  <input
                  type="text" class="inpt" name="hall_name" id="hall_name" placeholder="hall name을 입력하세요.">
        
                  </td>
            </tr>

         </table>		
					<input type="button" id="btn"
										class="btn btn-default btn btn-warning button" value="Join">
							
							      <span class="tab prev" style="margin-left: 50px;"><a href="#signup"> << </a></span>
				            <span class="tab next"><a href="#signup"> >></a></span>		
										
					</div>
					
					
					
        					 </form>	
        					 
        					 
        					 	 
			        </div>
		    </article>
		    
		    
		    <div class="half bg"></div>
		    
		    
		    
	</section>



	<div id="google_btn">
	<button onclick="signOut()" class="btn btn-danger">SignOut</button>
	</div>



<!-- 위에서 생성한 <div>에 검색 기능을 표시하고, 결과를 입력할 <input>들과 연동한다 -->
<script>
$("#postcodify_search_button").postcodifyPopUp();
var number= 0;

var ch = false;
var auth = false;
var toggle = "";
var kind = "Customer";
var gender = "";
var auth_result ="";

var count=60;     
var counter=setInterval(timer, 1000); //1000 will  run it every 1 second
var min = 2;
var num = 0;

/* document.domain = "http://localhost/SemiProject/loginform_2.jsp	"; */
    $(function() { 
    	
    	dialog();
    	var result = document.getElementById("get_result").value;
    	
  
    if(result === "login"){
    	    $('.signin-cont').show();
	        $('.signup-cont').hide();
	        $('.signup_next2').hide();
	        $('.signup_next3').hide();
	        $('.signup_next1').hide();
	        $('.signup_next4').hide();
	        $('.signup_next5').hide();
    }else{
    	$('.tabs .tab').removeClass('active');
        $(".signup").addClass('active');
    	    $('.signin-cont').hide();
	        $('.signup-cont').show();
	        $('.signup_next2').hide();
	        $('.signup_next3').hide();
	        $('.signup_next1').hide();
	        $('.signup_next4').hide();
	        $('.signup_next5').hide();
	        
    }
    	
    	$(".next").click(function(){
    		if(number < 5){
    			number = number+1;
    		}
			if(number == 1){
				$('.tabs .tab').removeClass('active');
		        $('.next').addClass('active');
				  $('.signin-cont').hide();
			        $('.signup-cont').hide();
			        $('.signup_next2').hide();
			        $('.signup_next5').hide();
			        $('.signup_next3').hide();
			        $('.signup_next4').hide();
			        $('.signup_next1').show();
			}else if(number == 2){
				$('.tabs .tab').removeClass('active');
		        $('.next').addClass('active');
				  $('.signin-cont').hide();
			        $('.signup-cont').hide();
			        $('.signup_next1').hide();
			        $('.signup_next3').hide();
			        $('.signup_next4').hide();
			        $('.signup_next5').hide();
			        $('.signup_next2').show();
			}else if(number ==3){
				$('.tabs .tab').removeClass('active');
		        $('.next').addClass('active');
				  	$('.signin-cont').hide();
			        $('.signup_next1').hide();
			        $('.signup_next2').hide();
			        $('.signup-cont').hide();
			        $('.signup_next4').hide();
			        $('.signup_next5').hide();
			        $('.signup_next3').show();
			}else if(number ==4){
				$('.tabs .tab').removeClass('active');
		        $('.next').addClass('active');
				  	$('.signin-cont').hide();
			        $('.signup_next1').hide();
			        $('.signup_next2').hide();
			        $('.signup-cont').hide();
			        $('.signup_next3').hide();
			        $('.signup_next5').hide();
			        $('.signup_next4').show();
			}else if(number ==5){
				$('.tabs .tab').removeClass('active');
		        $('.next').addClass('active');
				  	$('.signin-cont').hide();
			        $('.signup_next1').hide();
			        $('.signup_next2').hide();
			        $('.signup-cont').hide();
			        $('.signup_next3').hide();
			        $('.signup_next4').hide();
			        $('.signup_next5').show();
			}
			
		});
		
		$(".prev").click(function(){
			if(number > 0){
				number = number-1;
			}
			if(number ==0){
				 $('.tabs .tab').removeClass('active');
			        $('.signup').addClass('active');
			 	$('.signin-cont').hide();
		        $('.signup_next3').hide();
		        $('.signup_next2').hide();
		        $('.signup_next1').hide();
		        $('.signup_next5').hide();
		        $('.signup_next4').hide();
		        $('.signup-cont').show();
			}else if(number ==1){
				 $('.tabs .tab').removeClass('active');
			        $('.prev').addClass('active');
			 	$('.signin-cont').hide();
		        $('.signup_next3').hide();
		        $('.signup_next2').hide();
		        $('.signup_next5').hide();
		        $('.signup-cont').hide();
		          $('.signup_next4').hide();
		        $('.signup_next1').show();
			}else if(number ==2){
				$('.tabs .tab').removeClass('active');
		        $('.prev').addClass('active');
			 	$('.signin-cont').hide();
		        $('.signup_next1').hide();
		        $('.signup_next3').hide();
		        $('.signup-cont').hide();
		        $('.signup_next5').hide();
		        $('.signup_next4').hide();
		        $('.signup_next2').show();
			}
			else if(number ==3){
				$('.tabs .tab').removeClass('active');
		        $('.prev').addClass('active');
			 	$('.signin-cont').hide();
		        $('.signup_next1').hide();
		        $('.signup_next2').hide();
		        $('.signup_next5').hide();
		        $('.signup-cont').hide();
		        $('.signup_next4').hide();
		        $('.signup_next3').show();
			}else if(number ==4){
				$('.tabs .tab').removeClass('active');
		        $('.prev').addClass('active');
			 	$('.signin-cont').hide();
		        $('.signup_next1').hide();
		        $('.signup_next2').hide();
		        $('.signup_next5').hide();
		        $('.signup-cont').hide();
		        $('.signup_next3').hide();
		        $('.signup_next4').show();	
			}
			
		});
    	
    	$("#postcodify").postcodify({
        insertPostcode5 : "#postcode",
        insertAddress : "#address",
        insertDetails : "#details",
        insertExtraInfo : "#extra_info",
        hideOldAddresses : false
    	}); 


		   $("#email_select").change(function(){
		    	var x  = $("#email_select").val();
		    	$(".select_result").val(x);	
		    });
		    
    	/* ============================================================================================ */
		   
    	
    	
    	
    	$(".sign_ch").change(function(){
    		
    		//alert($(this).val());
    		if ($(this).val() == "Customer") {
				kind = $(this).attr("value", "Customer").val();
				$(".require").text("*");
				$(".require").css("color","black");
			} else {
				kind = $(this).attr("value", "Business").val();
				$(".require").text("*");
				$(".require").css("color","red");
			}
    		
    		kind = $(this).val();
   		 
			$.get("./common" + kind + ".common",function(data){
				$("#add").html(data);
			});
    		
    		
    	});
    	

	/*---------------------------------- id 중복확인 start ----------------------------------------------------------*/
			 $("#sign_id").on({
				change : function() {
					ch = false;
				},
				blur : function() {
					var id = $(this).val().trim();
					id = $(this).val().replace(/ /g, '');

					//alert(id);
					$(this).val(id);
					
				 	$.ajax({
				 		type:"POST",
				 		url:"./commonIdCheck.common",
				 		data:{
				 			id:id
				 		},
				 		success: function(data){
				 			var result = data.trim();
				 			//alert("id check = "+result);
				 			if(result == "OK" && id !=""){
				 				ch = true;

									
								$("#result").text("사용가능한ID");
								$("#result").css("color","green");
							} else {
								ch = false;
								$("#result").text("사용불가능한ID");
								$("#result").css("color","red");

							}

				 			
				 		}
				 		
				 	});

				}
			});
	 
			 /*---------------------------------- id 중복확인 end ----------------------------------------------------------*/
			 
	  /*----------------------------------  회원가입 btn start ----------------------------------------------------------*/
	 
			$("#btn").click(function() {

				if (!ch) {
					alert("id  중복확인을 하세요");
				} else if (ch && $("#pw1").val().trim() !="" && $("#pw2").val().trim() !="" && $("#name").val().trim() !=""  && $("#phone").val().trim() !="" 
						&& $("#addr_main").val().trim() !="" && $("#addr_sub").val().trim() !="" && $("#select_result").val().trim() !="" ) {
					
					//&& !$("email:contains('@')").css("text-decoration", "underline")
					
					alert(document.getElementById('pw1').value.length+" / " +$("#pw1").val());
					if( ( $("#pw1").val().trim() == $("#pw2").val().trim() ) && document.getElementById('pw1').value.length >=8 ){
					
					//alert($("#pw1").val() + " / "+$("#pw2").val().trim());
					if (kind == "Customer") {
						//alert($(".gender_ch").val());
						
						//alert($("#birth").val().trim()+" / " + $("#wedding_day").val() +"  /  "+$(".gender_ch").val() + "  /  " +auth)
						if($("#birth").val().trim() !=""  && $("#wedding_day").val() !="" && $(".gender_ch").val() !="" && auth == true){
						document.frm.submit();
						}else{
							alert("고객정보를 확인해주세요.");
						}
						
					} else if (kind == "Business") {
						
					  if($('input[name=type]').val() !="" && $('input[name=meal_cost]').val() !="" && $('input[name=meal_menu]').val() !="" && $('input[name=visitor]').val() !="" 
							  && $('input[name=sido1]').val() !="" && $('input[name=gugun1]').val() !="" && $('input[name=subway01]').val() !="" && $('input[name=subway02]').val() !="" ){
					
						  if($("#company_name").val().trim() !=""  && $("#company_tel").val().trim() !=""  && $("#company_number").val().trim() !="" && auth == true){
							
						document.frm.setAttribute("action", "./commonJoinUp.common");
						document.frm.submit();
						
						}else{
							alert("사업자정보를 확인해주세요.");
						}
					
					  }else{
							alert("추가정보를 확인해주세요.");
					}
						
					
					}
					
				}else{
					alert("비밀번호를 확인해주세요.");
				}

				} else{
					alert("정보를 확인해주세요.");
				}


			});
			 
			/*----------------------------------  회원가입 btn end ----------------------------------------------------------*/
			
		   
    	
    });
    
    
    function timer()
    {
    	$("#timer").css("color","red");
      count=count-1;
      if (count < 0 && min==0)
      {
         clearInterval(counter);
         //counter ended, do something here
         
         return;
      }else{
    	  if(count<=0) {
    					if (min != 0) {
    						min = min - 1;
    						count = 59;
    					}
    		} 
      }
      
      if(min==0 && count==0){
    	  document.getElementById("timer").innerHTML="time over"; 
      }else{
      document.getElementById("timer").innerHTML=min+":"+count + " secs"; // watch for spelling
      $("#timer").css("color","red");
      //Do code for showing the number of seconds here	 
      }
    }

    function dialog() {

        var dialogBox = $('.dialog'),
            dialogTrigger = $('.dialog__trigger'),
            dialogClose = $('.dialog__close'),
            dialogTitle = $('.dialog__title'),
            dialogContent = $('.dialog__content'),
            dialogInput = $('.dialog__input'),
            timer = $('.timer'),
            dialogAction = $('.dialog__action');

        // Open the dialog
        dialogTrigger.on('click', function(e) {
        	
        	if($("#phone").val().trim() == ""){
    			alert("핸드폰번호를 입력해주세요.");
        	}else{
        		
        	
        	if(auth ==false){
        		
        		var phone = $("#phone").val();
        		//alert(phone);
        		
        	$.ajax({
    	 		type:"GET",
    	 		url:"./commonAuth.common",
    	 		data:{
    				phone:phone
    			},
    	 		success: function(data){	
    	 			var result = data.trim();
    	 			
    	 			if(result !="OK"){
    	 				
    	 				alert(" (-) or 문자를 제외한 번호만을 입력해주세요.");
    	 			}else{
    	 				count = 59;
    	 				min = 2;
    	 				 dialogBox.toggleClass('dialog--active');
    	 		         e.stopPropagation();
    	 		         timer();
    	 			}
    	 			
    	 			
    	 		}
    	 	});
      				  }else{
        				alert("이미 인증되었습니다.");
       				  }
        	}
           
        });

        /* dialogAction.on('click',function(e){
    	alert($('.dialog__input').val());
        }); */
        
        dialogInput.on({
    		change : function() {
    			auth = false;
    		},
    		blur : function() {
    			var auth_data = $('.dialog__input').val();
    			//alert(id);
    			
    		  	$.ajax({
    		 		type:"POST",
    		 		url:"./commonAuth.common",
    		 		data:{
    		 			auth:auth_data
    		 		},
    		 		success: function(data){
    		 			 auth_result = data.trim();
    		 			//alert("auth = "+auth_result);
    		 			if(auth_result == "OK" && auth_data !=""){
    		 				auth = true;
    		 				clearInterval(counter);
    		 				dialogInput.attr("readonly","readonly");
    						$("#timer").text("인증확인");
    						$("#timer").css("color","green");
    						
    					} else {
    						auth = false;
    						$("#timer").text("인증실패");
    						$("#timer").css("color","red");

    					}
    		 		}
    		 		
    		 	}); 

    		}
    	});
    	
        
        
        // Close the dialog - click close button
        dialogClose.on('click', function() {
            dialogBox.removeClass('dialog--active');
        });
        
        // Close the dialog - press escape key // key#27
        $(document).keyup(function(e) {
            if (e.keyCode === 27) {
                dialogBox.removeClass('dialog--active');
            }
        });
        
        // Close dialog - click outside
        $(document).on("click", function(e) {
            if ($(e.target).is(dialogBox) === false &&
                $(e.target).is(dialogTitle) === false &&
                $(e.target).is(dialogContent) === false &&
                $(e.target).is(dialogInput) === false &&
                $(e.target).is(timer) === false &&
                $(e.target).is(dialogAction) === false) {
                dialogBox.removeClass("dialog--active");
            }
        });

    }





    // Run function when the document has loaded

    /*  */

    $('.btn-example').click(function(){
        var $href = $(this).attr('href');
        layer_popup($href);
    });


    function layer_popup(el){

        var $el = $(el);        //레이어의 id를 $el 변수에 저장
        var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();
        var $elWidth = ~~($el.outerWidth()),
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        // 화면의 중앙에 레이어를 띄운다.
        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({
                marginTop: -$elHeight /2,
                marginLeft: -$elWidth/2
            })
        } else {
            $el.css({top: 0, left: 0});
        }

        $el.find('a.btn-layerClose').click(function(){
            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
            return false;
        });

        $('.layer .dimBg').click(function(){
            $('.dim-layer').fadeOut();
            return false;
        });

    }


    /*----------------------------------  auth popup  end ----------------------------------------------------------*/
    		 
    
</script>

<script type="text/javascript">

FB.init({
    appId: '138117166836292',
    status: true, 
    cookie: true, 
    xfbml: true
});    


<!-- 위에서 생성한 <div>에 검색 기능을 표시하고, 결과를 입력할 <input>들과 연동한다 -->


$('.tabs .tab').click(function(){
    if ($(this).hasClass('signin')) {
    	number=0;
    	$('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.signup-cont').hide();
        $('.signup_next1').hide();
        $('.signup_next2').hide();
        $('.signup_next3').hide();
        $('.signup_next4').hide();
        $('.signup_next5').hide();
        $('.signin-cont').show();
    }
    if ($(this).hasClass('signup')) {
    	number=0;
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.signin-cont').hide();
        $('.signup_next1').hide();
        $('.signup_next2').hide();
        $('.signup_next3').hide();
        $('.signup_next4').hide();
        $('.signup_next5').hide();
        $('.signup-cont').show();
    }
   
    
    
});
$('.container .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 30);
    var amountMovedY = (e.pageY * -1 / 9);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
/*------------------------------------------ 시도 군구 ---------------------------------------*/

var area0 = [ "시/도", "서울특별시", "인천광역시", "대전광역시", "광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주도" ];
var area1 = [ "군/구", "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ];
var area2 = [ "군/구", "계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군" ];
var area3 = [ "군/구", "대덕구", "동구", "서구", "유성구", "중구" ];
var area4 = [ "군/구", "광산구", "남구", "동구", "북구", "서구" ];
var area5 = [ "군/구", "남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군" ];
var area6 = [ "군/구", "남구", "동구", "북구", "중구", "울주군" ];
var area7 = [ "군/구", "강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군" ];
var area8 = [ "군/구", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군" ];
var area9 = [ "군/구", "강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군" ];
var area10 = [ "군/구", "제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군" ];
var area11 = [ "군/구", "계룡시", "공주시", "논산시", "보령시", "서산시", "아산시", "천안시", "금산군", "당진군", "부여군", "서천군", "연기군", "예산군", "청양군", "태안군", "홍성군" ];
var area12 = [ "군/구", "군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군" ];
var area13 = [ "군/구", "광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군" ];
var area14 = [ "군/구", "경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군" ];
var area15 = [ "군/구", "거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군" ];
var area16 = [ "군/구", "서귀포시", "제주시", "남제주군", "북제주군" ];

// 시/도 선택 박스 초기화
$("select[name^=sido]").each(function() {
$selsido = $(this);
$.each(eval(area0), function() {
$selsido.append("<option value='" + this + "'>" + this + "</option>");
});
$selsido.next().append("<option value=''>군/구</option>");
});

// 시/도 선택시 구/군 설정
$("select[name^=sido]").change(function() {
var area = "area" + $("option", $(this)).index($("option:selected", $(this))); // 선택지역의 구군 Array
var $gugun = $(this).next(); // 선택영역 군구 객체
$("option", $gugun).remove(); // 구군 초기화
if (area == "area0")
$gugun.append("<option value=''>구/군</option>");else {
$.each(eval(area), function() {
$gugun.append("<option value='" + this + "'>" + this + "</option>");
});
}
});


/*---------------------------------------------------------지하철----------------------------------------------------  */

var subway0 = [ "지하철", "1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선", "9호선", "경부선", "경의선", "경원선", "장안선", "경축선", "중앙선", "경인선", "안산선", "과천선", "분당선", "일산선", "공항철도선", "인천1호선", "분당선", "신분당선"];

$("select[name=subway01]").each(function() {
$selssub = $(this);
$.each(eval(subway0), function() {
$selssub.append("<option value='" + this + "'>" + this + "</option>");
});
$selssub.next().append("<option value=''>역선택</option>");
});

$("#subway01").change(function() {
$("#subway02 option").remove();
$("#subway02").append("<option value=''>역선택</option>");
var index = 0;
$.ajax({
url: "../json/subway.json",
type: "GET",
success: function(data) {
while(data[index] != null) {
if($("#subway01").val().trim() == data[index].line.trim()) {
$("#subway02").append("<option value='"+data[index].subway+"'>"+data[index].subway+"</option>");
}
index++;
}
}
});
});


</script>
</body>
</html>

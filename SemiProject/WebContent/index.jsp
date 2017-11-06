<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="./js/jquery.waterwheelCarousel.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

jQuery library
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

Latest compiled JavaScript
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 -->
<script src="https://apis.google.com/js/platform.js"></script>

<meta name="google-signin-client_id" content="761108002241-lnbll7rt3dlsvv20g153605ntvaa2vub.apps.googleusercontent.com">



</head>
<body>

	<a href= "./member/memberLogin.member">login</a> <br><br>
	<a href= "./member/memberPw.member">pw</a> <br><br>
	<a href= "./member/memberEmail.member">email</a> <br><br>
	<a href= "./member/memberSelPhone.member">selphone</a> <br><br>
	<a href= "./member/memberAuth.member">Authorization</a> <br><br>
	<a href= "./member/memberUpload.member">Upload</a> <br><br>
		<a href= "./function/functionCalendar.function">Calendar</a> <br><br>
	

  <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark" id="myP"></div>
    
    <div id="signin"></div>
    
    <img id="myImg"> <br>
    <p id="name"></p>
    
    <div id="status">
    </div>
    
    <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        		alert(name);
        var profile = googleUser.getBasicProfile();
		var imagurl = profile.getImageUrl();
		var name= profile.getName();
		var email = profile.getEmail();
		
		console.log(imagurl);
		console.log(name);
		console.log(email);
	
		
		document.getElementById("myImg").src= imagurl;
		document.getElementById("name").innerHTML= name;
		document.getElementById("myP").style.visibility ="hidden";
		document.getElementById("status").innerHTML ='Welcome' + name+'!<a href = success.jsp?email='+email+'&name='+name+'>';
		
      };
    </script>
    
    
    <button onclick="myFunction()">Sign out</button>
   


<script> 
function myFunction(){
gapi.load('auth2',function(){
	
	gapi.auth2.init();
	
	
});    
}

/* function myFunction(){
	gapi.auth2.getAuthInstance().disconnect();
	location.reload();
	alert("logout");
}
 */
</script>


</body>
</html>

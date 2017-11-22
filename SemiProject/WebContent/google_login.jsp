
<!-- login success -->
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SignUp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<meta name="google-signin-client_id" content="761108002241-lnbll7rt3dlsvv20g153605ntvaa2vub.apps.googleusercontent.com">

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
	   console.log("ID: " + profile.getId()); // Don't send this directly to your server!
       console.log('Full Name: ' + profile.getName());
       console.log('Given Name: ' + profile.getGivenName());
       console.log('Family Name: ' + profile.getFamilyName());
       console.log("Image URL: " + profile.getImageUrl());
       console.log("Email: " + profile.getEmail());
     

       // The ID token you need to pass to your backend:
       var id_token = googleUser.getAuthResponse().id_token;
       console.log("ID Token: " + id_token);
}

/* logout problem not success */

function signOut(){
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function(){
		
		
		alert("you have been successfully signed out");
		
		$(".g-signin2").css("display","block");
		$(".data").css("display","none");
		gapi.auth2.getAuthInstance().disconnect();
		 document.location.reload();
	 	//window.location = "https://accounts.google.com/logout/oauth/oauthchooseaccount?client_id=761108002241-lnbll7rt3dlsvv20g153605ntvaa2vub.apps.googleusercontent.com&as=7876d5328e673acf&destination=http%3A%2F%2Flocalhost&approval_state=!ChRSXzBJM3JVQjZDamJmSWwzamxVchIfa3hlcnh0dk95R1lmWUg3R0Q2SDQtRUVFdHRjSTl4VQ%E2%88%99AHw7d_cAAAAAWflEkX0XvKgctsuTYp3TEb_3VVpJaPfx&xsrfsig=AHgIfE9cx2k7s05Su8UDR8R0lrxlky_ISA&flowName=GeneralOAuthFlow";
 
//  window.location = "https://accounts.google.com/signin/oauth/oauthchooseaccount?client_id=761108002241-lnbll7rt3dlsvv20g153605ntvaa2vub.apps.googleusercontent.com&as=435bb532cbc7b544&destination=http%3A%2F%2Flocalhost&approval_state=!ChRlOVdlcUwzQzRGalZ6WEROTi1pZhIfRTlhTVNaV29QdW9TTUlqOWRic2JOcFlFMGo4Sjl4VQ%E2%88%99AHw7d_cAAAAAWflGO3aimfMHLEkriWDcchlEipPNbQpA&passive=1209600&oauth=1&sarp=1&scc=1&xsrfsig=AHgIfE8RPUwR2SXnIkgLwf-s_CNxDxSgqQ&flowName=GeneralOAuthFlow";
 
 //window.location = " http://www.google.com/accounts/_ah/logout?continue=https://accounts.google.com/signin/oauth/oauthchooseaccount?client_id=761108002241-lnbll7rt3dlsvv20g153605ntvaa2vub.apps.googleusercontent.com&as=435bb532cbc7b544&destination=http%3A%2F%2Flocalhost&approval_state=!ChRlOVdlcUwzQzRGalZ6WEROTi1pZhIfRTlhTVNaV29QdW9TTUlqOWRic2JOcFlFMGo4Sjl4VQ%E2%88%99AHw7d_cAAAAAWflGO3aimfMHLEkriWDcchlEipPNbQpA&passive=1209600&oauth=1&sarp=1&scc=1&xsrfsig=AHgIfE8RPUwR2SXnIkgLwf-s_CNxDxSgqQ&flowName=GeneralOAuthFlow";
 
//gapi.auth2.getAuthInstance().logout();
	 
	 
		//gapi.auth2.authorize({client_id:761108002241-lnbll7rt3dlsvv20g153605ntvaa2vub.apps.googleusercontent.com, scope: SCOPES, immediate: false}, handleAuth);
		//document.location.href = "https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost/SemiProject/google_login.jsp";

		/* https://accounts.google.com/signin/oauth/oauthchooseaccount?client_id=761108002241-lnbll7rt3dlsvv20g153605ntvaa2vub.apps.googleusercontent.com&as=435bb532cbc7b544&destination=http%3A%2F%2Flocalhost&approval_state=!ChRlOVdlcUwzQzRGalZ6WEROTi1pZhIfRTlhTVNaV29QdW9TTUlqOWRic2JOcFlFMGo4Sjl4VQ%E2%88%99AHw7d_cAAAAAWflGO3aimfMHLEkriWDcchlEipPNbQpA&passive=1209600&oauth=1&sarp=1&scc=1&xsrfsig=AHgIfE8RPUwR2SXnIkgLwf-s_CNxDxSgqQ&flowName=GeneralOAuthFlow
		 */
		
	});
}


</script>



</head>
<body>

<div class="g-signin2" data-onsuccess="onSignIn"></div>

<div class="data">
	<p>Profile Details</p>
	<img id="pic" class="img-circle" width="100" height="100"/>
	<p>Email Address</p>
	<p id="email" class="alert alert-danger"></p>
	<p id="result"></p>
	
	<button onclick="signOut()" class="btn btn-danger">SignOut</button>

</div>




</body>
</html>





<!-- login success -->
<!-- <!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SignUp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<meta name="google-signin-client_id" content="761108002241-lnbll7rt3dlsvv20g153605ntvaa2vub.apps.googleusercontent.com">

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
	});
}

</script>

</head>
<body>

<div class="g-signin2" data-onsuccess="onSignIn"></div>

<div class="data">
	<p>Profile Details</p>
	<img id="pic" class="img-circle" width="100" height="100"/>
	<p>Email Address</p>
	<p id="email" class="alert alert-danger"></p>
	
	<button onclick="signOut()" class="btn btn-danger">SignOut</button>

</div>

</body>
</html>

 -->


<!-- login fail -->
<!-- 


		<div class="col-md-6">
				<button class="g-signin " 
					data-scope="https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/userinfo.email"
					data-requestvisibleactions="http://schemas.google.com/AddActivity"
					data-clientId="761108002241-lnbll7rt3dlsvv20g153605ntvaa2vub.apps.googleusercontent.com"
					data-accesstype="offline"
					data-callback="mycoddeSignIn"
					data-theme="dark"
					data-cookiepolicy="single_host_origin">
				</button>
			</div>
	

    Bootstrap core JavaScript
    ==================================================
    Placed at the end of the document so the pages load faster
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
 

	<script type="text/javascript">
	var gpclass = (function(){
	
	//Defining Class Variables here
	var response = undefined;
	return {
		//Class functions / Objects
		
		mycoddeSignIn:function(response){
			// The user is signed in
			if (response['access_token']) {
			
				//Get User Info from Google Plus API
				gapi.client.load('plus','v1',this.getUserInformation);
				
			} else if (response['error']) {
				// There was an error, which means the user is not signed in.
				//alert('There was an error: ' + authResult['error']);
			}
		},
		
		getUserInformation: function(){
			var request = gapi.client.plus.people.get( {'userId' : 'me'} );
	
			request.execute( function(profile) {
				var email = profile['emails'].filter(function(v) {
					return v.type === 'account'; // Filter out the primary email
				})[0].value;
				var fName = profile.displayName;
				$("#inputFullname").val(fName);
				$("#inputEmail").val(email);
				
				alert(email + fName);
			});
		}
	
	}; //End of Return
	})();
	
	function mycoddeSignIn(gpSignInResponse){
		gpclass.mycoddeSignIn(gpSignInResponse);
	}
	</script>  -->
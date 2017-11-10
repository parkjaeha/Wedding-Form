<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<script src="http://connect.facebook.net/en_US/all.js"></script>


</head>
<body>
<fb:login-button autologoutlink="true" onlogin="OnRequestPermission();">
</fb:login-button>
<script language="javascript" type="text/javascript">
    FB.init({
        appId: '138117166836292',
        status: true, 
        cookie: true, 
        xfbml: true
    });    
</script>


</body>
</html>

 
 <!-- facebook login success -->
 <%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">


function getUserData() {
	FB.api('/me', function(response) {
		document.getElementById('response').innerHTML = 'Hello ' + response.name;
	});
}

window.fbAsyncInit = function() {
	//SDK loaded, initialize it
	FB.init({
		appId      : '138117166836292',
		xfbml      : true,
		version    : 'v2.10'
	});

	//check user session and refresh it
	FB.getLoginStatus(function(response) {
		if (response.status === 'connected') {
			//user is authorized
			document.getElementById('loginBtn').style.display = 'none';
			//getUserData();
		} else {
			//user is not authorized
			 FB.login(function(response) {
				  if (response.status === 'connected') {
					   alert("login connected");
						getUserData();
				    // Logged into your app and Facebook.
				  } else {
					  alert("login not connected");
				    // The person is not logged into this app or we are unable to tell. 
				  }
				});
			
		}
	});
};

//load the JavaScript SDK
(function(d, s, id){
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) {return;}
	js = d.createElement(s); js.id = id;
	js.src = "//connect.facebook.com/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

//add event listener to login button
document.getElementById('loginBtn').addEventListener('click', function() {
	//do the login
	FB.login(function(response) {
		if (response.authResponse) {
			//user just authorized your app
			document.getElementById('loginBtn').style.display = 'none';
			getUserData();
		}
	}, {scope: 'email,public_profile', return_scopes: true});
}, false);

function fbLogoutUser() {
    FB.getLoginStatus(function(response) {
        if (response && response.status === 'connected') {
            FB.logout(function(response) {
                document.location.reload();
            });
        }
    });
}


</script>

<meta charset="UTF-8">
</head>
<body>

1
2
3
4
 
<!--  <fb:login-button  scope="manage_pages,read_insights,ads_management" autologoutlink="true" size="large"></fb:login-button>
 --> 
<button id="loginBtn" >Facebook Login</button>
<button onclick=fbLogoutUser()>logOut</button>

<div id="response"></div>


</body>
</html>
  --%>
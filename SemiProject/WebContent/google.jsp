<!-- google login -->

<html lang="en">
  <head>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="761108002241-lnbll7rt3dlsvv20g153605ntvaa2vub.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
  </head>
  <body>
    <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
    
    <img id="myImg"> <br>
    <p id="name"></p>
    
    <div id="status">
    </div>
    
    <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
		var imagurl = profile.getImageUrl();
		var name= profile.getName();
		var email = profile.getEmail();
		document.getElementById("myImg").src= imagurl;
		document.getElementById("name").innerHTML= name;
		document.getElementById("status").innerHTML ='Welcome' + name+'!<a href = success.jsp?>'
		
      };
    </script>
    
    
    <button onclick="myFunction()">Sign out</button>
    
    <script type="text/javascript">
    function myFunction(){
    	gapi.auth2.getAuthInstance().disconnect();
    	loaction.reload();
    }
    
    </script>
    
  </body>
</html>
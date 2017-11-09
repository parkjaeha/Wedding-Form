<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
	* {
	  box-sizing: border-box;
	}
	
	#myInput {
	  background-image: url('../image/common/searchicon.gif');
	  background-position: 10px 12px;
	  background-repeat: no-repeat;
	  width: 100%;
	  font-size: 16px;
	  padding: 12px 20px 12px 40px;
	  border: 1px solid #ddd;
	  margin-bottom: 12px;
	}
	
	#myUL {
	  list-style-type: none;
	  padding: 0;
	  margin: 0;
	}
	
	#myUL li a {
	  border: 1px solid #ddd;
	  margin-top: -1px; /* Prevent double borders */
	  padding: 12px;
	  text-decoration: none;
	  font-size: 18px;
	  color: black;
	  display: block
	}
	
	#myUL li a:hover:not(.header) {
	  background-color: #eee;
	}
	</style>
</head>
<body>
	<h2>My Phonebook</h2>
	
	<input type="text" id="myInput" onkeyup="searchFunction()" placeholder="웨딩홀 이름을 입력해주세요">
	
	<div>
		<ul id="myUL">
		  <li><a href="#">Adele</a></li>
		  <li><a href="#">Agnes</a></li>
		
		  <li><a href="#">Billy</a></li>
		  <li><a href="#">Bob</a></li>
		
		  <li><a href="#">Calvin</a></li>
		  <li><a href="#">Christina</a></li>
		  <li><a href="#">Cindy</a></li>
		</ul>
	</div>
	
	<script>
	function searchFunction() {
	    var input, filter, ul, li, a, i;
	    input = document.getElementById("myInput");
	    filter = input.value.toUpperCase();
	    ul = document.getElementById("myUL");
	    li = ul.getElementsByTagName("li");
	    console.log("li.length: " + li.length);
	    for (i = 0; i < li.length; i++) {
	        a = li[i].getElementsByTagName("a")[0];
	        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
	            li[i].style.display = "";
	        } else {
	            li[i].style.display = "none";
	
	        }
	    }
	}
	</script>

</body>
</html>
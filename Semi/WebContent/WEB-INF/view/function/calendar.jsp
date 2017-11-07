<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>자바스크립트 달력</title>
<!-- 	<link href="css/style.css" rel="stylesheet">	
 -->

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

 <style type="text/css">

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
* {font-family: 'Nanum Gothic', serif;}

#kCalendar {width: 1000px; height: 948px; border: 1px solid black;}

#kCalendar #header {height: 50px; line-height: 50px; text-align: center; font-size: 18px; font-weight: bold;  background: #1abc9c;}
#kCalendar .button {color: #000; text-decoration: none;}

#kCalendar table {width: 1000px; height: 800px;}
#kCalendar caption {display: table-caption;  text-align: center;}


.month {
  padding: 40px 0px;
    width: 100%;
    background: #1abc9c;
    text-align: center;
    font-weight: bold;
}

.weekdays {
    padding: 80px 0;
    background-color:#ddd;
}

.days{
padding: 10px 0;
    background: #eee;
    margin: 0;
}

.active {
    padding: 5px;
    background: #1abc9c;
    color: white !important
}

#kCalendar .sun {text-align: center; color: deeppink; border: 1px solid white;}
#kCalendar .mon {text-align: center; border: 1px solid white;}
#kCalendar .tue {text-align: center; border: 1px solid white;}
#kCalendar .wed {text-align: center; border: 1px solid white;}
#kCalendar .thu {text-align: center; border: 1px solid white;}
#kCalendar .fri {text-align: center; border: 1px solid white;}
#kCalendar .sat {text-align: center; color: deepskyblue; border: 1px solid white;}
 
 </style>


<script type="text/javascript">

var newwindows;

	$(function(){
		//$("#btn").click(function(){
			//$("#result").load("ajax_3_result.jsp");
			
			//quick start
			$.get("./functionCalendar1.function", function(data){
				
				//alert(data);
				var data2 = $("#kCalendar").html(data);
				
				
			});

		//});
		
	
		
		//이벤트 위임
		$("#kCalendar").on("click", ".click",function(){
			var id = this.getAttribute('id');
			//alert("btn2" + id);
			
			$.ajax({
		 		type:"POST",
		 		url:"../function/functionCalData.function",
		 		data:{
		 			id:id
		 		},
		 		success: function(data){
				
		 			newwindows = window.open('./functionCalopen.function?data='+data+'', "_blank", "scrollbars=1,resizable=1,height=300,width=450");
		 			
		 			
		 		//alert(data);
		 		
		 		//location.href="../function/functionCalopen.function?data="+data;

		 		//var myWindow = window.open("", "myWindow", "width=200,height=100");
		 	    //myWindow.document.write(data+"<br>"+"<button>submit</button>"+"<br>"+"<button>submit</button>");
		 	  
		 			
		 		}
		 		
		 	});
			
			
		});
		
	});

</script>	
</head>
<body>
	<div id="kCalendar"></div>

</body>
</html>
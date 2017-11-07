<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="./js/jquery.waterwheelCarousel.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style type="text/css">

.bar{
	margin-left:30px;
	margin-top:30px;
	width:300px;
	background: #eee;
	padding:  3px;
	margin-bottom:10px;
	box-shadow:inset 0 1px 3px rgba(0,0,0,.2);
	border-radius:3px;
	box-sizing:border-box;
}
.bar-fill{

	height:20px;
	display:block;
	background: cornflowerblue;
	width: 0;
	border-radius:3px;
	
	transition:width 0.8s ease;
}

.bar-fill-text{
	color:#fff;
	padding:3px;
}

</style>

</head>
<body>


<div class="bar">
	<span class="bar-fill" id="pb"><span class="bar-fill-text">40%</span></span>
 </div>


<script type="text/javascript">

	(function(){
		
		
		var bar = $('.bar');
		var percent = $('.bar-fill');
		var status = $('.bar-fill-text');
		

		$('form').ajaxForm({
			
			beforeSend: function(){
				
			},
			uploadProgress: function(event,position,total,percentComplete){
			
				var percentValue = percentComplete + '%';
				bar.width(percentValue);
				percent.html(percentValue);
				
			},
			success: function(d){
				var percentValue = '100%';
				bar.width(percentValue);
				percent.html(percentValue);
				$('#ful').val('');
				alert(d);
			},
			complete: function(xhr){
				status.html(xhr.responseText);
			}
			
			
		});
		
		
	});


</script>


</body>
</html>
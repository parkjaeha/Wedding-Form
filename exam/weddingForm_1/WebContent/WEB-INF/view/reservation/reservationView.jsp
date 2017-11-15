<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='../fullCalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='../fullCalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='../lib/moment.min.js'></script>
<script src='../lib/jquery.min.js'></script>
<script src='../fullCalendar/fullcalendar.min.js'></script>

<script type="text/javascript">
$(document).ready(function() {
	var events = []
	var id = $("#company").val();
	$.ajax({
		url: "./reservationView.reservation",
		type: "POST",
		data: {
			id: id 
		},
		async: false,
		success: function(data) {
			events = JSON.parse(data);
		}
	});
	
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,basicWeek,basicDay'
		},
		defaultDate: '2017-11-12',
		navLinks: true, // can click day/week names to navigate views
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		events: events
	});
	
	
});
	
</script>

<title>Insert title here</title>

<style type="text/css">
	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}
</style>

</head>
<body>
	<h1>${reservation}</h1>
	<input id="company" type="hidden" value="${id}">
	<div id='calendar'></div>
</body>
</html>
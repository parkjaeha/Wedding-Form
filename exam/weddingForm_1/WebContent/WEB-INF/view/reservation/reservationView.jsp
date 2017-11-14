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
		/* events: [
			{
				title: 'All Day Event',
				start: '2017-11-01'
			},
			{
				title: 'Long Event',
				start: '2017-11-07',
				end: '2017-11-10'
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: '2017-11-09T16:00:00'
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: '2017-11-16T16:00:00'
			},
			{
				title: 'Conference',
				start: '2017-11-11',
				end: '2017-11-13'
			},
			{
				title: 'Meeting',
				start: '2017-11-12T10:30:00',
				end: '2017-11-12T12:30:00'
			},
			{
				title: 'Lunch',
				start: '2017-11-12T12:00:00'
			},
			{
				title: 'Meeting',
				start: '2017-11-12T14:30:00'
			},
			{
				title: 'Happy Hour',
				start: '2017-11-12T17:30:00'
			},
			{
				title: 'Dinner',
				start: '2017-11-12T20:00:00'
			},
			{
				title: 'Birthday Party',
				start: '2017-11-13T07:00:00'
			},
			{
				title: 'Click for Google',
				url: 'http://google.com/',
				start: '2017-11-28'
			}
		] */
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
	<h1>RESERVATION VIEW PAGE(ID 01)</h1>
	<div id='calendar'></div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    	google.charts.load('current', {packages: ['corechart']});     
    </script>
<title>Insert title here</title>
</head>
<body>
	<div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div>
	<script language="JavaScript">
	function drawChart() {
	   // Define the chart to be drawn.
	   var data = google.visualization.arrayToDataTable([
	      ['Fruit', 'Jane', 'John', 'Average'],
	      ['Apples', 3, 2, 2.5],
	      ['Oranges', 2, 3, 2.5],
	      ['Pears', 1, 5, 3],
	      ['Bananas', 3, 9, 6],
	      ['Plums', 4, 2, 3]      
	    ]);
	  
	   // Set chart options
	   var options = {
	      title : 'Fruits distribution',
	      vAxis: {title: 'Fruits'},
	      hAxis: {title: 'Person'},
	      seriesType: 'bars',
	      series: {2: {type: 'line'}}
	   };
	
	   // Instantiate and draw the chart.
	   var chart = new google.visualization.ComboChart(document.getElementById('container'));
	   chart.draw(data, options);
	}
	google.charts.setOnLoadCallback(drawChart);
	</script>

</body>
</html>
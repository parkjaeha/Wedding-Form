<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript">
	
	// Load the Visualization API and the piechart package.
    google.charts.load('current', {'packages':['corechart']});
      
    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart);
	
    function drawChart() {
    	var test="[['2004', 1000, 400],['2005', 1170, 460],['2006', 660, 1120],['2007', 1030, 540]]";
		$.ajax({
			type: "POST",
			url: "test.json",
			success:function(result){
				 // Create our data table out of JSON data loaded from server.
			      var data = new google.visualization.DataTable();
			      data.addColumn('string', 'region');
			      data.addColumn('number', '2016.01');
			      data.addRows(result);
			      
			      var options = {'title':'차트 테스트',
	                       'width':800,
	                       'height':600};

			      // Instantiate and draw our chart, passing in some options.
			      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
			      
			      chart.draw(data, options);
			}
		});
	}
	</script>
</head>
<body>
	<!--Div that will hold the pie chart-->
    <div id="chart_div"></div>
</body>
</html>
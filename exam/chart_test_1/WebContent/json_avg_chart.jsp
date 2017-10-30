<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<!-- JQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
	<script type="text/javascript">
	    
    	
    	$(function() {
			// Load the Visualization API and the corechart package.
		    google.charts.load('current', {'packages':['corechart']});
		
		    // Set a callback to run when the Google Visualization API is loaded.
		    google.charts.setOnLoadCallback(drawChart);
		    
		    $("#region").change(drawChart);
    		
    	});
		
    	
	    function drawChart() {
	    	var selector = $("#region").val();
	    	
    	  	// 해당 지역 월별로 보기
    	  	$.ajax({
				type: "GET",
				url: "./sample.json",
				success:function(result){
					var avg = new Array();
					
					for(var i = 0; i < result.length; i++) {
						avg[i] = 0;
						avg[i] = avg[i] + result[i].sixteen_one + result[i].sixteen_two + result[i].sixteen_three
						+ result[i].sixteen_four + result[i].sixteen_five + result[i].sixteen_six + result[i].sixteen_seven
						+ result[i].sixteen_eight + result[i].sixteen_nine + result[i].sixteen_ten + result[i].sixteen_one
						+ result[i].sixteen_eleven + result[i].sixteen_twelve;
					}
					
					// Create the data table.
			        var data = new google.visualization.DataTable();
			        data.addColumn('string', '전국');
			        data.addColumn('number', '혼인건수');
					for(var i=1; i<result.length; i++) {
						data.addRows([[result[i].region, avg[i]]]);
					}
					
					
					// Set chart options
					var options = {'title':'지역별 혼인건수 평균',
					               'width':1000,
					               'height':800};
					
					// Instantiate and draw our chart, passing in some options.
					var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
					chart.draw(data, options);
				}
 	  		});
    	}

	</script>	
</head>
<body>
	<div id="chart_div"></div>
</body>
</html>

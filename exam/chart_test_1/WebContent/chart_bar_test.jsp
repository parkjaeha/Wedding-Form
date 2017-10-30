<%@page import="java.util.ArrayList"%>
<%@page import="com.weddingform.chart.DataParsing"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	DataParsing dataParsing = new DataParsing();
	ArrayList<String> ar = dataParsing.getParse("year");
	ArrayList<String> ar2 = dataParsing.getParse("total");
	int index = -1;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script type="text/javascript">
	      // Load the Visualization API and the corechart package.
	      google.charts.load('current', {'packages':['corechart']});

	      // Set a callback to run when the Google Visualization API is loaded.
	      google.charts.setOnLoadCallback(drawChart);
	
	      function drawChart() {
	    	  
	    	  	// 해당 지역 월별로 보기
	
				// Create the data table.
				var data = new google.visualization.DataTable();
				data.addColumn('string', '날짜');
				data.addColumn('number', '전국');
				data.addColumn('number', '서울');
				data.addRows([
				  ['2016.01', 3, 1],
				  ['2016.02', 1, 2],
				  ['2016.03', 1, 3],
				  ['2016.04', 1, 3],
				  ['2016.05', 1, 3],
				  ['2016.06', 1, 3],
				  ['2016.07', 1, 3],
				  ['2016.08', 1, 3],
				  ['2016.09', 1, 3],
				  ['2016.10', 1, 3],
				  ['2016.11', 1, 5],
				  ['2016.12', 2, 2]
				]);
				
				/* for(var i=0; i<4; i++) {
					data.addRows([['전국', 3+i, 1+i]]);
				} */
				
				
				// Set chart options
				var options = {'title':'차트 테스트',
							   'legend':{ position: 'bottom' },
				               'width':1000,
				               'height':800};
				
				/* var options = {
				        title: 'Company Performance',
				        curveType: 'function',
				        legend: { position: 'bottom' }
				      }; */
				
				// Instantiate and draw our chart, passing in some options.
				var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
				chart.draw(data, options);
	      }
    </script>

<title>Google Chart Example</title>
</head>
<body>
	<!--Div that will hold the pie chart-->
    <div id="chart_div"></div>
</body>
</html>
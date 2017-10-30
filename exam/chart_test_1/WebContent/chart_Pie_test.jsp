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

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {
    	// 지역별 평균 보기

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', '전국');
        data.addColumn('number', '혼인건수');
        data.addRows([
          ['서울', 6],
          ['부산', 4],
          ['안산', 3],
          ['인천', 2]
        ]);
        

        // Set chart options
        var options = {'title':'2016년 평균',
                       'width':800,
                       'height':600};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
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
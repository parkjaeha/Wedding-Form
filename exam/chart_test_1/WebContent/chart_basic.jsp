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

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addColumn('number', 'test');
        data.addRows([
          ['조은비', 3, 1],
          ['박재하', 1, 2],
          ['정도원', 1, 3],
          ['이응진', 1, 5],
          ['웨딩폼', 2, 2]
        ]);
        
        <%-- var str = "[{label: 'Year', id: 'year'},{label: 'Sales', id: 'Sales', type: 'number'}],";
        for(var i=0; i < <%= ar.size() %>; i++) {
        	<%= index++ %>
        	if(i == <%= ar.size()-1 %>) {
	        	str = str + "['<%=ar.get(index)%>','<%=ar2.get(index)%>']";
        	} else {
        		str = str + "['<%=ar.get(index)%>','<%=ar2.get(index)%>'],";
        	}
        }
        
        var data = google.visualization.arrayToDataTable(str); --%>
        
        
        /* var data = google.visualization.arrayToDataTable([
            [ {label: 'Year', id: 'year'},
              {label: 'Sales', id: 'Sales', type: 'number'}, // Use object notation to explicitly specify the data type.
              {label: 'Expenses', id: 'Expenses', type: 'number'},
              {label: 'EUNGJIN', id: 'eungjin', type: 'number'} 
            	  
            ],
            ['2014', 1000, 400, 200],
            ['2015', 1170, 460, 590],
            ['2016', 660, 1120, 2039],
            ['2017', 1030, 540, 2309]]); */

        // Set chart options
        var options = {'title':'차트 테스트',
                       'width':800,
                       'height':600};

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
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
		    google.charts.setOnLoadCallback(drawChartCombo);
		    google.charts.setOnLoadCallback(drawChartAvg);
		    
		    $("#region").change(drawChartCombo);
    		
    	});
    	
    	function drawChartAvg() {
	    	var selector = $("#region").val();
	    	
    	  	// 해당 지역 월별로 보기
    	  	$.ajax({
				type: "GET",
				url: "./sample.json",
				success:function(result){
					var avg = new Array(12);
					
					for(var i = 0; i < result.length; i++) {
						avg[i] = 0;
						avg[i] = avg[i] + result[i].sixteen_1 + result[i].sixteen_2 + result[i].sixteen_3
						+ result[i].sixteen_4 + result[i].sixteen_5 + result[i].sixteen_6 + result[i].sixteen_7
						+ result[i].sixteen_8 + result[i].sixteen_9 + result[i].sixteen_10 + result[i].sixteen_11
						+ result[i].sixteen_11 + result[i].sixteen_12;
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
					var chart = new google.visualization.PieChart(document.getElementById('chart_div1'));
					chart.draw(data, options);
				}
 	  		});
    	}
		
    	
	    function drawChartCombo() {
	    	var selector = $("#region").val();
	    	
    	  	// 해당 지역 월별로 보기
    	  	$.ajax({
				type: "GET",
				url: "./sample.json",
				success:function(result){
					var avg = new Array(12);
					var month = 0;
					while(month != 13){
						month++;
						switch(month){
						case 1:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_1;
							}
							break;
						case 2:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_2;
							}
							break;
						case 3:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_3;
							}
							break;
						case 4:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_4;
							}
							break;
						case 5:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_5;
							}
							break;
						case 6:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_6;
							}
							break;
						case 7:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_7;
							}
							break;
						case 8:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_8;
							}
							break;
						case 9:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_9;
							}
							break;
						case 10:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_10;
							}
							break;
						case 11:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_11;
							}
							break;
						case 12:
							avg[month-1]=0;
							for(var i = 1; i < result.length; i++) {
								avg[month-1] += result[i].sixteen_12;
							}
							break;
						}
						
					} // END while
						
					// Create the data table.
					var data = new google.visualization.DataTable();
					data.addColumn('string', '날짜');
					data.addColumn('number', result[selector].region);
					data.addColumn('number', '평균');
					data.addRows([
					  ['01월', result[selector].sixteen_1, avg[0]/result.length],
					  ['02월', result[selector].sixteen_2, avg[1]/result.length],
					  ['03월', result[selector].sixteen_3, avg[2]/result.length],
					  ['04월', result[selector].sixteen_4, avg[3]/result.length],
					  ['05월', result[selector].sixteen_5, avg[4]/result.length],
					  ['06월', result[selector].sixteen_6, avg[5]/result.length],
					  ['07월', result[selector].sixteen_7, avg[6]/result.length],
					  ['08월', result[selector].sixteen_8, avg[7]/result.length],
					  ['09월', result[selector].sixteen_9, avg[8]/result.length],
					  ['10월', result[selector].sixteen_10, avg[9]/result.length],
					  ['11월', result[selector].sixteen_11, avg[10]/result.length],
					  ['12월', result[selector].sixteen_12, avg[11]/result.length]
					]);
					
					/* for(var i=0; i<4; i++) {
						data.addRows([['전국', 3+i, 1+i]]);
					} */
					
					
					// Set chart options
					var options = {
					      title : '2016년도 지역별 혼인 건수',
					      vAxis: {title: '혼인 건수'},
					      hAxis: {title: '월별'},
					      width : 1600,
					      height : 800,
					      seriesType: 'bars',
					      series: {1: {type: 'line'}}
					   };
					
					// Instantiate and draw our chart, passing in some options.
					var chart = new google.visualization.ComboChart(document.getElementById('chart_div2'));
					chart.draw(data, options);
				}
			});
      	}

	</script>	
</head>
<body>
	<div style="width: 1600px; margin: 0 auto;">
		<div id="chart_div1" style="width:1000px; margin: 0 auto;"></div>
		
		<select id="region">
			<option value="1">서울특별시</option>
			<option value="2">부산광역시</option>
			<option value="3">대구광역시</option>
			<option value="4">인천광역시</option>
			<option value="5">광주광역시</option>
			<option value="6">대전광역시</option>
			<option value="7">울산광역시</option>
			<option value="8">세종특별자치시</option>
			<option value="9">경기도</option>
			<option value="10">강원도</option>
			<option value="11">충정북도</option>
			<option value="12">충정남도</option>
			<option value="13">전라북도</option>
			<option value="14">전라남도</option>
			<option value="15">경상북도</option>
			<option value="16">경상남도</option>
			<option value="17">제주특별자치도</option>
			<option value="18">국외</option>
		</select>
		<div id="chart_div2"></div>
	</div>
</body>
</html>

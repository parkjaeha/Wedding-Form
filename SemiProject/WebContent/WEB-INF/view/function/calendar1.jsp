<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>자바스크립트 달력</title>
<!-- 	<link href="css/style.css" rel="stylesheet">	
 -->

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!--  <style type="text/css">

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
* {font-family: 'Nanum Gothic', serif;}

#kCalendar {width: 1000px; height: 948px; border: 1px solid black;}

#kCalendar #header {height: 50px; line-height: 50px; text-align: center; font-size: 18px; font-weight: bold;  background: #1abc9c;}
#kCalendar .button {color: #000; text-decoration: none;}

#kCalendar table {width: 1000px; height: 800px;}
#kCalendar caption {display: table-caption;  text-align: center;}


.month {
  padding: 40px 0px;
    width: 100%;
    background: #1abc9c;
    text-align: center;
    font-weight: bold;
}

.weekdays {
    padding: 80px 0;
    background-color:#ddd;
}

.days{
padding: 10px 0;
    background: #eee;
    margin: 0;
}

#kCalendar .sun {text-align: center; color: deeppink; border: 1px solid white;}
#kCalendar .mon {text-align: center; border: 1px solid white;}
#kCalendar .tue {text-align: center; border: 1px solid white;}
#kCalendar .wed {text-align: center; border: 1px solid white;}
#kCalendar .thu {text-align: center; border: 1px solid white;}
#kCalendar .fri {text-align: center; border: 1px solid white;}
#kCalendar .sat {text-align: center; color: deepskyblue; border: 1px solid white;}
 
 </style> -->
 
<script type="text/javascript">



function kCalendar(id,date) {
	var kCalendar = document.getElementById(id);
	
	
	if( typeof( date ) !== 'undefined' ) {
		date = date.split('-');
		date[1] = date[1] - 1;
		date = new Date(date[0], date[1], date[2]);
	} else {
		var date = new Date();
	}
	var currentYear = date.getFullYear();
	//년도를 구함
	
	var currentMonth = date.getMonth() + 1;
	//연을 구함. 월은 0부터 시작하므로 +1, 12월은 11을 출력
	
	var currentDate = date.getDate();
	//오늘 일자.
	
	date.setDate(1);
	var currentDay = date.getDay();
	//이번달 1일의 요일은 출력. 0은 일요일 6은 토요일
	
	var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
	var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	if( (currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0 )
		lastDate[1] = 29;
	//각 달의 마지막 일을 계산, 윤년의 경우 년도가 4의 배수이고 100의 배수가 아닐 때 혹은 400의 배수일 때 2월달이 29일 임.
	
	var currentLastDate = lastDate[currentMonth-1];
	var week = Math.ceil( ( currentDay + currentLastDate ) / 7 );
	//총 몇 주인지 구함.
	
	if(currentMonth != 1)
		var prevDate = currentYear + '-' + ( currentMonth - 1 ) + '-' + currentDate;
	else
		var prevDate = ( currentYear - 1 ) + '-' + 12 + '-' + currentDate;
	//만약 이번달이 1월이라면 1년 전 12월로 출력.
	
	if(currentMonth != 12) 
		var nextDate = currentYear + '-' + ( currentMonth + 1 ) + '-' + currentDate;
	else
		var nextDate = ( currentYear + 1 ) + '-' + 1 + '-' + currentDate;
	//만약 이번달이 12월이라면 1년 후 1월로 출력.

	
	if( currentMonth < 10 )
		var currentMonth = '0' + currentMonth;
	//10월 이하라면 앞에 0을 붙여준다.
	
	var calendar = '';
	
	calendar += '<div id="header">';
	calendar += '			<span><a href="" class="button left" onclick="kCalendar(\'' +  id + '\', \'' + prevDate + '\')"><</a></span>';
	calendar += '			<span id="date">' + currentYear + '년 ';
	calendar += '			<span><a href="#" class="button right" onclick="kCalendar(\'' + id + '\', \'' + nextDate + '\')">></a></span>';
	calendar += '		</div>';
	calendar += '		<table border="0" cellspacing="0" cellpadding="0">';
	calendar += '			<caption class="month">'  + currentMonth + '월 달력</caption>';
	calendar += '			<thead>';
	calendar += '				<tr class="weekdays">';
	calendar += '				  <th class="sun" scope="row" style="border: none;">일</th>';
	calendar += '				  <th class="mon" scope="row" style="border: none;">월</th>';
	calendar += '				  <th class="tue" scope="row" style="border: none;">화</th>';
	calendar += '				  <th class="wed" scope="row" style="border: none;">수</th>';
	calendar += '				  <th class="thu" scope="row" style="border: none;">목</th>';
	calendar += '				  <th class="fri" scope="row" style="border: none;">금</th>';
	calendar += '				  <th class="sat" scope="row" style="border: none;">토</th>';
	calendar += '				</tr>';
	calendar += '			</thead>';
	calendar += '			<tbody>';
	
	var dateNum = 1 - currentDay;
	
	for(var i = 0; i < week; i++) {
		calendar += '			<tr class="days">';
		for(var j = 0; j < 7; j++, dateNum++) {
			if( dateNum < 1 || dateNum > currentLastDate ) {
				calendar += '				<td class="' + dateString[j] + '"> </td>';
				continue;
			}
			calendar += '				<td  class="' + dateString[j] +' click'+ '" id="'+currentYear+currentMonth+dateNum+'">' + dateNum +'<br>'+currentYear+currentMonth+dateNum + '</td>';
		}
		calendar += '			</tr>';
	}
	
	calendar += '			</tbody>';
	calendar += '		</table>';
	
	kCalendar.innerHTML = calendar;
}


</script>
	
	
	
	
</head>
<body>
	<div id="kCalendar"></div>
	<script>
	
	$(function(){

			kCalendar('kCalendar');

				go();
			
		});

	function go(){
		
		
		var days_id = "";
		
		var class1  = document.getElementsByClassName("click");
		
		for(var i=0; i<class1.length;i++){
		
			/* jquery 로 바꿔서 click 이랑 올렸을때 이벤트 하기  */
		class1[i].addEventListener("click",function(){
			var id = this.getAttribute('id');

			$("#id").html("<b>hello</b>");
			$("#id").text("<b>hello</b>");
			
			
			console.log("id: "+id);
			//alert(id);
			
		/* 	 var myWindow = window.open("", "myWindow", "width=500,height=400");
			var result = load("./function/functionCalData.function?id="+id);
		   
			myWindow.document.write("<p>This is 'myWindow'</p>"+result);
			 */
		
			
		});
		}
		
	};
	
	
	
	
	</script>
	

	
</body>
</html>
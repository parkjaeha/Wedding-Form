<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>MarkerClusterer v3 Speed Test Example</title>
    
    <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <style>
      body {
        margin: 0;
        padding: 0;
        font-family: Arial;
        font-size: 14px;
      }
      #panel {
        float: left;
        width: 300px;
        height: 550px;
      }
      #map-container {
        margin-left: 300px;
      }
      #map {
        width: 100%;
        height: 550px;
      }
      #markerlist {
        height: 400px;
        margin: 10px 5px 0 10px;
        overflow: auto;
      }
      .title {
        border-bottom: 1px solid #e0ecff;
        overflow: hidden;
        width: 256px;
        cursor: pointer;
        padding: 2px 0;
        display: block;
        color: #000;
        text-decoration: none;
      }
      .title:visited {
        color: #000;
      }
      .title:hover {
        background: #e0ecff;
      }
      #timetaken {
        color: #f00;
      }
      .info {
        width: 200px;
      }
      .info img {
        border: 0;
      }
      .info-body {
        width: 200px;
        height: 200px;
        line-height: 200px;
        margin: 2px 0;
        text-align: center;
        overflow: hidden;
      }
      .info-img {
        height: 220px;
        width: 200px;
      }
    </style>

	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOUu60DDyAcyY5lpmQY1go7BuBibCGqhI&callback=speedTest.init"></script>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
    <script src="data.json"></script>
    <script type="text/javascript">
	    function $(element) {
	    	return document.getElementById(element);
	    }
	
	    var speedTest = {};
	
	    speedTest.pics = null;
	    speedTest.map = null;
	    speedTest.markerClusterer = null;
	    speedTest.markers = [];
	    speedTest.infoWindow = null;
	
	    speedTest.init = function() {
	    	var latlng = new google.maps.LatLng(37.517379, 127.047489);
	    	var options = {
	    			'zoom': 14,
	    			'center': latlng,
	    			'mapTypeId': google.maps.MapTypeId.ROADMAP
	    	};
	
	    	speedTest.map = new google.maps.Map($('map'), options); // google 지도 생성(초기화)
	    	speedTest.pics = data.photos;	// 데이터제이슨에서 자료를 pics에 저장
	
	    	var useGmm = document.getElementById('usegmm');	// 체크박스 (Use MarkerClusterer)
	    	google.maps.event.addDomListener(useGmm, 'click', speedTest.change); // 체크박스를 클릭하면 speedTest.change함수 실행
	    	/*
	    	  	speedTest.change = function() {
	    			speedTest.clear();
	    			speedTest.showMarkers();
	    		};
	    	*/
	
	    	var numMarkers = document.getElementById('nummarkers');	// selector (마커 범위)
	    	google.maps.event.addDomListener(numMarkers, 'change', speedTest.change);	// selector가 변하면 speedTest.change함수 실행
	
	    	speedTest.infoWindow = new google.maps.InfoWindow();	// infowWindow() 객체 생성
	
	    	speedTest.showMarkers();	// showMarkers() 호출
	    }; // END init
	
	    speedTest.showMarkers = function() {
	    	speedTest.markers = [];	// markers 배열 생성
	
	    	var type = 1;
	    	if ($('usegmm').checked) { // 체크박스가 체크 되면 type = 0, 체크되지 않으면 type = 1
	    		type = 0;
	    	}
	
	    	if (speedTest.markerClusterer) {	// ?
	    		speedTest.markerClusterer.clearMarkers(); // clearMarkers() : Removes the markers from the map, but keeps them in the array.
	    	}
	
	    	var panel = $('markerlist');	// makerlist
	    	panel.innerHTML = '';
	    	var numMarkers = $('nummarkers').value; // (selector)nummarkers 값
	
	    	for (var i = 0; i < numMarkers; i++) { // numMarkers = 10 | 50 | 100 | 500 | 1000 의 숫자에 따라 list 갯수가 달라짐
	    		var titleText = speedTest.pics[i].wedding_name;	// titleText에 photo_title 넣기
	    		if (titleText === '') {
	    			titleText = 'No title';
	    		}
	
	    		var item = document.createElement('DIV'); 	// div 생성
	    		var title = document.createElement('A');	// A태그 생성
	    		title.href = '#';							// A 태그 href="#" 속성 추가
	    		title.className = 'title';					// A 태그 class="title" 클래스 추가
	    		title.innerHTML = titleText;				// A 태그 titleText 문자열 추가
	
	    		item.appendChild(title);					// <div><a href="#" class="title">titleText</a></div>
	    		panel.appendChild(item);					// panel div에 <div><a href="#" class="title">titleText</a></div> 추가 
	
	
	    		var latLng = new google.maps.LatLng(speedTest.pics[i].latitude,		// 위도 경도
	    				speedTest.pics[i].longitude);
	    		//console.log(speedTest.pics[i].latitude);
	    		
	    		var imageUrl = 'http://chart.apis.google.com/chart?cht=mm&chs=24x32&chco=' +	// 이미지 URL
	    		'FFFFFF,008CFF,000000&ext=.png';
	    		var markerImage = new google.maps.MarkerImage(imageUrl,				// 마커 이미지 조정
	    				new google.maps.Size(24, 32));
	
	    		var marker = new google.maps.Marker({					// 마커 생성
	    			position: latLng,
	    			icon: markerImage,
	    		});
	    		//console.log(marker);
	
	    		var fn = speedTest.markerClickFunction(speedTest.pics[i], latLng); // makerClickFunction()함수 // pics[i] ??
	    		google.maps.event.addListener(marker, 'click', fn);		// 마커를 클릭하면 fn 함수 실행
	    		google.maps.event.addDomListener(title, 'click', fn);	// 타이틀(a태그)을 클릭하면 fn 함수 실행
	    		speedTest.markers.push(marker);		// markers 배열에 marker 추가
	    	}
	
	    	window.setTimeout(speedTest.time, 0);	// 시간
	    }; // END showMarkers
	
	    speedTest.markerClickFunction = function(pic, latlng) {
	    	return function(e) {
	    		e.cancelBubble = true; // 개층구조상 다음 이벤트 핸들러가 이벤트를 받는 것을 막는다 -> true // false(default)
	    		e.returnValue = false; // a태그의 경우, 클릭하면 href의 주소로 이동되는데 이러한 태그들의 고유 이벤트를 제거하기 위한 메소드이다.
	    		if (e.stopPropagation) {
	    			e.stopPropagation();	// 이벤트가 상위 DOM으로 전파되지 않도록 하는 코드
	    			e.preventDefault();		// a태그처럼 클릭 이벤트외에 별도의 브라우저 행동을 막기 위해 사용
	    		}
	    		var title = pic.photo_title;
	    		var url = pic.photo_url;
	    		var fileurl = pic.photo_file_url;
	
	    		var infoHtml = '<div class="info"><h3>' + title +
	    		'</h3><div class="info-body">' +
	    		'<a href="' + url + '" target="_blank"><img src="' +
	    		fileurl + '" class="info-img"/></a></div>' +
	    		'<a href="http://www.panoramio.com/" target="_blank">' +
	    		'<img src="http://maps.google.com/intl/en_ALL/mapfiles/' +
	    		'iw_panoramio.png"/></a><br/>' +
	    		'<a href="' + pic.owner_url + '" target="_blank">' + pic.owner_name +
	    		'</a></div></div>';
	
	    		speedTest.infoWindow.setContent(infoHtml);
	    		speedTest.infoWindow.setPosition(latlng);
	    		speedTest.infoWindow.open(speedTest.map);
	    	};
	    };
	
	    /* speedTest.clear = function() {
	    	$('timetaken').innerHTML = 'cleaning...';
	    	for (var i = 0, marker; marker = speedTest.markers[i]; i++) {
	    		marker.setMap(null);
	    	}
	    }; */
	
	    speedTest.change = function() {
	    	speedTest.clear();
	    	speedTest.showMarkers();
	    };
	
	    speedTest.time = function() {
	    	$('timetaken').innerHTML = 'timing...';
	    	var start = new Date();
	    	if ($('usegmm').checked) {
	    		speedTest.markerClusterer = new MarkerClusterer(speedTest.map, speedTest.markers, {imagePath: '../images/m'});
	    	} else {
	    		for (var i = 0, marker; marker = speedTest.markers[i]; i++) {
	    			marker.setMap(speedTest.map);
	    		}
	    	}
	
	    	var end = new Date();
	    	$('timetaken').innerHTML = end - start;
	    };
    
    </script>

    <script>
      google.maps.event.addDomListener(window, 'load', speedTest.init);
    </script>
    <script>
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-12846745-20']);
      _gaq.push(['_trackPageview']);

      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' === document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
    </script>
  </head>

  <body>
    <div id="panel">
      <h3>An example of MarkerClusterer v3</h3>

      <div>
        <input type="checkbox" checked="checked" id="usegmm"/>
        <span>Use MarkerClusterer</span>
      </div>

      <div>
        Markers:
        <select id="nummarkers">
          <option value="10">10</option>
          <option value="50">50</option>
          <option value="100" selected="selected">100</option>
          <option value="500">500</option>
          <option value="1000">1000</option>
        </select>

        <span>Time used: <span id="timetaken"></span> ms</span>
      </div>

      <strong>Marker List</strong>
      <div id="markerlist">

      </div>
    </div>
    <div id="map-container">
      <div id="map"></div>
    </div>
  </body>
</html>

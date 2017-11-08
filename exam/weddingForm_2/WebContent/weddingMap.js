/**
 * 
 */
function $(element) {
	return document.getElementById(element);
}

var weddingMap = {};

weddingMap.pics = null;
weddingMap.map = null;
weddingMap.markerClusterer = null;
weddingMap.markers = [];
weddingMap.infoWindow = null;
weddingMap.count = 0;

weddingMap.init = function() {
	var latlng = new google.maps.LatLng(37.517379, 127.047489);
	var options = {
			zoom: 10,
			center: latlng,
			mapTypeId: google.maps.MapTypeId.ROADMAP
	};

	weddingMap.map = new google.maps.Map($('map'), options); // google 지도 생성(초기화)
	weddingMap.pics = data.weddings;	// 데이터제이슨에서 자료를 pics에 저장
	
	weddingMap.infoWindow = new google.maps.InfoWindow();	// infowWindow() 객체 생성

	weddingMap.showMarkers();	// showMarkers() 호출
}; // END init

weddingMap.showMarkers = function() {
	weddingMap.markers = [];	// markers 배열 생성
	
	var panel = $('markerlist');	// makerlist
	panel.innerHTML = '';
	
	for (var i = 0; i < data.count; i++) { // numMarkers = 10 | 50 | 100 | 500 | 1000 의 숫자에 따라 list 갯수가 달라짐
		var arr = weddingMap.pics[i].ADDR.split(" ");
		
		var titleText = weddingMap.pics[i].wedding_name;	// titleText에 photo_title 넣기
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
		
		var latLng = new google.maps.LatLng(weddingMap.pics[i].latitude,		// 위도 경도
				weddingMap.pics[i].longitude);

		var imageUrl = 'http://chart.apis.google.com/chart?cht=mm&chs=24x32&chco=' +	// 이미지 URL
		'FFFFFF,008CFF,000000&ext=.png';
		var markerImage = new google.maps.MarkerImage(imageUrl,				// 마커 이미지 조정
				new google.maps.Size(24, 32));

		var marker = new google.maps.Marker({					// 마커 생성
			position: latLng,
			icon: markerImage
		});

		var fn = weddingMap.markerClickFunction(weddingMap.pics[i], marker, latLng); // makerClickFunction()함수
		google.maps.event.addListener(marker, 'click', fn);		// 마커를 클릭하면 fn 함수 실행
		google.maps.event.addDomListener(title, 'click', fn);	// 타이틀(a태그)을 클릭하면 fn 함수 실행
		weddingMap.markers.push(marker);		// markers 배열에 marker 추가
	}
	
	weddingMap.markerClusterer = new MarkerClusterer(weddingMap.map, weddingMap.markers, {imagePath: './image/m'});
}; // END showMarkers

weddingMap.markerClickFunction = function(pic, marker, latlng) {
	return function(e) {
		e.cancelBubble = true; // 개층구조상 다음 이벤트 핸들러가 이벤트를 받는 것을 막는다 -> true // false(default)
		e.returnValue = false; // a태그의 경우, 클릭하면 href의 주소로 이동되는데 이러한 태그들의 고유 이벤트를 제거하기 위한 메소드이다.
		if (e.stopPropagation) {
			e.stopPropagation();	// 이벤트가 상위 DOM으로 전파되지 않도록 하는 코드
			e.preventDefault();		// a태그처럼 클릭 이벤트외에 별도의 브라우저 행동을 막기 위해 사용
		}
		var name = pic.wedding_name;
		var phone = pic.PHONE;
		var mail = pic.MAIL;

		var infoHtml = name + '<br>' + phone + '<br>' + mail;

		weddingMap.infoWindow.setContent(infoHtml);
		weddingMap.infoWindow.setPosition(latlng);
		weddingMap.infoWindow.open(weddingMap.map, marker);
	};
};
weddingMap.clear = function() {
	for (var i = 0, marker; marker = weddingMap.markers[i]; i++) {
		marker.setMap(null);
	}
};

weddingMap.change1 = function() {
	var cido = $('cido').value;
	
	if(cido == '서울특별시') {
		$('gungu').innerHTML = '<option value="">군/구</option>'+
								'<option value="강남구">강남구</option>';
	} else if(cido == '경기도') {
		$('gungu').innerHTML = '<option value="">군/구</option>'+
								'<option value="안산시">안산시</option>';
	}
	
};

weddingMap.change2 = function() {
	weddingMap.clear();
	weddingMap.showMarkers();
};
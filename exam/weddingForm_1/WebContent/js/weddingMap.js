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
weddingMap.geocoder = null;


weddingMap.init = function() {
	//37.061534, 128.128128
	var latlng = new google.maps.LatLng(37.036344, 127.733608);
	var options = {
			zoom: 9,
			center: latlng,
			mapTypeId: google.maps.MapTypeId.ROADMAP
	};

	weddingMap.map = new google.maps.Map($('map'), options); // google 지도 생성(초기화)
	weddingMap.pics = data.weddings;	// 데이터제이슨에서 자료를 pics에 저장
	
	weddingMap.infoWindow = new google.maps.InfoWindow();	// infowWindow() 객체 생성
	
	google.maps.event.addDomListener($('sido'), 'click', weddingMap.sidoFunc);
	
	weddingMap.showMarkers();	// showMarkers() 호출
	
}; // END init

weddingMap.showMarkers = function() {
	weddingMap.markers = [];	// markers 배열 생성
	
	var panel = $('myUL');	// makerlist
	panel.innerHTML = '';
	
	for (var i = 0; i < data.count; i++) { // numMarkers = 10 | 50 | 100 | 500 | 1000 의 숫자에 따라 list 갯수가 달라짐
		var arr = weddingMap.pics[i].ADDR.split(" ");
		
		var titleText = weddingMap.pics[i].wedding_name;	// titleText에 photo_title 넣기
		if (titleText === '') {
			titleText = 'No title';
		}
		
		var hideText = arr[0] + " " + arr[1];
		
		/*
		var item = document.createElement('DIV'); 	// div 생성
		var title = document.createElement('A');	// A태그 생성
		title.href = '#';							// A 태그 href="#" 속성 추가
		title.className = 'title';					// A 태그 class="title" 클래스 추가
		title.innerHTML = titleText;				// A 태그 titleText 문자열 추가
		
		item.appendChild(title);					// <div><a href="#" class="title">titleText</a></div>
		panel.appendChild(item);					// panel div에 <div><a href="#" class="title">titleText</a></div> 추가 
		 */	
		/*var ul = document.createElement('ul');
		ul.id="myUL";*/
		var li = document.createElement('li');
		var title = document.createElement('A');	// A태그 생성
		title.href = '#';							// A 태그 href="#" 속성 추가
		title.className = 'title';					// A 태그 class="title" 클래스 추가
		title.innerHTML = titleText;				// A 태그 titleText 문자열 추가
		var hide = document.createElement('span');
		hide.className = 'hide';
		hide.innerHTML = hideText;
		
		li.appendChild(title);
		li.appendChild(hide);
		panel.appendChild(li);
		
		
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
	
	weddingMap.markerClusterer = new MarkerClusterer(weddingMap.map, weddingMap.markers, {imagePath: '../image/map/m'});
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

weddingMap.sidoFunc = function() {
	var sido = document.getElementById("sido");
	
	var area0 = [ "서울특별시", "인천광역시", "대전광역시", "광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주도" ];
	
	if(sido.children.length == 1) {
		for(var i=0; i < area0.length; i++) {
			var option = document.createElement('option');
			option.value = area0[i];
			var text = document.createTextNode(area0[i]);
			option.appendChild(text);
			sido.appendChild(option);
		}
	}
	
	google.maps.event.addDomListener(sido, 'change', weddingMap.gunguFunc);
	
}

weddingMap.gunguFunc = function() {
	var gungu = document.getElementById('gungu');
	gungu.length = 0;
	
	var area0 = [ "서울특별시", "인천광역시", "대전광역시", "광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주도" ];
	var area1 = [ "군/구", "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ];
	var area2 = [ "군/구", "계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군" ];
	var area3 = [ "군/구", "대덕구", "동구", "서구", "유성구", "중구" ];
	var area4 = [ "군/구", "광산구", "남구", "동구", "북구", "서구" ];
	var area5 = [ "군/구", "남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군" ];
	var area6 = [ "군/구", "남구", "동구", "북구", "중구", "울주군" ];
	var area7 = [ "군/구", "강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군" ];
	var area8 = [ "군/구", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군" ];
	var area9 = [ "군/구", "강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군" ];
	var area10 = [ "군/구", "제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군" ];
	var area11 = [ "군/구", "계룡시", "공주시", "논산시", "보령시", "서산시", "아산시", "천안시", "금산군", "당진군", "부여군", "서천군", "연기군", "예산군", "청양군", "태안군", "홍성군" ];
	var area12 = [ "군/구", "군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군" ];
	var area13 = [ "군/구", "광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군" ];
	var area14 = [ "군/구", "경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군" ];
	var area15 = [ "군/구", "거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군" ];
	var area16 = [ "군/구", "서귀포시", "제주시", "남제주군", "북제주군" ];
	var area = [area1, area2, area3, area4, area5, area6, area7, area8, area9, area10, area11, area12, area13, area14, area15, area16];
	
	var index;
	for(var i = 0; i < area0.length; i++) {
		if(area0[i] == $('sido').value) {
			index = i;
			break;
		}
	}
	
	if($('sido').value == " ") {
		gungu.innerHTML = "<option value=' '>군구</option>";
	} else {
		for(var i=0; i < area[index].length; i++) {
			var option = document.createElement('option');
			if(i != 0) {
				option.value = area[index][i];
			} else {
				option.value = " ";
			} 
			var text = document.createTextNode(area[index][i]);
			option.appendChild(text);
			gungu.appendChild(option);
		}
	}
	
}
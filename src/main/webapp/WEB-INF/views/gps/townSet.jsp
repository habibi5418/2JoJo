<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Google tag (gtag.js) -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=G-CMBGRHC3KW"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-CMBGRHC3KW');
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="<c:url value='/resources/css/style1.css' />">
<body>
	
	<%@ include file="../header.jsp" %>
	
	<div id="container2">
		<div id="townMap">
		</div>
		
		<div id="townContainer">
			<div id="searchTownDiv">
				<div id="inputTownDiv">
					<input type="text" id="townInput" placeholder="읍/면/동을 검색하세요" value="">
					<button type="button" id="currentPosBtn">
			        	<img src="<c:url value='/resources/images/board/gps.png'/>" id='gpsImg'>
			        	<span>현재위치</span>
			        </button>
				</div>
				<h1 id="searchTown"></h1>
				<input type="hidden" id="dataTown" value="">
				<button type="button" id="saveTownBtn">동네설정</button>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9gy0xhxny4&submodules=geocoder"></script>
	<script type="text/javascript">

		var mapOptions = {
		    center: new naver.maps.LatLng(37.483664, 126.899998),
		    zoom: 16
		};
		var map = new naver.maps.Map('townMap', mapOptions);

		var marker = new naver.maps.Marker();
		var infoWindows = [];

// 		============== geocoder ============== 
		var infoWindow = new naver.maps.InfoWindow({
		    borderColor: "#aaa",
		});
		
		map.setCursor('pointer');

		function searchCoordinateToAddress(latlng) {

		    infoWindow.close();

		    naver.maps.Service.reverseGeocode({
		        coords: latlng,
		        orders: [
		            naver.maps.Service.OrderType.ADDR,
		            naver.maps.Service.OrderType.ROAD_ADDR
		        ].join(',')
		    }, function(status, response) {
		        if (status === naver.maps.Service.Status.ERROR) {
		            return alert('Something Wrong!');
		        }

		        var items = response.v2.results,
		            address = '',
		            htmlAddresses = [];

		        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
		            item = items[i];
		            address = makeAddress(item) || '';
		            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

		            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
		        }
				
		        infoWindow.setContent([
		            '<div id="addrDiv" style="padding:10px;">',
		            '<h4 style="margin-top:5px;">' + items[0].region.area3.name + '</h4>',
// 		            '<div id="addrDiv" style="padding:10px;min-width:200px;line-height:150%;">',
// 		            '<h4 style="margin-top:5px;">' + items[0].region.area3.name + '</h4><br />',
// 		            '<h4 style="margin-top:5px;">검색 좌표 : ' + items[0].region.area3.name + '</h4><br />',
// 		            htmlAddresses.join('<br />'),
		            '</div>'
		        ].join('\n'));

		        infoWindow.open(map, latlng);
		        
		        $("#searchTown").text(items[0].region.area1.name + " " + items[0].region.area2.name + " " + items[0].region.area3.name);
		    });
		}
		
		function searchAddressToCoordinate(address) {
		    naver.maps.Service.geocode({
		        query: address
		    }, function(status, response) {
		        if (status === naver.maps.Service.Status.ERROR) {
		            return alert('Something Wrong!');
		        }

		        if (response.v2.meta.totalCount === 0) {
		            return alert('totalCount' + response.v2.meta.totalCount);
		        }

		        var htmlAddresses = [],
		            item = response.v2.addresses[0],
		            point = new naver.maps.Point(item.x, item.y);

		        if (item.roadAddress) {
		            htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
		        }

		        if (item.jibunAddress) {
		            htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
		        }

		        if (item.englishAddress) {
		            htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
		        }

		        infoWindow.setContent([
		            '<div id="addrDiv" style="padding:10px;">',
		            '<h4 style="margin-top:5px;">'+ address +'</h4>',
// 		            '<div id="addrDiv" style="padding:10px;min-width:200px;line-height:150%;">',
// 		            '<h4 style="margin-top:5px;">'+ address +'</h4><br />',
// 		            '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4><br />',
// 		            htmlAddresses.join('<br />'),
		            '</div>'
		        ].join('\n'));

		        map.setCenter(point);
		        infoWindow.open(map, point);
				
		        $("#searchTown").text(item.roadAddress);
		        $("#dataTown").val(item.addressElements[2].shortName);
		    });
		}

		function initGeocoder() {
		    map.addListener('click', function(e) {
		        searchCoordinateToAddress(e.coord);
		    });

		    $('#townInput').on('keydown', function(e) {
		        var keyCode = e.which;

		        if (keyCode === 13) { // Enter Key
		            searchAddressToCoordinate($('#townInput').val());
		        }
		    });

// 		    $('#submit').on('click', function(e) {
// 		        e.preventDefault();

// 		        searchAddressToCoordinate($('#townInput').val());
// 		    });
		}
		
		function makeAddress(item) {
		    if (!item) {
		        return;
		    }

		    var name = item.name,
		        region = item.region,
		        land = item.land,
		        isRoadAddress = name === 'roadaddr';

		    var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

		    if (hasArea(region.area1)) {
		        sido = region.area1.name;
		    }

		    if (hasArea(region.area2)) {
		        sigugun = region.area2.name;
		    }

		    if (hasArea(region.area3)) {
		        dongmyun = region.area3.name;
		    }

		    if (hasArea(region.area4)) {
		        ri = region.area4.name;
		    }

		    if (land) {
		        if (hasData(land.number1)) {
		            if (hasData(land.type) && land.type === '2') {
		                rest += '산';
		            }

		            rest += land.number1;

		            if (hasData(land.number2)) {
		                rest += ('-' + land.number2);
		            }
		        }

		        if (isRoadAddress === true) {
		            if (checkLastString(dongmyun, '면')) {
		                ri = land.name;
		            } else {
		                dongmyun = land.name;
		                ri = '';
		            }

		            if (hasAddition(land.addition0)) {
		                rest += ' ' + land.addition0.value;
		            }
		        }
		    }

		    return [sido, sigugun, dongmyun, ri, rest].join(' ');
		}

		function hasArea(area) {
		    return !!(area && area.name && area.name !== '');
		}

		function hasData(data) {
		    return !!(data && data !== '');
		}

		function checkLastString (word, lastString) {
		    return new RegExp(lastString + '$').test(word);
		}

		function hasAddition (addition) {
		    return !!(addition && addition.value);
		}

		naver.maps.onJSContentLoaded = initGeocoder;

		// gps
		var currentLat;
		var currentLng;

		var selectIcon = {
			content: '<img src="<c:url value="/resources/img/11kong.jpg"/>" alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 48px; height: 48px; left: 0px; top: 0px; border-radius: 70%;">',
			anchor: new naver.maps.Point(16, 16)
		}
		
	    var gpsInfoWindow = new naver.maps.InfoWindow();
	    var gpsMarker = new naver.maps.Marker({ // 마커 생성
		    icon: selectIcon
		});
	    
	    
		function onSuccessGeolocation(position) {
		    var location = new naver.maps.LatLng(position.coords.latitude,
		                                         position.coords.longitude);
		    currentLat = position.coords.latitude;
		    currentLng = position.coords.longitude;
			gpsMarker.setMap(map);
		    gpsMarker.setPosition(location);

	        mqttClient.publish(mqtt_topic, JSON.stringify({lat: currentLat, lng: currentLng, sender: senderEmail}));
// 		    console.log('Coordinates: ' + location.toString());
		}
		
		function onSuccessGeolocation2(position) {
		    const location = new naver.maps.LatLng(position.coords.latitude,
		                                         position.coords.longitude);
// 		    console.log('맵 중심 세팅 : ' + location.toString());
		    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
		}
		
		function onSuccessGeolocation3(position) {
		    const location = new naver.maps.LatLng(position.coords.latitude,
		                                         position.coords.longitude);
		    searchCoordinateToAddress(location);
		    map.setCenter(location);
		}

		function onErrorGeolocation() {
		    var center = map.getCenter();

		    gpsInfoWindow.setContent('<div style="padding:20px;">' +
		        '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');

		    gpsInfoWindow.open(map, center);
		}

		$(window).on("load", function() {
		    if (navigator.geolocation) {
// 		        navigator.geolocation.watchPosition(onSuccessGeolocation);
		        navigator.geolocation.getCurrentPosition(onSuccessGeolocation2);
		    } else {
		        var center = map.getCenter();
		        gpsInfoWindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
		        gpsInfoWindow.open(map, center);
		    }
		});
		
		$("#currentPosBtn").on("click", () => {
	        navigator.geolocation.getCurrentPosition(onSuccessGeolocation3);
		});
		
		$("#saveTownBtn").on("click", () => {
		});

	</script>
</body>
</html>
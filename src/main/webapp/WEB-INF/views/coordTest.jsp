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
<title>Insert title here</title>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9gy0xhxny4&submodules=geocoder"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
<body>
	<div id='modalCalendar' class="modal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
<!-- 						<div class="modal-header"> -->
<!-- 							<h5 class="modal-title">날짜 선택</h5> -->
<!-- 							<button id="closeCal" type="button" class="btn-close" data-bs-dismiss="modal" -->
<!-- 								aria-label="Close"></button> -->
<!-- 						</div> -->
				<div class="modal-body">
					<div id='calendar'></div>
				</div>
<!-- 						<div class="modal-footer"> -->
<!-- 							<button type="button" class="btn btn-secondary" -->
<!-- 								data-bs-dismiss="modal">Close</button> -->
<!-- 							<button type="button" class="btn btn-primary">Save -->
<!-- 								changes</button> -->
<!-- 						</div> -->
			</div>
		</div>
	</div>
	<div id="map" style="width: 100%; height: 750px;"></div>
	<div>
		<input id="userId" type="text">
		<button id="startBtn" type="button" class="btn btn-warning">출발</button>
		<button id="endBtn" type="button" class="btn btn-secondary">도착</button>
		<br>
		<!-- 		<div class="dropdown"> -->
		<!-- 		  <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"> -->
		<!-- 		    날짜 선택 -->
		<!-- 		  </button> -->
		<!-- 		  <ul id="date" class="dropdown-menu dropdown-menu-dark"> -->
		<!-- 		    <li><a class="dropdown-item" href="#" data-date="2023-11-02">2023-11-02</a></li> -->
		<!-- 		    <li><a class="dropdown-item" href="#" data-date="2023-11-03">2023-11-03</a></li> -->
		<!-- 		    <li><a class="dropdown-item" href="#" data-date="2023-11-04">2023-11-04</a></li> -->
		<!-- 		    <li><a class="dropdown-item" href="#" data-date="2023-11-05">2023-11-05</a></li> -->
		<!-- 		    <li><a class="dropdown-item" href="#" data-date="2023-11-06">2023-11-06</a></li> -->
		<!-- 		    <li><a class="dropdown-item" href="#" data-date="2023-11-07">2023-11-07</a></li> -->
		<!-- 		    <li><a class="dropdown-item" href="#" data-date="2023-11-08">2023-11-08</a></li> -->
		<!-- 		    <li><a class="dropdown-item" href="#" data-date="2023-11-09">2023-11-09</a></li> -->
		<!-- 		    <li><a class="dropdown-item" href="#" data-date="2023-11-10">2023-11-10</a></li> -->
		<!-- 		  </ul> -->
		<!-- 		</div> -->
		<div>
			<button id="openCal" class="btn btn-secondary dropdown-toggle"
				type="button" aria-expanded="false">날짜 선택</button>
		</div>
		<div id="walkList">일자별 산책 목록</div>
		<div>
			<img id="img1" src="<c:url value="/resources/img/11kong.jpg"/>"
				alt=""
				style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 48px; height: 48px; left: 10px; top: 10px; border-radius: 70%;">
			<img id="img2" src="<c:url value="/resources/img/11siru.jpg"/>"
				alt=""
				style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 48px; height: 48px; left: 70px; top: 10px; border-radius: 70%;">
			<img id="img3" src="<c:url value="/resources/img/11hani.jpg"/>"
				alt=""
				style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 48px; height: 48px; left: 130px; top: 10px; border-radius: 70%;">
		</div>
	</div>
	<script type="text/javascript">
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			locale: "ko",
			height: 500,
			initialView: 'dayGridMonth',
// 			dateClick: function() {
// 				var date = $("#calendar").fullCalendar("getDate");
// 				alert(date);
// 			},
		});
		calendar.on('dateClick', function(info) {
			$("#walkList").text("");

			selectDate = info.dateStr;
			getWnum("append", selectDate);
			
			$("#modalCalendar").hide();
		});

		$("#openCal").on("click", () => {
// 			$("#calendar").css("display", "block");
			$("#modalCalendar").show();
			calendar.render();
		});

		var mapOptions = {
		    center: new naver.maps.LatLng(37.483664, 126.899998),
		    zoom: 16
		};
		
		var map = new naver.maps.Map('map', mapOptions);
		
		var infoWindow = new naver.maps.InfoWindow({
		    anchorSkew: true
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
				
		        if (!doneStart) {
		    		var htmlBtn = [
		    			'<br><button id="startBtn" type="button" onclick=setStart(this) data-coord="' + latlng + '" class="btn btn-primary">출발</button>'
		    		];
		        } else {
		        	var htmlBtn = [
		        		'<br><button id="endBtn" type="button" onclick=setEnd(this) data-coord="' + latlng + '" class="btn btn-secondary">도착</button>'
					];
		        }
		        
		        infoWindow.setContent([
		            '<div style="padding:10px;min-width:200px;line-height:150%;">',
		            '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
		            htmlAddresses.join('<br />'),
		            htmlBtn.join(''),
		            '</div>'
		        ].join('\n'));

		        infoWindow.open(map, latlng);
		    });
		}

// 		function searchAddressToCoordinate(address) {
// 		    naver.maps.Service.geocode({
// 		        query: address
// 		    }, function(status, response) {
// 		        if (status === naver.maps.Service.Status.ERROR) {
// 		            return alert('Something Wrong!');
// 		        }

// 		        if (response.v2.meta.totalCount === 0) {
// 		            return alert('totalCount' + response.v2.meta.totalCount);
// 		        }

// 		        var htmlAddresses = [],
// 		            item = response.v2.addresses[0],
// 		            point = new naver.maps.Point(item.x, item.y);

// 		        if (item.roadAddress) {
// 		            htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
// 		        }

// 		        if (item.jibunAddress) {
// 		            htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
// 		        }

// 		        if (item.englishAddress) {
// 		            htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
// 		        }

// 		        infoWindow.setContent([
// 		            '<div style="padding:10px;min-width:200px;line-height:150%;">',
// 		            '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4><br />',
// 		            htmlAddresses.join('<br />'),
// 		            '</div>'
// 		        ].join('\n'));

// 		        map.setCenter(point);
// 		        infoWindow.open(map, point);
// 		    });
// 		}
		
		var start; // 출발 좌표
		var doneStart = false; // 출발 눌렀는지 체크
		var end; // 도착 좌표
		
		function initGeocoder() {
		    map.addListener('click', function(e) {
		        searchCoordinateToAddress(e.coord);
		    });

		    $('#address').on('keydown', function(e) {
		        var keyCode = e.which;

		        if (keyCode === 13) { // Enter Key
		            searchAddressToCoordinate($('#address').val());
		        }
		    });

		    $('#submit').on('click', function(e) {
		        e.preventDefault();

		        searchAddressToCoordinate($('#address').val());
		    });
		}
		
		function setStart(target) {
			doneStart = true; // 출발 버튼 누른 상태로 변경
			infoWindow.setMap(null); 
			console.log(target.dataset.coord);
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
		
// 		// 마커 위 정보창 html
// 		var infoHtml = [
// 	        '<div class="iw_inner">',
// 	        'test',
// 	        '</div>'
// 	    ].join('');
		
// 		// 정보창에 html 내용 추가
// 		var infoWindow = new naver.maps.InfoWindow({
// 		    content: infoHtml
// 		});

		var marker = new naver.maps.Marker();
		var infoWindows = [];
		
		// 지도 클릭 이벤트
// 		naver.maps.Event.addListener(map, 'click', function(e) {
// 			console.log(e.coord.lat() + "/" + e.coord.lng());
// 			marker.setMap(null); // 지도 누를 시 기존 마커 없애기
// // 			infoWindow.setMap(null);
// // 			infoWindows.forEach(iw => {
// // 				iw.setMap(null);
// // 			})
// 			marker = new naver.maps.Marker({ // 마커 생성
// 			    position: e.latlng, 
// 			    map: map
// 			});
// 			infoWindow.open(map, marker);
// 		});
		
		// 공원 불러오기
		fetch("<c:url value='/loadPark'/>", {
			method: "POST",
			headers: {
			    "Content-Type": "application/json; charset=UTF-8",
			}
		})
		.then((response) => response.json())
		.then((json) => {
			json.parkList.forEach(park => {
				const position = new naver.maps.LatLng(park.lat, park.lng);
				
		        const parkMarker = new naver.maps.Marker({
		          map: map,
		          position: position
		        });
		        
		        const parkInfoWindow = new naver.maps.InfoWindow({
		          content: '<div style="width:auto; text-align:center; font-size:75%; padding:10px;"><b>' + park.pname + '</b></div>'
		        });
		        parkMarker.addListener('click', () => {
		          if (parkInfoWindow.getMap()) {
		        	  parkInfoWindow.close();
		          } else {
		        	  parkInfoWindow.open(map, parkMarker);
		        	  marker.setMap(null);
		          }
		        });
		        
		        infoWindows.push(parkInfoWindow);
			});
		});	

		// gps
		var currentLat;
		var currentLng;
		
		var selectIcon = {
			content: '<img src="<c:url value="/resources/img/11kong.jpg"/>" alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 48px; height: 48px; left: 0px; top: 0px; border-radius: 70%;">',
			anchor: new naver.maps.Point(16, 16)
		}
		
		$("#img1").on("click", e => {
			gpsMarker.setIcon(selectIcon = {
				content: '<img src="<c:url value="/resources/img/11kong.jpg"/>" alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 48px; height: 48px; left: 0px; top: 0px; border-radius: 70%;">',
				anchor: new naver.maps.Point(16, 16)
			});
		});
		
		$("#img2").on("click", e => {
			gpsMarker.setIcon(selectIcon = {
				content: '<img src="<c:url value="/resources/img/11siru.jpg"/>" alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 48px; height: 48px; left: 0px; top: 0px; border-radius: 70%;">',
				anchor: new naver.maps.Point(16, 16)
			});
		});
		
		$("#img3").on("click", e => {
			gpsMarker.setIcon(selectIcon = {
				content: '<img src="<c:url value="/resources/img/11hani.jpg"/>" alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 48px; height: 48px; left: 0px; top: 0px; border-radius: 70%;">',
				anchor: new naver.maps.Point(16, 16)
			});
		});
				
	    var gpsInfoWindow = new naver.maps.InfoWindow();
	    var gpsMarker = new naver.maps.Marker({ // 마커 생성
		    map: map,
		    icon: selectIcon
// 	        icon: {
// 	            content: '<img src="<c:url value="/resources/img/11kong.jpg"/>" alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 48px; height: 48px; left: 0px; top: 0px; border-radius: 70%;">',
// 	            anchor: new naver.maps.Point(16, 16)
// 	        }
		});
	    
		function onSuccessGeolocation(position) {
		    var location = new naver.maps.LatLng(position.coords.latitude,
		                                         position.coords.longitude);
		    currentLat = position.coords.latitude;
		    currentLng = position.coords.longitude;
// 		    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
// 		    map.setZoom(16); // 지도의 줌 레벨을 변경합니다.
			
// 		    gpsInfoWindow.setContent('<div style="padding:20px;">' + '현재 위치' + '</div>');
// 		    gpsInfoWindow.open(map, location);
		    gpsMarker.setPosition(location);
		    console.log('Coordinates: ' + location.toString());
		}
		
		function onSuccessGeolocation2(position) {
		    var location = new naver.maps.LatLng(position.coords.latitude,
		                                         position.coords.longitude);
		    console.log('맵 중심 세팅 : ' + location.toString());
		    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
		}

		function onErrorGeolocation() {
		    var center = map.getCenter();

		    gpsInfoWindow.setContent('<div style="padding:20px;">' +
		        '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');

		    gpsInfoWindow.open(map, center);
		}

		$(window).on("load", function() {
		    if (navigator.geolocation) {
// 		        navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation, {enableHighAccuracy:true});
		        navigator.geolocation.watchPosition(onSuccessGeolocation);
		        navigator.geolocation.getCurrentPosition(onSuccessGeolocation2);
		    } else {
		        var center = map.getCenter();
		        gpsInfoWindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
		        gpsInfoWindow.open(map, center);
		    }
		});
		
		// 선 그리기
// 		var polyline = new naver.maps.Polyline({
// 		    map: map,
// 		    path: [new naver.maps.LatLng(37.583664, 126.999998), new naver.maps.LatLng(37.583736, 127.001457), new naver.maps.LatLng(37.583185, 127.001908)
// 		    		, new naver.maps.LatLng(37.583368, 127.003502), new naver.maps.LatLng(37.584118, 127.004822)],
// 		    strokeColor: '#9DD84B',
// 		    strokeWeight: 5,
// 		    strokeLineCap: 'square',
// 		    startIcon: 4,
// 		    endIcon: 2
// 		});

		var interval;
		var selectDate = "";
		var wnum;
		
		// 순번 가져오기
		function getWnum(flag, selectDate) {
			const param = {
					userId: $("#userId").val(),
					walkDate: selectDate
			}
			
			fetch("<c:url value='/getWnum'/>", {
				method: "POST",
				headers: {
				    "Content-Type": "application/json; charset=UTF-8",
				},
				body: JSON.stringify(param),
			})
			.then((response) => response.json())
			.then((json) => {
				wnum = json.wnum + 1;
				if (flag == "append") {
					console.log("getWnum -> append");
					for (var i = 1; i < wnum; i++) {
						$("#walkList").append("<input type='text' value='" + selectDate + " - " + i + "'>");
						$("#walkList").append("<button type='button' onclick='drawRoute(" + i + ")' class='btn btn-secondary'>경로보기</button>");
					}
				}
			});
		}
		
		$("#userId").focusout(() => {
			getWnum("just", selectDate);
		});
		
		$('#date li > a').on('click', function() {
			$("#walkList").text("");

			selectDate = $(this).text();
			getWnum("append", selectDate);
		});
		
		var polyline = new naver.maps.Polyline({
		    map: map,
		    strokeColor: '#9DD84B',
		    strokeWeight: 5,
		    strokeLineCap: 'square',
		    startIcon: 4,
		    endIcon: 2
		});
		
		function drawRoute(n) {
			polyline.setMap(null);
			
			const param = {
					userId: $("#userId").val(),
					wnum: n,
					walkDate: selectDate
			}
			
			fetch("<c:url value='/getRoute'/>", {
				method: "POST",
				headers: {
				    "Content-Type": "application/json; charset=UTF-8",
				},
				body: JSON.stringify(param),
			})
			.then((response) => response.json())
			.then((json) => {
				const path = [];
				
				json.routeList.forEach(route => {
					console.log(route);
					path.push(new naver.maps.LatLng(route.lat, route.lng));
				});
				
				polyline.setPath(path);
				polyline.setMap(map);
			});
		}
		
		$("#startBtn").on("click", e => {
			alert("시작");
			
			getWnum();
			
			// x초마다 좌표 전송
			interval = setInterval(() => {
				const param = {
						userId: $("#userId").val(),
						wnum: wnum,
						lat: currentLat,
						lng: currentLng
				}
				
				fetch("<c:url value='/sendCoord'/>", {
					method: "POST",
					headers: {
					    "Content-Type": "application/json; charset=UTF-8",
					},
					body: JSON.stringify(param),
				})
				.then((response) => response.json())
				.then((json) => {
					console.log("위도 : " + currentLat + " / 경도 : " + currentLng);
				});
			}
			, 10000);
		});

		$("#endBtn").on("click", e => {
			alert("종료");
			clearInterval(interval);
		});
		
		
		
	</script>
</body>
</html>
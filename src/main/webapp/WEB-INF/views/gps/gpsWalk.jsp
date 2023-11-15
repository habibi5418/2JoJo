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
	
	<%@ include file="../header.jsp" %>
	
	<div id="container">
		<div id="gpsWalkMap">
<%-- 			<img id="img1" src="<c:url value="/resources/img/11kong.jpg"/>" --%>
<!-- 				alt="" -->
<!-- 				style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 48px; height: 48px; left: 10px; top: 10px; border-radius: 70%;"> -->
<%-- 			<img id="img2" src="<c:url value="/resources/img/11siru.jpg"/>" --%>
<!-- 				alt="" -->
<!-- 				style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 48px; height: 48px; left: 70px; top: 10px; border-radius: 70%;"> -->
<%-- 			<img id="img3" src="<c:url value="/resources/img/11hani.jpg"/>" --%>
<!-- 				alt="" -->
<!-- 				style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 48px; height: 48px; left: 130px; top: 10px; border-radius: 70%;"> -->
		</div>
		
		<div>
			<button id="startBtn" type="button" class="btn btn-warning">출발</button>
			<button id="endBtn" type="button" class="btn btn-secondary" disabled="disabled">도착</button>
			
			<div>
				<button id="openCal" class="btn btn-secondary dropdown-toggle" type="button" aria-expanded="false">날짜 선택</button>
			</div>
			<div id="walkList">일자별 산책 목록</div>
<!-- 			<button id="connectBtn" type="button" class="btn btn-secondary connectBtn" data-num="1">mqtt 연결 - 1-1</button> -->
<!-- 			<button id="connectBtn2" type="button" class="btn btn-secondary connectBtn" data-num="2">mqtt 연결 - 1-2</button> -->
<!-- 			<br> -->
<!-- 			<button id="showPosBtn" type="button" class="btn btn-primary">위치보기</button> -->
<!-- 			<button id="endPosBtn" type="button" class="btn btn-dark">종료</button> -->
		</div>
	</div>
	
	<script type="text/javascript" src="/resources/mqtt/mqtt.min.js"></script>
	<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9gy0xhxny4&submodules=geocoder"></script>
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
	<script type="text/javascript">

		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			locale: "ko",
			height: 600,
			initialView: 'dayGridMonth',
		});
		calendar.on('dateClick', function(info) {
			$("#walkList").text("");
	
			selectDate = info.dateStr;
			getWnum("append", selectDate);
			
			$("#modalCalendar").modal("hide");
		});
	
		$("#openCal").on("click", () => {
			$("#modalCalendar").modal("show");
			calendar.render();
		});
		
		
		var mapOptions = {
		    center: new naver.maps.LatLng(37.483664, 126.899998),
		    zoom: 16
		};
		var map = new naver.maps.Map('gpsWalkMap', mapOptions);

		// ============== mqtt ============== 
		var partnerMarker = new naver.maps.Marker({
		    icon: {
	            content: '<img src="<c:url value="/resources/img/go.png"/>" alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 48px; height: 48px; left: 0px; top: 0px; border-radius: 70%;">',
	            anchor: new naver.maps.Point(16, 16)
	        }
		});
		
		var interval2;
		var senderEmail = "${principal.username}";
		console.log("sender : " + senderEmail);
		
// 		interval2 = setInterval(() => {
// 	        mqttClient.publish(mqtt_topic, JSON.stringify({lat: currentLat, lng: currentLng, sender: senderEmail}))
// 		}
// 		, 3000);
			
		//MQTT 수신 받을 상태로 초기화를 한다
	    //MQTT client
	    const roomId = prompt("번호 입력 (임시)");

		// dondog
		const mqtt_host = "www.dondog.site";
	    const mqtt_port = 8883; //websocket ssl port : mosquitt.conf 파일에 설정됨  
	    const mqtt_topic = "/kong/gps/" + roomId;
		
	    const options = {
    		  protocol : 'wss',
    		  hostname : mqtt_host,
	          port: mqtt_port,
	          username : 'kong',
	          password : '1234',
	          clean: true,
	    }

	    console.log('Connecting mqtt client ');
	    console.log('mqtt_topic -> ', mqtt_topic);
	      
	    const mqttClient = mqtt.connect(options);
	    console.log('mqttClient -> ', mqttClient);

	    const disconnect = () => {
	         console.log('mqtt 연결 끊음');
	         mqttClient.end();
	    }  
	      
	    mqttClient.on('error', (err) => {
	        console.log('Connection error: ', err)
	        mqttClient.end()
	    });
	      
	    mqttClient.on('reconnect', () => {
	        console.log('Reconnecting...')
	    });
	      
	    mqttClient.on('connect', () => {
	    	console.log('Connected')
	        //구독 메시지 등록 
	        //메시지 수신 이벤트 핸들러 등록
	        subscribe();
	    });
	      
	    // 구독 메시지 수신 
	    mqttClient.on('message', function (topic, message) {
	        // message is Buffer
// 	        console.log("mqtt message receive :", message.toString());
	        const latLng = message.toString().split(",");
	        const lat = latLng[0].substr(7);
	        const lng = latLng[1].substr(6);
	        const senderArr = message.toString().split("\"");
	        const sender = senderArr[7];

// 	        console.log("메세지 보낸 사람 : " + sender + ", 현재 페이지의 사람 : " + senderEmail);
	        if (!(sender === senderEmail)) {
// 		        console.log("상대방 마커 세팅 lat, lng, sender : " + lat + ", " + lng + ", " + sender);
		        partnerMarker.setMap(map);
	        	partnerMarker.setPosition(new naver.maps.LatLng(lat, lng));
	        }
	    })
	      
        $(window).on("beforeunload", e => {
        	  //구독을 해제 한다
        	  clearInterval(interval2);
            unsubscribe();
            disconnect();
            
            if (startFlag) {
				modTotalWalkCnt("minus");
            }
        });

	    //메시지 수신 이벤트 핸들러 등록
	    //구독을 등록한다
	    const subscribe = () => {
	    	mqttClient.subscribe(mqtt_topic, err => {
    		  console.log("Subscribe to a topic 생성");
    		  if (!err) {
    			  console.log("error", err);
	          } else {
	          }
	        });
	    }
	        
	    //메시지 수신를 해제 한다 
	    //구독을 해제한다
	    const unsubscribe = () => {
	    	  mqttClient.unsubscribe(mqtt_topic);
	    }
		
		
		// ============== geocoder ============== 
// 		var infoWindow = new naver.maps.InfoWindow({
// 		    anchorSkew: true
// 		});
		
// 		map.setCursor('pointer');

// 		function searchCoordinateToAddress(latlng) {

// 		    infoWindow.close();

// 		    naver.maps.Service.reverseGeocode({
// 		        coords: latlng,
// 		        orders: [
// 		            naver.maps.Service.OrderType.ADDR,
// 		            naver.maps.Service.OrderType.ROAD_ADDR
// 		        ].join(',')
// 		    }, function(status, response) {
// 		        if (status === naver.maps.Service.Status.ERROR) {
// 		            return alert('Something Wrong!');
// 		        }

// 		        var items = response.v2.results,
// 		            address = '',
// 		            htmlAddresses = [];

// 		        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
// 		            item = items[i];
// 		            address = makeAddress(item) || '';
// 		            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

// 		            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
// 		        }
				
// 		        infoWindow.setContent([
// 		            '<div style="padding:10px;min-width:200px;line-height:150%;">',
// 		            '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
// 		            htmlAddresses.join('<br />'),
// 		            '</div>'
// 		        ].join('\n'));

// 		        infoWindow.open(map, latlng);
// 		    });
// 		}

// 		function initGeocoder() {
// 		    map.addListener('click', function(e) {
// 		        searchCoordinateToAddress(e.coord);
// 		    });

// 		    $('#address').on('keydown', function(e) {
// 		        var keyCode = e.which;

// 		        if (keyCode === 13) { // Enter Key
// 		            searchAddressToCoordinate($('#address').val());
// 		        }
// 		    });

// 		    $('#submit').on('click', function(e) {
// 		        e.preventDefault();

// 		        searchAddressToCoordinate($('#address').val());
// 		    });
// 		}
		
// 		function makeAddress(item) {
// 		    if (!item) {
// 		        return;
// 		    }

// 		    var name = item.name,
// 		        region = item.region,
// 		        land = item.land,
// 		        isRoadAddress = name === 'roadaddr';

// 		    var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

// 		    if (hasArea(region.area1)) {
// 		        sido = region.area1.name;
// 		    }

// 		    if (hasArea(region.area2)) {
// 		        sigugun = region.area2.name;
// 		    }

// 		    if (hasArea(region.area3)) {
// 		        dongmyun = region.area3.name;
// 		    }

// 		    if (hasArea(region.area4)) {
// 		        ri = region.area4.name;
// 		    }

// 		    if (land) {
// 		        if (hasData(land.number1)) {
// 		            if (hasData(land.type) && land.type === '2') {
// 		                rest += '산';
// 		            }

// 		            rest += land.number1;

// 		            if (hasData(land.number2)) {
// 		                rest += ('-' + land.number2);
// 		            }
// 		        }

// 		        if (isRoadAddress === true) {
// 		            if (checkLastString(dongmyun, '면')) {
// 		                ri = land.name;
// 		            } else {
// 		                dongmyun = land.name;
// 		                ri = '';
// 		            }

// 		            if (hasAddition(land.addition0)) {
// 		                rest += ' ' + land.addition0.value;
// 		            }
// 		        }
// 		    }

// 		    return [sido, sigugun, dongmyun, ri, rest].join(' ');
// 		}

// 		function hasArea(area) {
// 		    return !!(area && area.name && area.name !== '');
// 		}

// 		function hasData(data) {
// 		    return !!(data && data !== '');
// 		}

// 		function checkLastString (word, lastString) {
// 		    return new RegExp(lastString + '$').test(word);
// 		}

// 		function hasAddition (addition) {
// 		    return !!(addition && addition.value);
// 		}

// 		naver.maps.onJSContentLoaded = initGeocoder;
		
		var marker = new naver.maps.Marker();
		var infoWindows = [];
		
		// 공원 불러오기
		fetch("<c:url value='/gps/loadPark'/>", {
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
		          content: '<div style="width:auto; text-align:center; font-size:75%; padding:10px;"><p>' + park.pname + '</p></div>'
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

		function onErrorGeolocation() {
		    var center = map.getCenter();

		    gpsInfoWindow.setContent('<div style="padding:20px;">' +
		        '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');

		    gpsInfoWindow.open(map, center);
		}

		$(window).on("load", function() {
		    if (navigator.geolocation) {
		        navigator.geolocation.watchPosition(onSuccessGeolocation);
		        navigator.geolocation.getCurrentPosition(onSuccessGeolocation2);
		    } else {
		        var center = map.getCenter();
		        gpsInfoWindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
		        gpsInfoWindow.open(map, center);
		    }
		});

		var interval;
		var selectDate = "";
		var wnum;
		
		// 순번 가져오기
		function getWnum(flag, selectDate) {
			const param = {
					userId: senderEmail,
					walkDate: selectDate
			}
			
			fetch("<c:url value='/gps/getWnum'/>", {
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
					for (var i = 1; i < wnum; i++) {
						$("#walkList").append("<input type='text' value='" + selectDate + " - " + i + "'>");
						$("#walkList").append("<button type='button' onclick='drawRoute(" + i + ")' class='btn btn-secondary'>경로보기</button>");
					}
				}
			});
		}
		
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
					userId: senderEmail,
					wnum: n,
					walkDate: selectDate
			}
			
			fetch("<c:url value='/gps/getRoute'/>", {
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
// 					console.log(route);
					path.push(new naver.maps.LatLng(route.lat, route.lng));
				});
				
				polyline.setPath(path);
				polyline.setMap(map);
			});
		}
		
		// 주 산책량
// 		fetch("<c:url value='/gps/getTotalDistance'/>", {
// 			method: "POST",
// 			headers: {
// 			    "Content-Type": "application/json; charset=UTF-8",
// 			},
// 			body: JSON.stringify(),
// 		})
// 		.then((response) => response.json())
// 		.then((json) => {
// 			const totalDistanceList = json.totalDistanceList;
			
// 			totalDistanceList.forEach(totalDistance => {
// 				console.log("날짜 : " + totalDistance.walkDate);
// 				console.log("총 산책량(미터) : " + totalDistance.totalDistance);
// 			});
// 		});
		
		var startFlag = false;
		
		$("#startBtn").on("click", e => {
			alert("시작");
			$("#startBtn").attr("disabled", true);
			$("#endBtn").attr("disabled", false);
			
			startFlag = true;
			modTotalWalkCnt("plus");
			getWnum();
			
			// x초마다 좌표 전송
			interval = setInterval(() => {
				const param = {
						userId: senderEmail,
						wnum: wnum,
						lat: currentLat,
						lng: currentLng
				}
				
				fetch("<c:url value='/gps/sendCoord'/>", {
					method: "POST",
					headers: {
					    "Content-Type": "application/json; charset=UTF-8",
					},
					body: JSON.stringify(param),
				})
				.then((response) => response.json())
				.then((json) => {
// 					console.log("위도 : " + currentLat + " / 경도 : " + currentLng);
				});
			}
			, 10000);
		});

		$("#endBtn").on("click", e => {
			alert("종료");
			$("#startBtn").attr("disabled", false);
			$("#endBtn").attr("disabled", true);
			
			modTotalWalkCnt("minus");
			
			clearInterval(interval);
		});
		
		function modTotalWalkCnt(pm) {
			fetch("<c:url value='/gps/modTotalWalkCnt?check=" + pm + "'/>", {
				method: "GET",
				headers: {
				    "Content-Type": "application/json; charset=UTF-8",
				},
			})
			.then((response) => response.json())
			.then((json) => {
				console.log("현재 산책 이용자 수 : " + json.totalWalkCnt);
			});
		}
		
	</script>
</body>
</html>
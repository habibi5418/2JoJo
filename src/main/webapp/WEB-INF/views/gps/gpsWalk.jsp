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

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="<c:url value='/resources/images/favicon/favicon.ico'/>"> <!--추가-->
	<link rel="apple-touch-icon" sizes="57x57" href="<c:url value='/resources/images/favicon/apple-icon-57x57.png'/>">
	<link rel="apple-touch-icon" sizes="60x60" href="<c:url value='/resources/images/favicon/apple-icon-60x60.png'/>">
	<link rel="apple-touch-icon" sizes="72x72" href="<c:url value='/resources/images/favicon/apple-icon-72x72.png'/>">
	<link rel="apple-touch-icon" sizes="76x76" href="<c:url value='/resources/images/favicon/apple-icon-76x76.png'/>">
	<link rel="apple-touch-icon" sizes="114x114" href="<c:url value='/resources/images/favicon/apple-icon-114x114.png'/>">
	<link rel="apple-touch-icon" sizes="120x120" href="<c:url value='/resources/images/favicon/apple-icon-120x120.png'/>">
	<link rel="apple-touch-icon" sizes="144x144" href="<c:url value='/resources/images/favicon/apple-icon-144x144.png'/>">
	<link rel="apple-touch-icon" sizes="152x152" href="<c:url value='/resources/images/favicon/apple-icon-152x152.png'/>">
	<link rel="apple-touch-icon" sizes="180x180" href="<c:url value='/resources/images/favicon/apple-icon-180x180.png'/>">
	<link rel="icon" type="image/png" sizes="192x192"  href="<c:url value='/resources/images/favicon/android-icon-192x192.png'/>">
	<link rel="icon" type="image/png" sizes="32x32" href="<c:url value='/resources/images/favicon/favicon-32x32.png'/>">
	<link rel="icon" type="image/png" sizes="96x96" href="<c:url value='/resources/images/favicon/favicon-96x96.png'/>">
	<link rel="icon" type="image/png" sizes="16x16" href="<c:url value='/resources/images/favicon/favicon-16x16.png'/>">
	<link rel="manifest" href="<c:url value='/resources/images/favicon/manifest.json'/>">
	<meta name="msapplication-TileColor" content="#ffffff'/>">
	<meta name="msapplication-TileImage" content="<c:url value='/resources/images/favicon/ms-icon-144x144.png'/>">
	<meta name="theme-color" content="#ffffff">
	
</head>
<link rel="stylesheet" href="<c:url value='/resources/css/style1.css' />">
<body>
	
	<div id='modalCalendar' class="modal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<div id='calendar'></div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../header.jsp" %>
	
	<div id="container2">
		<div id="gpsWalkMap"></div>
		
		<div id="townContainer">
			<div id="searchTownDiv">
				<button type="button" id="startBtn" class="walkBtn">출발</button>
				<button type="button" id="endBtn" class="walkBtn" disabled="disabled">도착</button><br>
				<button type="button" id="openCal">날짜 선택</button>
				<h3>일자별 산책 목록</h3>
				<div id="walkList"></div>
			</div>
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
		calendar.render();
		
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
		var partnerImgPath = "<c:url value='/dogProfile/download?dnum=${partnerDog.dnum }'/>";
		var partnerMarker = new naver.maps.Marker({
		    icon: {
		    	content: '<img src="' + partnerImgPath + '" alt="" style="margin: 0px; padding: 0px; border: 3px solid #770000; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 48px; height: 48px; left: 0px; top: 0px; border-radius: 70%;">',
				anchor: new naver.maps.Point(16, 16)
	        }
		});
		
		var interval2;
		var senderEmail = "${principal.username}";
		console.log("sender : " + senderEmail);
		
		//MQTT 수신 받을 상태로 초기화를 한다
	    //MQTT client
	    const roomId = "${room_id}";

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
	        const msg = JSON.parse(message.toString());
	        const lat = msg.lat;
	        const lng = msg.lng;
	        const sender = msg.sender;
	        
	        if (!(sender === senderEmail)) {
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
		
		var marker = new naver.maps.Marker();
		var infoWindows = [];
		const parkImgPath = "<c:url value='/resources/images/board/park.jpg'/>"
		
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
				    icon: {
				    	content: '<img src="' + parkImgPath + '" alt="" style="margin: 0px; padding: 2px; background-color: white; border: 2px solid blue; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 40px; height: 40px; left: 0px; top: 0px; border-radius: 70%;">',
						anchor: new naver.maps.Point(16, 16)
			        },
		        	map: map,
					position: position
		        });
		        
		        const parkInfoWindow = new naver.maps.InfoWindow({
		          content: '<div style="width:auto; text-align:center; font-size:75%; padding:10px;"><p style="margin-bottom:0px;">' + park.pname + '</p></div>'
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
		var myImgPath = "<c:url value='/dogProfile/download?dnum=${dog.dnum }'/>";
		
		var selectIcon = {
			content: '<img src="' + myImgPath + '" alt="" style="margin: 0px; padding: 0px; border: 3px solid #f0ad4e; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 48px; height: 48px; left: 0px; top: 0px; border-radius: 70%;">',
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
		}
		
		function onSuccessGeolocation2(position) {
		    const location = new naver.maps.LatLng(position.coords.latitude,
		                                         position.coords.longitude);
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
				if (flag == "load") {
					wnum = json.wnum + 1;
				} else if (flag == "append") {
					const maxWnum = json.wnum;
					
					if (maxWnum > 0) {
						for (var i = 1; i <= maxWnum; i++) {
							const walkListHtml = '<div id="walkListDiv">'
													+ '<input type="text" class="dateList" value="' + selectDate + ' / ' + i + '">' 
													+ '<button type="button" class="drawBtn" onclick="drawRoute(' + i + ')">경로보기</button>' 
											   + '</div>';
							$("#walkList").append(walkListHtml);
						}
					} else {
						$("#walkList").append('<h4>해당 일자에 산책 기록이 없습니다.</h4>');
					}
				}
			});
		}
		
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
					path.push(new naver.maps.LatLng(route.lat, route.lng));
				});
				
				polyline.setPath(path);
				polyline.setMap(map);
			});
		}
		
		function getToday() {
		    var date = new Date();
		    var year = date.getFullYear();
		    var month = ("0" + (1 + date.getMonth())).slice(-2);
		    var day = ("0" + date.getDate()).slice(-2);

		    return year + "-" + month + "-" + day;
		}
		
		var startFlag = false;
		
		$("#startBtn").on("click", e => {
			alert("시작");
			
			$("#startBtn").attr("disabled", true);
			$("#endBtn").attr("disabled", false);
			
			getWnum("load", getToday());
			
			startFlag = true;
			modTotalWalkCnt("plus");
			
			if (senderEmail != "") {
				// x초마다 좌표 전송
				interval = setInterval(() => {
					const param = {
							userId: senderEmail,
							wnum: wnum,
							lat: currentLat,
							lng: currentLng
					}
					
// 			        mqttClient.publish(mqtt_topic, JSON.stringify(param));
					fetch("<c:url value='/gps/sendCoord'/>", {
						method: "POST",
						headers: {
						    "Content-Type": "application/json; charset=UTF-8",
						},
						body: JSON.stringify(param),
					});
				}
				, 5000);
			}
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
		
		function getTotalWalkCnt() {
			fetch("<c:url value='/gps/getTotalWalkCnt'/>", {
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
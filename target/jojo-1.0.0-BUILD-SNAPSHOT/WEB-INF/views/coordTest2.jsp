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
<script type="text/javascript" src="/resources/mqtt/mqtt.min.js"></script>
<script type="text/javascript"
	src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9gy0xhxny4&submodules=geocoder"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<body>
	<div id="map" style="width: 100%; height: 750px;"></div>
	<div>
		<button id="connectBtn" type="button" class="btn btn-secondary connectBtn" data-num="1">mqtt 연결 - 1-1</button>
		<button id="connectBtn2" type="button" class="btn btn-secondary connectBtn" data-num="2">mqtt 연결 - 1-2</button>
		<br>
		<button id="showPosBtn" type="button" class="btn btn-primary">위치보기</button>
		<button id="endPosBtn" type="button" class="btn btn-dark">종료</button>
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
		var mapOptions = {
		    center: new naver.maps.LatLng(37.483664, 126.899998),
		    zoom: 16
		};
		var map = new naver.maps.Map('map', mapOptions);

		// ============== mqtt ============== 
		var partnerMarker = new naver.maps.Marker({
// 			position: new naver.maps.LatLng(37.583842, 127.001253), 
		    map: map,
		    icon: {
	            content: '<img src="<c:url value="/resources/img/go.png"/>" alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 48px; height: 48px; left: 0px; top: 0px; border-radius: 70%;">',
	            anchor: new naver.maps.Point(16, 16)
	        }
		});
		
		var interval2;
		var num;
		
		$("#connectBtn").on("click", () => {
			num = $("#connectBtn").data("num");
		})
		$("#connectBtn2").on("click", () => {
			num = $("#connectBtn2").data("num");
		})
		
		$(".connectBtn").on("click", btn => {
			$("#showPosBtn").on("click", () => {
				interval2 = setInterval(() => {
			        mqttClient.publish(mqtt_topic, JSON.stringify({lat: currentLat, lng: currentLng, sender: num}))
				}
				, 3000);
			});

			$("#endPosBtn").on("click", e => {
				clearInterval(interval2);
			});
			
			//MQTT 수신 받을 상태로 초기화를 한다
		    //MQTT client
		    const roomId = "kong1";
// 		    const roomId = "kong" + num;
// 		    const roomId2;
// 			if (num == 1) {
// 			    roomId2 = "kong2"
// 			} else {
// 			    roomId2 = "kong1"
// 			}
	
		    //MQTT info host, port, topic 을 설정.
		    const mqtt_host = "www.masungil.shop";
		    const mqtt_port = 9090; //websocket port : mosquitt.conf 파일에 설정됨  
		    const mqtt_topic = "/team1/sub/" + roomId;
// 		    const mqtt_topic2 = "/team1/sub/" + roomId2;
	
		    const options = {
		    		  hostname : 'www.masungil.shop',
		          port: 9090,
		          username : 'team1',
		          password : '1004team1',
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
		          
		        //채팅방에 입장 메시지를 서버에 전송한다
// 		        enterSendMessage();
		    });
		      
		    // 구독 메시지 수신 
		    mqttClient.on('message', function (topic, message) {
		        // message is Buffer
		        console.log("mqtt message receive :", message.toString());
		        const latLng = message.toString().split(",");
		        const lat = latLng[0].substr(7);
		        const lng = latLng[1].substr(6);
		        const sender = latLng[2].substr(9, 1);

		        if (!(sender == num)) {
			        console.log("lat, lng, sender : " + lat + ", " + lng + ", " + sender);
		        	partnerMarker.setPosition(new naver.maps.LatLng(lat, lng));
		        }

// 		        recvMessage(JSON.parse(message.toString()));
		    })
		      
// 		    $("#message").on("keydown", e => {
// 		    	  if (e.keyCode == 13) {
// 		    		  sendMessage();
// 		        }
// 		    });
		        
// 		    $("#send_message_button").on("click", e => {
// 		        sendMessage();
// 		    });
		        
// 		    $("#leave_button").on("click", e => {
// 		    	  $("#leave_button,#send_message_button").addClass("disabled");
// 		        $("#reenter_button").removeClass("disabled");
		        
// 		        //잠시 나간다 . 메시지 수신을 하는 않는다
// 		        unsubscribe();
		               
// 		        //채팅방에 퇴장메시지를 서버에 전송한다
// 		        leaveSendMessage();
	
// 		    });
		        
// 		    $("#reenter_button").on("click", e => {
// 		    	  $("#reenter_button").addClass("disabled");
// 		        $("#leave_button,#send_message_button").removeClass("disabled");
		        
// 		        //채팅방에 입장한다
// 		        //구독을 신청한다 
// 		        subscribe();
		            
// 		        //채팅방에 입장 메시지를 서버에 전송한다
// 		        enterSendMessage();
// 		    });
	
		        
// 		    $(document).ready(()=>{
// 		    	  //채팅방의 정보를 얻는다
// 		        console.log("before getRoomInfo");            
// 		        getRoomInfo();
		            
// 		    });

	        $(window).on("beforeunload", e => {
	        	  //구독을 해제 한다
// 	            leaveSendMessage();
	            unsubscribe();
	            disconnect();
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
		        
// 		    //roomId를 이용하여 채팅방 정보를 출력한다 
// 		    //현재는 이름만 출력함  
// 		    const getRoomInfo = () => {
// 		        $.ajax({ 
// 		            type: "GET",
// 		            url: "<c:url value='/chat/room/'/>" + roomId,
// 		            dataType: "json" // 요청을 서버로 해서 응답이 왔을 때 기본적으로 모든 것이 문자열 (생긴게 json이라면) => javascript오브젝트로 변경
// 		        }).done(resp => {
// 		            //채팅방의 이름을 출력한다 
// 		            console.log("getRoomInfo resp", resp);            
// 		            $("#room-name").text(resp.name + " - " + sender);
// 		        }).fail(err => {
// 		            console.log("getRoomInfo error", err);            
// 		        }); 
// 		    }
		        
// 		    //입장메시지를 전송한다
// 		    const enterSendMessage = () => {
// 		    	  console.log("enterSendMessage ")
		        
// 		    	  //채팅방에 입장을 서버에 전송한다
// 		    	  mqttClient.publish(mqtt_topic, JSON.stringify({type:'ENTER', roomId : roomId, sender : '[알림]', message : sender + "님 입장하셨습니다"}));
// 		    }
		        
// 		    //퇴장메시지를 전송한다
// 		    const leaveSendMessage = () => {
// 		    	  //채팅방에 입장을 서버에 전송한다
// 		        mqttClient.publish(mqtt_topic, JSON.stringify({type:'LEAVE', roomId : roomId, sender : '[알림]', message : sender + "님 퇴장하셨습니다"}));
// 		    }
		        
	
// 		    //서버에 메시지를 전송한다
// 		    const sendMessage = () => {
// 		    	  const message = $("#message").val();
// 		        mqttClient.publish(mqtt_topic, JSON.stringify({type:'TALK', roomId : roomId, sender : sender, message:message}));
// 		        $("#message").val("");
// 		    };
		         
// 		    const recvMessage = recv =>  {
// 		    	  console.log("상대방이 보낸 데이터 : " + recv);
// 		        $("#message_list").prepend('<li class="list-group-item" >[' + recv.sender + '] - ' + recv.message + '</li>'); 
// 		    }
		});
		
		
		// ============== geocoder ============== 
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
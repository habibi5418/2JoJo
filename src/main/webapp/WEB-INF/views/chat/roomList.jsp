<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()"> <!-- 인증이 됐는지안됐는지 확인하는 구문 -->
   <sec:authentication property="principal" var="principal"/> <!-- property로 가져와서 var 데이터타입으로 대입하겠다는뜻 -->
</sec:authorize>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chat</title>

<link rel="stylesheet"
	href="<c:url value='/resources/css/chat/roomlist.css'/>">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/mqtt/mqtt.min.js"></script>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>

<script type="text/javascript" src="/resources/mqtt/mqtt.min.js"></script>

</head>
<style>
	
	.chat{ height:  600px !important;}
	.left {display: block !important;}
	.right {display: block !important; margin-left: 120px !important;  width: 600px !important;}
	
}
</style>


<body>
<%-- <%@ include file="../header.jsp" %> --%>
	<div class="container">
		<h5 class="title">채팅방 목록</h5>
	</div>

	<!--   <div class="wrapper"> -->
	<div class="container">
		<div class="left">
			<div class="top">
				<input type="text" placeholder="Search" />
			</div>

			<div id="roomListContainer">
				<c:forEach var="room" items="${roomList}">
					<ul class="people">
<%-- 						<li class="person" data-roomid="${room.room_id}"> --%>
						<li class="person" onclick="click_li('${room.room_id}')" >
							<!-- 		            <img src="/resources/images/main/developer2.png" style="width: 80px;"/> -->
							<span class="name">${room.sender}</span> <%-- 		            <span class="time">${room.send_time}</span> --%>
							<!-- 		            <span class="preview">I was wondering...</span> -->
						</li>
					</ul>
				</c:forEach>
			</div>
			<!-- roomList -->

		</div>
		<!-- div left -->
	</div>


	<!--  틀은 그대로 있는데 이 안에 들어갈 내용은 아래ajax 에서 추가-->
	<div class="right" style="display: none !important;">
		<div class="top"> <!-- to : sender -->  </div>
		<div class="chat">
			<div class="conversation-start"> <!-- 채팅온 시간 --> </div>			
			<div class="message_list">
				<!-- <div class="bubble you"> ul li:message_list li:send_time </div>
				<div class="bubble_me"> ul li:message_list li:send_time </div> -->
			</div>
			<div class="write"> 
				<input type="text" name="message" id="message"/> 
				<button class="write-link send" id="btn_send"> SEND </button>
			</div>
		</div>
	</div>



	<script type="text/javascript">


	//roomId를 이용하여 채팅방 정보를 출력한다 
	var right = $('.right');
	var top = $('.top');
	var chat = $('.chat');
	var conversation = $('.conversation-start');
	var getMessageList = $('.message_list');
	var bubble_you = $('.bubble you');
	var bubble_me = $('.bubble_me');
	var loggedInUser = "${principal.username}";
	console.log(loggedInUser);
// 	var write = $('.write');
	
	function click_li(room_id) {
		
		//채팅방 정보 불러오는 처리
		$.ajax({ 
			type: "GET",
			url: '<c:url value="/chat/roomInfo/"/>'+room_id,
			contentType: "application/json; charset=UTF-8",
			dataType: "JSON",
			success: function (result) {
//	 			alert(result.messageList[0].message);
				var messageList = result.messageList;
				
				
				for (var i = 0; i < messageList.length; i++) {
					const message = messageList[i];
					
					var sender = message.sender;
					var send_time = message.send_time;
						if (loggedInUser === sender) {			
							console.log("if");			
						// 오른쪽append
						/* top.append("<span> TO "+  sender + "</span>"); */
						/* conversation.append("<span> 채팅온 시간 </span>"); */
						getMessageList.append("<div class='bubble_me'> <ul class='list-group' id='message_list'> <li class='bubble_me_msg'>"+ message.message + "</li>"
													+ "<li class='bubble_me_sendtime'>"+send_time+"</li></ul> </div>");
						} else {
							// 왼쪽 append 상대방
							/* top.append("<span> TO "+  sender + "</span>"); */
							/* conversation.append("<span> 채팅온 시간 </span>"); */
							getMessageList.append("<div class='bubble you'> <ul class='list-group' id='message_list'> <li class='bubble_you_msg'>"+ message.message + "</li>"
											+ "<li class='bubble_you_sendtime'>"+send_time+"</li></ul> </div>");
						}
				}
			}
		})
		right.css("display", "block");
		
		
		/************ mqtt **********/ 

		//MQTT info host, port, topic 을 설정.
		const mqtt_host = "www.dondog.site";
		const mqtt_port = 8883;
		const mqtt_topic = "/test/sub/" + room_id;

		const options = {
			protocol : 'wss',
			hostname : mqtt_host,
		    port: mqtt_port,
		    username : 'kong',
		    password : '1234',
		    clean: true
		}

		console.log('Connecting mqtt client ');
		console.log('mqtt_topic -> ', mqtt_topic);
		  
		const mqttClient = mqtt.connect(options);
		console.log('mqttClient -> ', mqttClient);

		mqttClient.on('error', (err) => {
		    console.log('Connection error: ', err)
		    /* mqttClient.end() */
		});

		mqttClient.on('connect', () => {
			  console.log('Connected')
		  //구독 메시지 등록 
		  //메시지 수신 이벤트 핸들러 등록
		  subscribe();
		    
		  //채팅방에 입장 메시지를 서버에 전송한다
		//   enterSendMessage();
		});







		// 구독 메시지 수신 
		mqttClient.on('message', function (topic, message) {
		    // message is Buffer
		    console.log("mqtt message receive :", message.toString())
		    recvMessage(JSON.parse(message.toString()))
		})
		 

		$("#message").on("keydown", e => {
			  if (e.keyCode == 13) {
				  sendMessage();
		    }
		});
		    
		    
		$("#btn_send").on("click", e => {
		    
//		 	alert('버튼 클릭')
			sendMessage();
		});



		// 
//		 	//시작시 방목록을 얻어 출력한다
//		 	 console.log("before getRoomInfo");  
//		 	// 	roomListOutput();
			
//		 	// 방 출력
			
		//  $(document).ready(()=>{ });




		/***************************************************************/

		//메시지 수신 이벤트 핸들러 등록
		//구독을 등록한다
		const subscribe = () => {
			  mqttClient.subscribe(mqtt_topic, err => {
				  console.log("Subscribe to a topic 생성");
				  if (!err) {
					  console.log("error", err);
		      } 
		    })
		}

		
		const sender = "${principal.getUsername()}"; 

		//서버에 메시지를 전송한다
		const sendMessage = () => {
			
			let today = new Date();   
			let hours = today.getHours(); //시
			let minutes = today.getMinutes(); //분
			
			const message = $("#message").val();
			
		    mqttClient.publish(mqtt_topic, JSON.stringify({type:'TALK', room_id : room_id, sender : loggedInUser , message: message, send_time: hours+":"+minutes}));
		    $("#message").val("");
		
			// ajax처리
			$.ajax({ 
				type: "POST",
				url: '<c:url value="/chat/saveMessage"/>',
				contentType: "application/json; charset=UTF-8",
				dataType: "JSON",
				data: JSON.stringify({
					 room_id : room_id
					,sender : loggedInUser 
					,message: message	
				}),
				success: function (result) {
					console.log('메시지 전송-> db 저장');
				}
			}) 
			
			 
			
		
		};




		const recvMessage = recv =>  {
			console.log(recv);
			const top = $('.top');
			const conversation = $('.conversation-start');
			const sender = recv.sender;
			const send_time = recv.send_time;
			
//		   	$(".message_list").append('<li class="list-group-item" >[' + recv.sender + '] - ' + recv.message + '</li>'); 
		  	if (loggedInUser === sender) {						
				// 오른쪽append
				
				/* top.append("<span> TO "+  sender + "</span>"); */
				/* conversation.append("<span> 채팅온 시간 </span>"); */
				getMessageList.append("<div class='bubble_me'> <ul class='list-group' id='message_list'> <li class='bubble_me_msg'>"+ recv.message + "</li>"
									+ "<li class='bubble_me_sendtime'>"+send_time+"</li></ul> </div>");
			
			} else {
				// 왼쪽 append 상대방
			/* 	top.append("<span> TO "+  sender + "</span>"); */
				/* conversation.append("<span> 채팅온 시간 </span>"); */
				getMessageList.append("<div class='bubble you'> <ul class='list-group' id='message_list'> <li class='bubble_you_msg'>"+ recv.message + "</li>"
								+ "<li class='bubble_you_sendtime'>"+send_time+"</li></ul> </div>");
			} 
		}


		
	}

	
	
//	right.append (
//				"<div class='top'> <span> TO "+  sender + "</span> </div>" 
//				+ "<div class='chat'> <div class='conversation-start'> <span> 채팅온 시간 </span></div>"
//				+ "<div class='bubble_me'><ul class='list-group' id='message_list'> <li class='bubble_me_msg'>"+ message.message + "</li>"
//				+ "<li class='bubble_me_sendtime'>"+send_time+"</li></ul></div></div>"
//				+ "<div class='write'> <input type='text' name='message' id='message'/> <button class='write-link send' id='btn_send'>SEND</button></div>");

//			right.append ("<div class='top'> <span> TO "+  sender + "</span> </div>" 
//						+ "<div class='chat'> <div class='conversation-start'> <span> 채팅온 시간 </span></div>"
//						+ "<div class='bubble you'> <ul class='list-group' id='message_list'> <li class='bubble_you_msg'>"+ message.message + "</li>"
//						+ "<li class='bubble_you_sendtime'>"+send_time+"</li></ul></div></div>"
//						+ "<div class='write'> <input type='text' name='message' id='message'/> <button class='write-link send' id='btn_send'>SEND</button></div>");

//MQTT 수신 받을 상태로 초기화를 한다
//MQTT client
// const room_id = localStorage.getItem('chat.room_id');
// const sender = localStorage.getItem('chat.sender');

// //MQTT info host, port, topic 을 설정.
// const mqtt_host = "www.dondog.site";
// const mqtt_port = 8883;
// const mqtt_topic = "/test/sub/" + room_id;

// const options = {
// 	protocol : 'wss',
// 	hostname : mqtt_host,
//     port: mqtt_port,
//     username : 'kong',
//     password : '1234',
//     clean: true
// }

// console.log('Connecting mqtt client ');
// console.log('mqtt_topic -> ', mqtt_topic);
  
// const mqttClient = mqtt.connect(options);
// console.log('mqttClient -> ', mqttClient);

// mqttClient.on('error', (err) => {
//     console.log('Connection error: ', err)
//     /* mqttClient.end() */
// });

// mqttClient.on('connect', () => {
// 	  console.log('Connected')
//   //구독 메시지 등록 
//   //메시지 수신 이벤트 핸들러 등록
//   subscribe();
    
//   //채팅방에 입장 메시지를 서버에 전송한다
// //   enterSendMessage();
// });







// // 구독 메시지 수신 
// mqttClient.on('message', function (topic, message) {
//     // message is Buffer
//     console.log("mqtt message receive :", message.toString())
//     recvMessage(JSON.parse(message.toString()))
// })
 

// $("#message").on("keydown", e => {
// 	  if (e.keyCode == 13) {
// 		  sendMessage();
//     }
// });
    
    
// $("#btn_send").on("click", e => {
    
// // 	alert('버튼 클릭')
// 	sendMessage();
// });



// // 
// // 	//시작시 방목록을 얻어 출력한다
// // 	 console.log("before getRoomInfo");  
// // 	// 	roomListOutput();
	
// // 	// 방 출력
	
// //  $(document).ready(()=>{ });




// /***************************************************************/

// //메시지 수신 이벤트 핸들러 등록
// //구독을 등록한다
// const subscribe = () => {
// 	  mqttClient.subscribe(mqtt_topic, err => {
// 		  console.log("Subscribe to a topic 생성");
// 		  if (!err) {
// 			  console.log("error", err);
//       } 
//     })
// }


// //서버에 메시지를 전송한다
// const sendMessage = () => {
	
// 	let today = new Date();   
// 	let hours = today.getHours(); //시
// 	let minutes = today.getMinutes(); //분
	
// 	const message = $("#message").val();
//     mqttClient.publish(mqtt_topic, JSON.stringify({type:'TALK', room_id : room_id, sender : sender, message: message, send_time: hours+":"+minutes}));
//     $("#message").val("");
// };




// const recvMessage = recv =>  {
// 	console.log(recv);
// 	const top = $('.top');
// 	const conversation = $('.conversation-start');
// 	const messageList = $('.message_list');
// 	const sender = recv.sender;
// 	const send_time = recv.send_time;
	
// //   	$(".message_list").append('<li class="list-group-item" >[' + recv.sender + '] - ' + recv.message + '</li>'); 
//   	if (loggedInUser === sender) {						
// 		// 오른쪽append
		
// 		/* top.append("<span> TO "+  sender + "</span>"); */
// 		/* conversation.append("<span> 채팅온 시간 </span>"); */
// 		messageList.append("<div class='bubble_me'> <ul class='list-group' id='message_list'> <li class='bubble_me_msg'>"+ recv.message + "</li>"
// 							+ "<li class='bubble_me_sendtime'>"+send_time+"</li></ul> </div>");
	
// 	} else {
// 		// 왼쪽 append 상대방
// 	/* 	top.append("<span> TO "+  sender + "</span>"); */
// 		/* conversation.append("<span> 채팅온 시간 </span>"); */
// 		messageList.append("<div class='bubble you'> <ul class='list-group' id='message_list'> <li class='bubble_you_msg'>"+ recv.message + "</li>"
// 						+ "<li class='bubble_you_sendtime'>"+send_time+"</li></ul> </div>");
// 	} 
// }




//전체 방목록을 얻어 출력한다  
// const roomListOutput = () => {
// 	$.ajax({ 
// 		type: "POST",
// 		url: '<c:url value="/chat/roomList"/>',
// 		contentType: "application/json; charset=UTF-8",
// 		dataType: "JSON",
// 		data: JSON.stringify(roomInfo)
// 	}).done(roomList => {
		
// 		var length = roomList.roomList.length;
		
// 		for (var i = 0; i < length; i++) {
// 			var list = $("#roomList-group"); //ul_list선언
// 			const sender = roomList.roomList[i].sender;
// 			const send_time = roomList.roomList[i].send_time;
		
// 			list.append("<li>"+ sender +"님과의 채팅" + send_time + "</li>"); 
		
// 		}
		
		
// 	});
// }; //roomListOutput
	

</script>
</body>
</html>


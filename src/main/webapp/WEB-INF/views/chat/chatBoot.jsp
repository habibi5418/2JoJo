<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<!-- 인증이 됐는지안됐는지 확인하는 구문 -->
	<sec:authentication property="principal" var="principal" />
	<!-- property로 가져와서 var 데이터타입으로 대입하겠다는뜻 -->
</sec:authorize>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chat Boot here</title>

<script type="text/javascript" src="/resources/mqtt/mqtt.min.js"></script>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon"
	href="<c:url value='/resources/images/favicon/favicon.ico'/>">
<!--추가-->
<link rel="apple-touch-icon" sizes="57x57"
	href="<c:url value='/resources/images/favicon/apple-icon-57x57.png'/>">
<link rel="apple-touch-icon" sizes="60x60"
	href="<c:url value='/resources/images/favicon/apple-icon-60x60.png'/>">
<link rel="apple-touch-icon" sizes="72x72"
	href="<c:url value='/resources/images/favicon/apple-icon-72x72.png'/>">
<link rel="apple-touch-icon" sizes="76x76"
	href="<c:url value='/resources/images/favicon/apple-icon-76x76.png'/>">
<link rel="apple-touch-icon" sizes="114x114"
	href="<c:url value='/resources/images/favicon/apple-icon-114x114.png'/>">
<link rel="apple-touch-icon" sizes="120x120"
	href="<c:url value='/resources/images/favicon/apple-icon-120x120.png'/>">
<link rel="apple-touch-icon" sizes="144x144"
	href="<c:url value='/resources/images/favicon/apple-icon-144x144.png'/>">
<link rel="apple-touch-icon" sizes="152x152"
	href="<c:url value='/resources/images/favicon/apple-icon-152x152.png'/>">
<link rel="apple-touch-icon" sizes="180x180"
	href="<c:url value='/resources/images/favicon/apple-icon-180x180.png'/>">
<link rel="icon" type="image/png" sizes="192x192"
	href="<c:url value='/resources/images/favicon/android-icon-192x192.png'/>">
<link rel="icon" type="image/png" sizes="32x32"
	href="<c:url value='/resources/images/favicon/favicon-32x32.png'/>">
<link rel="icon" type="image/png" sizes="96x96"
	href="<c:url value='/resources/images/favicon/favicon-96x96.png'/>">
<link rel="icon" type="image/png" sizes="16x16"
	href="<c:url value='/resources/images/favicon/favicon-16x16.png'/>">
<link rel="manifest"
	href="<c:url value='/resources/images/favicon/manifest.json'/>">
<meta name="msapplication-TileColor" content="#ffffff'/>">
<meta name="msapplication-TileImage"
	content="<c:url value='/resources/images/favicon/ms-icon-144x144.png'/>">
<meta name="theme-color" content="#ffffff">


<!--boot -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="<c:url value='/resources/css/chat/chatBoot.css'/>">
	
	<!-- header	 -->
	<link rel="stylesheet" href="<c:url value='/resources/css/modal.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/chatHeader.css'/>">

 	<!-- Animate.css -->
   <link rel="stylesheet" href="<c:url value='/resources/css/animate.css'/>">

   <!-- Simple Line Icons -->
   <link rel="stylesheet" href="<c:url value='/resources/css/simple-line-icons.css'/>">
	
   <!-- Bootstrap  -->
   <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
	
   <!-- fonts -->
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	
	<!-- 200 -->
   <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
	<!-- 700 -->
   <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;700&display=swap" rel="stylesheet">
  
	<!-- Modernizr JS -->
   <script src="<c:url value='/resources/js/modernizr-2.6.2.min.js'/>"></script>
   
</head>
<style>
.confirm_modal {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 20px;
    background-color: #675040;
    width: 600px;
    height: 150px;
    color: white;
    border-radius: 10px;
}

.confirm-modal-content{
    text-align: center;
    margin-top: 10px auto;
    
}

.confirm-modal-content p{
   margin-top: 8px;
   margin-bottom: 20;
}


.confirm-modal-content button:hover {
	font-weight: bold;
	
}

</style>
<body>
   <header role="banner" id="fh5co-header">
       <div class="container-header">
                <div class="row">
                    <nav class="navbar-header-nav navbar-default navbar-fixed-top">
                        <div class="navbar-btn">
                            <ul class="navbar-right-btn">
                                <li class="navbar-right-li">
                                   <button onclick="location.href='<c:url value="/chat/roomList/"/>' ">
                                      <img src="<c:url value='/resources/images/main/chat1.png'/>">
                                   </button>
                                </li>
                                <li class="navbar-right-li">
                                   <button onclick="modalAlram()">
                                      <img src="<c:url value='/resources/images/main/alram.png'/>">
                                   </button>
                                </li>
                               <c:choose>
                                  <c:when test="${empty principal}"> 
                                    <li class="navbar-right-li">
                                       <button onclick="location.href=' <c:url value='/loginForm' />';">
                                          <img src="<c:url value='/resources/images/main/login2.png'/>">
                                       </button>
                                    </li>
                                   </c:when>
                                   <c:otherwise>
                                      <li class="navbar-right-li">
                                         <button onclick="location.href=' <c:url value='/logout' />';">
                                         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <img src="<c:url value='/resources/images/main/logout1.png'/>">
                                         </button>
                                      </li>
                                   </c:otherwise>
                                 </c:choose>
                            </ul>
                        </div><!-- navbar-right-btn -->
                        <div class="navbar-header">
                            <!-- Mobile Toggle Menu Button -->
<!--                           <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" -->
<!--                               data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a> -->
                          <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="true" aria-controls="navbar"><i></i></a>

                          <a class="navbar-brand" href="<c:url value='/'/>" style="font-weight: 700; font-size: 24px;" > dondog </a> 
                        </div>

                        <!-- PC Toggle  -->
                        <div id=navbar-header-pc class="navbar-collapse collapse">
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="#" id="headerGoHome">home</a></li>
<!--                                 <li><a href="#" id="headerGoBoard">match</a></li> -->
<!-- <!--                                 <li><a href="#" id="headerGoGps">gps</a></li> --> 
<!--                                 <li><a href="#" id="headerGoProfile">profile</a></li> -->
<!--                                 <li><a href="#" id="headerGoOur">our</a></li> -->
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            
            <!-- 알림 모달 -->
		<div id="myModal" class="modal2">
			<!-- 탭 선택 버튼 -->
			<div class="button-style">
				<button onclick="openTab('activityTab')">활동알림</button>
				<button onclick="openTab('keywordTab')">키워드알림</button>
				<button id="closeBtn" onclick="closeModal()"
					style="width: 20px !important; float: right; display: flex;">
					X</button>
			</div>

			<!-- 활동알림 탭 내용 -->
			<div id="activityTab" class="tab" style="display: block;">
				<div class="req_content">
					<div class="resultContainer" >
						<ul id="resultPush"></ul>
					</div>
				</div>
			</div>

			<!-- 키워드알림 탭 내용 -->
			<div id="keywordTab" class="tab">
				<!-- 키워드알림 내용 -->
			</div>
			
			<div id="confirm" class="confirm_modal">
			    <div class="confirm-modal-content">
			        <p style="font-size: 18px;"> 대화를 시작하세요! </p>
			        <button id="startChatBtn" style="font-size:18px;"> Go chat </button>
			        <button id="laterBtn" style="font-size:18px;"> Later </button>
			    </div>
			</div>
		</div>
	</header>





	<div class="container-fluid h-100" style="margin-top: 400px; font-size: 40px; background:#f4dc9f;">
		<div class="row justify-content-center h-100">
			<div class="col-md-4 col-xl-3 chat" style="margin-top: 40px;">
				<div class="card mb-sm-3 mb-md-0 contacts_card">

					<!--search -->
					<div class="card-header">
						<div class="input-group">
							<input type="text" placeholder="Search..." name=""
								class="form-control search">
							<div class="input-group-prepend">
								<span class="input-group-text search_btn"><i
									class="fas fa-search"></i></span>
							</div>
						</div>
					</div>


					<!--left 고정-->
					<c:forEach var="room" items="${roomList}">
					<div class="card-body contacts_body">
						<ul class="contacts">
							<li class="active" onclick="click_li('${room.room_id}')">
								<div class="d-flex bd-highlight">
									<div class="img_cont">
										<!-- 프로필 이미지 -->
										<img class="rounded-circle user_img">
										<!-- <span class="online_icon"></span> -->
									</div>
									<div class="user_info">
										<span>${room.sender}</span>
<!-- 										<p>Kalid is online</p> -->
									</div>
								</div>
							</li>
						</ul>
					</div> <!-- left card-body -->
					</c:forEach>
					<!-- footer-->
					<div class="card-footer"></div>
				</div>
				<!--contacts_card-->
			</div>


			<!-- right -->
			<div class="col-md-8 col-xl-6 right-chat">
				<div class="card">
					<div class="card-header msg_head">
						<!-- right-top header -->
						<div class="d-flex bd-highlight">
							<div class="img_cont">
								<img
									src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg"
									class="rounded-circle user_img"> <span
									class="online_icon"></span>
							</div>

							<div class="user_info">
								<span>Chat with</span>
							</div>

						</div>

						<!-- top - ... 더보기 버튼 -->
						<span id="action_menu_btn"><i class="fas fa-ellipsis-v"></i></span>
						<div class="action_menu">
							<ul>
								<li><i class="fas fa-user-circle"></i> View profile</li>
								<li><i class="fas fa-ban"></i> Block</li>
							</ul>
						</div>
					</div>


					<!-- message list  .chat -->
					<div class="card-body msg_card_body">

						<div class="d-flex justify-content-end mb-4">
							<div class="msg_container_list" style="width: 100% !important;">
								
<!-- 								<span class="msg_time_send">8:55 AM, Today</span> -->
							</div>
							<!-- sender만  -->
							<div class="img_cont_msg">
								<img class="rounded-circle user_img_msg">
							</div>
						</div>
					</div>

					<!-- footer - writer -->
					<div class="card-footer">
						<div class="input-group">
							<input type="text" name="message" id="message" class="form-control type_msg"
								placeholder="Type your message..." />
							<div class="input-group-append">
<!-- 								<span class="input-group-text send_btn"> -->
								<button class="input-group-text send_btn" id="btn_send"> send </button>	
								<button class="input-group-text send_btn" id="goGpsBtn"> match </button>	
							</div>
						</div>
					</div>
					
				</div>
				
			</div>
		</div>
	</div>
</body>
 <!-- js -->   
         
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<!-- jQuery Easing -->
	<script src="<c:url value='/resources/js/jquery.easing.1.3.js'/>"></script>
	<!-- bootstrap -->
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
	<!-- Waypoints  -->
	<script src="<c:url value='/resources/js/jquery.waypoints.min.js'/>"></script>
	<!-- Stellar Parallax -->
	<script src="<c:url value='/resources/js/jquery.stellar.min.js'/>"></script>
	<!-- Counters  -->
	<script src="<c:url value='/resources/js/jquery.countTo.js'/>"></script>
	<!-- Main JS (Do not remove)  -->
	<script src="<c:url value='/resources/js/main.js'/>"></script>

<script>


$(document).ready(function () {
    $('#action_menu_btn').click(function () {
        $('.action_menu').toggle();
    });
});

/* ************************************************* */
/* location   */
	$("#headerGoHome").on("click", () => {
		location.href = "<c:url value='/'/>";
	});
	$("#headerGoBoard").on("click", () => {
     	location.href = "<c:url value='/board/list'/>";
	});
// 	$("#headerGoGps").on("click", () => {
//     	location.href = "<c:url value='/gps/walk'/>";
// 	});
   	$("#headerGoProfile").on("click", () => {
   		location.href='<c:url value="/profile/myInfo"/>' 
   	});
//             	$("#headerGoOur").on("click", () => {
//             		location.href = "<c:url value='/board/list'/>";
//             	});


/* ************************************************* */
/* 알림 탭 기능 */
	const receiver = "${principal.getUsername()}";
	const chatRoomData = {
            receiver: receiver
    };
    
	$.ajax({
        type: "POST",
        url: "<c:url value='/chat/requestList'/>",
        contentType: "application/json; charset=UTF-8",
        dataType: "JSON",
        data: JSON.stringify(chatRoomData)
    }).done(requestList => { 
      // 받은 requestList를 for문을 사용하여 처리하고 append로 추가
      for (var i = 0; i < requestList.requestList.length; i++) {
    		var resultPush = $("#resultPush"); //ul_list선언
    		const req_id = requestList.requestList[i].req_id;
    		const sender = requestList.requestList[i].sender;
    		const req_send_time = requestList.requestList[i].req_send_time;
    		
    		resultPush.append("<li class='resultPush-li'>"+ sender +"님이 채팅을 요청했습니다." + req_send_time 
    								+"<button id='btn_success" + req_id + "'>✔</button>"
    							    +"<button id='btn_cancel" + req_id + "'>✘</button></li>"); 
    		
    		// ✔ 버튼
    	    $("#btn_success" + req_id).on("click", function () {
    	    	$("btn_success").empty();
    	   		updateRequestStatus(req_id, sender);
    	    }); // btn success 
      } //for
    }); //requestList .ajax  
    	    	
    function updateRequestStatus(req_id, sender) {
        const updateInfo = {
        		req_id : req_id,
        		sender : sender
        }
        
    	$.ajax({
            type: "POST",
            url: "<c:url value='/chat/updateRequestStatus'/>",
            contentType: "application/json; charset=UTF-8",
            dataType: "JSON",
            data: JSON.stringify(updateInfo)
	    	}).done(result => { 
	    			createChatRoom(sender);
	    	});
           
        	
    };	//updateRequestStatus   
    
    
    function createChatRoom (sender) {
    
    	const roomInfo = {
    			receiver: receiver,
    			sender: sender
    	}
    	
    	$.ajax({
    		type: "POST",
            url: "<c:url value='/chat/createChatRoom'/>",
            contentType: "application/json; charset=UTF-8",
            dataType: "JSON",
            data: JSON.stringify(roomInfo)
	    	}).done(result => { 
// 				alert("room_id 생성: "+result.room_id);
	    		const room_id = result.room_id;
	    		localStorage.setItem('chat.sender', sender);
	        	localStorage.setItem('chat.receiver', receiver);
	        	localStorage.setItem('chat.room_id', room_id);
	        	
	        	// Show custom modal
	            $('.confirm_modal').show();

	            // Handle button clicks
	            $('#startChatBtn').on('click', function() {
	                // User clicked "Start Chat"
	                location.href = "<c:url value='/chat/roomList/'/>";
	            });

	            $('#laterBtn').on('click', function() {
	                $('.confirm_modal').hide();
	            });
	    	});
    		
		
    	
    }; //createChatroom
    
    

/* ************************************************* */
/* modal */


	function modalAlram() {
			// 모달 열 때 기본적으로 활동알림 탭을 열도록 설정
			document.getElementById('activityTab').style.display = 'block';
            document.getElementById('keywordTab').style.display = 'none';
            // 모달 열기
            document.getElementById('myModal').style.display = 'block';
            
		}
		
		function closeModal() {
            document.getElementById('myModal').style.display = 'none';
        }

		function openTab(tabName) {
            // 선택된 탭 보여주기
            var tabs = document.getElementsByClassName('tab');
            for (var i = 0; i < tabs.length; i++) {
                tabs[i].style.display = 'none';
            }
            document.getElementById(tabName).style.display = 'block';
        }

		
		
		
/* ************************************************* */		
		
  //roomId를 이용하여 채팅방 정보를 출력한다 
	var right = $('.chat');
	var top = $('.card-header');
	var chat = $('.card-body');
	
	var userInfo = $('.user_info');
	
// 	var conversation = $('.conversation-start');
	var getMessageList = $('.msg_container_list');
	
// 	var bubble_you = $('.bubble you');
	var msg_cotainer_send_you = $('.msg_cotainer_send_you');
	var msg_cotainer_send_me = $('.msg_cotainer_send_me');
	
	var loggedInUser = "${principal.username}";
	
	
    
function click_li(room_id) {
	// 산책 페이지로 이동 클릭이벤트
	$("#goGpsBtn").on("click", () =>{
		location.href = "<c:url value='/gps/walk?room_id=" + room_id + "'/>";
	});
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
// 							userInfo.append("<span>" + !loggedInUser + "</span>")
						// 오른쪽append
						/* top.append("<span> TO "+  sender + "</span>"); */
							getMessageList.append(
									"<div class='msg_cotainer_send_me'>" +  message.message 
										+ "<span class='msg_time_send'>"+send_time+"</span>"
									+"</div>");
// 							getMessageList.append(
// 									"<div class='bubble_me'> "
// 										+"<ul class='list-group' id='message_list'>"
// 										+	"<li class='bubble_me_msg'>"+ message.message + "</li>"
// 										+	"<li class='msg_time_send'>"+send_time+"</li>"
// 										+"</ul>"
// 									+"</div>");
						
						} else {
							// 왼쪽 append 상대방
// 							userInfo.append("<span>" + message.sender + "</span>")
							/* top.append("<span> TO "+  sender + "</span>"); */
							/* conversation.append("<span> 채팅온 시간 </span>"); */
							
							getMessageList.append(
											"<div class='msg_cotainer_send_you'>" +  message.message 
												+ "<span class='msg_time_send'>"+send_time+"</span>"
											+ "</div>"
							);
// 									"<div class='bubble you'> "
// 										+"<ul class='list-group' id='message_list'>"
// 											+"<li class='bubble_you_msg'>"+ message.message + "</li>"
// 											+"<li class='msg_time_send'>"+send_time+"</li>"
// 										+"</ul>"
// 									+"</div>");
							
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
		  //구독 메시지 등록 : 메시지 수신 이벤트 핸들러 등록
		  subscribe();
		});

		// 구독 메시지 수신 
		mqttClient.on('message', function (topic, message) {
		    console.log("mqtt message receive :", message.toString())
		    recvMessage(JSON.parse(message.toString()))
		})

		$("#message").on("keydown", e => {
			  if (e.keyCode == 13) {
				  sendMessage();
		    }
		});
		    
		$("#btn_send").on("click", e => {
			sendMessage();
		});

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
// 			const conversation = $('.conversation-start');
			const sender = recv.sender;
			const send_time = recv.send_time;
			
//		   	$(".message_list").append('<li class="list-group-item" >[' + recv.sender + '] - ' + recv.message + '</li>'); 
		  	if (loggedInUser === sender) {						
				// 오른쪽append
				/* top.append("<span> TO "+  sender + "</span>"); */
				
				getMessageList.append(
					"<div class='msg_cotainer_send_me}'>" +  recv.message 
						+ "<span class='msg_time_send'>"+send_time+"</span>"
					+ "</div>"
				);
				
// 		  		getMessageList.append(
// 						"<div class='bubble_me'>"
// 							+"<ul class='list-group' id='message_list'>"
// 								+"<li class='bubble_me_msg'>"+ recv.message + "</li>"
// 								+"<li class='msg_send_time'>"+send_time+"</li>"
// 							+"</ul>"
// 						+"</div>");
			} else {
				// 왼쪽 append 상대방
			/* 	top.append("<span> TO "+  sender + "</span>"); */
				/* conversation.append("<span> 채팅온 시간 </span>"); */
							
				getMessageList.append(
					"<div class='msg_cotainer_send_you'>" +  recv.message 
						+ "<span class='msg_time_send'>"+send_time+"</span>"
					+ "</div>"
				);
				
				
				// 				getMessageList.append(
// 						"<div class='bubble you'>"
// 							+"<ul class='list-group' id='message_list'>"
// 								+"<li class='bubble_you_msg'>"+ recv.message + "</li>"
// 								+"<li class='msg_send_time'>"+send_time+"</li>"
// 							+"</ul>"
// 						+"</div>");
			
			} 
		}
	}
		


</script>

</html>
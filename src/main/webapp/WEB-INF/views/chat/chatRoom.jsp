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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/mqtt/mqtt.min.js"></script>
<script type="text/javascript">

const room_id = localStorage.getItem('chat.room_id');
const receiver = localStorage.getItem('chat.receiver');
const sender = localStorage.getItem('chat.sender');



//MQTT 연결
const mqtt_host = "www.dondog.site";
const mqtt_port = 8883; //websocket ssl port : mosquitt.conf 파일에 설정됨  
const mqtt_topic = "/mqtt/chat/" + room_id;

// sub : 구독, 메시지를 수신할 때 특정 토픽을 구독
// user_topic = "/sub/${email}"
// pub : 발행,해당 메시지의 토픽을 mqtt 브로커에게 전달
// room_topic = "/pub/${rnum}"
// const mqtt_receiver_topic = "/ws/chat/sub" + rnum;

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

/*error*/
mqttClient.on('error', (err) => {
    console.log('Connection error: ', err)
    mqttClient.end()
});


/* connect 1 */
mqttClient.on('connect', () => {
  console.log('Connected')
  //구독 메시지 등록 
  
  //메시지 수신 이벤트 핸들러 등록
  subscribe(); //2 
    
  //채팅방에 입장 메시지를 서버에 전송한다
  enterSendMessage();
});


$(document).ready(()=>{
  console.log("before getRoomInfo");            
  //채팅방의 정보를 얻는다 : 백 생성후 
  //   getRoomInfo();
  
  $("#send_message_button").on("click", e => {
		console.log("ㅁㄴㅇㄴㅁㅇㅁㄴ");
	    sendMessage();
	});

  
  
  $(window).on("beforeunload", e => {
  	  //구독을 해제 한다
      unsubscribe();
      mqttClient.disconnect();
  
  })
  
  
  
});

// 구독 메시지 수신 3
mqttClient.on('message', function (topic, message) {
    // message is Buffer
    console.log("mqtt message receive :", message.toString())
    recvMessage(JSON.parse(message.toString()))
}) // => const recvMessage


$("#message").on("keydown", e => {
	  if (e.keyCode == 13) {
		  sendMessage();
  }
});





/*
 * ******************************************************************
 */



/* event handler*/
//subscribe
//메시지 수신 이벤트 핸들러 등록 : 구독을 등록한다
	const subscribe = () => {
		  mqttClient.subscribe(mqtt_topic, err => {
			  console.log("Subscribe to a topic 생성");
			  if (!err) {
				  console.log("error", err);
	      } else {
	    	  
	      } 
	    });
	}

//enterSendMessage
// 채팅방에 입장한 내용을 서버에 전송
    const enterSendMessage = () =>{
    	  console.log("채팅방 입장 ");
    	  
    	  
    	  mqttClient.publish(mqtt_topic, JSON.stringify({
    		  												type:'ENTER', 
    		  												sender : sender, //로그인한 세션 사용자를 지정  
    		  												message : sender + "님 입장하셨습니다" 
    		  											}));
    	  
    }
    


// 구독 해제 unsubscribe : 메시지 수신를 해제 한다 
    const unsubscribe = () => {
    	  mqttClient.unsubscribe(mqtt_topic);
    }


  //roomId를 이용하여 채팅방 정보를 출력한다
//     const getRoomInfo = () => {
//         $.ajax({ 
//             type: "GET",
//             url: "<c:url value='/chat/room/'/>" + roomId,
//             dataType: "json" // 요청을 서버로 해서 응답이 왔을 때 기본적으로 모든 것이 문자열 (생긴게 json이라면) => javascript오브젝트로 변경
//         }).done(resp => {
//             //채팅방의 이름을 출력한다 
//             console.log("getRoomInfo resp", resp);            
//             $("#room-name").text(resp.name + " - " + sender);
//         }).fail(err => {
//             console.log("getRoomInfo error", err);            
//         }); 
//     }
    
   /* sendMessage : 서버에 메시지 전송 */ 
    const sendMessage = () => {
    	  const message = $("#message").val();
        mqttClient.publish(mqtt_topic, JSON.stringify({
        												type:'TALK', 
//         												roomId : roomId, 
        												sender : , 
        												message:message}));
        $("#message").val("");
    };
    

	/* message_list  4  */
  const recvMessage = recv =>  {
    	  console.log(recv);
    	  // 리시브 = ㅅ리시브 아이디 같으면 내가 
    	  // 리시브 != 리시브 센더로 
    	  // 받아온 사람이 로그인 사용자랑 같으면내쪽에 뜨고 아니면 상대편 
    	  // 센더 리시브 특정지어서 받게끔 처리하기 
    	  
        $("#message_list").prepend('<li class="list-group-item" >[' + recv.sender + '] - ' + recv.message + '</li>');  // 5
    }

 

  
  
  

</script>
<meta charset="UTF-8">
<title>chat</title>
</head>
<body>

	<div class="container" id="app">
		<div>
			<h2 id="room-name"></h2>
		</div>
		<div class="input-group">
			<div class="input-group-prepend">
				<label class="input-group-text">내용</label>
			</div>
			<input type="text" class="form-control" name="message" id="message">
			<div class="input-group-append">
				<button class="btn btn-primary" type="button"
					id="send_message_button">send</button>
				<!--                 <button class="btn btn-primary" type="button" id="leave_button">잠시나가기</button> -->
				<!--                 <button class="btn btn-primary disabled" type="button" id="reenter_button">다시입장</button> -->
			</div>
		</div>
		<!--         <div>잠시 나가기는 채팅방에서 수신되는 메시지를 받지 않고 채팅방에 참여한 모든 사람에 메시지는 보낼수 있다</div> -->
		<ul class="list-group" id="message_list"
			style="border: 2px solid red;">

		</ul>
	</div>


</body>
</html>


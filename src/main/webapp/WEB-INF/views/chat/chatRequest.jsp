<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/mqtt/mqtt.min.js"></script>

<meta charset="UTF-8">
<title>chat</title>
</head>
<body>
	<section>
		<div>
			<div>
			    <p class="sender-group" id="sender_list"></p>
			    님이 채팅을 요청했어요
			    <span>${receiver}</span>
			    <span>${sender}</span>
			</div>
			<button id="acceptButton">수락</button>
			<button id="rejectButton">거절</button>
		</div>
	</section>
<script type="text/javascript">

$(document).ready(() => {
    const receiver = "${board.nickname}";
    const sender = "${sender.nickname}";
    alert(sender + " " + receiver);
});


$("#acceptButton").on("click", e => {
	
	// 로컬스토리지에 센더와 룸아이디를 세팅한.
	
	
	// 채팅방으로 로컬스토리지 내용이간다 
		
	//채팅방이 생성된다
	createRoom();
	
	
});

	//방을 개설한다 
	const createRoom = () => {

		
	 const param = {
			 	bnum : bnum,
		      	roomId : roomId
     };
	 
	 
	$.ajax({ 
       		type: "POST",
       		url: '<c:url value="/chat/room"/>',
       		data: param, 
       		dataType: "json" 
       	}).done(resp => {
           alert(resp.bnum+"/"+resp.roomId+ "")
           $("#bnum").val("");
           $("#roomId").val("");

           
           roomListOutput();
       	
       	}).fail(err => {
       		alert("채팅방 개설에 실패하였습니다.");
       	
       	}); 
    };
    	
    //채팅방에 입장 처리하는 함수 
    const enterRoom = roomId => {
    const sender = ${board.nickname}
    
    
    alert(sender);
//     	if (sender == '') {
//         	alert("대화명은 필수 입력입니다");
//         	return false;
//         }
        //입장하는 사람의 이름과 채팅방이름을 지역저장소에 저장한다
        //이렇게 저장하면 다른 페이지에서 해당 키를 이용하여 값을 읽을 수 있다
        localStorage.setItem('chat.sender', sender);
        localStorage.setItem('chat.roomId', roomId);
        location.href = '<c:url value="/chat/room/enter/"/>' + roomId;
    	}	    

</script>
</body>
</html>


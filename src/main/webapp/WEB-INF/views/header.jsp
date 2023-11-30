<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()"> <!-- 인증이 됐는지안됐는지 확인하는 구문 -->
   <sec:authentication property="principal" var="principal"/> <!-- property로 가져와서 var 데이터타입으로 대입하겠다는뜻 -->
</sec:authorize>

<html class="no-js">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="Chrome">
	<title>dondog-header</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content="" />
	<meta property="og:image" content="" />
	<meta property="og:url" content="" />
	<meta property="og:site_name" content="" />
	<meta property="og:description" content="" />
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

   <!-- Animate.css -->
   <link rel="stylesheet" href="<c:url value='/resources/css/animate.css'/>">

   <!-- Icomoon Icon Fonts-->
   <link rel="stylesheet" href="<c:url value='/resources/css/icomoon.css'/>">

   <!-- Simple Line Icons -->
   <link rel="stylesheet" href="<c:url value='/resources/css/simple-line-icons.css'/>">

   <!-- Bootstrap  -->
   <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">

   <!-- Style -->
    <link rel="stylesheet" href="<c:url value='/resources/css/header.css'/>"> 
<%-- 	<link rel="stylesheet" href="<c:url value='/resources/css/modal.css'/>"> --%>

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
.modal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border: 1px solid #ccc;
            padding: 20px;
            background-color: #fff;
            z-index: 1;
            width: 800px;
            height: 300px;
            border-radius: 10px;
        }
        
        .modal button{
            background-color: transparent;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 16px;
            transition: 0.3s;
            text-decoration: none;
            font-size: 20px;
        }

        .modal button:hover {
            font-weight: bold;
/*             color: red; */
        }


        /* 탭 선택 버튼  */
        .button-style button {
            width: 350px;
        }

        .button-style button:last-child {
            width: 20px; float: right; display: flex;
        }

        /* 활동알림 content */
        .req_content{
            margin: 0;
        }

        .resultContainer {
            margin: 0;
            float: left;
            width: 100%;
            /* border: 2px solid orange; */
            margin-right: 10px;
            padding: 0;
        }

		 #resultPush { 
			border: 2px solid orange;
			color: black;
	        font-size: 18px;
		 	width:90%;
		 	height: 100%;
		 }

        .req_content button:hover{
            color: red;
        }

</style>

<body>
   <header role="banner" id="fh5co-header">
        <header role="banner" id="fh5co-header">
            <div class="container">
                <div class="row">
                    <nav class="navbar navbar-default navbar-fixed-top">
                        <div class="navbar-btn">
                            <ul class="navbar-right-btn">
                                <li class="navbar-right-li">
                                   <button onclick="location.href='<c:url value="/chat/roomList"/>' ">
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
                          <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse"
                              data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
                          <a class="navbar-brand" href="<c:url value='/'/>" style="font-weight: 700; font-size: 24px;" > dondog </a> 
                        </div>

                        <!-- PC Toggle  -->
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="#" id="headerGoHome">home</a></li>
                                <li><a href="#" id="headerGoBoard">match</a></li>
                                <li><a href="#" id="headerGoGps">gps</a></li>
                                <li><a href="#" id="headerGoProfile">profile</a></li>
                                <li><a href="#" id="headerGoOur">our</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            
            <!-- 알림 모달 -->
		<div id="myModal" class="modal">
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
<!-- 					<p id="chat_req_comm"></p> -->
<!-- 					<button id="btn_success">✔</button> -->
<!-- 					<button id="btn_cancel">✘</button> -->
				</div>
			</div>

			<!-- 키워드알림 탭 내용 -->
			<div id="keywordTab" class="tab">
				<!-- 키워드알림 내용 -->
				키워드알림 내용이 여기에 들어갑니다.
			</div>
		</div>
	</header>
            
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
    
<script type="text/javascript">
/* ************************************************* */
/* location   */
	$("#headerGoHome").on("click", () => {
		location.href = "<c:url value='/'/>";
	});
	$("#headerGoBoard").on("click", () => {
     	location.href = "<c:url value='/board/list'/>";
	});
	$("#headerGoGps").on("click", () => {
    	location.href = "<c:url value='/gps/walk'/>";
	});
	
	
	

//             	$("#headerGoProfile").on("click", () => {
//             		location.href = "<c:url value='/board/list'/>";
//             	});
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
    		
    		resultPush.append("<li>"+ sender +"님이 채팅을 요청했습니다." + req_send_time 
    								+"<button id='btn_success" + req_id + "'>✔</button>"
    							    +"<button id='btn_cancel" + req_id + "'>✘</button></li>"); 
    		
    		// ✔ 버튼
    	    $("#btn_success" + req_id).on("click", function () {
    	    	$("btn_success").empty();
    	   		alert("btn_success");
    	   		updateRequestStatus(req_id, sender);
    	    }); // btn success 
      } //for
    }); //requestList .ajax  
    	    	
    function updateRequestStatus(req_id, sender) {
        alert("updateRequestStatus 진입0");
  
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
	    			alert(result.result);
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
	    		alert(result.message);
	    		
	    		const room_id = result.room_id;
	    		
	    		localStorage.setItem('chat.sender', sender);
	        	localStorage.setItem('chat.receiver', receiver);
	        	localStorage.setItem('chat.room_id', room_id);
				
// 	        	openChatRoomList();
	        	
	    		location.href="<c:url value='/chat/room/'/>"+room_id;
	    	});
    		
    		
		
//     	}); //ajax 
    	
    }; //createChatroom
    
    
    /*
    function openChatRoomList() {
    	
    	
    	const roomInfo = {
    			sender: receiver,
    			receiver : receiver
    	}
    	
    	$.ajax({
			type: "POST", 
			url: "<c:url value='/chat/roomList'/>",
		       contentType: "application/json; charset=UTF-8",
		       dataType: "JSON",
		       data: JSON.stringify(roomInfo)
// 		       success: function (result) {
// //                 // 성공적으로 처리된 경우
// 				location.href="<c:url value='/chat/roomList'/>"	
// 		    } // ajax result 
	    }); //ajax 
    	
    }
    */
    
    
//     	$.ajax({
//     		alert("ajax 진입");
//     		type: "POST", 
//             url: "<c:url value='/chat/updateRequestStatus'/>",
//             contentType: "application/json; charset=UTF-8",
//             dataType: "JSON",
//             data: JSON.stringify(chatRoomData),
//             success: function (result.staus) {
//                 // 성공적으로 처리된 경우
//                 alert("변경됨!");
// //					createRoom();
//             } // ajax result 
// 	    }); //ajax 
    	
	    	    
// 	    
	    	    	

// 					$.ajax({
// 	    	    		type: "POST",
// 	    	            url: "<c:url value='/chat/createChatRoom'/>",
// 	    	            contentType: "application/json; charset=UTF-8",
// 	    	            dataType: "JSON",
// 	    	            data: JSON.stringify(data),
// 			            success: function (result.status) {
// 			            	const room_id = "${result.getRoom_id()}";
// 			            	const receiver = "${result.receiver}";
// 			            	const sender = "${result.sender}";
			            	
// 			            	const roomInfo = {
// 			            			room_id : room_id,
// 			            			receiver : receiver,
// 			            			sender : sender
// 			            	}
// 			            	alert(result.message);
// 	            		} // ajax result 
// 	    			}); //ajax 
// 	    	    }
	    	    

    	    
//     	    function createChatRoom(room_id) {
				
//     	    	const chatRoomData ={ room_id: room_id};
    	    	
//     	    	$.ajax({
//     	    		type: "POST",
//     	            url: "<c:url value='/chat/createChatRoom'/>",
//     	            contentType: "application/json; charset=UTF-8",
//     	            dataType: "JSON",
//     	            data: JSON.stringify(chatRoomData),
// 		            success: function (result) {
// 		                // 성공적으로 처리된 경우
// 		                alert(result.message);
// 		                alert("채팅방: "+room_id);
		                
		                
// // 						location.href='<c:url value="/chat/createChatRoom"/>'+roomId;
// 		            } // ajax result 
//     	    	}); //ajax 
    	    	
// 			} //createChatRoom end
    	    

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

    

	    
</script>
</body>
</html>
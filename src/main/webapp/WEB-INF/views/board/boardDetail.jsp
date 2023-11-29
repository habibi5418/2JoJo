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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="<c:url value='/resources/css/style1.css' />">
<body>
	
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog detailModal" role="document">
	    <div class="modal-content detailModalContent">
	      <div style="height: 14px;"></div>
	      <div class="modal-body detailModalScroll">
	        <div id="detailModalDogInfo">
       			<img id="detailModalDogImg"><br/>
	        	<h2 id="detailModalDogDname"></h2>
	        	<div id="detailModalDiv1">
		        	<ul id="detailModalUl">
		        		<li class="detailModalLi">
		        			<h3>견종</h3>
		        			<p id="detailModalDogDtype"></p>
		        		</li>
		        		<li class="detailModalLi">
		        			<h3>나이</h3>
		        			<p id="detailModalDogAge"></p>
		        		</li>
		        		<li class="detailModalLi">
		        			<h3>성별</h3>
		        			<p id="detailModalDogGender"></p>
		        		</li>
		        		<li class="detailModalLi">
		        			<h3>체중</h3>
		        			<p id="detailModalDogWeight"></p>
		        		</li>
		        	</ul>
	        	</div>
	        	<h3>About</h3>
	        	<p id="detailModalDogAbout"></p>
        	</div>
	      </div>
	      <div id="detailModalFooter" class="modal-footer">
	        <button type="button" id="detailModalCancelBtn" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>

	<%@ include file="../header.jsp" %>
	
	<div id="container">
		<div id="detailContainer">
			<button type="button" id="updateFormBtn" class="btn-warning">수정</button>
			<button type="button" id="deletBtn" class="btn-danger">삭제</button>
			<button type="button" id="backBtn" class="btn-secondary">뒤로</button>
			<div id="detailImgDiv">
				<c:set var="existImg" value="true" />
				<c:choose>
					<c:when test="${board.boardImgList.size() == 0 }">
						<c:set var="existImg" value="false" />
   						<img src="<c:url value='/resources/images/board/이미지없음.png'/>" class='detailImg0'><br/>
					</c:when>
					<c:when test="${board.boardImgList.size() == 1 }">
						<c:forEach var="boardImg" items="${board.boardImgList }" varStatus="cnt">
			   				<img src="<c:url value='/boardImg/download?inum=${boardImg.inum }'/>" id="detailImg1" class='detailImg1 pic'><br/>
			   			</c:forEach>
					</c:when>
					<c:when test="${board.boardImgList.size() == 2 }">
						<c:forEach var="boardImg" items="${board.boardImgList }" varStatus="cnt">
			   				<img src="<c:url value='/boardImg/download?inum=${boardImg.inum }'/>" id="detailImg${cnt.index + 1 }" class='detailImg2_${cnt.index + 1 } pic'><br/>
			   			</c:forEach>
					</c:when>
					<c:when test="${board.boardImgList.size() <= 3 }">
						<c:forEach var="boardImg" items="${board.boardImgList }" varStatus="cnt">
			   				<img src="<c:url value='/boardImg/download?inum=${boardImg.inum }'/>" id="detailImg${cnt.index + 1 }" class='detailImg3_${cnt.index + 1 } pic'><br/>
			   			</c:forEach>
					</c:when>
				</c:choose>
   			</div>
			<div id="boardTitleDiv">
	   			<p id="boardLocP">
			        <img src="<c:url value='/resources/images/board/loc2.png'/>" class='loc2Img'>
	   				${board.loc2}
				</p>
   				<div>
					<span id="boardTitleSpan">${board.title }</span>
					<span id="boardDateSpan">${board.regDate }</span>
				</div>
	            <label id="heartLabel" for="checkHeart">
	            	<c:if test="${heartStatus}">
	            		<input id="checkHeart" type="checkbox" checked="checked">
	            	</c:if>
	            	<c:if test="${!heartStatus}">
	            		<input id="checkHeart" type="checkbox">
	            	</c:if>
	            </label>
			</div>
			<div id="boardDogWrapper">
				<div id="boardDogDiv">
					<ul id="boardDogUl">
					<c:forEach var="boardDogInfo" items="${boardDogInfoList }">
						<a href="#myModal1" data-toggle="modal" onclick="setModal('${boardDogInfo.dnum}', '${boardDogInfo.dname}', '${boardDogInfo.dtype}', '${boardDogInfo.age}', '${boardDogInfo.gender}', '${boardDogInfo.weight}', '${boardDogInfo.matter}')">
							<li class="boardDogLi">
								<img src="<c:url value='/dogProfile/download?dnum=${boardDogInfo.dnum }'/>" class='detailDogImg'><br>
								<p>${boardDogInfo.dname }</p>
							</li>
						</a>
					</c:forEach>
					</ul>
				</div>
			</div>
			<div id="boardContentsDiv">
				<p>
					${board.contents }
				</p>
			</div>
			<div id="detailFooter">
				<div id="detailMemberProfile">
					회원 프사 자리
				</div>
				<div id="detailFooterRight">
					꼬숩도<br>
					<div id="btn_chatting">
						<c:if test="${member.email!= board.email}">
							<c:if test="${request.size() != 0}">
								<button type="button" id="goChatX" class="detailDisabledBtn" disabled="disabled">요청보냄</button>							
							</c:if>
							<c:if test="${request.size() == 0}">
								<button type="button" id="goChat" class="detailEnabledBtn goChatBtn">채팅요청</button>
							</c:if>
						</c:if>
						<c:if test="${member.email== board.email}">
							<c:if test= "${response.size() != null}">
								<button type="button" id="goChatList" class="detailEnabledBtn">채팅목록</button>
							</c:if>
							<c:if test= "${response.size() == null}">
								<button type="button" id="goChatListX" class="detailDisabledBtn" disabled="disabled">채팅목록(0)</button>
							</c:if>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
    
	<div id="lightbox1" class="lightbox">
		<img src="" alt="" id="lightboxImage1">
	</div>
    
	<div id="lightbox2" class="lightbox">
		<img src="" alt="" id="lightboxImage2">
	</div>
    
	<div id="lightbox3" class="lightbox">
		<img src="" alt="" id="lightboxImage3">
	</div>
	
    <script>
    
	 	// 라이트박스
		if (${existImg}) {
			const pics = document.getElementsByClassName("pic");

			document.getElementById("lightboxImage1").setAttribute("src", pics[0].getAttribute("src")); 
			document.getElementById("detailImg1").addEventListener("click", function() {
				document.getElementById("lightbox1").style.display = "block"; 
			});
			document.getElementById("lightbox1").addEventListener("click", function() {  //click 이벤트가 발생했을 때 실행할 함수 선언
				this.style.display = "none";  // lightbox 요소를 화면에서 감춤
			});
			
			if (pics.length >= 2) {
				document.getElementById("lightboxImage2").setAttribute("src", pics[1].getAttribute("src")); 
				document.getElementById("detailImg2").addEventListener("click", function() {
					document.getElementById("lightbox2").style.display = "block"; 
				});
				document.getElementById("lightbox2").addEventListener("click", function() {  //click 이벤트가 발생했을 때 실행할 함수 선언
					this.style.display = "none";  // lightbox 요소를 화면에서 감춤
				});
				
				if (pics.length >= 3) {
					document.getElementById("lightboxImage3").setAttribute("src", pics[2].getAttribute("src")); 
					document.getElementById("detailImg3").addEventListener("click", function() {
						document.getElementById("lightbox3").style.display = "block"; 
					});
					document.getElementById("lightbox3").addEventListener("click", function() {  //click 이벤트가 발생했을 때 실행할 함수 선언
						this.style.display = "none";  // lightbox 요소를 화면에서 감춤
					});
				}
			}
		}
	
	    $("#backBtn").on("click", () =>{
			location.href = "<c:url value='/board/list'/>";
		});
	    
	    function updateHeart(param, url) {
	    	fetch(url, {
				method: "POST",
				headers: {
				    "Content-Type": "application/json; charset=UTF-8",
				},
				body: JSON.stringify(param),
			});
	    }
	    
	    $("#checkHeart").on("click", () => {
	    	// 눌린 이후 상태임
	    	const heart = $("#checkHeart").is(":checked");
    		const param = {
    			bnum: ${board.bnum},
    			email: "${member.email}"
    		}
    		
	    	if (heart) {
	    		updateHeart(param, "<c:url value='/board/addHeart'/>");
	    	} else {
	    		updateHeart(param, "<c:url value='/board/deleteHeart'/>");
	    	}
	    });
	    
	    $("#chatFormBtn").on("click", () =>{
			location.href = "<c:url value='/chat/roomList?bnum=" + ${board.bnum} + "'/>";
		});
    	
	    function setModal(dnum, dname, dtype, age, gender, weight, matter) {
	    	$("#detailModalDogImg").remove();
	    	
	    	const imgPath = "<c:url value='/dogProfile/download?dnum=" + dnum + "'/>";
       		$("#detailModalDogInfo").prepend(
				"<img src='" + imgPath + "' id='detailModalDogImg' class='detailModalDogImg'>"
       		); 
			
       		$("#detailModalDogDname").text(dname);
       		$("#detailModalDogDtype").text(dtype);
       		$("#detailModalDogAge").text(age + "살");
       		$("#detailModalDogGender").text(gender);
       		$("#detailModalDogWeight").text(weight);
       		$("#detailModalDogAbout").html(matter);
	    }
	    
		$("#goChat").on("click", function () {
	    	
	    	const receiver = "${board.email}";
	    	const sender = "${member.email}";
	    	const bnum = "${board.bnum}";
	    	
	    	$.ajax({ 
	       		type: "POST",
	       		url: "<c:url value='/chat/senderRequest'/>",
	       		contentType : "application/json; charset=UTF-8",
	       		dataType: "JSON", // 요청을 서버로 해서 응답이 왔을 때 기본적으로 모든 것이 문자열 (생긴게 json이라면) => javascript오브젝트로 변경
	       		data : JSON.stringify({
	       			sender : sender, 
		        	receiver : receiver,
		        	bnum : bnum
	       		})	
	    	}).done(resp => {
				$("#goChat").attr("disabled", true);
				
	        	localStorage.setItem('chat.sender', sender);
	        	localStorage.setItem('chat.receiver', receiver);
	        	localStorage.setItem('chat.bnum', bnum);

	        	console.log("console 확인용!!!!!!!!"+sender + "" + receiver);
	        	
	        	alert(resp.message);
	        });
		});
		
		$("#goChatList").on("click", function () {
	    	
// 	    	const receiver = "${board.email}";
// 	    	const sender = "${member.email}";
// 	    	const bnum = "${board.bnum}";
	    	
// 	    	$.ajax({ 
// 	       		type: "POST",
// 	       		url: "<c:url value='/chat/senderRequest'/>",
// 	       		contentType : "application/json; charset=UTF-8",
// 	       		dataType: "JSON", // 요청을 서버로 해서 응답이 왔을 때 기본적으로 모든 것이 문자열 (생긴게 json이라면) => javascript오브젝트로 변경
// 	       		data : JSON.stringify({
// 	       			sender : sender, 
// 		        	receiver : receiver,
// 		        	bnum : bnum
// 	       		})	
// 	    	}).done(resp => {
// 				$("#goChat").attr("disabled", true);
				
// 	        	localStorage.setItem('chat.sender', sender);
// 	        	localStorage.setItem('chat.receiver', receiver);
// 	        	localStorage.setItem('chat.bnum', bnum);

// 	        	console.log("console 확인용!!!!!!!!"+sender + "" + receiver);
	        	
// 	        	alert(resp.message);
// 	        });
		});
		
    </script>
    
</body>
</html>
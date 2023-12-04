<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<sec:authorize access="isAuthenticated()"> <!-- 인증이 됐는지안됐는지 확인하는 구문 -->
   <sec:authentication property="principal" var="principal"/> <!-- property로 가져와서 var 데이터타입으로 대입하겠다는뜻 -->
</sec:authorize>

<html>
<head>
<meta charset="UTF-8">
<title>my profile</title>

<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<link rel="stylesheet" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css"/>
<%-- <link rel="stylesheet" href="<c:url value='/resources/css/profile/myProfileReset.css'/>"> --%>
<link rel="stylesheet" href="<c:url value='/resources/css/profile/myProfile.css'/>">
<%-- <link rel="stylesheet" href="<c:url value='/resources/css/style1.css' />"> --%>

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
	
    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">프로필 편집</h4>
	      </div>
	      <div class="modal-body">
			<form id="profileForm" autocomplete="off" enctype="multipart/form-data">
				<fieldset>
					<input type="hidden" name="email" value="${loggedInMember.email }" />
					<label for="nickname">닉네임</label>
					<input type="text" name="nickname" id="nickname" class="form-control" required>
					<label for="pwd">비밀번호</label>
					<input type="password" name="pwd" id="pwd" class="form-control" required>
					<label for="pwd">소개글</label>
					<input type="text" name="comments" id="comments" class="form-control" required>
				</fieldset>
				<label>프로필 사진 선택</label>
				<div id="m_file">
					<div class='filebox'>
	       				<label for='file1'>파일찾기</label>
		       			<input type='file' id='file1' class='file btn btn-success' name='file' />
		       			<input id='upload-name1' class='upload-name' value='이미지파일' readonly>
	       			</div>
				</div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button id="saveProfileBtn" type="button" class="">저장</button>
	        <button type="button" class="writeCancelBtn" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">반려견 추가</h4>
	      </div>
	      <div class="modal-body">
			<form id="newDogAddForm" autocomplete="off" enctype="multipart/form-data">
				<fieldset>
					<input type="hidden" name="email" value="${loggedInMember.email }" />
					<label for="addDname">이름</label>
					<input type="text" name="dname" id="addDname" class="form-control" required>
					<label for="addAge">나이</label>
					<input type="text" name="age" id="addAge" class="form-control" required>
					<label for="addDtype">견종</label>
					<input type="text" name="dtype" id="addDtype" class="form-control" required>
					<label for="addGender">성별</label>
					<input type="text" name="gender" id="addGender" class="form-control" required>
					<label for="addWeight">무게(kg)</label>
					<input type="text" name="weight" id="addWeight" class="form-control" required>
					<label for="addMatter">특이사항</label>
					<textarea name="matter" id="addMatter" class="form-control"></textarea>
				</fieldset>
				<label>프로필 사진 선택</label>
				<div id="d_file">
					<div class='filebox'>
	       				<label for='file'>파일찾기</label>
		       			<input type='file' id='file' class='file btn btn-success' name='file' />
		       			<input id='upload-name' class='upload-name' value='이미지파일' readonly>
	       			</div>
				</div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button id="saveNewDogBtn" type="button" class="">저장</button>
	        <button type="button" class="writeCancelBtn" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
	<div id="margin" style="height: 150px;"></div>
    <div id="app">
        <!--좌측의 사이드바 -->
<!--         <div class="sidebar-wrapper"> -->
<!--             <div class="sidebar"> -->
<!--                 <div class="sidebar-inner"> -->
<!--                     <div class="sidebar-menu"> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->


        <!-- 메인 컨텐츠 영역 -->
        <div class="page-wrapper">
            <!--상단 프로필 영역 -->
            <div class="page-container profile-page">
                <div class="profile-top">
                    <!--상단 프로필 영역 중 왼쪽 부분 -->
                    <div class="profile-top-left">
                    <!-- 사용자 사진 -->
                        <figure id="memberProfileFigure" class="thumbnail">
                            <!-- 등록안했을 시 기본 썸네일 -->
                        	<c:if test="${loggedInMember.sname == null}">
                        		<c:if test="${loggedInMember.gender.equals('1')}">
                            		<img alt="" src="<c:url value='/resources/images/profile/default_male.png'/>"/>
                            	</c:if>
                        		<c:if test="${loggedInMember.gender.equals('2')}">
                            		<img alt="" src="<c:url value='/resources/images/profile/default_female.png'/>"/>
                            	</c:if>
                            </c:if>
                        	<c:if test="${loggedInMember.sname != null}">
                            	<img src="<c:url value='/memberProfile/download?email=${loggedInMember.email }'/>" alt="" class="">
                            </c:if>
                        </figure>
    
    
                        <div class="profile-info">
                            <!-- 출력될 정보 -->
                            <div class="name">
                                <h2>
                                    <span id="memberNickname">${loggedInMember.nickname}</span>
                                </h2>
                            </div>
                            
                            <div class="info01">
                                <dl>
                                    <dt>write</dt>
                                    <dt>${boardCnt }</dt>
                                </dl>
                                
                                <dl>
                                    <dt>follow</dt>
                                    <dt>491</dt>
                                </dl>                            
                                <dl>
                                    <dt>follower</dt>
                                    <dt>22</dt>
                                </dl>                            
                            </div>
                            
                            <div class="info02">
                                <p id="commentsP">${loggedInMember.comments}</p>
                            </div>

                            <div class="btn-wrap">
                               <button type="button" class="dondog_btn" data-toggle="modal" data-target="#myModal1" style="margin-left: 10px;">프로필 편집</button>
                               <button type="button" id="goTownSetBtn" class="dondog_btn" style="background: #f5e5a7">동네 설정</button>
                               <!-- 이미 follow 중일시 언팔로우버튼+빨강 -->
                            </div>
                        </div>
                    </div>
                    
                    <!--상단 프로필 영역 중 오른쪽 부분 -->
                    <div class="profile-top-right">
                        <div class="profile-info">
                            <div class="info03">
                                <dl>
                                    <dt>성별</dt>
                                    <dd>
                                    	<c:if test="${loggedInMember.gender.equals('1')}">남</c:if>
                                    	<c:if test="${loggedInMember.gender.equals('2')}">여</c:if>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>나이</dt>
                                    <c:set var="today" value="<%=new java.util.Date()%>" />
									<c:set var="year"><fmt:formatDate value="${today}" pattern="yy" /></c:set>
                                    <dd>
                                    	<c:if test="${Integer.parseInt(loggedInMember.birth.substring(0, 2)) >= Integer.parseInt(year)}">
                                    		${(Integer.parseInt(year) + 100) - Integer.parseInt(loggedInMember.birth.substring(0, 2))}
                                    	</c:if>
                                    	<c:if test="${Integer.parseInt(loggedInMember.birth.substring(0, 2)) < Integer.parseInt(year)}">
                                    		${Integer.parseInt(year) - Integer.parseInt(loggedInMember.birth.substring(0, 2))}
                                    	</c:if>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>강아지</dt>
                                     <dd>${dogList.size()}</dd>
                                </dl>
                                <dl>
                                    <dt>동네</dt>
                                    <dd>${loggedInMember.address}</dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 프로필 영역 아래 부분 -->
                <div class="profile-bottom">
                    <div class="btn-wrap">
                        <button type="button" id="collectionBtn" class="dondog_btn" data-toggle="modal" data-target="#myModal2">반려견 추가</button>
                        <span style="display: none;"><input id="boardFile" type="file" name="file"></span>
                    </div>
                    
                    <!--게시물 목록 영역 -->
                    <div class="grid-wrapper">
                            <div id="myDogDiv" class="grid">
                                <div class="grid-header">
                                    <p>우리강아지</p>
                                </div>
                                <!-- 각 이미지 카드를 클릭시 해당 게시글 혹은 정보로 연결 -->
                                <c:if test="${dogList.size() != 0 }">
	                                <c:forEach var="dog" items="${dogList }">
	                                	<a href="#myModal3" data-toggle="modal" onclick="setModal('${dog.dnum}', '${dog.dname}', '${dog.dtype}', '${dog.age}', '${dog.gender}', '${dog.weight}', '${dog.matter}')">	
			                                <figure class="feed-item-card" onclick="">
			                                    <img src="<c:url value='/dogProfile/download?dnum=${dog.dnum }'/>" alt="" class="thumbnail-img mypageDogImg">
			                                </figure>
		                                </a>
	                                </c:forEach>
                                </c:if>
                            </div>

                            
                            <div class="grid-header">
                                <p>함께한 순간 ; 지도 가져오기</p>
                            </div>

							<div id="walkMapContainer">
                                <div id="mypageWalkMap"></div>
								
								<div id="townContainer">
									<div id="searchMypageDiv">
										<div id="townBtnDiv">
											<button type="button" id="openCal" style="color:white;">산책 목록</button>
										</div>
										<div id="walkList"></div>
									</div>
								</div>
							</div>
                          
                            <div class="grid-header">
                                <p>작성한 게시글</p>
                            </div>

                            <c:forEach var="board" items="${boardList }">
                                <figure class="feed-item-card2" onclick="goBoardDetail(${board.bnum})">
									<p> ${board.title} </p>
									<p id="card2-nick" style="font-size: 14px;">${board.nickname} 
									${board.regDate}
									</p>  
								</figure>
	                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    
    
<!--         <div id="feed-modal" class="modal-wrapper"></div> -->
<!--         <div id="feed-ctrl-modal" class="modal-wrapper"> -->
<!--             <div class="modal-overlay" onclick="closeModal('feed-ctrl-modal')"></div> -->
    
<!--             <div class="common-modal ctrl-modal"> -->
<!--                 <button type="button" class="btn red-txt bold-txt">삭제</button> -->
<!--                 <button type="button" class="btn">수정</button> -->
<!--                 <button type="button" class="btn" onclick="closeModal('feed-ctrl-modal')">취소</button> -->
<!--             </div> -->
<!--         </div> -->
    </div>
    
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9gy0xhxny4&submodules=geocoder"></script>
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
	<script type="text/javascript">
	
		// 동네 설정 페이지 이동
		$("#goTownSetBtn").on("click", () => {
			location.href = "<c:url value='/gps/townSet'/>";
		});
		
		// 강아지 모달 세팅
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

		// 프로필 이미지 이름 가져오기
		$("#file1").on('change', function(file) {	
			const fileName = file.target.files[0].name;
			const extension = fileName.split(".")[1];
			
			if (extension === "jpg" || extension === "jpeg" || extension === "png") {
				$("#upload-name1").val(fileName);
			} else {
				alert("이미지 파일(jpg, jpeg, png)만 업로드 가능합니다.");
			}
		});
		
		// 강아지 이미지 이름 가져오기
		$("#file").on('change', function(file) {	
			const fileName = file.target.files[0].name;
			const extension = fileName.split(".")[1];
			
			if (extension === "jpg" || extension === "jpeg" || extension === "png") {
				$("#upload-name").val(fileName);
			} else {
				alert("이미지 파일(jpg, jpeg, png)만 업로드 가능합니다.");
			}
		});

		// 프로필 저장
		$("#saveProfileBtn").on("click", () => {
			const form = $("#profileForm")[0];
			const formData = new FormData(form);
			
			fetch("<c:url value='/profile/update'/>", {
				method: "POST",
				headers: {},
				body: formData,
			})
			.then((response) => response.json())
			.then((json) => {
				alert(json.message);
				if (json.status) {
					const memberProfileFigure = $("#memberProfileFigure");
					const memberNickname = $("#memberNickname");
					const commentsP = $("#commentsP");
					const path = "<c:url value='/memberProfile/download?email=${loggedInMember.email }'/>";
					
					memberProfileFigure.empty();
					memberProfileFigure.append('<img src="' + path + '" alt="new" class="">');
					memberNickname.text(json.newNickname);
					commentsP.text(json.newComments);
                    	
					$("#myModal1").modal("hide");
				}
			});
		});

		// 강아지 추가 저장
		$("#saveNewDogBtn").on("click", () => {
			const form = $("#newDogAddForm")[0];
			const formData = new FormData(form);
			
			fetch("<c:url value='/dog/add'/>", {
				method: "POST",
				headers: {},
				body: formData,
			})
			.then((response) => response.json())
			.then((json) => {
				alert(json.message);
				if (json.status) {
					reloadCurrentDog();
					$("#myModal2").modal("hide");
				}
			});
		});
		
		// 추가한 강아지 현황에 추가
		function reloadCurrentDog() {
			fetch("<c:url value='/board/reloadDog?email=${loggedInMember.email}'/>", {
				method: "POST",
				headers: {
				    "Content-Type": "application/json; charset=UTF-8",
				},
				body: JSON.stringify(),
			})
			.then((response) => response.json())
			.then((json) => {
				const myDogDiv = $("#myDogDiv");
				const reloadDogList = json.reloadDogList;
				const file = reloadDogList[0];
				const path = "<c:url value='/dogProfile/download?dnum='/>" + file.dnum;
				const func = "setModal('" + file.dnum + "', '" + file.dname + "', '" + file.dtype + "', '" + file.age + "', '" + file.gender + "', '" + file.weight + "', '" + file.matter + "')";
				
				myDogDiv.append(
					'<a href="#myModal3" data-toggle="modal" onclick="' + func + '">'
                    + '<figure class="feed-item-card" onclick="">'
                    + '<img src="' + path + '" alt="" class="thumbnail-img mypageDogImg">'
                    + '</figure>'
				);
			});
		}
		
		function goBoardDetail(bnum) {
			location.href = "<c:url value='/board/detail?bnum=" + bnum + "'/>";
		}

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
		var map = new naver.maps.Map('mypageWalkMap', mapOptions);
		
		// gps
		var currentLat;
		var currentLng;
		var myImgPath;
		if (${dogList.size() != 0}) {
			myImgPath = "<c:url value='/dogProfile/download?dnum=${dogList[0].dnum }'/>";
		} else {
			myImgPath = "<c:url value='/resources/images/main/11kong.jpg'/>";
		}
		
		
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

		var selectDate = "";
		var wnum;
		var senderEmail = "${loggedInMember.email}";
		
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
		
	</script>

</body>
</html>
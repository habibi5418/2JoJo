<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<sec:authorize access="isAuthenticated()"> <!-- 인증이 됐는지안됐는지 확인하는 구문 -->
   <sec:authentication property="principal" var="principal"/> <!-- property로 가져와서 var 데이터타입으로 대입하겠다는뜻 -->
</sec:authorize>


<!-- <link rel="stylesheet" as="style""/> -->
<html>
<head>
<meta charset="UTF-8">
<title>my profile</title>

<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<link rel="stylesheet" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css"/>
<link rel="stylesheet" href="<c:url value='/resources/css/profile/myProfileReset.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/profile/myProfile.css'/>">

</head>
<body>
	<%@ include file="../header.jsp" %>
	<div id="margin" style="height: 150px;"></div>
    <div id="app">
        <!--좌측의 사이드바 -->
        <div class="sidebar-wrapper">
            <div class="sidebar">
                <div class="sidebar-inner">
                    <div class="sidebar-menu">
                    ㅎㅇ
                    </div>
                </div>
            </div>
        </div>


        <!-- 메인 컨텐츠 영역 -->
        <div class="page-wrapper">
            <!--상단 프로필 영역 -->
            <div class="page-container profile-page">
                <div class="profile-top">
                    <!--상단 프로필 영역 중 왼쪽 부분 -->
                    <div class="profile-top-left">
                    <!-- 사용자 사진 -->
                        <figure class="thumbnail">
                            <img alt="" src="<c:url value='/resources/images/profile/developer1.png'/>"/>
                            <!-- 등록안했을 시 기본 썸네일 -->
                            <img alt="" src=""/>
                        </figure>
    
    
                        <div class="profile-info">
                            <!-- 출력될 정보 -->
                            <div class="name">
                                <h2>
                                    <span>${loggedInMember.nickname}</span>
                                </h2>
                            </div>
                            
                            <div class="info01">
                                <dl>
                                    <dt>write</dt>
                                    <dt>${boardCnt }</dt>
                                </dl>
                                
<!--                                 <dl> -->
<!--                                     <dt>follow</dt> -->
<!--                                     <dt>491</dt> -->
<!--                                 </dl>                             -->
<!--                                 <dl> -->
<!--                                     <dt>follower</dt> -->
<!--                                     <dt>22</dt> -->
<!--                                 </dl>                             -->
                            </div>
                            
                            <div class="info02">
                                <p>아 누가 강아지 업냐</p>
                            </div>

                            <div class="btn-wrap">
                               <button type="button" class="btn solid-btn gray-btn" onclick="snsProfileModify()">프로필 편집</button>
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
                                    <dd>28</dd>
                                </dl>
                                <dl>
                                    <dt>강아지</dt>
                                     <dd>3</dd>
                                </dl>
                                <dl>
                                    <dt>동네</dt>
                                    <dd>혜화동</dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 프로필 영역 아래 부분 -->
                <div class="profile-bottom">
    <!--                 <div class="btn-wrap"> -->
    <!--                     <button type="button" id="collectionBtn" class="btn txt-btn blue-btn">+ 새 컬렉션</button> -->
    <!--                     <span style="display: none;"><input id="boardFile" type="file" name="file"></span> -->
    <!--                 </div> -->
                    <div class="btn-wrap">
                        <button type="button" id="collectionBtn" class="btn txt-btn blue-btn"> 새 컬렉션 </button>
                        <span style="display: none;"><input id="boardFile" type="file" name="file"></span>
                    </div>
                    
                    <!--게시물 목록 영역 -->
                    <div class="grid-wrapper">
                            <div class="grid">
                                <div class="grid-header">
                                    <p>우리강아지</p>
                                </div>
                                <!-- 각 이미지 카드를 클릭시 해당 게시글 혹은 정보로 연결 -->
                                <figure class="feed-item-card" onclick="">
                                    <img src="<c:url value='/resources/images/profile/dog1.jpeg'/>" alt="" class="thumbnail-img">
                                    
                                    <!-- 마우스 오버시 하트와 메시지 아이콘 표시 -->
<!--                                     <div class="overlay"> -->
<!--                                         <div class="overlay-content"> -->
<!--                                             <dl class="icon-heart-txt"> -->
<!--                                                 <dt> -->
<%--                                                     <img src="<c:url value='/resources/images/profile/임시.png'/>" alt="" class="icon"> --%>
<!--                                                 </dt> -->
<!--                                                 <dd>board.likeCount</dd> -->
<!--                                             </dl> -->
                                            
<!--                                             <dl class="icon-msg-txt"> -->
<!--                                                 <dt> -->
<%--                                                     <img src="<c:url value='/resources/images/profile/임시.png'/>" alt="" class="icon"> --%>
<!--                                                 </dt> -->
<!--                                                 <dd>board.commentCount</dd> -->
<!--                                             </dl> -->
<!--                                         </div> -->
<!--                                     </div> -->
                                </figure>

                                <figure class="feed-item-card" onclick="">
                                    <img src="<c:url value='/resources/images/profile/dog1.jpeg'/>"  alt="" class="thumbnail-img">
                                </figure>

                                <figure class="feed-item-card" onclick="">
                                    <img src="<c:url value='/resources/images/profile/dog1.jpeg'/>"  alt="" class="thumbnail-img">
                                </figure>
                            </div>

                            
                            <div class="grid-header">
                                <p>함께한 순간 ; 지도 가져오기</p>
                            </div>

                            <figure class="feed-item-card" onclick="">
                                <img src="<c:url value='/resources/images/profile/map.jpg'/>"  alt="" class="thumbnail-img">
                            </figure>
                          
                          
                            <div class="grid-header">
                                <p>작성한 게시글</p>
                            </div>

                            <figure class="feed-item-card" onclick="">
                                <img src="<c:url value='/resources/images/profile/board.jpeg'/>" alt="" class="thumbnail-img">
                            </figure>
                            
                            <figure class="feed-item-card" onclick="">
                                <img src="<c:url value='/resources/images/profile/board.jpeg'/>" alt="" class="thumbnail-img">
                            </figure>
                            
                            <figure class="feed-item-card" onclick="">
                                <img src="<c:url value='/resources/images/profile/board.jpeg'/>" alt="" class="thumbnail-img">
                            </figure>
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
<script>
//   $(function(){
//     $('#collectionBtn').on('click',function(){
//       $('#boardFile').trigger('click');
//     });
//     $('#boardFile').on('change',function(){
//       var file = this.files[0];

//       // FormData 객체 생성
//       var formData = new FormData();
//       formData.append("file", file);

//       $.ajax({
//         url: "/boards/upload",  // 원하는 엔드포인트로 수정
//         type: "POST",
//         data: formData,
//         contentType: false,
//         processData: false,
//         success: function(response) {
//           console.log("File uploaded successfully:", response);
//           location.reload();
//         },
//         error: function(error) {
//           console.error("Failed to upload the file:", error);
//         }
//       });
//     });
//   })

//     $('textarea[data-autoresize]').each(function () {
//         var offset = this.offsetHeight - this.clientHeight;

//         var resizeTextarea = function (el) {
//             $(el).css('height', 'auto').css('height', el.scrollHeight + offset);
//         };

//         $(this).on('keyup input', function () {
//             resizeTextarea(this);
//         }).removeAttr('data-autoresize');
//     })

//     // <!-- 특정 클래스(toggle-icon-btn)를 가진 요소를 클릭할 때, 해당 요소의 활성/비활성 상태를 전환함. active 클래스를 토글하여 아이콘의 모양이 변경될 수 있음. -->
//     $('.toggle-icon-btn').on('click', function () {
//         $(this).toggleClass('active');
//     })
//     // <!--댓글의 답글을 펼치고 접기,  -->
//     $('.toggle-recomment-btn').each(function () {
//         if ($(this).parent().hasClass('open')) {
//             $(this).html('답글 모두 숨기기');
//         } else {
//             $(this).html('답글 보기(' + $(this).attr('data-count') + '개)');
//         }

//         $(this).on('click', function () {
//             $(this).parent().toggleClass('open');
//             if ($(this).parent().hasClass('open')) {
//                 $(this).html('답글 모두 숨기기');
//             } else {
//                 $(this).html('답글 보기(' + $(this).attr('data-count') + '개)');
//             }
//         })
//     })

//     function openBoardModal(id) {
//         $('#feed-modal').load("/sns/board/detail/" + id, () => {
//             $('#feed-modal').addClass('active');
//         });
//     }

//     function closeModal(id) {
//         $('#' + id).removeClass('active');
//     }
    
//     function snsProfileModify() {
//         // 프로필 편집 페이지로 리다이렉션
//         location.href = "/sns/profile/modify";
//     }
    

//     function requestFriend(id){
//       $.ajax({
//         url : '/friend/request/'+id,
//         method : 'POST',
//         success : function (data) {

//         }
//       })
//       $('#' + id).removeClass('active');
//     }

//     function fileChange(){

//       //$('#boardFile').
//     }
</script>
</body>
</html>
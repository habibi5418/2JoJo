<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dondog_login</title>
<style>

@media screen and (min-width: 769px) {
	.login{   
	margin : 20% auto 0 auto;
	width: 22%;
	}
}

@media screen and (max-width: 768px) {
	.login{
	margin : 20% auto 0 auto;
	width: 50%;
	}
}

@media screen and (max-width: 480px) {
	.login{
	font-size:10px;
	margin : 20% auto 0 auto;
	width: 75%;
	}
}

#loginForm {
width: 100%;
}

#loginForm input {
width: 100%;
}

#sign-up-box{
width: 100%;
}

/* 로그인, 회원가입 버튼 css
	버튼 부분 컬러 어울리는거 없어서 일단 브라운으로.. 이부분 추후 수정 */
.submit-button {
  background-color: rgb(101, 83, 69);
  border: none;
  color: white;
  width: 100%;
  height: 35px;
  font-size: 14pt;
  margin-top: 20px;
}

/* 로그인 입력칸 css */
.input-box {
  position: relative;
  margin: 10px 0;
}

/* 입력칸 css */
.input-box>input {
  background: transparent;
  border: none;
  border-bottom: solid 1px #000;
  padding: 20px 0px 5px 0px;
  font-size: 14pt;
}

/* 왼쪽 상단위 email, pwd  */
label {
  color: #000;
  font-size: 9pt;
  top: 5px;
  position: absolute;
  left: 0;
  transition: all 0.2s ease;
}

input:focus+label,
input:not(:placeholder-shown)+label {
  color: #000;
  font-size: 10pt;
  top: 0;
  transition: all 0.2s ease;
}

input:focus,
input:not(:placeholder-shown) {
  outline: none;
}

#username + label {
  top: -10px; 
}

#password + label {
  top: -10px; 
}

/* id찾기  */
#forgot {
  margin-bottom: 5%;
  position: relative;
}

#forgot a {
  position: absolute;
  right: 0;
  font-size: 9px;
  color: black;
  text-decoration: none; /* Remove underline from hyperlinks */
}

#forgot a:first-child {
/*  margin-left: 35%; */
 margin-right: 95px;
}

#forgot a:hover {
  text-decoration: underline; /* Add underline on hover for better user experience */
}
  

/* sns 영역 */
.snslogin img {
/*   width: 5%; */
/*   height: 5%; */
/*   display: inline-block; */
/*   margin-right: 1px; /* Adjust the margin as needed for spacing between images */ */
}

.snslogin {
/*   font-size: 12px; */
  position: relative;
}


.snslogin img {
	width: 30px;
	height: 30px;
}

#kakaoImg {
	position: absolute;
	right: 70px;
}

#naverImg {
	position: absolute;
	right: 35px;
}

#googleImg {
	position: absolute;
	right: 0px;
}
#errorMessage{
font-size : 10px;
 color : red;
}

 </style>
    
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


	<header>
		<h3>Login</h3>
	</header>
	<%@ include file="../header.jsp" %>
	
 <div class="login">
	<div id="form_wrap">
		<form id="loginForm" action="/login" method="post">
			<div class="input-box">
				<input id="username" type="text" name="username" placeholder="">
				<label for="username">EMAIL</label>
			</div>

			<div class="input-box">
				<input id="password" type="password" name="password" placeholder="">
				<label for="password">PWD</label>
			</div>
			<input type="submit" value="LOGIN" class="submit-button">
		</form>
		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div id="forgot">
				<a href="<c:url value='/findUidForm'/>">FORGOT ID / </a>
				<a href="<c:url value='/findPwdForm'/>">FORGOT PASSWORD</a>
			</div>		
			<div id="errorMessage"></div>
	</div>
	
	<div class="snslogin">
	사용중이신 SNS 로 간편하게 로그인하세요!
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=c7759f219be1e858049e1cbce919f4fe&redirect_uri=https://www.dondog.site/auth/kakao/callback&response_type=code">
	<img id="kakaoImg" src="${pageContext.request.contextPath}/resources/img/kakao.png" /></a>
	<!-- 네이버 로그인 이미지  -->
	<img id="naverImg" src="${pageContext.request.contextPath}/resources/img/naver.png"/>
	<img id="googleImg" src="${pageContext.request.contextPath}/resources/img/google.png"/>
	<!-- 로그인만 있는거 -->
<%-- 	<img src="${pageContext.request.contextPath}/resources/img/naver_btn.png"/> --%>
	</div>	
	
	<div class="membership-benefits">
	</div>


	<div class="sign-up-box">
		<h3 style="margin-bottom: 0px;">Join</h3>
		<form action="insertTerms.do" name="form" method="post">
			<div class="sign-up-box.input-box">
				<input type="submit" value="JOINN US" class="submit-button">
			</div>
		</form>
	</div>
 </div>
</body>

<script>
// document.addEventListener('DOMContentLoaded', function() {
//     var urlParams = new URLSearchParams(window.location.search);
//     var exception = urlParams.get('exception');
//     if (error) {
//                 // 만약 error 파라미터가 존재하면 해당 메시지를 가져옵니다.
//                 errorMessage = decodeURIComponent(error);
//             }
//     console.log(urlParams);

//   /*   if (exception === 'error') {
//         alert("비밀번호가 틀렸습니다.");
//     } else if (exception === 'loginLock'){
//        alert("비밀번호가 틀렸습니다.");
//     } */
// });

        document.addEventListener('DOMContentLoaded', function() {
            var currentURL = window.location.href;
            var searchString = 'error';
            
            if (currentURL.includes(searchString)) {
                // Get the element where you want to display the message
                var messageElement = document.getElementById('errorMessage');
                // Set the error message text
                messageElement.innerText = '아이디 또는 비밀번호를 확인해주세요\n5번이상 오류시 계정이 비활성화됩니다(1/5) ';
            }
        });
</script>

</html>
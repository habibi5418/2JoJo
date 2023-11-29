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
	width: 20%;
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
	margin : 20% auto 0 auto;
	width: 80%;
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


   

    </style>
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



</html>
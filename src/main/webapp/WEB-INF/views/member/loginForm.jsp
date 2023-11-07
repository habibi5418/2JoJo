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
<%-- <link href="<c:url value='/css/loginstyles.css'/>" rel="stylesheet" /> --%>
</head>
<body>


	<header>
		<h3>Login</h3>
	</header>
	<div id="form_wrap">
		<form id="loginForm" method="post">
			<div class="input-box">
				<input id="username" type="text" name="username" placeholder="아이디">
				<label for="username">ID</label>
			</div>

			<div class="input-box">
				<input id="password" type="password" name="password" placeholder="비밀번호">
				<label for="password">PWD</label>
			</div>
			<div id="forgot">
				<a href="<c:url value='/findUidForm'/>">FORGOT ID / </a>
				<a href="<c:url value='/findPwdForm'/>">FORGOT PASSWORD</a>
			</div>
			<input type="submit" value="login">
		</form>
		</div>
		<a href="https://kauth.kakao.com/oauth/authorize?client_id=88702279be16f8493befbe0e0178ea8e&redirect_uri=http://localhost:8090/kakao_callback&response_type=code">
<img src="${pageContext.request.contextPath}/resources/img/kakao_login_medium_wide.png" /></a>
		
	<div class="membership-benefits">
		<h2>가입설명</h2>
	</div>


	<div class="sign-up-box">
		<h3 style="margin-bottom: 0px;">Join</h3>
		<form action="insertTerms.do" name="form" method="post">
			<div class="sign-up-box.input-box">
				<input type="submit" value="JOINN US">
			</div>
		</form>
	</div>
</body>


<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script type="text/javascript">

 document.querySelector("#loginForm").addEventListener("submit", e => {
		e.preventDefault();
		const email = document.querySelector("#username").value; // "username"으로 설정
		const pwd = document.querySelector("#password").value;
	    const param = {
		        email: email,
		        pwd: pwd
		};
		
	    fetch("<c:url value='/login'/>", {
	      method: "POST",
	      headers: {
	        "Content-Type": "application/json; charset=UTF-8",
	      },
	      body: JSON.stringify(param),
	    })
	    .then((response) => response.json())
	    .then((json) => {
	  	    alert(json.message);
	        if (json.status) {
	      	  location.href = '<c:url value="/"/>'; 
	        }
	    });
		
	});

 
 <!-- 카카오 로그인 -->


 </script>
 

</html>
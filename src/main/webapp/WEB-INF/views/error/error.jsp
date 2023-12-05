<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<sec:authorize access="isAuthenticated()"> <!-- 인증이 됐는지안됐는지 확인하는 구문 -->
   <sec:authentication property="principal" var="principal"/> <!-- property로 가져와서 var 데이터타입으로 대입하겠다는뜻 -->
</sec:authorize>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
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
<!-- 200 -->
   <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
	<!-- 700 -->
   <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;700&display=swap" rel="stylesheet">
  

</head>
<style>
.error {
	width: 100%;
    margin-top: 150px;
    margin-bottom: 20px;
    margin-left: 5%;
    font-size: 170px;
    font-weight:700;
      margin-left: 5%; 
color: #76614d;

}
button{ 
       font-family: 'Noto Serif KR', serif;
       font-weight: bold;
    margin-left: 5%;
    margin-top: -40%;
    font-size: 30px;
    height: 40px;
    width: 200px;
    border-radius: 10px;
    border: none !important;
    background: #a97f57 !important;
    color: #fef7da;
}
button:hover{
	background: #76614d;
}


</style>
<body style="background: #f5e5a7; margin: 0; text-align: center;">
	<div class="container" >     
		<div class="error"> ERROR </div>
		<div class="btn" style=" margin-bottom: -25%;">
			<button id="goHome" class="btn" onclick="location.href=' <c:url value='/' />';"> main. </button>
		
		</div>
		<div class="img">
			<img alt="" src="<c:url value='/resources/images/error/error.png'/>" style=" margin-left: -40%; margin-top: 20px;">	
		</div>
		<div class="footer" style="padding: 0; width: 2000px; background: #a88057; height: 300px; margin-left: -100px; margin-top: -10px; ">
		
		</div>
	</div>
</body>
<script type="text/javascript">


</script>
</html>
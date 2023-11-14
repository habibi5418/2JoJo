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
   <title>ëëí ì°ë¦¬ ì¬ì´, ëë</title>
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

   <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
   <link rel="shortcut icon" href="<c:url value='/resources/images/main/11kong.jpg'/>">

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

   <!-- fonts -->
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>


   <!--weight : 200-->
   <!-- <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet"> -->
   <!--weight : 700 ê°ì¡°-->
   <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;700&display=swap" rel="stylesheet">
  
<!-- Modernizr JS -->
   <script src="<c:url value='/resources/js/modernizr-2.6.2.min.js'/>"></script>
    <!-- <style.css> -->
</head>
<body>
   <header role="banner" id="fh5co-header">
        <header role="banner" id="fh5co-header">
            <div class="container">
                <div class="row">
                    <nav class="navbar navbar-default navbar-fixed-top">
                        <div class="navbar-btn">
                            <ul class="navbar-right-btn">
                                <li class="navbar-right-li">
                                    <button onclick="headerGoChat()">
                                      <img src="<c:url value='/resources/images/main/chat1.png'/>">
                                   </button>
                                </li>
                                <li class="navbar-right-li">
                                   <button onclick="location.href=' <c:url value='' />';">
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
                                            <img src="<c:url value='resources/images/main/logout1.png'/>">
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
            
      <!— jQuery —>
			<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
			<!— jQuery Easing —>
			<script src="<c:url value='/resources/js/jquery.easing.1.3.js'/>"></script>
			<!— Bootstrap —>
			<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
			<!— Waypoints —>
			<script src="<c:url value='/resources/js/jquery.waypoints.min.js'/>"></script>
			<!— Stellar Parallax —>
			<script src="<c:url value='/resources/js/jquery.stellar.min.js'/>"></script>
			<!— Counters —>
			<script src="<c:url value='/resources/js/jquery.countTo.js'/>"></script>
			<!— Main JS (Do not remove) —>
			<script src="<c:url value='/resources/js/main.js'/>"></script>
      <script type="text/javascript">
        $("#headerGoHome").on("click", () => {
          location.href = "<c:url value='/'/>";
        });
        $("#headerGoBoard").on("click", () => {
          location.href = "<c:url value='/board/list'/>";
        });
        $("#headerGoGps").on("click", () => {
          location.href = "<c:url value='/gps/walk'/>";
        });
        function headerGoChat() {
          location.href="<c:url value='/chat/roomList'/>";
        }
//             	$("#headerGoProfile").on("click", () => {
//             		location.href = "<c:url value='/board/list'/>";
//             	});
//             	$("#headerGoOur").on("click", () => {
//             		location.href = "<c:url value='/board/list'/>";
//             	});
      </script>
	</header>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="Chrome">
<title>myInfo</title>
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
<link rel="stylesheet"
	href="<c:url value='/resources/css/animate.css'/>">

<!-- Bootstrap  -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.css'/>">

<!-- Style -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/header-mypage.css'/>">

<!-- fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<!--weight : 700 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;700&display=swap"
	rel="stylesheet">
<!-- Modernizr JS -->
<script src="<c:url value='/resources/js/modernizr-2.6.2.min.js'/>"></script>
</head>
<body>
	<header role="banner" id="fh5co-header">
		<div class="container">
			<div class="row">
				<nav class="navbar navbar-default navbar-fixed-top">
					<div class="navbar-header">
						<!-- Mobile Toggle Menu Button -->
						<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar"><i></i></a> <a
							class="navbar-brand" href="<c:url value='/'/>"
							style="font-weight: 700; font-size: 24px; margin-top: 43px; "> dondog </a>
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
	</header>

	<!-- 사이트 소개 -->
    <div class="btn-alram">
						<ul class="navbar-right-btn">
							<li class="navbar-right-li">
								<button onclick="location.href=' <c:url value='' />';">
									<img src="<c:url value='/resources/images/main/alram.png'/>">
								</button>
							</li>
						</ul>
	</div> <!-- navbar-right-btn -->
    
    <section id="fh5co-myInfo">
    
        <div class="container">
            <div class="row">
                    <div class="box-services">
                        <div class="fh5co-info-list">
                            <div class="fh5co-info-header">
                                <div id="user-nickname">
                                    <h4>${loggedInMember.nickname} page </h4>
                                </div>
                                <div id="thumbnail">
                                   	<img src="<c:url value='/resources/images/mypage/thumbnail.png'/>" style="width:250px; border-radius: 50%;">
                                </div>
	                            
	                            <div class="button-event"> 
	                                <button onclick="goInfoUpdate()">edit</button>
	                                <button>
	                                   <img src="<c:url value='/resources/images/mypage/heart.png'/>" style="width:15px;">
	                                </button>
	                            </div>
	                            <div class="follow-info">
	                                <div id="contents">
	                                    <h3>contents</h3>
	                                    <h4>20</h4>
	                                </div>
	                                <div id="follow">
	                                    <h3>follow</h3>
	                                    <h4>110</h4>
	                                </div>
	                                <div id="follower">
	                                    <h3>follower</h3>
	                                    <h4>10</h4>
	                                </div>
	                            </div>
							</div> <!-- fh5co-info-header -->


                            <div class="dog-info">
                               	<h3 style="border: 2px solid black;">강아지 리스트</h3>
                               	<p> dog1 </p>
                               	<p> dog2 </p>
                               	<p> +add </p>
                            </div>
                            
                            <div class="post">
                               	<h3 style="border: 2px solid black;">wrote posts</h3>
                               	<p> thumbnail1</p>
                               	<p> thumbnail2 </p>
                               	<p> more </p>
                            </div>
                            
                            <div class="save-gps">
                               	<h3 style="border: 2px solid black;">산책경로저장</h3>
								<div>map1</div>
								<div>map2</div>
								<div>more</div>
                            </div>
                            
                            
                            <div class="userInfo" hidden >
                                <h4>${loggedInMember.email }</h4>
                                <h4>${loggedInMember.nickname }님</h4>
                                <h4>${loggedInMember.birth }</h4>
                                <h4>${loggedInMember.gender }</h4>
                                <h4>${loggedInMember.address}</h4>
                                <h4>${loggedInMember.grade}</h4>
                            </div>
                        </div>
                        <div class="button-event">
                           
                        </div>
                </div>
            </div>
        </div>
    </section>
    
    
</body>
	
<!-- 	<!— jQuCery —> -->
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<!-- 	<!— jQuery Easing —> -->
	<script src="<c:url value='/resources/js/jquery.easing.1.3.js'/>"></script>
<!-- 	<!— Bootstrap —> -->
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
<!-- 	<!— WaypoCints —> -->
	<script src="<c:url value='/resources/js/jquery.waypoints.min.js'/>"></script>
<!-- 	<!— Stellar Parallax —> -->
	<script src="<c:url value='/resources/js/jquery.stellar.min.js'/>"></script>
<!-- 	<!— Counters —> -->
	<script src="<c:url value='/resources/js/jquery.countTo.js'/>"></script>
<!-- 	<!— Main JS (Do not remove) —> -->
	<script src="<c:url value='/resources/js/main.js'/>"></script>
	
	<script type="text/javascript">
        	$("#headerGoHome").on("click", () => {
        		location.href = "<c:url value='/'/>";
        	});
        	$("#headerGoBoard").on("click", () => {
        		location.href = "<c:url value='/board/list'/>";
        	});
        	
        	function headerGoChat() {
				location.href="<c:url value='/chat/roomList'/>";
			}
        	
        	function goInfoUpdate() {
        		location.href= <c:url value='/mypage/myInfoUpdate'/>;
        	}
	</script>
</html>
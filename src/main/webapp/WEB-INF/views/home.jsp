<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="Chrome">
	<title>돈독한 우리 사이, 돈독</title>
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
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="<c:url value='/resources/css/main/animate.css'/>">
	
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="<c:url value='/resources/css/main/icomoon.css'/>">
	
	<!-- Simple Line Icons -->
	<link rel="stylesheet" href="<c:url value='/resources/css/main/simple-line-icons.css'/>">
	
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="<c:url value='/resources/css/main/bootstrap.css'/>">
	
	<!-- Style -->
	 <link rel="stylesheet" href="<c:url value='/resources/css/main/style.css'/>"> 
	 

	<!-- fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<!--weight : 200-->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
	<!--weight : 700 강조-->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;700&display=swap" rel="stylesheet">
	
	<style type="text/css">
		.match-entry {
			cursor: pointer;
		}
		.feed-bubble, .author-img, .user {
			pointer-events: none;
		}
	</style>


	<!-- Modernizr JS -->
<!-- 	<script src="js/modernizr-2.6.2.min.js"></script> -->


</head>

<body>

	<%@ include file="header.jsp" %>

	<!-- 본문1 fh5co-home-->
	<section id="home" data-section="home" data-stellar-background-ratio="0.5">
		<div class="gradient">
		<div class="container">
			<div class="text-wrap">
				<div class="text-inner">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center">
							<h1 class="animate-box"><span style="font-size: 20px;">돈독해지는 우리 사이,</span> 
							</h1>
						</div>
						<div class="home_img" style="background-color: white; width: 100%;">
							<img src="<c:url value='/resources/images/main/main4.png'/>" style="width: 100%">
						</div>
						<div class="col-md-8 col-md-offset-2 text-center">
							<h1 class="animate-box">
								<span class="big" style="color: #d07534; font-weight: 700; font-size: 55px;">don:dog</span> 
							</h1>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		</div>
	</section>


	<div style="margin-bottom: 400px;"> </div>

	<section id="home-intro" >
		<div class="fh5co-intro" style="margin-top: 300px; margin-bottom: 100px; text-align: center; ">
			<h4 style="font-size: 1.5rem;">우리는 우리의 강아지와 함께할 친구를 신속하게 찾아드립니다</h4>
			<p style="font-size: 1.5rem;">우리는 GPS 기술을 활용하여 동네에 있는 강아지들을 위한 친구 매칭을 제공합니다. <br> 
			강아지와 함께하는 특별한 순간을 만들 첫걸음을 시작하세요.</p>
		</div>

	</section>

	<!-- 사이트 소개 -->
	<section id="fh5co-services" data-section="services">
		

		<div class="fh5co-services">
			<div class="container">
				<div class="row">
					<div class="fh5co-post animate-box">


					<div class="col-md-4 text-center">
						<div class="box-services">
							<div class="icon animate-box">
								<span><i class="icon-energy" style="background-color: #d07534; border-radius: 50%;"></i></i></span>
							</div>
							<div class="fh5co-post animate-box">
								<h4>산책 파트너를 쉽고 빠르게</h4>
								<p>산책 파트너를 찾는 복잡한 프로세스를 단순화하여, 
									강아지와 함께하는 특별한 사회 경험을 즐길 수 있게 도와줍니다. 
									이제 더 이상 산책 메이트를 찾는데 시간을 낭비하지 마세요.</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 text-center">
						<div class="box-services">
							<div class="icon animate-box">
								<span><i class="icon-people" style="background-color: #d07534; border-radius: 50%;"></i></span>
							</div>
							<div class="fh5co-post animate-box">
								<h3>강아지에게 풍부한 사회 경험을</h3>
								<p>우리 서비스를 통해 강아지는 주기적으로 친구와 사람들을 만나, 
                                    소통 능력을 향상시킬 수 있습니다. 
                                    강아지에게 새로운 친구와 즐거운 사회 경험을 제공하세요. </p>
							</div>
						</div>
					</div>
					
					<div class="col-md-4 text-center">
						<div class="box-services">
							<div class="icon animate-box">
								<span><i class="icon-screen-desktop" style="background-color: #d07534; border-radius: 50%;"></i></span>
							</div>
							<div class="fh5co-post animate-box">
								<h3>강아지와 함께한 모든 순간을</h3>
								<p>우리 서비스는 실시간으로 산책 경로를 받아와 지도로 확인하며, 
									강아지와 함께한 모든 순간을 손쉽게 기록하여 보관할 수 있습니다. 
									강아지와의 특별한 순간을 저장하세요.</p>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>



<div style="margin-bottom: 400px;"> </div>


 <!-- testimony : data-section > match   -->
	<section id="fh5co-match" data-section="match">
		<div class="container">
			<!-- match header -->
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="animate-box"><span>Our Match</span></h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext animate-box">
						</div>
					</div>
				</div>
			</div>
			<!-- match게시글 연동  -->
			<div class="row">
				<div class="col-md-4">
					<div class="match-entry animate-box" onclick="goBoardDetail(${recentBoardList[0].bnum})">
						<div class="feed-bubble">
							<p>${recentBoardList[0].title}</p>
						</div>
						<div class="author-img" style="background-image: url(<c:url value='/resources/images/main/user-5.jpg'/>);"></div> <!--작성자프로필사진-->
						<span class="user">${recentBoardList[0].nickname}<br> <small>${recentBoardList[0].regDate}</small></span>
					</div>

					<div class="match-entry animate-box" onclick="goBoardDetail(${recentBoardList[3].bnum})">
						<div class="feed-bubble">
							<p>${recentBoardList[3].title}</p>
						</div>
						<div class="author-img" style="background-image: url(<c:url value='/resources/images/main/user-5.jpg'/>);"></div> <!--작성자프로필사진-->
						<span class="user">${recentBoardList[3].nickname}<br> <small>${recentBoardList[3].regDate}</small></span>
					</div>

					
				</div>

				<div class="col-md-4">
					<div class="match-entry animate-box" onclick="goBoardDetail(${recentBoardList[1].bnum})">
						<div class="feed-bubble">
							<p>${recentBoardList[1].title}</p>
						</div>
						<div class="author-img" style="background-image: url(<c:url value='/resources/images/main/user-5.jpg'/>);"></div> <!--작성자프로필사진-->
						<span class="user">${recentBoardList[1].nickname}<br> <small>${recentBoardList[1].regDate}</small></span>
					</div>

					<div class="match-entry animate-box" onclick="goBoardDetail(${recentBoardList[4].bnum})">
						<div class="feed-bubble">
							<p>${recentBoardList[4].title}</p>
						</div>
						<div class="author-img" style="background-image: url(<c:url value='/resources/images/main/user-5.jpg'/>);"></div> <!--작성자프로필사진-->
						<span class="user">${recentBoardList[4].nickname}<br> <small>${recentBoardList[4].regDate}</small></span>
					</div>

					
				</div>

				<div class="col-md-4">
					<div class="match-entry animate-box" onclick="goBoardDetail(${recentBoardList[2].bnum})">
						<div class="feed-bubble">
							<p>${recentBoardList[2].title}</p> 
						</div>
						<div class="author-img" style="background-image: url(<c:url value='/resources/images/main/user-5.jpg'/>);"></div> <!--작성자프로필사진-->
						<span class="user">${recentBoardList[2].nickname}<br> <small>${recentBoardList[2].regDate}</small></span>
					</div>

					<div class="match-entry animate-box" onclick="goBoardDetail(${recentBoardList[5].bnum})">
						<div class="feed-bubble">
							<p>${recentBoardList[5].title}</p>
						</div>
						<div class="author-img" style="background-image: url(<c:url value='/resources/images/main/user-5.jpg'/>);"></div> <!--작성자프로필사진-->
						<span class="user">${recentBoardList[5].nickname}<br> <small>${recentBoardList[5].regDate}</small></span>
					</div>
				</div>
			</div>
		</div> 

		<div style="margin-bottom: 400px;"> </div>




		<!-- 데이터 집계  -->

		<div id="fh5co-counter-section" class="fh5co-counters">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-md-offset-3 animate-box">
						<p style="text-align: center;">We are helping dogs have a good time by making various friends.<br> 
							As a member of the local community, <br> meet other dog owners in the area through our DONDOG.</p>
					</div>
				</div>
				<div class="row animate-box">

					<!-- 회원수 집계 -->
					<div class="col-md-3 text-center">
						<span class="fh5co-counter js-counter" data-from="0" data-to="${memberCnt }" data-speed="5000"
							data-refresh-interval="50"></span>
						<span class="fh5co-counter-label">member</span>
					</div>

					<!-- 보드 집계 -->
					<div class="col-md-3 text-center">
						<span class="fh5co-counter js-counter" data-from="0" data-to="${boardCnt }" data-speed="5000"
							data-refresh-interval="50"></span>
						<span class="fh5co-counter-label">writing</span>
					</div>
					<!-- 등록된 강아지  -->
					<div class="col-md-3 text-center">
						<span class="fh5co-counter js-counter" data-from="0" data-to="${dogCnt }" data-speed="5000"
							data-refresh-interval="50"></span>
						<span class="fh5co-counter-label">registed dog</span>
					</div>
					<!-- 채팅 요청 처리건 집계  -->
					<div class="col-md-3 text-center">
						<span class="fh5co-counter js-counter" data-from="0" data-to="${chatCnt }" data-speed="5000"
							data-refresh-interval="50"></span>
						<span class="fh5co-counter-label">matched</span>
					</div>
				</div>
			</div>
		</div>


	</section>


<div style="margin-bottom: 400px;"> </div>


	<!-- 소개 -->
	<section id="fh5co-pricing" data-section="pricing">
		<section class="pricing-section bg-3">
			<div class="container">

				<div class="row">
					<div class="col-md-12 section-heading text-center">
						<h2 class="animate-box">developer</h2>
						<div class="row">
							<div class="col-md-8 col-md-offset-2 subtext animate-box">
								<h3 style="color: black;">
									" 강아지와 친구가 되고 싶은 우리 강아지, 어떻게 친구를 만들어 주지? " <br>
									<br>
									우리 강아지에게 산책 메이트를 만들어 주세요<br>
									우리 동네와 원하는 장소에서 산책 메이트를 찾을 수 있어요<br>
									우리 강아지에게 좋은 산책 친구를 만들어 주는 것이 저희 서비스의 목표입니다<br>
									<br>
									강아지와의 산책으로 돈독해지는 우리,<br>
									강아지끼리 돈독해지는 우리,<br>
									돈독한 우리 사이, 돈독으로 함께 하세요!
								</h3>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-4 text-center animate-box">
						<div class="pricing__item">
							<div class="intro_img">
								<img src="<c:url value='/resources/images/main/developer1.png'/>">
							</div>
							<p class="pricing__sentence" style="font-weight: bold; font-size: 24px; text-align: center;">
								JO CHEOL MIN 
							</p>
						</div>
					</div>
					

					<div class="col-md-4 text-center animate-box">
						<div class="pricing__item">
							<div class="intro_img">
								<img src="<c:url value='/resources/images/main/developer2.png'/>">
							</div>
							<p class="pricing__sentence" style="font-weight: bold; font-size: 24px; text-align: center;">
								JO SOO JIN
							</p>		
							
						</div>
					</div>
					<div class="col-md-4 text-center animate-box">
						<div class="pricing__item">
							<div class="intro_img">
								<img id="jiyeong" src="<c:url value='/resources/images/main/developer3.png'/>" >
							</div>
							<p class="pricing__sentence" style="font-weight: bold; font-size: 24px; text-align: center;">
								LEE JI YEONG
							</p>
						</div>
					</div>
				</div>
			</div>
		</section>
	</section>



	<div id="fh5co-footer" role="contentinfo">
		<div class="container">
			<div class="row">
				<div class="col-md-4 animate-box">
					<h3 class="section-title">DONDOG.</h3>
					<p>돈독해지는 우리 사이, 돈독</p>

				</div>

				<div class="col-md-4 animate-box">
					<h3 class="section-title">Our Address</h3>
					<ul class="contact-info">
						<li><i class="icon-map"></i>서울특별시 중로구 창경궁로 254 </li>
						<li><i class="icon-phone"></i> 010.3203.6882</li>
						<li><i class="icon-envelope"></i><a href="#">cjfalswoals@naver.com</a></li>
						<li><i class="icon-globe"></i><a href="#">www.dondog.site</a></li>
					</ul>
					<h3 class="section-title">Connect with Us</h3>
					<ul class="social-media">
						<li><a href="#" class="facebook"><i class="icon-facebook"></i></a></li>
						<li><a href="#" class="twitter"><i class="icon-twitter"></i></a></li>
						<li><a href="#" class="dribbble"><i class="icon-dribbble"></i></a></li>
						<li><a href="#" class="github"><i class="icon-github-alt"></i></a></li>
					</ul>
				</div>
				<div class="col-md-4 animate-box">
					<h3 class="section-title">Drop us a line</h3>
					<form class="contact-form">
						<div class="form-group">
							<label for="name" class="sr-only">Name</label>
							<input type="name" class="form-control" id="name" placeholder="Name">
						</div>
						<div class="form-group">
							<label for="email" class="sr-only">Email</label>
							<input type="email" class="form-control" id="email" placeholder="Email">
						</div>
						<div class="form-group">
							<label for="message" class="sr-only">Message</label>
							<textarea class="form-control" id="message" rows="7" placeholder="Message"></textarea>
						</div>
						<div class="form-group">
							<input type="submit" id="btn-submit" class="btn btn-send-message btn-md"
								value="Send Message">
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<p class="copy-right">&copy; 2023 KOSA 대보정보통신3기 교육생 일동. All Rights Reserved. <br>
						by 조철민. 조수진. 이지영</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<!-- jQuery Easing -->
	<script src="<c:url value='/resources/js/jquery.easing.1.3.js'/>"></script>
	<!-- Bootstrap -->
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
	<!-- Waypoints -->
	<script src="<c:url value='/resources/js/jquery.waypoints.min.js'/>"></script>
	<!-- Stellar Parallax -->
	<script src="<c:url value='/resources/js/jquery.stellar.min.js'/>"></script>
	<!-- Counters -->
	<script src="<c:url value='/resources/js/jquery.countTo.js'/>"></script>
	<!-- Main JS (Do not remove) -->
	<script src="<c:url value='/resources/js/main.js'/>"></script>
	
	<script type="text/javascript">
		function goBoardDetail(bnum) {
			location.href = "<c:url value='/board/detail?bnum=" + bnum + "'/>";
		}
	</script>
</body>
</html>
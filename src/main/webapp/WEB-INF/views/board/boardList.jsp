<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
<link rel="stylesheet" href="<c:url value='/resources/css/board/style.css' />">
<body>
	<%@ include file="../header.jsp" %>
	<section>
		<div id="container">
			<input type="hidden" id="lastBnum" value="${boardList[boardList.size() - 1].bnum }" />
			<div id="listContainer">
				<div id="listHeader">
					<div id="listLoc2"><h1>서울특별시 종로구 혜화동</h1></div>
<!-- 					<h1 id="listLoc2">혜화동</h1> -->
					<c:if test="${not empty principal}">
						<button type="button" id="writeFormBtn" style="border:none;">글작성</button>
					</c:if>
				</div>
				<c:forEach var="board" items="${boardList }">
					<a href="<c:url value='/board/detail?bnum=${board.bnum }'/>" class="commonAnchor">
						<div class="boardDiv">
							<div class="boardBox">
								<c:if test="${board.boardImgList[0] == null }">
				        			<img src="<c:url value='/resources/images/board/no_image.jpg'/>" class='boardImg'><br/>
				        		</c:if>
								<c:if test="${board.boardImgList[0] != null }">
				        			<img src="<c:url value='/boardImg/download?inum=${board.boardImgList[0].inum }'/>" class='boardImg'><br/>
				        		</c:if>
								<p class="boardInfo">
			        				<img src="<c:url value='/resources/images/board/loc2.png'/>" class='loc2Img'>
									${board.loc2 }<br>
									<c:if test="${board.category == 'B' }">
				        				<img src="<c:url value='/resources/images/board/lightning.png'/>" class='lightningImg'>
									</c:if>
									<span> ${board.title }</span>
								</p>
								<p class="boardInfoRight">
									${board.nickname }<br>
									${board.regDate }
								</p>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
	</section>
	
    <script>
    	
    	var moreIng = false;
    	
		$(document).ready(function(){
			//window는 "#searchPopup"등 으로 스크롤 주체로 변경가능
			$(window).scroll(function(){
				var scrollTop = $(this).scrollTop();
				var innerHeight = $(this).innerHeight();
				var scrollHeight = $(document).height();
				
				if ((scrollTop + innerHeight) >= (scrollHeight - 200)) {
					if (!moreIng) {
						moreIng = true;
						moreData();
					}
				}
			});
		});
    
    	if (${principal != null}) {
			$("#writeFormBtn").on("click", () =>{
				location.href = "<c:url value='/board/writeForm'/>";
			});
    	}
    	
    	function moreData() {
			const param = {
    			bnum: $("#lastBnum").val()
    		}
       	    		
			fetch("<c:url value='/board/more'/>", {
				method: "POST",
				headers: {
				    "Content-Type": "application/json; charset=UTF-8",
				},
				body: JSON.stringify(param),
			})
			.then((response) => response.json())
			.then((json) => {
				const moreList = json.boardList;
				
				if (moreList.length != 0) {
					const path = "<c:url value='/board/detail?bnum='/>";
					const noImgPath = "<c:url value='/resources/images/board/no_image.jpg'/>";
					const imgPath = "<c:url value='/boardImg/download?inum='/>";
					const loc2Path = "<c:url value='/resources/images/board/loc2.png'/>";
					const isLightning = ${board.category == 'B' };
					const lightningImgPath = "<c:url value='/resources/images/board/lightning.png'/>";
					const listContainer = $("#listContainer");
					
					moreList.forEach(more => {
						let moreAnchor = '<a href="' + path + more.bnum + '" class="commonAnchor">' 
											+ '<div class="boardDiv">' 
												+ '<div class="boardBox">';
													if (more.boardImgList.length != 0) {
														moreAnchor += '<img src="' + imgPath + more.boardImgList[0].inum + '" class="boardImg"><br/>';
													} else {
														moreAnchor += '<img src="' + noImgPath + '" class="boardImg"><br/>';
													}
						moreAnchor 						+= '<p class="boardInfo">'
								        				+ '<img src="' + loc2Path + '" class="loc2Img">'
														+ more.loc2 + '<br>'
														+ '<c:if test="' + isLightning + '">'
									        				+ '<img src="' + lightningImgPath + '" class="lightningImg">'
														+ '</c:if>'
														+ '<span>' + more.title + '</span>'
													+ '</p>'
													+ '<p class="boardInfoRight">'
														+ more.nickname + '<br>'
														+ more.regDate 
													+ '</p>'
												+ '</div>'
											+ '</div>'
										+ '</a>';
						
						listContainer.append(moreAnchor);
					});
					
					$("#lastBnum").val(moreList[moreList.length - 1].bnum);
					moreIng = false;
				}
			});
    	};
    	
    </script>
    
</body>
</html>
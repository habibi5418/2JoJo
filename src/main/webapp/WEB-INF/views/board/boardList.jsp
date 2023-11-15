<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
<link rel="stylesheet" href="<c:url value='/resources/css/style1.css' />">
<body>
	<%@ include file="../header.jsp" %>
	
	<section>
		<div id="container">
			<div id="listContainer">
				<div id="listHeader">
					<h2 id="listLoc2">혜화동</h2>
					<c:if test="${not empty principal}">
						<button type="button" id="writeFormBtn" class="btn-warning">글작성</button>
					</c:if>
				</div>
				<c:forEach var="board" items="${boardList }">
					<a href="<c:url value='/board/detail?bnum=${board.bnum }'/>" class="commonAnchor">
						<div id="boardDiv">
							<div id="boardBox">
								<c:if test="${board.boardImgList[0] == null }">
				        			<img src="<c:url value='/resources/images/board/이미지없음.png'/>" class='boardImg'><br/>
				        		</c:if>
								<c:if test="${board.boardImgList[0] != null }">
				        			<img src="<c:url value='/boardImg/download?inum=${board.boardImgList[0].inum }'/>" class='boardImg'><br/>
				        		</c:if>
								<p class="boardInfo">
									${board.loc2 }<br>
									<c:if test="${board.category == 'B' }">
				        				<img src="<c:url value='/resources/images/board/lightning.png'/>" class='lightningImg'>
									</c:if>
									${board.title }
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
    	if (${principal != null}) {
			$("#writeFormBtn").on("click", () =>{
				location.href = "<c:url value='/board/writeForm'/>";
			});
    	}
    	
	    $(document).ready(function() {	
	    });
    </script>
    
</body>
</html>
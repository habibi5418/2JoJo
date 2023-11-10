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
	
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h5 class="modal-title">댕댕이 선택</h5>
	      </div>
	      <div class="modal-body">
	        <p>댕댕이 현황</p><br>
	        <div id="currentDogList">
		        <c:forEach var="dog" items="${dogList }">
		        	<div class="currentDogDiv" id="currentDogDiv${dog.dnum }">
		        		<a href="#" class="commonAnchor" onclick="addDogToForm(this)" data-dnum="${dog.dnum }" data-dname="${dog.dname }">
			        		<img src="<c:url value='/dogProfile/download?dnum=${dog.dnum }'/>" class='currentDogImg'><br/>
			        		<p>${dog.dname }</p>
		        		</a>
		        	</div>
		        </c:forEach>
        	</div>
	      </div>
	      <div class="modal-footer">
			<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2">추가</button>
<!-- 			<button id="addNewDogBtn" type="button" class="btn btn-warning">추가</button> -->
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>

	<%@ include file="../header.jsp" %>
	
	<div id="container">
		<div id="detailContainer">
			<button type="button" id="updateFormBtn" class="btn btn-warning">수정</button>
			<button type="button" id="deletBtn" class="btn btn-danger">삭제</button>
			<button type="button" id="backBtn" class="btn btn-secondary">뒤로</button>
			<div id="detailImgDiv">
				<c:choose>
					<c:when test="${board.boardImgList.size() == 1 }">
						<c:forEach var="boardImg" items="${board.boardImgList }" varStatus="cnt">
			   				<img src="<c:url value='/boardImg/download?inum=${boardImg.inum }'/>" class='detailImg1'><br/>
			   			</c:forEach>
					</c:when>
					<c:when test="${board.boardImgList.size() == 2 }">
						<c:forEach var="boardImg" items="${board.boardImgList }" varStatus="cnt">
			   				<img src="<c:url value='/boardImg/download?inum=${boardImg.inum }'/>" class='detailImg2_${cnt.index + 1 }'><br/>
			   			</c:forEach>
					</c:when>
					<c:when test="${board.boardImgList.size() <= 3 }">
						<c:forEach var="boardImg" items="${board.boardImgList }" varStatus="cnt">
			   				<img src="<c:url value='/boardImg/download?inum=${boardImg.inum }'/>" class='detailImg3_${cnt.index + 1 }'><br/>
			   			</c:forEach>
					</c:when>
				</c:choose>
   			</div>
   			<p>
   				${board.loc2} <br>
				${board.title }  ${board.regDate }
			</p>
			<div id="boardDogDiv">
				<c:forEach var="boardDogInfo" items="${boardDogInfoList }">
					<div class="boardDogBox">
						<img src="<c:url value='/dogProfile/download?dnum=${boardDogInfo.dnum }'/>" class='detailDogImg'><br>
						<p>${boardDogInfo.dname }</p>
					</div>
				</c:forEach>
			</div>
			<div id="boardContentsDiv">
				<p>
					${board.contents }
				</p>
			</div>
			<div id="detailFooter">
				<div id="detailMemberProfile">
					회원 프사 자리
				</div>
				<div id="detailFooterRight">
					꼬숩도<br>
					채팅 버튼
				</div>
			</div>
		</div>
	</div>
    
    <script>
	    $("#backBtn").on("click", () =>{
			location.href = "<c:url value='/board/list'/>";
		});
    	
    </script>
    
</body>
</html>
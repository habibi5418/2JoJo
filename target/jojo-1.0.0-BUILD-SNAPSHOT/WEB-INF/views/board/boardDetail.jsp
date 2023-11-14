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
	  <div class="modal-dialog detailModal" role="document">
	    <div class="modal-content detailModalContent">
	      <div style="height: 14px;"></div>
	      <div class="modal-body detailModalScroll">
	        <div id="detailModalDogInfo">
       			<img id="detailModalDogImg"><br/>
	        	<h2 id="detailModalDogDname"></h2>
	        	<div id="detailModalDiv1">
		        	<ul id="detailModalUl">
		        		<li class="detailModalLi">
		        			<h3>견종</h3>
		        			<p id="detailModalDogDtype"></p>
		        		</li>
		        		<li class="detailModalLi">
		        			<h3>나이</h3>
		        			<p id="detailModalDogAge"></p>
		        		</li>
		        		<li class="detailModalLi">
		        			<h3>성별</h3>
		        			<p id="detailModalDogGender"></p>
		        		</li>
		        		<li class="detailModalLi">
		        			<h3>체중</h3>
		        			<p id="detailModalDogWeight"></p>
		        		</li>
		        	</ul>
	        	</div>
	        	<h3>About</h3>
	        	<p id="detailModalDogAbout">문제점1<br>문제점2<br>문제점3<br>문제점4<br>~~~~<br>~~~~<br>~~~~<br>~~~~<br>~~~~<br></p>
        	</div>
	      </div>
	      <div id="detailModalFooter" class="modal-footer">
	        <button type="button" id="detailModalCancelBtn" class="btn btn-default" data-dismiss="modal">닫기</button>
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
				<ul id="boardDogUl">
				<c:forEach var="boardDogInfo" items="${boardDogInfoList }">
					<a href="#myModal1" data-toggle="modal" onclick="setModal('${boardDogInfo.dnum}', '${boardDogInfo.dname}', '${boardDogInfo.dtype}', '${boardDogInfo.age}', '${boardDogInfo.gender}', '${boardDogInfo.weight}', '${boardDogInfo.matter}')">
						<li class="boardDogLi">
							<img src="<c:url value='/dogProfile/download?dnum=${boardDogInfo.dnum }'/>" class='detailDogImg'><br>
							<p>${boardDogInfo.dname }</p>
						</li>
					</a>
					<a href="#myModal1" data-toggle="modal" onclick="setModal('${boardDogInfo.dnum}', '${boardDogInfo.dname}', '${boardDogInfo.dtype}', '${boardDogInfo.age}', '${boardDogInfo.gender}', '${boardDogInfo.weight}', '${boardDogInfo.matter}')">
						<li class="boardDogLi">
							<img src="<c:url value='/dogProfile/download?dnum=${boardDogInfo.dnum }'/>" class='detailDogImg'><br>
							<p>${boardDogInfo.dname }</p>
						</li>
					</a>
					<a href="#myModal1" data-toggle="modal" onclick="setModal('${boardDogInfo.dnum}', '${boardDogInfo.dname}', '${boardDogInfo.dtype}', '${boardDogInfo.age}', '${boardDogInfo.gender}', '${boardDogInfo.weight}', '${boardDogInfo.matter}')">
						<li class="boardDogLi">
							<img src="<c:url value='/dogProfile/download?dnum=${boardDogInfo.dnum }'/>" class='detailDogImg'><br>
							<p>${boardDogInfo.dname }</p>
						</li>
					</a>
					<a href="#myModal1" data-toggle="modal" onclick="setModal('${boardDogInfo.dnum}', '${boardDogInfo.dname}', '${boardDogInfo.dtype}', '${boardDogInfo.age}', '${boardDogInfo.gender}', '${boardDogInfo.weight}', '${boardDogInfo.matter}')">
						<li class="boardDogLi">
							<img src="<c:url value='/dogProfile/download?dnum=${boardDogInfo.dnum }'/>" class='detailDogImg'><br>
							<p>${boardDogInfo.dname }</p>
						</li>
					</a>
				</c:forEach>
				</ul>
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
    	
	    function setModal(dnum, dname, dtype, age, gender, weight, matter) {
	    	$("#detailModalDogImg").remove();
	    	
	    	const imgPath = "<c:url value='/dogProfile/download?dnum=" + dnum + "'/>";
       		$("#detailModalDogInfo").prepend(
				"<img src='" + imgPath + "' id='detailModalDogImg' class='detailModalDogImg'>"
       		); 
			
       		$("#detailModalDogDname").text(dname);
       		$("#detailModalDogDtype").text(dtype);
       		$("#detailModalDogAge").text(age);
       		$("#detailModalDogGender").text(gender);
       		$("#detailModalDogWeight").text(weight);
//        		$("#detailModalDogAbout").text(matter);
	    }
    </script>
    
</body>
</html>
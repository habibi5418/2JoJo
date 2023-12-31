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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
	
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h5 class="modal-title">댕댕이 추가</h5>
	      </div>
	      <div class="modal-body">
			<form id="newDogAddForm" autocomplete="off" enctype="multipart/form-data">
				<fieldset>
					<input type="hidden" name="email" value="${loggedInMember.email }" />
					<label for="addDname">이름</label>
					<input type="text" name="dname" id="addDname" class="form-control" required>
					<label for="addAge">나이</label>
					<input type="text" name="age" id="addAge" class="form-control" required>
					<label for="addDtype">견종</label>
					<input type="text" name="dtype" id="addDtype" class="form-control" required>
					<label for="addGender">성별</label>
					<input type="text" name="gender" id="addGender" class="form-control" required>
					<label for="addWeight">무게</label>
					<input type="text" name="weight" id="addWeight" class="form-control" required>
<!-- 					<label for="addMatter">특이사항</label> -->
<!-- 					<input type="text" name="matter" id="addMatter" class="form-control" required> -->
				</fieldset>
				<label>프로필 사진 선택</label>
				<div id="d_file">
					<input type='file' name='file' />
				</div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button id="saveNewDogBtn" type="button" class="btn btn-primary">추가</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<%@ include file="../header.jsp" %>
	
	<div id="writeContainer">
		<div id="formContainer">
			<form id="writeForm" method="post" autocomplete="off" enctype="multipart/form-data">
	            <div id="lightningDiv">
		            <label id="lightningLabel" for=checkLightning">
		            	<p>번개</p>
		            	<input id="checkLightning" type="checkbox">
		            </label>
		        </div>
				<div class="form-group">
		            <label for="writeTitle">글쓰기 - ${loggedInMember.nickname}</label>
		            <input type="text" name="title" class="form-control" placeholder="제목을 입력하세요." id="writeTitle" required>
		        </div>
		        <div class="form-group">
		            <textarea id="detailTextarea" name="contents" class="form-control" placeholder="내용을 입력하세요."></textarea>
		        </div>
		        
	        	<div id="addDogLabelDiv">
		            <label id="addDogLabel">산책갈 강아지</label>
					<button id="writeDogAddBtn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1">+</button>
	<!-- 				<button type="button" id="writeDogAddBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">+</button> -->
	        	</div>
				<div id="addedDogList">
					
				</div>
				<br>
				
				<input type="button" value="이미지 추가" class="btn btn-info" onClick="w_addFile()"/><br>
				<div id="w_file">
					
				</div>
	        </form>
			
			<div id="btnDiv">
				<button type="button" id="writeBtn" class="btn btn-warning">작성</button>
				<button type="button" id="writeCancelBtn" class="btn btn-secondary">취소</button>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="<c:url value='/resources/js/summernote/summernote-lite.min.js'/>"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/12.4.0/classic/ckeditor.js"></script>
	<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
	<script type="text/javascript">
		var currentDogList = $("#currentDogList");
		var addedDogList = $("#addedDogList");
		var noDogFlag = false;
		var addedDodArray = [];
		
		// 추가할 강아지 없을 경우
		function noDog() {
			if (currentDogList.children().length == 0) {
				currentDogList.append("추가할 반려견이 없습니다.");
				noDogFlag = true;
			}
		}
		noDog();
		
		// 강아지 선택 후 폼에 추가
		function addDogToForm(data) {
			const dnum = data.getAttribute("data-dnum");
			const dname = data.getAttribute("data-dname");
			const path = "<c:url value='/dogProfile/download?dnum='/>" + dnum;
			const func = "subDogFromForm(this)";
			
			addedDogList.append(
				"<div class='addedDogDiv' id='addedDogDiv" + dnum + "'>"
				+ "<a href='#' class='commonAnchor' onclick='" + func + "' data-dnum='" + dnum + "' data-dname='" + dname + "'>"
				+ "<img src='" + path + "' class='currentDogImg'><br/>" 
				+ "<p>" + dname + "</p>" 
				+ "</a>"
				+ "</div>"
			);
			
			addedDodArray.push(dnum);
			
			$("#currentDogDiv" + dnum).remove();
			
			noDog();
		};
		
		// 폼의 선택된 강아지 다시 되돌리기
		function subDogFromForm(data) {
			if (noDogFlag) {
				currentDogList.empty();
				noDogFlag = false;
			}
			
			const dnum = data.getAttribute("data-dnum");
			const dname = data.getAttribute("data-dname");
			const path = "<c:url value='/dogProfile/download?dnum='/>" + dnum;
			const func = "addDogToForm(this)";
			
			currentDogList.append(
				"<div class='currentDogDiv' id='currentDogDiv" + dnum + "'>"
				+ "<a href='#' class='commonAnchor' onclick='" + func + "' data-dnum='" + dnum + "' data-dname='" + dname + "'>"
				+ "<img src='" + path + "' class='currentDogImg'><br/>" 
				+ "<p>" + dname + "</p>"
				+ "</a>"
				+ "</div>"
			);

			for(let i = 0; i < addedDodArray.length; i++) {
			  if(addedDodArray[i] === dnum)  {
				addedDodArray.splice(i, 1);
			    i--;
			  }
			}
			
			$("#addedDogDiv" + dnum).remove();
		};

		// 강아지 추가 저장
		$("#saveNewDogBtn").on("click", () => {
			const form = $("#newDogAddForm")[0];
			const formData = new FormData(form);
			
			fetch("<c:url value='/dog/add'/>", {
				method: "POST",
				headers: {},
				body: formData,
			})
			.then((response) => response.json())
			.then((json) => {
				alert(json.message);
				if (json.status) {
					reloadCurrentDog();
					$("#newDogAddModal").modal("hide");
				}
			});
		});
		
		// 추가한 강아지 현황에 추가
		function reloadCurrentDog() {
			fetch("<c:url value='/board/reloadDog?email=${loggedInMember.email}'/>", {
				method: "POST",
				headers: {
				    "Content-Type": "application/json; charset=UTF-8",
				},
				body: JSON.stringify(),
			})
			.then((response) => response.json())
			.then((json) => {
				if (noDogFlag) {
					currentDogList.empty();
					noDogFlag = false;
				}
				
				const reloadDogList = json.reloadDogList;
				const file = reloadDogList[0];
				const path = "<c:url value='/dogProfile/download?dnum='/>" + file.dnum;
				const func = "addDogToForm(this)";
				
				currentDogList.append(
					"<div class='currentDogDiv' id='currentDogDiv" + file.dnum + "'>"
					+ "<a href='#' class='commonAnchor' onclick='" + func + "' data-dnum='" + file.dnum + "' data-dname='" + file.dname + "'>"
					+ "<img src='" + path + "' class='currentDogImg'><br/>" 
					+ "<p>" + file.dname + "</p>"
					+ "</a>"
					+ "</div>"
				);
			});
		}
        
		// 글 작성 이미지 파일 추가
        var w_cnt = 1;
        function w_addFile() {
        	$("#w_file").append(
       			"<div class='filebox'>" 
       				+ "<label for='file" + w_cnt + "'>파일찾기</label>"
	       			+ "<input type='file' id='file" + w_cnt + "' class='file btn btn-success' name='file" + w_cnt + "' />"
	       			+ "<input id='upload-name" + w_cnt + "' class='upload-name' value='이미지파일' readonly>"
       			+ "</div>"
        	);
            
            // 이미지 파일 추가 시 파일명 적기
        	const num = w_cnt;
            $("#file" + w_cnt).on('change', function(file) {	
    			const fileName = file.target.files[0].name;
    			const extension = fileName.split(".")[1];
    			
    			if (extension === "jpg" || extension === "jpeg" || extension === "png") {
    				$("#upload-name" + num).val(fileName);
    			} else {
    				alert("이미지 파일(jpg, jpeg, png)만 업로드 가능합니다.");
    			}
    		});
            
        	w_cnt++;
        }
	
		// 작성 실행
		$("#writeBtn").on("click", () => {
			const form = $("#writeForm")[0];
			const formData = new FormData(form);
			formData.append("nickname", "${loggedInMember.nickname}");
			formData.append("loc2", "${loggedInMember.address}");
			formData.append("email", "${loggedInMember.email}");
			formData.append("boardDogList", addedDodArray);
			
			const lightning = $("#checkLightning").is(":checked");
			if (lightning) {
				formData.append("category","B");
			} else {
				formData.append("category","G");
			}
			
			fetch("<c:url value='/board/write'/>", {
				method: "POST",
				headers: {},
				body: formData,
			})
			.then((response) => response.json())
			.then((json) => {
				alert(json.message);
				if (json.status) {
					location.href = "<c:url value='/board/list'/>";
				}
			});
		});
        
		// 작성 실행
// 		$("#writeBtn").on("click", () => {
// 			const contents = $("#summernote").summernote("code");
// 			const param = {
// 				title: $("#writeTitle").val(),
// 				contents: contents,
// 				nickname: "${loggedInMember.nickname}",
// 				loc2: "${loggedInMember.address}",
// 				email: "${loggedInMember.email}",
// 				boardDogList: addedDodArray
// 			};
			
// 			fetch("<c:url value='/board/write'/>", {
// 				method: "POST",
// 				headers: {
// 				    "Content-Type": "application/json; charset=UTF-8",
// 				},
// 				body: JSON.stringify(param),
// 			})
// 			.then((response) => response.json())
// 			.then((json) => {
// 				if (json.status) {
// 					alert(json.message);
// 					location.href = "<c:url value='/board/list'/>";
// 				}
// 			});
// 		});
	
		// 작성 취소
		$("#writeCancelBtn").on("click", () => {
			location.href = "<c:url value='/board/list'/>";
		});
		
	</script>
</body>
</html>
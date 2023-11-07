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
<title>Insert title here</title>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<body>
<!-- 	<div id="listContainer" style="background-color: skyblue; width: 90%; margin: 0 auto; display: inline-flex;"> -->
<%-- 		<c:forEach var="match" items="${matchList }" varStatus="cnt"> --%>
<%-- 			<c:if test="${cnt.index % 2 == 0 }"> --%>
<!-- 				<div style="background-color: gray; flex: 1; width: 40%; box-sizing: border-box;"> -->
<%-- 					제목 : ${match.title } <br> --%>
<%-- 					내용 : ${match.contents } --%>
<!-- 				</div> -->
<%-- 			</c:if> --%>
<%-- 			<c:if test="${cnt.index % 2 == 1 }"> --%>
<!-- 				<div style="background-color: violet; flex: 1; width: 40%; box-sizing: border-box;"> -->
<%-- 					제목 : ${match.title } <br> --%>
<%-- 					내용 : ${match.contents } --%>
<!-- 				</div> -->
<%-- 			</c:if> --%>
<%-- 		</c:forEach> --%>
<!-- 	</div> -->
	<div id="listContainer" style="background-color: skyblue; width: 90%; margin: 0 auto;">
		<c:forEach var="match" items="${matchList }" varStatus="cnt">
			<div style="background-color: violet; width: 40%; margin: 0px 0px 20px 60px; display: inline-block;">
				<img src="<c:url value="/resources/img/11kong.jpg"/>" style="width: 100%; margin-bottom: 5px; border-radius: 8%;">
				제목 : ${match.title } <br>
				내용 : ${match.contents } ${cnt.index + 1 }
			</div>
		</c:forEach>
	</div>

<!-- 	    <div id="listContainer"> -->
<%--  			<a href="<c:url value='/notice/listNoticeByViewCount.do'/>" id="listByViewCountButton" class="detailBtns">조회순</a> --%>
	    	
<!-- 			<table class="table"> -->
<%-- 				<caption>ALL NOTICE - 최신순</caption> --%>
<!-- 					<tr id="noticeTemp" style="display: none;"> -->
<!-- 						<td id="noticeidTemp"></td> -->
<!-- 						<td> -->
<!-- 							<a onclick="detailNotice(this.getAttribute('data-noticeid'))" href="#" id="title" data-noticeid="{noticeid}"></a> -->
<!-- 						</td> -->
<!-- 						<td id="writer_uid"></td> -->
<!-- 						<td id="reg_date"></td> -->
<!-- 						<td id="view_count"></td> -->
<!-- 					</tr>  -->
<!-- 					<tr> -->
<!-- 						<th width="8%">글번호</th> -->
<!-- 	  			   		<th width="50%">글제목</th> -->
<!-- 						<th width="20%">작성자</th> -->
<!-- 						<th width="15%">작성일자</th> -->
<!-- 						<th width="7%">조회</th> -->
<!-- 					</tr> -->
<!-- 					<tbody id="matchTbody"> -->
<!-- 					</tbody> -->
<!-- 			</table> -->
			
			
			
<%-- 			<c:if test="${result.notice.pageNo != result.notice.totalPageSize }"> --%>
<!-- 				<div id="moreDiv"> -->
<!-- 					<a href="#" id="moreList">더보기</a> -->
<!-- 				</div> -->
<%-- 			</c:if> --%>
			
<!-- 			<div id="naviDiv"> -->
<%-- 				<c:if test="${result.notice.navStart != 1 }"> --%>
<%-- 					<a href="javascript:goPage(${result.notice.navStart - 1 })" class="changePageA">&lt;이전</a> |  --%>
<%-- 				</c:if> --%>
<%-- 				<c:forEach var="navNo" begin="${result.notice.navStart }" end="${result.notice.navEnd }"> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${result.notice.pageNo == navNo }"> --%>
<%-- 							<a href="javascript:goPage(${navNo })" id="selectedPageNo">${navNo }</a> --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<%-- 							<a href="javascript:goPage(${navNo })" id="NoSelectedPageNo">${navNo }</a> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<%-- 				</c:forEach> --%>
<%-- 				<c:if test="${result.notice.navEnd != result.notice.totalPageSize }"> --%>
<%-- 					 | <a href="javascript:goPage(${result.notice.navEnd + 1 })" class="changePageA">다음&gt;</a> --%>
<%-- 				</c:if> --%>
<!-- 				<select id="selectPageLength"> -->
<%-- 					<option value="10" ${result.notice.pageLength == 10 ? 'selected="selected"' : '' }>10개씩</option> --%>
<%-- 					<option value="20" ${result.notice.pageLength == 20 ? 'selected="selected"' : '' }>20개씩</option> --%>
<%-- 					<option value="50" ${result.notice.pageLength == 50 ? 'selected="selected"' : '' }>50개씩</option> --%>
<%-- 					<option value="100" ${result.notice.pageLength == 100 ? 'selected="selected"' : '' }>100개씩</option> --%>
<!-- 				</select> -->
<!-- 				<form id="searchForm" name="searchForm" method="post"> -->
<!-- 					<div> -->
<!-- 						<select id="selectSearchType"> -->
<%-- 							<option value="title" ${result.notice.searchType == 'title' ? 'selected="selected"' : '' }>제목</option> --%>
<%-- 							<option value="contents" ${result.notice.searchType == 'contents' ? 'selected="selected"' : '' }>내용</option> --%>
<%-- 							<option value="writer_uid" ${result.notice.searchType == 'writer_uid' ? 'selected="selected"' : '' }>작성자</option> --%>
<!-- 						</select> -->
<%-- 						<input id="inputSearchText" type="text" value="${result.notice.searchText }"> --%>
<!-- 						<input id="searchBtn" type="submit" value="검색"> -->
<!-- 					</div> -->
<!-- 				</form> -->
<!-- 			</div> -->
			
<%-- 			<form id="pageForm" name="pageForm" action="<c:url value='/notice/listNotice.do'/>" method="post"> --%>
<%-- 				<input type="hidden" id="pageNo" name="pageNo" value="${result.notice.pageNo }"/> --%>
<%-- 				<input type="hidden" id="searchType" name="searchType" value="${result.notice.searchType }"/> --%>
<%-- 				<input type="hidden" id="searchText" name="searchText" value="${result.notice.searchText }"/> --%>
<%-- 				<input type="hidden" id="pageLength" name="pageLength" value="${result.notice.pageLength }"/> --%>
<!-- 			</form> -->
			
<!-- 			<div id="detail-form" class="dialog-form" title="공지사항 상세보기"> -->
<!-- 				<div id="detailContainer"> -->
<!-- 					<div id="detailBoard"> -->
<!-- 						<input type="hidden" id="detailNoticeid" value=""> -->
<!-- 						<div id="detailTitle"> -->
<!-- 						    <h1 id="detailTitleText"></h1> -->
<!-- 						    <p id="detailWriterText" class="writer"></p> -->
<!-- 						    <p id="detailDateText" class="date"></p> -->
<!-- 					    </div> -->
<!-- 					    <p id="detailContentsText" class="contents"></p> -->
<!-- 				  	</div> -->
<!-- 		    		<a href="#" onclick="detailNotice(this.getAttribute('data-noticeid'))" data-noticeid="{noticeid}" id="prevlistButton" class="detailBtns">이전글</a> -->
<!-- 		    		<a href="#" onclick="detailNotice(this.getAttribute('data-noticeid'))" data-noticeid="{noticeid}" id="nextlistButton" class="detailBtns">다음글</a> -->
<!-- 			  	</div> -->
<!-- 			</div> -->
			
<!-- 		</div> -->

    
    <script>
	    $(document).ready(function() {
// 	    	$("#detail-form").dialog({
// 	            autoOpen: false,
// 	            height: 700,
// 	            width: 1200,
// 	            modal: true,
// 	            buttons: {
// 	            },
// 	            close: function() {
// 	            	detailTitleText.text("");
// 	            	detailWriterText.text("");
// 	            	detailDateText.text("");
// 	            	detailContentsText.text("");
// 	            	prevlistButton.css("display", "block");
// 					nextlistButton.css("display", "block");
// 	            }
// 	        });
	    });
	    
//         var detailNoticeid = $("#detailNoticeid"),
// 			detailTitleText = $("#detailTitleText"),
// 			detailWriterText = $("#detailWriterText"),
// 			detailDateText = $("#detailDateText"),
// 			detailContentsText = $("#detailContentsText"),
//         	prevlistButton = $("#prevlistButton"),
//         	nextlistButton = $("#nextlistButton");

        // 상세보기
// 	    function detailNotice(noticeid) {
// 			const param = {
// 					noticeid: noticeid,
// 					order: "recent"
// 			}
			
// 			fetch("<c:url value='/notice/detailNotice.do'/>", {
// 				method: "POST",
// 				headers: {
// 				    "Content-Type": "application/json; charset=UTF-8",
// 				},
// 				body: JSON.stringify(param),
// 			})
// 			.then((response) => response.json())
// 			.then((json) => {
// 				if (!json.status) {
// 					alert(json.message);
// 				} else {
// 					detailNoticeid.val(json.noticeid);
					
// 					if (json.fixed_yn == "Y") {
// 						detailTitleText.text("");
// 						const fixImg = new Image();
// 						fixImg.id = "fixedImg";
// 						fixImg.src = "<c:url value='/resources/images/fixed.png'/>";
// 						detailTitleText.append(fixImg);
// 						detailTitleText.append(document.createTextNode(" " + json.title));
// 					} else {
// 						detailTitleText.text(json.title);
// 					}
					
// 					detailWriterText.text(json.writer_uid);
// 					detailDateText.text(json.reg_date);
// 					if (json.reg_date != json.mod_date) detailDateText.append(" (수정시각 : " + json.mod_date + ") ");
// 					detailDateText.append(" 조회 " + json.view_count);
// 					detailContentsText.text(json.contents);

// 		        	prevlistButton.css("display", "block");
// 					nextlistButton.css("display", "block");
// 					prevlistButton.attr("data-noticeid", json.prevNoticeid);
// 					nextlistButton.attr("data-noticeid", json.nextNoticeid);
// 					if (json.first) prevlistButton.css("display", "none");
// 					if (json.last) nextlistButton.css("display", "none");
					
// 					$("#detail-form").dialog("open");
// 				}
// 			});
// 		}
		
    	// 더보기
//     	if (document.querySelector("#moreList") != null) {
// 	    	document.querySelector("#moreList").addEventListener("click", e => {
// 	    		e.preventDefault();
// 	    		var noticeid = 0;
	
// 	    		noticeid = document.querySelector("#noticeTbody > tr:last-child > td:nth-child(1)").innerText;
				
// 	    		const param = {
// 	    			noticeid: noticeid,
// 	    			searchType: document.querySelector("#pageForm > #searchType").value,
// 		    		searchText: document.querySelector("#pageForm > #searchText").value,
// 		    		pageLength: document.querySelector("#pageForm > #pageLength").value,
// 		    		order: "recent"
// 	    		};
	    		
// 	    		fetch("<c:url value='/notice/moreListNotice.do'/>", {
// 					method: "POST",
// 					headers: {
// 					    "Content-Type": "application/json; charset=UTF-8",
// 					},
// 					body: JSON.stringify(param),
// 				})
// 				.then((response) => response.json())
// 				.then((json) => {
// 					const noticeList = json.noticeList;
// 					const noticeTemp = document.querySelector("#noticeTemp");
// 					const noticeListHTML = document.querySelector("#noticeTbody");
					
// 					for (let i = 0; i < noticeList.length; i++) {
// 						const notice = noticeList[i];
// 						const newNoticeItem = noticeTemp.cloneNode(true);
// 						const title = newNoticeItem.querySelector("#title");
						
// 						newNoticeItem.querySelector("#noticeidTemp").innerText = notice.noticeid;
						
// 						if (notice.fixed_yn == "Y") {
// 							const fixImg = new Image();
// 							fixImg.id = "fixedImg";
// 							fixImg.src = "<c:url value='/resources/images/fixed.png'/>";
// 							title.appendChild(fixImg);
// 							const titleText = document.createTextNode(" " + notice.title);
// 							title.appendChild(titleText);
// 						} else {
// 							title.innerText = notice.title;
// 						}
// 						title.setAttribute("data-noticeid", notice.noticeid);
						
// 						newNoticeItem.querySelector("#writer_uid").innerText = notice.writer_uid;
// 						newNoticeItem.querySelector("#reg_date").innerText = notice.reg_date;
// 						newNoticeItem.querySelector("#view_count").innerText = notice.view_count;
						
// 						newNoticeItem.style.display = "";
// 						noticeListHTML.appendChild(newNoticeItem);
// 					}
// 				});
	    		
// 	    		return false;
//     		});	
//     	}
    	
    	// 검색
// 	    document.querySelector("#searchForm").addEventListener("submit", e => {
// 	    	e.preventDefault();

// 			document.querySelector("#searchType").value = document.querySelector("#selectSearchType").value;
// 	    	document.querySelector("#searchText").value = document.querySelector("#inputSearchText").value;
	    	
//     		document.querySelector("#pageNo").value = 1;

//     		document.querySelector("#pageForm").submit();
// 		});
    	
    	// 게시물 건수 변경
//     	var selectPageLength = document.querySelector("#selectPageLength");
//     	selectPageLength.addEventListener("change", e => {
//     		document.querySelector("#pageLength").value = selectPageLength.value;
//     		document.querySelector("#pageForm").submit();
//     	});
    
    	// 페이지 이동
//     	function goPage(pageNo) {
//     		document.querySelector("#pageForm > #pageNo").value = pageNo;
//     		document.querySelector("#pageForm").submit();
//     	}
    	
    </script>
    
</body>
</html>
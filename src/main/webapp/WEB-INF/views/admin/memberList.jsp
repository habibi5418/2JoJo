<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<style>
 .loading-overlay { 
 	position: fixed;   
  	top: 0;   
  	left: 0;   
  	width: 100%;   
  	height: 100%;   
  	background: rgba(255, 255, 255, 0.7);   
  	display: flex;   
  	justify-content: center;   
  	align-items: center;   
  	z-index: 9999;   
  }
</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>회원관리</title>

<!-- Custom fonts for this template -->
<link
	href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<c:url value='/resources/css/sb-admin-2.css'/>"
	rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.min.css'/>"
	rel="stylesheet">

<!-- 나이계산 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>

<!-- DataTables JS -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>



</head>

<body id="page-top">
<div class="loading-overlay" id="loadingOverlay">Loading...</div>
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="mainDashBoard">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-dog"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					DonDog <sup>2</sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- 상단 대시보드 부분 글씨  -->
			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="/admin/mainDashBoard"> <i class="fas fa-fw fa-tachometer-alt"></i>
					<span>Dashboard</span></a></li>
					
			<li class="nav-item active">
                <a class="nav-link" href="/">
                   <i class="fas fa-solid fa-solid fa-tag"></i>
                 <span>dondog</span></a>
            </li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Interface</div>

			<!-- 회원 데이터 관련 -->
			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed"
				href="memberData" data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span>회원관리</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Members:</h6>
						<a class="collapse-item" href="memberData">memberData</a> <a
							class="collapse-item" href="/admin/memberList">memberList</a>
						<!-- 회원 데이터 파트 나뉘는 부분 탭으로 처리하거나 페이지 추가  -->
					</div>
				</div></li>

			<!-- 산책 데이터 관련 -->
			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed"
				href="locationData" data-toggle="collapse"
				data-target="#collapseUtilities" aria-expanded="true"
				aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>산책</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Utilities:</h6>
						<a class="collapse-item" href="locationData">locationData</a> <a
							class="collapse-item" href="#">locationData2</a>
						<!-- 위치 데이터 파트 나뉘는 부분 탭으로 처리하거나 페이지 추가  -->
					</div>
				</div></li>


			<!-- 일단 사용하지 않을것 같은 부분 -->
			<!-- Divider -->
			<!--             <hr class="sidebar-divider"> -->

			<!-- Heading -->
			<!--             <div class="sidebar-heading"> -->
			<!--                 Addons -->
			<!--             </div> -->

			<!-- Nav Item - Pages Collapse Menu -->
			<!--             <li class="nav-item active"> -->
			<!--                 <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" -->
			<!--                     aria-controls="collapsePages"> -->
			<!--                     <i class="fas fa-fw fa-folder"></i> -->
			<!--                     <span>Pages</span> -->
			<!--                 </a> -->
			<!--                 <div id="collapsePages" class="collapse show" aria-labelledby="headingPages" -->
			<!--                     data-parent="#accordionSidebar"> -->
			<!--                     <div class="bg-white py-2 collapse-inner rounded"> -->
			<!--                         <h6 class="collapse-header">Login Screens:</h6> -->
			<!--                         <a class="collapse-item" href="login.html">Login</a> -->
			<!--                         <a class="collapse-item" href="register.html">Register</a> -->
			<!--                         <a class="collapse-item" href="forgot-password.html">Forgot Password</a> -->
			<!--                         <div class="collapse-divider"></div> -->
			<!--                         <h6 class="collapse-header">Other Pages:</h6> -->
			<!--                         <a class="collapse-item" href="404.html">404 Page</a> -->
			<!--                         <a class="collapse-item active" href="blank.html">Blank Page</a> -->
			<!--                     </div> -->
			<!--                 </div> -->
			<!--             </li> -->

			<!-- Nav Item - Charts -->
			<!--             <li class="nav-item"> -->
			<!--                 <a class="nav-link" href="charts.html"> -->
			<!--                     <i class="fas fa-fw fa-chart-area"></i> -->
			<!--                     <span>Charts</span></a> -->
			<!--             </li> -->

			<!-- Nav Item - Tables -->
			<!--             <li class="nav-item"> -->
			<!--                 <a class="nav-link" href="tables.html"> -->
			<!--                     <i class="fas fa-fw fa-table"></i> -->
			<!--                     <span>Tables</span></a> -->
			<!--             </li> -->

			<!--             Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!--             Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<form class="form-inline">
						<button id="sidebarToggleTop"
							class="btn btn-link d-md-none rounded-circle mr-3">
							<i class="fa fa-bars"></i>
						</button>
					</form>

					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
								<span class="badge badge-danger badge-counter">3+</span>
						</a> <!-- Dropdown - Alerts -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">Alerts Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 12, 2019</div>
										<span class="font-weight-bold">A new monthly report is
											ready to download!</span>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-success">
											<i class="fas fa-donate text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 7, 2019</div>
										$290.29 has been deposited into your account!
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-warning">
											<i class="fas fa-exclamation-triangle text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 2, 2019</div>
										Spending Alert: We've noticed unusually high spending for your
										account.
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Show All Alerts</a>
							</div></li>

						<!-- Nav Item - Messages -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
								<!-- Counter - Messages --> <span
								class="badge badge-danger badge-counter">7</span>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="messagesDropdown">
								<h6 class="dropdown-header">Message Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="<c:url value='/resources/img/undraw_profile_1.svg'/>"
											alt="...">
										<div class="status-indicator bg-success"></div>
									</div>
									<div class="font-weight-bold">
										<div class="text-truncate">Hi there! I am wondering if
											you can help me with a problem I've been having.</div>
										<div class="small text-gray-500">Emily Fowler · 58m</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="<c:url value='/resources/img/undraw_profile_2.svg'/>"
											alt="...">
										<div class="status-indicator"></div>
									</div>
									<div>
										<div class="text-truncate">I have the photos that you
											ordered last month, how would you like them sent to you?</div>
										<div class="small text-gray-500">Jae Chun · 1d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img
											class="<c:url value='/resources/img/undraw_profile_3.svg'/>"
											alt="...">
										<div class="status-indicator bg-warning"></div>
									</div>
									<div>
										<div class="text-truncate">Last month's report looks
											great, I am very happy with the progress so far, keep up the
											good work!</div>
										<div class="small text-gray-500">Morgan Alvarez · 2d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="...">
										<div class="status-indicator bg-success"></div>
									</div>
									<div>
										<div class="text-truncate">Am I a good boy? The reason I
											ask is because someone told me that people say this to all
											dogs, even if they aren't good...</div>
										<div class="small text-gray-500">Chicken the Dog · 2w</div>
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Read More Messages</a>
							</div></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 
							<span class="mr-2 d-none d-lg-inline text-gray-600 small"> 조철민 </span> 
							<img class="img-profile rounded-circle"	src="<c:url value='/resources/img/undraw_profile.svg'/>">

						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									Settings
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
									Activity Log
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">DonDog Tables</h1>
					<p class="mb-4">DonDog</p>

                   <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            
<!-- 							 검색폼 -->
<!--                             <form name="searchForm" id="searchForm" method="post" onsubmit="$boardTable.draw(); return false;">                         -->
<!-- 							   <div class="panel search-panel"> -->
<!-- 							       <div class="panel-body"> -->
<!-- 							           <div class="row"> -->
<!-- 							               <div class="col-md-11"> -->
<%-- 							                   <input class="form-control" placeholder="이름을 입력해주세요" type="text" id="searchKeyword" name="searchKeyword" value="${searchVO.searchKeyword}"> --%>
<!-- 							                </div> -->
<!-- 							                <div class="col-md-1"> -->
<!-- 							                    <input type="submit" class="btn btn-block btn-primary btnSearch" value="조회"/> -->
<!-- 							                </div> -->
<!-- 							            </div> -->
<!-- 							        </div> -->
<!-- 							    </div> -->
<!-- 							</form> -->
							
							
                                <table class="table table-bordered" id="memberTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox" id="check" name="selectedMember"	value="{email}" onclick="selectAllRows()"></th>
											<th>아이디</th>
											<th>이름</th>
											<th>주소</th>
											<th>나이</th>
											<th>성별</th>
											<th>등급</th>
											<th>가입일</th>
											<th>최근접속일</th>
											<th>신고접수</th>
											<th>블랙회원</th>
											<th>잠금회원</th>
											<th>탈퇴회원</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th><input type="checkbox" id="check" name="selectedMember"	value="{email}" onclick="selectAllRows()"></th>
                                            <th>아이디</th>
											<th>이름</th>
											<th>주소</th>
											<th>생일</th>
											<th>성별</th>
											<th>등급</th>
											<th>가입일</th>
											<th>최근접속일</th>
											<th>신고접수</th>
											<th>블랙회원</th>
											<th>잠금회원</th>
											<th>탈퇴회원</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
									  <c:forEach var="memberVO" items="${memberList}">
										<tr>
											<td><input type="checkbox" id="selectedMembers" name="selectedMembers" value="${memberVO.email}"></td>
											<td>${memberVO.email}</td>
											<td>${memberVO.mname}</td>
											<td>${memberVO.address}</td>
											<td>${memberVO.birth}</td>
											<td>${memberVO.gender}</td>
											<td>${memberVO.grade}</td>
											<td>${memberVO.joinDate}</td>
											<td>${memberVO.recentLog}</td>
											<td>
								                <select class="editable" onchange="updateCell(this, 'REPORTS', '${memberVO.email}')">
								                    <c:forEach items="${reportsOptions}" var="option">
								                        <option value="${option}" ${memberVO.reports eq option ? 'selected' : ''}>${option}</option>
								                    </c:forEach>
								                </select>
								            </td>
								            <td>
								                <select class="editable" onchange="updateCell(this, 'BLACK', '${memberVO.email}')">
								                    <c:forEach items="${blackOptions}" var="option">
								                        <option value="${option}" ${memberVO.black eq option ? 'selected' : ''}>${option}</option>
								                    </c:forEach>
								                </select>
								            </td>
								            <td>
								                <select class="editable" onchange="updateCell(this, 'ACCOUNT_LOCKEDS', '${memberVO.email}')">
								                    <c:forEach items="${accountLockedOptions}" var="option">
								                        <option value="${option}" ${memberVO.accountLocked eq option ? 'selected' : ''}>${option}</option>
								                    </c:forEach>
								                </select>
								            </td>
								            <td>
								                <select class="editable" onchange="updateCell(this, 'CANCELS', '${memberVO.email}')">
								                    <c:forEach items="${cancelsOptions}" var="option">
								                        <option value="${option}" ${memberVO.cancels eq option ? 'selected' : ''}>${option}</option>
								                    </c:forEach>
								                </select>
								            </td>
										</tr>
									</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

			<!--             Footer -->
			<!--             <footer class="sticky-footer bg-white"> -->
			<!--                 <div class="container my-auto"> -->
			<!--                     <div class="copyright text-center my-auto"> -->
			<!--                         <span>Copyright &copy; Your Website 2020</span> -->
			<!--                     </div> -->
			<!--                 </div> -->
			<!--             </footer> -->
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
	<script
		src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

	<!-- Custom scripts for all pages-->
	<script src="<c:url value='/resources/js/sb-admin-2.min.js'/>"></script>

	<!-- Page level plugins -->
	<script
		src="<c:url value='/resources/vendor/datatables/jquery.dataTables.min.js'/>"></script>
	<script
		src="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.min.js'/>"></script>
	<!-- Page level custom scripts -->
	<script src="<c:url value='/resources/js/demo/datatables-demo.js'/>"></script>
	<script type="text/javascript">
	
	/* =============로딩중====================  */
	function hideLoadingMessage() {
	    document.getElementById("loadingOverlay").style.display = "none";
	}
	
	function showPage() {
		  document.getElementById("loader").style.display = "none";
		  document.getElementById("myDiv").style.display = "block";
		}
	/*==============로딩중 끝================  */
	
		jQuery(function($){
	        $("#memberTable").DataTable();
	        hideLoadingMessage(); // 로딩 메시지 숨기기
	    });
	
		

	
// 	var $memberTable = $('.memberTable').DataTable({	
// 	$("#memberTable").DataTable({
// 	    "processing": true,
// 	    "serverSide": true,
// 	    "pagingType": "full_numbers",
// 	    "ajax": {
// 	        "url": "<c:url value='/admin/listJSON'/>",
// 	        "type": "POST",
// 	        "data": function (d) {
// 	            //추가 검색인자 설정
// 	            d.searchKeyword = $("#searchKeyword").val();
// 	        },
// 	        "success": function (data) {
// 	            console.log("AJAX Success:", data);
// 	            // 여기에 추가 동작을 추가하십시오.
// 	        },
// 	        "error": function (xhr, status, error) {
// 	            console.error("AJAX Error:", status, error);
// 	            console.log(xhr.status);
// 	            alert("AJAX Error: " + status);
// 	        }
// 	    },
// 	    "select":  {style: 'single'},
// 	    "columnDefs": [{
// 	        "targets": 1,
// 	        "render": function ( data, type, row, meta ) {
// 	            return '<a onclick="jsUpdate(\''+data+'\')">'+data+'</a>';
// 	        }
// 	    }]
// 	});
	
// 	// DataTable 초기화 후 호출되는 이벤트
// 	$memberTable.on('init.dt', function () {
// 	    hideLoadingMessage(); // 로딩 메시지 숨기기
// 	});


// 	function jsUpdate(id) {
// 		alert(id);
// 	}
		
// 		부분 페이지 로딩
// 		var $dataTable = $('.dataTable').DataTable({
// 		    "processing": true,
// 		    "serverSide": true,
// 		    "searching": false,
// 		    "pagingType": "full_numbers",
// 		    "ajax": {
// 		        "url": "<c:url value='/admin/listJSON.do'/>",
// 		        "type": "POST",
// 		        "data": function ( d ) {
// 		        	//추가 검색인자 설정
// 		            d.searchKeyword = $("#searchKeyword").val();
// 		        }
// 		    },
// 		    "select":  {style: 'single'},
// 		    "columnDefs": [{
// 		        "targets": 1,
// 		        "render": function ( data, type, row, meta ) {
// 		          return '<a onclick="jsUpdate(\''+data+'\')">'+data+'</a>';
// 		        }
// 		      }]                
// 		});
		
		
		

		// 체크박스 전체선택
		function selectAllRows() {
		    var selectAllCheckbox = document.getElementById('check');
		    if (selectAllCheckbox) {
		        var checkboxes = document.getElementsByName('selectedMembers');
		        for (var i = 0; i < checkboxes.length; i++) {
		            checkboxes[i].checked = selectAllCheckbox.checked;
		        }
		    }
		}
	
	
		// 회원관리 업데이트
		function updateCell(selectElement, fieldName, email) {
		    var newValue = selectElement.value;
	
		    // Ajax를 사용하여 서버에 업데이트를 전송합니다.
		    // 예: jQuery Ajax 사용 예시
			$.ajax({
			    url: '/admin/updateMember',
			    type: 'POST',
			    contentType: 'application/json',
			    data: JSON.stringify({ email: email, field: fieldName, value: newValue }),
		        success: function(response) {
		        	console.log('서버 응답:', response);
		            // 서버에서 성공적으로 응답을 받았을 때 클라이언트 측에서 표시를 업데이트합니다.
		            if (response.success) {
		            	alert("정보가 변경되었습니다");
// 		                var updatedBlackValue = response.updatedBlack; // 이 부분을 서버에서 전송한 필드명에 맞게 수정
// 		                console.log('새로운 black 값:', updatedBlackValue);
		            	
		                // 셀의 내용을 새 값으로 업데이트합니다.
// 		                selectElement.parentNode.querySelector('option[selected]').removeAttribute('selected');
// 						selectElement.querySelector('option[value="' + response.updatedValue + '"]').setAttribute('selected', 'selected');
// 		                selectElement.parentNode.innerText = newValue;
// 		                updateDropdownMenus(response.updatedValue);
		            } else {
		            	console.log('업데이트 실패: ' + response.message);
		            }
		        },
		        error: function() {
		            alert('서버 오류');
			        }
			    });
			}
		

		
// 		// 드랍박스 관련 스크립트 작동X
// 		function updateDropdownMenus(updatedValue) {
// 		    updateDropdownMenu('REPORTS', updatedValue);
// 		    updateDropdownMenu('BLACK', updatedValue);
// 		    updateDropdownMenu('ACCOUNT_LOCKEDS', updatedValue);
// 		    updateDropdownMenu('CANCELS', updatedValue);
// 		}

// 		 // 필드에 따른 옵션 매핑
// 		  var fieldOptions = {
// 		    reports: ["0", "1", "2", "3", "4", "5"],
// 		    black: ["Y", "N"],
// 		    accountLocked: ["Y", "N"],
// 		    cancels: ["Y", "N"]
// 		  };

// 		  // 드롭다운 메뉴 업데이트 함수
// 		  function updateDropdownMenu(menuClassName, fieldName, updatedValue) {
// 		    var dropdownParent = document.querySelector('.table-responsive .' + menuClassName + '-dropdown-parent');

// 		    if (dropdownParent) {
// 		      dropdownParent.innerHTML = '';
// 		   // dropdownParent 확인
// 		      console.log('dropdownParent:', dropdownParent);

// 		      // 기존의 드롭다운 메뉴를 제거하는 로그
// 		      console.log('기존의 드롭다운 메뉴를 제거합니다.');
		      
// 		      var newDropdownMenu = document.createElement('select');
// 		      newDropdownMenu.className = 'editable ' + menuClassName + '-dropdown';

// 		      var options = fieldOptions[fieldName];

// 		      for (var i = 0; i < options.length; i++) {
// 		        var option = document.createElement('option');
// 		        option.value = options[i];
// 		        option.innerText = options[i];

// 		        if (options[i] === updatedValue) {
// 		          option.selected = true;
// 		        }

// 		        newDropdownMenu.appendChild(option);
// 		      }

// 		      dropdownParent.appendChild(newDropdownMenu);
// 		    }
// 		  }


// 		/*나이계산  */
// 	  $(document).ready(function() {
//     // 각 행에 대해 나이를 계산하여 "나이" 열에 추가
//     $("table#memberTable tbody tr").each(function() {
//       var birthDateString = $(this).find("td:eq(4)").text(); // 4번째 열이 생년월일 열
//       var age = calculateAge(birthDateString);
//       $(this).find("td:eq(4)").text(age); // 4번째 열을 "나이"로 변경
//     });

//     // 생년월일 문자열을 받아서 나이를 계산하는 함수
//     function calculateAge(birthDateString) {
//       var birthDate = new Date(birthDateString.replace(/(\d{2})(\d{2})(\d{2})/, "$1-$2-$3"));
//       var currentDate = new Date();
//       var age = currentDate.getFullYear() - birthDate.getFullYear();

//       // 생일이 지났는지 체크
//       if (
//         currentDate.getMonth() < birthDate.getMonth() ||
//         (currentDate.getMonth() === birthDate.getMonth() &&
//           currentDate.getDate() < birthDate.getDate())
//       ) {
//         age--;
//       }

//       return age;
//     }
//   });
	
//   $(document).ready(function() {
//     // 페이지 로드시 실행
//     calculateAndDisplayAge();

//     // 페이징 변경될 때마다 실행
//     $('#memberTable').on('page.dt', function() {
//       calculateAndDisplayAge();
//     });

//     // 생년월일 문자열을 받아서 나이를 계산하는 함수
//     function calculateAge(birthDateString) {
//       var birthDate = new Date(birthDateString.replace(/(\d{2})(\d{2})(\d{2})/, "$1-$2-$3"));
//       var currentDate = new Date();
//       var age = currentDate.getFullYear() - birthDate.getFullYear();

//       // 생일이 지났는지 체크
//       if (
//         currentDate.getMonth() < birthDate.getMonth() ||
//         (currentDate.getMonth() === birthDate.getMonth() &&
//           currentDate.getDate() < birthDate.getDate())
//       ) {
//         age--;
//       }

//       return age;
//     }

//     // 각 행에 대해 나이를 계산하여 "나이" 열에 추가
//     function calculateAndDisplayAge() {
//       $("table#memberTable tbody tr").each(function() {
//         var birthDateString = $(this).find("td:eq(4)").text(); // 4번째 열이 생년월일 열
//         var age = calculateAge(birthDateString);
//         $(this).find("td:eq(4)").text(age); // 4번째 열을 "나이"로 변경
//       });
//     }
//   });		

		
	</script>

</body>

</html>
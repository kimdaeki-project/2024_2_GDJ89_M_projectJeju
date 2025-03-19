<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
</head>
<body>
	<!-- header -->
	<header class="mb-5">
		<c:import url="/WEB-INF/views/templates/header.jsp"></c:import>
	</header>


	<!-- body -->
	<div class="container-fluid my-5">
		<div class="row col-md-6 offset-md-3">
			<!-- contents 내용 작성 -->
			<div class="row mt-5">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
						data-bs-target="#home-tab-pane" type="button" role="tab"
						aria-controls="home-tab-pane" aria-selected="true">항공편</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
						data-bs-target="#profile-tab-pane" type="button" role="tab"
						aria-controls="profile-tab-pane" aria-selected="false">숙소</button>
				</li>
			</ul>
			<form id="searchfrm">
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home-tab-pane"
						role="tabpanel" aria-labelledby="home-tab" tabindex="0">
						<div class="input-group mb-3">
							<label class="input-group-text" for="select01">출발지</label>
							<select class="form-select" id="select01">
	
							</select>
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text">가는 날</span>
							<input type="date" id="date_go" class="form-control">
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text">오는 날</span>
							<input type="date" id="date_come" class="form-control">
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-sm">인원</span>
							<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" id="psn">
						</div>
						<div>
							<button class="btn btn-primary" type="button" id="btnSearch">검색</button>
						</div>
					</div>
					<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel"
						aria-labelledby="profile-tab" tabindex="0">...</div>
				</div>
			</form>
			</div>




		</div>
	</div>




	<!-- footer -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>

	<script src="/resources/js/search.js"></script>
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
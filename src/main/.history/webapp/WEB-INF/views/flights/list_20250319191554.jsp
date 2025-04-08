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
	<c:import url="/WEB-INF/views/templates/header.jsp"></c:import>

	
	<!-- body -->
	<div class="container-fluid my-5">
		<div class="row col-md-8 offset-md-2">
			<!-- contents 내용 작성 -->
			<div class="container text-center mt-5">
				<div class="list-group list-group-horizontal">
					<a class="list-group-item list-group-item-action" data-bs-toggle="list" id="list-1-list">list group item</li>
					<a class="list-group-item list-group-item-action" data-bs-toggle="list" id="list-2-list">list group item</li>
					<a class="list-group-item list-group-item-action" data-bs-toggle="list" id="list-3-list">list group item</li>
					<a class="list-group-item list-group-item-action active" data-bs-toggle="list" id="list-4-list">list group item</li>
					<a class="list-group-item list-group-item-action" data-bs-toggle="list" id="list-5-list">list group item</li>
					<a class="list-group-item list-group-item-action" data-bs-toggle="list" id="list-6-list">list group item</li>
					<a class="list-group-item list-group-item-action" data-bs-toggle="list" id="list-7-list">list group item</li>
				</div>
				<div class="col-8">
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade" id="list-1" role="tabpanel" aria-labelledby="list-profile-list">...</div>
						<div class="tab-pane fade" id="list-2" role="tabpanel" aria-labelledby="list-messages-list">...</div>
						<div class="tab-pane fade" id="list-3" role="tabpanel" aria-labelledby="list-settings-list">...</div>
						<div class="tab-pane fade show active" id="list-4" role="tabpanel" aria-labelledby="list-home-list">...</div>
						<div class="tab-pane fade" id="list-5" role="tabpanel" aria-labelledby="list-profile-list">...</div>
						<div class="tab-pane fade" id="list-6" role="tabpanel" aria-labelledby="list-messages-list">...</div>
						<div class="tab-pane fade" id="list-7" role="tabpanel" aria-labelledby="list-settings-list">...</div>
					</div>
				</div>
			</div>
			
			
			
		</div>
	</div>




	<!-- footer -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>

	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
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
			
			<div class="input-group mb-3 mt-5" style="width: 30%;">
				<label class="input-group-text" for="depAirportId">출발지</label>
				<select	class="form-select" id="depAirportId" name="depAirportId">
					
				</select>
			</div>
			 
			<div class="container text-center" id="selectBox">
				<div class="list-group list-group-horizontal">
					<a class="list-group-item list-group-item-action active" data-bs-toggle="list" id="list-1-list" role="tab" href="#list-1"></li>
					<a class="list-group-item list-group-item-action" data-bs-toggle="list" id="list-2-list" role="tab" href="#list-2"></li>
					<a class="list-group-item list-group-item-action" data-bs-toggle="list" id="list-3-list" role="tab" href="#list-3"></li>
					<a class="list-group-item list-group-item-action" data-bs-toggle="list" id="list-4-list" role="tab" href="#list-4"></li>
					<a class="list-group-item list-group-item-action" data-bs-toggle="list" id="list-5-list" role="tab" href="#list-5"></li>
					<a class="list-group-item list-group-item-action" data-bs-toggle="list" id="list-6-list" role="tab" href="#list-6"></li>
					<a class="list-group-item list-group-item-action" data-bs-toggle="list" id="list-7-list" role="tab" href="#list-7"></li>
				</div>
				
				<div class="">
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="list-1" role="tabpanel"><div></div></div>
						<div class="tab-pane fade" id="list-2" role="tabpanel"><div></div></div>
						<div class="tab-pane fade" id="list-3" role="tabpanel"><div></div></div>
						<div class="tab-pane fade" id="list-4" role="tabpanel"><div></div></div>
						<div class="tab-pane fade" id="list-5" role="tabpanel"><div></div></div>
						<div class="tab-pane fade" id="list-6" role="tabpanel"><div></div></div>
						<div class="tab-pane fade" id="list-7" role="tabpanel"><div></div></div>
					</div>
				</div>

				<nav aria-label="Page navigation example">
					<input type="hidden" name="page" id="pageNo">
					<input type="hidden" name="perPage" id="numOfRows">
					<input type="hidden" name="totalCount" id="totalCount">
					<ul class="pagination justify-content-center">
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</nav>
			</div>

		
			
		</div>
	</div>




	<!-- footer -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>

	<script src="/resources/js/flights/list.js"></script>
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
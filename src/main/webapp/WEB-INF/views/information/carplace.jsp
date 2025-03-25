<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
		<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/templates/header.jsp"></c:import>

	
	<!-- body -->
	<div style="margin-top: 100px;">
		<div class="row col-md-8 offset-md-2">
			<!-- contents 내용 작성 -->
				<div style="width: 100%;">
				<select id="select" class="form-select" aria-label="Default select example">
					<option selected>공항을 선택하세요.</option>
				</select>
				<div style="float: left; width: 50%; margin-top: 50px;">
					<div id="map" style="width:100%;height:700px;"></div>
				</div>
				<div style="display: inline-block; width: 50%; padding-left: 10px; margin-top: 50px;">
						<div class="card" style="width: 100%; height: 700px;">
							<div id="card" class="card-body">
							  <h2 id="airportNm" class="card-title">공항을 선택하세요.</h5><br id="br">
							  <h5 id="stat" class="card-text">상태 : </h5><br id="br">
							  <h5 id="per" class="card-text">혼잡률 : </h5><br id="br">
							  <h5 id="max" class="card-text">총 자리 수 : </h5><br id="br">
							  <h5 id="park" class="card-text">주차가능 자리 수 : </h5 id="br">
							</div>
						</div>
				</div>
			</div>	
			
			
			
			
		</div>
	</div>




	<!-- footer -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70d0be5a9ddf569996a9dad17ac2a5db&libraries=services"></script>
	<script src="/resources/js/park.js"></script>
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
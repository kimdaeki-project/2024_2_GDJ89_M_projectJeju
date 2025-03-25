<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
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
			 <form id="form">
				<div style="width: 100%;">
				<select id="select" class="form-select" aria-label="Default select example">
					<option selected>공항을 선택하세요.</option>
				  </select>
				<div style="float: left; width: 50%; margin-top: 50px;">
					<div id="map" style="width:100%;height:350px;"></div>
				</div>
				<div style="display: inline-block; width: 50%; padding-left: 10px; margin-top: 50px;">
					  <div class="item">
						<div class="image" style="margin-bottom: 20px;">
						  <img src="/resources/images/woojin/jejuchar.png" style="width: 300px;">
						</div>
						<div class="content">
						  <div class="description">
						  </div>
						</div>
					  </div>
				</div>
			</div>	
			 </form>
			
			
			
			
		</div>
	</div>




	<!-- footer -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70d0be5a9ddf569996a9dad17ac2a5db&libraries=services"></script>
	<script src="/resources/js/park.js"></script>
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
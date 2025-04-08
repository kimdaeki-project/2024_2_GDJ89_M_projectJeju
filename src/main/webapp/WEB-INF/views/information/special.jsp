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
	<div style="margin-top: 100px; margin-bottom: 10px;">
		<div class="row col-md-8 offset-md-2">
			<!-- contents 내용 작성 -->
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
				  <li class="breadcrumb-item"><a href="/">메인화면</a></li>
				  <li class="breadcrumb-item active" aria-current="page">제주, 어떤 곳일까?</li>
				  <li class="breadcrumb-item active" aria-current="page">제주 특산물</li>
				</ol>
			  </nav>
			<h1>제주 특산물</h1>
		</div>
	</div>
		
	<div style="width: 100%;">
		<div style="float: left; width: 15%;">
			<ul class="list-group list-group-flush" style="width: 175px; font-size: small;">
				<a href="/information/mark"><li class="list-group-item">심볼마크</li></a>
				<a href="/information/char"><li class="list-group-item">캐릭터</li></a>
				<a href="/information/location"><li class="list-group-item">지역 정보</li></a>
				<a href="/information/special"><li class="list-group-item">제주 특산물</li></a>
	 		 </ul>
		</div>
		<div style="display: inline-block; width: 70%; padding-left: 10px;">
			  <div class="item">
				<div class="accordion" id="accordionExample">
					<div class="accordion-item">
					  <h2 class="accordion-header">
						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						  봄
						</button>
					  </h2>
					  <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<div class="card" style="width: 13rem; display: inline-block;">
								<img src="/resources/images/woojin/flower.png" style="height: 180px;" class="card-img-top">
								<div class="card-body">
								  <h5 class="card-title">유채꽃</h5>
								</div>
							</div>
							<div class="card" style="width: 13rem; display: inline-block;">
								<img src="/resources/images/woojin/duduk.png" style="height: 180px;" class="card-img-top">
								<div class="card-body">
								  <h5 class="card-title">제주 더덕</h5>
								</div>
							</div>
							<div class="card" style="width: 13rem; display: inline-block;">
								<img src="/resources/images/woojin/sora.png" style="height: 180px;" class="card-img-top">
								<div class="card-body">
								  <h5 class="card-title">소라</h5>
								</div>
							</div>
						</div>
					  </div>
					</div>
					<div class="accordion-item">
					  <h2 class="accordion-header">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
						  여름
						</button>
					  </h2>
					  <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<div class="card" style="width: 13rem; display: inline-block;">
								<img src="/resources/images/woojin/orange.png" style="height: 180px;" class="card-img-top">
								<div class="card-body">
								  <h5 class="card-title">제주 감귤</h5>
								</div>
							</div>
							<div class="card" style="width: 13rem; display: inline-block;">
								<img src="/resources/images/woojin/fish.png" style="height: 180px;" class="card-img-top">
								<div class="card-body">
								  <h5 class="card-title">지리돔</h5>
								</div>
							</div>
							<div class="card" style="width: 13rem; display: inline-block;">
								<img src="/resources/images/woojin/hanrabong.png" style="height: 180px;" class="card-img-top">
								<div class="card-body">
								  <h5 class="card-title">한라봉</h5>
								</div>
							</div>
						</div>
					  </div>
					</div>
					<div class="accordion-item">
					  <h2 class="accordion-header">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
						  가을
						</button>
					  </h2>
					  <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<div class="card" style="width: 13rem; display: inline-block;">
								<img src="/resources/images/woojin/galchi.png" class="card-img-top">
								<div class="card-body">
								  <h5 class="card-title">제주 갈치</h5>
								</div>
							</div>
							<div class="card" style="width: 13rem; display: inline-block;">
								<img src="/resources/images/woojin/godeng.png" class="card-img-top">
								<div class="card-body">
								  <h5 class="card-title">고등어</h5>
								</div>
							</div>
							<div class="card" style="width: 13rem; display: inline-block;">
								<img src="/resources/images/woojin/junbok.png" class="card-img-top">
								<div class="card-body">
								  <h5 class="card-title">전복</h5>
								</div>
							</div>
						</div>
					  </div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header">
						  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
							겨울
						  </button>
						</h2>
						<div id="collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
						  <div class="accordion-body">
							<div class="card" style="width: 13rem; display: inline-block;">
								<img src="/resources/images/woojin/nood.png" class="card-img-top">
								<div class="card-body">
								  <h5 class="card-title">돔베 고기국수</h5>
								</div>
							</div><div class="card" style="width: 13rem; display: inline-block;">
								<img src="/resources/images/woojin/bang.png" class="card-img-top">
								<div class="card-body">
								  <h5 class="card-title">제주 방어</h5>
								</div>
							</div><div class="card" style="width: 13rem; display: inline-block;">
								<img src="/resources/images/woojin/shirimp.png" class="card-img-top">
								<div class="card-body">
								  <h5 class="card-title">딱새우</h5>
								</div>
							</div>
						  </div>
						</div>
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
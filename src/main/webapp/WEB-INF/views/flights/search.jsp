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
			 <form id="searchForm">
				 <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
					 <li class="nav-item" role="presentation">
						 <button class="nav-link active" id="pills-flights-tab" data-bs-toggle="pill" data-bs-target="#pills-flights" type="button" role="tab" aria-controls="pills-flights" aria-selected="true">항공권 예매</button>
						</li>
					</ul>
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="pills-flights" role="tabpanel" aria-labelledby="pills-flights-tab" tabindex="0">
							
							<div class="input-group mb-1 mt-1" style="width: 30%;">
								<label class="input-group-text" for="depAirportId">출발지</label>
							<select	class="form-select" id="depAirportId" name="depAirportId">
								
							</select>
						</div>
						
						<div class="row">
							<div class="col">
								<div class="input-group mb-1 mt-1" style="width: 80%;">
									<label class="input-group-text" for="depPlandTime">가는 날</label>
									<input type="date" class="form-control" id="depPlandTime" name="depPlandTime">
								</div>
							</div>
							<div class="col">
								<div class="input-group mb-1 mt-1" style="width: 80%;">
									<label class="input-group-text" for="depPlandTimeToCome">오는 날</label>
									<input type="date" class="form-control" id="depPlandTimeToCome" name="depPlandTimeToCome">
								</div>
							</div>
						</div>

						<p>
							<button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample" aria-expanded="false" aria-controls="collapseWidthExample">
						인원
					</button>
				</p>
				<div style="min-height: 120px;">
					<div class="collapse" id="collapseWidthExample">
						<div class="card card-body" style="width: 1150px;">
							
							<div class="layer-header">
								<button type="button" class="btn-close" aria-label="Close" style="float: right;"></button>
								<h2 class="customer-layer__title">누구와 함께 떠나세요?</h2>
							</div>
							
							<hr class="section-spacer">

							<div class="row" id="person">
								<div class="col">
									<div>
										<div style="float: inline-end;">
											<button class="btn decrease" type="button">
												<i class="bi bi-dash-lg" style="font-size: 1.2rem; "></i>
											</button>
											<input type="text" style="width: 20px;" value="1" data-max="9" data-min="0" id="adult" name="adult">
											<button class="btn increase" type="button">
												<i class="bi bi-plus-lg" style="font-size: 1.2rem;"></i>
											</button>
										</div>
										<h6 style="font-weight: bolder;">성인</h6>
										<p class="text__small text--color-gray" id="adtMsg">13세 이상</p>
									</div>
								</div>
								<div class="col">
									<div>
										<div style="float: inline-end;">
											<button class="btn decrease" type="button">
												<i class="bi bi-dash-lg" style="font-size: 1.2rem;"></i>
											</button>
											<input type="text" style="width: 20px;" value="0" data-max="9" data-min="0" id="child" name="child">
											<button class="btn increase" type="button">
												<i class="bi bi-plus-lg" style="font-size: 1.2rem;"></i>
											</button>
										</div>
										<h6 style="font-weight: bolder;">유아</h6>
										<p class="text__small text--color-gray" name="chdMsg">국내선 기준 만 2세~13세 미만<br>(최종 탑승일 기준)</p>
									</div>
								</div>
								<div class="col">
									<div>
										<div style="float: inline-end;">
											<button class="btn decrease" type="button">
												<i class="bi bi-dash-lg" style="font-size: 1.2rem;"></i>
											</button>
											<input type="text" style="width: 20px;" value="0" data-max="9" data-min="0" id="infant" name="infant">
											<button class="btn increase" type="button">
												<i class="bi bi-plus-lg" style="font-size: 1.2rem;"></i>
											</button>
										</div>
										<h6 style="font-weight: bolder;">소아</h6>
										<p class="text__small text--color-gray" name="infantDesc">생후 7일 이상~만 2세 미만<br>(만 24개월 미만/최종 탑승일 기준)<br>유아의 여정이 동반 성인과 일치하지 않으면 환불 후 재구매해야 합니다.</p>
									</div>
								</div>
							</div>
							
							<hr class="section-spacer">
							
							<div>
								<button type="button" style="float: inline-end;" class="btn btn-primary" id="flightSearch">검색하기</button>
							</div>
						</form>

						
							
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>




	<!-- footer -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>

	<script src="/resources/js/flights/search.js"></script>
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
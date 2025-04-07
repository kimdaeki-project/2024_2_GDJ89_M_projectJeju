<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
<script src="https://js.tosspayments.com/v2/standard"></script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/templates/header.jsp"></c:import>


	<!-- body -->
	<div style="margin-top: 100px;">
		<div class="row col-md-8 offset-md-2">
			<!-- contents 내용 작성 -->
			<div class="container">
				<main>
					<div class="py-5 text-center">
						
						<h2>탑승정보 입력</h2>
						<p class="lead">탑승 정보를 입력해주세요</p>
					</div>

					<div class="row g-5">
						<div class="col-md-5 col-lg-4 order-md-last">
							<h4
								class="d-flex justify-content-between align-items-center mb-3">
								<span class="text-primary">예상 결제금액</span>
								<span class="badge bg-primary rounded-pill"></span>
							</h4>
							<ul class="list-group mb-3">
								<li class="list-group-item d-flex justify-content-between lh-sm">
									<div>
										<h6 class="my-0">성인</h6>
										<small class="text-body-secondary" id="adult">${searchInfo.adult}</small>
									</div> <span class="text-body-secondary" id="adultCharge">${searchInfo.adult * flightGo.economyCharge + searchInfo.adult * flightCome.economyCharge}</span>
								</li>
								<li class="list-group-item d-flex justify-content-between lh-sm">
									<div>
										<h6 class="my-0">소아</h6>
										<small class="text-body-secondary" id="child">${searchInfo.child}</small>
									</div> <span class="text-body-secondary" id="childCharge">${searchInfo.child * flightGo.economyCharge + searchInfo.child * flightCome.economyCharge}</span>
								</li>
								<li class="list-group-item d-flex justify-content-between lh-sm">
									<div>
										<h6 class="my-0">유아</h6>
										<small class="text-body-secondary" id="infant">${searchInfo.infant}</small>
									</div> <span class="text-body-secondary">0</span>
								</li>
								<li class="list-group-item d-flex justify-content-between bg-body-tertiary">
									<div>
										<h6 class="my-0" id="addb"></h6>
										<small class="text-body-secondary"></small>
									</div> <span class="text-body-secondary" id="addbc"></span>
								</li>
								<li class="list-group-item d-flex justify-content-between">
									<span>합계 (원)</span> <strong id="chargeAmount">${searchInfo.adult * flightGo.economyCharge + searchInfo.adult * flightCome.economyCharge + searchInfo.child * flightGo.economyCharge + searchInfo.child * flightCome.economyCharge}</strong>
								</li>
							</ul>

							<form class="card p-2">
								<div class="input-group">
									<button type="button" id="getBusiness" class="btn btn-secondary">비즈니스석 업그레이드</button>
								</div>
							</form>
						</div>

						<div class="col-md-7 col-lg-8">
							<div class="row">
								<div class="col-6">
									<h4 class="mb-3">탑승객 정보</h4>
								</div>
							</div>

								<form class="needs-validation" novalidate="">
									<div class="row g-3" id="infos">
									
								<c:forEach begin="1" end="${searchInfo.adult }" step="1" var="i">
									<div style="border: solid; border-color: rgb(122, 122, 122); border-radius: 5%;">
										<h5>성인${i }</h5>
										<div class="col-sm-6">
											<label for="lastName" class="form-label">이름</label>
											<input type="text" class="form-control adultName ip" id="name" placeholder="" value="" required="">
											<div class="invalid-feedback"></div>
										</div>
	
										<div class="col-12">
											<label for="email" class="form-label">생년월일</label>
											<input type="email" class="form-control adultBirth ip" id="birth" placeholder="(YYYYMMDD 예, 20000101)">
											<div class="invalid-feedback"></div>
										</div>
									</div>										
								</c:forEach>
								<c:forEach begin="1" end="${searchInfo.child }" step="1" var="i">
									<div style="border: solid; border-color: rgb(122, 122, 122); border-radius: 5%;">
										<h5>소아${i }</h5>
										<div class="col-sm-6">
											<label for="lastName" class="form-label">이름</label>
											<input type="text" class="form-control childName ip" id="name" placeholder="" value="" required="">
											<div class="invalid-feedback"></div>
										</div>
	
										<div class="col-12">
											<label for="email" class="form-label">생년월일</label>
											<input type="email" class="form-control childBirth ip" id="birth" placeholder="(YYYYMMDD 예, 20000101)">
											<div class="invalid-feedback"></div>
										</div>
									</div>										
								</c:forEach>
								<c:forEach begin="1" end="${searchInfo.infant }" step="1" var="i">
									<div style="border: solid; border-color: rgb(122, 122, 122); border-radius: 5%;">
										<h5>유아${i }</h5>
										<div class="col-sm-6">
											<label for="lastName" class="form-label">이름</label>
											<input type="text" class="form-control infantName ip" id="name" placeholder="" value="" required="">
											<div class="invalid-feedback"></div>
										</div>
	
										<div class="col-12">
											<label for="email" class="form-label">생년월일</label>
											<input type="email" class="form-control infantBirth ip" id="birth" placeholder="(YYYYMMDD 예, 20000101)">
											<div class="invalid-feedback"></div>
										</div>
									</div>										
								</c:forEach>
									
								<hr class="my-4">
								
								<div class="form-check">
									<input type="checkbox" class="form-check-input"	id="same-address">
									<label class="form-check-label"	for="same-address">반려동물 동반서비스 신청</label>
								</div>
								
								<hr class="my-4">
								
								<h4 class="mb-3">예약자 정보</h4>
										
								<div class="col-12">
									<label for="username" class="form-label">회원아이디</label>
									<div class="input-group has-validation">
										<input type="text" class="form-control" id="username" placeholder="Username" required="">
										<div class="invalid-feedback">아이디를 입력하세요</div>
									</div>
								</div>
								
								<div class="col-12">
									<label for="email" class="form-label">Email <span
										class="text-body-secondary">(Optional)</span></label>
										<input type="email" class="form-control" id="email" placeholder="(예, you@example.com)">
										<div class="invalid-feedback">이메일을 입력하세요</div>
									</div>
									
									<div class="col-md-5">
										<label for="tel" class="form-label"></label>
										<select class="form-select" id="tel" required="">
										<option value="">통신사</option>
										<option>SKT</option>
										<option>KT</option>
										<option>LGU</option>
										</select>
										<div class="invalid-feedback">통신사를 선택해주세요</div>
									</div>
									
									<div class="col-md-7">
										<label for="phone" class="form-label">휴대전화번호</label>
										<input type="text" class="form-control" id="phone" placeholder="'-'없이 입력 (예, 01012345678)"	required="">
										<div class="invalid-feedback">전화번호를 입력하세요</div>
									</div>

									<div class="col-md-4 mt-2 offset-md-4 align-self-end">
										<button class="btn btn-primary" id="userCheck" type="button">회원정보 확인</button>
									</div>
								</div>

								<hr class="my-4">

								<button class="w-100 btn btn-primary btn-lg" id="payments" type="button" data-bs-toggle="modal" data-bs-target="#modalView">결제창으로 이동</button>
									<!-- Modal -->
								<div class="modal fade" id="modalView" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title fs-5" id="exampleModalLabel">결제방식 선택</h1>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<div class="row my-4">
													<div class="col-12">
														<div class="row">
															<div class="col-6">
																<button type="button" class="btn btn-primary" style="width: 80%;" id="cardPay">카드결제</button>
															</div>
															<div class="col-6">
																<button type="button" class="btn btn-primary" style="width: 80%;" id="phonePay">휴대폰 결제</button>
															</div>
														</div>
													</div>
												</div>
												<div class="row my-4">
													<div class="col-12">
														<div class="row">
															<div class="col-6" style="justify-content: center;">
																<button type="button" class="btn btn-primary" style="width: 80%;" id="fakeAccount">가상계좌</button>
															</div>
															<div class="col-6">
																<button type="button" class="btn btn-primary" style="width: 80%;" id="realAccount">계좌이체</button>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="modal-footer">
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</main>

		</div>
	</div>



	<script src="/resources/js/reservation/info.js"></script>
	<!-- footer -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>

	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
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
								<span class="text-primary">Your cart</span> <span
									class="badge bg-primary rounded-pill">3</span>
							</h4>
							<ul class="list-group mb-3">
								<li class="list-group-item d-flex justify-content-between lh-sm">
									<div>
										<h6 class="my-0">Product name</h6>
										<small class="text-body-secondary">Brief description</small>
									</div> <span class="text-body-secondary">$12</span>
								</li>
								<li class="list-group-item d-flex justify-content-between lh-sm">
									<div>
										<h6 class="my-0">Second product</h6>
										<small class="text-body-secondary">Brief description</small>
									</div> <span class="text-body-secondary">$8</span>
								</li>
								<li class="list-group-item d-flex justify-content-between lh-sm">
									<div>
										<h6 class="my-0">Third item</h6>
										<small class="text-body-secondary">Brief description</small>
									</div> <span class="text-body-secondary">$5</span>
								</li>
								<li
									class="list-group-item d-flex justify-content-between bg-body-tertiary">
									<div class="text-success">
										<h6 class="my-0">Promo code</h6>
										<small>EXAMPLECODE</small>
									</div> <span class="text-success">−$5</span>
								</li>
								<li class="list-group-item d-flex justify-content-between">
									<span>Total (USD)</span> <strong>$20</strong>
								</li>
							</ul>

							<form class="card p-2">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Promo code">
									<button type="submit" class="btn btn-secondary">Redeem</button>
								</div>
							</form>
						</div>

						<div class="col-md-7 col-lg-8">
							<div class="row">
								<div class="col-6">
									<h4 class="mb-3">탑승객 정보</h4>
								</div>
								<div class="col-6">
									<button class="btn btn-info" id="addPerson">탑승객 추가</button>
								</div>
							</div>

								<form class="needs-validation" novalidate="">
									<div class="row g-3" id="infos">

										<div class="col-sm-6">
											<label for="firstName" class="form-label">성</label>
											<input type="text" class="form-control" id="firstName" placeholder="" value="" required="">
											<div class="invalid-feedback"></div>
										</div>
	
										<div class="col-sm-6">
											<label for="lastName" class="form-label">이름</label>
											<input type="text" class="form-control" id="lastName" placeholder="" value="" required="">
											<div class="invalid-feedback"></div>
										</div>
	
										<div class="col-12">
											<label for="email" class="form-label">생년월일</label>
											<input type="email" class="form-control" id="birth" placeholder="(YYYYMMDD 예, 20000101)">
											<div class="invalid-feedback">생년월일을 입력하세요</div>
										</div>
										
										<hr class="my-4">
										
										<div class="form-check">
											<input type="checkbox" class="form-check-input"
											id="same-address"> <label class="form-check-label"
											for="same-address">반려동물 동반서비스 신청</label>
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
										class="text-body-secondary">(Optional)</span></label> <input
										type="email" class="form-control" id="email"
										placeholder="(예, you@example.com)">
										<div class="invalid-feedback">이메일을 입력하세요</div>
									</div>
									
									<div class="col-md-3">
										<label for="tel" class="form-label"></label> <select
										class="form-select" id="tel" required="">
										<option value="">통신사</option>
										<option>SKT</option>
										<option>KT</option>
										<option>LGU</option>
									</select>
									<div class="invalid-feedback">통신사를 선택해주세요</div>
									</div>
									
										<div class="col-md-9">
											<label for="phone" class="form-label">휴대전화번호</label> <input
											type="text" class="form-control" id="phone" placeholder="'-'없이 입력 (예, 01012345678)"
											required="">
											<div class="invalid-feedback">전화번호를 입력하세요</div>
									</div>
								</div>

								<hr class="my-4">

								<button class="w-100 btn btn-primary btn-lg" type="submit">Continue
									to checkout</button>
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
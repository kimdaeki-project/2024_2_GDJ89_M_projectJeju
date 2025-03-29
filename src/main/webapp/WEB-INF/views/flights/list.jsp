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
			<form id="reForm">
				<div class="row">
					<div class="col">
						<div class="input-group mb-3 mt-5" style="width: 80%;">
							<label class="input-group-text" for="airportId">출발지</label>
							<select	class="form-select" id="airportId" name="airportId">
								<option selected value="${airportId}">출발 공항 선택</option>
							</select>
						</div>
					</div>
					<div class="col">
						<div class="input-group mb-3 mt-5" style="width: 80%;">
							<label class="input-group-text" for="airlineNm">여행사</label>
							<select	class="form-select" id="airlineNm" name="airlineNm">
								<option selected>항공사별 조회</option>
							</select>
						</div>
					</div>
				</div>
				
				<div class="container text-center" id="selectBox">
					<div class="list-group list-group-horizontal">
						<a class="list-group-item list-group-item-action" data-bs-toggle="list" id="list-1-list" role="tab" href="#list-1">
							<c:if test="${day.b3Day ge day.today }">${day.b3Day }</c:if>
						</a>
						<a class="list-group-item list-group-item-action" data-bs-toggle="list" id="list-2-list" role="tab" href="#list-2">
							<c:if test="${day.b2Day ge day.today }">${day.b2Day }</c:if>
						</a>
						<a class="list-group-item list-group-item-action" data-bs-toggle="list" id="list-3-list" role="tab" href="#list-3">
							<c:if test="${day.b1Day ge day.today }">${day.b1Day }</c:if>
						</a>
						<a class="list-group-item list-group-item-action active" data-bs-toggle="list" id="list-4-list" role="tab" href="#list-4">
							${day.searchDay }
						</a>
						<a class="list-group-item list-group-item-action" data-bs-toggle="list" id="list-5-list" role="tab" href="#list-5">
							<c:if test="${day.a1Day  ge day.today }">${day.a1Day }</c:if>
						</a>
						<a class="list-group-item list-group-item-action" data-bs-toggle="list" id="list-6-list" role="tab" href="#list-6">
							<c:if test="${day.a2Day ge day.today }">${day.a2Day }</c:if>
						</a>
						<a class="list-group-item list-group-item-action" data-bs-toggle="list" id="list-7-list" role="tab" href="#list-7">
							<c:if test="${day.a3Day ge day.today }">${day.a3Day }</c:if>
						</a>
					</div>
			</form>
				
				<div class="">
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade" id="list-1" role="tabpanel">
							<div id="list1">
								<div class="container mt-8">
									<div class="d-flex align-items-center">
										<strong role="status">Loading...</strong>
										<div class="spinner-border ms-auto" aria-hidden="true"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="list-2" role="tabpanel">
							<div id="list2">
								<div class="accordion accordion-flush mt-5 container text-center" id="accordionFlushExample">
									<c:forEach items="${list1 }" var="v" varStatus="i">
										<div class="accordion-item">
											<h2 class="accordion-header">
												<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-${i.count }" aria-expanded="false" aria-controls="flush-collapse-${i.count }">
													<div class="col-2">
														<div class="row">${v.airlineNm}</div>
														<div class="row">${v.vihicleId}</div>
													</div>
													<div class="col">
														<div class="row">${v.depPlandTime}</div>
														<div class="row">${v.depAirportNm}</div>
													</div>
													<div class="col">
														<div class="row">${v.arrPlandTime}</div>
														<div class="row">${v.arrAirportNm}</div>
													</div>
													<div class="col-1"><i class="bi bi-airplane" style="font-size: 2rem;"></i></div>
													<div class="col">
														<div class="row">최저가</div>
														<div class="row">${v.economyCharge} ~</div>
													</div>
												</button>
											</h2>
											<div id="flush-collapse-${i.count }" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
												<div class="accordion-body">
													<div class="row">
														<div class="col-2">

														</div>
														<div class="col-8">
															<div class="form-check">
																<hr class="section-spacer">
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
																<label class="form-check-label" for="flexRadioDefault1">
																	<div class="align-self-start">좌석 : 일반석</div>
																	<div class="align-self-end"> 운임 : ${v.economyCharge}</div>
																</label>

															</div>
															<c:if test="${v.prestigeCharge ne '0' }">
																<div class="form-check">
																	<hr class="section-spacer">
																	<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
																	<label class="form-check-label" for="flexRadioDefault2">
																		<div class="align-self-start">좌석 : 비즈니스석</div>
																		<div class="align-self-end"> 운임 : ${v.prestigeCharge}</div>
																	</label>
																</div>
															</c:if>
														</div>
														<div class="col-2 align-self-end">
															<button type="button" class="btn btn-info">오는 편 선택</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="list-3" role="tabpanel">
							<div id="list3">
								<div class="accordion accordion-flush mt-5 container text-center" id="accordionFlushExample">
									<c:forEach items="${list1 }" var="v" varStatus="i">
										<div class="accordion-item">
											<h2 class="accordion-header">
												<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-${i.count }" aria-expanded="false" aria-controls="flush-collapse-${i.count }">
													<div class="col-2">
														<div class="row">${v.airlineNm}</div>
														<div class="row">${v.vihicleId}</div>
													</div>
													<div class="col">
														<div class="row">${v.depPlandTime}</div>
														<div class="row">${v.depAirportNm}</div>
													</div>
													<div class="col">
														<div class="row">${v.arrPlandTime}</div>
														<div class="row">${v.arrAirportNm}</div>
													</div>
													<div class="col-1"><i class="bi bi-airplane" style="font-size: 2rem;"></i></div>
													<div class="col">
														<div class="row">최저가</div>
														<div class="row">${v.economyCharge} ~</div>
													</div>
												</button>
											</h2>
											<div id="flush-collapse-${i.count }" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
												<div class="accordion-body">
													<div class="row">
														<div class="col-2">

														</div>
														<div class="col-8">
															<div class="form-check">
																<hr class="section-spacer">
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
																<label class="form-check-label" for="flexRadioDefault1">
																	<div class="align-self-start">좌석 : 일반석</div>
																	<div class="align-self-end"> 운임 : ${v.economyCharge}</div>
																</label>

															</div>
															<c:if test="${v.prestigeCharge ne '0' }">
																<div class="form-check">
																	<hr class="section-spacer">
																	<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
																	<label class="form-check-label" for="flexRadioDefault2">
																		<div class="align-self-start">좌석 : 비즈니스석</div>
																		<div class="align-self-end"> 운임 : ${v.prestigeCharge}</div>
																	</label>
																</div>
															</c:if>
														</div>
														<div class="col-2 align-self-end">
															<button type="button" class="btn btn-info">오는 편 선택</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="tab-pane fade show active" id="list-4" role="tabpanel">
							<div id="list4">
								<div class="accordion accordion-flush mt-5 container text-center" id="accordionFlushExample">
									<c:forEach items="${list1 }" var="v" varStatus="i">
										<div class="accordion-item">
											<h2 class="accordion-header">
												<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-${i.count }" aria-expanded="false" aria-controls="flush-collapse-${i.count }">
													<div class="col-2">
														<div class="row">${v.airlineNm}</div>
														<div class="row">${v.vihicleId}</div>
													</div>
													<div class="col">
														<div class="row">${v.depPlandTime}</div>
														<div class="row">${v.depAirportNm}</div>
													</div>
													<div class="col">
														<div class="row">${v.arrPlandTime}</div>
														<div class="row">${v.arrAirportNm}</div>
													</div>
													<div class="col-1"><i class="bi bi-airplane" style="font-size: 2rem;"></i></div>
													<div class="col">
														<div class="row">최저가</div>
														<div class="row">${v.economyCharge} ~</div>
													</div>
												</button>
											</h2>
											<div id="flush-collapse-${i.count }" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
												<div class="accordion-body">
													<div class="row">
														<div class="col-2">

														</div>
														<div class="col-8">
															<div class="form-check">
																<hr class="section-spacer">
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
																<label class="form-check-label" for="flexRadioDefault1">
																	<div class="align-self-start">좌석 : 일반석</div>
																	<div class="align-self-end"> 운임 : ${v.economyCharge}</div>
																</label>

															</div>
															<c:if test="${v.prestigeCharge ne '0' }">
																<div class="form-check">
																	<hr class="section-spacer">
																	<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
																	<label class="form-check-label" for="flexRadioDefault2">
																		<div class="align-self-start">좌석 : 비즈니스석</div>
																		<div class="align-self-end"> 운임 : ${v.prestigeCharge}</div>
																	</label>
																</div>
															</c:if>
														</div>
														<div class="col-2 align-self-end">
															<button type="button" class="btn btn-info">오는 편 선택</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="list-5" role="tabpanel">
							<div id="list5">
								<div class="accordion accordion-flush mt-5 container text-center" id="accordionFlushExample">
									<c:forEach items="${list1 }" var="v" varStatus="i">
										<div class="accordion-item">
											<h2 class="accordion-header">
												<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-${i.count }" aria-expanded="false" aria-controls="flush-collapse-${i.count }">
													<div class="col-2">
														<div class="row">${v.airlineNm}</div>
														<div class="row">${v.vihicleId}</div>
													</div>
													<div class="col">
														<div class="row">${v.depPlandTime}</div>
														<div class="row">${v.depAirportNm}</div>
													</div>
													<div class="col">
														<div class="row">${v.arrPlandTime}</div>
														<div class="row">${v.arrAirportNm}</div>
													</div>
													<div class="col-1"><i class="bi bi-airplane" style="font-size: 2rem;"></i></div>
													<div class="col">
														<div class="row">최저가</div>
														<div class="row">${v.economyCharge} ~</div>
													</div>
												</button>
											</h2>
											<div id="flush-collapse-${i.count }" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
												<div class="accordion-body">
													<div class="row">
														<div class="col-2">

														</div>
														<div class="col-8">
															<div class="form-check">
																<hr class="section-spacer">
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
																<label class="form-check-label" for="flexRadioDefault1">
																	<div class="align-self-start">좌석 : 일반석</div>
																	<div class="align-self-end"> 운임 : ${v.economyCharge}</div>
																</label>

															</div>
															<c:if test="${v.prestigeCharge ne '0' }">
																<div class="form-check">
																	<hr class="section-spacer">
																	<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
																	<label class="form-check-label" for="flexRadioDefault2">
																		<div class="align-self-start">좌석 : 비즈니스석</div>
																		<div class="align-self-end"> 운임 : ${v.prestigeCharge}</div>
																	</label>
																</div>
															</c:if>
														</div>
														<div class="col-2 align-self-end">
															<button type="button" class="btn btn-info">오는 편 선택</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>			
						</div>
						<div class="tab-pane fade" id="list-6" role="tabpanel">
							<div id="list6">
								<div class="accordion accordion-flush mt-5 container text-center" id="accordionFlushExample">
									<c:forEach items="${list1 }" var="v" varStatus="i">
										<div class="accordion-item">
											<h2 class="accordion-header">
												<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-${i.count }" aria-expanded="false" aria-controls="flush-collapse-${i.count }">
													<div class="col-2">
														<div class="row">${v.airlineNm}</div>
														<div class="row">${v.vihicleId}</div>
													</div>
													<div class="col">
														<div class="row">${v.depPlandTime}</div>
														<div class="row">${v.depAirportNm}</div>
													</div>
													<div class="col">
														<div class="row">${v.arrPlandTime}</div>
														<div class="row">${v.arrAirportNm}</div>
													</div>
													<div class="col-1"><i class="bi bi-airplane" style="font-size: 2rem;"></i></div>
													<div class="col">
														<div class="row">최저가</div>
														<div class="row">${v.economyCharge} ~</div>
													</div>
												</button>
											</h2>
											<div id="flush-collapse-${i.count }" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
												<div class="accordion-body">
													<div class="row">
														<div class="col-2">

														</div>
														<div class="col-8">
															<div class="form-check">
																<hr class="section-spacer">
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
																<label class="form-check-label" for="flexRadioDefault1">
																	<div class="align-self-start">좌석 : 일반석</div>
																	<div class="align-self-end"> 운임 : ${v.economyCharge}</div>
																</label>

															</div>
															<c:if test="${v.prestigeCharge ne '0' }">
																<div class="form-check">
																	<hr class="section-spacer">
																	<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
																	<label class="form-check-label" for="flexRadioDefault2">
																		<div class="align-self-start">좌석 : 비즈니스석</div>
																		<div class="align-self-end"> 운임 : ${v.prestigeCharge}</div>
																	</label>
																</div>
															</c:if>
														</div>
														<div class="col-2 align-self-end">
															<button type="button" class="btn btn-info">오는 편 선택</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="list-7" role="tabpanel">
							<div id="list7">
								<div class="container mt-8">
									<div class="d-flex align-items-center">
										<strong role="status">Loading...</strong>
										<div class="spinner-border ms-auto" aria-hidden="true"></div>
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

	<script src="/resources/js/flights/list.js"></script>
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
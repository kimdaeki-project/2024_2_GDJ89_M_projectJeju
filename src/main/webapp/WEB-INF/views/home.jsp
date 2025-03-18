<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
<title>Insert title here</title>
</head>
<body style="background-image: url('../../resources/images/jeju.png'); background-repeat: no-repeat; background-size: cover;">
	<c:import url="/WEB-INF/views/templates/header.jsp"></c:import>


	<div class="container-fluid my-5">
		<div class="row col-md-8 offset-md-2">
			<!-- contents 내용 작성 -->
			<form class="d-flex" role="search">
              <input class="form-control me-2" type="search" placeholder="검색할 내용을 입력하세요." aria-label="Search">
              <button class="btn btn-primary" style="width: 100px;" type="submit">검색</button>
            </form>
		</div>
		
		<div class="row col-3 mt-5 offset-md-1">
			<div class="input-group mb-1">
			  <label class="input-group-text" for="inputGroupSelect01">출발지</label>
			  <select class="form-select" id="inputGroupSelect01">
			    <option selected>김포공항</option>
			    <option value="1">인천공항</option>
			    <option value="2">청주공항</option>
			    <option value="3">김해공항</option>
			  </select>
			</div>
			<div class="input-group mb-1">
			  <span class="input-group-text">여행일정</span>
			  <input type="date" aria-label="" class="form-control">
			  <input type="date" aria-label="" class="form-control">
			</div>
			<div class="input-group mb-1">
			  <span class="input-group-text" id="inputGroup-sizing-sm">인원</span>
			  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
			  <select class="form-select" id="inputGroupSelect01">
			    <option selected>항공권</option>
			    <option value="1">숙박</option>
			    <option value="2">렌트카</option>
			  </select>
			  <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
			</div>
		</div>
		
	</div>


	<!-- footer -->
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
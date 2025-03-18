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
	</div>


	<!-- footer -->
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
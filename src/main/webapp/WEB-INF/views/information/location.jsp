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
				  <li class="breadcrumb-item active" aria-current="page">지역 정보</li>
				</ol>
			  </nav>
			<h1>지역 정보</h1>
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
				<div class="image" style="margin-bottom: 20px;">
				  <img src="/resources/images/woojin/jejumap.png">
				</div>
				<div class="content">
				  <div class="description">
					
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
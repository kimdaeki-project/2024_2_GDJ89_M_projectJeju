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
				  <li class="breadcrumb-item active" aria-current="page">심볼마크</li>
				</ol>
			  </nav>
			<h1>심볼마크</h1>
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
				  <img src="/resources/images/woojin/jejumark.png">
				</div>
				<div class="content">
				  <div class="description">
					<p>제주특별자치도가 공식 지정한 고유 심벌마크로서 제주도를 대표하는 가치와 비전을 함축하고 있다.<br>
						- 수평의 붓 터치: 평등가치의 제주정신, 세계자연유산에 빛나는 제주의 자연을 표현<br>
						- 검은색: 현무암의 색상을 기조로 강인한 제주, 전통을 지키고 발전시키는 제주인의 문화를 상징<br>
						- 청색: 바다와 생물권보전지역 표현<br>
						- 녹색: 제주의 푸르른 한라산과 자연환경을 표현<br>
						- 주황색: 특별자치도로서의 미래지향적 가치, 우뚝 솟는 제주의 희망을 상징</p>
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
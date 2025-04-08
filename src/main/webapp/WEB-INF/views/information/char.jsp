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
				  <li class="breadcrumb-item active" aria-current="page">캐릭터</li>
				</ol>
			  </nav>
			<h1>캐릭터</h1>
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
				  <img src="/resources/images/woojin/jejuchar.png" style="width: 300px;">
				</div>
				<div class="content">
				  <div class="description">
					<p>꼬마하르방 제돌이는 제주도의 대표상징물인 돌하르방을 베이스로 만들어진 3D 캐릭터입니다.<br>
						2012년 아이러브캐릭터 대상과 지역캐릭터상을 수상했고, 이후 제주도를 대표하는 지역캐릭터로 활동 중입니다. 
						2010년 UNESCO가 제주방언을 소멸될 것이 확실한 언어로 지정한 이후로, 제주어지킴이 캐릭터로 활약하고 있습니다. 
						2013년부터 지금까지 제주감귤박람회, 제주사회적경제 홍보대사 겸 홍보캐릭터로 활동 중입니다. 
						2016년에는 캐릭터로서는 최초로, 제주도지사표창과 문화체육부장관상을 수상 했습니다.</p>
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
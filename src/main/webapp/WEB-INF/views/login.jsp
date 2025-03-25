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
			 <h1>Test Login</h1>
			<form>
				<div class="mb-3">
				  <label for="exampleInputEmail1" class="form-label">아이디</label>
				  <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
				  <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
				</div>
				<div class="mb-3">
				  <label for="exampleInputPassword1" class="form-label">비밀번호</label>
				  <input type="password" class="form-control" id="exampleInputPassword1">
				</div>
				<div class="mb-3 form-check">
				  <input type="checkbox" class="form-check-input" id="exampleCheck1">
				  <label class="form-check-label" for="exampleCheck1">Check me out</label>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
				<a href="${location}">
					<img src="/resources/images/kakao_login_medium.png">
				</a>
			  </form>
		</div>
	</div>




	<!-- footer -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>

	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
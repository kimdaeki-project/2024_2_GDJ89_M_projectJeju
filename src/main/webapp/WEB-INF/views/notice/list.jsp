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

			<h1>공지사항</h1>
			<form action="list" id="list_form" class="row row-cols-lg-auto g-3 align-items-center">
				<input type="hidden" name="page" id="pageNum">
			</form>

			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				<tbody>
				<c:forEach items="${list}" var="i">
					<tr onclick="location.href='/notice/detail?boardNum=${i.boardNum}'">
						<td>${i.boardNum}</td>
						<td>${i.boardTitle}</td>
						<td>관리자</td>
						<td>${i.boardDate}</td> 
					</tr>
				</c:forEach>
					
				</tbody>
			</table>
			
			<nav aria-label="Page navigation example" style="width: 300px; margin: 0px auto;">
				<ul class="pagination">
				  <li class="page-item">
					<button class="page-link pages" data-page-num="${pager.start-1}" aria-label="Previous">
				  <span aria-hidden="true">&laquo;</span>
				 </button>
			  </li>
			  <c:forEach begin="${pager.start}" end="${pager.end}" var="i">
				  <li class="page-item">
					  <button data-page-num="${i}" class="page-link pages">${i}</button>
				  </li>
			  </c:forEach>
			  <li class="page-item ${pager.endCheck?'disabled':''}" >
				<button class="page-link pages" data-page-num="${pager.end+1}" aria-label="Next">
				  <span aria-hidden="true">&raquo;</span>
				</button>
			  </li>
			</ul>
			  </nav>
				<!-- <a class="btn btn-success" href="add">글쓰기</a> -->
			
			
			
			
		</div>
	</div>




	<!-- footer -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>

	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
	<script src="/resources/js/boards/PB_list.js"></script>
</body>
</html>
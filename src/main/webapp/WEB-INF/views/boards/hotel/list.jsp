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
<body>
	<c:import url="/WEB-INF/views/templates/header.jsp"></c:import>

	<div style="margin-top: 100px;">
		<div class="row col-md-8 offset-md-2">
			<!-- contents 내용 작성 -->
			<h1>숙소 후기 게시판</h1>
			<form action="list" id="list_form" class="row row-cols-lg-auto g-3 align-items-center">
				<input type="hidden" name="page" id="pageNum">
				<div class="col-12">
					<select id="loc" name="locationKind" class="form-select" onchange="locat()">
						<option value="lo1" ${pager.locationKind eq 'lo1' ? 'selected': ''}>전체 지역</option>
					   <option value="lo2" ${pager.locationKind eq 'lo2' ? 'selected': ''}>제주시</option>
					   <option value="lo3" ${pager.locationKind eq 'lo3' ? 'selected': ''}>애월</option>
						<option value="lo4" ${pager.locationKind eq 'lo4' ? 'selected': ''}>서귀포</option>
						<option value="lo5" ${pager.locationKind eq 'lo5' ? 'selected': ''}>남원</option>
						<option value="lo6" ${pager.locationKind eq 'lo6' ? 'selected': ''}>조천</option>
						<option value="lo7" ${pager.locationKind eq 'lo7' ? 'selected': ''}>중문</option>
						<option value="lo8" ${pager.locationKind eq 'lo8' ? 'selected': ''}>한림</option>
					</select>
				</div>
					
			  <div class="col-12">
				<label class="visually-hidden" for="inlineFormSelectPref">test</label>
				<select name="kind" class="form-select" id="sKind">
				  <option value="k1" ${pager.kind eq 'k1' ? 'selected': ''}>제목</option>
				  <option value="k2" ${pager.kind eq 'k2' ? 'selected': ''}>내용</option>
				  <option value="k3" ${pager.kind eq 'k3' ? 'selected': ''}>위치</option>
				</select>
			  </div>
			  
				<div class="col-12">
				  	<input type="text" value="${pager.search}" name="search" class="form-control" id="inlineFormInputGroupUsername search" placeholder="검색어 입력">
				</div>
				
			
			  <div class="col-12">
				<button type="submit" class="btn btn-primary">검색</button>
			  </div>
			  <div class="btn-group">
				<a href="/place/list" class="btn btn-outline-primary" aria-current="page"><i class="bi bi-card-list"></i></a>
				<a href="/place/cardlist" id="cardlist" class="btn btn-outline-primary"><i class="bi bi-border-all"></i></a>
			  </div>
			<select name="searchKind" id="sklist" onchange="change()" class="form-select" id="inlineFormSelectPref 1">
				<option value="sk1" id="sk1" ${pager.searchKind eq 'sk1' ? 'selected': ''}>작성 날짜 순</option>
				<option value="sk2" id="sk2" ${pager.searchKind eq 'sk2' ? 'selected': ''}>즐겨찾기 많은 순</option>
				<option value="sk3" id="sk3" ${pager.searchKind eq 'sk3' ? 'selected': ''}>조회수 많은 순</option>
			</select>
			</form>

			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>좋아요</th>
						<th>조회수</th>
					</tr>
				<tbody>
				<c:forEach items="${list}" var="i">
					<tr onclick="location.href='/boards/detail?boardNum=${i.boardNum}'">
						<td>${i.boardNum}</td>
						<td>${i.boardTitle}</td>
						<td>${i.userID}</td>
						<td>${i.boardDate}</td>
						<td>${i.favorite}</td>
						<td>${i.boardHits}</td>
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
				<a class="btn btn-success" href="/boards/add">글쓰기</a>
			

		</div>
	</div>


	<!-- footer -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
	<script src="/resources/js/boards/list.js"></script>
</body>
</html>
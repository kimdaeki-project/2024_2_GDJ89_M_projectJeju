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


	<div class="container-fluid my-5">
		<div class="row col-md-8 offset-md-2">
			<!-- contents 내용 작성 -->
			<h1>TestBoardList</h1>
			<form action="./boardlist.jsp" id="list_form" class="row row-cols-lg-auto g-3 align-items-center">
				<input type="hidden" name="page" id="pageNum">

			  <div class="col-12">
				<label class="visually-hidden" for="inlineFormSelectPref">test</label>
				<select name="kind" class="form-select" id="inlineFormSelectPref">
				  <option value="t1">제목</option>
				  <option value="t2">내용</option>
				  <option value="t3">위치</option>
				</select>
			  </div>
			  
			<div class="col-12">
				  <input type="text" value="" name="search" class="form-control" id="inlineFormInputGroupUsername">
			  </div>
			
			  <div class="col-12">
				<button type="submit" class="btn btn-primary">검색</button>
			  </div>
			<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
				<label class="btn btn-outline-primary" for="btnradio1"><i class="bi bi-card-list"></i></label>
			  
				<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
				<label class="btn btn-outline-primary" for="btnradio2"><i class="bi bi-border-all"></i></label>
			</div>
			<select name="kind" class="form-select" id="inlineFormSelectPref">
				<option value="o1">작성 날짜 순</option>
				<option value="o2">즐겨찾기 많은 순</option>
				<option value="o3">조회수 많은 순</option>
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
					<tr>
						<td>1</td>
						<td>TestTitle</td>
						<td>TestuserID</td>
						<td>TestDate</td>
						<td>999</td>
						<td>999</td>
					</tr>
					<tr>
						<td>2</td>
						<td>TestTitle</td>
						<td>TestuserID</td>
						<td>TestDate</td>
						<td>999</td>
						<td>999</td>
					</tr>
					<tr>
						<td>3</td>
						<td>TestTitle</td>
						<td>TestuserID</td>
						<td>TestDate</td>
						<td>999</td>
						<td>999</td>
					</tr>
				</tbody>
			</table>
			<div >
				<nav aria-label="Page navigation example">
					<ul class="pagination">
					  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
					  <li class="page-item"><a class="page-link" href="#">1</a></li>
					  <li class="page-item"><a class="page-link" href="#">2</a></li>
					  <li class="page-item"><a class="page-link" href="#">3</a></li>
					  <li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</nav>
			</div>

		</div>
	</div>


	<!-- footer -->
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
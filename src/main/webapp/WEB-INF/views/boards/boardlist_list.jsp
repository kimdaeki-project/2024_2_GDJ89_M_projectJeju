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
				  <option value="t3">제목+내용</option>
				  <option value="t4">위치</option>
				</select>
			  </div>
			  
			<div class="col-12">
				  <input type="text" value="" name="search" class="form-control" id="inlineFormInputGroupUsername">
			  </div>
			
			  <div class="col-12">
				<button type="submit" class="btn btn-primary">검색</button>
			  </div>
			</form>

			<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
				<label class="btn btn-outline-primary" for="btnradio1"><i class="bi bi-border-all"></i></label>
			  
				<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
				<label class="btn btn-outline-primary" for="btnradio2"><i class="bi bi-card-list"></i></label>
			</div>

			<table class="table">
				<tbody>
					<tr>
						<td><img src="/resources/images/test.png"></td>
						<td>TestTitle</td>
						<td>TestContents</td><br>
						<td>TestuserID</td>
						<td>TestDate</td>
					</tr>
					<tr>
						<td><img src="/resources/images/test.png"></td>
						<td>TestTitle</td>
						<td>TestContents</td><br>
						<td>TestuserID</td>
						<td>TestDate</td>
					</tr>
					<tr>
						<td><img src="/resources/images/test.png"></td>
						<td>TestTitle</td>
						<td>TestContents</td><br>
						<td>TestuserID</td>
						<td>TestDate</td>
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
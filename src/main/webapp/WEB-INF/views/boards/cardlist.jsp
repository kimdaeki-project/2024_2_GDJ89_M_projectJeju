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
			<h1>TestCardList</h1>
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
				<label class="btn btn-outline-primary" for="btnradio1"><a href="/boards/list"><i class="bi bi-card-list"></i></a></label>
			  
				<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
				<label class="btn btn-outline-primary" for="btnradio2"><a href="/boards/cardlist"><i class="bi bi-border-all"></i></a></label>
			</div>
			<select name="kind" class="form-select" id="inlineFormSelectPref">
				<option value="o1">작성 날짜 순</option>
				<option value="o2">즐겨찾기 많은 순</option>
				<option value="o3">조회수 많은 순</option>
			  </select>
			</form>

			<table class="table table-striped">
				<tbody id="tbody">
					<tr>
						<td>
							<div class="container text-center">
								<div class="row">
								  <div class="col">
									<div class="card" style="width: 18rem;">
										<img src="..." class="card-img-top" alt="...">
										<div class="card-body">
										  <h5 class="card-title">Card title</h5>
										  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
										  <a href="#" class="btn btn-primary">Go somewhere</a>
										</div>
										  </div>
								  </div>
								  <div class="col">
									<div class="card" style="width: 18rem;">
										<img src="..." class="card-img-top" alt="...">
										<div class="card-body">
										  <h5 class="card-title">Card title</h5>
										  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
										  <a href="#" class="btn btn-primary">Go somewhere</a>
										</div>
										  </div>
								  </div>
								  <div class="col">
									<div class="card" style="width: 18rem;">
										<img src="..." class="card-img-top" alt="...">
										<div class="card-body">
										  <h5 class="card-title">Card title</h5>
										  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
										  <a href="#" class="btn btn-primary">Go somewhere</a>
										</div>
										  </div>
								  </div>
								</div>
							  </div>
						</td>
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
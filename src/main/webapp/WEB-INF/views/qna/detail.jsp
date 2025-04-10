<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
		<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
		<style>
			.post_info{
				font-size: 0;
				padding-right: 78px;
			}
			.post_info > li {
				display: inline-block;
				   vertical-align: top;
				margin: 10px 12px 0 0;
				font-size: 13px;
				color: #999;
			}
	
		</style>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/templates/header.jsp"></c:import>

	
	<!-- body -->
	<div style="margin-top: 100px;">
		<div class="row col-md-8 offset-md-2">
			<!-- contents 내용 작성 -->
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb" style="margin-bottom: 3%;">
				  <li class="breadcrumb-item"><a href="/">메인화면</a></li>
				  <li class="breadcrumb-item">
							<a href="/notice/list">공지사항</a>
				  </li>
				  <li class="breadcrumb-item active" aria-current="page">${dto.boardTitle}</li>
				</ol>
			</nav>
			<div>
				<div>
					<div style="display: inline-block;">
						<h1>${dto.boardTitle}</h1> 
						<span hidden>${dto.boardNum}</span>
					</div>
					<div style="float: right; display: inline-block; width: 180px;">
						<a class="btn btn-primary" href="/notice/update?boardNum=${dto.boardNum}" id="up" data-board-num="${dto.boardNum}">수정</a>
						<a id="btnDelete" class="btn btn-danger" href="./delete?boardNum=${dto.boardNum}">삭제</a>
					</div>
				</div>
				<div>
					<ui class="post_info">
						<li>작성자 : ${dto.userID}</li>
						<li>${dto.boardDate}</li>
					</ui>
				</div>
				<hr />
			</div>
			<div>
				<div style="text-align: center;">
					<h3>${dto.boardContents}</h3>
				</div>
			</div>

			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="mb-3">
								<textarea data-commentNum="" class="form-control" id="message-text"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" id="modal_close" data-bs-dismiss="modal" aria-label="Close">취소</button>
							<button type="submit" class="btn btn-primary" id="modal_change" data-bs-dismiss="modal" aria-label="Close">수정</button>
						</div>
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
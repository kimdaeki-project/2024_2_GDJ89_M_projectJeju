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
				  	<c:choose>
				  		<c:when test="${dto.category eq 3}">
							<a href="/boards/hotel/list">숙소 후기 게시판</a>
				  		</c:when>
				  		<c:when test="${dto.category eq 2}">
							<a href="/boards/diner/list">맛집 후기게시판</a>
				  		</c:when>
				  		<c:otherwise>
				  			<a href="/boards/place/list">명소 후기 게시판</a>
				  		</c:otherwise>
				  	</c:choose>
				  </li>
				  <li class="breadcrumb-item active" aria-current="page">${dto.boardTitle}</li>
				</ol>
			</nav>
			<div>
				<div>
					<div style="display: inline-block;">
						<h1 id="up" data-board-num="${dto.boardNum}">${dto.boardTitle}</h1> 
						<span hidden>${dto.boardNum}</span>
					</div>
					<div style="float: right; display: inline-block; width: 180px;">
						
						<c:choose>
							<c:when test="${user.userID eq dto.userID}">
								<a class="btn btn-primary" href="/boards/update?boardNum=${dto.boardNum}&userID=${dto.userID}">수정</a>
							<a id="btnDelete" class="btn btn-danger" href="./delete?boardNum=${dto.boardNum}&userID=${dto.userID}">삭제</a>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
						<form action="" method="post" style="width: 48px; float: left;">
							<c:choose>
								<c:when test="${heart.boardNum eq null}">
									<button id="btnHeart" class="btn btn-outline-danger" type="submit" data-heart-num="${heart.heart}">
										<img src="/resources/icon/heart.svg">
									</button>		
								</c:when>
								<c:when test="${user.userID eq null}">
									<button id="btnHeart" class="btn btn-danger" type="submit" data-heart-num="${heart.heart}" disabled>
										<img src="/resources/icon/heart-fill.svg">
									</button>
								</c:when>
								<c:otherwise>
									<button id="btnHeart" class="btn btn-danger" type="submit" data-heart-num="${heart.heart}">
										<img src="/resources/icon/heart-fill.svg">
									</button>
								</c:otherwise>
							</c:choose>
						</form>
						
					</div>
				</div>
				<div>
					<ui class="post_info">
						<li>작성자 : ${dto.userID}</li>
						<li>${dto.boardDate}</li>
						<li>조회 : ${dto.boardHits}</li>
						<li>좋아요 : ${dto.favorite}</li>
					</ui>
				</div>
				<hr />
			</div>
			<div>
				<div style="text-align: center;">
					<h3>${dto.boardContents}</h3>
				</div>
			</div>
				<div class="mb-3" style="margin-top: 7%;">
				<h3>댓글</h3>
				<div style="display: inline-block;">
					<input type="hidden" value="${dto.boardNum}" name="boardNum">
				</div>
				<div class="input-group mb-3" style="margin-top: 1%;">
					<c:choose>
						<c:when test="${user.userID eq null}">
							<textarea class="form-control" placeholder="로그인 후 이용하세요." id="boardContents" rows="3" disabled></textarea>
						</c:when>
						<c:otherwise>
							<textarea class="form-control" placeholder="댓글 작성" id="boardContents" rows="3"></textarea>
							<button class="btn btn-outline-secondary" type="submit" id="addComments" data-board-num="${dto.boardNum}">작성</button>	
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div class="mb-3" id="commentsListResult">
				
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
	<script src="/resources/js/boards/detail.js"></script>
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
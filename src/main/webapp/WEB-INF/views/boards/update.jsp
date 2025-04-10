<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.js"></script>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/templates/header.jsp"></c:import>

	
	<!-- body -->
	<div style="margin-top: 100px;">
		<div class="row col-md-8 offset-md-2">
			<!-- contents 내용 작성 -->
			 <h1>Test Add</h1>
			 <form action="" class="align-items-center" method="post" enctype="multipart/form-data">
				<div class="row col-12" style="margin-top: 20px; margin-left: 0px;">
					<input type="hidden" value="${dto.boardNum}" name="boardNum">
					<select id="loc" style="width: 250px;" name="location" class="form-select">
					    <option value="lo1" ${pager.locationKind eq 'lo1' ? 'selected': ''}>지역을 선택하세요.</option>
					    <option value="제주시" ${pager.locationKind eq 'lo2' ? 'selected': ''}>제주시</option>
						<option value="애월" ${pager.locationKind eq 'lo3' ? 'selected': ''}>애월</option>
						<option value="서귀포" ${pager.locationKind eq 'lo4' ? 'selected': ''}>서귀포</option>
						<option value="남원" ${pager.locationKind eq 'lo5' ? 'selected': ''}>남원</option>
						<option value="조천" ${pager.locationKind eq 'lo6' ? 'selected': ''}>조천</option>
						<option value="중문" ${pager.locationKind eq 'lo7' ? 'selected': ''}>중문</option>
						<option value="한림" ${pager.locationKind eq 'lo8' ? 'selected': ''}>한림</option>
					</select>
					<select id="cagy" style="width: 100px;" name="category" class="form-select" aria-placeholder="카테고리를 선택하세요.">
						<option value="1">명소</option>
						<option value="2">맛집</option>
						<option value="3">숙소</option>
					</select>
					<span id="locationResult" style="color: red; width: 300px; padding-top: 6px;">지역을 선택하세요.</span>
				</div>
				<div class="col-12">
					<input type="text" class="form-control" id="exampleInputEmail1" value="${dto.boardTitle}" name="boardTitle" aria-describedby="emailHelp" placeholder="제목" style="margin-bottom: 1%; margin-top: 7px;">
				</div>
					
				<div class="input-group mb-6 custom-write1 custom-write3">
					<input type="file" class="form-control" id="attach" name="attaches" multiple>
				</div>
				<div>
					<textarea id="summernote" name="boardContents" value="${dto.boardContents}">
						${dto.boardContents}
					</textarea>
				</div>
				<div style="width: 20%; margin-top: 4%;" class="btn-group" role="group" aria-label="Basic example">
					<button type="submit" class="btn btn-primary">글쓰기</button>
					<c:choose>
						<c:when test="${dto.category eq 1}">
							<a class="btn btn-danger" href="/boards/place/list">취소</a>
						</c:when>
						<c:when test="${dto.category eq 2}">
							<a class="btn btn-danger" href="/boards/diner/list">취소</a>
						</c:when>
						<c:otherwise>
							<a class="btn btn-danger" href="/boards/hotel/list">취소</a>
						</c:otherwise>
					</c:choose>
				</div>
			 </form>
			 
			
		</div>
			
			
			<script>
			  $('#summernote').summernote({
				height: 400
			  });
			</script>
		
			<script>
				$('#summernote').blur(()=>{
				  let m = $('#summernote').summernote('code');
				  console.log(m)
				})
			</script>
			
			
			
		</div>
	</div>




	<!-- footer -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
	<script src="/resources/js/boards/add.js"></script>
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
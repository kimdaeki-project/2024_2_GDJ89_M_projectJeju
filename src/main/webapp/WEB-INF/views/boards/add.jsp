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
			 <h1>글 작성</h1>
			 <form action="" class="align-items-center" method="post" enctype="multipart/form-data">
				<div class="row col-12" style="margin-top: 20px; margin-left: 0px;">
					<input type="hidden" value="${dto.boardNum}" name="boardNum">
					<select id="loc" style="width:	 250px;" name="location" class="form-select">
					    <option value="lo1" ${pager.locationKind eq 'lo1' ? 'selected': ''}>전체 지역</option>
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
					<span id="locationResult" style="color: red; width: 170px; padding-top: 6px;">지역을 선택하세요.</span>
				</div>
				<div class="col-12 has-validation">
					<div class="form-floating is-invalid">
					  <input type="text" class="form-control is-invalid" id="floatingInputGroup2" placeholder="제목" name="boardTitle" value="${dto.boardTitle}" style="margin-bottom: 1%; margin-top: 7px;" required>
					  <label for="floatingInputGroup2">제목</label>
					</div>
					<div class="invalid-feedback">
					  제목을 입력하세요.
					</div>
				  </div>
				<div>
					<textarea id="summernote" name="boardContents" value="${dto.boardContents}">

					</textarea>
					
				</div>
				<div style="width: 20%; margin-top: 4%;" class="btn-group" role="group" aria-label="Basic example">
					<c:choose>
						<c:when test="ioc.value=lo1">
							<button type="submit" id="btnAdd" class="btn btn-primary" disabled>지역을 선택하세요</button>
						</c:when>
						<c:otherwise>
							<button type="submit" id="btnAdd" class="btn btn-primary">글쓰기</button>		
						</c:otherwise>
					</c:choose>
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
				height:400,
				callbacks:{
					onImageUpload:function(files){
						console.log(files[0]);//<input type="file">
						let f = new FormData();
						f.append("uploadFile", files[0]);
						fetch('./detailFiles', {
							method:'POST',
							body:f
						})
						.then(r=>r.text())
						.then(r=>{
							$('#summernote').summernote('editor.insertImage', r.trim()); 
						})

					},
					onMediaDelete: async (files)=>{
						//js : getAttribute("속성명"), .속성명
						//jquery : attr("속성명"), prop("속성명")
						console.log(files[0].src)
						console.log($(files[0]).attr("src"))

						let fileName = files[0].src;
						let ar = fileName.split("/");
						console.log( ar[ar.length-1]);

						ar = fileName.substring(fileName.lastIndexOf("/")+1)
						console.log(ar);

						//js fetch
						//jquery , $.get(), $.post(), $.ajax()
						//1. url, method, parameter
						//detailFilesDelete, POST, filename
						let f = new FormData();
						f.append("fileName", ar)
						let result = await fetch('detailFilesDelete', {
							method:'POST',
							body:f
						});

						console.log(result)


					}
				}
			})
			</script>
		
			<script>
				$('#summernote').blur(()=>{
				  let m = $('#summernote').summernote('code');
				  console.log(m)
				})
			</script>
			
		</div>





	<!-- footer -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
	<script src="/resources/js/boards/add.js"></script>
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
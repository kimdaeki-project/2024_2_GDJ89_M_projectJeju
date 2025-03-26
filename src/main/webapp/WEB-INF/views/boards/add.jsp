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
			 <form action="" method="post" enctype="multipart/form-data">
				<input type="text" class="form-control" id="exampleInputEmail1" value="" name="boardTitle" aria-describedby="emailHelp" placeholder="제목" style="margin-bottom: 1%; margin-top: 3%;">
				<input type="hidden" name="boardNum" value="">
				<div class="input-group mb-6 custom-write1 custom-write3">
					<input type="file" class="form-control" id="attach" name="attaches" multiple>
				</div>
				<div>
					<textarea id="summernote" name="boardContents">

					</textarea>
				</div>
				<div style="width: 20%; margin-top: 4%;" class="btn-group" role="group" aria-label="Basic example">
					<button type="submit" class="btn btn-primary">글쓰기</button>
					<a class="btn btn-danger" href="/boards/list">취소</a>
				
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

	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
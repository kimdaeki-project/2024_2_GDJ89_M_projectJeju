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
			 <form action="" class="align-items-center" method="post">
				<div class="col-12">
					<input type="text" class="form-control" id="exampleInputEmail1" value="${dto.boardTitle}" name="boardTitle" aria-describedby="emailHelp" placeholder="제목" style="margin-bottom: 1%; margin-top: 7px; width: 50%;">
				</div>
				<div>
					<textarea id="summernote" name="boardContents" value="${dto.boardContents}">

					</textarea>
					
				</div>
				<div style="width: 20%; margin-top: 4%;" class="btn-group" role="group" aria-label="Basic example">
					<button type="submit" id="btnAdd" class="btn btn-primary">글쓰기</button>
					<a class="btn btn-danger" href="./list">취소</a>
				</div>
			 </form>
			
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

		
	</div>




	<!-- footer -->
	<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>

	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
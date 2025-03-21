<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<title>Insert title here</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300;500&display=swap" rel="stylesheet">
	<head>
		<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
    
</head>
	<!-- header -->
<body>
    <header data-bs-theme="dark">
      <c:import url="/WEB-INF/views/templates/header.jsp"></c:import>
    </header>

<main>

  <div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-label="Slide 1" aria-current="true"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
    </div>
    <div class="carousel-inner" style="font-family: 'Sunflower', sans-serif; font-weight: 500;">
      <div class="carousel-item active">
        <img src="/resources/images/woojin/jeju1.png" style="width: 100%; height: 50%;">
        <div class="container">
          <div class="carousel-caption text-start">
            <h1>TRIP IN JEJU</h1>
            <p class="opacity-75">제주로의 여행, 행복을 담다</p>
            <p><a class="btn btn-lg btn-primary" href="/information/mark">제주도, 어떤 곳일까?</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <img src="/resources/images/woojin/flane.png" style="width: 100%; height: 50%;">
        <div class="container">
          <div class="carousel-caption">
            <h1>항공</h1>
            <p>편한, 안전한, 신속한 비행</p>
            <p><a class="btn btn-lg btn-primary" href="#">항공권 예매</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <img src="/resources/images/woojin/hotel.png" style="width: 100%; height: 50%;">
        <div class="container">
          <div class="carousel-caption text-end">
            <h1>숙박</h1>
            <p>제주 여행에 필요한 숙박 정보가 한눈에!</p>
            <p><a class="btn btn-lg btn-primary" href="#">숙소 예매</a></p>
          </div>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
  <br>


  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div class="container marketing">

    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading fw-normal lh-1">${list.boardNum}<span class="text-body-secondary">${list.boardTitle}</span></h2>
        <p class="lead">${list.boardContents}</p>
      </div>
      <div class="col-md-5">
        <img src="/resources/images/woojin/waring.png">
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading fw-normal lh-1">${list2.boardNum}<span class="text-body-secondary">${list2.boardTitle}</span></h2>
        <p class="lead">${list2.boardContents}</p>
      </div>
      <div class="col-md-5 order-md-1">
        <img src="/resources/images/woojin/waring.png">
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading fw-normal lh-1">${notice.boardNum}<span class="text-body-secondary">${notice.boardTitle}</span></h2>
        <p class="lead">${notice.boardContents}</p>
      </div>
      <div class="col-md-5">
        <img src="/resources/images/woojin/waring.png">
      </div>
    </div>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->


  <!-- FOOTER -->
  <c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
</main>
<!-- <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> -->

</body>
</html>
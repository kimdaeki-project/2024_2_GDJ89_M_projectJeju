<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
    <c:import url="/WEB-INF/views/templates/header.jsp"></c:import>

    <title>JEJU</title>
    <style>
   /* 슬라이더 컨테이너 */
#carouselExampleCaptions {
    width: 80%;              /* 슬라이더 너비를 80%로 설정 */
    margin-left: 10%;        /* 왼쪽에 10% 여백 추가 */
    margin-right: 10%;       /* 오른쪽에 10% 여백 추가 */
    height: 400px;           /* 슬라이더 높이를 400px로 줄임 */
    overflow: hidden;        /* 이미지가 벗어나지 않도록 */
    margin-bottom: 5%;       /* 하단 공백 5%로 설정 */
}

/* 슬라이드 항목 */
.carousel-inner {
    display: flex;           /* 슬라이드를 가로로 배치 */
    transition: transform 0.5s ease; /* 슬라이드 넘어가는 애니메이션 */
}

.carousel-item {
    width: 100%;             /* 각 슬라이드는 100% 너비로 설정 */
    height: 100%;            /* 슬라이드 높이를 컨테이너 높이에 맞게 설정 */
}

/* 이미지 크기 조정 */
.carousel-item img {
    width: 100%;             /* 이미지의 너비를 100%로 설정하여 컨테이너 크기에 맞게 조정 */
    height: 100%;            /* 이미지 높이를 100%로 설정하여 비율을 유지하면서 꽉 채움 */
    object-fit: cover;       /* 이미지가 비율을 유지하면서 컨테이너를 꽉 채움 */
    max-height: 600px;       /* 이미지의 최대 높이를 400px로 제한 */
}

/* 서치바 위치 조정 */
.search-bar {
    position: absolute;      /* 절대 위치로 배치 */
    bottom: 20%;                /* 슬라이드 하단에서 20% 위치 */
    left: 50%;               /* 중앙 정렬 */
    transform: translateX(-50%); /* 정확히 중앙에 배치 */
    background-color: rgba(211, 211, 211, 0.7); /* 배경 색상 설정 */
    padding: 30px;
    width: 80%;              /* 서치바가 이미지의 80%를 차지 */
    max-width: 1200px;
    border-radius: 50px;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    box-sizing: border-box;
    margin-bottom: 5%;       /* 하단 여백 추가 */
}

/* 서치바 입력창 스타일 */
.search-bar input[type="text"], .search-bar input[type="date"] {
    padding: 12px 20px;
    font-size: 16px;
    border-radius: 50px;
    border: 1px solid #ddd;
    width: 200px;
    outline: none;
    box-sizing: border-box;
}

.search-bar input[type="date"]:focus, .search-bar input[type="text"]:focus {
    border-color: #ff5b00; /* 포커스 시 테두리 색상 */
}

/* 사람 수 선택기 스타일 */
.people-selector {
    display: flex;
    gap: 15px;
}

.people-selector select {
    padding: 12px 20px;
    font-size: 16px;
    border-radius: 50px;
    border: 1px solid #ddd;
    width: 120px;
    outline: none;
}

.people-selector select:focus {
    border-color: #ff5b00;
}

/* 검색 버튼 스타일 */
.search-bar button {
    padding: 15px 30px;
    font-size: 16px;
    background-color: #ffffff;
    color: #ff7e00;
    border: none;
    border-radius: 50px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.search-bar button:hover {
    background-color: #f2f2f2;
}

    </style>
</head>
<body>

    <!-- 제주 이미지 슬라이드 (가로로 넘겨지는 이미지 슬라이드) -->
    <div id="jejuCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/resources/images/hotel.png" class="d-block w-100" alt="Jeju Image 1">
            </div>
            <div class="carousel-item">
                <img src="/resources/images/air.png" class="d-block w-100" alt="Jeju Image 2">
            </div>
            <div class="carousel-item">
                <img src="/resources/images/dol.png" class="d-block w-100" alt="Jeju Image 3">
            </div>
        </div>
        <!-- 이전 버튼 -->
        <button class="carousel-control-prev" type="button" data-bs-target="#jejuCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <!-- 다음 버튼 -->
        <button class="carousel-control-next" type="button" data-bs-target="#jejuCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- Large Search Bar Section (Now above the footer, over the image) -->
    <div class="search-bar" id="search-bar">
        <input type="text" placeholder="항공권 검색">
        <input type="date" placeholder="가는 날">
        <input type="date" placeholder="오는 날">

        <!-- People selector -->
        <div class="people-selector">
            <select>
                <option value="adult">성인</option>
                <option value="child">소아</option>
                <option value="infant">유아</option>
            </select>
            <select>
                <option value="1">1명</option>
                <option value="2">2명</option>
                <option value="3">3명</option>
                <option value="4">4명</option>
                <option value="5">5명</option>
            </select>
        </div>

        <button type="submit">검색</button>
    </div>


   

    <c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
    <c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>

</body>
</html>

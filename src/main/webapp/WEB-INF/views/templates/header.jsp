<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AirPark JEJU</title>
    <c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import> <!-- Import Bootstrap CSS -->

    <style>
        /* Navbar Styling */
        .navbar {
            background-color: #003366;
            padding: 20px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);  /* 그림자 효과 추가 */
            transition: background-color 0.3s ease; /* 배경색 변경 시 부드러운 효과 */
        }

        .navbar-brand {
            font-size: 32px; /* 폰트 크기 조정 */
            color: #fff;
            font-weight: bold;  /* 글씨 두껍게 */
            text-transform: uppercase;
            margin-left: 30px;
            letter-spacing: 2px; /* 글자 간격을 늘려서 더 세련된 느낌 */
        }

        /* 마우스를 올렸을 때 로고 색상 변화 */
        .navbar-brand:hover {
            color: #ffcc00;  /* 마우스 오버 시 노란색으로 변경 */
            text-decoration: underline; /* 밑줄 효과 추가 */
        }

        /* 기본 네비바 링크 스타일 (글자 색상 흰색, 글씨 두껍게) */
        .navbar-nav .nav-link {
            color: #fff !important;  /* 기본 글자 색 흰색 */
            font-size: 15px; /* 글씨 크기 조정 */
            margin-left: 25px;
            text-transform: uppercase;
            font-weight: bold; /* 글씨 두껍게 */
            transition: color 0.3s ease, transform 0.2s ease; /* 마우스 오버 시 색상과 함께 효과 */
        }

        /* 마우스를 올렸을 때 색상 변화 및 살짝 커지는 효과 */
        .navbar-nav .nav-link:hover {
            color: #ffcc00 !important;  /* 마우스 오버 시 노란색 */
            transform: scale(1.1); /* 마우스 오버 시 살짝 확대 */
        }

        /* 오른쪽 정렬 */
        .navbar-nav .ms-auto {
            margin-left: auto;
        }

        /* 햄버거 메뉴 버튼 */
        .navbar-toggler {
            border-color: #fff;
        }

        .navbar-toggler-icon {
            background-color: #fff;
        }

        /* 드롭다운 메뉴 스타일링 */
        .dropdown-menu {
            z-index: 1050; /* Bootstrap에서 설정한 드롭다운 기본 z-index 값보다 높은 값으로 설정 */
            background-color: #003366; /* 드롭다운 배경 색상 */
            border-radius: 8px;  /* 둥근 모서리 */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* 드롭다운 그림자 효과 */
        }

        .dropdown-item {
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
        }

        .dropdown-item:hover {
            background-color: #ffcc00; /* 마우스 오버 시 배경색 */
            color: #003366; /* 텍스트 색상 변경 */
        }

        /* 반응형 네비게이션 바 */
        @media (max-width: 991px) {
            .navbar {
                padding: 15px 0;
            }

            .navbar-nav .nav-link {
                font-size: 14px; /* 작은 화면에서 글씨 크기 조정 */
                margin-left: 15px;
            }

            .navbar-brand {
                font-size: 28px; /* 작은 화면에서 로고 크기 조정 */
                margin-left: 20px;
            }
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">AirPark JEJU</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item dropdown ms-auto">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            게시판 
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/boards/list">문의게시판</a></li>
                            <li><a class="dropdown-item" href="/boards/place/list">명소 후기</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link active" href="#">PARKING</a></li>
                    <li class="nav-item"><a class="nav-link active" href="#">QNA</a></li>
                    <li class="nav-item"><a class="nav-link active" href="#">NOTICE</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/users/login">로그인</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/users/join">회원가입</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Remove duplicate script tag if it's loaded in boot_js.jsp -->
    <c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
    <script src="/resources/js/users/join.js"></script>

</body>

</html>


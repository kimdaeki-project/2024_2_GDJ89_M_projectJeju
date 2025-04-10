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
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        .navbar-brand {
            font-size: 32px;
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
            margin-left: 30px;
            letter-spacing: 2px;
        }

        .navbar-brand:hover {
            color: #ffcc00;
            text-decoration: underline;
        }

        .navbar-nav .nav-link {
            color: #fff !important;
            font-size: 15px;
            margin-left: 25px;
            text-transform: uppercase;
            font-weight: bold;
            transition: color 0.3s ease, transform 0.2s ease;
        }

        .navbar-nav .nav-link:hover {
            color: #ffcc00 !important;
            transform: scale(1.1);
        }

        .navbar-nav .ms-auto {
            margin-left: auto;
        }

        .navbar-toggler {
            border-color: #fff;
        }

        .navbar-toggler-icon {
            background-color: #fff;
        }

        .dropdown-menu {
            z-index: 1050;
            background-color: #003366;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .dropdown-item {
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
        }

        .dropdown-item:hover {
            background-color: #ffcc00;
            color: #003366;
        }

        @media (max-width: 991px) {
            .navbar {
                padding: 15px 0;
            }

            .navbar-nav .nav-link {
                font-size: 14px;
                margin-left: 15px;
            }

            .navbar-brand {
                font-size: 28px;
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
                    <!-- 게시판 메뉴 -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            게시판
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <li><a class="dropdown-item" href="/boards/list">문의게시판</a></li>
                            <li><a class="dropdown-item" href="/boards/place/list">명소 후기</a></li>
                        </ul>
                    </li>
                    <!-- 공통 메뉴 -->
                    <li class="nav-item"><a class="nav-link active" href="/flights/search">AIR</a></li>
                    <li class="nav-item"><a class="nav-link active" href="#">QNA</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/notice/list">NOTICE</a></li>

                    <!-- 로그인된 사용자 메뉴 -->
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            <!-- 로그인 상태일 때 -->
                            <li class="nav-item"><a class="nav-link active" href="/users/logout">로그아웃</a></li>
                            <li class="nav-item"><a class="nav-link active" href="/users/mypage">마이페이지</a></li>
                        </c:when>
                        <c:otherwise>
                            <!-- 로그인하지 않은 상태일 때 -->
                            <li class="nav-item"><a class="nav-link active" href="/users/login">로그인</a></li>
                            <li class="nav-item"><a class="nav-link active" href="/users/join">회원가입</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Import JS Files -->
    <c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <script src="/resources/js/users/join.js"></script>

</body>

</html>

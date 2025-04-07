<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AirPark JEJU</title>

    <!-- Font Awesome CDN 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
    /* 푸터 기본 스타일 */
    body {
        font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 0;
        min-height: 100vh; /* 화면 전체 높이를 확보 */
        display: flex;
        flex-direction: column;
    }

    .footer {
        background-color: #003366; /* 어두운 배경 */
        color: white;
        padding: 10px 0;
        text-align: center;
        margin-top: auto; /* 푸터를 화면 하단에 고정 */
        position: fixed; /* 푸터를 고정 위치에 배치 */
        bottom: 0; /* 화면 하단에 위치 */
        left: 0;
        width: 100%; /* 화면 전체 너비 */
        z-index: 1000; /* 다른 요소들보다 위에 표시되도록 설정 */
    }

    .footer a {
        color: #ffcc00; /* 링크 색상 */
        text-decoration: none;
    }

    /* 푸터 내용 가운데 정렬 */
    footer .footer-content {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
    }

    /* 푸터 링크 스타일 */
    footer a {
        color: #ffcc00; /* 링크 색상 */
        text-decoration: none; /* 밑줄 제거 */
        font-weight: bold;
        transition: color 0.3s ease; /* 마우스 오버시 색상 변경 효과 */
    }

    /* 마우스를 올렸을 때 링크 색상 변화 */
    footer a:hover {
        color: #fff; /* 마우스 오버 시 링크 색상 변경 */
    }

    /* 푸터 상단 텍스트 스타일 */
    footer .footer-top {
        font-size: 12px;
        font-weight: 300;
        margin-bottom: 10px;
    }

    /* 반응형 디자인 (작은 화면에서 스타일 수정) */
    @media (max-width: 768px) {
        footer {
            padding: 20px 0;
        }
    }
    </style> 

</head>
<body>

    <footer class="footer">
        <p>&copy; 2025 AirPark JEJU. All Rights Reserved.</p>
        <p><a href="/privacy-policy">Privacy Policy</a> | <a href="/terms-of-service">Terms of Service</a></p>
    </footer>

    <!-- Import Bootstrap JS, already included in boot_js.jsp -->
    <c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import> 

    <!-- Custom JS file -->
    <script src="/resources/js/users/join.js"></script>

</body>
</html>

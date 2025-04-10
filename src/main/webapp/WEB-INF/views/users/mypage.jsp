<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
    <c:import url="/WEB-INF/views/templates/header.jsp"></c:import>

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f6f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* 전체 레이아웃 */
        .container {
            display: flex;
            padding: 40px;
        }

        /* 왼쪽 사이드바 */
        .sidebar {
            width: 250px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .sidebar h3 {
            font-size: 24px;
            color: #007bff;
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .sidebar ul li {
            margin-bottom: 15px;
            text-align: center;
        }

        .sidebar ul li a {
            font-size: 18px;
            color: #333;
            text-decoration: none;
            padding: 12px 20px;
            border-radius: 8px;
            display: block;
            transition: background-color 0.3s ease;
        }

        .sidebar ul li a:hover {
            background-color: #007bff;
            color: white;
        }

        /* 오른쪽 메인 콘텐츠 */
        .content {
            flex-grow: 1;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 100%;
        }

        h2 {
            font-size: 32px;
            color: #333;
            text-align: center;
            margin-bottom: 40px;
        }

        .section {
            background-color: #ffffff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .section-title {
            font-size: 22px;
            font-weight: 600;
            color: #007bff;
            margin-bottom: 20px;
            text-align: center;
        }

        .user-info {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }

        .user-info div {
            flex: 1;
            text-align: center;
            padding: 10px;
        }

        .user-info div:not(:last-child) {
            border-right: 1px solid #ddd;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            font-size: 16px;
            font-weight: 500;
            color: #555;
            margin-bottom: 8px;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            margin-bottom: 15px;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-color: #007bff;
            background-color: #fff;
            outline: none;
        }

        .btn {
            width: 50%;
            padding: 14px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-weight: 600;
            display: block;
            margin: 0 auto;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .hidden {
            display: none;
        }
    </style>

    <script>
        // 해당 섹션만 표시되도록 하는 함수
        function showSection(sectionId) {
            var sections = document.querySelectorAll('.section');
            sections.forEach(function(section) {
                section.classList.add('hidden');
            });
            var section = document.getElementById(sectionId);
            section.classList.remove('hidden');
        }
    </script>
</head>

<body>

    <div class="container">
        <!-- 왼쪽 사이드바 -->
        <div class="sidebar">
            <h3>마이페이지</h3>
            <ul>
                <li><a href="javascript:void(0);" onclick="showSection('view-section')">내 정보</a></li>
                <li><a href="javascript:void(0);" onclick="showSection('edit-section')">정보 수정</a></li>
                <li><a href="javascript:void(0);" onclick="showSection('reservation-list')">예약 내역</a></li>
                <li><a href="javascript:void(0);" onclick="showSection('post-list')">내가 쓴 글</a></li>
            </ul>
        </div>

        <!-- 오른쪽 메인 콘텐츠 -->
        <div class="content">
            <h2>${sessionScope.user.name}님, 환영합니다!</h2>

            <!-- 개인정보 표시 섹션 -->
            <div class="section" id="view-section">
                <h3 class="section-title">내 정보</h3>
                <div class="user-info">
                    <div>
                        <p><strong>이메일</strong></p>
                        <p>${sessionScope.user.email}</p>
                    </div>
                    <div>
                        <p><strong>전화번호</strong></p>
                        <p>${sessionScope.user.phone}</p>
                    </div>
                </div>
            </div>

            <!-- 개인정보 수정 섹션 -->
            <div class="section hidden" id="edit-section">
                <h3 class="section-title">정보 수정</h3>
                <form action="/users/update" method="POST">
                    <div class="form-group">
                        <label for="email" class="form-label">이메일</label>
                        <input type="email" class="form-control" id="email" name="email" value="${sessionScope.user.email}" required>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="form-label">전화번호</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="${sessionScope.user.phone}" required>
                    </div>
                    <button type="submit" class="btn btn-primary">정보 변경</button>
                </form>
            </div>

            <!-- 예약 내역 섹션 -->
            <div class="section hidden" id="reservation-list">
                <h3 class="section-title">예약 내역</h3>
                <ul>
                    <li>예약 내역 1</li>
                    <li>예약 내역 2</li>
                    <li>예약 내역 3</li>
                </ul>
            </div>

            <!-- 내가 쓴 글 섹션 -->
            <div class="section hidden" id="post-list">
                <h3 class="section-title">내가 쓴 글</h3>
                <ul>
                    <li>글 제목 1</li>
                    <li>글 제목 2</li>
                    <li>글 제목 3</li>
                </ul>
            </div>
        </div>
    </div>

    <c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>

</body>

</html>

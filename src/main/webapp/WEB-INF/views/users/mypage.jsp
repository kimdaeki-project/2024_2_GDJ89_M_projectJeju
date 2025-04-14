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
        .container {
            display: flex;
            padding: 40px 20px;
            gap: 40px;
        }
        .sidebar {
            width: 250px;
            background-color: #fff;
            padding: 24px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            position: sticky;
            top: 40px;
            height: fit-content;
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
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .sidebar ul li a:hover {
            background-color: #007bff;
            color: white;
        }
        .content {
            flex-grow: 1;
            padding: 40px 30px;
            background-color: #ffffff;

            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            max-width: 1000px;
            width: 100%;
        }
        h2 {
            font-size: 32px;
            color: #222;
            text-align: center;
            margin-bottom: 40px;
        }
        .section {
            background-color: #ffffff;
            padding: 24px;
            margin-bottom: 24px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
        }
        .section-title {
            font-size: 22px;
            font-weight: 600;
            color: #007bff;
            margin-bottom: 20px;
            text-align: center;
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
        }
        .user-info {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
            gap: 20px;
        }
        .user-info div {
            flex: 1;
            text-align: center;
            padding: 12px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.03);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-label {
            font-size: 16px;
            font-weight: 500;
            color: #555;
            margin-bottom: 8px;
            display: block;
        }
        .form-control {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            margin-bottom: 15px;
            transition: border-color 0.3s ease, background-color 0.3s ease;
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
            border-radius: 30px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 600;
            display: block;
            margin: 0 auto;
            box-shadow: 0 4px 12px rgba(0, 123, 255, 0.15);
            text-align: center;
            border: none;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 18px rgba(0, 123, 255, 0.3);
        }
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
        }
        .hidden {
            display: none;
        }
          .message {
            font-size: 14px;
            font-weight: bold;
            margin-top: 5px;
            padding: 5px;
            border-radius: 5px;
            display: none; /* 초기에는 숨겨둠 */
        }

        .error-message {
            color: red;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
        }

        .success-message {
            color: green;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
        }
        
        .reservList {
            text-align: center;
            list-style: none;
        }
    </style>

    <script>
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
        <div class="sidebar">
            <h3>마이페이지</h3>
            <ul>
                <li><a href="javascript:void(0);" onclick="showSection('view-section')">내 정보</a></li>
                <li><a href="javascript:void(0);" onclick="showSection('edit-section')">정보 수정</a></li>
                <li><a href="${pageContext.request.contextPath}/users/pwUpdate">비밀번호 변경</a></li>
                <li><a href="javascript:void(0);" onclick="showSection('reservation-list')" id="getReservations">예약 내역</a></li>
                <li><a href="javascript:void(0);" onclick="showSection('post-list')">내가 쓴 글</a></li>
            </ul>
        </div>

        <div class="content">
            <h2>${sessionScope.user.name}님, 환영합니다!</h2>

<!-- 내 정보 섹션 -->
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

    <!-- ✅ 여기 안쪽으로 버튼 이동 -->
    <div style="text-align: center; margin-top: 20px;">
        <a href="${pageContext.request.contextPath}/users/userDelete" 
           class="btn btn-secondary"
           style="background-color: #dc3545; color: #fff; width: 200px; display: inline-block; padding: 14px; border-radius: 30px;">
            회원 탈퇴
        </a>
    </div>
</div>


            <!-- 정보 수정 섹션 -->
            <div class="section hidden" id="edit-section">
                <h3 class="section-title">정보 수정</h3>
                <form action="./emailUpdate" method="POST" style="display: flex; align-items: center; gap: 10px;">
                    <div style="flex: 1;">
                        <label for="email" class="form-label">이메일</label>
                        <input type="email" class="form-control" id="email" name="newEmail" value="${sessionScope.user.email}" required>
                    </div>
                    <button type="submit" class="btn btn-primary" style="width: 120px;">수정</button>
                </form>
                <form action="./phoneUpdate" method="POST" style="display: flex; align-items: center; gap: 10px; margin-top: 20px;">
                    <div style="flex: 1;">
                        <label for="phone" class="form-label">전화번호</label>
                        <input type="text" class="form-control" id="phone" name="newPhone" value="${sessionScope.user.phone}" required>
                    </div>
                    <button type="submit" class="btn btn-primary" style="width: 120px;">수정</button>
                </form>
            </div>

            <!-- 예약 내역 섹션 -->
            <div class="section hidden" id="reservation-list">
                <h3 class="section-title">예약 내역</h3>
                <ul class="reservList" id="reserv">
                    <li>
                        <div class="spinner-border spinner-border-sm" role="status">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                        <span>예약내역을 불러오는 중입니다</span>
                    </li>
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

    <script src="/resources/js/users/mypage.js"></script>
</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
    <c:import url="/WEB-INF/views/templates/header.jsp"></c:import>

    <!-- Font Awesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

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
            padding: 40px;
        }

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

        .content {
            flex-grow: 1;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 1000px;
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
            width: auto;
            padding: 12px 24px;
            font-size: 15px;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 600;
            display: inline-block;
            margin-top: 10px;
            box-shadow: 0 4px 12px rgba(0, 123, 255, 0.2);
            text-align: center;
        }

        .btn i {
            margin-right: 8px;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 16px rgba(0, 123, 255, 0.4);
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #495057;
            box-shadow: 0 6px 16px rgba(108, 117, 125, 0.4);
        }

        /* 비밀번호 변경 섹션 스타일 */
        #password-change-section .form-group {
            margin-bottom: 20px;
        }

        /* 비밀번호 변경 버튼 위치를 하단에 배치하고 일관되게 스타일링 */
        #password-change-section .btn-password-change {
            width: 100%; /* 버튼 크기를 섹션 너비에 맞게 확장 */
            padding: 14px 28px; /* 버튼 크기 증가 */
            font-size: 16px; /* 버튼 텍스트 크기 증가 */
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 600;
            margin-top: 20px; /* 여백을 주어 요소들이 서로 겹치지 않게 */
            background-color: #28a745; /* 녹색 배경 */
            color: white;
            border: none;
            box-shadow: 0 4px 12px rgba(0, 123, 255, 0.2);
            text-align: center;
        }

        #password-change-section .btn-password-change:hover {
            background-color: #218838; /* 마우스 오버 시 더 어두운 녹색 */
            box-shadow: 0 6px 16px rgba(40, 167, 69, 0.4);
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
        let activeSectionId = null;

        function showSection(sectionId) {
            const section = document.getElementById(sectionId);

            if (activeSectionId === sectionId) {
                section.classList.add('hidden');
                activeSectionId = null;
            } else {
                document.querySelectorAll('.section').forEach(sec => sec.classList.add('hidden'));
                section.classList.remove('hidden');
                activeSectionId = sectionId;
            }
        }

        function showEmailEdit() {
            toggleVisibility("email-edit-section");
        }

        function showPhoneEdit() {
            toggleVisibility("phone-edit-section");
        }

        function showPasswordChange() {
            toggleVisibility("password-change-section");
        }

        function toggleVisibility(id) {
            const section = document.getElementById(id);
            section.classList.toggle("hidden");
        }


    </script>
</head>

<body>

    <div class="container">
        <!-- 사이드바 -->
        <div class="sidebar">
            <h3>마이페이지</h3>
            <ul>
                <li><a href="javascript:void(0);" onclick="showSection('view-section')">내 정보</a></li>
                <li><a href="javascript:void(0);" onclick="showSection('reservation-list')" id="getReservations">예약 내역</a></li>
                <li><a href="javascript:void(0);" onclick="showSection('post-list')">내가 쓴 글</a></li>
                <li><a href="javascript:void(0);" onclick="showSection('liked-post-list')">좋아요한 글</a></li>
            </ul>
        </div>

        <!-- 메인 콘텐츠 -->
        <div class="content">
            <h2>${sessionScope.user.name}님, 환영합니다!</h2>

            <!-- 내 정보 -->
            <div class="section" id="view-section">
                <h3 class="section-title">내 정보</h3>
                <div class="user-info">
                    <div>
                        <p><strong>이메일</strong></p>
                        <p>${sessionScope.user.email}</p>
                        <button class="btn btn-secondary" onclick="showEmailEdit()">
                            <i class="fas fa-envelope"></i> 이메일 수정
                        </button>
                    </div>
                    <div>
                        <p><strong>전화번호</strong></p>
                        <p>${sessionScope.user.phone}</p>
                        <button class="btn btn-secondary" onclick="showPhoneEdit()">
                            <i class="fas fa-phone"></i> 전화번호 수정
                        </button>
                    </div>
                </div>
                <button class="btn btn-secondary" onclick="showPasswordChange()">
                    <i class="fas fa-key"></i> 비밀번호 변경
                </button>
            </div>

            <!-- 이메일 수정 -->
            <div class="section hidden" id="email-edit-section">
                <h3 class="section-title">이메일 수정</h3>
                <div class="form-group">
                    <label for="email" class="form-label">이메일</label>
                    <input type="email" class="form-control" id="email" name="email"
                        value="${sessionScope.user.email}" required>
                    <button type="button" class="btn btn-primary" onclick="alert('이메일 수정 완료!')">
                        <i class="fas fa-check"></i> 이메일 수정
                    </button>
                </div>
            </div>

            <!-- 전화번호 수정 -->
            <div class="section hidden" id="phone-edit-section">
                <h3 class="section-title">전화번호 수정</h3>
                <div class="form-group">
                    <label for="phone" class="form-label">전화번호</label>
                    <input type="text" class="form-control" id="phone" name="phone"
                        value="${sessionScope.user.phone}" required>
                    <button type="button" class="btn btn-primary" onclick="alert('전화번호 수정 완료!')">
                        <i class="fas fa-check"></i> 전화번호 수정
                    </button>
                </div>
            </div>

            <!-- 비밀번호 변경 -->
            <div class="section hidden" id="password-change-section">
                <h3 class="section-title">비밀번호 변경</h3>
                <div class="form-group">
                    <label for="currentPassword" class="form-label">현재 비밀번호</label>
                    <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                </div>
                <div class="form-group">
                    <label for="newPassword" class="form-label">새 비밀번호</label>
                    <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                </div>
                <div class="form-group">
                    <label for="confirmPassword" class="form-label">비밀번호 확인</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                </div>
                <!-- 비밀번호 변경 버튼 -->
                <button type="button" class="btn btn-password-change" onclick="alert('비밀번호 변경 완료!')">
                    <i class="fas fa-check"></i> 비밀번호 변경
                </button>
            </div>

            <!-- 예약 내역 -->
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

            <!-- 내가 쓴 글 -->
            <div class="section hidden" id="post-list">
                <h3 class="section-title">내가 쓴 글</h3>
                <ul>
                    <li>글 1</li>
                    <li>글 2</li>
                    <li>글 3</li>
                </ul>
            </div>

        
    </div>

    <script src="/resources/js/users/mypage.js"></script>
</body>

</html>

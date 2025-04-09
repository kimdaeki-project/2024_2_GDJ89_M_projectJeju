<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import> <!-- Import Bootstrap CSS -->
    <c:import url="/WEB-INF/views/templates/header.jsp"></c:import> <!-- Import header -->

    <style>
        /* General resets and body styling */
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
        }

        /* Center the content vertically and horizontally */
        .main-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            max-width: 500px; /* 폼의 가로 크기를 조금 더 줄임 */
            width: 100%;
            padding: 12px; /* 여백을 좀 더 줄임 */
            background-color: #ffffff;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            border-left: 4px solid #ffcc00;
            box-sizing: border-box;
        }

        h2 {
            text-align: center;
            margin-bottom: 10px; /* 제목 아래 여백을 더 줄임 */
            color: #333;
            font-weight: bold;
            font-size: 18px; /* 제목 폰트 크기 줄임 */
        }

        .card {
            margin-top: 12px; /* 카드 간격을 줄임 */
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-title {
            font-size: 14px; /* 카드 제목 폰트 크기 줄임 */
            font-weight: bold;
            color: #333;
            margin-bottom: 8px; /* 여백 줄임 */
        }

        .form-label {
            font-weight: bold;
            color: #343a40;
            font-size: 12px; /* 라벨 폰트 크기 줄임 */
        }

        .form-control {
            border-radius: 4px;
            font-size: 14px; /* 폰트 크기 줄임 */
            padding: 8px; /* 여백 줄임 */
            margin-bottom: 10px; /* 필드 간격 줄임 */
            width: 100%;
            box-sizing: border-box;
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #ffcc00;
            box-shadow: 0 0 6px rgba(255, 204, 0, 0.25);
            background-color: #ffffff;
        }

        .btn {
            width: 100%;
            padding: 10px; /* 버튼 높이 줄임 */
            font-size: 14px; /* 폰트 크기 줄임 */
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-success {
            background-color: #28a745;
            color: white;
            border: none;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
            border: none;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                padding: 10px; /* 작은 화면에서는 패딩을 더 줄임 */
                max-width: 90%;
            }

            h2 {
                font-size: 16px;
            }
        }
    </style>
</head>

<body>

    <div class="main-container">
        <div class="container">
            <h2>마이페이지</h2>

            <!-- 현재 사용자 정보 표시 -->
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">내 정보</h5>
                    <form action="/users/update" method="POST">
                        <div class="mb-3">
                            <label for="email" class="form-label">이메일</label>
                            <input type="email" class="form-control" id="email" name="email" value="${sessionScope.user.email}" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">전화번호</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="${sessionScope.user.phone}" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">비밀번호</label>
                            <input type="password" class="form-control" id="password" name="password" value="${sessionScope.user.password}" required>
                        </div>
                        <button type="submit" class="btn btn-primary">정보 변경</button>
                    </form>
                </div>
            </div>

            <!-- 비밀번호 변경 섹션 -->
            <div class="card mt-4">
                <div class="card-body">
                    <h5 class="card-title">비밀번호 변경</h5>
                    <form action="/users/pwUpdate" method="POST">
                        <div class="mb-3">
                            <label for="currentPassword" class="form-label">현재 비밀번호</label>
                            <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                        </div>
                        <div class="mb-3">
                            <label for="newPassword" class="form-label">새 비밀번호</label>
                            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                        </div>
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">비밀번호 확인</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                        </div>
                        <button type="submit" class="btn btn-success">비밀번호 변경</button>
                    </form>
                </div>
            </div>

            <!-- 회원 탈퇴 섹션 -->
            <div class="card mt-4">
                <div class="card-body">
                    <h5 class="card-title text-danger">회원 탈퇴</h5>
                    <form action="/users/userDelete" method="POST">
                        <p>회원 탈퇴를 원하시면 아래 버튼을 눌러주세요.</p>
                        <button type="submit" class="btn btn-danger">회원 탈퇴</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Import necessary JS files -->
    <c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
    <c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import> <!-- Import Bootstrap JS -->

</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 수정</title>
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

        /* Center the content */
        .container {
            max-width: 600px; /* Increased the width of the form */
            padding: 20px; /* Increased padding to make the form more spacious */
            background-color: #ffffff;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            border-radius: 6px;
            margin-top: 60px; /* Reduced top margin slightly */
            border-left: 4px solid #ffcc00;
        }

        /* Title styling */
        h2 {
            text-align: center;
            margin-bottom: 20px; /* Increased margin to give space around the title */
            color: #333;
            font-weight: bold;
            font-size: 24px; /* Increased font size for better readability */
        }

        /* Form styling */
        .form-group {
            margin-bottom: 20px;
        }

        /* Input styling */
        .form-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            font-size: 16px;
            background-color: #f8f9fa;
        }

        .form-control:focus {
            border-color: #ffcc00;
            background-color: #ffffff;
            box-shadow: 0 0 6px rgba(255, 204, 0, 0.25);
        }

        /* Button styling */
        .btn {
            width: 100%;
            padding: 15px; /* Increased padding for larger buttons */
            background-color: #ffcc00;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background-color: #e6b800;
        }

        /* Small screen adjustments */
        @media (max-width: 768px) {
            .container {
                margin-top: 20px;
                padding: 20px;
            }
            h2 {
                font-size: 22px;
            }
        }
    </style>
</head>

<body>

    <!-- Main content -->
    <div class="container">
        <h2>프로필 수정</h2>

        <!-- Display user information as input fields -->
        <form action="./update" method="post">
            <!-- 현재 비밀번호 -->
            <div class="form-group">
                <label for="currentPassword">현재 비밀번호:</label>
                <input type="password" id="currentPassword" name="currentPassword" class="form-control" required>
            </div>

            <!-- 새 전화번호 -->
            <div class="form-group">
                <label for="newPhone">새 전화번호:</label>
                <input type="text" id="newPhone" name="newPhone" class="form-control" required>
            </div>

            <!-- 새 이메일 -->
            <div class="form-group">
                <label for="newEmail">새 이메일:</label>
                <input type="email" id="newEmail" name="newEmail" class="form-control" required>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn">수정하기</button>
        </form>

        <!-- User action buttons -->
        <div class="mt-3">
            <button type="button" class="btn" onclick="location.href='./profile'">프로필 보기</button>
            <button type="button" class="btn mt-2" onclick="location.href='./getList'">예약 내역 확인</button>
            <button type="button" class="btn mt-2" onclick="location.href='./userDelete'">회원 탈퇴</button>
        </div>
    </div>

    <!-- Import necessary JS files -->
    <c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import> <!-- Import Bootstrap JS -->
    <script src="/resources/js/users/update.js"></script> <!-- Custom JS if needed -->
    <c:import url="/WEB-INF/views/templates/footer.jsp"></c:import> <!-- Import footer -->
</body>

</html>

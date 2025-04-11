<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
    <c:import url="/WEB-INF/views/templates/header.jsp"></c:import>

    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 400px;
            padding: 12px;
            background-color: #ffffff;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            border-radius: 6px;
            margin-top: 80px;
            border-left: 4px solid #ffcc00;
        }

        h2 {
            text-align: center;
            margin-bottom: 16px;
            color: #333;
            font-weight: bold;
            font-size: 24px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            font-size: 16px;
            background-color: #f8f9fa;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #ffcc00;
            box-shadow: 0 0 6px rgba(255, 204, 0, 0.25);
            background-color: #ffffff;
        }

        .btn {
            width: 100%;
            padding: 12px;
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

        .home-btn {
            display: block;
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            background-color: #ffcc00;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            width: 160px;
            margin-left: auto;
            margin-right: auto;
            font-size: 14px;
        }

        .home-btn:hover {
            background-color: #e6b800;
        }

        label {
            font-weight: bold;
            color: #343a40;
            font-size: 14px;
        }

        /* 메시지 출력용 스타일 */
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }

        .success-message {
            color: green;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>로그인</h2>
        <form id="login_form" action="./login" method="post">
            <!-- 아이디 -->
            <div class="form-group">
                <label for="userID">아이디:</label>
                <input type="text" id="userID" name="userID" class="form-control" required placeholder="아이디를 입력하세요">
                <div class="error-message" id="userID_error"></div>
            </div>

            <!-- 비밀번호 -->
            <div class="form-group">
                <label for="password">비밀번호:</label>
                <input type="password" id="password" name="password" class="form-control" required placeholder="비밀번호를 입력하세요">
                <div class="error-message" id="password_error"></div>
            </div>

            <!-- 아이디 저장 -->
            <div class="form-group form-check">
                <input type="checkbox" id="remember_me" name="remember_me" class="form-check-input">
                <label for="remember_me" class="form-check-label">ID저장</label>
            </div>

            <!-- 로그인 버튼 -->
            <button type="button" id="login_button" class="btn">로그인</button>
        </form>

        <a href="/" class="home-btn">HOME</a>
    </div>

    <!-- JS import -->
    <c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
    <c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
    <script src="/resources/js/users/login.js"></script>
</body>
</html>

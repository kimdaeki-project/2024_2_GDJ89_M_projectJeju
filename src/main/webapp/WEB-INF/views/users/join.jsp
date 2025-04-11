<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 페이지</title>
    
    <!-- Import Bootstrap CSS -->
    <c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>  
    <c:import url="/WEB-INF/views/templates/header.jsp"></c:import> <!-- Import header -->

    <!-- Google Fonts: Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
<style>
    /* General resets and body styling */
    body, html {
        height: 100%;
        margin: 0;
        font-family: 'Poppins', sans-serif; /* Changed to Poppins font */
        background-color: #f4f4f4;
    }

    /* Center the form in the middle of the page */
    .container {
        max-width: 400px; /* 조금 더 좁게 */
        padding: 12px; /* 패딩을 약간 줄임 */
        background-color: #ffffff;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1); /* 그림자 크기 조정 */
        border-radius: 6px; /* 테두리 둥글게 줄임 */
        margin-top: 80px; /* 위쪽 마진 줄임 */
        border-left: 4px solid #ffcc00; /* 테두리 두께를 줄임 */
    }

    /* Styling the form header */
    h2 {
        text-align: center;
        margin-bottom: 16px; /* 마진 줄임 */
        color: #333;
        font-weight: bold;
        font-size: 24px; /* 마이페이지와 동일한 크기 */
    }

    /* Form field groups */
    .form-group {
        margin-bottom: 20px; /* 마진 줄임 */
    }

    /* Input field styles */
    .form-control {
        width: 100%;
        padding: 12px; /* 패딩 줄임 */
        border: 1px solid #ced4da;
        border-radius: 4px; /* 테두리 둥글게 줄임 */
        font-size: 14px; /* 폰트 크기 줄임 */
        background-color: #f8f9fa;
        box-sizing: border-box;
        transition: all 0.3s ease;
    }

    .form-control:focus {
        border-color: #ffcc00; /* Focus 색상 변경 */
        box-shadow: 0 0 6px rgba(255, 204, 0, 0.25); /* 그림자 크기 줄임 */
        background-color: #ffffff;
    }

    /* Styling the Submit Button */
    .btn {
        width: 100%;
        padding: 12px; /* 패딩 줄임 */
        background-color: #ffcc00; /* 버튼 색상 */
        color: white;
        border: none;
        border-radius: 4px; /* 테두리 둥글게 줄임 */
        font-size: 16px; /* 버튼 폰트 크기 줄임 */
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .btn:hover {
        background-color: #e6b800; /* Hover 색상 변경 */
    }

    /* Style for the Home Button */
    .home-btn {
        display: block;
        text-align: center;
        margin-top: 20px; /* 마진 줄임 */
        padding: 10px; /* 패딩 줄임 */
        background-color: #ffcc00; /* 버튼 색상 */
        color: white;
        text-decoration: none;
        border-radius: 4px; /* 테두리 둥글게 줄임 */
        width: 160px; /* 너비 줄임 */
        margin-left: auto;
        margin-right: auto;
        font-size: 14px; /* 폰트 크기 줄임 */
    }

    .home-btn:hover {
        background-color: #e6b800; /* Hover 색상 변경 */
    }

    /* Label styling */
    label {
        font-weight: bold;
        color: #343a40;
        font-size: 14px; /* 레이블 폰트 크기 줄임 */
    }
/* 오류 메시지 스타일 */
.error-message {
    color: red;
    font-size: 14px;
    margin-top: 5px;
}

/* 성공 메시지 스타일 */
.success-message {
    color: green;
    font-size: 14px;
    margin-top: 5px;
}

/* 입력 필드와 메시지의 간격을 조정 */
.form-group {
    margin-bottom: 15px;
}

.form-control {
    width: 100%;
    padding: 8px;
    margin-top: 5px;
}

</style>

</head>

<body>
    <!-- Main content -->
   <div class="container">
    <h2>회원가입</h2> 
    <form id="join_form" action="./join" method="post">
        <!-- Name Field -->
  <div class="form-group">
    <label for="name">이름:</label>
    <input type="text" id="name" name="name" class="form-control" >
    <div class="error-message" id="name-error"></div> <!-- 오류 메시지 -->
</div>


        <!-- Username Field -->
		
        <div class="form-group">
            <label for="userID">아이디:</label>
            <input type="text" id="userID" name="userID" class="form-control">
            <div class="error-message" id="userID-error"></div>
            <div class="success-message" id="userID-success"></div>
        </div>


		
        <!-- Password Field -->
        <div class="form-group">
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" class="form-control" >
            <div class="error-message" id="password-error"></div> <!-- 오류 메시지 -->
        </div>

        <!-- Confirm Password Field -->
        <div class="form-group">
            <label for="confirm_password">비밀번호 확인:</label>
            <input type="password" id="confirm_password" name="confirm_password" class="form-control" >
            <div class="error-message" id="confirm_password-error"></div> <!-- 오류 메시지 -->
        </div>

        <!-- Email Field -->
        <div class="form-group">
            <label for="email">이메일:</label>
            <input type="email" id="email" name="email" class="form-control" >
            <div class="error-message" id="email-error"></div> <!-- 오류 메시지 -->
        </div>

        <!-- Phone Field -->
        <div class="form-group">
            <label for="phone">전화번호:</label>
            <input type="tel" id="phone" name="phone" class="form-control">
            <div class="error-message" id="phone-error"></div> <!-- 오류 메시지 -->
        </div>

        <!-- Submit Button -->
        <button id="submit_button" type="submit" class="btn">회원가입</button>
    </form>
</div>


    <!-- Import necessary JS files -->
    <c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
    <c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import> <!-- Import Bootstrap JS -->
    <script src="/resources/js/users/join.js"></script>
</body>

</html>
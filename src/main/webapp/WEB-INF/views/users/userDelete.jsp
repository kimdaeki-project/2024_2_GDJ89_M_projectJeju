<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴</title>
    <c:import url="/WEB-INF/views/templates/boot_css.jsp"/>
    <c:import url="/WEB-INF/views/templates/header.jsp"/>

    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Roboto', sans-serif;
        }

        .delete-container {
            max-width: 500px;
            margin: 80px auto;
            padding: 40px;
            background-color: #ffffff;
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            margin-bottom: 30px;
            font-size: 28px;
            color: #dc3545;
        }

        .form-label {
            font-size: 16px;
            color: #333;
            text-align: left;
            display: block;
            margin-bottom: 8px;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-bottom: 20px;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
            padding: 12px 20px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        .error-message {
            color: red;
            margin-bottom: 16px;
        }
    </style>
</head>
<body>

<div class="delete-container">
    <h2>회원 탈퇴</h2>
    <p>정말 탈퇴하시겠습니까? 비밀번호를 입력해주세요.</p>

    <c:if test="${not empty errorMessage}">
        <div class="error-message">${errorMessage}</div>
    </c:if>

<form action="${pageContext.request.contextPath}/users/userDelete" method="post">
        <label for="password" class="form-label">비밀번호 확인</label>
        <input type="password" id="password" name="password" class="form-control" required>

        <button type="submit" class="btn-danger">탈퇴하기</button>
    </form> 
</div>

<c:import url="/WEB-INF/views/templates/footer.jsp"/>
</body>
</html>

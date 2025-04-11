<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
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
            max-width: 500px;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            border-radius: 6px;
            margin-top: 60px;
            border-left: 4px solid #ffcc00;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-weight: bold;
            font-size: 24px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            font-size: 16px;
            background-color: #f8f9fa;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        input[type="password"]:focus {
            border-color: #ffcc00;
            box-shadow: 0 0 6px rgba(255, 204, 0, 0.25);
            background-color: #ffffff;
        }

        button {
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

        button:hover {
            background-color: #e6b800;
        }

        .alert {
            background-color: #f8f9fa;
            border-color: #e2e3e5;
            font-size: 16px;
            padding: 12px;
            margin-bottom: 15px;
            border-radius: 4px;
        }

        .alert-primary {
            color: #003366;
            background-color: #e9ecef;
            border-color: #003366;
        }

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

    <div class="container">
        <h2>비밀번호 변경</h2>

        <c:if test="${not empty message}">
            <script>
                alert("${message}");
            </script>
        </c:if>

        <!-- ✅ 여기에 정확한 form action 경로 반영 -->
			<form action="./pwUpdate" method="post">
            <div class="form-group">
                <label for="currentPassword">현재 비밀번호</label>
                <input type="password" id="currentPassword" name="currentPassword" required placeholder="현재 비밀번호를 입력하세요" />
            </div>

            <div class="form-group">
                <label for="newPassword">새로운 비밀번호</label>
                <input type="password" id="newPassword" name="newPassword" required placeholder="새로운 비밀번호를 입력하세요" />
            </div>

            <div class="form-group">
                <label for="confirmPassword">새 비밀번호 재입력</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="새 비밀번호를 다시 입력하세요" />
            </div>

            <div>
                <button type="submit">비밀번호 변경</button>
            </div>
        </form>
    </div>

    <c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
    <c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
    <!-- 필요 없다면 login.js는 제거 가능 -->
    <script src="/resources/js/users/login.js"></script>
</body>

</html>

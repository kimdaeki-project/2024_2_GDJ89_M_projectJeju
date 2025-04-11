<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>전화번호 변경</title>
    <c:import url="/WEB-INF/views/templates/boot_css.jsp" />
    <style>
        .container {
            max-width: 500px;
            margin: 60px auto;
            padding: 30px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }
        .form-group {
            margin-bottom: 20px;
        }
        input[type="text"] {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        button {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>전화번호 변경</h2>
    <form action="./phoneUpdate" method="post">
        <div class="form-group">
            <label for="newPhone">새 전화번호</label>
            <input type="text" id="newPhone" name="newPhone" required value="${sessionScope.user.phone}">
        </div>
        <button type="submit">전화번호 변경</button>
    </form>
</div>
<c:import url="/WEB-INF/views/templates/footer.jsp" />
</body>
</html>

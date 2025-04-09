<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import> <!-- Import Bootstrap CSS -->
</head>
<body>
    <div class="container mt-5">
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

    <c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import> <!-- Import Bootstrap JS -->
</body>
</html>

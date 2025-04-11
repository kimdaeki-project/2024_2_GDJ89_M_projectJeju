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
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            width: 90%;
            max-width: 800px;
            margin: 40px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 1000px;
            width: 100%;
        }

        h2 {
            text-align: center;
            font-size: 32px;
            color: #333;
            margin-bottom: 40px;
            font-weight: 700;
        }

        .section {
            background-color: #ffffff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        .section:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .section-title {
            font-size: 22px;
            font-weight: 600;
            color: #007bff;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
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
            width: 50%; /* 버튼 가로 사이즈를 50%로 설정 */
            padding: 14px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-weight: 600;
            display: block;  /* 중앙 정렬을 위해 block 설정 */
            margin: 0 auto;  /* 중앙 정렬 */
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

        .note {
            font-size: 14px;
            color: #666;
            text-align: center;
            margin-top: 20px;
        }

        .user-info {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            background-color: #f7f7f7;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .user-info div {
            flex: 1;
            text-align: center;
        }

        .user-info div:not(:last-child) {
            border-right: 1px solid #ddd;
        }

        .edit-btn {
            margin-top: 20px;
            padding: 12px 24px;
            font-size: 16px;
            background-color: #ffc107;
            color: white;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            width: 30%; /* 버튼 가로 사이즈를 50%로 설정 */
            display: block;  /* 중앙 정렬을 위해 block 설정 */
            margin: 0 auto;  /* 중앙 정렬 */
        }

        .edit-btn:hover {
            background-color: #e0a800;
        }

        .toggle-section-btn {
            margin-top: 15px;
            padding: 12px 24px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            width: 30%; /* 버튼 가로 사이즈를 50%로 설정 */
            display: block;  /* 중앙 정렬을 위해 block 설정 */
            margin: 0 auto;  /* 중앙 정렬 */
            transition: background-color 0.3s ease;
        }

        .toggle-section-btn:hover {
            background-color: #0056b3;
        }
        .reservList {
            text-align: center;
            list-style: none;
        }

        .post-list, .reservation-list {
            list-style-type: none;
            padding: 0;
        }

        .post-item, .reservation-item {
            background-color: #f9f9f9;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .post-item:hover, .reservation-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .post-item p, .reservation-item p {
            color: #555;
            margin: 0;
        }
    </style>

    <script>
        function toggleSection(sectionId) {
            var section = document.getElementById(sectionId);
            section.style.display = (section.style.display === "none" || section.style.display === "") ? "block" : "none";
        }

        function toggleEditSection() {
            var editSection = document.getElementById("edit-section");
            var viewSection = document.getElementById("view-section");
            // 정보 수정 섹션의 상태만 토글합니다.
            editSection.style.display = (editSection.style.display === "none" || editSection.style.display === "") ? "block" : "none";
            viewSection.style.display = (viewSection.style.display === "none" || viewSection.style.display === "") ? "block" : "none";
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
            </div>
            <button class="edit-btn" onclick="toggleEditSection()">정보 수정하기</button>
        </div>

        <!-- 개인정보 수정 섹션 (수정 버튼 클릭 시 표시됨) -->
        <div class="section" id="edit-section" style="display:none;">
            <h3 class="section-title">정보 수정</h3>
            <form action="/users/update" method="POST">
                <div class="form-group">
                    <label for="email" class="form-label">이메일</label>
                    <input type="email" class="form-control" id="email" name="email" value="${sessionScope.user.email}" required>
                </div>
                <div class="form-group">
                    <label for="phone" class="form-label">전화번호</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="${sessionScope.user.phone}" required>
                </div>

                <!-- 비밀번호 변경 섹션 (수정 섹션 안에 포함) -->
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

                <button type="submit" class="btn btn-primary">정보 변경</button>
            </form>
            <button class="btn btn-secondary" onclick="toggleEditSection()">수정 취소</button>
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


        <!-- 예약 내역 확인 섹션 -->
        <div class="section">
            <h3 class="section-title">예약 내역</h3>
            <button class="toggle-section-btn" onclick="toggleSection('reservation-list')">예약 내역 보기</button>
            <ul id="reservation-list" class="reservation-list" style="display:none;">
                <li class="reservation-item">예약 내역 1</li>
                <li class="reservation-item">예약 내역 2</li>
                <li class="reservation-item">예약 내역 3</li>
            </ul>
        </div>
        
        <!-- 내가 쓴 글 섹션 -->
        <div class="section">
            <h3 class="section-title">내가 쓴 글</h3>
            <button class="toggle-section-btn" onclick="toggleSection('post-list')">내가 쓴 글 보기</button>
            <ul id="post-list" class="post-list" style="display:none;">
                <li class="post-item">
                    <table class="table table-striped" id="tbl">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>제목</th>
                                <th>작성일</th>
                                <th>좋아요</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="i" end="${pager.perPage}">
					            <tr onclick="location.href='/boards/detail?boardNum=${i.boardNum}'">
                                    <td>${i.boardNum}</td>
                                    <td>${i.boardTitle}</td>
                                    <td>${i.boardDate}</td>
                                    <td>${i.favorite}</td>
                                    <td>${i.boardHits}</td>
					            </tr>
				            </c:forEach>
                            
                        </tbody>
                    </table>
                    <button id="btnMore" type="submit">더보기</button>
                </li>
            </ul>
        </div>
    </div>

    <c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
    <script src="/resources/js/users/mypage.js"></script>
</body>

</html>

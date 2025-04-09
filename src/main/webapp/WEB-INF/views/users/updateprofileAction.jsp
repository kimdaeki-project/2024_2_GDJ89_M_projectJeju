<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // 요청 파라미터 받기
    String currentPassword = request.getParameter("currentPassword");
    String newPhone = request.getParameter("newPhone");
    String newEmail = request.getParameter("newEmail");

    // 세션에서 사용자 아이디 가져오기
    String userID = (String) session.getAttribute("userID");

    // DB 연결 정보
    String dbURL = "jdbc:mysql://localhost:3306/your_database";
    String dbUserID = "root";
    String dbPassword = "password";

    // DB 연결을 위한 변수들
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        conn = DriverManager.getConnection(dbURL, dbUserID, dbPassword);

        // 현재 비밀번호 확인 쿼리
        String sql = "SELECT password FROM users WHERE userID=?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, userID);
        rs = ps.executeQuery();

        if (rs.next()) {
            String storedPassword = rs.getString("password");

            // 비밀번호 일치 여부 확인
            if (storedPassword.equals(currentPassword)) {
                // 비밀번호가 일치하면, 전화번호와 이메일을 업데이트
                String updateSql = "UPDATE users SET phone=?, email=? WHERE userID=?";
                ps = conn.prepareStatement(updateSql);
                ps.setString(1, newPhone);
                ps.setString(2, newEmail);
                ps.setString(3, userID);

                int updatedRows = ps.executeUpdate();
                if (updatedRows > 0) {
                    out.println("<script>alert('프로필이 성공적으로 업데이트 되었습니다.'); window.location.href='profile.jsp';</script>");
                } else {
                    out.println("<script>alert('업데이트 실패. 다시 시도해주세요.'); history.back();</script>");
                }
            } else {
                out.println("<script>alert('현재 비밀번호가 일치하지 않습니다.'); history.back();</script>");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('에러가 발생했습니다.'); history.back();</script>");
    } finally {
        // PreparedStatement와 ResultSet, Connection 객체를 닫습니다.
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

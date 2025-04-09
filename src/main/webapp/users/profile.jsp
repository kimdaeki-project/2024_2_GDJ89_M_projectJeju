<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
<head>
    <title>프로필</title>
        <c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import> <!-- Import Bootstrap CSS -->
    <c:import url="/WEB-INF/views/templates/header.jsp"></c:import> <!-- Import header -->
    
    <script>
        // 이 부분에서 알림 메시지 띄우는 스크립트를 처리
        window.onload = function() {
            var updateStatus = "<%= request.getParameter("updateStatus") %>";
            
            if (updateStatus) {
                var message = "";
                switch (updateStatus) {
                    case "success":
                        message = "프로필이 성공적으로 업데이트 되었습니다.";
                        break;
                    case "fail":
                        message = "업데이트 실패. 다시 시도해주세요.";
                        break;
                    case "passwordError":
                        message = "비밀번호가 일치하지 않습니다.";
                        break;
                    case "error":
                        message = "시스템 오류가 발생했습니다. 잠시 후 다시 시도해주세요.";
                        break;
                    default:
                        message = "";
                }

                if (message) {
                    alert(message);
                }
            }
        }
    </script>
</head>
<body>
    <h1>프로필</h1>
    <!-- 여기서 사용자 정보 및 프로필 수정 폼을 보여줍니다. -->
</body>
</html>

  <c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
    <c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import> <!-- Import Bootstrap JS -->
 <script src="/resources/js/users/profile.js"></script> <!-- Custom JS if needed -->
</body>
</html>

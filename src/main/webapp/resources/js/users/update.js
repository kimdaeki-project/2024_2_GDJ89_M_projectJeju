// 페이지가 로드되었을 때 이벤트 리스너 등록
window.onload = function() {
    document.getElementById("updateProfileForm").addEventListener("submit", validateForm);
};

// 폼 유효성 검사
function validateForm(event) {
    event.preventDefault(); // 폼 제출을 막고 자바스크립트로 처리

    // 입력값 가져오기
    var currentPassword = document.getElementById("currentPassword").value;
    var newPhone = document.getElementById("newPhone").value;
    var newEmail = document.getElementById("newEmail").value;

    // 비밀번호 확인
    if (currentPassword === "") {
        alert("현재 비밀번호를 입력하세요.");
        return;
    }

    // 전화번호 형식 체크 (숫자만 포함된 10-11자리 전화번호 형식)
    var phoneRegex = /^[0-9]{10,11}$/;
    if (!phoneRegex.test(newPhone)) {
        alert("전화번호는 10~11자리 숫자여야 합니다.");
        return;
    }

    // 이메일 형식 체크
    var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    if (!emailRegex.test(newEmail)) {
        alert("올바른 이메일 형식이 아닙니다.");
        return;
    }

    // 폼 제출
    document.getElementById("updateProfileForm").submit();
}

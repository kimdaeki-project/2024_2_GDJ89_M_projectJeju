// 비밀번호 수정 처리 (별도 페이지/섹션 전용)
function pwUpdate() {
    const currentPassword = document.getElementById('currentPassword').value;
    const newPassword = document.getElementById('newPassword').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    const messageElement = document.getElementById('password-message');

    if (!currentPassword || !newPassword || !confirmPassword) {
        showMessage(messageElement, '모든 필드를 입력해주세요.', false);
        return;
    }

    if (newPassword !== confirmPassword) {
        showMessage(messageElement, '새 비밀번호와 확인 비밀번호가 일치하지 않습니다.', false);
        return;
    }

    // 간단한 비밀번호 유효성 검사 (영문+숫자+특수문자 8자 이상)
    const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&^])[A-Za-z\d@$!%*#?&^]{8,}$/;
    if (!pwRegex.test(newPassword)) {
        showMessage(messageElement, '비밀번호는 8자 이상이며, 영문/숫자/특수문자를 포함해야 합니다.', false);
        return;
    }

    showMessage(messageElement, '비밀번호 수정되었습니다!', true);
    toggleVisibility("password-edit-section");
    alert('새 비밀번호로 로그인하세요.');
}

// 메시지 표시 유틸 함수
function showMessage(element, message, success) {
    element.classList.remove("success-message", "error-message");
    element.classList.add(success ? "success-message" : "error-message");
    element.textContent = message;
    element.style.display = 'block';
}

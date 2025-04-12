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

    const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&^])[A-Za-z\d@$!%*#?&^]{8,}$/;
    if (!pwRegex.test(newPassword)) {
        showMessage(messageElement, '비밀번호는 8자 이상이며, 영문/숫자/특수문자를 포함해야 합니다.', false);
        return;
    }

    // 서버로 현재 비밀번호 및 새 비밀번호 전송
    fetch('/users/change-password', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            currentPassword: currentPassword,
            newPassword: newPassword
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            showMessage(messageElement, '비밀번호가 성공적으로 변경되었습니다.', true);
            toggleVisibility("password-edit-section");
            alert('새 비밀번호로 로그인하세요.');
        } else {
            showMessage(messageElement, data.message || '현재 비밀번호가 일치하지 않습니다.', false);
        }
    })
    .catch(error => {
        console.error('오류 발생:', error);
        showMessage(messageElement, '서버 오류가 발생했습니다.', false);
    });
}

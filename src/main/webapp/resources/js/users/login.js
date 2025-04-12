document.addEventListener("DOMContentLoaded", () => {
    const userID = document.getElementById("userID");
    const password = document.getElementById("password");
    const rememberID = document.getElementById("rememberID");
    const loginButton = document.getElementById("login_button");
    const loginForm = document.getElementById("login_form");

    // 저장된 아이디 불러오기
    const savedID = localStorage.getItem("rememberedUserID");
    if (savedID) {
        userID.value = savedID;
        rememberID.checked = true;
    }

    // ✨ 에러/성공 메시지 표시 함수
    function showError(fieldId, message) {
        const errorElement = document.getElementById(`${fieldId}_error`);
        if (errorElement) {
            errorElement.textContent = message;
            errorElement.style.display = 'block';
        }
    }

    function hideError(fieldId) {
        const errorElement = document.getElementById(`${fieldId}_error`);
        if (errorElement) {
            errorElement.style.display = 'none';
        }
    }

    function showSuccess(fieldId, message) {
        const successElement = document.getElementById(`${fieldId}_success`);
        if (successElement) {
            successElement.textContent = message;
            successElement.style.display = 'block';
        }
    }

    function hideSuccess(fieldId) {
        const successElement = document.getElementById(`${fieldId}_success`);
        if (successElement) {
            successElement.style.display = 'none';
        }
    }

    // 로그인 버튼 클릭 시
    loginButton.addEventListener("click", (e) => {
        // 에러/성공 초기화
        hideError("userID");
        hideError("password");
        hideSuccess("userID");
        hideSuccess("password");

        let valid = true;

        const trimmedID = userID.value.trim();
        const trimmedPW = password.value.trim();

        // 아이디 유효성 검사
        if (!trimmedID) {
            showError("userID", "아이디를 입력하세요");
            userID.focus();
            valid = false;
        } else if (trimmedID.length < 4) {
            showError("userID", "아이디는 4자 이상 입력하세요");
            userID.focus();
            valid = false;
        }

        // 비밀번호 유효성 검사
        const passwordRegex = /^(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$/;
        if (!trimmedPW) {
            showError("password", "비밀번호를 입력하세요");
            if (valid) password.focus();
            valid = false;
        } else if (!passwordRegex.test(trimmedPW)) {
            showError("password", "비밀번호는 8자 이상이며, 특수문자를 포함해야 합니다");
            if (valid) password.focus();
            valid = false;
        }

        if (!valid) {
            e.preventDefault(); // 전송 방지
            return;
        }


        // 로그인 폼 제출
        loginForm.submit();
    });
});

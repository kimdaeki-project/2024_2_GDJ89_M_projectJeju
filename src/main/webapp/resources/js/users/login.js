// DOMContentLoaded 이벤트로 초기 설정
document.addEventListener("DOMContentLoaded", () => {
    const userID = document.getElementById("userID");
    const password = document.getElementById("password");
    const rememberID = document.getElementById("rememberID");
    const loginButton = document.getElementById("login_button");
    const loginForm = document.getElementById("login_form");

    const userIDError = document.getElementById("userID_error");
    const passwordError = document.getElementById("password_error");

    // 저장된 아이디 불러오기
    const savedID = localStorage.getItem("rememberedUserID");
    if (savedID) {
        userID.value = savedID;
        rememberID.checked = true;
    }

    // 클릭 시 유효성 검사 + 로그인 진행
    loginButton.addEventListener("click", (e) => {
        // 에러 초기화
        userIDError.textContent = "";
        passwordError.textContent = "";

        let valid = true;

        // 아이디 유효성 검사
        if (userID.value.trim().length < 4) {
            userIDError.textContent = "아이디는 4자 이상 입력하세요";
            userID.focus();
            valid = false;
        }

        // 비밀번호 유효성 검사
        const passwordRegex = /^(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$/;
        if (!passwordRegex.test(password.value)) {
            passwordError.textContent = "비밀번호는 8자 이상이며, 특수문자를 포함해야 합니다";
            if (valid) password.focus();
            valid = false;
        }

        if (!valid) {
            e.preventDefault(); // 전송 방지
            return;
        }

        // // 아이디 저장 여부 처리
        // if (rememberID.checked) {
        //     localStorage.setItem("rememberedUserID", userID.value);
        // } else {
        //     localStorage.removeItem("rememberedUserID");
        // }

        // 로그인 폼 제출
        loginForm.submit();
    });
});

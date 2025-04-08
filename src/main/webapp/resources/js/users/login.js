const userID = document.getElementById("userID");
const password = document.getElementById("password");
const login_button = document.getElementById("login_button");

login_button.addEventListener('click', () => {
    // 아이디 입력 확인
    if (userID.value.length === 0) {
        alert("아이디 입력은 필수 입니다");
        userID.focus();  // userName -> userID로 수정
        return;
    }

    // 비밀번호 입력 확인
    if (password.value === "") {
        alert("비밀번호 입력은 필수 입니다");
        password.focus();
        return;
    }

    // 폼 제출
    document.getElementById("login_form").submit();
});

// 이메일 수정 처리
function updateEmail() {
    var newEmail = document.getElementById('email').value;
    var messageElement = document.getElementById('email-message');

    // 이메일이 유효한지 체크 (간단한 예시)
    if (!newEmail || !validateEmail(newEmail)) {
        messageElement.classList.add("error-message");
        messageElement.classList.remove("success-message");
        messageElement.textContent = '유효한 이메일을 입력해주세요.';
        messageElement.style.display = 'block';
        return;
    }

    // 이메일 수정 성공
    messageElement.classList.add("success-message");
    messageElement.classList.remove("error-message");
    messageElement.textContent = '이메일 수정되었습니다!';
    messageElement.style.display = 'block';

    // 내 정보에 수정된 이메일을 반영
    document.getElementById('user-email').textContent = newEmail;

    // 이메일 수정 섹션 닫기
    toggleVisibility("email-edit-section");
}

// 전화번호 수정 처리
function updatePhone() {
    var newPhone = document.getElementById('phone').value;
    var messageElement = document.getElementById('phone-message');

    // 전화번호가 유효한지 체크 (간단한 예시)
    if (!newPhone || newPhone.length < 10) {
        messageElement.classList.add("error-message");
        messageElement.classList.remove("success-message");
        messageElement.textContent = '유효한 전화번호를 입력해주세요.';
        messageElement.style.display = 'block';
        return;
    }

    // 전화번호 수정 성공
    messageElement.classList.add("success-message");
    messageElement.classList.remove("error-message");
    messageElement.textContent = '전화번호 수정되었습니다!';
    messageElement.style.display = 'block';

    // 내 정보에 수정된 전화번호를 반영
    document.getElementById('user-phone').textContent = newPhone;

    // 전화번호 수정 섹션 닫기
    toggleVisibility("phone-edit-section");
}

// 비밀번호 수정 처리
function updatePassword() {
    var currentPassword = document.getElementById('currentPassword').value;
    var newPassword = document.getElementById('newPassword').value;
    var confirmPassword = document.getElementById('confirmPassword').value;
    var messageElement = document.getElementById('password-message');

    // 비밀번호가 올바르게 입력되었는지 확인
    if (!currentPassword || !newPassword || !confirmPassword) {
        messageElement.classList.add("error-message");
        messageElement.classList.remove("success-message");
        messageElement.textContent = '모든 필드를 입력해주세요.';
        messageElement.style.display = 'block';
        return;
    }

    if (newPassword !== confirmPassword) {
        messageElement.classList.add("error-message");
        messageElement.classList.remove("success-message");
        messageElement.textContent = '새 비밀번호와 확인 비밀번호가 일치하지 않습니다.';
        messageElement.style.display = 'block';
        return;
    }

    // 비밀번호 수정 성공
    messageElement.classList.add("success-message");
    messageElement.classList.remove("error-message");
    messageElement.textContent = '비밀번호 수정되었습니다!';
    messageElement.style.display = 'block';

    // 비밀번호 수정 섹션 닫기
    toggleVisibility("password-edit-section");

    // 비밀번호 수정 후 사용자에게 알림
    alert('새 비밀번호로 로그인 하세요.');
}

// 이메일 형식 확인 (간단한 예시)
function validateEmail(email) {
    var regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    return regex.test(email);
}

// 수정 섹션 토글 함수
function toggleVisibility(id) {
    const section = document.getElementById(id);
    section.classList.toggle("hidden");
}


// 예약내역 불러오기
const getReservs = document.getElementById("getReservations")
getReservs.addEventListener("click", ()=>{
    fetch("/reservation/getReservsList", {
        method: "get",
        headers: {'Content-type': 'application/x-www-form-urlencoded;charset=utf-8'}
    })
    .then(r=>r.json())
    .then(r=>{
        console.log(r)
        for(let a of r) {
            let time = new Date(a.fGo.depPlandTime);
            console.log(time.toISOString)
        }
    })
})
document.addEventListener("DOMContentLoaded", function () {
    function validateField(field) {
        const value = document.getElementById(field).value;
        let isValid = true;

        switch (field) {
            case 'name':
                if (!value) {
                    showError('name', '이름을 입력해 주세요.');
                    isValid = false;
                }
                break;
            case 'userID':
                if (!value) {
                    showError('userID', '아이디를 입력해 주세요.');
                    isValid = false;
                } else {
                    checkUserIDAvailability(value);
                }
                break;
            case 'password':
                if (!value) {
                    showError('password', '비밀번호를 입력해 주세요.');
                    isValid = false;
                } else {
                    const passwordRegex = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[\W_]).{8,}$/;
                    if (!passwordRegex.test(value)) {
                        showError('password', '비밀번호는 8자 이상, 숫자, 문자, 특수문자를 포함해야 합니다.');
                        isValid = false;
                    }
                }
                break;
            case 'confirm_password':
                const confirmPasswordValue = value;
                const passwordValue = document.getElementById('password').value;
                if (!confirmPasswordValue) {
                    showError('confirm_password', '비밀번호 확인을 입력해 주세요.');
                    isValid = false;
                } else if (passwordValue !== confirmPasswordValue) {
                    showError('confirm_password', '비밀번호와 비밀번호 확인이 일치하지 않습니다.');
                    isValid = false;
                } else {
                    showSuccess('confirm_password', '비밀번호가 일치합니다.');
                }
                break;
            case 'email':
                if (!value) {
                    showError('email', '이메일을 입력해 주세요. ex) sample@com');
                    isValid = false;
                } else {
                    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                    if (!emailRegex.test(value)) {
                        showError('email', '올바른 이메일 주소를 입력해 주세요.');
                        isValid = false;
                    }
                }
                break;
            case 'phone':
                if (!value) {
                    showError('phone', '전화번호를 입력해 주세요. ex)01012345678');
                    isValid = false;
                } else {
                    const phoneRegex = /^\d{10,11}$/;
                    if (!phoneRegex.test(value)) {
                        showError('phone', '전화번호는 하이픈(-) 없이 숫자만 입력해 주세요.');
                        isValid = false;
                    }
                }
                break;
        }

        if (isValid) {
            hideError(field);
        }

        return isValid;
    }

    function checkUserIDAvailability(userID) {
        const existingUserIDs = ['testUser1', 'johnDoe', 'admin'];
        if (existingUserIDs.includes(userID)) {
            showError('userID', '이미 사용 중인 아이디입니다.');
            hideSuccess('userID');
        } else {
            hideError('userID');
            showSuccess('userID', '사용 가능한 아이디입니다.');
        }
    }

    function showError(field, message) {
        const errorElement = document.getElementById(`${field}-error`);
        if (errorElement) {
            errorElement.textContent = message;
            errorElement.style.display = 'block';
        }
    }

    function showSuccess(field, message) {
        const successElement = document.getElementById(`${field}-success`);
        if (successElement) {
            successElement.textContent = message;
            successElement.style.display = 'block';
        }
    }

    function hideError(field) {
        const errorElement = document.getElementById(`${field}-error`);
        if (errorElement) {
            errorElement.style.display = 'none';
        }
    }

    function hideSuccess(field) {
        const successElement = document.getElementById(`${field}-success`);
        if (successElement) {
            successElement.style.display = 'none';
        }
    }

    document.querySelectorAll('.form-control').forEach(input => {
        input.addEventListener('blur', function () {
            validateField(input.id);
        });
    });

    const form = document.getElementById('join_form');
    if (form) {
        form.addEventListener('submit', function (event) {
            let isValid = true;

            document.querySelectorAll('.form-control').forEach(input => {
                if (!validateField(input.id)) {
                    isValid = false;
                }
            });

            if (!isValid) {
                event.preventDefault(); // ❗ 유효성 실패 시만 제출 막음
            }
            // 유효하면 그대로 제출되어 서버로 감 (redirect 처리됨)
        });
    }

    // ✅ 회원가입 성공 알림 처리 (1번만 뜨게)
 const joinSuccess = window.joinSuccess; // 이건 JSP에서 window 변수로 넘겨줘야 해
    const alreadyShown = sessionStorage.getItem("joinSuccessShown");

    // 성공이고, 이전에 안 띄운 경우
    if (joinSuccess && !alreadyShown) {
        alert("회원가입이 완료되었습니다!");
        sessionStorage.setItem("joinSuccessShown", "true");
    }
});
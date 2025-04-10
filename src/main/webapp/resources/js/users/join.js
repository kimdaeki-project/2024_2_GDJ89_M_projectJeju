document.addEventListener("DOMContentLoaded", function() {
    // 회원가입 유효성 검사 함수
    function validateField(field) {
        const value = document.getElementById(field).value;
        let isValid = true;

        // 각 필드에 대해 유효성 검사
        switch(field) {
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
                    // 아이디가 비어 있지 않으면 중복 체크 (실제 서버 요청을 가정)
                    checkUserIDAvailability(value);
                }
                break;
            case 'password':
                if (!value) {
                    showError('password', '비밀번호를 입력해 주세요.');
                    isValid = false;
                } else {
                    // 비밀번호 강도 체크
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
                    showSuccess('confirm_password', '비밀번호가 일치합니다.');  // 비밀번호와 확인이 일치하면 성공 메시지 표시
                }
                break;
            case 'email':
                if (!value) {
                    showError('email', '이메일을 입력해 주세요.');
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
                    showError('phone', '전화번호를 입력해 주세요.');
                    isValid = false;
                } else {
                    const phoneRegex = /^\d{10,11}$/;
                    if (!phoneRegex.test(value)) {
                        showError('phone', '올바른 전화번호를 입력해 주세요.');
                        isValid = false;
                    }
                }
                break;
        }

        // 유효성 검사 후 오류가 없으면 오류 메시지 숨기기
        if (isValid) {
            hideError(field);
        }

        return isValid;
    }

    // 아이디 중복 확인 함수
    function checkUserIDAvailability(userID) {
        // 예시로 서버에서 아이디 중복 체크를 요청하는 코드
        // 실제 서버에서 중복 여부를 판단하는 API를 호출해야 합니다.
        const existingUserIDs = ['testUser1', 'johnDoe', 'admin']; // 예시 데이터
        if (existingUserIDs.includes(userID)) {
            showError('userID', '이미 사용 중인 아이디입니다.');
            hideSuccess('userID');
        } else {
            hideError('userID');
            showSuccess('userID', '사용 가능한 아이디입니다.');
        }
    }

    // 오류 메시지를 각 필드 아래에 표시하는 함수
    function showError(field, message) {
        const errorElement = document.getElementById(`${field}-error`);
        if (errorElement) {
            errorElement.textContent = message;
            errorElement.style.display = 'block'; // 오류 메시지 표시
        }
    }

    // 성공 메시지를 각 필드 아래에 표시하는 함수
    function showSuccess(field, message) {
        const successElement = document.getElementById(`${field}-success`);
        if (successElement) {
            successElement.textContent = message;
            successElement.style.display = 'block'; // 성공 메시지 표시
        }
    }

    // 오류 메시지를 숨기는 함수
    function hideError(field) {
        const errorElement = document.getElementById(`${field}-error`);
        if (errorElement) {
            errorElement.style.display = 'none'; // 오류 메시지 숨기기
        }
    }

    // 성공 메시지를 숨기는 함수
    function hideSuccess(field) {
        const successElement = document.getElementById(`${field}-success`);
        if (successElement) {
            successElement.style.display = 'none'; // 성공 메시지 숨기기
        }
    }

    // 각 입력 필드에 포커스를 잃을 때마다 유효성 검사 진행
    document.querySelectorAll('.form-control').forEach(input => {
        input.addEventListener('blur', function() {
            validateField(input.id); // 입력 필드별 유효성 검사
        });
    });

    // 폼 제출 시 전체 유효성 검사 후 제출 여부 결정
    const form = document.getElementById('join_form');
    if (form) {
        form.addEventListener('submit', function(event) {
            let isValid = true;
            // 모든 필드에 대해 유효성 검사 진행
            document.querySelectorAll('.form-control').forEach(input => {
                if (!validateField(input.id)) {
                    isValid = false;
                }
            });

            // 유효성 검사에 실패하면 폼 제출을 막음
            if (!isValid) {
                event.preventDefault(); // 폼 제출 막기
            } else {
                // 유효성 검사가 성공적으로 끝난 경우, 알럿창 띄우고 홈으로 리다이렉트
                alert('회원가입이 완료되었습니다!');
                window.location.href = '/';  // 홈 페이지로 리다이렉트 (홈 URL로 변경 가능)
            }
        });
    }
});

window.onload = function() {
    // URL에 'updateSuccess' 파라미터가 있는 경우
    const urlParams = new URLSearchParams(window.location.search);
    const updateSuccess = urlParams.get('updateSuccess');

    if (updateSuccess) {
        alert('프로필이 성공적으로 업데이트되었습니다!');
    }
};

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
            const reserv = document.getElementById("reserv")
            while(reserv.firstChild){
                reserv.removeChild(reserv.firstChild)
            }
            try {
                createList(reserv, a);
            } catch (error) {
                
            }
        }
    })
})

function createList(ul, dto) {
    let li = document.createElement("li")
    let box = document.createElement("div")
    box.classList.add("row")

    // // 예약번호 and 탑승객 정보
    // let divider = document.createElement("div")
    // divider.classList.add("col")
    // let divrow = document.createElement("div")
    // divrow.classList.add("row")
    // divrow.innerText = dto.reservNum
    // divider.appendChild(divrow)
    // divrow = document.createElement("div")
    // divrow.classList.add("row")
    // let btn = document.createElement("button")
    // btn.classList.add("btn", "btn-secondary")
    // btn.innerText = '탑승객 정보'
    // divrow.appendChild(btn)
    // divider.appendChild(divrow)
    // box.appendChild(divider)

    // 출발편 시간 공항 좌석구분
    divider = document.createElement("div")
    divider.classList.add("col")
    divrow = document.createElement("div")
    divrow.classList.add("row")
    divrow.innerHTML = '<strong>가는 편</strong>'
    divider.appendChild(divrow)
    divrow = document.createElement("div")
    divrow.classList.add("row")
    divrow.innerText = dto.fGo.depPlandTime + "~"
    divider.appendChild(divrow)
    divrow = document.createElement("div")
    divrow.classList.add("row")
    divrow.innerText = dto.fGo.arrPlandTime
    divider.appendChild(divrow)
    divrow = document.createElement("div")
    divrow.classList.add("row")
    let divcol = document.createElement("div")
    divcol.classList.add("col")
    divcol.innerText = dto.fGo.depAirportNm + "-" + dto.fGo.arrAirportNm
    divrow.appendChild(divcol)
    divcol = document.createElement("div")
    divcol.classList.add("col")
    if(dto.chargeDiv == "prestige" && dto.fGo.prestigeCharge != 0) {
        divcol.innerText = '비즈니스석'
    }else {
        divcol.innerText = '일반석'
    }
    divrow.appendChild(divcol)
    divider.appendChild(divrow)
    box.appendChild(divider)

    // 도착편 시간 공항 좌석구분
    divider = document.createElement("div")
    divider.classList.add("col")
    divrow = document.createElement("div")
    divrow.classList.add("row")
    divrow.innerHTML = '<strong>오는 편</strong>'
    divider.appendChild(divrow)
    divrow = document.createElement("div")
    divrow.classList.add("row")
    divrow.innerText = dto.fCome.depPlandTime + "~"
    divider.appendChild(divrow)
    divrow = document.createElement("div")
    divrow.classList.add("row")
    divrow.innerText = dto.fCome.arrPlandTime
    divider.appendChild(divrow)
    divrow = document.createElement("div")
    divrow.classList.add("row")
    divcol = document.createElement("div")
    divcol.classList.add("col")
    divcol.innerText = dto.fCome.depAirportNm + "-" + dto.fCome.arrAirportNm
    divrow.appendChild(divcol)
    divcol = document.createElement("div")
    divcol.classList.add("col")
    if(dto.chargeDiv == "prestige" && dto.fCome.prestigeCharge != 0) {
        divcol.innerText = '비즈니스석'
    }else {
        divcol.innerText = '일반석'
    }
    divrow.appendChild(divcol)
    divider.appendChild(divrow)
    box.appendChild(divider)

    // 결제방식
    divider = document.createElement("div")
    divider.classList.add("col")
    divrow = document.createElement("div")
    divrow.classList.add("row")
    divrow.innerHTML = '<strong>결제방식</strong>'
    divider.appendChild(divrow)
    divrow = document.createElement("div")
    divrow.classList.add("row")
    switch(dto.payment){
        case 'card' : dto.payment = '카드'
        break;
        case 'mobile_phone' : dto.payment = '휴대폰 결제'
        break;
        case 'virtual_account' : dto.payment = '가상계좌'
        break;
        case 'transfer' : dto.payment = '계좌이체'
        break;
    }
    divrow.innerHTML = `<p>${dto.payment}</p>`
    divider.appendChild(divrow)
    box.appendChild(divider)

    // 결제금액
    divider = document.createElement("div")
    divider.classList.add("col")
    divrow = document.createElement("div")
    divrow.classList.add("row")
    divrow.innerHTML = '<strong>결제금액</strong>'
    divider.appendChild(divrow)
    divrow = document.createElement("div")
    divrow.classList.add("row")
    divrow.innerHTML = `<p>${dto.amount}</p>`
    divider.appendChild(divrow)
    box.appendChild(divider)



    li.appendChild(box)
    ul.appendChild(li)
}


const getBusiness = document.getElementById("getBusiness")
const payments = document.getElementById("payments")
const tossPayments = TossPayments("test_ck_Z1aOwX7K8mYMKa997Ze98yQxzvNP")
const customerKey = Math.random().toString(36);
const payment = tossPayments.payment({ customerKey });
const cardPay = document.getElementById("cardPay")
const phonePay = document.getElementById("phonePay")
const fakeAccount = document.getElementById("fakeAccount")
const realAccount = document.getElementById("realAccount")
const userCheck = document.getElementById("userCheck")


getBusiness.addEventListener("click", ()=>{
  let adultCharge = document.getElementById("adultCharge")
  let childCharge = document.getElementById("childCharge")
  let chargeAmount = document.getElementById("chargeAmount")
  let adult = document.getElementById("adult")
  let child = document.getElementById("child")

  let params = new FormData()
  params.append("adult", adult.innerText)
  params.append("child", child.innerText)

  fetch("./upgrade", {
    method:"post",
    body: params
  })
  .then(r=>r.json())
  .then(r=>{
    if(confirm("가능한 비즈니스석으로 전환하시겠습니까? 추가요금이 발생합니다")){
      if(adultCharge.innerText == r.adultCharge && childCharge.innerText == r.childCharge){
        alert("업그레이드 가능한 비즈니스석이 없습니다")
        getBusiness.setAttribute("disabled", true);
      }else {
        chargeAmount.innerText = r.adultCharge + r.childCharge
        let addb = document.getElementById("addb")
        let addbc = document.getElementById("addbc")
        addb.innerText = "추가요금"
        addbc.innerText = (r.adultCharge - adultCharge.innerText) + (r.childCharge - childCharge.innerText)
        getBusiness.setAttribute("disabled", true);
      }
    }
  })
  
})


// 결제
// 결제번호 생성
let rdm1 = Math.random().toString(36).substring(2, 11);
let rdm2 = Math.random().toString().substring(2, 11);
let rdm3 = Math.random().toString(36).substring(2, 11);
let rdm = rdm2 + rdm1 +"_"+ rdm3

// 결제가격 합산
let chargeAmount = document.getElementById("chargeAmount")
chargeAmount = chargeAmount.innerText*1;
let adult = document.getElementById("adult")
let child = document.getElementById("child")
let infant = document.getElementById("infant")
let person = adult.innerText*1+child.innerText*1+infant.innerText*1;


// 필수정보 미입력 시 결제버튼 비활성화
payments.setAttribute("disabled", "true")
let ips = document.getElementsByClassName("ip")
for(ip of ips) {
  ip.classList.add("is-invalid")
  ip.addEventListener("input", (e)=>{
    if(e.target.value.length > 0) {
      e.target.classList.remove("is-invalid")
      e.target.classList.add("is-valid")
    }else {
      e.target.classList.remove("is-valid")
      e.target.classList.add("is-invalid")
    }
  })
}

let username = document.getElementById("username")
let email = document.getElementById("email")
let tel = document.getElementById("tel")
let phone = document.getElementById("phone")
username.classList.add("is-invalid")
email.classList.add("is-invalid")
tel.classList.add("is-invalid")
phone.classList.add("is-invalid")

username.addEventListener("input", ()=>{
  if(username.value.length > 0) {
    username.classList.remove("is-invalid")
    username.classList.add("is-valid")
  }else {
    username.classList.remove("is-valid")
    username.classList.add("is-invalid")
  }
})

email.addEventListener("input", ()=>{
  if(email.value.length > 0) {
    email.classList.remove("is-invalid")
    email.classList.add("is-valid")
  }else {
    email.classList.remove("is-valid")
    email.classList.add("is-invalid")
  }
})

tel.addEventListener("change", ()=>{
  if(tel.value.length > 0) {
    tel.classList.remove("is-invalid")
    tel.classList.add("is-valid")
  }else {
    tel.classList.remove("is-valid")
    tel.classList.add("is-invalid")
  }
})

phone.addEventListener("input", ()=>{
  if(phone.value.length > 9) {
    phone.classList.remove("is-invalid")
    phone.classList.add("is-valid")
  }else {
    phone.classList.remove("is-valid")
    phone.classList.add("is-invalid")
  }
})


// 회원정보 확인
userCheck.addEventListener("click", ()=>{
  let params = new FormData()
  params.append("userId", username.value)
  params.append("email", email.value)
  params.append("phone", phone.value)
  fetch("./userCheck", {
    method:"post",
    body: params
  })
  .then(r=>r.text())
  .then(r=>{
    if(r.trim() == "1") {
      payments.disabled = false;
    }
  })
})



// 카드 결제
cardPay.addEventListener("click", ()=>{
  payment.requestPayment({
    method: "CARD",
    amount: {
      currency: "KRW",
      value: chargeAmount
    },
    orderId: rdm,
    orderName: "예약자 포함 "+(person)+"인",
    successUrl: window.location.origin + "/reservation/success",
    failUrl: window.location.origin + "/reservation/fail",
    customerEmail: "customer123@gmail.com",
    customerName: "김토스",
    card: {
      useEscrow: false,
      flowMode: "DEFAULT",
      useCardPoint: false,
      useAppCardOnly: false,
    },
  })  
})

// 가상계좌
fakeAccount.addEventListener("click", ()=>{
  payment.requestPayment({
    method: "VIRTUAL_ACCOUNT",
    amount: {
      currency: "KRW",
      value: chargeAmount,
    },
    orderId: rdm,
    orderName: "예약자 포함 "+(person)+"인",
    successUrl: window.location.origin + "/reservation/success",
    failUrl: window.location.origin + "/reservation/fail",
    customerEmail: "customer123@gmail.com",
    customerName: "김토스",
    virtualAccount: {
      cashReceipt: {
        type: "소득공제",
      },
      useEscrow: false,
      validHours: 24,
    },
  });
})

// 계좌이체
realAccount.addEventListener("click", ()=>{
  payment.requestPayment({
    method: "TRANSFER",
    amount: {
      currency: "KRW",
      value: chargeAmount,
    },
    orderId: rdm,
    orderName: "예약자 포함 "+(person)+"인",
    successUrl: window.location.origin + "/reservation/success",
    failUrl: window.location.origin + "/reservation/fail",
    customerEmail: "customer123@gmail.com",
    customerName: "김토스",
    transfer: {
      cashReceipt: {
        type: "소득공제",
      },
      useEscrow: false,
    },
  });
})

// 휴대폰 결제
phonePay.addEventListener("click", ()=>{
  payment.requestPayment({
    method: "MOBILE_PHONE",
    amount: {
      currency: "KRW",
      value: chargeAmount,
    },
    orderId: rdm,
    orderName: "예약자 포함 "+(person)+"인",
    successUrl: window.location.origin + "/reservation/success",
    failUrl: window.location.origin + "/reservation/fail",
    customerEmail: "customer123@gmail.com",
    customerName: "김토스",
  });
})
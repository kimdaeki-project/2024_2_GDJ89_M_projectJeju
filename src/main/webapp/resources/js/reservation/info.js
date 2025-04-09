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
let chargeDiv = "economy";

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
        chargeDiv = "prestige"
        getBusiness.setAttribute("disabled", true);
      }
    }
  })
  
})


// 결제

// 결제가격 합산
let chargeAmount = document.getElementById("chargeAmount")
chargeAmount = chargeAmount.innerText*1;
let adult = document.getElementById("adult")
let child = document.getElementById("child")
let infant = document.getElementById("infant")
let person = adult.innerText*1+child.innerText*1+infant.innerText*1;

let rdm;

// 필수정보 미입력 시 결제버튼 비활성화
payments.setAttribute("disabled", "true")
// 결제 방식 선택 시 탑승정보 및 회원정보 서버로 보내기
let box = document.getElementById("box")
box.addEventListener("click", ()=>{
  if(payments.disabled == true) {
    alert("탑승 정보를 입력해주세요")
  }else {
    // 결제번호 생성
    let rdm1 = Math.random().toString(36).substring(2, 11);
    let rdm2 = Math.random().toString().substring(2, 11);
    let rdm3 = Math.random().toString(36).substring(2, 11);
    rdm = rdm2 + rdm1 +"_"+ rdm3
    getBoarder();
  }
})

// 탑승정보 유효성 검사
let ipns = document.getElementsByClassName("ipn")
let ipbs = document.getElementsByClassName("ipb")
let regName = /^[가-힣]{2,6}$/;
let regBirth = /[0-9]{8}$/;
for(ipn of ipns) {
  ipn.addEventListener("blur", (e)=>{
    if(regName.test(e.target.value)) {
      e.target.classList.add("is-valid")
      e.target.classList.remove("is-invalid")
    }else{
      e.target.value = ""
      e.target.classList.add("is-invalid")
      e.target.classList.remove("is-valid")
    }
  })
}
for(ipb of ipbs) {
  ipb.addEventListener("blur", (e)=>{
    if(regBirth.test(e.target.value)) {
      e.target.classList.add("is-valid")
      e.target.classList.remove("is-invalid")
    }else{
      e.target.value = ""
      e.target.classList.add("is-invalid")
      e.target.classList.remove("is-valid")
    }
  })
}

let username = document.getElementById("username")
let email = document.getElementById("email")
let tel = document.getElementById("tel")
let phone = document.getElementById("phone")

let regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
let regPhone = /^01\d{8,9}/;

username.addEventListener("blur", ()=>{
  if(username.value.length > 0) {
    username.classList.remove("is-invalid")
    username.classList.add("is-valid")
  }else {
    username.classList.remove("is-valid")
    username.classList.add("is-invalid")
  }
})

email.addEventListener("blur", ()=>{
  if(regEmail.test(email.value)) {
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

phone.addEventListener("blur", ()=>{
  if(regPhone.test(phone.value)) {
    phone.classList.remove("is-invalid")
    phone.classList.add("is-valid")
  }else {
    phone.classList.remove("is-valid")
    phone.classList.add("is-invalid")
  }
})


// 회원정보 확인
userCheck.addEventListener("click", ()=>{

  let cs = document.getElementsByClassName("check")
  let check = true;
  for(c of cs) {
    if(c.value == "" || c.classList.contains("is-invalid")){
      c.classList.add("is-invalid")
      check = false;
    }
  }

  if(check) {
    let params = new FormData()
      params.append("userID", username.value)
      params.append("email", email.value)
      params.append("phone", phone.value)
      fetch("./userCheck", {
        method:"post",
        body: params
      })
      .then(r=>r.text())
      .then(r=>{
        if(r.trim().length > 0) {
          payments.disabled = false;
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
              successUrl: window.location.origin + "/reservation/success?reservNum="+rdm,
              failUrl: window.location.origin + "/reservation/fail",
              customerEmail: email.value,
              customerName: r,
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
              successUrl: window.location.origin + "/reservation/success?reservNum="+rdm,
              failUrl: window.location.origin + "/reservation/fail",
              customerEmail: email.value,
              customerName: r,
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
              successUrl: window.location.origin + "/reservation/success?reservNum="+rdm,
              failUrl: window.location.origin + "/reservation/fail",
              customerEmail: email.value,
              customerName: r,
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
              successUrl: window.location.origin + "/reservation/success?reservNum="+rdm,
              failUrl: window.location.origin + "/reservation/fail",
              customerEmail: email.value,
              customerName: r,
            });
          })
        }
      })
  }

})



// 탑승자 정보 가져오기
function getBoarder(){
  
  const aCount = document.getElementById("aCount")
  const cCount = document.getElementById("cCount")
  const iCount = document.getElementById("iCount")
  
  // class Info{
  //   #name;
  //   #birth;
  //   constructor(){};
  
  //   get name(){
  //     return this.#name
  //   }
  //   set name(name){
  //     this.#name = name;
  //   }
  //   get birth(){
  //     return this.#birth
  //   }
  //   set birth(birth){
  //     this.#birth = birth;
  //   }
  // }
  
  
  let params = new FormData();
  params.append("aCount", aCount.value)
  params.append("cCount", cCount.value)
  params.append("iCount", iCount.value)
  params.append("reservNum", rdm)
  params.append("chargeDiv", chargeDiv)

  if(aCount.value > 0) {
    // let adults = [];
    for(let i = 1; i <= aCount.value; i++){
      // let a = new Info();
      // a.name = aName.value;
      // a.birth = aBirth.value;
      // adults.push(a)
      
      let aName = document.getElementById(`a${i}Name`)
      let aBirth = document.getElementById(`a${i}Birth`)
      params.append(`aName${i}`, aName.value)
      params.append(`aBirth${i}`, aBirth.value)
    }
  }
  if(cCount.value > 0) {
    // let children = [];
    for(let i = 1; i <= cCount.value; i++){
      // let c = new Info();
      // c.name = cName.value;
      // c.birth = cBirth.value;
      // children.push(c)
      
      let cName = document.getElementById(`c${i}Name`)
      let cBirth = document.getElementById(`c${i}Birth`)
      params.append(`cName${i}`, cName.value)
      params.append(`cBirth${i}`, cBirth.value)
    }
  }
  if(iCount.value > 0) {
    // let infants = [];
    for(let i = 1; i <= iCount.value; i++){
      // let inf = new Info();
      // inf.name = iName.value;
      // inf.birth = iBirth.value;
      // infants.push(inf)
      
      let iName = document.getElementById(`i${i}Name`)
      let iBirth = document.getElementById(`i${i}Birth`)
      params.append(`iName${i}`, iName.value)
      params.append(`iBirth${i}`, iBirth.value)
    }
  }

  
  fetch("./boarderInfo", {
    method: "post",
    body: params
  })
  .then(r=>r.text())
  .then(r=>{
    console.log(r.trim())
  })

}

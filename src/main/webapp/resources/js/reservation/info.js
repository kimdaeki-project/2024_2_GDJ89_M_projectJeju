const getBusiness = document.getElementById("getBusiness")
const payments = document.getElementById("payments")
const tossPayments = TossPayments("test_ck_Z1aOwX7K8mYMKa997Ze98yQxzvNP")
const customerKey = Math.random().toString(36);
const payment = tossPayments.payment({ customerKey });


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
      }else {
        chargeAmount.innerText = r.adultCharge + r.childCharge
        let addb = document.getElementById("addb")
        let addbc = document.getElementById("addbc")
        addb.innerText = "추가요금"
        addbc.innerText = (r.adultCharge - adultCharge.innerText) + (r.childCharge - childCharge.innerText)
      }
    }
  })
  
})


payments.addEventListener("click", ()=>{



  let chargeAmount = document.getElementById("chargeAmount")
  chargeAmount = chargeAmount.innerText*1;
  let adult = document.getElementById("adult")
  let child = document.getElementById("child")
  let infant = document.getElementById("infant")
  let person = adult.innerText*1+child.innerText*1+infant.innerText*1;
  payment.requestPayment({
    method: "CARD",
    amount: {
      currency: "KRW",
      value: chargeAmount
    },
    orderId: "t7kafy3XztXOJ_VvKT886",
    orderName: "예약자 외 "+(person-1)+"인",
    successUrl: window.location.origin + "/success.html",
    failUrl: window.location.origin + "/fail.html",
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
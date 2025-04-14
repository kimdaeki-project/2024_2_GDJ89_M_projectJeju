const flightSearch = document.getElementById("flightSearch")
const person = document.getElementById("person")
const depAirportId = document.getElementById("depAirportId")
const arrAirportId = document.getElementById("arrAirportId")
const depPlandTime = document.getElementById("depPlandTime")
const depPlandTimeToCome = document.getElementById("depPlandTimeToCome")
const searchForm = document.getElementById("searchForm")
const accordion = document.getElementById("accordionExample")
const btn = document.getElementById("pills-flights-tab")


function getAirportList () {
  let url = "http://apis.data.go.kr/1613000/DmstcFlightNvgInfoService/getArprtList?serviceKey=J0mHq1R1fL8PBzcOJXPlaICPhvWctJpIQoAUJNzx1fUeMzFU9bjNRoAuwfN%2FC1w79pvPN5onz8835x6feTa2yA%3D%3D&_type=json"

  fetch(url)
  .then(r=>r.json())
  .then(r=>{

    let ar = r.response.body.items.item

    for(let e of ar){
      
      if(e.airportId=="NAARKPC"){
        continue;
      }
      let opt = document.createElement("option")
      if(e.airportId=="NAARKSS"){
        opt.setAttribute("selected", "true")
      }
      opt.value = e.airportId
      opt.innerHTML = e.airportNm
      depAirportId.appendChild(opt)

    }
      
  })
}

getAirportList();

flightSearch.addEventListener("click", ()=>{
    
  if(adult.value+child.value+infant.value == 0) {
    alert("여정은 최소 한명의 탑승객이 있어야 합니다")
  }else if(depPlandTime.value == "" || depPlandTimeToCome.value == ""){
    alert("여행 일정을 입력해주세요")
  }else{
    
    let params = new FormData();
    params.append("arrAirportId", arrAirportId.value)
    params.append("depAirportId", depAirportId.value)
    params.append("depPlandTime", depPlandTime.value)
    params.append("depPlandTimeToCome", depPlandTimeToCome.value)
    params.append("adult", adult.value)
    params.append("child", child.value)
    params.append("infant", infant.value)
  
    fetch("./search", {
      method: "POST",
      body: params
    })
    .then(r=>r.text())
    .then(r=>{
      searchForm.setAttribute("action", "./list")
      searchForm.setAttribute("method", "post")
      searchForm.submit();
    })
  }

})

const adult = document.getElementById("adult")
const infant = document.getElementById("infant")
person.addEventListener("click", (e)=>{

  if(e.target.classList.contains("bi-dash-lg")) {
    if(e.target.parentNode.nextElementSibling.value <= infant.value && e.target.parentNode.nextElementSibling.id == "adult") {
      alert("유아는 반드시 동반하는 성인이 있어야 합니다")
    }else {
      e.target.parentNode.nextElementSibling.value = e.target.parentNode.nextElementSibling.value - 1;
      if(e.target.parentNode.nextElementSibling.value < 0) {
        e.target.parentNode.nextElementSibling.value = 0
      }
    }
  }

  if(e.target.classList.contains("bi-plus-lg")) {
    if(e.target.parentNode.previousElementSibling.value == adult.value && e.target.parentNode.previousElementSibling.id == "infant") {
      alert("유아는 반드시 동반하는 성인이 있어야 합니다")
    }else {
      e.target.parentNode.previousElementSibling.value = Number(e.target.parentNode.previousElementSibling.value) + 1;
      if(e.target.parentNode.previousElementSibling.value > 9) {
        e.target.parentNode.previousElementSibling.value = 9
      }
    }
  }
})


depPlandTime.addEventListener("change", ()=>{
  let now = new Date();
  now = now.toISOString().substring(0, 10)
  if(depPlandTime.value < now ) {
    alert("가는 날짜는 오늘 이후로 검색이 가능합니다")
    depPlandTime.value = now
  }
  if(depPlandTime.value > depPlandTimeToCome.value && depPlandTimeToCome.value != "") {
    alert("오는 날짜는 가는 날짜 이후로 검색이 가능합니다")
    depPlandTimeToCome.value = depPlandTime.value
  }
})

depPlandTimeToCome.addEventListener("change", ()=>{
  if(depPlandTime.value > depPlandTimeToCome.value) {
    alert("오는 날짜는 가는 날짜 이후로 검색이 가능합니다")
    depPlandTimeToCome.value = depPlandTime.value
  }
})
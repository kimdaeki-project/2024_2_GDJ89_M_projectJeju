const flightSearch = document.getElementById("flightSearch")
const person = document.getElementById("person")
const depAirportId = document.getElementById("airportId")
const depPlandTime = document.getElementById("depPlandTime")
const arrPlandTime = document.getElementById("arrPlandTime")
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
      airportId.appendChild(opt)

    }
      
  })
}

getAirportList();

flightSearch.addEventListener("click", ()=>{
    
    searchForm.setAttribute("action", "./list")
    searchForm.setAttribute("method", "post")
    searchForm.submit();

})

person.addEventListener("click", (e)=>{

  if(e.target.classList.contains("bi-dash-lg")) {
    e.target.parentNode.nextElementSibling.value = e.target.parentNode.nextElementSibling.value - 1;
    if(e.target.parentNode.nextElementSibling.value < 0) {
      e.target.parentNode.nextElementSibling.value = 0
    }
  }

  if(e.target.classList.contains("bi-plus-lg")) {
    e.target.parentNode.previousElementSibling.value = Number(e.target.parentNode.previousElementSibling.value) + 1;

    if(e.target.parentNode.previousElementSibling.value > 9) {
      e.target.parentNode.previousElementSibling.value = 9
    }
  }

})


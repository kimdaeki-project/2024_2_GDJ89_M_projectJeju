const btnSearch = document.getElementById("btnSearch")
const depAirportId = document.getElementById("depAirportId")
const plandGoDate = document.getElementById("plandGoDate")
const plandComeDate = document.getElementById("plandComeDate")
const person = document.getElementById("person")
const searchfrm = document.getElementById("searchfrm")


btnSearch.addEventListener("click", ()=>{

  searchfrm.submit();

})

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


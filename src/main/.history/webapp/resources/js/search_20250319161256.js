const select01 = document.getElementById("select01");




function getAirportList () {
  let url = "http://apis.data.go.kr/1613000/DmstcFlightNvgInfoService/getArprtList?serviceKey=J0mHq1R1fL8PBzcOJXPlaICPhvWctJpIQoAUJNzx1fUeMzFU9bjNRoAuwfN%2FC1w79pvPN5onz8835x6feTa2yA%3D%3D&_type=json"

  fetch(url)
  .then(r=>r.json())
  .then(r=>{
    console.log(r.response.body.items.item)

    let ar = r.response.body.items.item

    for(let e of ar){
      
      let opt = document.createElement("option")
      opt.value = e.airportId
      opt.innerHTML = e.airportNm
      select01.appendChild(opt)
    }
      
  })
}

getAirportList();
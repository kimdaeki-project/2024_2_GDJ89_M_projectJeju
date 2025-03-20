// init

const depAirportId = document.getElementById("depAirportId")
const arrAirportId = 'NAARKPC'

const li1 = document.getElementById("list-1-list")
const li2 = document.getElementById("list-2-list")
const li3 = document.getElementById("list-3-list")
const li4 = document.getElementById("list-4-list")
const li5 = document.getElementById("list-5-list")
const li6 = document.getElementById("list-6-list")
const li7 = document.getElementById("list-7-list")
const lis = [li1, li2, li3, li4, li5, li6, li7]

const co1 = document.getElementById("list-1")
const co2 = document.getElementById("list-2")
const co3 = document.getElementById("list-3")
const co4 = document.getElementById("list-4")
const co5 = document.getElementById("list-5")
const co6 = document.getElementById("list-6")
const co7 = document.getElementById("list-7")
const cos = [co1, co2, co3, co4, co5, co6, co7]


function init (){

  let d = new Date();
  d = d.toISOString().substring(0, 10).replaceAll("-", "")
  
  let url = `https://apis.data.go.kr/1613000/DmstcFlightNvgInfoService/getFlightOpratInfoList?serviceKey=J0mHq1R1fL8PBzcOJXPlaICPhvWctJpIQoAUJNzx1fUeMzFU9bjNRoAuwfN%2FC1w79pvPN5onz8835x6feTa2yA%3D%3D&_type=json&depAirportId=${depAirportId.value}&arrAirportId=${arrAirportId}&depPlandTime=${d}`
 

  let td = new Date();
  let a1d = new Date(td); a1d.setDate(td.getDate()+1)
  let a2d = new Date(td); a2d.setDate(td.getDate()+2)
  let a3d = new Date(td); a3d.setDate(td.getDate()+3)
  let a4d = new Date(td); a4d.setDate(td.getDate()+4)
  let a5d = new Date(td); a5d.setDate(td.getDate()+5)
  let a6d = new Date(td); a6d.setDate(td.getDate()+6)

  li1.innerHTML = td.toISOString().substring(0, 10).replaceAll("-", "")
  li2.innerHTML = a1d.toISOString().substring(0,10).replaceAll("-", "")
  li3.innerHTML = a2d.toISOString().substring(0,10).replaceAll("-", "")
  li4.innerHTML = a3d.toISOString().substring(0,10).replaceAll("-", "")
  li5.innerHTML = a4d.toISOString().substring(0,10).replaceAll("-", "")
  li6.innerHTML = a5d.toISOString().substring(0,10).replaceAll("-", "")
  li7.innerHTML = a6d.toISOString().substring(0,10).replaceAll("-", "")

  getList();

}

function getList() {
  
  
  for(let i = 0; i < 7; i++){

    let url = new URL("https://apis.data.go.kr/1613000/DmstcFlightNvgInfoService/getFlightOpratInfoList");
    
    url.searchParams.append("serviceKey", "J0mHq1R1fL8PBzcOJXPlaICPhvWctJpIQoAUJNzx1fUeMzFU9bjNRoAuwfN/C1w79pvPN5onz8835x6feTa2yA==")
    url.searchParams.append("_type", "json")
    url.searchParams.append("depAirportId", depAirportId.value)
    url.searchParams.append("arrAirportId", arrAirportId)
    url.searchParams.append("depPlandTime", lis[i].innerHTML)
    
    fetch(url)
    .then(r=>r.json())
    .then(r=>{

      let total = r.response.body.totalCount
      let items = r.response.body.items.item
      
      if(total == 0) {
        let table = document.createElement("table")
        table.classList.add("table", "table-hover")
        table.id = "tab"+i
        cos[i].appendChild(table)
      }else if( total == 1) {
        createTable(cos[i], items, i)
      }else {
        createTables(cos[i], items, i)
      }

    })

  }

}

// getAirportList

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

    init();
      
  })
}

getAirportList();

// list

function createTable(target, i, idx){
  let table = document.createElement("table")
  table.classList.add("table", "table-hover")
  table.id = "tab"+idx

  let thead = document.createElement("thead")
  table.appendChild(thead)
  let tr = document.createElement("tr")
  thead.appendChild(tr)
  let th = document.createElement("th")
  tr.appendChild(th).innerHTML = "항공사"
  th = document.createElement("th")
  tr.appendChild(th).innerHTML = "편명"
  th = document.createElement("th")
  tr.appendChild(th).innerHTML = "출발지"
  th = document.createElement("th")
  tr.appendChild(th).innerHTML = "도착지"
  th = document.createElement("th")
  tr.appendChild(th).innerHTML = "출발시간"
  th = document.createElement("th")
  tr.appendChild(th).innerHTML = "도착시간"
  th = document.createElement("th")
  tr.appendChild(th).innerHTML = "운임"

  let tbody = document.createElement("tbody")
  table.appendChild(tbody)

  
    tr = document.createElement("tr")
    tbody.appendChild(tr)
    let td = document.createElement("td")
    tr.appendChild(td).innerHTML = i.airlineNm
    td = document.createElement("td")
    tr.appendChild(td).innerHTML = i.vihicleId
    td = document.createElement("td")
    tr.appendChild(td).innerHTML = i.depAirportNm
    td = document.createElement("td")
    tr.appendChild(td).innerHTML = i.arrAirportNm
    td = document.createElement("td")
    tr.appendChild(td).innerHTML = i.depPlandTime
    td = document.createElement("td")
    tr.appendChild(td).innerHTML = i.arrPlandTime
    td = document.createElement("td")
    if(i.economyCharge == null) {
      tr.appendChild(td).innerHTML = "-"
    }else{
      tr.appendChild(td).innerHTML = i.economyCharge
    }



  target.appendChild(table)
}

function createTables(target, items, idx){
  let table = document.createElement("table")
  table.classList.add("table", "table-hover")
  table.id = "tab"+idx

  let thead = document.createElement("thead")
  table.appendChild(thead)
  let tr = document.createElement("tr")
  thead.appendChild(tr)
  let th = document.createElement("th")
  tr.appendChild(th).innerHTML = "항공사"
  th = document.createElement("th")
  tr.appendChild(th).innerHTML = "편명"
  th = document.createElement("th")
  tr.appendChild(th).innerHTML = "출발지"
  th = document.createElement("th")
  tr.appendChild(th).innerHTML = "도착지"
  th = document.createElement("th")
  tr.appendChild(th).innerHTML = "출발시간"
  th = document.createElement("th")
  tr.appendChild(th).innerHTML = "도착시간"
  th = document.createElement("th")
  tr.appendChild(th).innerHTML = "운임"

  let tbody = document.createElement("tbody")
  table.appendChild(tbody)

  for(let i of items) {
    tr = document.createElement("tr")
    tbody.appendChild(tr)
    let td = document.createElement("td")
    tr.appendChild(td).innerHTML = i.airlineNm
    td = document.createElement("td")
    tr.appendChild(td).innerHTML = i.vihicleId
    td = document.createElement("td")
    tr.appendChild(td).innerHTML = i.depAirportNm
    td = document.createElement("td")
    tr.appendChild(td).innerHTML = i.arrAirportNm
    td = document.createElement("td")
    tr.appendChild(td).innerHTML = i.depPlandTime
    td = document.createElement("td")
    tr.appendChild(td).innerHTML = i.arrPlandTime
    td = document.createElement("td")
    if(i.economyCharge == null) {
      tr.appendChild(td).innerHTML = "-"
    }else{
      tr.appendChild(td).innerHTML = i.economyCharge
    }

  }

  target.appendChild(table)
}

// function createTable(target, idx) {
//   let table = document.createElement("table")
//   table.classList.add("table", "table-hover")
//   table.id = "tab"+idx
//   target.appendChild(table)
// }


try {
  depAirportId.addEventListener("change", ()=>{
    for(let i = 0; i < 7; i++){
  
      let tab = document.getElementById(`tab${i}`)
      tab.remove();
    }
    getList();
  })
} catch (error) {
  console.log(error)
}

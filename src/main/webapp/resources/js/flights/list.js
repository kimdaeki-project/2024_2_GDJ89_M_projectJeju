// init

const selectBox = document.getElementById("selectBox")

const depAirportId = document.getElementById("depAirportId")
const airlineNm = document.getElementById("airlineNm")
const arrAirportId = 'NAARKPC'
const accordion = document.getElementById("accordion")
const reForm = document.getElementById("reForm")
const btns = document.getElementsByClassName("btn")

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

const di1 = document.getElementById("list1")
const di2 = document.getElementById("list2")
const di3 = document.getElementById("list3")
const di4 = document.getElementById("list4")
const di5 = document.getElementById("list5")
const di6 = document.getElementById("list6")
const di7 = document.getElementById("list7")
const dis = [di1, di2, di3, di4, di5, di6, di7]



function init (){

  getAirlineList();
  getAirportList();

  for(let btn of btns){
    btn.addEventListener("click", (e)=>{
      let flightNum = e.target.parentNode.parentNode.parentNode.parentNode.parentNode.previousElementSibling
      console.log(flightNum.value)
    })
  }

}

init();

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
      opt.value = e.airportId
      opt.innerHTML = e.airportNm
      depAirportId.appendChild(opt)
      
    }
    
  })
}


// getAirlineList

function getAirlineList() {
  let url = "http://apis.data.go.kr/1613000/DmstcFlightNvgInfoService/getAirmanList?serviceKey=J0mHq1R1fL8PBzcOJXPlaICPhvWctJpIQoAUJNzx1fUeMzFU9bjNRoAuwfN%2FC1w79pvPN5onz8835x6feTa2yA%3D%3D&_type=json"
  
  fetch(url)
  .then(r=>r.json())
  .then(r=>{
    let ar = r.response.body.items.item
    
    for(let e of ar) {

      let opt = document.createElement("option")
      opt.value = e.airlineId
      opt.innerHTML = e.airlineNm
      airlineNm.appendChild(opt)
    }
  })
}

// list

selectBox.addEventListener("click", (e)=>{
  if(e.target.classList.contains("list-group-item")) {
    let input = document.createElement("input")
    input.setAttribute("type", "hidden")
    input.setAttribute("value", e.target.innerText)
    input.setAttribute("name", "depPlandTime")
    selectBox.appendChild(input)

    
    reForm.setAttribute("action", './list')
    reForm.setAttribute("method", "post")
    reForm.submit();

  }
})

depAirportId.addEventListener("change", ()=>{

  let input = document.createElement("input")
  input.setAttribute("type", "hidden")
  input.setAttribute("value", li4.innerText)
  input.setAttribute("name", "depPlandTime")
  selectBox.appendChild(input)

  reForm.setAttribute("action", './list')
  reForm.setAttribute("method", "post")
  reForm.submit();

})

airlineNm.addEventListener("change", ()=>{
  
  let input = document.createElement("input")
  input.setAttribute("type", "hidden")
  input.setAttribute("value", li4.innerText)
  input.setAttribute("name", "depPlandTime")
  selectBox.appendChild(input)

  reForm.setAttribute("action", './list')
  reForm.setAttribute("method", "post")
  reForm.submit();
  
})


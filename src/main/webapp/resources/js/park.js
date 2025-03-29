const select = document.getElementById("select");
const form = document.getElementById("form");
const card = document.getElementById("card");
const airportNm = document.getElementById("airportNm");
const stat = document.getElementById("stat");
const per = document.getElementById("per");
const max = document.getElementById("max");
const park = document.getElementById("park");
function getAirportList () {
    let url = "http://apis.data.go.kr/1613000/DmstcFlightNvgInfoService/getArprtList?serviceKey=J0mHq1R1fL8PBzcOJXPlaICPhvWctJpIQoAUJNzx1fUeMzFU9bjNRoAuwfN%2FC1w79pvPN5onz8835x6feTa2yA%3D%3D&_type=json"
  
    fetch(url)
    .then(r=>r.json())
    .then(r=>{
  
      let ar = r.response.body.items.item
        for (let e of ar) {
            var op = document.createElement("option");
             op.value = e.airportNm 
        op.innerHTML = e.airportNm
        select.appendChild(op)
        }
    })
  }  
function getParkDetail(code){
    fetch("https://cors-anywhere.herokuapp.com/http://openapi.airport.co.kr/service/rest/AirportParkingCongestion/airportParkingCongestionRT?serviceKey=UY0LceQLBv9nnI8YXrbNCDHXrZX5m%2ByqFe06WQ7WLL%2FliRvUp5DX9GaJqb4zHbvXtihjasHEhyoOTC8d57nkHQ%3D%3D&pageNo=1&numOfRows=20&schAirportCode="+code)
        .then(r=>r.text())
        .then(r=>{
            if (code==''){
                airportNm.innerText="DATA가 없습니다."
                stat.innerText="DATA가 없습니다."
                per.innerText="DATA가 없습니다."
                max.innerText="DATA가 없습니다."
                park.innerText="DATA가 없습니다."
            }
            let parser = new DOMParser();
        let Doc = parser.parseFromString(r, "text/xml");
        let name = Doc.getElementsByTagName("airportKor")[0];
        let cper = Doc.getElementsByTagName("parkingCongestionDegree")[0].textContent;
        let space = Doc.getElementsByTagName("parkingTotalSpace")[0].textContent; 
        let cstat = Doc.getElementsByTagName("parkingCongestion")[0].textContent;
        let se = Number(Doc.getElementsByTagName("parkingOccupiedSpace")[0].textContent);
        let sa = Number(Doc.getElementsByTagName("parkingTotalSpace")[0].textContent); 
        let poss = sa - se;
        airportNm.innerText=name.textContent;
        stat.innerText="상태 : "+cstat;
        per.innerText="혼잡률 : "+cper;
        max.innerText="총 자리 수 : "+space;
        park.innerText="주차 가능 자리 수 : "+poss;
        })
}
  
  
 
getAirportList();
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 


select.addEventListener('change', async ()=>{
    if (select.value=='김포'){
        ps.keywordSearch('김포공항 근처 주차장', placesSearchCB);
        var code = 'GMP';
    }else if (select.value=='인천'){
        ps.keywordSearch('인천공항 근처 주차장', placesSearchCB);
        var code = '';
    }else if (select.value=='광주'){
        ps.keywordSearch('광주공항 근처 주차장', placesSearchCB);
        var code = 'KWJ';
    }else if (select.value=='사천'){
        ps.keywordSearch('사천공항 근처 주차장', placesSearchCB);
        var code = '';
    }else if (select.value=='무안'){
        ps.keywordSearch('무안공항 근처 주차장', placesSearchCB);
        var code = '';
    }else if (select.value=='군산'){
        ps.keywordSearch('군산공항 근처 주차장', placesSearchCB);
        var code = 'KUV';
    }else if (select.value=='여수'){
        ps.keywordSearch('여수공항 근처 주차장', placesSearchCB);
        var code = 'RSU';
    }else if (select.value=='양양'){
        ps.keywordSearch('양양공항 근처 주차장', placesSearchCB);
        var code = '';
    }else if (select.value=='김해'){
        ps.keywordSearch('김해공항 근처 주차장', placesSearchCB);
        var code = 'PUS';
    }else if (select.value=='울산'){
        ps.keywordSearch('울산공항 근처 주차장', placesSearchCB);
        var code = 'USN';
    }else if (select.value=='대구'){
        ps.keywordSearch('대구공항 근처 주차장', placesSearchCB);
        var code = 'TAE';
    }else if (select.value=='청주'){
        ps.keywordSearch('청주공항 근처 주차장', placesSearchCB);
        var code = 'CJJ';
    }else if (select.value=='제주'){
        ps.keywordSearch('제주공항 근처 주차장', placesSearchCB);
        var code = 'CJU'
    }else if (select.value=='포항'){
        ps.keywordSearch('포항공항 근처 주차장', placesSearchCB);
        var code = '';
    }else if (select.value=='원주'){
        ps.keywordSearch('원주공항 근처 주차장', placesSearchCB);
        var code = 'WJU';
    }
    getParkDetail(code);
})
    

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
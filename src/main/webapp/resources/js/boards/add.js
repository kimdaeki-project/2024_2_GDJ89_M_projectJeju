const locationResult = document.getElementById("locationResult");
const loc = document.getElementById("loc");



loc.addEventListener('change', ()=>{
    console.log(loc.value)

    fetch("./check?location="+loc.value)
    .then(r=>r.text())
    .then(r=>{
        if (r.trim()=='0'){
            locationResult.innerText=''
        }else if(r.trim()=='1'){
            locationResult.innerText='지역을 선택하세요.'
        }
    })
})


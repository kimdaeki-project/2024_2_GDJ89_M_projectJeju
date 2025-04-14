const locationResult = document.getElementById("locationResult");
const loc = document.getElementById("loc");
const summernote = document.getElementById("summernote");
const title = document.getElementById("title");


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

title.addEventListener('keydown', ()=>{
    console.log(title.value)
})


let currentPage = 1;

document.getElementById("btnMore").addEventListener('click', ()=>{
    console.log("click")
    fetch("mypage?page="+currentPage)
    .then(r=>r.text())
    .then(data=>{
        currentPage++;
    })
    .catch(error=>console.error("데이터 로딩 실패", error))
})
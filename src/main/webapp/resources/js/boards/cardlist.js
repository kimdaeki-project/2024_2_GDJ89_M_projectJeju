const cardList_form = document.getElementById("cardList_form");
const cpages = document.getElementsByClassName("cpages")
const cpageNum = document.getElementById("cpageNum");
const cardlist = document.getElementById("cardlist");

for (let cp of cpages){
    cp.addEventListener('click', ()=>{
        console.log("cardlist")
        cpageNum.value=cp.getAttribute("data-cpage-num");
        cardList_form.submit();
    })
}
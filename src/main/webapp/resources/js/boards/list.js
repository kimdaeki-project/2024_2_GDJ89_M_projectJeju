const pages = document.getElementsByClassName("pages");
const list_form = document.getElementById("list_form");
const pageNum = document.getElementById("pageNum");
const sklist = document.getElementById("sklist");
const tbody = document.getElementById("tbody");
const cardlist = document.getElementById("cardlist");
const loc = document.getElementById("loc");

for (let p of pages) {
    p.addEventListener("click", function(){
        console.log(p.getAttribute("data-page-num"));
        pageNum.value=p.getAttribute("data-page-num");
        console.log(pageNum.value)
        list_form.submit();
    })
}

function change(){
    var select = document.getElementById("sklist");

    var selectValue = select.options[select.selectedIndex].value;
    console.log(selectValue)
    list_form.submit();
}

function locat(){
    var lcselect = document.getElementById("loc");

    var lcselectValue = lcselect.options[lcselect.selectedIndex].value;
    console.log(lcselectValue)
    list_form.submit();
}

cardlist.addEventListener('click', ()=>{
    console.log("cardlist");
    fetch('http://localhost/boards/cardlist')
    .then(r=>r.text())
    .then(r=>{
        console.log("${list.boardTitle}")
    })
})
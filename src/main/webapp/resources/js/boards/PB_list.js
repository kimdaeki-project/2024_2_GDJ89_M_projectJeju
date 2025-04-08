const pages = document.getElementsByClassName("pages");
const pageNum = document.getElementById("pageNum");
const list_form = document.getElementById("list_form");

for (let p of pages) {
    p.addEventListener("click", function(){
        console.log(p.getAttribute("data-page-num"));
        pageNum.value=p.getAttribute("data-page-num");
        list_form.submit();
    })
}
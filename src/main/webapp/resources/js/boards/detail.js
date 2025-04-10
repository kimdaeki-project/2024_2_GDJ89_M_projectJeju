const btnHeart = document.getElementById("btnHeart");
const commentsListResult = document.getElementById("commentsListResult");
const ID = document.getElementById("commentUserID");
const pw = document.getElementById("commentPassword");
const boardContents = document.getElementById("boardContents");
const up = document.getElementById("up");
const addComments = document.getElementById("addComments");
const modal_change = document.getElementById("modal_change");

btnHeart.addEventListener('click', ()=>{
    console.log(btnHeart.getAttribute("data-heart-num"))
})

addComments.addEventListener('click', async()=>{
    console.log(boardContents.value);

    await add();
    await getList(1);
})

function makeForm(pn, contents){
    let f = new FormData();
    f.append("boardNum", pn);
    f.append("boardContents", contents)

    return f;
}

function makeParam(pn, contents){
    let p = new URLSearchParams();
    p.append("boardNum", pn);
    p.append("boardContents", contents);

    return p;
}

getList(1);

function getList(page){
    let pn = up.getAttribute("data-board-num");
    fetch(`commentsList?boardNum=${pn}&page=${page}`)
    .then(r=>r.text())
    .then(r=>{
        commentsListResult.innerHTML=r;
    })
    .catch(e=> console.log(e))
}

function add(){
    let pn = up.getAttribute("data-board-num");

    let p = makeForm(pn, boardContents.value)

    fetch('./addComments', {
        method:'POST',
        body:p
    })
    .then(r=>r.text())
    .then(r=>{
        if(r.trim()*1>0){

        }else {

        }

        boardContents.value="";
    })
    .catch(e=>{
        alert('에러')
    })
}

commentsListResult.addEventListener('click', async (e)=>{
    if(e.target.classList.contains('deleteComments')){
        let p = e.target.getAttribute("data-delete-commentNum");

        let f = new FormData();
        f.append("commentNum", p);

        await fetch("./deleteComments", {
            method:'POST',
            body:f
        })
        .then(r=>r.text())
        .then(r=>{
            if(r.trim()*1>0){
                alert('삭제 성공')
            }else {
                alert('삭제 실패')
            }
        })
        .catch(e=>{
            console.log(e)
            alert('변수 발생')
        })

        getList(1)
    }
})


commentsListResult.addEventListener('click', async (e)=>{
    if(e.target.classList.contains("updateComments")){
        let ud = e.target;//button
        let ud_s= ud.parentElement.previousElementSibling.previousElementSibling.previousElementSibling;

        let c = ud_s.innerHTML;
        // ud_s.innerHTML=`<textarea>${c}</textarea>`;
        document.getElementById('message-text').value=c;
        c = ud.getAttribute("data-update-commentNum")
        document.getElementById('message-text').setAttribute("data-commentNum", c)

    }
})

modal_change.addEventListener('click', ()=>{
    m = document.getElementById('message-text')
    console.log(m)
    //commentsUpdate post
    let f = new FormData();
    f.append("boardContents", m.value);
    f.append("commentNum", m.getAttribute("data-commentNum"))


    fetch('./updateComments', {
        method:'POST',
        body:f
    })
    .then(r=>r.text())
    .then(r=>{
        document.getElementById(`c${m.getAttribute("data-commentNum")}`).innerHTML=m.value;
        
        
    })
    .catch(e=>{})
    .finally(()=>{
        m.value="";
        m.setAttribute("data-commentNum", "");
        //document.getElementById("modal_close").click();
    }
        
    )
    ;
    getList(1)
})
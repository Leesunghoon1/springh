/**
 * 
 */
	console.log(bnoVal);

    async function postCommentToServer(cmtData){
        try {
            const url = "/comment/post";
            const config = {
                method:"post",
                headers:{
                    'content-type':'application/json; charset=utf-8'
                },
                body:JSON.stringify(cmtData)
            };
    
            const resp = await fetch(url, config);
            const result = await resp.text(); // isOk;
            return result;
        } catch (error) {
            console.log(error)
        }
    }

    // 댓글등록 버튼 누르면 이벤트 발생
    document.getElementById('cmtPostBtn').addEventListener('click', ()=>{
        const cmtWriter = document.getElementById('cmtWriter').innerText;
        const cmtContent = document.getElementById('cmtContent');
        console.log("작성자" + cmtWriter + "내용" + cmtContent);
        if(cmtContent.value == "" || cmtContent.value == null){
            alert("댓글을 입력해 주세요!!");
            cmtContent.focus();
            return false;
        } else{
            let cmtData = {
                bno:bnoVal,
                writer:cmtWriter,
                content:cmtContent.value
            };
            postCommentToServer(cmtData).then(result =>{
                //(cmtData)를 서버에 보내고, 서버에서 반환된 결과를 처리하기 위해 then 메서드를 사용합니다
                if(result == 1) {
                    //result mapper에서 0 , 1 을 반환함
                    alert("댓글 작성 성공")
                    document.getElementById('cmtContent').value = '';
                    //작성한 댓글을 입력하는 텍스트 상자(cmtContent)를 비웁니다. 이렇게 하면 사용자가 새로운 댓글을 입력할 수 있게 됩니다.
                    //화면에 뿌리기
                    getCommentList(bnoVal);
                }
            })
        }
    })

<<<<<<< HEAD
    async function spreadCommentListFromServer(bno, page) {
        try {
            const url = '/comment/' + bno + "/" + page;
=======
    async function spreadCommentListFromServer(bno) {
        try {
            const url = '/comment/' + bno;
>>>>>>> c94f2285d7e7854f13a6790a7d20357dca3690f7
            const resp = await fetch(url);
            const result = await resp.json();
            return result;
        } catch (error) {
            console.log(error);
        }
    }

<<<<<<< HEAD
// 화면에 뿌리기(처음 뿌릴때는 첫페이지 값을 뿌려야 함)
function getCommentList(bno, page=1){
    

    
    spreadCommentListFromServer(bno, page).then(result =>{
        console.log(result);
        let tr = document.getElementById('comment-table');
        if(page == 1) {
            tr.innerHTML = '';
        }
        if(result.cmtList.length > 0){
            tr.innerHTML = `<tr><th>작성자</th><th>댓글내용</th><th scope="col">등록일</th><th scope="col">수정/삭제</th></tr>`;
            
            for(let i = 0; i < result.cmtList.length; i++){
                let str = '';
                 str += `<tr data-cno="${result.cmtList[i].cno}" data-writer="${result.cmtList[i].writer}" data-content="${result.cmtList[i].content}">`;
                str += `<td>${result.cmtList[i].writer}</td>`;
                str += `<td>${result.cmtList[i].content}</td>`;
                str += `<td>${result.cmtList[i].modAt}</td>`;
                    str += `<td><button class="btn modBtn btn-outline-secondary" type="button" id="modBtn" data-bs-toggle="modal" data-bs-target="#comment-modal">수정</button>`;
                    str += `<button class="btn delBtn btn-outline-secondary" type="button" id="delBtn">삭제</button></td></tr>`;
                tr.innerHTML += str;    
            }
        }
         // 댓글 더보기 버튼 존재 여부
         let moreBtn = document.getElementById('moreBtn');
         console.log(moreBtn);
         // db에서 pgvo + list 같이 가져와야 값을 줄 수 있음
         if(result.pgvo.pageNo < result.endPage||result.next){
             moreBtn.style.visibility = 'visible';
             //더이상 
             moreBtn.dataset.page = page + 1;
         } else{
             moreBtn.style.visibility = 'hidden';
         }
    })
}

// 댓글 삭제 통신
async function deleteCommentToServer(cno){
    let uri = '/comment/'+cno;
    let config = {
        method : 'delete'
    }
    let resp = await fetch(uri, config);
    let result = await resp.text();
    return result;
}

async function editCommentToServer(cmtDataMod) {
    console.log("이거는 들어왔냐 ? cmtModData" + cmtDataMod)
    try {
        const url = '/comment/'+cmtDataMod.cno;
        const config = {
            method:'put',
            headers:{
                'content-type':'application/json; charset=utf-8'
            },
            body : JSON.stringify(cmtDataMod)
        };
            const resp = await fetch(url, config);
            const result = await resp.text();
            return result;
            console.log(result);
        } catch (error) {
            console.log(error);
        }
}

document.addEventListener('click', (e) =>{
    let tr = e.target.closest('tr');
    // 댓글 삭제
    if(e.target.classList.contains('delBtn')){
        let cnoVal = tr.dataset.cno;
        let writerVal = tr.dataset.writer;
        console.log("cno : " + cnoVal);
        deleteCommentToServer(cnoVal).then(result =>{
            if(result == 1){
                alert("댓글 삭제 성공!!");
                getCommentList(bnoVal);
            }
        })
        //댓글 수정
    }else if(e.target.classList.contains('modBtn')){
        let cnoVal = tr.dataset.cno;
        let writerVal = tr.dataset.writer;
        let cmtText = tr.dataset.content;
        document.getElementById('modal-text').value = cmtText;
        //모달창 벨류를 cmtText에 넣기
        console.log("cno : " + cnoVal + ", content : " + cmtText);
        document.querySelector('.update-comment').addEventListener('click', ()=>{
            let cmtDataMod = {
                cno :cnoVal,
                writer : writerVal,
                content : document.getElementById('modal-text').value
            };
            console.log(cmtDataMod);
            editCommentToServer(cmtDataMod).then(result =>{
                if(result == 1){
                    document.querySelector('.btn-close').click();
                    alert("댓글 수정 성공!!");
                }
                getCommentList(bnoVal);
            })

        })
        // 댓글 더보기
    } else if(e.target.id == 'moreBtn'){
        console.log(e.target.id);
        getCommentList(bnoVal, parseInt(e.target.dataset.page));
    }
})


=======
    // 화면에 뿌리기(처음 뿌릴떄는 첫 페이지 값을 뿌려야 함)
// 화면에 뿌리기(처음 뿌릴때는 첫페이지 값을 뿌려야 함)
function getCommentList(bno){
    spreadCommentListFromServer(bno).then(result =>{
        console.log(result);
        let tr = document.getElementById('comment-table');
        // if(page == 1){
        // }
        
        if(result.length > 0){
        tr.innerHTML = `<tr><th>작성자</th><th>댓글내용</th><th scope="col">등록일</th><th scope="col">수정/삭제</th></tr>`;
            for(let i = 0; i < result.length; i++){
                let str = `<tr data-cno="${result[i].cno}" data-writer="${result[i].writer}" data-content="${result[i].content}">`;
                str += `<td>${result[i].writer}</td>`;
                str += `<td>${result[i].content}</td>`;
                str += `<td>${result[i].modAt}</td>`;
                    str += `<td><button class="btn modBtn btn-outline-secondary" type="button" id="modBtn" data-bs-toggle="modal" data-bs-target="#comment-modal">수정</button>`;
                    str += `<button class="btn delBtn btn-outline-secondary" type="button" id="delBtn">삭제</button></td></tr>`;
                tr.innerHTML += str;
            }
        }
    })
}
>>>>>>> c94f2285d7e7854f13a6790a7d20357dca3690f7

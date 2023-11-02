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

    async function spreadCommentListFromServer(bno) {
        try {
            const url = '/comment/' + bno;
            const resp = await fetch(url);
            const result = await resp.json();
            return result;
        } catch (error) {
            console.log(error);
        }
    }

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
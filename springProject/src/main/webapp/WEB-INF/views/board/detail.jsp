<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
	.table-box{
		width: 900px;
	}
	.button-box{
		margin-bottom:15px;
	}
	#comment-table>tbody>tr>th{
	text-align: center;
	}
	#comment-table>tbody>tr>td{
		text-align: center;
	}
	#comment-input{
		margin-bottom:15px;
	}
	.delBtn, .modBtn, #file-mod-bt{
		margin-right:5px;
	}
	.file-div{
		display: flex;
		justify-content: space-between;
	}
	.file-div>div>span{
		margin-right:15px;
	}
	.tumbnail>img{
		border-radius: 5px;
		width: 25px;
		height:25px;
	}
</style>
<body>

	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />
	<h1>디테일 페이지</h1>

	<table border="1">

		<tr>
			<th>BNO</th>
			<td>${bvo.bno }</td>
		</tr>
		<tr>
			<th>TITLE</th>
			<td>${bvo.title }</td>
		</tr>

		<tr>
			<th>WRITER</th>
			<td>${bvo.writer }</td>
		</tr>

		<tr>
			<th>REG_DATE</th>
			<td>${bvo.regAt }</td>
		</tr>
		<tr>
			<th>CONTENT</th>
			<td>${bvo.content }</td>
		</tr>
		<tr>
			<th>READ_COUNT</th>
			<td>${bvo.readCount }</td>
		</tr>

	</table>
	<div class="button-box">
		<a href="/board/modify?bno=${bvo.bno }">
			<button type="button" id="button" class="btn btn-outline-secondary">수정</button>
		</a>
	</div>
<<<<<<< HEAD
	<div>
		<div>
			<div>
				<div>

					<!-- 댓글영역  -->
					<!-- 댓글 영역 -->
					<div class="comment-box">
						<div class="input-group flex-nowrap" id="comment-input">
							<span class="input-group-text" id="cmtWriter">
								${bvo.writer} </span> <input type="text" class="form-control"
								id="cmtContent" placeholder="댓글 입력" aria-label="Username"
								aria-describedby="addon-wrapping">
							<button class="btn btn-outline-secondary" type="button"
								id="cmtPostBtn">댓글등록</button>
						</div>
						<div class="title"></div>
						<table id="comment-table" class="table table-dark table-hover">
						
						</table>
					</div>

					<!-- 댓글 더보기 영역  -->


					<button type="button" id="moreBtn" data-page="1"
						class="btn btn-secondary" style="visibility: hidden">MORE</button>
				</div>
			</div>

		</div>

	</div>
	<!-- 모달창 -->

	<!-- 모달창 -->
	<div>
		<div>
			<div class="modal" id="comment-modal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">댓글수정</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>

						<div class="modal-body">
							<div class="input-group mb-3">
								<span class="input-group-text" id="basic-addon1">${bvo.writer}</span>
								<input type="text" id="modal-text" class="form-control"
									placeholder="댓글 입력" aria-label="Username"
									aria-describedby="basic-addon1">
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-primary update-comment">수정</button>
						</div>
					</div>
				</div>
			</div>

		</div>

		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
=======

	<!-- 댓글영역  -->
	<!-- 댓글 영역 -->
	<div class="comment-box">
		<div class="input-group flex-nowrap" id="comment-input">
				<span class="input-group-text" id="cmtWriter"> ${bvo.writer} </span>
				<input type="text" class="form-control" id="cmtContent"
					placeholder="댓글 입력" aria-label="Username"
					aria-describedby="addon-wrapping">
				<button class="btn btn-outline-secondary" type="button"
					id="cmtPostBtn">댓글등록</button>
		</div>
		<div class="title"></div>
		<table id="comment-table" class="table table-dark table-hover">
		</table>
	</div>


>>>>>>> c94f2285d7e7854f13a6790a7d20357dca3690f7








<<<<<<< HEAD


<script type="text/javascript">
		let bnoVal = `<c:out value="${bvo.bno}" />`;
		console.log(bnoVal);
		<!-- js랑 연결해서 열기 -->
	</script>


<script type="text/javascript" src="/resources/js/boardComment.js"></script>
<script type="text/javascript">
		getCommentList(bnoVal);

		<!-- js랑 연결해서 열기 -->
	</script>

<jsp:include page="../common/footer.jsp" />
=======
	<script type="text/javascript">
		let bnoVal = `<c:out value="${bvo.bno}" />`;
		console.log(bnoVal);
	</script>

	<script type="text/javascript" src="/resources/js/boardComment.js"></script>
	<script type="text/javascript">
		getCommentList(bnoVal);
	</script>

	<jsp:include page="../common/footer.jsp" />
>>>>>>> c94f2285d7e7854f13a6790a7d20357dca3690f7

</body>
</html>
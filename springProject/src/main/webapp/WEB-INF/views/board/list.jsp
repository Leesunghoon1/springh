<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />



	<div>
		<form action="/board/list">
			<div class="search-box">
				<!-- 검색영역 -->
				<div>
					<c:set value="${ph.pgvo.type }" var="typed" />
					<select class="form-select" aria-label="Default select example"
						name="type">
						<option ${empty typed ? 'selected' : ''}>Search Type</option>
						<option value="t" ${typed eq 't' ? 'selected' : ''}>Title</option>
						<option value="w" ${typed eq 'w' ? 'selected' : ''}>Writer</option>
						<option value="c" ${typed eq 'c' ? 'selected' : ''}>Content</option>
						<option value="tw" ${typed eq 'tw' ? 'selected' : ''}>Title+Writer</option>
						<option value="tc" ${typed eq 'tc' ? 'selected' : ''}>Title+Content</option>
						<option value="cw" ${typed eq 'cw' ? 'selected' : ''}>Content+Writer</option>
						<option value="twc" ${typed eq 'twc' ? 'selected' : ''}>All</option>
					</select>
				</div>
				<div>
					<input name="keyword" value="${ph.pgvo.keyword}"
						class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search"> <input type="hidden" name="pageNo"
						value="1">
					<!-- type 검색시 첫 페이지 화면으로 띄우기 -->
					<input type="hidden" name="qty" value="${ph.pgvo.qty}">
				</div>
				<div>
					<button type="submit">
						Search <span
							class="position-absolute top-0 start-100 translate-middle badge rounded-pill text-bg-Light">
							${ph.totalCount} <span class="visually-hidden">unread
								messages</span>
						</span>
					</button>
				</div>
			</div>
		</form>

		<table>
			<tr>
				<td>#</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>

			<c:forEach items="${list }" var="bvo">
				<tr>
					<td>${bvo.bno }</td>
					<td><a href="/board/detail?bno=${bvo.bno }">${bvo.title }</a></td>
					<td>${bvo.writer }</td>
					<td>${bvo.modAt }</td>
					<td>${bvo.readCount }</td>

				</tr>
			</c:forEach>
		</tablE>
		<div class="paging-box">
			<!-- 페이징 영역 -->
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<!-- prev -->
					<li class="page-item ${(ph.prev eq false) ? 'disabled' : ''}">
						<a class="page-link"
						href="/board/list?pageNo=${ph.startPage - 1}&qty=${ph.pageQty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a>
					</li>
					<!-- pageNo -->
					<c:forEach begin="${ph.startPage}" end="${ph.endPage}" var="i">
						<li class="page-item"><a
							id="${ph.pgvo.pageNo eq i ? 'clicked' : ''}" class="page-link"
							href="/board/list?pageNo=${i}&qty=${ph.pageQty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i}</a></li>
					</c:forEach>

					<!-- next -->
					<li class="page-item ${(ph.next eq false) ? 'disabled' : ''}">
						<a class="page-link"
						href="/board/list?pageNo=${ph.endPage + 1}&qty=${ph.pageQty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a>
					</li>
				</ul>
			</nav>
		</div>



	</div>









































	<jsp:include page="../common/footer.jsp" />
</body>
</html>
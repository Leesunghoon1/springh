<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register page</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>

<form action="/board/register" method="post">

<div class="mb-3">
  <label for="t" class="form-label">제목</label>
  <input type="text" class="form-control" name="title" id="t" placeholder="제목">
</div>

<div class="mb-3">
  <label for="w" class="form-label">작성자</label>
  <input type="text" class="form-control" name="writer" id="w" placeholder="Email">
</div>


<div class="mb-3">
  <label for="c" class="form-label">내용</label>
  <input type="text" class="form-control" name="content" id="c" placeholder="내용">
</div>

<button type="submit" class="btn btn-dark" id="regBtn">버튼</button>
</form>




<jsp:include page="../common/footer.jsp"/>
</body>
</html>
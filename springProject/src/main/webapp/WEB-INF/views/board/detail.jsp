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

<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/nav.jsp"/>
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

<a href="/board/modify?bno=${bvo.bno }"><button>수정</button></a>
<a href="/"><button>삭제</button></a>
<a href="/"><button>리스트</button></a>


<jsp:include page="../common/footer.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 문의글 보기</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/font.css?ver=2021-07-15-000" />
<style>
div.my_header {
	height: 144px;
	background-color: #9e6e4e;
}

div.my_header div.header_name {
	color: white;
	
	width: 1056px;
	margin: 0 auto;
	text-align:left;
	line-height: 6rem;
	background-color: #9e6e4e;
}

div.my_header div.header_name h2 {
	font-size: 30px;
}

article.qna_container, table.qna_table {
	width:1056px;
	margin: 2px auto;
}

article.qna_container table.qna_table th, td {
	border-top: 1px solid #aaa;
	padding: 10px;
	max-width: 500px;

	text-align: center;
}
article.qna_container table.qna_table th {
	background-color: #ccc;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<div class="my_header">
	<div class="header_name">
		<h2>내 문의글 보기</h2>
	</div>
</div>

<article class="qna_container">

<table class="qna_table">

<c:if test="${empty MYQNA}">
	<tr>
		<td colspan="3">작성한 문의글이 없습니다.</td>
	</tr>
</c:if>

<c:if test="${not empty MYQNA}">
	<tr>
		<th>상품이름</th>
		<th>제목</th>
		<th>등록일</th>
	</tr>
<c:forEach items="${MYQNA}" var="MYQ">
	<tr data-code="${MYQ.q_code}">
		<td>${MYQ.it_title}</td>
		<td>${MYQ.q_title}</td>
		<td>${MYQ.q_date}</td>
	</tr>
</c:forEach>

</c:if>
</table>
</article>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script>
document.querySelector("table.qna_table").addEventListener("click", (e)=>{
	
	let code = e.target.closest("TR").dataset.code
	
	location.href="${rootPath}/view_qna?code="+code
	
	
})
</script>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/font.css?ver=2021-07-15-000" />
<style>
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

<script>
document.querySelector("table.qna_table").addEventListener("click", (e)=>{
	
	let code = e.target.closest("TR").dataset.code
	
	location.href="${rootPath}/mypage/view_qna?code="+code
	
	
})
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
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

article.review_container, table.review_table {
	width:1056px;
	margin: 2px auto;
}

article.review_container table.review_table th, td {
	border-top: 1px solid #aaa;
	padding: 10px;
	max-width: 500px;

	text-align: center;
}
article.review_container table.review_table th {
	background-color: #ccc;
}

article.review_container table.review_table td.content p {
	width:100%;
	display: -webkit-box;
	word-wrap: break-word;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
<article class="review_container">

<table class="review_table">

<c:if test="${empty MYREVIEW}">
	<tr>
		<td colspan="4">작성한 후기글이 없습니다.</td>
	</tr>
</c:if>

<c:if test="${not empty MYREVIEW}">
	<tr>
		<th>상품사진</th>
		<th>후기</th>
		<th>등록일</th>
		<th>평점</th>
	</tr>
<c:forEach items="${MYREVIEW}" var="MYR">
	<tr data-code="${MYR.r_code}">
		<td><img src="${rootPath}/MalangImages/${MYR.it_photo}"></td>
		<td class="content"><p>${MYR.r_content}</td>
		<td>${MYR.r_date}</td>
		<td>${MYR.r_score}</td>
	</tr>
</c:forEach>

</c:if>
</table>
</article>

<script>
document.querySelector("table.review_table").addEventListener("click", (e)=>{
	
	let code = e.target.closest("TR").dataset.code
	/* alert(code) */
	/* location.href="${rootPath}/member/view_review/"+code */
	location.href="${rootPath}/view_review?code="+code
	
	
})
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/font.css?ver=2021-07-15-000" />
<style>
article.qna_wrap, table.qna_view {
	width:1056px;
	margin: 2px auto;
}


</style>

<article class="qna_wrap">
<div class="button_box">
	<button class="update">수정하기</button>
	<button class="delete">삭제하기</button>
</div>
<table class="qna_veiw">
<tr>
	<td colspan="2">${QNA.it_title}</td>
</tr>
<tr>
	<td>${QNA.q_title}</td>
	<td>${QNA.q_date}</td>
</tr>
<tr>
	<td colspan="2">${QNA.q_content}</td>
</table>

</article>
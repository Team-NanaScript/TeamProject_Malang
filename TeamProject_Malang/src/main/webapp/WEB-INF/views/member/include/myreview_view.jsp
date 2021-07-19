<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/font.css?ver=2021-07-15-000" />
<style>
article.review_wrap, table.review_view {
	width:1056px;
	margin: 2px auto;
}

div.button_box {
	text-align: right;
	padding: 5px;
}

table.review_view th, td {
	border-top: 1px solid #aaa;
	padding-top :10px;
	padding-bottom : 10px;

	text-align: center;
}

table.review_view tr:last-child th, table.review_view tr:last-child td {
	border-bottom: 1px solid #aaa;
}
</style>

<article class="review_wrap">
<div class="button_box">
	<button class="update">수정하기</button>
	<button class="delete">삭제하기</button>
</div>
<table class="review_view">
<tr>
	<td><img src="${REVIEW.it_photo}"></td>
	<td>${REVIEW.it_title}</td>
	<td>${REVIEW.r_score}</td>
</tr>
<tr>
	<td colspan="2">${REVIEW.r_odoption}</td>
	<td>${REVIEW.r_date}</td>
</tr>
<tr>
	<td colspan="3">${REVIEW.r_content}</td>
</table>
</article>
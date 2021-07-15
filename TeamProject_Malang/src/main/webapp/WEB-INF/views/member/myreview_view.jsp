<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REVIEW VIEW</title>
</head>
<body>
<article class="review_wrap">
<div class="button_box">
	<button class="update">수정하기</button>
	<button class="delete">삭제하기</button>
</div>
<table class="review_veiw">
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
</body>
</html>
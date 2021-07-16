<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA VIEW</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/font.css?ver=2021-07-15-000" />
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
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

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
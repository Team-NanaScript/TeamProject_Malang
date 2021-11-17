<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>말랑 - 문의내용</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/font.css?ver=2021-07-15-000" />
<style>
article.qna_wrap, table.qna_view {
	width:700px;
	margin: 2px auto;
}

div.container {
	width: 1056px;
	margin: 0 auto;
}

table.qna_view tr td{
	border-top: 1px solid #ccc;
	padding: 10px;
}

table.qna_view tr:nth-last-of-type(1) td{
	border-bottom: 1px solid #ccc;	
	p
}

h1.title {
	margin: 10px 0;
}


</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<div class="container">
	<h1 class="title">문의 내용</h1>
	<article class="qna_wrap">
		<form>
			<table class="qna_view">
				<tr>
					<td colspan="2">상품명 : ${QNA.it_title}</td>
				</tr>
				<tr>
					<td>제목 : ${QNA.q_title}</td>
					<td>작성일 : ${QNA.q_date}</td>
				</tr>
				<tr>
					<td colspan="2">${QNA.q_content}</td>
				</tr>
			</table>
<%--			<div class="button_box">
				<button class="update">수정하기</button>
				<button class="delete">삭제하기</button>
			</div> --%>
			
		</form>
	</article>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
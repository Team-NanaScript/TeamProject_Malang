<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
document.addEventListener("DOMContentLoaded", ()=>{
	
	document.querySelector("div.s_search").addEventListener("click", (e)=>{
		let iName = e.target.id;
		if(iName === "s_sch"){
			alert("준비중입니다 !!!");
			location.replace="${rootPath}";
		} else if(iName === "s_write"){
			location.href="${rootPath}/write";
		}
	});
	
});
</script>
</head>
<link rel="stylesheet"
	href="${rootPath}/static/css/customer.css?ver=2021-06-15-003">
<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div class="s_container">
		<%@ include file="/WEB-INF/views/include/s_nav.jsp"%>
		<div class="s_content">
			<a id="s_text">1:1 문의하기</a>

			<div class="sTable">

				<table class="sTable">
					<thead id="top">
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>등록일</td>
						</tr>
					</thead>

					<tbody id="content">
						<tr>
							<td>3</td>
							<td>결제가 안됩니다!!</td>
							<td>왕감자</td>
							<td>2021-06-14</td>
						</tr>

						<tr>
							<td>2</td>
							<td>이용관련 문의드립니다.</td>
							<td>김만두</td>
							<td>2021-06-14</td>
						</tr>

						<tr>
							<td>1</td>
							<td>배송이 너무 늦어요</td>
							<td>고콜라</td>
							<td>2021-06-13</td>
						</tr>
					</tbody>
				</table>

			</div>

			<div class="s_search">
				<form method="post">
					<input type="text">
					<button id="s_sch" type="submit">검색</button>
					<a id="s_write">글쓰기</a>
				</form>
			</div>

			<div class="num">
				<a>1</a>
			</div>



		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
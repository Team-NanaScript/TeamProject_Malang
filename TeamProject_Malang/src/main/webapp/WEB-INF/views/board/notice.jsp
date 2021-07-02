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
			location.replace="${rootPath}"
		} else if(iName === "s_write"){
			location.href="${rootPath}/notice/write";
		}
	});
	
});
</script>
</head>
<link rel="stylesheet"
	href="${rootPath}/static/css/customer.css?ver=2021-07-01-001">
<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div class="s_container">
		<%@ include file="/WEB-INF/views/include/s_nav.jsp"%>
		<%@ include file="/WEB-INF/views/board/notice_content.jsp"%>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script>
document.querySelector("table tbody#content").addEventListener("click", (e)=>{
	
	let seq = e.target.closest("TD#seq").dataset.seq
	
	location.href = "${rootPath}/notice/view?bd_seq=" + seq;
	
});
</script>
</html>
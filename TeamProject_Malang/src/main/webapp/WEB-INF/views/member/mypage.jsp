<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE</title>
<script>
let msg = "${MSG}";

if(msg == "REJECT"){
	alert("로그인이 필요한 서비스입니다")
	location.href="${rootPath}/login"
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<section>
		<nav class="mypage_nav">
			<ul>
				<li class="my">
				</li>
			</ul>
		</nav>
		<c:choose>
			<c:when test="${BODY == 'MY_QNA' }">
			<%@ include file="/WEB-INF/views/include/myqna.jsp"%>
			</c:when>
			<c:when test="${BODY == 'QNA_VIEW' }">
			<%@ include file="/WEB-INF/views/include/myqna_view.jsp"%>
			</c:when>
			<c:when test="${BODY == 'MY_REVIEW' }">
			<%@ include file="/WEB-INF/views/include/myreview.jsp"%>
			</c:when>
			<c:when test="${BODY == 'REVIEW_VIEW' }">
			<%@ include file="/WEB-INF/views/include/myreview_view.jsp"%>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>

<script>
document.querySelector("div.btn_wrap").addEventListener("click", (e)=>{
	const buttonId = e.target.id
	/* alert(button) */
	/* location.href = "${rootPath}/member/" + buttonId */
	location.href = "${rootPath}/" + buttonId;
	
	})
</script>
</html>
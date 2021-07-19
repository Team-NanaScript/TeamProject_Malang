<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE</title>
<style>
header.mypage {
	width:100%;
	height:144px;
	background-color: 
}
</style>
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
<header>
	<h2>${HEADER_NAME}</h2>
	<nav id="mypage_nav">
			<ul>
				<li class="myqna
				<c:if test="${BODY == 'MY_ORDER'}">
				on</c:if>">내 주문 목록</li>
				<li class="myqna
				<c:if test="${BODY == 'MY_QNA' || 'QNA_VIEW'}">
				on</c:if>">내 문의글 보기</li>
				<li class="myreview
				<c:if test="${BODY == 'MY_REVIEW' || 'REVIEW_VIEW'}">
				on</c:if>">내 후기글 보기</li>
			</ul>
		</nav>
</header>
	<section>
		<c:choose>
			<c:when test="${BODY == 'MY_ORDER' }">
			<%@ include file="/WEB-INF/views/member/include/myorder.jsp"%>
			</c:when>
			<c:when test="${BODY == 'ORDER_VIEW' }">
			<%@ include file="/WEB-INF/views/member/include/myorder_view.jsp"%>
			</c:when>
			<c:when test="${BODY == 'MY_QNA' }">
			<%@ include file="/WEB-INF/views/member/include/myqna.jsp"%>
			</c:when>
			<c:when test="${BODY == 'QNA_VIEW' }">
			<%@ include file="/WEB-INF/views/member/include/myqna_view.jsp"%>
			</c:when>
			<c:when test="${BODY == 'MY_REVIEW' }">
			<%@ include file="/WEB-INF/views/member/include/myreview.jsp"%>
			</c:when>
			<c:when test="${BODY == 'REVIEW_VIEW' }">
			<%@ include file="/WEB-INF/views/member/include/myreview_view.jsp"%>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>

<script>
document.querySelector("nav#mypage_nav").addEventListener("click", (e)=>{
	const nav_tab = e.target.closest("LI").className
	location.href = "${rootPath}/" + member;
	
	})
</script>
</html>
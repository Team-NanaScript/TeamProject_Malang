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
	<
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
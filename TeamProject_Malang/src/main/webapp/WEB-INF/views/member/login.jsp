<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

const doc = document;
doc.addEventListener("DOMContentLoaded",()=>{
	
	doc.querySelector("div.btn_input").addEventListener("click", (e) => {
			  
		let idName = e.target.id;
		
		if(idName === "join"){
			location.href="${rootPath}/join";
		}
	
	});
});


</script>

<link rel="stylesheet"
	href="${rootPath}/static/css/login.css?ver=2021-06-14-001">
<style>
input#user, input#pw {
	width: 400px;
	padding: 5%;
	margin: 5px;
	border: 1px solid rgba(0, 0, 0, 0.2);
	outline: none;
	font-size: 14px;
}

label#searchId{
	    margin-left: 200px;
	    cursor:pointer;
}

</style>
</head>
<body>
	<div class="login">
		<a href="${rootPath}" id=logo>MALANG</a>
		<div class="main">
			<form method="post">
				<div class="input">
					<input placeholder="말랑 아이디 입력" id="user"> <input
						type="password" placeholder="비밀번호 입력" id="pw"> <label><input
						id="check" type="checkbox" name="값의 이름" value="전달값">아이디 저장</label>
						<label id="searchId">아이디/비밀번호 찾기</label>
					<div class="btn_input">
						<button id="login">로그인</button>
						<button id="join" type="button">회원가입</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
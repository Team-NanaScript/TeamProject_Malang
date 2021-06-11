<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import
	url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap")
	;

@font-face {
    font-family: 'TmoneyRoundWindRegular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindRegular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
	font-family: "Noto Sans KR", sans-serif;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	margin: 0;
}

a#logo {
	cursor: pointer;
	text-decoration: none;
	font-family: 'TmoneyRoundWindRegular';
	text-align: center;
	color: rgba(235, 164, 123, 0.993);
	font-size: 40px;
	margin-left: 335px;
	position: relative;
}

div.logo {
	position: relative;
	width: 70%;
	margin: 40px auto;
	display: flex;
}

div.main {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 500px;
	padding: 7%;
	margin: -385px 0 0 -335px;
	border: 1px solid rgba(0, 0, 0, 0.2);
	border-top: 2px solid rgba(0, 0, 0, 0.7);
	display: flex;
	justify-content: center;
}

div.input button {
	border: none;
	display: block;
	width: 98%;
	margin-left: 5px;
	margin-top: 8px;
}

.btn_input {
	margin-top: 40px;
}

button {
	padding: 12px;
	color: white;
	background-color: rgba(235, 164, 123, 0.8);
	font-size: 17px;
	font-weight: bold;
}

button:hover {
	cursor: pointer;
}

button#login:hover {
	background-color: rgba(235, 148, 122, 0.9);
	transition: 0.5s;
	transition: 0.5s;
}

button#join:hover {
	background-color: rgba(235, 148, 122, 0.9);
	transition: 0.5s;
}

input#user, input#pw {
	width: 400px;
	padding: 5%;
	margin: 5px;
	border: 1px solid rgba(0, 0, 0, 0.2);
	outline: none;
	font-size: 14px;
}

input#check {
	margin: 4px;
}

div.input label {
	font-size: 13px;
}
</style>
</head>
<body>
	<div class="logo">
		<a href="${rootPath}" id=logo>MALANG</a>
	</div>
	<div class="main">
		<form method="post">
			<div class="input">
				<input placeholder="말랑 아이디 입력" id="user"> <input
					type="password" placeholder="비밀번호 입력" id="pw"> <label><input
					id="check" type="checkbox" name="값의 이름" value="전달값">아이디 저장</label>
				<div class="btn_input">
					<button id="login">로그인</button>
					<button id="join">회원가입</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
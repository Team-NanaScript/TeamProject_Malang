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

div.join {
	position: absolute;
    top: 100px;
    left: 50%;
    padding: 7%;
    margin: 0 -335px;
    border: 1px solid rgba(0, 0, 0, 0.2);
    border-top: 2px solid rgba(0, 0, 0, 0.7);
    display: flex;
    justify-content: center;
}

input#user, input#pw, input#name {
	width: 200px;
	padding: 6%;
	margin: 2px;

	border: 1px solid rgba(0, 0, 0, 0.2);
	outline: none;
	font-size: 14px;

}

.input a {
	font-size:13px;
	font-weight: bold;
}

div.input label {
	font-size: 15px;
}

div.input ul {
	font-size:16px;
	display:flex;
	list-style: none;
	justify-content: space-between;
	align-items: center;
	margin:8px;
}

.btn_input button{
	border: none;
	display: block;
	width: 98%;
	margin-left: 5px;
	margin-top: 8px;
}


</style>
<link rel="stylesheet" href="${rootPath}/static/css/login.css?ver=2021-06-14-001">
</head>
<body>
	<div class="login">
			<a href="${rootPath}" id=logo>MALANG</a>
		<div class="join">
			<form method="post">
				<div class="input">
					<ul>
						<li>이름</li> 
						<li><input placeholder="이름을 입력하세요" id="name"></li>
					</ul>
					
					<ul>
					<li id="input">아이디(ID)</li> 
					<li><input placeholder="아이디를 입력하세요" id="user"></li>
					</ul>
					<a>- 영문,숫자 2자리이상 입력해주세요</a>
					
					<ul>
					<li id="input">비밀번호</li> 
					<li><input type="password"  placeholder="비밀번호 입력" id="pw"></li>
					</ul>
					<a>- 영문,숫자,특수문자를 혼합하여 6~12자리로 입력해주세요</a>
					
					
					<ul>
					<li id="input">비밀번호 확인</li> 
					<li><input type="password"  placeholder="비밀번호 확인" id="pw"></li>
					</ul>
					<a>- 비밀번호를 한번 더 입력해주세요</a>
					
					
					
				</div>
				
				<div class="btn_input">
						<button id="join">회원가입</button>
				</div>
				
			</form>
		</div>
	</div>
</body>
</html>
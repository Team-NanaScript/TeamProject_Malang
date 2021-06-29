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

div.input input{
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

li#name, li#user, li#pw, li#tel, li#check {
	text-decoration: underline;
}
</style>
<link rel="stylesheet" href="${rootPath}/static/css/login.css?ver=2021-06-14-001">
</head>
<body>
	<div class="login">
			<a href="${rootPath}" id=logo>MALANG</a>
		<div class="join">
			<form method="post" id="join">
				<div class="input">
					<ul>
						<li id="name">이름</li> 
						<li><input placeholder="이름을 입력하세요" id="name" name="mb_name" maxlength="10"></li>
					</ul>
					
					<ul>
					<li id="user">아이디(ID)</li> 
					<li><input placeholder="아이디를 입력하세요" id="user" name="mb_id" maxlength="12"></li>
					</ul>
					<a>- 영문,숫자 2자리이상 입력해주세요</a>
					
					<ul>
					<li id="pw">비밀번호</li> 
					<li><input type="password"  placeholder="비밀번호 입력" id="pw" name="mb_pw" maxlength="12"></li>
					</ul>
					<a>- 영문,숫자,특수문자를 혼합하여 6~12자리로 입력해주세요</a>
					
					
					<ul>
					<li id="pw">비밀번호 확인</li> 
					<li><input type="password"  placeholder="비밀번호 확인" id="check" maxlength="12"></li>
					</ul>
					<a>- 비밀번호를 한번 더 입력해주세요</a>
					
					
					<ul>
						<li id="tel">전화번호</li> 
						<li><input placeholder="이름을 입력하세요" id="tel" name="mb_tel"></li>
					</ul>
					
					<ul>
						<li id="addr">주소</li> 
						<li><input placeholder="이름을 입력하세요" id="addr" name="mb_addr"></li>
					</ul>
					
					<ul>
						<li id="email">이메일</li> 
						<li><input placeholder="이름을 입력하세요" id="email" name="mb_email" maxlength="20"></li>
					</ul>
					
				</div>
				
				<div class="btn_input">
						<button id="join" type="button">회원가입</button>
				</div>
				
			</form>
		</div>
	</div>
</body>
<script>
const doc = document

doc.querySelector("button#join").addEventListener("click", ()=>{
	
	let id = doc.querySelector("input#user");
	let pw = doc.querySelector("input#pw");
	let check = doc.querySelector("input#check");	
	let name = doc.querySelector("input#name");
	let tel = doc.querySelector("input#tel");
	let addr = doc.querySelector("input#addr");
	let email = doc.querySelector("input#email");
	
	if(check.value != pw.value){	
		alert("비밀번호가 다릅니다")
		return false;
	}
	if(id.value === ""){
		alert("ID를 입력하세요!!")
		
		id.focus();
		return false;
	}if(pw.value === ""){
		alert("비밀번호를 입력하세요!!")
		
		pw.focus();
		return false;
	}if(name.value === ""){
		alert("이름을 입력하세요!!")
		
		name.focus();
		return false;
	}
	if(tel.value === ""){
		alert("전화번호를 입력하세요!!")
		
		tel.focus();
		return false;
	}
	
	
	doc.querySelector("form#join").submit();
});
</script>
</html>
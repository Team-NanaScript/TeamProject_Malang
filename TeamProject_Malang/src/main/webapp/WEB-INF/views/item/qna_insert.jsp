<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>말랑 - 문의하기</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/insert.css?ver=2021-07-19-001" />
</head>
<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div class="container">
		<h1 class="title">문의하기</h1>
		<form id="qna_insert" class="insert" method="POST">
			<div>
				<label>작성자 ID</label> 
				<input class="short" name="q_writer" value="${MEMBER.mb_id}" readonly /> 
			</div>
			<div>
				<label>상품명</label> 
				<input class="long" name="it_title" value="${ITEM.it_title}" disabled /> 
			</div>
			<div>
				<label>제목</label> 
				<input class="long" name="q_title" 
				placeholder="제목을 입력하세요"/>
			</div>
			<div>
				<label>내용</label>
				<textarea class="q_content" id="q_content" name="q_content"
					maxlength="1000" required="required" cols="100" rows="30"
					placeholder="문의글을 입력하세요"></textarea>
			</div>
			<div class="btn_box">
				<button type="button" id="btn_save">문의접수</button>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script src="${rootPath}/ne2/js/service/HuskyEZCreator.js"
	charset="UTF-8"></script>

<script>
document.querySelector("#btn_save")
.addEventListener("click",()=>{
	
	document.querySelector("form#qna_insert").submit();
	
	
});

</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/font.css?ver=2021-06-14-001" />
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/category.css?ver=2021-06-15" />
<script>
	let msg = "${MSG}";
	if (msg === "REJECT") {
		alert("접근 권한이 없습니다.")
		location.href = "${rootPath}";
	}
</script>
<style>
	div.manage_table{
		display:flex;
		flex:1;
		justify-content: center;
		font-size:24px;
	}
	table.manage {
		margin:200px 50px;
		width:1056px;
		position: relative;
		left:-50px;
		text-align: center;
		border-collapse: collapse;
	}
	table.manage thead th{
		border:1px solid gray;
		background-color:rgba(235, 164, 123, 0.993);
		color:white;
	}
	
	table.manage tbody td{
		border:1px solid gray;
		border-spacing: inherit;
		color:gray;
	}
	table.manage select option{
		font-size:18px;
	}
	table.manage select{
		width: 200px;
		padding: .8em .5em;
		font-family: inherit;
		border:none;
		appearance: none;
		outline:none;
		text-align: center;
		font-size:18px;
	}
	
	h1#manage_h{
		text-align: center;
		text-decoration: blink;
		color:rgba(235, 164, 123, 0.993);
	}
	
	body{
		display: flex;
    	flex-direction: column;
    	width: 100%;
    	height: 100vh;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	
	<h1 id="manage_h">관리자 계정 회원관리</h1>
	
	<c:if test="${not empty MLIST}">
	
	<div class="manage_table">
		<table class="manage">
			<thead>
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>권한</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${MLIST}" var="MB">
					<tr>
						<td>${MB.mb_id}</td>
						<td>${MB.mb_name}</td>
						<td>${MB.mb_nickname}</td>
						<td>${MB.mb_email}</td>
						<td>${MB.mb_tel}</td>
						<td>
						<form>
						<select data-id="${MB.mb_id}">
						
							<c:if test="${MB.mb_role == '2'}">
								<option selected="selected" value="${MB.mb_role}">관리자</option>
								<option value="1">판매자</option>
								<option value="0">일반회원</option>
							</c:if>
							<c:if test="${MB.mb_role == '1'}">
								<option selected="selected" value="${MB.mb_role}">판매자</option>
								<option value="2">관리자</option>
								<option value="0">일반회원</option>
							</c:if>
							<c:if test="${MB.mb_role == '0'}">
								<option selected="selected" value="${MB.mb_role}">일반회원</option>
								<option value="2">관리자</option>
								<option value="1">판매자</option>
							</c:if>
						</select>
						</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>


		</table>
		</div>
	</c:if>
	
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script>
document.querySelector("table.manage tbody").addEventListener("change", (e)=>{
	
	if(!confirm("권한을 바꾸시겠습니까?")){
		
	return false;	
	}
	
	let role = e.target.value
	let id = e.target.dataset.id
	let params = "id=" + id + "&role=" + role;

	
	fetch("${rootPath}/role_update?" + params)
	.then(response=>response.text())
	.then(result=>{
		
		if(result == "OK"){
			alert("변경되었습니다!")
		} else if(result == "FAIL"){
			alert("오류!!")
		}
		
	})
})

</script>
</html>
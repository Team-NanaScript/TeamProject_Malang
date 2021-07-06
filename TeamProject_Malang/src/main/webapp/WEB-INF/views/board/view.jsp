<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${rootPath}/static/css/Board.css?ver=2021-07-06-002"/>
</head>
<body>


	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div>
			<div class="notice_view">
				<div id="nv_header">
					<h2 id="title">${VIEW.bd_title}</h2>
					<p id="author">${VIEW.bd_author}</p>
				</div>

				<div id="nv_content">
					<p>${VIEW.bd_content}</p>

					<div id="btn_content">
						<button id="list">목록</button>
						<c:if test="${MEMBER.mb_nickname == VIEW.bd_author || MEMBER.mb_role == 2}">
						<button id="content_update" data-seq="${VIEW.bd_seq}">수정</button>
						<button id="content_delete" data-seq="${VIEW.bd_seq}">삭제</button>
						</c:if>
					</div>
				</div>


				<div id="comment_box">
				<!-- 여기요 -->
				<c:if test="${not empty COMMENT}">
					<c:forEach items="${COMMENT}" var="CM" varStatus="i">
						<div id="nv_comment" >
						<ul id="nc">
							<li id="nick">${CM.cm_mbnick}</li>
							<li id="content">${CM.cm_content}</li> 
						</ul>
							<!--  <input name="cm_seq" value="${CM.cm_seq}" class="none"/> -->
							
							<div id="dud" data-seq="${CM.cm_seq}">
							<ul>
								<li id="date">${CM.cm_date}</li>
								<c:if test="${MEMBER.mb_nickname == CM.cm_mbnick || MEMBER.mb_role == 2}"> 
								<li class="update">수정</li> 
								<li class="delete">삭제</li>
								</c:if>
								</ul>
							</div>
						</div>
					</c:forEach>
				</c:if>
				</div>

				<c:if test="${not empty MEMBER}">
				<div id="nv_comment_input">
				
						<form method="POST">
							<input name="cm_mbid" value="${MEMBER.mb_id}" class="none">
							<input name="cm_mbnick" value="${MEMBER.mb_nickname}" class="none">
							<input name="cm_bdseq" value="${VIEW.bd_seq}" class="none">
							<div id="cc">
								<textarea name="cm_content" rows="3" cols="106"></textarea>
								<button id="btn_comment">입력</button>
							</div>
						</form>
				
				</div>	
				
				</c:if>

			</div>
		</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script>

/*
const click_func = (e)=>{
	console.log("클릭됨")
}
let del_buttons = document.querySelectorAll("button.delete")
for(db in del buttons {
	db.addEventListener("click",click_func);
}
*/



let nv_comment = document.querySelector("div#comment_box");

if(nv_comment){
		nv_comment.addEventListener("click", (e)=>{
		let id = e.target.id;
		let className = e.target.className;
		// let seq = e.target.dataset.seq; // document.querySelector("input.none").value;
		let seq = e.target.closest("div").dataset.seq
		
		if(className === "delete"){
		
			if(confirm(seq + " 댓글을 삭제하시겠습니까?")){
				location.href="${rootPath}/notice/view/comment/delete?cm_seq=" + seq;
				
			} else {
				
				return false;
			}
			
		} if(className === "update"){
			alert(seq)
			location.href="${rootPath}/notice/view/comment/update?cm_seq=" + seq;
		}
	})

	
}


	
	document.querySelector("div#btn_content").addEventListener("click", (e)=>{
		
		let id = e.target.id;
		
		if(id === "content_delete"){
		
			if(confirm("게시글을 삭제하시겠습니까?")){
				
				let seq = e.target.closest("BUTTON").dataset.seq;
				
				location.href="${rootPath}/notice/view/notice/delete?bd_seq=" + seq;
				
			} else {
				
				return false;
			}
			
		} else if(id === "content_update"){
				
				let seq = e.target.closest("BUTTON").dataset.seq;
				
				location.href="${rootPath}/notice/view/notice/update?bd_seq=" + seq;
			
		} else if (id === "list"){
			
			location.href="${rootPath}/notice"
			
		}
		
		
		
	})
</script>
</html>
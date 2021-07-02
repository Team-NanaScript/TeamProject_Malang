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
div.notice_view {
	border: 1px solid lightgray;
	display: flex;
	flex-direction: column;
	width: 50%;
	margin: auto;
	margin-left: 430px;
	padding: 50px;
}

div#nv_header {
	display: flex;
	flex-direction: column;
	border-bottom: 1px solid lightgray;
	margin-left: 10px;
	margin-right: 10px;
}

div#nv_header h2#title {
	margin: 10px 0px;
}

div#nv_header p#author {
	margin-left: 0 auto;
}

div#nv_content {
	border-bottom: 1px solid lightgray;
	height: 20rem;
	word-wrap: break-word;
	margin: 0 10px;
	color: rgba(0, 0, 0, 0.7);
}

div#nv_comment {
	display: flex;
	border-bottom: 1px solid lightgray;
	margin: 10px;
	color: rgba(0, 0, 0, 0.7);
}

div#nv_comment a#nick {
	margin: 5px 0px;
	margin-top: 0px;
	font-size: 12px;
}

div#nv_comment a#content {
	margin: 0px 60px;
	font-size: 12px;
}

div#dud {
	margin-left: auto;
	font-size: 11px;
}

div#nv_comment a#update, div#nv_comment a#delete {
	cursor: pointer;
}

div#nv_comment_input {
	margin: 5px 5px;
	color: rgba(0, 0, 0, 0.7);
	border: 1px solid lightgray;
}

div#nv_comment_input textarea {
	border: none;
	outline: none;
}

div#nv_comment_input button {
	background-color: white;
	color: rgba(0, 0, 0, 0.8);
	border-left: 1px solid lightgray;
	border-right: none;
	border-top: none;
	border-bottom: none;
	padding: 20px 40px;
	white-space: nowrap;
}

textarea {
	resize: none;
}

#none {
	display: none;
}

div#cc {
	display: flex;
}

div#btn_content{
	margin-left:auto;
	margin-top:auto;
}

#btn_content button{
	border:1px solid lightgray;
	color:rgba(0,0,0,0.6);
	cursor:pointer;
	background-color: white;
}

#btn_comment{
	cursor:pointer;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div class="notice_view">
		<div id="nv_header">
			<h2 id="title">${VIEW.bd_title}</h2>
			<a id="author">${VIEW.bd_author}</a>
		</div>

		<div id="nv_content">
			<a>${VIEW.bd_content}</a>

			<div id="btn_content">
				<button>목록</button>
				<button>수정</button>
				<button>삭제</button>
			</div>
		</div>



		<c:if test="${not empty COMMENT}">
			<c:forEach items="${COMMENT}" var="CM">
				<div id="nv_comment">
					<a id="nick">${CM.cm_mbnick}</a> <a id="content">${CM.cm_content}</a>
					<div id="dud">
						<a id="date">${CM.cm_date}</a> 
						<a id="update">수정</a> 
						<a id="delete">삭제</a>
					</div>
				</div>
			</c:forEach>
		</c:if>


		<div id="nv_comment_input">
			<c:if test="${not empty MEMBER}">
				<form method="POST">
					<input name="cm_mbid" value="${MEMBER.mb_id}" id="none"> <input
						name="cm_mbnick" value="${MEMBER.mb_nickname}" id="none">
					<input name="cm_bdseq" value="${VIEW.bd_seq}" id="none">
					<div id="cc">
						<textarea name="cm_content" rows="3" cols="106"></textarea>
						<button id="btn_comment">입력</button>
					</div>
				</form>
			</c:if>
		</div>

	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script>
	
</script>
</html>
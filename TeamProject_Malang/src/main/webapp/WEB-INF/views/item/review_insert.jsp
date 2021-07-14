<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	input.hidden {
		display: none;
	}
	
	div#btn_box{
		
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<h1>후기작성</h1>
	<form id="review_insert" method="POST">
		<label>상품명</label>
		<input name="it_title" value="${ITEM.it_title}" disabled/>
		<label>상품옵션</label>
		<input name="r_odoption" value="${ORDER.od_option}" readonly/>
		<label>작성자 ID</label>
		<input name="r_writer"  value="${MEMBER.mb_id}" readonly/>

		

				
		<label>제목</label>
		<input name="q_title"/>
		
		<textarea class ="ng" id="content" name="q_content" maxlength="1000" required="required" cols="100" rows="30"></textarea>
		
        <div id="btn_box">
            <button type="button" id="btn_write" onclick="submitContents()">작성하기</button>
            <button type="reset">다시쓰기</button>
        </div>    
	</form>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script src="${rootPath}/ne2/js/service/HuskyEZCreator.js" charset="UTF-8"></script> 

<script>
var oEditors = [];

//에디터 셋팅
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "content",  //textarea ID 입력
 sSkinURI: "${rootPath}/ne2/SmartEditor2Skin.html",  //martEditor2Skin.html 경로 입력
 fCreator: "createSEditor2",
 htParams : { 
 	// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
     bUseToolbar : true, 
	// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
	bUseVerticalResizer : false, 
	// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
	bUseModeChanger : false 
	
 }
});

function submitContents(){
	
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	document.querySelector("form#qna_insert").submit();
	
}
</script>
</html>
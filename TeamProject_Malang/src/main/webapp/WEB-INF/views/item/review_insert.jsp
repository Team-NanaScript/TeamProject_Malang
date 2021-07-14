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

		<label>평점</label>
		
		
		<input name="r_score" type="radio"/>
        <input type="hidden" name="rate" id="rate" value="0"/>
        <p class="title_star">별점과 리뷰를 남겨주세요.</p>
 
        <div class="review_rating">
            <div class="warning_msg">별점을 선택해 주세요.</div>
            <div class="rating">
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                <label for="rating1"></label>
                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                <label for="rating2"></label>
                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                <label for="rating3"></label>
                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                <label for="rating4"></label>
                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                <label for="rating5"></label>
            </div>
        </div>		
		

				
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
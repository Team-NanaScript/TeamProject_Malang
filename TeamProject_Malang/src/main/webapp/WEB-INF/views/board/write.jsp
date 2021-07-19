<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 쓰기</title>
</head>
<style>
/*
    div#write{
        display:flex;
        border:1px solid rgba(0,0,0,0.4);
        width:40%;
        padding:100px;
        margin:auto;
        justify-content: space-around;
        position: relative;
        
    }
    div#write input,div#write textarea {
        outline:none;
        border:1px solid rgba(0,0,0,0.4);
    }
    
    div#write a{
    	color:rgba(0,0,0,0.6);
    }

    div#write input{
        padding:5px;
        width:100%;
        margin:6px 0px;
    }

    #btn_write {
        margin:7px 0px;
    }
    #btn_write button{
        background-color: white;
        color:rgba(0,0,0,0.6);
        border:1px solid rgba(0,0,0,0.4);
        font-size:16px;
        padding:5px;
    }
    #btn_write button:hover{
    border: none;
    transition: 0.4s ease;
	background-color: rgba(235, 164, 123, 0.993);
    border:1px solid rgba(235, 164, 123, 0.993);
	color: white;
    cursor:pointer;
    }

    textarea{
        resize:none;
    }

    nav#editor{
        display:flex;
        flex-direction: column;
        color:rgba(0,0,0,0.5);
    }
    #editor ul{
        list-style: none;
        display:flex;
        border:1px solid lightgray;
    }
    #editor li{
        margin:5px 10px;
        cursor:pointer;
        font-size:13px;
    }
    #input_file{
        display: none;
    }
    #editor label{
        cursor:pointer;
    }
    #font_st, #font_size{
        outline:none;
        font-size:13px;
        color:rgba(0,0,0,0.5);
    }
    input#author{
    display:none;
    }
*/
</style>
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/insert.css?ver=2021-07-19-001" />
<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>		
	<div class="container">
        <form method="POST" id="write" class="insert">
        <div>
            <label>작성자 : ${MEMBER.mb_nickname}</label>
            <input name="bd_author" value="${MEMBER.mb_nickname}" type="hidden" class="long">
       	</div> 
        <div>
            <input type="text" name="bd_title"  value="${CTUP.bd_title}" class="long">
        <textarea class ="ng" id="content" name="bd_content" maxlength="1000" required="required" cols="100" rows="30">${CTUP.bd_content}</textarea>
        </div>
        <div id="btn_write" class="btn_box">
            <button type="button" id="btn_write" onclick="submitContents()">작성하기</button>
            <button type="reset">다시쓰기</button>
        </div>       
        </form>
    </div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script src="${rootPath}/ne2/js/service/HuskyEZCreator.js" charset="UTF-8"></script> 

<script>

var oEditors = [];

// 에디터 셋팅
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
	
	document.querySelector("form#write").submit();
	
}
</script>
</html>
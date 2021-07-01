<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
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
</style>
<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div id="write">
        <form method="POST" id="write">
            <a>작성자 : ${MEMBER.mb_nickname}</a>
            <input name="bd_author" value="${MEMBER.mb_nickname}" id="author"> 
            <div>
            <input type="text" name="bd_title">
            </div>
            <nav id="editor">
                <ul>
                    <li><label for="input_file">사진</label><input type="file" id="input_file"></li>
                    <li><select id="font_st">
                        <option>나눔 고딕</option>
                        <option>나눔 명조</option>
                        <option>맑은 고딕</option>        
                    </select>
                    </li>
                    <li><select id="font_size">
                        <option>8px</option>
                        <option>9px</option>
                        <option>10px</option>
                        <option>11px</option>
                        <option>12px</option>
                    </select>
                    </li>
                    <li>가운데</li>
                    <li>왼쪽</li>
                    <li>오른쪽</li>
                </ul>
            </nav>
        <div>
        <textarea name="bd_content" maxlength="1000" required="required" cols="100" rows="30"></textarea>
        </div>
        <div id="btn_write">
            <button type="button" id="btn_write">작성하기</button>
            <button type="reset">다시쓰기</button>
        </div>       
        </form>
    </div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script>
document.querySelector("button#btn_write").addEventListener("click",()=>{
	
	document.querySelector("form#write").submit();	
	
});	
</script>
</html>
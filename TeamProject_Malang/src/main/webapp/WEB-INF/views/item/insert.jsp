<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	input.none {
		display:none;
	}
</style>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<div class="insert_container">


<form method="POST" id="item" enctype="multipart/form-data">

	<div id="item_main">
		<input name="it_title" placeholder="상품 이름" required="required">
		<input name="it_price" placeholder="상품 가격" required="required">
		<input name="it_shippingfee" placeholder="배송비" required="required">
		<input name="it_seid" class="none" value="${MEMBER.mb_id}">
		<label>상품 설명</label>
		<textarea name="it_content" id="content"></textarea>
		<input name="one_file" type="file">
	</div>
	
	<div class="item_option">
	
		<div class="input_option">
			<input name="op_name" placeholder="옵션 이름" required="required">
			<input name="op_content" placeholder="옵션 내용" required="required">
		</div>
		
		<div id="option_btn">
			<button id="btn_option_add" type="button">옵션 추가</button>
		</div>
		
	</div>
	
	<div id="item_category">
	
	</div>
	
</form>



<button type="button" id="item_submit" onclick="submitContents()">전송</button>

</div>
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
	
	document.querySelector("form#item").submit();
	
}




document.querySelector("#btn_option_add").addEventListener("click", ()=>{
	
	let frm_input = document.querySelector("form#input")
	let div_io = document.querySelector("div.item_option")
	
	let div = document.createElement("div")
	let input_name = document.createElement("input")
	let input_content = document.createElement("input")
	
	div.setAttribute("class", "input_option")
	input_name.setAttribute("name", "op_name")
	input_name.setAttribute("placeholder", "옵션 이름")
	
	input_content.setAttribute("name", "op_content")
	input_content.setAttribute("placeholder", "옵션 내용")

	
	div.appendChild(input_name)
	div.appendChild(input_content)
	div_io.appendChild(div)
	
})

/* document.querySelector("button#item_submit").addEventListener("click",()=>{
	
	// json();
	document.querySelector("form#item").submit();
	
	
})

function json(){
	
	let op_name = document.querySelector("input[name='op_name']").value
	let op_content = document.querySelector("input[name='op_content']").value
	
	let json = {op_name : op_name,op_content}
	
	let jsonString = JSON.stringify(json)
	
	fetch("${rootPath}/insert",{
		method:"POST",
		body:jsonString,
		headers : {
			"content-Type":"application/json"
		}
		
	})
	
	
	
}

*/
</script>
</html>
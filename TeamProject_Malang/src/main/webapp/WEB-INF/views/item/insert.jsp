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
	
	<div class="item_category">
		<select id="cate_st">
			<option>-----</option>
		</select>
		
		<select id="cate_st2">
			<option>-----</option>
		</select>
	</div>
	
</form>



<button type="button" id="item_submit" onclick="submitContents()">전송</button>

</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script src="${rootPath}/ne2/js/service/HuskyEZCreator.js" charset="UTF-8"></script> 
<script>

// 스마트 에디터 스크립트

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


// 옵션 추가 스크립트 

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


/* 카테고리 스크립트 */

let cateList = JSON.parse('${cateList}');

let cate1 = new Array();
let cate2 = new Array();


for(let i = 0 ; i < cateList.length ; i++){
	
	if(cateList[i].ct_tier == "0"){
	
		let cate1_obj = new Object();			
		
		cate1_obj.ct_code = cateList[i].ct_code
		cate1_obj.ct_name = cateList[i].ct_name
		cate1.push(cate1_obj)
		
	}	
	
	if(cateList[i].ct_tier == "1"){
		
		let cate2_obj = new Object();			
		
		cate2_obj.ct_code = cateList[i].ct_code
		cate2_obj.ct_name = cateList[i].ct_name
		cate2_obj.ct_parentcode = cateList[i].ct_parentcode
		cate2.push(cate2_obj)

		
	}

}



let cate_st =  document.querySelector("select#cate_st")
let cate_st2 =  document.querySelector("select#cate_st2")

for(let i = 0 ; i < cate1.length ; i++){
	
		let option = document.createElement("option")
		option.innerHTML = cate1[i].ct_name;
		option.setAttribute("value", cate1[i].ct_code);
		
		cate_st.appendChild(option)
}

cate_st.addEventListener("change", ()=>{

	cate_st2.options.length=0; 
	cate1_value = document.querySelector("#cate_st option:checked").value

	
	for(let i = 0 ; i < cate2.length ; i++){
			
			if(cate2[i].ct_parentcode == cate1_value){
				
				let option2 = document.createElement("option")
				option2.innerHTML = cate2[i].ct_name;
				option2.setAttribute("value", cate2[i].ct_code);
				option2.setAttribute("class", "cate2");
				
				cate_st2.appendChild(option2)
				
				
			} 
			
		}
		
	
})


		
	
	

</script>
</html>
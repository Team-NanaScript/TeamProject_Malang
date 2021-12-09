<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/insert.css?ver=2021-07-19-004" />
<style type="text/css">
/* 스마트 에디터가 잘리는 현상을 막기위해 width 넓힘 */
	div.container {
		width: 750px; 
	}
	
	form.insert iframe {
		margin: 15px 0;
	}

	div.input_option {
		display: inline-block;
		padding: 0;
	}
	
	div.option_btn{
		display: inline-block;
		padding: 0 10px;
	}
	
	div.item_option button, div.input_so button{
		padding : 2px 4px;
		border: 1px solid #ddd;
	}
	
	form.insert select {
		padding: 0 10px;
		height: 25px;
		width: 150px;
	}
	p.msg {
		font-size:12px;
	}
</style>
<div class="container">
	<h1 class="title">상품 등록</h1>
	<form class="insert" method="POST" id="item" enctype="multipart/form-data">
		<div>
			<label>상품 이름</label>
			<input class="long" name="it_title" placeholder="상품 이름" value="">
		</div>
		<div>
			<label>상품 기본가격</label>
			<input class="short" name="it_price" placeholder="상품 기본가격" type="number" value=0>
		</div>
		<div>
			<label>배송비</label>
			<input class="short" name="it_shippingfee" placeholder="배송비" type="number" value=0>
		</div>

		<input name="it_seid" type="hidden" value="${MEMBER.mb_id}">
		<input name="it_ctcode" type="hidden" id="it_ctcode">

		<div>
			<label>상품 설명</label>
			<textarea name="it_content" id="content"></textarea>
		</div>
		<div>
			<p class="msg">* 사진 크기는 520px x 520px 에 맞춰서 업로드 해주세요 </p>
			<label>파일 등록</label>
			<input name="one_file" type="file">
		</div>
		
		<div class="item_option">
			<label>상품 옵션</label>
			<div class="input_option" style="padding:0">
				<input name="op_name" placeholder="옵션 이름">
				<input name="op_content" placeholder="옵션 내용">
			</div>
			<button id="btn_option_add" type="button">옵션 추가</button>
		</div>
		
		<div class="item_category"> 
			<label>카테고리</label>
			<select id="cate_st">
				<option>-----</option>
			</select>
			
			<select id="cate_st2">
				<option>-----</option>
			</select>
		</div>
		
		<div class="item_select_option">
			<label>가격 옵션</label>
			<div class="input_so">
				<input name="so_name" placeholder="옵션 이름">
				<input name="so_content" placeholder="옵션 내용">
				<input name="so_price" type="number" value=0 placeholder="옵션 추가가격">
				<button id="btn_so_add" type="button">옵션 추가</button>
			</div>

		</div>
		<div class="btn_box">
			<button type="button" id="item_submit">등록하기</button>
		</div>	
	</form>

</div>

<script src="${rootPath}/ne2/js/service/HuskyEZCreator.js" charset="UTF-8"></script> 
<script>

// 스마트 에디터 스크립트

var oEditors = [];

//에디터 셋팅
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "content",  //textarea ID
 sSkinURI: "${rootPath}/ne2/SmartEditor2Skin.html",  //martEditor2Skin.html 경로
 fCreator: "createSEditor2",
 htParams : { 
 	// 툴바 사용 여부 
     bUseToolbar : true, 
	// 입력창 크기 조절바 사용 여부
	bUseVerticalResizer : false, 
	// 모드 탭(Editor | HTML | TEXT) 사용 여부
	bUseModeChanger : false 
	
 }
});


let btn_sb = document.querySelector("button#item_submit"); 

btn_sb.addEventListener("click", ()=>{
		
		let title_val = document.querySelector("input[name='it_title']").value
		let cate_val = document.querySelector("input#it_ctcode").value
		
		if(title_val == null || title_val == ""){
		    alert("상품 이름을 입력하세요!")
		    return false;
		}
		if(cate_val == null || cate_val == ""){
		    alert("카테고리를 선택해주세요!")
		    return false;
		}
		if(cate_st2.options.length == '0'){
			alert("카테고리를 선택해주세요!")
		    return false;
		}
				
		
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		
		document.querySelector("form#item").submit();
		
})
	


// 옵션 추가 스크립트 


document.querySelector("#btn_option_add").addEventListener("click", ()=>{
	
	let div_io = document.querySelector("div.item_option")

	let io_div = document.createElement("div")
	let input_io_name = document.createElement("input")
	let input_io_content = document.createElement("input")
	let label = document.createElement("label")
	
	io_div.setAttribute("class", "input_option")
	input_io_name.setAttribute("name", "op_name")
	input_io_name.setAttribute("placeholder", "옵션 이름")
	
	input_io_content.setAttribute("name", "op_content")
	input_io_content.setAttribute("placeholder", "옵션 내용")

	
	io_div.appendChild(input_io_name)
	io_div.appendChild(input_io_content)
	div_io.appendChild(label)
	div_io.appendChild(io_div)
})

document.querySelector("#btn_so_add").addEventListener("click", ()=>{
	
	let div_so = document.querySelector("div.item_select_option")
		
	let so_div = document.createElement("div")
	let input_so_name = document.createElement("input")
	let input_so_content = document.createElement("input")
	let input_so_price = document.createElement("input")
	
	so_div.setAttribute("class", "input_so")
	input_so_name.setAttribute("name", "so_name")
	input_so_content.setAttribute("name", "so_content")
	
	input_so_price.setAttribute("name", "so_price")
	input_so_price.setAttribute("value", "0")
	
	so_div.appendChild(input_so_name)
	so_div.appendChild(input_so_content)
	so_div.appendChild(input_so_price)
	div_so.appendChild(so_div)
	
})


/* 카테고리 스크립트 */

let cateList = JSON.parse('${cateList}');

console.log('${cateList}')

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

function cate2_chg(){
	
	// let check_cate = cate_st2.options[st2.selectedIndex].value
	let checked_cate = document.querySelector("#cate_st2 option:checked").value
	
	document.querySelector("input#it_ctcode").setAttribute("value", checked_cate)
	
}

cate_st.addEventListener("change", ()=>{

	cate_st2.options.length=0; 
	let cate1_value = document.querySelector("#cate_st option:checked").value
	
	for(let i = 0 ; i < cate2.length ; i++){
		
			if(cate2[i].ct_parentcode == cate1_value){
				
			let option2 = document.createElement("option")				
				option2.innerText = cate2[i].ct_name;
				option2.setAttribute("selected", "selected");
				option2.setAttribute("value", cate2[i].ct_code);
				
				cate_st2.appendChild(option2)

			} 			
		}

	cate2_chg();
})

cate_st2.addEventListener("change", cate2_chg);

</script>
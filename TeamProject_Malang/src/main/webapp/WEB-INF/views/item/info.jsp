<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Info</title>
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/font.css?ver=2021-07-14-001" />
<link rel="stylesheet" type="text/css"
	href="${rootPath}/static/css/info.css?ver=2021-07-14-001" />
<script>
	var rootPath = "${rootPath}"
	var itCode = "${ITEM.it_code}"
</script>
<script src="${rootPath}/static/js/info.js?ver=2021-07-14-005"></script>
<style>
table.review td:hover, table.question td:hover {
	cursor: pointer;
}

section.img_section div.image_preview {
	/* 은빈언니가 itemVO 수정하면 아래걸로 변경하면 됨 
	background: url("${rootPath}${ITEM.it_photo}") no-repeat; 
	*/
	background: url("${rootPath}/static/images/ex2.png") no-repeat;
	
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div id="container" class="container">
		<div class="inner_top">
			<section id="img_section" class="img_section">
				<div class="image_preview"></div>
			</section>
			<aside id="product_aside" class="product_aside">
				<div id="header" class="header">
					<p>${ITEM.it_seid}</p>
					<h2>${ITEM.it_title}</h2>
					<h3>${ITEM.it_price}원</h3>
				</div>


				<ol>
					<li>후기</li>
					<li>${AVG} (${COUNT})</li>
				</ol>
				<ol>
					<li>배송비</li>
					<li>
						<c:choose>
							<c:when test="${ITEM.it_shippingfee == 0}">무료배송</c:when>
							<c:otherwise>${ITEM.it_shippingfee}</c:otherwise>
						</c:choose>
					</li>
				</ol>


				<div>
					<ul id="title" class="title">작품 옵션</ul>
					<ul>
						<c:forEach items="${OPTION}" var="OP">
						<ol>
							<li>${OP.op_name}</li>
							<li>${OP.op_content}</li>
						</ol>
						</c:forEach>
					</ul>

				</div>
				<form id="option" class="option">
					<ul id="title" class="title">가격 옵션</ul>
					<ul>
						<c:forEach items="${SONAME}" var="SN">
						<ol>
							<li>${SN}</li>
							<li>
								<select name="prices" class="selectBox" onchange="changeFunc(this);">
									<option value="no">옵션을 선택하세요</option>
									<c:forEach items="${SOCONTENT[SN]}" var="SC">
										<option value="${SC.so_code}">${SC.so_content}
											<c:if test="${not empty SC.so_price}">
																( +${SC.so_price}원 )
											</c:if>
										</option>
									</c:forEach>
									
								</select>
							</li>
						</ol>
						</c:forEach>
					</ul>
					<ul >
						<li id="selected_item"></li>
					</ul>
					<ul>
						<ol>
							<li>총 작품금액</li>
							<li><h2 id="info_price">${ITEM.it_price} 원</h2></li>
						</ol>
					</ul>
					<ul id="btn_box" class="btn_box">
						<li>
							<button id="btn_pack" class="btn_pack" type="button">장바구니</button>
							<button id="btn_question" class="btn_question" type="button">문의하기</button>
							<button id="btn_buy" class="btn_buy" type="button">구매하기</button>
						</li>
					</ul>
				</form>

			</aside>
		</div>
		<nav id="product_nav" class="product_nav">
			<ul id="product_nav_ul" class="product_nav_ul">
				<li class="art_1">상세설명</li>
				<li class="art_2">배송/교환/환불</li>
				<li class="art_3">구매후기</li>
				<li class="art_4">문의/답변</li>
			</ul>
		</nav>
		<%@ include file="/WEB-INF/views/item/info_include/description.jsp"%>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
	<script>
//		document.querySelector("select#price_select").addEventListener("blur",()=>{
//			document.getElementById("selected_item").innerHTML = "아니 어떻게 넘겨오냐고"
//		})

	function changeFunc(arg) {
		// var selectedValue = document.querySelector("#selectBox").value
		// alert(arg.value)
		
		
		// 선택박스가 바뀔때마다 3개 다 선택되어 있는지를 체크하기
		
		let value = arg.value
		
		// All로 가져오면 배열로 가져와짐 (node 배열)
		const selectOption = document.querySelectorAll("select.selectBox")
		const selectOptions = selectOption.length
		
		let selectArray = []
		for(let i = 0 ; i < selectOptions;i++) {
			let value = selectOption[i].value // select의 value는 선택된 옵션의 value가 넘어오는것
			console.log("value", value)
			if(value != 'no') {
				selectArray.push(value)
			}
		}
		
		console.log("선택값")
		console.table(selectArray)
		
		
		// options 라는 이름으로 배열을 담는 JSON  객체 1개 생성
		const sendJson = {
			options:selectArray,
			selectBoxSize : selectOptions
			//name:'홍길동',
			//age : 33
			
		}
		
		
		// selectOption = selectOption.option[selectOption.selectedIndex].value;
		
		// alert(selectOption);
		//if(selectOption != "no"){
		// fetch를 사용해서 POST 로 전송	
		fetch("${rootPath}/info/option",{
			method:"POST",
			body : JSON.stringify(sendJson),
			headers : {
				"content-Type" : "application/json"
			}
		})
		
		
		.then(response=>response.text())
		//.then(result=>console.log(result))
		.then(result=>{
			
			
		})
		
		
		//}
		// */

	}	

/*
	
	function checkAllSelect(value){
		var selectOption = document.querySelector("select.selectBox")	
		selectOption = selectOption.option[selectOption.selectedIndex].value;
		
		alert(selectOption);
		if(selectOption != "no"){
			fetch("${rootPath}/info/option/" + value)
			.then(response=>response.text())
			.then(result=>{
				
			})
		}
	}
		
*/		

		
		
		
		
		
		
		
		
/* 선택옵션 (with JSON)*/
/*
let soName = '${SONAME}'
console.log(soName)

console.log('${SOJSON}') // 아직 배열형태 (큰따옴표 안됨)
let soJson = JSON.parse('${SOJSON}') // 파씽하면
console.log(soJson) // 이뻐짐. index도 붙음.


let soList = new Array()
let selectBox = document.querySelector("#selectBox")
let soSelect =  document.querySelector("#optionSelect")

// 셀렉트 수만큼
for(let i = 0; j < soName.length; j++){
	
	///////
	let select = document.createElement("select")
	
	for(let i = 0; i < soJson.length; i++){
		
		if(soJson[i].so_name == soName[j]){
			
			let objSo = new Object();
			
			objSo.so_code = soJson[i].so_code // 옵션 code 과
			objSo.so_name = soJson[i].so_name // 옵션 name 을
			soList.push(objSo) // soList에 저장
		}
	}
	
	
	
	let soSelect =  document.querySelector("#optionSelect")
	
	for(let i = 0; i < soList.length; i++){
		
		let option = document.createElement("option")
		option.innerHTML =  soList[i].so_name;
		option.setAttribute("value", soList[i].so_code);
		
	}
	
	/////
	//select.innerHTML = "";
}

*/ 



	</script>
</body>


</html>

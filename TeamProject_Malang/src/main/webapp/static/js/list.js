document.querySelector("section.item_section").addEventListener("click", (ev)=> {
	let target = ev.target
	
	let class_name = target.className
	
	if(class_name == "item_content") {
		let seq = target.dataset.code
		alert("클릭 " + seq)
	} else {
		let parentWrap = target.closest("DIV")
		let parentClassName = parentWrap.className
		let i_seq = parentWrap.dataset.code
		
		if(parentClassName == "item_content") {
			alert("크을릭 " + i_seq)
		} else if(parentClassName == "item") {
			let upClass = target.closest("DIV")
			let up_seq = upClass.dataset.code
			alert("퀅 " + up_seq)
		}
	}
})
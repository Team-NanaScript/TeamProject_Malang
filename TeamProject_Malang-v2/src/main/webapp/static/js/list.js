document.querySelector("section.item_section").addEventListener("click", (ev)=> {
	let target = ev.target
	
	let class_name = target.className
	
	if(class_name == "item_content") {
		let seq = target.dataset.code
		// alert("클릭 " + seq)
		location.href = `${rootPath}/info/`+seq;
	} else {
		let parentWrap = target.closest("DIV")
		let parentClassName = parentWrap.className
		let i_seq = parentWrap.dataset.code
		
		if(parentClassName == "item_content") {
			// alert("크을릭 " + i_seq)
			location.href = `${rootPath}/info/`+i_seq;
		}
	}
})
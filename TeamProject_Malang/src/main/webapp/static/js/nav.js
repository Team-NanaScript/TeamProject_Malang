const doc = document;

const header = doc.querySelector("header");
const n1height = header.clientHeight;

doc.addEventListener("scroll", onScroll, { passive: true });

function onScroll() {
  const scrollposition = pageYOffset;
  const nav = doc.querySelector("div#hid_nav");

  if (n1height <= scrollposition) {
    nav.classList.add("fix");
    doc.getElementById("hid_nav").style.display = "flex";
  } else {
    nav.classList.remove("fix");
    doc.getElementById("hid_nav").style.display = "none";
  }
}

let keyword = doc.querySelector(".text");
let hKeyword = doc.querySelector(".hid_input");
doc.querySelector("header").addEventListener("submit", (e) => {
  doc.location.href =
    "https://search.naver.com/search.naver?query=" + keyword.value;
  e.preventDefault();
});

  doc.querySelector("form#hid").addEventListener("submit", (e) => {
    doc.location.href =
      "https://search.naver.com/search.naver?query=" + hKeyword.value;
    e.preventDefault();
  });
  
  doc.querySelector("header").addEventListener("click", (ev) => {
  
  	let idName = ev.target.id;
  	
  	if(idName === "user"){
  		alert("ㅎㅇㅎㅇ");	
  	} else if(idName === "cart"){
		alert("ㅂㅇㅂㅇ");  	
  	}
  	
});
  



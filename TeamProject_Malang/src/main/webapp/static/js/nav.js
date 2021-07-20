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
  
    location.href= `${rootPath}/item/search/`+ keyword.value
  e.preventDefault();
});

  doc.querySelector("form#hid").addEventListener("submit", (e) => {
    
     location.href= `${rootPath}/item/search/`+ hKeyword.value
    e.preventDefault();
  });
  
  function className(ev){
    let cName = ev.target.className;
    
        if(cName == "" || cName === "" || cName == null ){
          return false;
        } else {
        
          location.href = "/malang/" + cName;
        }  
  }

  function idName(ev){
    let iName = ev.target.id;
        if(iName == "" || iName === "" || iName == null){
          return false;
        } else if(iName == "mypage") {
        	location.href = `${rootPath}/`+ iName + "/myorder"; 
        } else if(iName == "cart"){
          location.href = `${rootPath}/mypage/` + iName;
        } else {
          location.href = `${rootPath}/` + iName;
        }   
  }
  doc.querySelector("div.icon").addEventListener("click", idName);
  doc.querySelector("div.adiv nav#one").addEventListener("click", className);
  doc.querySelector("div.adiv nav#two").addEventListener("click", className);


  


  	


  



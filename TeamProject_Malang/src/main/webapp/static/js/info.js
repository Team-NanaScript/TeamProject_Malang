document.addEventListener("DOMContentLoaded", () => {
  const nav = document.querySelector("nav#product_nav");
  const pack = document.querySelector("aside button#btn_pack");
  const ques = document.querySelector("aside button#btn_question");

  const navClick = (e) => {
    let tagName = e.target.tagName;
    if (tagName === "LI") {
      let className = e.target.className; // 클래스명 추출
      let section = document.querySelector("#" + className); // # + 클래스명
      let bound = section.getBoundingClientRect(); // 해당 클래스의 여러 좌표값
      let sectionTop = bound.top; // 좌표값 중 top

      window.scrollBy({
        top: sectionTop,
        left: 0,
        behavior: "smooth",
      });
    }
  };

  const packClick = (e) => {
    alert("장바구니에 담았습니다.");
  }

  const quesClick = (e) => {

 	location.href = `${rootPath}/info/qna/${itCode}`;   

  }
 
 

 
  nav.addEventListener("click", navClick);
  pack.addEventListener("click", packClick);
  ques.addEventListener("click", quesClick);


});

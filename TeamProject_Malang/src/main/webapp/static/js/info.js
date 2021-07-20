document.addEventListener("DOMContentLoaded", () => {
  const nav = document.querySelector("nav#product_nav");


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


 
  nav.addEventListener("click", navClick);


});

document.addEventListener("DOMContentLoaded", () => {
  const pay = document.querySelector("div.btn_pay button");

  const buyClick = (e) => {
    alert("결제되었습니다.");
  };

  pay.addEventListener("click", buyClick);
});

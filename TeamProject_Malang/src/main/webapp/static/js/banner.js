document.addEventListener("DOMContentLoaded", () => {
        const image = document.querySelector("div.images");
        const images = document.querySelectorAll("div.images img");
        const textbox = document.querySelector("article.textbox");
        const text = textbox.querySelectorAll("div");
        const IMAGE_COUNT = images.length;
        const IMAGE_WIDTH = 1056;
        let position = 0;
        let tmp = 0;

        const prev = () => {
          if (position <= IMAGE_WIDTH * ((IMAGE_COUNT - 1) * -1)) {
            position = IMAGE_WIDTH;
          }
          position += IMAGE_WIDTH * -1;
          
          if (position < 0) {
            tmp = -position / 1056;
            text[tmp - 1].style.transition = "0.3s";
            text[tmp - 1].style.opacity = 0;
          } else if (position == 0) {
            text[IMAGE_COUNT - 1].style.transition = "0.3s";
            text[IMAGE_COUNT - 1].style.opacity = 0;
            tmp = 0;
          }

          text[tmp].style.opacity = 1;

          image.style.transform = `translateX(${position}px)`;
        };

        const next = () => {
          
          if (position >= 0) {
            position = IMAGE_WIDTH * IMAGE_COUNT * -1;
          }
          position += IMAGE_WIDTH;

          if (-position == IMAGE_WIDTH * (IMAGE_COUNT - 1)) {
            text[0].style.transition = "0.3s";
            tmp = IMAGE_COUNT - 1;
            text[0].style.opacity = 0;
          } else {
            tmp = -position / 1056;
            text[tmp + 1].style.transition = "0.3s";
            text[tmp + 1].style.opacity = 0;
          }

          text[tmp].style.opacity = 1;
          image.style.transform = `translateX(${position}px)`;
        };

        document.querySelector("article.nav").addEventListener("click", (e) => {
          let text = e.target.innerHTML;
          if (text === "<" || text === "&lt;") {
            next();
          } else if (text === ">" || text === "&gt;") {
            prev();
          }
        });
      });
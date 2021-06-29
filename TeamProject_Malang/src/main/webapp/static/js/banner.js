document.addEventListener("DOMContentLoaded", () => {
        const image = document.querySelector("div.images");
        const images = document.querySelectorAll("div.images img");
        const textbox = document.querySelector("article.textbox");
        const text = textbox.querySelectorAll("div");
        const IMAGE_COUNT = images.length;
        const IMAGE_WIDTH = 1056;
        let position = 0;

		let on = 0;
		let off = 0;
        const prev = () => {
          if (position <= IMAGE_WIDTH * ((IMAGE_COUNT - 1) * -1)) {
            position = IMAGE_WIDTH;
          }
          position += IMAGE_WIDTH * -1;
          
          if (position < 0) {
            on = -position / 1056;
            off = on - 1;
          } else if (position == 0) {
            off = IMAGE_COUNT - 1;
            on = 0
          }
          
          text[off].style.transition = "0.3s";
          text[off].style.opacity = 0;
          text[on].style.transition = "1s";
          text[on].style.opacity = 1;

          image.style.transform = `translateX(${position}px)`;
        };

        const next = () => {
          
          if (position >= 0) {
            position = IMAGE_WIDTH * IMAGE_COUNT * -1;
          }
          position += IMAGE_WIDTH;

          if (-position == IMAGE_WIDTH * (IMAGE_COUNT - 1)) {
            on = IMAGE_COUNT - 1;
            off = 0;
          } else {
          	on = -position / 1056;
            off = on + 1;
          }
          
          text[off].style.transition = "0.3s";
		  text[off].style.opacity = 0;
		  text[on].style.transition = "1s";
          text[on].style.opacity = 1;
          
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
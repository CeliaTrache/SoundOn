const countdown_before_music = () => {
  //1. afficher le 3,2,1 dans le dom
  const all_word = document.getElementById("all_word");
  const demo = document.getElementById("demo");
  const title = document.getElementById("title");
  const Start = document.getElementById("start");
  const hiddens = document.querySelectorAll(".hidden");
  const paragraph1 = document.getElementById("p1");
  const paragraph2 = document.getElementById("p2");
  const start_button = document.getElementById("start-button");
  const start_button2 = document.getElementById("start-button2");
  const detail_setup = document.getElementById("detail_setup");
  // 1. sur la page game show apparition btn game start
  // 2. selectionner dans le dom le btn start
  // 3. écouter le click sut le btn 
  //4. au click disparition du btn start
  //5. apparition de la demo
  //6. au bout de 4s apparition du titre et du countdown
  if(Start) {
    Start.addEventListener('click', (event) => {
      if (paragraph1) {
        paragraph1.style.display  = "none";
      }
      if (paragraph2) {
      paragraph2.style.display  = "none";
      }
      if (start_button) {
      start_button.style.display  = "none";
      }
      if (start_button2) {
        start_button2.style.display  = "none";
        }
      if (Start) {
      Start.style.display  = "none";
      }
      if (detail_setup) {
      detail_setup.style.display = "none";
      }
      if (demo) {
      demo.style.display = "block";
      }
      setTimeout(() => {
        if (demo) {
        demo.style.display = "none";
        }
        if (all_word) {
        all_word.style.display = "block";
        }
        if (hiddens) {
        hiddens.forEach((hidden)=> {
          hidden.style.display = "block";
        })
      }
      }, 4750);
  })
  }
  }
  

export { countdown_before_music };
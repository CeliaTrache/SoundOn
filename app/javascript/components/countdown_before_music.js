const countdown_before_music = () => {
  //1. afficher le 3,2,1 dans le dom
  const all_word = document.getElementById("all_word");
  const demo = document.getElementById("demo");
  const title = document.getElementById("title");
  const Start = document.getElementById("start");
  const hidden = document.getElementById("hidden");
  const paragraph1 = document.getElementById("p1");
  const paragraph2 = document.getElementById("p2");
  const start_button = document.getElementById("start-button");
  // 1. sur la page game show apparition btn game start
  // 2. selectionner dans le dom le btn start
  // 3. écouter le click sut le btn 
  //4. au click disparition du btn start
  //5. apparition de la demo
  //6. au bout de 4s apparition du titre et du countdown
  Start.addEventListener('click', (event) => {
    paragraph1.style.display  = "none";
    paragraph2.style.display  = "none";
    start_button.style.display  = "none";
    Start.style.display  = "none";
    demo.style.display = "block";
  //if (demo) {
    setTimeout(() => {
      demo.style.display = "none";
      all_word.style.display = "block";
      hidden.style.display = "block";
    }, 4750);
  //}
})
}

export { countdown_before_music };
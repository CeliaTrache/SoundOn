const logo = () => {
    //1. afficher le 3,2,1 dans le dom
    const soundon = document.getElementById("soundon");
    const start_blindtest= document.getElementById("start_blindtest");
    const spotify = document.getElementById("spotify");
    const background = document.getElementById("background");
    const logo = document.getElementById("logo");

setTimeout(function(){
  if (logo && soundon && spotify && background) {
    logo.style.display = "none";
    soundon.style.display = "block";

    spotify.style.display = "block";
    background.style.display = "block";
  }
  }, 2500);
}

export { logo };

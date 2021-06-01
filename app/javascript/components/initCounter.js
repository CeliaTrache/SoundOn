const initCounter = () => {
  let counterDisplayElem = document.querySelector('.counter-display');
  let counterMinusElem = document.querySelector('.counter-minus');
  let counterPlusElem = document.querySelector('.counter-plus');
  let count = 0;

  if (counterPlusElem) {
    counterPlusElem.addEventListener("click", () => {
      count++;
      updateDisplay();
    });
  }

  if (counterMinusElem) {
    counterMinusElem.addEventListener("click", () => {
      count--;
      updateDisplay();
    });
  }

  function updateDisplay() {
    if (counterDisplayElem.innerHTML) {
      counterDisplayElem.innerHTML = count;
    }
  };
}
export { initCounter };

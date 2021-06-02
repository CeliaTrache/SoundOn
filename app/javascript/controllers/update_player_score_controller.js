import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ['link', 'score'];

  send(event) {
    event.preventDefault();
    const winner = event.currentTarget;
    winner.classList.toggle("active")
    const url = winner.href;
    const score = winner.classList.contains("active") ? +10 : -10;
    const border = winner.classList.toggle("player-name-active");

    const formData = new FormData();
    formData.append('score', score)

    fetch(url, {
      method: 'PATCH',
      headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
      body: formData
    })
      .then(response => response.json())
      .then((data) => {
        const score = winner.querySelector('#score');
        score.innerHTML = data.score;
      });
  }
}

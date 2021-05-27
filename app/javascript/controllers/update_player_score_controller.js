import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ['link', 'score'];

  send(event) {
    event.preventDefault();
    const winner = event.currentTarget;
    const url = winner.href;

    fetch(url, {
      method: 'PATCH',
      headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
      body: new FormData()
    })
      .then(response => response.json())
      .then((data) => {
        const score = winner.querySelector('#score');
        score.innerHTML = data.score;
      });
  }
}



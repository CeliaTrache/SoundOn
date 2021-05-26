import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ['link', 'score'];

  // connect() {
  //   console.log(this.element);
  //   console.log(this.scoreTarget);
  // }

  send(event) {
    event.preventDefault();
    // console.log(event.currentTarget);
    const url = event.currentTarget.href;

    fetch(url, {
      method: 'PATCH',
      headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
      body: new FormData()
    })
      .then(response => response.json())
      .then((data) => {
        // console.log(data.score);
        // console.log(this.linkTarget.innerHTML);
        // this.linkTarget.innerHTML = `julien • ${data.score}pts`
      });
  }
}



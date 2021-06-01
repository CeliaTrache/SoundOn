import { Controller } from "stimulus";

export default class extends Controller {

  send(event) {
    event.preventDefault();
    const number = parseInt(document.querySelector('#players-number').innerText);
    console.log(document.querySelector('.number_of_players_form'));
    document.querySelector('#number_of_players').value = number;
    document.querySelector('.number_of_players_form').submit();
    const btn = document.getElementById('first-btn-next');
    console.log(btn);
    btn.classList.add('d-none');
  }
}

import { Controller } from "stimulus";

export default class extends Controller {

  send(event) {
    event.preventDefault();
    const number = document.querySelector('#players-number');
    console.log(document.querySelector('form'));
    document.querySelector('#number_of_players').value = number.value;
    document.querySelector('form').submit();
  }
}

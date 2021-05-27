import { Controller } from "stimulus";

export default class extends Controller {

  send(event) {
    event.preventDefault();
    const count = document.querySelector('#duration');
    console.log(document.querySelector('.new_game'));
    document.querySelector('#game_duration').value = count.value;
    document.querySelector('.new_game').submit();
  }
}

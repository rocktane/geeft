import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-prompt"
export default class extends Controller {
  static targets = ["inputBox", "addButton"]

  connect() {
    this.update_button()
  }

  update_button() {
    this.inputBoxTarget.addEventListener('keyup', () => {
      console.log(this.inputBoxTarget);
      if (this.inputBoxTarget.value === "") {
        this.addButtonTarget.setAttribute('disabled', true)
      } else {
        this.addButtonTarget.removeAttribute('disabled');
      }
    })
  }
}

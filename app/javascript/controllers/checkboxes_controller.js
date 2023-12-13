import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkboxes"
export default class extends Controller {
  connect() {
  }

  checked() {
    console.log(this)
    this.checked ? this.checked : this.unchecked
  }
}

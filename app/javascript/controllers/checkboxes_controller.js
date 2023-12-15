import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkboxes"
export default class extends Controller {
  connect() {
  }

  checked() {
    this.checked ? this.checked : this.unchecked
  }
}

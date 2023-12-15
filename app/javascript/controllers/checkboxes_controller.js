import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkboxes"
export default class extends Controller {
  static targets = [ "custom_interest" ]

  connect() {
  }

  checked() {
    this.checked ? this.checked : this.unchecked
  }
}

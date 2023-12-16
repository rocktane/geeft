import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="find-values"
export default class extends Controller {
  static targets = [ "age", "ageValue"]
  connect() {
  }

  ageUpdate() {
    const ageValue = this.ageTarget.value
    if (ageValue <= 1) {
      this.ageValueTarget.innerHTML = ageValue + " an"
    } else {
    this.ageValueTarget.innerHTML = ageValue + " ans"
    }
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="find-values"
export default class extends Controller {
  static targets = [ "starting", "ending", "age", "minValue", "maxValue", "ageValue"]
  connect() {
  }

  update() {
    console.log(this.startingTarget.value)
    this.endingTarget.min = this.startingTarget.value
    console.log(this.endingTarget.min)
    console.log(this.endingTarget.value)
    this.minValueTarget.innerHTML = this.startingTarget.value
  }
}

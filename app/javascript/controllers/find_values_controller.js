import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="find-values"
export default class extends Controller {
  static targets = [ "starting", "ending", "age", "minValue", "maxValue", "ageValue"]
  connect() {
  }

  update() {
    this.endingTarget.min = this.startingTarget.value
    const startingValue = this.startingTarget.value
    const endingValue = this.endingTarget.value
    const ageValue = this.ageTarget.value
    this.minValueTarget.innerHTML =  startingValue + "€"
    this.maxValueTarget.innerHTML = endingValue + "€"
    if (ageValue <= 1) {
      this.ageValueTarget.innerHTML = ageValue + " an"
    } else {
    this.ageValueTarget.innerHTML = ageValue + " ans"
    }
  }
}

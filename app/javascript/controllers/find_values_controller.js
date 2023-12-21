import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="find-values"
export default class extends Controller {
  static targets = [ "age", "ageValue", "rangeSlider", "rangeAge" ]
  connect() {
    this.ageUpdate()

    this.rangeAgeTarget.addEventListener('touchstart', function (e) {
      // Empêcher la propagation de l'événement tactile
      e.stopPropagation();
    });

    this.rangeSliderTarget.addEventListener('touchstart', function (e) {
      // Empêcher la propagation de l'événement tactile
      e.stopPropagation();
    });
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

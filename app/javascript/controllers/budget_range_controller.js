import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="budget_range"
export default class extends Controller {
  static targets = ["min", "max", "fill", "input", "starting", "ending"];

  connect() {
    const validateRange = () => {
      // Déplacez la déclaration à l'intérieur de la fonction
      const inputElements = this.inputTargets;
      let minValue = this.minTarget;
      let maxValue = this.maxTarget;
      const rangeFill = this.fillTarget;

      let minPrice = parseInt(inputElements[0].value);
      let maxPrice = parseInt(inputElements[1].value);

      if (minPrice > maxPrice) {
        let tempValue = maxPrice;
        maxPrice = minPrice;
        minPrice = tempValue;
      }

      const minPercentage = ((minPrice - 10) / 990) * 100;
      const maxPercentage = ((maxPrice - 10) / 990) * 100;

      rangeFill.style.left = minPercentage + "%";
      rangeFill.style.width = maxPercentage - minPercentage + "%";
      minValue.innerHTML = minPrice + "€";
      maxValue.innerHTML = maxPrice + "€";


      this.startingTarget.value = minPrice;
      this.endingTarget.value = maxPrice;

    };

    const inputElements = this.inputTargets;

    inputElements.forEach((element) => {
      element.addEventListener("input", validateRange);
    });

    // Initial call to validateRange
    validateRange();
  }
}

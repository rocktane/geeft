import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shuffle"
export default class extends Controller {
  static targets = ["item", "line"]

  connect() {
  }

  update(event) {
    event.target.closest('.gift-item-row').classList.add('remove-transition')
    event.target.closest('.gift-item-row').classList.remove('add-transition')

      const myDiv = event.target.closest('.gift-item-row')
      const myDivChild = event.target.closest('.gift-item-row').firstChild
      const dNone = document.querySelectorAll('.gift-list-row, .d-none').length
      myDiv.style.opacity = '0';
      let firstOccurence = true;

      this.itemTargets.forEach((item) => {
        if (firstOccurence && item.parentNode.classList.contains('d-none')) {
          myDivChild.innerHTML = item.innerHTML
          item.parentNode.remove()
          myDiv.classList.remove('remove-transition')
          myDiv.classList.add('add-transition')
          if (dNone === 1) {
            this.disableButton()
          }
          myDiv.style.opacity = '100';
          firstOccurence = false;
        }
      })
  }

  disableButton() {
    const shuffleIcons = document.querySelectorAll('.shuffle')

    shuffleIcons.forEach((icon) => {
      console.log(icon);
      icon.style.color = "grey";
      icon.style.pointerEvents = 'none';
    });
    // shuffleIcons.all.element.disabled = true;
  };
}

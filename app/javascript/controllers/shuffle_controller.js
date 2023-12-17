import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shuffle"
export default class extends Controller {
  static targets = ["item"]

  connect() {
  }

  update(event) {
    event.target.parentNode.parentNode.classList.add('remove-transition')
    event.target.parentNode.parentNode.classList.remove('add-transition')

    setTimeout(() => {
      const myDiv = event.target.parentNode.parentNode
      const myDivChild = event.target.parentNode.parentNode.firstChild
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
    }, 500);
  }

  disableButton() {
    const shuffleIcons = document.querySelectorAll('.shuffle')

    shuffleIcons.forEach((icon) => {
      icon.style.color = "grey";
      icon.classList.add('pointer-events: none');
    });
    // shuffleIcons.all.element.disabled = true;
  };
}

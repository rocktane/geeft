import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shuffle"
export default class extends Controller {
  static targets = ["item"]

  connect() {
  }

  update(event) {
    event.target.parentNode.classList.add('remove-transition')
    event.target.parentNode.classList.remove('add-transition')

    setTimeout(() => {
      const myDiv = event.target.parentNode
      const myDivChild = event.target.parentNode.firstChild
      myDiv.style.opacity = '0';
      let firstOccurence = true;

      this.itemTargets.forEach((item) => {
        if (firstOccurence && item.parentNode.classList.contains('d-none')) {
          myDivChild.innerHTML = item.innerHTML
          item.parentNode.remove()
          myDiv.classList.remove('remove-transition')
          myDiv.classList.add('add-transition')
          myDiv.style.opacity = '100';
          firstOccurence = false;
        }
      })
    }, 1000);
  }
}

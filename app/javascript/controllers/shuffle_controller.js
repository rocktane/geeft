import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shuffle"
export default class extends Controller {
  static targets = ["item"]

  connect() {
  }

  update(event) {
    // console.log(event.target.parentNode);
    // const array = Array.from(event.target.parentNode.classList[1])
    // const value = event.target.parentNode.classList[1]
    // const classe = Array.from(value.classList)
    // console.log(value.classList, array.class)

    // console.log('first-hidden', this.hiddenTargets[0].parentNode.classList.remove("d-none"));
    // this.hiddenTargets[0].setAttribute("data","visible")
    // console.log('target-hidden', this.hiddenTargets[0].attributes[1].value = "visible")
    event.target.parentNode.classList.remove('add-transition')
    event.target.parentNode.classList.add('remove-transition')

    setTimeout(() => {

      event.target.parentNode.remove()

      let firstOccurence = true;
      this.itemTargets.forEach((item) => {
        if (firstOccurence && item.parentNode.classList.contains('d-none')) {
          item.parentNode.classList.add('add-transition')
          item.parentNode.classList.remove('d-none')
          firstOccurence = false;
        }
      })
    }, 1000);
  }
}

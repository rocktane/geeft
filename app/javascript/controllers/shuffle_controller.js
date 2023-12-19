import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shuffle"
export default class extends Controller {
  static targets = ["item", "line"]

  connect() {
  }

  update(event) {
      const myDiv = event.target.closest('.gift-item-row')
      const myDivChild = event.target.closest('.gift-item-row').firstChild
      const dNone = document.querySelectorAll('.gift-list-row, .d-none').length
      myDiv.style.opacity = '0';

      let firstOccurrence = this.itemTargets.find((item) => {
        return item.parentNode.classList.contains('d-none');
      });

      if (firstOccurrence) {
        myDivChild.innerHTML = firstOccurrence.innerHTML;
        firstOccurrence.parentNode.remove();
        myDiv.classList.add("animation");

        if (dNone === 1) {
          this.disableButton();
        }
      }

      this.newList()

      myDiv.style.opacity = '1';
      setTimeout(() => {
        myDiv.classList.remove("animation");
      }, 500);
  }

  disableButton() {
    const shuffleIcons = document.querySelectorAll('.shuffle')

    shuffleIcons.forEach((icon) => {
      icon.style.color = "grey";
      icon.style.pointerEvents = 'none';
    });
  };

  newList() {
    const cinqPremiersElements = this.itemTargets.slice(0, 5);
    let new_list = []
     cinqPremiersElements.forEach((item) => {
      new_list.push(item.innerText)
    })
    console.log(new_list);
  }
}

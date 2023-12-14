import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shuffle"
export default class extends Controller {
  static targets = ["visible", "hidden"]

  connect() {
  }

  update() {
    const visible = this.visibleTargets
    console.log("visibleTarget", this.visibleTarget)
    console.log("visibleTarget", target.dataset.shuffleTarget)
    console.log("visibleTarget", target.dataset.shuffleId)
    console.log(this.element.querySelector(`[data-shuffle-id="${index}"][data-shuffle-target="${targetName === 'visible' ? 'hidden' : 'visible'}"]`))
    // const lastTwentyfive = this.hiddenTargets
  }
}

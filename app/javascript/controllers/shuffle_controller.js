import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shuffle"
export default class extends Controller {
  static targets = ["index", "hidden"]

  connect() {
    const firstFive =  this.indexTargets
    console.log(this.hiddenTargets);
    console.log(firstFive);
  }

  update() {
    this.classListToggle('d-none')
    // const firstFive =  this.indexTargets[0]
    // console.log(firstFive);
  }
}

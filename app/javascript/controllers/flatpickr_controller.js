import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";


// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "eventDate" ]
  connect() {
    console.log("Hello from flatpickr controller")
    flatpickr(this.eventDateTarget, {})
  }
}

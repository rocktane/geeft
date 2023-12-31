import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="custom-interest"
export default class extends Controller {
  static targets = [ "inputInterest", "divInterest" ]
  connect() {
  }

  addcustominterestasapill(event) {
    event.preventDefault()
    const custom = this.inputInterestTarget.value;
    this.divInterestTarget.lastElementChild.insertAdjacentHTML("beforeend", `<div class="form-check"><input class="form-check-input check_boxes optional pill-interest" data-action="click->checkboxes#connect" type="checkbox" checked="checked" value="${custom}" name="event[subject][]" id="event_subject_${custom}"></input><label class="form-check-label collection_check_boxes" for="event_subject_${custom}">${custom}</label>`)

    document.getElementById('new-input-box').value = "";
    if (document.getElementById('new-input-box').value === "") {
      this.inputInterestTarget.value = ""
      addButton.setAttribute('disabled', true)
    }
  }
}

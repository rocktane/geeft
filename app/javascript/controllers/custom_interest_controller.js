import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="custom-interest"
export default class extends Controller {
  static targets = [ "customInterest", "output" ]
  connect() {
    console.log("hello custom");
  }

  addcustominterestasapill(event) {

    // const customInterest = this.CustomInterestTarget.value
    // ici il faut faire en sort que customInterest entre dans
    // l'array subject, et n'overwrite pas l'array subject

    // prendre le checkboxes form check et injecter dedans ma value ,
    // inject before end dans le tag fieldset class event-subject
    console.log(customInterestTarget.value);
    // customInterest.checked
  }
}

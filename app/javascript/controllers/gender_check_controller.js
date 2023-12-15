import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="gender-check"
export default class extends Controller {
  connect() {
  }

  neutral() {
    document.getElementById("event_genre_female").removeAttribute("checked")
    document.getElementById("event_genre_male").removeAttribute("checked")
    document.getElementById("event_genre_neutral").setAttribute("checked", "checked")
  }

  female() {
    document.getElementById("event_genre_neutral").removeAttribute("checked")
    document.getElementById("event_genre_male").removeAttribute("checked")
    document.getElementById("event_genre_female").setAttribute("checked", "checked")
  }

  male() {
    document.getElementById("event_genre_neutral").removeAttribute("checked")
    document.getElementById("event_genre_female").removeAttribute("checked")
    document.getElementById("event_genre_male").setAttribute("checked", "checked")
  }
}

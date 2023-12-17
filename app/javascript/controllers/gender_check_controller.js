import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="gender-check"
export default class extends Controller {
  connect() {
  }

  toggleActive(element) {
    console.log(element);
    console.log(element.classList);
    document.querySelector(".genre-button.female").classList.remove("active");
    document.querySelector(".genre-button.male").classList.remove("active");
    document.querySelector(".genre-button.neutral").classList.remove("active");
    element.classList.add("active");
  }

  neutral(event) {
    document.getElementById("event_genre_female").removeAttribute("checked")
    document.getElementById("event_genre_male").removeAttribute("checked")
    document.getElementById("event_genre_neutral").setAttribute("checked", "checked")
    this.toggleActive(event.target.closest(".genre-button"));
  }

  female(event) {
    document.getElementById("event_genre_neutral").removeAttribute("checked")
    document.getElementById("event_genre_male").removeAttribute("checked")
    document.getElementById("event_genre_female").setAttribute("checked", "checked")

    this.toggleActive(event.target.closest(".genre-button"));
  }

  male(event) {
    document.getElementById("event_genre_neutral").removeAttribute("checked")
    document.getElementById("event_genre_female").removeAttribute("checked")
    document.getElementById("event_genre_male").setAttribute("checked", "checked")

    this.toggleActive(event.target.closest(".genre-button"));
  }
}

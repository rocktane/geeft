import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chatgpt-request"
export default class extends Controller {

  static targets = ["form", "loader"]
  connect() {
    console.log("coucou")
    console.dir(this.formTarget.action)
  }

  async fetchApi(event) {
    event.preventDefault();
    const url = this.formTarget.action;

    // Afficher le loader
    this.loaderTarget.classList.remove("d-none")
    this.formTarget.classList.add("d-none")

    try {
      const response = await fetch(url, {
        method: "POST",
        body: new FormData(this.formTarget)
      });

      const data = await response.text();

      // Mettre à jour le contenu avec la réponse
      this.element.outerHTML = data;
      console.log(data);
    } catch (error) {
      console.error("Une erreur s'est produite :", error);
    }
  }
}

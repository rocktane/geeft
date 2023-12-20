import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="list-updater"
export default class extends Controller {
  static targets = ["listItem"]
  connect() {
    // console.log("hello from updater")
  }

  newList() {
    const cinqPremiersElements = this.listItemTargets.slice(0, 5);
    let new_list = []
     cinqPremiersElements.forEach((item) => {
      new_list.push(item.innerText)
    })
    return new_list
  }

  async updateEvent(event) {
    event.preventDefault()
    const eventId = event.currentTarget.dataset.id
    const url = `http://localhost:3000/events/${eventId}/event`
    console.log(url)
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
    const newList = this.newList()

    try {
      const response = await fetch(url, {
        method: "POST",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken // Incluez le jeton CSRF dans les en-têtes
        },
        body: JSON.stringify({ list: newList })
      });
      const data = await response.json();
      window.setTimeout(()=> {
        window.location.href = `/events/${data.id}/event`
      }, 500)
    } catch (error) {
      console.error("Une erreur s'est produite :", error);
    }
  }
}

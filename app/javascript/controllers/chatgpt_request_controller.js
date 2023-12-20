import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chatgpt-request"
export default class extends Controller {

  static targets = ["form", "loader"]
  connect() {
  }

  async fetchApi(event) {
    event.preventDefault();
    const url = this.formTarget.action;

    // Afficher le loader
    this.loaderTarget.classList.remove("d-none")
    this.loader()
    this.formTarget.classList.add("d-none")

    console.dir(this.formTarget)

    try {
      const response = await fetch(url, {
        method: "POST",
        Accept: "application/json",
        body: new FormData(this.formTarget)
      });

      const data = await response.json();
      window.setTimeout(()=> {
        window.location.href = `/events/${data.id}`
      }, 500)
    } catch (error) {
      console.error("Une erreur s'est produite :", error);
    }
  }

  loader() {
    var phrases = ["Connecting to server", "Grabbing objects", "Redndering page", "Resolving IP", "Pondering emptiness", "Considering alternatives", "Shuffling bits", "Waiting for response", "Generating pages", "Simulating workflow", "Empowering humanity", "Being awsome", "Fueling the idea", "Fixing CSS", "Talking to server", "Fetching data"];
    var easterEgg = ["Ticket to chatGPT", "def wakingUp(Tal)", "Initializing Antoine", "Asking Maewenn", "Harceling Loris", "No thanks to Dylan", "const phoneCase = Théo", "Pushing on main", "Who use Ruby?", "Waiting for David", "Deleting S.Saunier"];
    addPhrasesToDocument(phrases);
    var start_time = new Date().getTime();
    var upward_moving_group = document.getElementById("phrases");
    upward_moving_group.currentY = 0;
    var checks = phrases.map(function(_, i) {
      return {check: document.getElementById(checkmarkIdPrefix + i), circle: document.getElementById(checkmarkCircleIdPrefix + i)};
    });
    function animateLoading() {
      var now = new Date().getTime();
      upward_moving_group.setAttribute("transform", "translate(0 " + upward_moving_group.currentY + ")");
      upward_moving_group.currentY -= 1.35 * easeInOut(now);
      checks.forEach(function(check, i) {
        var color_change_boundary = - i * verticalSpacing + verticalSpacing + 15;
        if (upward_moving_group.currentY < color_change_boundary) {
          var alpha = Math.max(Math.min(1 - (upward_moving_group.currentY - color_change_boundary + 15)/30, 1), 0);
          check.circle.setAttribute("fill", "rgba(255, 255, 255, " + alpha + ")");
          var check_color = [Math.round(255 * (1-alpha) + 120 * alpha), Math.round(255 * (1-alpha) + 154 * alpha)];
          check.check.setAttribute("fill", "rgba(255, " + check_color[0] + "," + check_color[1] + ", 1)");
        }
      })
      if (now - start_time < 30000 && upward_moving_group.currentY > -710) {
        requestAnimationFrame(animateLoading);
      }
    }
  }
}

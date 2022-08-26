import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "position", "time", "people" ]

  connect() {
    setInterval(() => {
      this.refresh()
    }, 5000)
  }

  refresh() {
    // Simple refresh:
    // window.location.reload();
    const queuerId = this.element.id.split("-")[1];
    // console.log(queuerId)

    fetch(window.location.origin + "/queuers/" + queuerId, {
      headers: { "Accept": "application/json" },
    })
      .then(response => response.json())
      .then((data) => {
        this.positionTarget.innerText = data.position
        this.timeTarget.innerText = data.wait_time
        this.peopleTarget.innerText = data.people
      })

  }
}

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "wait", "customers" ]

  connect() {
    console.log("HEllo from connect time cont")
    setInterval(() => {
      this.refresh()
    }, 5000)
  }

  refresh() {
    // Simple refresh:
    // window.location.reload();
    const restaurantId = this.element.id.split("-")[1];
    // console.log(restaurantId)
    // .split("-")[1]

    fetch(window.location.origin + "/restaurants/" + restaurantId, {
      headers: { "Accept": "application/json" },
    })
      .then(response => response.json())
      .then((data) => {
        this.customersTarget.innerText = data.line_size
        this.waitTarget.innerText = data.wait_time

      })

  }
}

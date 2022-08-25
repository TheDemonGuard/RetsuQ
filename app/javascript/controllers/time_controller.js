import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = [ "restaurant" ]

  connect() {
    setInterval(() => {
      this.refresh()
    }, 5000)
  }

  refresh() {
    // Simple refresh:
    // window.location.reload();
    const restaurantId = this.element.id.split("-")[1];
    console.log(restaurantId)
    // .split("-")[1]

    fetch(window.location.origin + "/restaurants/" + restaurantId, {
      headers: { "Accept": "application/json" },
    })
      .then(response => response.json())
      .then((data) => {
        this.element.innerText = data.wait_time
      })

  }
}
// Simple page refresh
// connect() {
//   setInterval(() => {
//     this.refresh()
//   }, 1000)
// }

// refresh() {
//   // Simple refresh:
//   window.location.reload();

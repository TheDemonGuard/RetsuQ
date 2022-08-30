import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "join", "overlay", "status", "wait", "customers", "closed" ]

  connect() {
    console.log('Hello, Restaurant card!')

    if (this.statusTarget.innerText == "Open") {
      console.log(this.overlayTarget)
      this.overlayTarget.style.display = "none"
      this.closedTarget.style.display = "none"
    }
    else {
      this.joinTarget.style.display = "none"
      this.waitTarget.classList.add("closed")
      this.customersTarget.classList.add("closed")
    }
  }

  }

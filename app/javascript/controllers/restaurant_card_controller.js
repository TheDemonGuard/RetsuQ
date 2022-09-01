import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "overlay", "status", "wait", "customers" ]

  connect() {
    console.log('Hello, Restaurant card!')

    if (this.statusTarget.innerText == "Open") {
      console.log(this.overlayTarget)
      this.overlayTarget.style.display = "none"
    }
    else {
      // this.joinTarget.classList.add("closed")
      // this.joinTarget.innerText = "Queue closed"
      this.waitTarget.classList.add("closed")
      this.customersTarget.classList.add("closed")
    }
  }

  }

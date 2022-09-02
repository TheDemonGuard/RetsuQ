import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["nearyou"]

  connect() {
    this.crd = {}
    navigator.geolocation.getCurrentPosition(this.success.bind(this))
  }

  success(pos) {
    this.crd = pos.coords;

    console.log('Your current position is:');
    console.log(`Latitude : ${this.crd.latitude}`);
    console.log(`Longitude: ${this.crd.longitude}`);
    console.log(`More or less ${this.crd.accuracy} meters.`);
  };

  getRestaurants(event) {
    const maxDistance = event.currentTarget.value
    console.log(this.crd, maxDistance)
    fetch(window.location.origin + "?lat=" + this.crd.latitude + "&long=" + this.crd.longitude + "&dist=" + maxDistance, {
      headers: { "Accept": "application/json" },
    })
      .then(response => response.json())
      .then((data) => {
        console.log(`data.restaurants.length ${data.restaurants.length}.`);
        console.log(`data.restaurants ${data.restaurants}.`);
        console.log(`Array.isArray(data.restaurants) ${Array.isArray(data.restaurants)}.`);

        console.log(`data ${data}.`);
        if ( Array.isArray(data.restaurants) == false )
        {
          this.nearyouTarget.innerHTML = ""
        }
        else
        {
          this.nearyouTarget.innerHTML = data.restaurants
        }
      })
  }
}

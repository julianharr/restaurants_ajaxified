import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "count" ]
  connect() {
    console.log('Hello!');
    // Prints out the <span> element in home.html.erb with data-counter-target as a name

    // this.countTarget returns the first one; this.countTargets returns them all
    console.log(this.countTarget);

    // LIVE ACTION, NO BUTTON CLICKS NEEDED

    // Refresh the page every 5 seconds without having to click a button 'refresh'
    setInterval(this.refresh, 5000);
  }

  refresh = () => {
    // TODO:
    // Retrieve the number of restaurants from the database (with an HTTP request)
    // Replace the count with the updated count
    console.log("5 seconds have passed");
    // this triggers restaurants#index, but we don't want to get the index page, we want the JSON data
    fetch('/restaurants', { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        console.log(data);

        // Target the innerHTML of the counter and change it to the length of the restaurants array
        this.countTarget.innerHTML = data.restaurants.length;
      });
  }
}

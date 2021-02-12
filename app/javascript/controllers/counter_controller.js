import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "count" ]
  connect() {
    console.log('Hello!');
    // Prints out the <span> element in home.html.erb with data-counter-target as a name

    // this.countTarget returns the first one; this.countTargets returns them all
    console.log(this.countTarget)
  }

  refresh() {
    // TODO:
    // Retrieve the number of restaurants from the database (with an HTTP request)
    // Replace the count with the updated count

    // this triggers restaurants#index, but we don't want to get the index page
    fetch('/restaurants', { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
      });
  }
}

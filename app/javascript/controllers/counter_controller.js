import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "count" ]
  connect() {
    console.log('Hello!');
    console.log(this.countTarget)
  }
}

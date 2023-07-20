import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dismissible-alert"
export default class extends Controller {
  static targets = ["alert"];

  connect() {}

  close() {
    this.alertTarget.remove();
  }
}

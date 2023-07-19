import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["container", "checkbox", "select", "input"];

  connect() {
    this.savedValue = this.selectTarget.value;
    this.toggle();
  }

  toggle() {
    if (this.checkboxTarget.checked) {
      this.showContainer();
    } else {
      this.hideContainer();
    }
  }

  showContainer() {
    // Store the current value in a variable before removing it
    this.savedValue = this.selectTarget.value;
    this.selectTarget.value = null;
    this.selectTarget.disabled = true;
    this.containerTarget.style.display = "block";
  }

  hideContainer() {
    // Retrieve the saved value and set it back to the select element
    this.selectTarget.value = this.savedValue;
    this.savedValue = null;
    this.selectTarget.disabled = false;
    this.checkboxTarget.checked = false;
    this.containerTarget.style.display = "none";
  }
}

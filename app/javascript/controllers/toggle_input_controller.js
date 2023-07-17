import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="toggle-input"
export default class extends Controller {
  static targets = ["container", "checkbox", "select", "input"];

  connect() {
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
    this.selectTarget.value = "";
    this.selectTarget.selectedIndex = 0;
    this.selectTarget.disabled = true;
    this.containerTarget.style.display = "block";
  }

  hideContainer() {
    this.selectTarget.disabled = false;
    this.checkboxTarget.checked = false;
    this.inputTarget.value = "";
    this.containerTarget.style.display = "none";
  }
}

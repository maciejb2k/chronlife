import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="range-slider"
export default class extends Controller {
  static targets = ["value", "output"];

  connect() {
    this.updateOutput();
  }

  updateValue() {
    this.updateOutput();
  }

  updateOutput() {
    const value = this.valueTarget.value;
    this.outputTarget.textContent = value;
  }
}

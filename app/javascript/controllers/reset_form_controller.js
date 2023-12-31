import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="reset_form"
export default class extends Controller {
  connect() {
    this.element.addEventListener("submit", this.clear);
  }

  clear() {
    this.element.reset();
    this.element
      .querySelectorAll(".dash-form__group__error")
      .forEach((error) => {
        error.remove();
      });
  }
}

import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="simple-dropdown"
export default class extends Controller {
  static targets = ["button", "content"];

  connect() {
    this.isOpened = false;
  }

  disconnect() {
    this.hide();
  }

  show() {
    this.isOpened = true;
    this.contentTarget.classList.add("simple-dropdown__content--active");
    this.contentTarget.classList.remove("simple-dropdown__content--hidden");
  }

  hide() {
    this.isOpened = false;
    this.contentTarget.classList.remove("simple-dropdown__content--active");
    this.contentTarget.classList.add("simple-dropdown__content--hidden");
  }

  handleOutsideClick(event) {
    if (this.isOpened && !this.element.contains(event.target)) {
      this.hide();
    }
  }

  toggle() {
    this.isOpened ? this.hide() : this.show();
  }
}

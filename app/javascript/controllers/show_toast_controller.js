import { Controller } from "@hotwired/stimulus";
import { Toast } from "../utils/toast";

// Connects to data-controller="show-toast"
export default class extends Controller {
  connect() {
    console.log(this.element);
    Toast.fire({
      icon: this.element.dataset.icon || "info",
      text: this.element.dataset.message,
    });
  }
}

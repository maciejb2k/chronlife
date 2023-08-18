import { Controller } from "@hotwired/stimulus";
import { Toast } from "../utils/toast";

// Connects to data-controller="show-toast"
export default class extends Controller {
  connect() {
    Toast.fire({
      icon: this.element.dataset.icon || "info",
      text: this.element.dataset.message,
    }).then((result) => {
      if (result.isDismissed) {
        this.element.remove();
      }
    });
  }
}

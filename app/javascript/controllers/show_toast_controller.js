import { Controller } from "@hotwired/stimulus";
import Swal from "sweetalert2";

export const Toast = Swal.mixin({
  toast: true,
  position: "top-end",
  showConfirmButton: false,
  timer: 2000,
  timerProgressBar: true,
  didOpen: (toast) => {
    toast.addEventListener("mouseenter", Swal.stopTimer);
    toast.addEventListener("mouseleave", Swal.resumeTimer);
  },
});

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

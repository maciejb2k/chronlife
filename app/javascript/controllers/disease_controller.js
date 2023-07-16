import { Controller } from "@hotwired/stimulus";
import { Toast } from "../utils/toast";

// Connects to data-controller="disease"
export default class extends Controller {
  connect() {}

  confirmDelete(e) {
    Toast.fire({
      icon: "success",
      title: "Poprawnie usunięto chorobę",
    });
  }
}

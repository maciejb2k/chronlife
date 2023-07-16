import { Controller } from "@hotwired/stimulus";
import Swal from "sweetalert2";

// Connects to data-controller="disease"
export default class extends Controller {
  connect() {}

  confirmDelete(e) {
    Swal.fire("Any fool can use a computer");
  }
}

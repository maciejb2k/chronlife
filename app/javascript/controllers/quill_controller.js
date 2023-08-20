import { Controller } from "@hotwired/stimulus";
import Quill from "quill";

// Connects to data-controller="quill"
export default class extends Controller {
  static targets = ["editor", "input"];

  connect() {
    this.quill = new Quill(this.editorTarget, {
      theme: "snow",
    });

    this.quill.container.firstChild.innerHTML = this.inputTarget.value;
    this.quill.on("text-change", () => {
      this.inputTarget.value = this.quill.container.firstChild.innerHTML;
    });
  }

  disconnect() {
    if (this.quill) {
      this.quill = null;
    }
  }
}

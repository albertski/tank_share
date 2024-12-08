import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-modal"
export default class extends Controller {
  static targets = ["image"];

  connect() {
    window.addEventListener("show-image-modal", this.open.bind(this));
  }

  disconnect() {
    window.removeEventListener("show-image-modal", this.open.bind(this));
  }

  open(event) {
    const imageUrl = event.detail.url;
    this.imageTarget.src = imageUrl;
    this.element.classList.remove("hidden");
  }

  close() {
    this.element.classList.add("hidden");
    this.imageTarget.src = "";
  }
}

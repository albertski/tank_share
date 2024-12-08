import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slideshow"
export default class extends Controller {
  static targets = ["slideshow"];

  connect() {
    this.currentIndex = 0;
    this.updateSlide();
  }

  next() {
    this.currentIndex = (this.currentIndex + 1) % this.slideshowTarget.children.length;
    this.updateSlide();
  }

  prev() {
    this.currentIndex = (this.currentIndex - 1 + this.slideshowTarget.children.length) % this.slideshowTarget.children.length;
    this.updateSlide();
  }

  updateSlide() {
    const slideWidth = this.slideshowTarget.children[0].offsetWidth;
    const offset = -this.currentIndex * slideWidth;
    this.slideshowTarget.style.transform = `translateX(${offset}px)`;
  }

  showImage(event) {
    const imageUrl = event.target.dataset.urlValue;
    const showEvent = new CustomEvent("show-image-modal", {
      detail: { url: imageUrl }
    });
    window.dispatchEvent(showEvent);
  }
}

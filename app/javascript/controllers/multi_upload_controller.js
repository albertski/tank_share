import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="multi-upload"
export default class extends Controller {
  static targets = ["files", "preview"]
  static values = {
    imageWidth: { type: Number, default: 150 },
    imageHeight: { type: Number, default: 150 }
  }

  addFile(event) {
    const originalInput = event.target
    const file = originalInput.files[0]

    if (file) {
      this.createNewInputField(originalInput)
      this.createImagePreview(file)
    }
  }

  createNewInputField(originalInput) {
    const originalParent = originalInput.parentNode
    this.filesTarget.append(originalInput)
    const newInput = originalInput.cloneNode()
    newInput.value = ""
    originalParent.append(newInput)
  }

  createImagePreview(file) {
    const reader = new FileReader()
    reader.onload = (e) => {
      const imagePreview = document.createElement("img")
      imagePreview.src = e.target.result
      imagePreview.classList.add("rounded-lg", "shadow-md")
      console.log(`${this.imageWidthValue}px`)
      imagePreview.style.width = `${this.imageWidthValue}px`
      imagePreview.style.height = `${this.imageHeightValue}px`
      this.previewTarget.append(imagePreview)
    }
    reader.readAsDataURL(file)
  }
}

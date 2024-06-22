import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hide"
export default class extends Controller {
  static targets = [ "element" ]
  connect() {
    setTimeout(() => {
      this.elementTarget.classList.add('hidden')
    }, "3000");
  }
}

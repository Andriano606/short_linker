import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Hello controller test ts!");
    // this.element.textContent = "Hello World!"
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {

  static targets = ["keyword", "form", "div"]
  static values = {url : String}

  connect() {

  }

  keyword() {
    // DOMParser doc + stackoverflow (parse data from html response)
    const parser = new DOMParser();

    // stimulus doc : working with external resources
    fetch(`/costumes${this.urlValue}${this.keywordTarget.value}`)
    .then(response => response.text())
    .then(html => this.divTarget.innerHTML = parser.parseFromString(html, "text/html").getElementById("costumes").innerHTML)
  }

}

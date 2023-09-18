import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {

  static targets = ["keyword", "form", "div", "women", "men"]
  static values = {url : String}

  connect() {
    // DOMParser doc + stackoverflow (parse data from html response)
    this.parser = new DOMParser();

  }

  keyword() {
    console.log("method: keyword")
    return `${this.keywordTarget.value}`

  }

  gender() {
    console.log("method: gender")
    return `${(this.womenTarget.checked ? (this.menTarget.checked ? "" : "Women") : (this.menTarget.checked ? "Men" : ""))}`

    // fetch(`${baseUrl}${gender}`)
    //   .then(response => response.text())
    //   .then(html => this.divTarget.innerHTML = this.parser.parseFromString(html, "text/html").getElementById("costumes").innerHTML)
  }

  reload() {
    // stimulus doc : working with external resources
    const baseUrl = `${window.location.href}`
    const url = `${baseUrl}?gender=${this.gender()}&keyword=${this.keyword()}`
    console.log(url)
    fetch(url)
    .then(response => response.text())
    .then(html => this.divTarget.innerHTML = this.parser.parseFromString(html, "text/html").getElementById("costumes").innerHTML)

  }



}

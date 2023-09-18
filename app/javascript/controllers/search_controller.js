import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {

  static targets = [
    "div", "keyword", "women", "men", "size"
  ]

  connect() {
    // DOMParser doc + stackoverflow (parse data from html response)
    this.parser = new DOMParser()
  }

  size() {
    console.log("method: size")
    const size = []
    this.sizeTargets.forEach(target => (target.checked) && size.push(target.name) )
    return size
  }

  keyword() {
    console.log("method: keyword")
    return `${this.keywordTarget.value}`
  }

  gender() {
    console.log("method: gender")
    return `${(this.womenTarget.checked ? (this.menTarget.checked ? "" : "Women") : (this.menTarget.checked ? "Men" : ""))}`
  }

  reload() {
    // stimulus doc : working with external resources
    const baseUrl = `${window.location.href}`
    const url = `${baseUrl}?gender=${this.gender()}&keyword=${this.keyword()}&size=${this.size()}`
    console.log(url)
    fetch(url)
    .then(response => response.text())
    .then(html => this.divTarget.innerHTML = this.parser.parseFromString(html, "text/html").getElementById("costumes").innerHTML)

  }



}

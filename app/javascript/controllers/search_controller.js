import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {

  static targets = [
    "div", "keyword", "women", "men",
    "size", "min", "max", "perfect", "used"
  ]

  static values = {max: Number}

  connect() {
    // DOMParser doc + stackoverflow (parse data from html response)
    this.parser = new DOMParser()
  }

  size() {
    const size = []
    this.sizeTargets.forEach(target => (target.checked) && size.push(target.name) )
    return size
  }

  keyword() {
    return `${this.keywordTarget.value}`
  }

  gender() {
    return `${(this.womenTarget.checked ? (this.menTarget.checked ? "" : "women") : (this.menTarget.checked ? "men" : ""))}`
  }

  price () {
    const min = parseInt(this.minTarget.value)
    const max = parseInt(this.maxTarget.value)
    return  `(${(min ? min : 0)}..${(max ? max : this.maxValue)})`
  }

  condition () {
    return `${(this.perfectTarget.checked ? (this.usedTarget.checked ? "" : "Perfect") : (this.usedTarget.checked ? "Used" : ""))}`
  }

  reload() {
    // stimulus doc : working with external resources
    const baseUrl = `${window.location.href}`
    const url = `${baseUrl}?gender=${this.gender()}&keyword=${this.keyword()}&size=${this.size()}&price=${this.price()}&condition=${this.condition()}`
                  console.log(url)
    fetch(url)
      .then(response => response.text())
      .then(html => this.divTarget.innerHTML = this.parser.parseFromString(html, "text/html").getElementById("costumes").innerHTML)
  }
}

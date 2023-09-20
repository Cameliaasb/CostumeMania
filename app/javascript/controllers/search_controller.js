import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {

  static targets = [
    "div", "keyword", "women", "men",
    "size", "min", "max", "perfect", "used"
  ]

  static values = {max: Number}

  connect() {
    // DOMParser doc + stackoverflow (allows to parse data from html response)
    // Used in reload()
    this.parser = new DOMParser()
  }

  size() {
    const size = []
    // Gathers the sizes chosen by client in index filter
    // size is then in an array that will be used in url
    // ex: ...&size=[S,M]..
    this.sizeTargets.forEach(target => (target.checked) && size.push(target.name) )
    return size
  }

  keyword() {
    // Reccuperates keyword in the searchbar. Activated with each keyup
    // Results change at each new letter
    // ex: ...&keyword=mermaid..
    // the keyword is then sent to costumes_controller and processed with Algolia
    return `${this.keywordTarget.value}`
  }

  gender() {
    // Gathers genders chosen in checkboxes
    // ex: ...&gender=men..
    // if both genders => all results
    // the gender is then sent to costumes_controller that renders results for given gender + unisex costumes
    return `${(this.womenTarget.checked ? (this.menTarget.checked ? "" : "women") : (this.menTarget.checked ? "men" : ""))}`
  }

  price () {
    // Gathers prices from input fields
    // ex: ...&price=(0..7)..
    const min = parseInt(this.minTarget.value)
    const max = parseInt(this.maxTarget.value)
    // Constructs a range in url :
      // min price is the one in input, otherwise is 0
      // max price is the one in input, otherwise is the highest price on index
    return  `(${(min ? min : 0)}..${(max ? max : this.maxValue)})`
  }

  condition () {
    // Gathers condition filter from checkboxes
    return `${(this.perfectTarget.checked ? (this.usedTarget.checked ? "" : "Perfect") : (this.usedTarget.checked ? "Used" : ""))}`
  }

  reload() {
    // stimulus doc : working with external resources
    const baseUrl = `${window.location.href}`
    // gathers all conditions and chosen filters to form a new url
    const url = `${baseUrl}?gender=${this.gender()}&keyword=${this.keyword()}&size=${this.size()}&price=${this.price()}&condition=${this.condition()}`

    // Page renders all results of the given url with filters
    // and replaces dynamically the content of index with the filtered content
    fetch(url)
      .then(response => response.text())
      // the div target contains all existing results
      // it is replaced by the results fetched with url
      .then(html => this.divTarget.innerHTML = this.parser.parseFromString(html, "text/html").getElementById("costumes").innerHTML)
  }
}

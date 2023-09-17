import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {

  static targets = ["query"]
  connect() {
    console.log('jysuis')
    console.log(this.queryTarget)

  }

  keyword() {
    console.log(this.queryTarget.value)
  }

}

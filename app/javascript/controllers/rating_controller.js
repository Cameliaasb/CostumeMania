import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rating"
export default class extends Controller {

  static targets = ["rateInput"]

  connect() {
  }

  rate(e) {
    e.preventDefault()
    const rating = e.target.innerHTML
    const input = this.rateInputTargets.filter(input => input.form === e.target.closest("form"))
    input[0].value = rating
  }

  toggle(e) {
    e.preventDefault()
    console.log("dans le toggle")
    const rating = e.target.elements["review_rating"].value
    const content = e.target.elements["review_content"].value
    if (rating && content) {
      e.target.submit()
    }
  }

}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rating"
export default class extends Controller {

  static targets = ["rateInput"]

  connect() {
    this.rateInputTargets.forEach(input => console.log(input.value))
  }

  rate1(e) {
    console.log(e.target.form)
    const input = this.rateInputTargets.filter(input => input.form == e.target.form)
   console.log(input)

  }

  rate2(e) {
    this.rateInputTarget.value = 2

  }

  rate3() {
  }

  rate4() {
  }

  rate5() {
  }
}

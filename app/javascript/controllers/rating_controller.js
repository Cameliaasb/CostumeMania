import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rating"
export default class extends Controller {

  static targets = ["rateInput"]

  connect() {
    this.rateInputTargets.forEach(input => console.log("Inputs => ", input.form))
  }

  rate1(e) {
    e.preventDefault()
    // console.log(e.target.closest("form"))
    const rating = e.target.innerHTML
    const input = this.rateInputTargets.filter(input => input.form === e.target.closest("form"))
    // console.log(input)
    // input[0].value = 1
    // input[0].form.submit()
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

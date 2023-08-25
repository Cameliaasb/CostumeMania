import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rating"
export default class extends Controller {

  static targets = ["rateInput"]

  connect() {
  }

  rate1() {
    console.log("cc");
    this.rateInputTarget.value = 1
  }
  rate2() {
    this.rateInputTarget.value = 2
  }
  rate3() {
    this.rateInputTarget.value = 3
  }
  rate4() {
    this.rateInputTarget.value = 4
  }
  rate5() {
    this.rateInputTarget.value = 5
  }
}

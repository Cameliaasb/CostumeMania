import { Controller } from "@hotwired/stimulus"

// Used for choosing dates when the client makes/edits a booking request

import flatpickr from "flatpickr";
export default class extends Controller {

  static targets = ["initialInput", "start", "end"]

  connect() {
    flatpickr(this.initialInputTarget, {
      mode: "range",
      minDate: "today"
    }
    )
  }

  convert() {
    // Get the dates from range and give them as values for hidden inputs
    const dates = this.initialInputTarget.value.split(' to ')
    if (dates[0]) this.startTarget.value = dates[0]
    if (dates[1]) this.endTarget.value = dates[1]
  }
}

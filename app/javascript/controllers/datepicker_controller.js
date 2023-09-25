import { Controller } from "@hotwired/stimulus"

// Used for choosing dates when the client makes/edits a booking request

import flatpickr from "flatpickr";
export default class extends Controller {
  connect() {
    console.log("ici")
    flatpickr(this.element, {
      mode: "range",
      minDate: "today"
    }
    )

  }

  convert() {
      // get hidden inputs (:starts_at, :ends_at)
    const start_input = this.element.form.elements[1]
    const end_input = this.element.form.elements[2]

    // // Get the dates from range and give them as values for hidden inputs
    const dates = this.element.value.split(' to ')
    if (dates[0]) start_input.value = dates[0]
    if (dates[1]) end_input.value = dates[1]
  }
}

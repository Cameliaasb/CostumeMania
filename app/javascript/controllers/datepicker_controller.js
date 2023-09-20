import { Controller } from "@hotwired/stimulus"

// Used for choosing dates when the client makes/edits a booking request

import flatpickr from "flatpickr";
export default class extends Controller {
  connect() {
    flatpickr(this.element)
  }
}

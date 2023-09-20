import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rating"
export default class extends Controller {

  static targets = ["rateInput"]

  connect() {
  }

  // Method called when a client rates a costume using the stars
  // From views/reviews/_form.html.erb
  rate(e) {
    // prevents the page from reloading
    e.preventDefault()

    // Allows for clicked stars to become checked (stars are radio buttons)
    e.target.previousElementSibling.checked = true

    // The event target is a star, its innerHTML is an integer
    const input_rating = e.target.innerHTML

    // The rateInputTargets are the field :rating. They are at the end of all the review forms
    // Here we select the rateInputTarget that is associated with the right costume
    // which is the form that contains the star the user clicked on
    const input = this.rateInputTargets.filter(input => input.form === e.target.closest("form"))

    // We give the :rating the correct number from input
    input[0].value = input_rating
  }


  // Method called when a client wants to submit a review form
  valid(e) {
    // prevents page from releoading
    e.preventDefault()

    // We gather the form :rating and :content (mandatory fields for a review)
    const input_rating = e.target.elements["review_rating"].value
    const content = e.target.elements["review_content"].value

    // If both :rating and :content are present => the form is submitted
    if (input_rating && content) {
      e.target.submit()
    }
  }

}

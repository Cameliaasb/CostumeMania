import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {

  static targets = ["searchBar"]
  static values = {
    costumes: Array
  }

  connect() {
    console.log("controller JS")
    console.log(this.costumesValue)
    const client = algoliasearch("8CJLJYFBQ9", "257b6fbd04d7474b1aa1cb321ff286c3");
    const index = client.initIndex('Costume');
    const search = index.search(this.searchBarTarget.value)
      .then(function searchDone(content) {
        console.log(content.hits)
      })
      .catch(function searchFailure(err) {
        console.error("err");
      });

  }
}

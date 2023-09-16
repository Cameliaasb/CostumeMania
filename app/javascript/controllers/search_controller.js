import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {

  connect() {
    console.log("controller JS")
    const client = algoliasearch("8CJLJYFBQ9", "257b6fbd04d7474b1aa1cb321ff286c3");
    const index = client.initIndex('Costume');
    index.search('iron', { hitsPerPage: 10, page: 0 })
      .then(function searchDone(content) {
        console.log(content)
      })
      .catch(function searchFailure(err) {
        console.error("err");
      });
  }
}

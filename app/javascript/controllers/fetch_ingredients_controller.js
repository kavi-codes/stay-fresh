import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fetch-ingredients"
export default class extends Controller {
  connect() {

  }

  fetchIngredients() {
    fetch('https://shelf-life-api.herokuapp.com/guides/19091', {mode: "no-cors",
    method: "GET",
    })
    .then((response) => {
        console.log(response);
        response.text().then((data) => {
            console.log("data:" + data);
      });
    });
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-user-description"
export default class extends Controller {
  connect() {
  }
  initialize(){
    this.element.setAttribute('data-actions', 'click->edit-user-description#showModal')
  }
showModal(event) {
  event.preventDefault();
  const url = this.element.getAttribute("href");

  fetch(url, {
    headers: {
      'Accept': "text/vnd.turbo_stream.html",
    },
  })
    .then((response) => {
      if (response.ok) {
        return response.text();
      }
      throw new Error(`Error: ${response.statusText}`);
    })
    .then((html) => Turbo.renderStreamMessage(html)) // Process Turbo Stream response
    .catch((error) => console.error("Error fetching Turbo Stream:", error));
}


}

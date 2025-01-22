import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="connetions"
export default class extends Controller {
  static targets = ["connection"];
  connect() {
  }
  initialize(){
    this.element.setAttribute("data-action", "click->connections#prepareConnnectionsParams")
  }
  prepareConnnectionsParams(){
    event.preventDefault()
    this.url = this.getAttribute("href")
  }
}

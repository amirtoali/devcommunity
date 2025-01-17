import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["endDate", "currentlyWorking"];

  connect() {
    this.toggleCurrentlyWorking(); // Ensure checkbox is disabled on load if needed
  }

  toggleCurrentlyWorking() {
    if (this.endDateTarget.value) {
      this.currentlyWorkingTarget.checked = false;
      this.currentlyWorkingTarget.disabled = true;
    } else {
      this.currentlyWorkingTarget.disabled = false;
    }
  }
}

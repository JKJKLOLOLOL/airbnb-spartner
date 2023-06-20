import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hostdropmenu"
export default class extends Controller {
  connect() {
    console.log('Dropdown controller connected');
  }

  selectOption(event) {
    const selectedOption = event.target.value;
    console.log('Selected option:', selectedOption);
    // You can perform any actions here based on the selected option
  }
}

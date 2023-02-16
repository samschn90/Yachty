import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price-calculator"
export default class extends Controller {
  static values = {
    price: Number
  }
  static targets = ["total", "start", "end"]

  connect() {
    console.log("connected")
  }

  calculatePrice(event) {
    console.log("change")
    const start_date = Date.parse(this.startTarget.value)
    const end_date = Date.parse(event.currentTarget.value)
    const price = this.priceValue
    const rentDays = (end_date - start_date) / (60000 * 24 * 60)
    const totalBill = (rentDays * price)
    this.totalTarget.value = totalBill
  }
}

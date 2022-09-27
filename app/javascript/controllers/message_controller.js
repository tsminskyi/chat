import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["message_item"]

    initialize() {
        this.message_item = this.message_itemTarget;
    }

    connect() {
        this.message_item.addEventListener('click', () => this.click());
    }

    click() {
        event.stopPropagation()
        this.message_item.classList.add('close')
    }
}

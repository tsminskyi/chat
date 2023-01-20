import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["message_item"]

    initialize() {
        this.message_item = this.message_itemTarget;
        this.timer_id = null;
    }

    connect() {
        this.message_item.addEventListener('click', () => this.click());
        this.timer_id = setTimeout(() => {
            this.message_item.classList.add('close');
        }, 3000);
    }


    disconnect() {
        clearTimeout(this.timer_id);
    }

    click() {
        event.stopPropagation();
        this.message_item.classList.add('close');
        clearTimeout(this.timer_id);
    }
}

import {Controller} from "@hotwired/stimulus"

export default class extends Controller {

    initialize() {

    }

    reset() {
        this.element.reset()
        // this.messages_scroll.scrollTo(0, this.messages_scroll.scrollHeight)
    }

}

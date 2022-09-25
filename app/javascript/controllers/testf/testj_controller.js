import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["menu", "items", "icon"]

    initialize() {
        this.menu = this.menuTarget;//document.querySelector('.ui.dropdown');
        this.menu_item = this.itemsTarget;
        this.icon = this.iconTarget;
    }

    connect() {
        this.menu.addEventListener('click', () => this.click());
        this.icon.addEventListener('click', () => this.click());
        document.querySelector('body').addEventListener('click', () => {
            if (event.target !== (this.menu || this.icon)
                && this.menu.classList.contains('visible')) {
                this.refresh();
            }
        });
    }

    click() {
        event.stopPropagation()
        if (this.menu.classList.contains('visible')) {
            this.refresh();
        } else {
            this.menu.classList.add('active', 'visible');
            this.menu_item.classList.add('visible');
            this.menu_item.style.display = 'block';
        }
    }

    refresh() {
        this.menu.classList.remove('active', 'visible');
        this.menu_item.classList.remove('visible');
        this.menu_item.style.display = 'none';

    }
}

import { Controller } from "@hotwired/stimulus"
import { enter, leave } from 'el-transition';

export default class extends Controller {
  static targets = ['flash'];

  connect() {
    this.show();

    setTimeout(() => {
      this.hide();
    }, 3000);

    document.addEventListener('turbo:before-render', this.handleBeforeRender);
  }

  disconnect() {
    document.removeEventListener('turbo:before-render', this.handleBeforeRender);
  }

  handleBeforeRender = () => {
    this.remove();
  };

  show() {
    enter(this.flashTarget);
  }

  hide() {
    leave(this.flashTarget)
      .then(() => {
        this.remove();
      });
  }

  remove() {
    this.element.remove();
  }
}

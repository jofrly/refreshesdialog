import { Controller } from "@hotwired/stimulus"
import { disableBodyScroll, enableBodyScroll } from 'body-scroll-lock';
import { enter, leave } from 'el-transition';

export default class extends Controller {
  static targets = [
    'backdrop',
    'panel'
  ];

  connect() {
    this.show();
  }

  show() {
    enter(this.backdropTarget);
    enter(this.panelTarget);
    disableBodyScroll(this.element);
  }

  hide_on_success(event) {
    if (event.detail.success) {
      this.hide();
    }
  }

  hide() {
    Promise.all([
      leave(this.backdropTarget),
      leave(this.panelTarget)
    ]).then(() => {
      enableBodyScroll(this.element);
      this.element.remove();
    });
  }
}

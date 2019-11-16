import { Component, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-intoduction',
  templateUrl: './intoduction.component.html',
  styleUrls: ['./intoduction.component.scss']
})
export class IntoductionComponent {
  @Output()
  viewEmitter: EventEmitter<number> = new EventEmitter();

  changeView(view: number) {
    this.viewEmitter.emit(view);
  }
}

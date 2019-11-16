import { Component, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-info',
  templateUrl: './info.component.html',
  styleUrls: ['./info.component.scss']
})
export class InfoComponent {
  @Output()
  viewEmitter: EventEmitter<number> = new EventEmitter();

  changeView(view: number) {
    this.viewEmitter.emit(view);
  }
}

import { Component, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-postcards',
  templateUrl: './postcards.component.html',
  styleUrls: ['./postcards.component.scss']
})
export class PostcardsComponent {
  @Output()
  viewEmitter: EventEmitter<number> = new EventEmitter();

  changeView(view: number) {
    this.viewEmitter.emit(view);
  }
}

import { Component, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-questions',
  templateUrl: './questions.component.html',
  styleUrls: ['./questions.component.scss']
})
export class QuestionsComponent {
  @Output()
  viewEmitter: EventEmitter<number> = new EventEmitter();

  changeView(view: number) {
    this.viewEmitter.emit(view);
  }
}

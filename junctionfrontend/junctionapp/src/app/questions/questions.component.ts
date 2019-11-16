import { Component, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-questions',
  templateUrl: './questions.component.html',
  styleUrls: ['./questions.component.scss']
})
export class QuestionsComponent {
  @Output()
  viewEmitter: EventEmitter<number> = new EventEmitter();

  public questionIndex = 0;
  public question = {
      question: 'How long of a trip are you planning?',
      current_selection_help_text: 'nights selected',
      key: 'trip',
      slider: true,
      minLabel: '0 nights',
      maxLabel: '14 nights',
      rangeMin: 0,
      rangeMax: 14
    };

  changeView(view: number) {
    this.viewEmitter.emit(view);
  }

  next() {
    if (this.questionIndex === 6) {
      this.changeView(4);
    } else {
      this.questionIndex++;
    }
  }
}

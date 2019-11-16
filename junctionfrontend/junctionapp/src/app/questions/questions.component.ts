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
  public questions = [
    {
      question: 'How long of a trip are you planning?',
      current_selection_help_text: 'nights selected',
      key: 'trip_length',
      slider: true,
      minLabel: '0 nights',
      maxLabel: '14 nights',
      rangeMin: 0,
      rangeMax: 14
    },
    {
      question: 'Which activities interest you?',
      current_selection_help_text: '',
      key: 'activites',
      slider: false,
      tags: ['Hiking', 'Biking', 'Cross-country skiing', 'Fishing', 'Bird watching']
    },
    {
      question: 'My goal is to...',
      current_selection_help_text: false,
      key: 'trip_length',
      slider: true,
      minLabel: 'Chill',
      maxLabel: 'Excercise',
      rangeMin: 0,
      rangeMax: 2
    },
    {
      question: 'I want to',
      current_selection_help_text: false,
      key: 'trip_length',
      slider: true,
      minLabel: 'Chill',
      maxLabel: 'Excercise',
      rangeMin: 0,
      rangeMax: 2
    },
  ];
  public question = this.questions[this.questionIndex];

  changeView(view: number) {
    this.viewEmitter.emit(view);
  }

  next() {
    if (this.questionIndex === 6) {
      this.changeView(4);
    } else {
      this.questionIndex++;
      this.question = this.questions[this.questionIndex];
    }
  }
}

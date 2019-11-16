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
      min_label: '0 nights',
      max_label: '14 nights',
      range_length: 14
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
      key: 'chill_level',
      slider: true,
      minLabel: 'Chill',
      maxLabel: 'Excercise',
      range_length: 2
    },
    {
      question: 'My skill level is',
      current_selection_help_text: false,
      key: 'skill_level',
      slider: true,
      minLabel: 'All thumbs',
      maxLabel: 'Swiss knife',
      range_length: 2
    },
    {
      question: 'Which do you prefer?',
      current_selection_help_text: '',
      key: 'nature',
      slider: false,
      tags: ['Deciduous forest', 'Pine forrest', 'Spruce forrest']
    },
    {
      question: 'My travelling posse is..',
      current_selection_help_text: '',
      key: 'posse',
      slider: false,
      tags: ['Single or a pair', 'Group', 'Large group', 'With children']
    },
    {
      question: 'Please notice my special needs for',
      current_selection_help_text: '',
      key: 'accessibility',
      slider: false,
      tags: ['Accessibility', 'Medical care']
    },
    {
      question: 'I\'m travelling with',
      current_selection_help_text: '',
      key: 'vehicle',
      slider: false,
      tags: ['own car', 'public transport', 'I don\'t know']
    }
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

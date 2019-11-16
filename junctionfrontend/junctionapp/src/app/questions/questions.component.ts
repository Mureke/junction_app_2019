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
      "id": 3,
      "question": "How long of a trip are you planning?",
      "slider_value_visible": true,
      "slider": true,
      "min_label": "0 Nights",
      "max_label": "14 Nights",
      "range_length": 14,
      "tags": []
    },
    {
      "id": 2,
      "question": "My skill level is:",
      "slider_value_visible": false,
      "slider": true,
      "min_label": "All Thumbs",
      "max_label": "Swiss knife",
      "range_length": 4,
      "tags": []
    },
    {
      "id": 5,
      "question": "My goal is to..",
      "slider": true,
      "slider_value_visible": false,
      "min_label": "Chill",
      "max_label": "Excersise",
      "range_length": 2,
      "tags": []
    },
    {
      "id": 6,
      "question": "Which do you prefer?",
      "slider": false,
      "min_label": null,
      "max_label": null,
      "range_length": 0,
      "tags": [
        {
          "id": 9,
          "name": "Decidous forest",
          "icon_url": "",
          "question": 6
        },
        {
          "id": 10,
          "name": "Pine forest",
          "icon_url": "",
          "question": 6
        },
        {
          "id": 11,
          "name": "Spurce forest",
          "icon_url": "",
          "question": 6
        }
      ]
    },
    {
      "id": 7,
      "question": "My travelling posse is...",
      "slider": false,
      "min_label": null,
      "max_label": null,
      "range_length": 0,
      "tags": [
        {
          "id": 12,
          "name": "Single or a pair",
          "icon_url": "",
          "question": 7
        },
        {
          "id": 13,
          "name": "Group",
          "icon_url": "",
          "question": 7
        },
        {
          "id": 14,
          "name": "Large group",
          "icon_url": "",
          "question": 7
        },
        {
          "id": 15,
          "name": "With children",
          "icon_url": "",
          "question": 7
        }
      ]
    },
    {
      "id": 8,
      "question": "Please notice my special needs for",
      "slider": false,
      "min_label": null,
      "max_label": null,
      "range_length": 0,
      "tags": [
        {
          "id": 16,
          "name": "Accessibility",
          "icon_url": "",
          "question": 8
        },
        {
          "id": 17,
          "name": "Medical care",
          "icon_url": "",
          "question": 8
        }
      ]
    },
    {
      "id": 9,
      "question": "I'm travelling with",
      "slider": false,
      "min_label": null,
      "max_label": null,
      "range_length": 0,
      "tags": [
        {
          "id": 18,
          "name": "Own car",
          "icon_url": "",
          "question": 9
        },
        {
          "id": 19,
          "name": "Public transport",
          "icon_url": "",
          "question": 9
        }
      ]
    },
    {
      "id": 4,
      "question": "Which activities interest you?",
      "slider": false,
      "min_label": null,
      "max_label": null,
      "range_length": 0,
      "tags": [
        {
          "id": 1,
          "name": "Hiking",
          "icon_url": "",
          "question": 4
        },
        {
          "id": 2,
          "name": "Mountain Biking",
          "icon_url": "",
          "question": 4
        },
        {
          "id": 4,
          "name": "Fishing",
          "icon_url": "",
          "question": 4
        },
        {
          "id": 8,
          "name": "Bird watching",
          "icon_url": "",
          "question": 4
        },
        {
          "id": 5,
          "name": "Cross-Country skiing",
          "icon_url": "",
          "question": 4
        },
        {
          "id": 6,
          "name": "Mushroom picking",
          "icon_url": "",
          "question": 4
        },
        {
          "id": 7,
          "name": "Orienteering",
          "icon_url": "",
          "question": 4
        }
      ]
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

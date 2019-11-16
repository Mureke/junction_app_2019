import { Component, Output, EventEmitter } from '@angular/core';
import { DomSanitizer } from '@angular/platform-browser';

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
          "icon_url": `<svg width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
          <!-- Generator: Sketch 50.2 (55047) - http://www.bohemiancoding.com/sketch -->
          <title>icons/calendar</title>
          <desc>Created with Sketch.</desc>
          <defs></defs>
          <g id="icons/calendar" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
              <path d="M17.4999506,22.2857714 L21.3077379,22.2857714 L21.3077379,18.4287571 L17.4999506,18.4287571 L17.4999506,22.2857714 Z M17.4999506,17.5714429 L21.3077379,17.5714429 L21.3077379,13.2858714 L17.4999506,13.2858714 L17.4999506,17.5714429 Z M17.4999506,12.4285571 L21.3077379,12.4285571 L21.3077379,8.57154285 L17.4999506,8.57154285 L17.4999506,12.4285571 Z M17.9232136,2.14278572 C17.9232136,1.9150085 17.7248091,1.71442856 17.5001481,1.71442856 L16.6538196,1.71442856 C16.4291586,1.71442856 16.230754,1.9150085 16.230754,2.14278572 L16.230754,6 C16.230754,6.22777722 16.4291586,6.42875712 16.6538196,6.42875712 L17.5001481,6.42875712 C17.7248091,6.42875712 17.9232136,6.22777722 17.9232136,6 L17.9232136,2.14278572 Z M12.4229668,22.2857714 L16.6538196,22.2857714 L16.6538196,18.4287571 L12.4229668,18.4287571 L12.4229668,22.2857714 Z M12.4229668,17.5714429 L16.6538196,17.5714429 L16.6538196,13.2858714 L12.4229668,13.2858714 L12.4229668,17.5714429 Z M12.4229668,12.4285571 L16.6538196,12.4285571 L16.6538196,8.57154285 L12.4229668,8.57154285 L12.4229668,12.4285571 Z M7.34618042,22.2857714 L11.5770332,22.2857714 L11.5770332,18.4287571 L7.34618042,18.4287571 L7.34618042,22.2857714 Z M7.34618042,17.5714429 L11.5770332,17.5714429 L11.5770332,13.2858714 L7.34618042,13.2858714 L7.34618042,17.5714429 Z M7.34618042,12.4285571 L11.5770332,12.4285571 L11.5770332,8.57154285 L7.34618042,8.57154285 L7.34618042,12.4285571 Z M7.76924596,2.14278572 C7.76924596,1.9150085 7.57103886,1.71442856 7.34618042,1.71442856 L6.50004935,1.71442856 C6.27519091,1.71442856 6.07698382,1.9150085 6.07698382,2.14278572 L6.07698382,6 C6.07698382,6.22777722 6.27519091,6.42875712 6.50004935,6.42875712 L7.34618042,6.42875712 C7.57103886,6.42875712 7.76924596,6.22777722 7.76924596,6 L7.76924596,2.14278572 Z M2.69226213,22.2857714 L6.50004935,22.2857714 L6.50004935,18.4287571 L2.69226213,18.4287571 L2.69226213,22.2857714 Z M2.69226213,17.5714429 L6.50004935,17.5714429 L6.50004935,13.2858714 L2.69226213,13.2858714 L2.69226213,17.5714429 Z M2.69226213,12.4285571 L6.50004935,12.4285571 L6.50004935,8.57154285 L2.69226213,8.57154285 L2.69226213,12.4285571 Z M23,22.2857714 C23,23.2230777 22.2332307,24 21.3077379,24 L2.69226213,24 C1.76676926,24 1,23.2230777 1,22.2857714 L1,5.14288571 C1,4.20557944 1.76676926,3.42865713 2.69226213,3.42865713 L4.38472169,3.42865713 L4.38472169,2.14278572 C4.38472169,0.96450355 5.33647107,0 6.50004935,0 L7.34618042,0 C8.5097587,0 9.46150809,0.96450355 9.46150809,2.14278572 L9.46150809,3.42865713 L14.5384919,3.42865713 L14.5384919,2.14278572 C14.5384919,0.96450355 15.4904387,0 16.6538196,0 L17.5001481,0 C18.6635289,0 19.6154757,0.96450355 19.6154757,2.14278572 L19.6154757,3.42865713 L21.3077379,3.42865713 C22.2332307,3.42865713 23,4.20557944 23,5.14288571 L23,22.2857714 Z" id="Fill-1" fill="#393B3B"></path>
          </g>
      </svg>`,
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

  constructor(private sanitizer: DomSanitizer){
  }

  changeView(view: number) {
    this.viewEmitter.emit(view);
  }

  previous() {
    if (this.questionIndex === 0) {
      this.changeView(2);
    } else {
      this.questionIndex--;
      this.question = this.questions[this.questionIndex];
    }
  }

  next() {
    if (this.questionIndex === 6) {
      this.changeView(4);
    } else {
      this.questionIndex++;
      this.question = this.questions[this.questionIndex];
      this.question.tags.forEach(tag => {
        tag.icon_url = this.sanitizer.bypassSecurityTrustHtml(tag.icon_url);
      });
    }
  }
}

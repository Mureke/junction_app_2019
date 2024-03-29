import { Component, Output, EventEmitter, OnInit, OnDestroy } from '@angular/core';
import { DomSanitizer } from '@angular/platform-browser';
import { FetchDataService } from '../../services/fetch-data.service';
import { environment } from '../../environments/environment';

@Component({
  selector: 'app-questions',
  templateUrl: './questions.component.html',
  styleUrls: ['./questions.component.scss']
})
export class QuestionsComponent implements OnInit, OnDestroy {
  @Output()
  viewEmitter: EventEmitter<number> = new EventEmitter();

  public questionIndex = 0;
  public questions: any;
  public question: any;

  constructor(public dataService: FetchDataService, private sanitizer: DomSanitizer) {
  }

  ngOnInit(): void {
    this.getQuestions();
  }

  ngOnDestroy(): void {
  }

  async getQuestions() {
    this.questions = await this.dataService.fetchDataGet(environment.backendUrl + '/api/question/');
    this.question = this.questions[this.questionIndex];
    this.sanitizeQuestion();
  }

  changeView(view: number) {
    this.viewEmitter.emit(view);
  }

  previous() {
    if (this.questions) {
      if (this.questionIndex === 0) {
        this.changeView(2);
      } else {
        this.questionIndex--;
        this.question = this.questions[this.questionIndex];
      }
    }
  }

  next() {
    if (this.questionIndex === (this.questions.length - 1)) {
      this.changeView(4);
    } else {
      this.questionIndex++;
      this.question = this.questions[this.questionIndex];
      this.sanitizeQuestion();
    }
  }

  sanitizeQuestion() {
    this.question.tags.forEach(tag => {
      tag.icon_url = this.sanitizer.bypassSecurityTrustHtml(tag.icon_url);
    });
  }
}

import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-slider-question',
  templateUrl: './slider-question.component.html',
  styleUrls: ['./slider-question.component.scss']
})
export class SliderQuestionComponent {
  @Input()
  public question: object;

  public currentSelecion = 0;

  setSelection(value: any) {
    this.currentSelecion = value;
  }
}

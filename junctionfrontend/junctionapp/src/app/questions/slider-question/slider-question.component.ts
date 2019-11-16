import { Component, Input } from '@angular/core';
import { SelectionsService } from 'src/services/selections.service';

@Component({
  selector: 'app-slider-question',
  templateUrl: './slider-question.component.html',
  styleUrls: ['./slider-question.component.scss']
})
export class SliderQuestionComponent {
  @Input()
  public question: object;

  public currentSelecion = 0;

  constructor(private selectionsService: SelectionsService) {
  }

  setSelection(key: string, value: number) {
    this.selectionsService.setSelection(key, value);
    this.currentSelecion = value;
  }
}

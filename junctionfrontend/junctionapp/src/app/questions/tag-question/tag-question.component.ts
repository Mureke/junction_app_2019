import { Component, Input } from '@angular/core';
import { SelectionsService } from 'src/services/selections.service';

@Component({
  selector: 'app-tag-question',
  templateUrl: './tag-question.component.html',
  styleUrls: ['./tag-question.component.scss']
})
export class TagQuestionComponent {
  @Input()
  public question: object;
  constructor(private selectionService: SelectionsService) { }

  setSelection(id: number) {
    this.selectionService.setSelection('tags', id);
  }
}

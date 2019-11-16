import { Component, Input, OnInit, OnDestroy } from '@angular/core';
import { SelectionsService } from 'src/services/selections.service';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-tag-question',
  templateUrl: './tag-question.component.html',
  styleUrls: ['./tag-question.component.scss']
})
export class TagQuestionComponent implements OnInit, OnDestroy {
  @Input()
  public question: object;

  public selectionSubscription: Subscription;
  public selectedTags: number[];

  constructor(private selectionService: SelectionsService) { }

  ngOnInit() {
    this.selectionSubscription = this.selectionService.state$.subscribe((selections: Selections) => {
      console.log(selections);
      this.selectedTags = selections.tags;
    });
  }

  ngOnDestroy() {
    this.selectionSubscription.unsubscribe();
  }

  setSelection(id: number) {
    this.selectionService.setSelection('tags', id);
  }
}

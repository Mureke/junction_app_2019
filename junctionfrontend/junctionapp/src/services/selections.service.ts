import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SelectionsService {
  private selections: Selections = {
    tags: [],
    park: null,
    start_date: null,
    end_date: null,
  };
  private state = new BehaviorSubject(this.selections);
  public state$ = this.state.asObservable();

  setSelection(key: string, value: any) {
    if (key === 'tags') {
      const index = this.selections[key].indexOf(value);
      if (index === -1) {
        this.selections[key].push(value);
      } else {
        this.selections[key].splice(index, 1);
      }
    } else {
      this.selections[key] = value;
    }

    this.state.next(this.selections);
  }
}

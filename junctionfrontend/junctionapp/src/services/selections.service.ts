import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SelectionsService {
  private selections: Selections = {
    tags: [],
    park: 5,
    start_date: '2019-11-17',
    end_date: '2019-11-17',
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

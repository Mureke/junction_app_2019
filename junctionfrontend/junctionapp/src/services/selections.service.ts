import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SelectionsService {
  private selections: Selections = {
    start_date: null,
    end_date: null,
    park: 0
  };
  private state = new BehaviorSubject(this.selections);
  public state$ = this.state.asObservable();

  setSelection(key: string, value: any) {
    this.selections[key] = value;
    this.state.next(this.selections);
  }
}

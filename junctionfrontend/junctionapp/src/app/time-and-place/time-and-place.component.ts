import { Component, Output, EventEmitter } from '@angular/core';
import { SelectionsService } from 'src/services/selections.service';

@Component({
  selector: 'app-time-and-place',
  templateUrl: './time-and-place.component.html',
  styleUrls: ['./time-and-place.component.scss']
})
export class TimeAndPlaceComponent {
  @Output()
  viewEmitter: EventEmitter<number> = new EventEmitter();

  constructor(private selectionService: SelectionsService) {
  }

  public spring = false;
  public summer = false;
  public autumn = false;
  public winter = false;

  changeView(view: number) {
    this.viewEmitter.emit(view);
  }

  setSelection(key: string, selection: string | number) {
    this.selectionService.setSelection(key, selection);
  }
}

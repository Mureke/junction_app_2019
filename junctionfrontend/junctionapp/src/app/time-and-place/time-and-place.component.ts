import { Component, Output, EventEmitter, OnInit, OnDestroy } from '@angular/core';
import { SelectionsService } from 'src/services/selections.service';
import { Subscription } from 'rxjs';
import { FetchDataService } from 'src/services/fetch-data.service';

@Component({
  selector: 'app-time-and-place',
  templateUrl: './time-and-place.component.html',
  styleUrls: ['./time-and-place.component.scss']
})
export class TimeAndPlaceComponent implements OnInit, OnDestroy {
  @Output()
  viewEmitter: EventEmitter<number> = new EventEmitter();

  constructor(private selectionService: SelectionsService, private fetcData: FetchDataService) {
  }

  public spring = false;
  public summer = false;
  public autumn = false;
  public winter = true;
  public parks: any;
  public selectionsSuscription: Subscription;
  public selections: object;

  ngOnInit() {
    this.getParks();

    this.selectionsSuscription = this.selectionService.state$.subscribe((selections: Selections) => {
      this.selections = selections;
    });
  }

  ngOnDestroy() {
    this.selectionsSuscription.unsubscribe();
  }

  async getParks() {
    this.parks = await this.fetcData.fetchDataGet('http://localhost:8000/api/national-park/');
  }

  changeView(view: number) {
    if (this.spring || this.summer || this.autumn || this.winter) {
      this.viewEmitter.emit(view);
    }
  }

  setSelection(key: string, selection: string | number) {
    this.selectionService.setSelection(key, selection);

    if (key === 'start_date' || key === 'end_date') {
      const month = new Date(selection).getMonth();
      if (month < 4) {
        this.spring = true;
      } else if (month < 7) {
        this.summer = true;
      } else if (month < 10) {
        this.autumn = true;
      } else {
        this.winter = true;
      }
    }
  }
}

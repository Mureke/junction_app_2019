import {Component, Output, EventEmitter, OnInit} from '@angular/core';
import {FetchDataService} from "../../services/fetch-data.service";

@Component({
  selector: 'app-postcards',
  templateUrl: './postcards.component.html',
  styleUrls: ['./postcards.component.scss']
})
export class PostcardsComponent implements OnInit {
  @Output()
  viewEmitter: EventEmitter<number> = new EventEmitter();

  private trails: any;

  constructor(private dataService: FetchDataService) {}

  ngOnInit(): void {
    this.dataService.fetchData('http://localhost:8000/api/trails/find/5/?tags=1,3,4,5,6,7,6,7,8,11,12,12,13,41&start_date=2019-02-01')
  }

  changeView(view: number) {
    this.viewEmitter.emit(view);
  }


}

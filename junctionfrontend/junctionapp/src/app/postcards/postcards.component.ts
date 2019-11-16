import {Component, Output, EventEmitter, OnInit} from '@angular/core';
import {FetchDataService} from "../../services/fetch-data.service";
import {SelectionsService} from "../../services/selections.service";
import {environment} from "../../environments/environment";

@Component({
  selector: 'app-postcards',
  templateUrl: './postcards.component.html',
  styleUrls: ['./postcards.component.scss']
})
export class PostcardsComponent implements OnInit {
  @Output()
  viewEmitter: EventEmitter<number> = new EventEmitter();

  private trails: any;

  private selectionSubscription: any;

  constructor(private dataService: FetchDataService, private selectionService: SelectionsService) {
  }

  ngOnInit(): void {
    this.selectionSubscription = this.selectionService.state$.subscribe((selections: Selections) => {
      this.getTrails(selections);
    });
  }

  async getTrails(selections) {
    let url = environment.backendUrl + '/api/trails/find/';

    this.trails = await this.dataService.fetchDataGet('http://127.0.0.1:8000/api/trails/find/5/?tags=1,3,4,5,6,7,6,7,8,11,12,12,13,41&start_date=2019-02-01');
  }

  changeView(view: number) {
    this.viewEmitter.emit(view);
  }


}

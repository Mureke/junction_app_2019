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
    const url = environment.backendUrl + '/api/trails/find/' + selections.park + '/?tags=' + selections.tags.join(',') +  '&start_date=' + selections.start_date;
    // const url = 'http://localhost:8000/api/trails/find/5/?tags=13,14,16,18&start_date=2004-07-22'
    this.trails = await this.dataService.fetchDataGet(url);
  }

  changeView(view: number) {
    this.viewEmitter.emit(view);
  }


}

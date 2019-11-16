import { Component, Output, EventEmitter, OnInit, OnDestroy } from '@angular/core';
import { FetchDataService } from '../../services/fetch-data.service';
import { SelectionsService } from '../../services/selections.service';
import { environment } from '../../environments/environment';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-postcards',
  templateUrl: './postcards.component.html',
  styleUrls: ['./postcards.component.scss']
})
export class PostcardsComponent implements OnInit, OnDestroy {
  @Output()
  viewEmitter: EventEmitter<number> = new EventEmitter();

  private selectionSubscription: Subscription;
  public trails: any;

  constructor(private dataService: FetchDataService, private selectionService: SelectionsService) {
  }

  ngOnInit(): void {
    this.selectionSubscription = this.selectionService.state$.subscribe((selections: Selections) => {
      this.getTrails(selections);
    });
  }

  ngOnDestroy() {
    this.selectionSubscription.unsubscribe();
  }

  async getTrails(selections) {
    const url = environment.backendUrl + '/api/trails/find/' + selections.park + '/?tags=' + selections.tags.join(',') +  '&start_date=' + selections.start_date;
    this.trails = await this.dataService.fetchDataGet(url);
  }

  changeView(view: number) {
    this.viewEmitter.emit(view);
  }
}

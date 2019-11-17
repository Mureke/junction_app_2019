import { Component, Output, EventEmitter, OnInit, OnDestroy } from '@angular/core';
import { FetchDataService } from '../../services/fetch-data.service';
import { SelectionsService } from '../../services/selections.service';
import { environment } from '../../environments/environment';
import { Subscription } from 'rxjs';
import { DomSanitizer } from '@angular/platform-browser';

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
  public selectedTrail: object;
  public selections: Selections;

  constructor(private dataService: FetchDataService, private selectionService: SelectionsService, private sanitizer: DomSanitizer) {
  }

  ngOnInit(): void {
    this.selectionSubscription = this.selectionService.state$.subscribe((selections: Selections) => {
      this.getTrails(selections);
      this.selections = selections;
    });
  }

  ngOnDestroy() {
    this.selectionSubscription.unsubscribe();
  }

  async getTrails(selections) {
    const url = environment.backendUrl + '/api/trails/find/' + selections.park + '/?tags=' + selections.tags.join(',') +  '&start_date=' + selections.start_date;
    this.trails = await this.dataService.fetchDataGet(url);
    this.trails.forEach(trail => {
      trail.tags = trail.tags.map(tag => {
        tag.icon_url = this.sanitizer.bypassSecurityTrustHtml(tag.icon_url);
        return tag;
      });
    });
  }

  changeView(view: number) {
    this.viewEmitter.emit(view);
  }

  toggleTrailModal(selectedTrail = null) {
    this.selectedTrail = selectedTrail;

    if (selectedTrail) {
      document.getElementsByTagName('body')[0].style.overflow = 'hidden';
    } else {
      document.getElementsByTagName('body')[0].style.overflow = 'auto';
    }
  }
}

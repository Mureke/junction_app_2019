import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  public readonly title = 'junctionapp';
  public currentView = 0;

  handleViewChange(view: number) {
    this.currentView = view;
  }
}

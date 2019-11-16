import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-trail-modal',
  templateUrl: './trail-modal.component.html',
  styleUrls: ['./trail-modal.component.scss']
})
export class TrailModalComponent {
  @Input()
  public trail: object;

  @Input()
  public date: string;

  @Output()
  private emitClose: EventEmitter<void> = new EventEmitter();

  close() {
    this.emitClose.emit();
  }
}

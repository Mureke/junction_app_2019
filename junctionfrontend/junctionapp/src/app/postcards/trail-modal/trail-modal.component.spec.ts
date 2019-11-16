import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TrailModalComponent } from './trail-modal.component';

describe('TrailModalComponent', () => {
  let component: TrailModalComponent;
  let fixture: ComponentFixture<TrailModalComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TrailModalComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TrailModalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

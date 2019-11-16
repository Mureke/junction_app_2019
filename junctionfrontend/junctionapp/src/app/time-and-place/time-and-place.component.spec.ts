import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TimeAndPlaceComponent } from './time-and-place.component';

describe('TimeAndPlaceComponent', () => {
  let component: TimeAndPlaceComponent;
  let fixture: ComponentFixture<TimeAndPlaceComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TimeAndPlaceComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TimeAndPlaceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

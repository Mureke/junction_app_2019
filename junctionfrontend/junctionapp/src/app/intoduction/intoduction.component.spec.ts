import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { IntoductionComponent } from './intoduction.component';

describe('IntoductionComponent', () => {
  let component: IntoductionComponent;
  let fixture: ComponentFixture<IntoductionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ IntoductionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(IntoductionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
